Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 272F5BC64AD
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 20:31:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CB6810E89F;
	Wed,  8 Oct 2025 18:31:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OCWKhX5G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 920EA10E89F
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 18:31:12 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5HMK029177
 for <dri-devel@lists.freedesktop.org>; Wed, 8 Oct 2025 18:31:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 tZFnid2NNCpzG+TgYcmVtCa2XwePcFl64IYZ/RFi01M=; b=OCWKhX5Gs5zUwGPK
 kKlBqCkYabCp4qJ+2Wx74yEYslR95d+9GjpWyg/Pig/EX5I7fE0VUf0ZJZ9rIuDu
 MYlFaWKou0tAC9Sclxq1FcYIer9173au0W04HmY5jnVqZ/gslkvlYJD4I0yn+l6T
 qggL8KFRvNI5cYFCqeFBjoaEvsKYeO/c3Ymj7pl9lP9qJWZPyR0PLtLCDVYvYaft
 rByCrlWSSjJsJjfI6Z3MpU8paLoNQrZbWNj6ky2wsQ0oMgOCnS7vI5oVH5QptajW
 CD0goZFvunClHwznGHH+NMKmoYhUwds+jjFzDGDikBBQFiXPbMaXhgKoCnYwiK6q
 oc9B5A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4sg85j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 18:31:11 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-32ec69d22b2so378700a91.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 11:31:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759948270; x=1760553070;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tZFnid2NNCpzG+TgYcmVtCa2XwePcFl64IYZ/RFi01M=;
 b=oZIoBaXz4Pr6zFljdcnFzTCfc2aO85vKlAAUq9hB6r/thom6M/xKUNDqlCa5eoYvyv
 Ch9ZaPINtTFLSnfGLe4oci4yV870OHFSp/ebU25IQRmBJ5Hfp2m1wfxihkme3NDzmR9I
 azmxRo5RPQpHmYf0WBWpRk/zqTtvlfmODg0qq3WmvQSESZZWyolO7hTiFkBxxjU2yaYR
 sjO/w0ZQ2Zkk6t21zuIMjxR5P2yuUFuwl/B+Sx2jwGBcV2NPRtwvSyn8QPDOwNvXriXY
 j9MLBQ1cJ9lRUDU8RdRsd2LXlCCILAg6nEc6uEocXmJsYYyo3ovlP7tr9xY1ZeEbZppq
 t1CA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwkZSX8kMUW9YaSn2VDHzr/Ggd9adlCcsPJDn4VaAMRter9Bx/VTizaovJd9PO1GJ5B6Yo33f3jqQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDKCBxWFLPCauCc87lKqmsSWBVzOQv8l3+edUzVolZRMaj1yTF
 5QVRb57iJVLWD3IFGfmuo6bdvxpe8lJ9PZJ0p687m7ZBUEThwRx+xKHnkU9NUtrmB9v3brp+iqQ
 DeyTA34NJZx5LeM1rjidCEiV+sMecG7Dtv3lsNzP3s3o1Mg+NNq/MKpKgnStN2iQ0gABNUCE=
X-Gm-Gg: ASbGncvn9TVleLBCzw0HRd9XftEYXTM1zlfN1lKuyk7RVVEGqSmPWmQApyH+FmbQoLZ
 tUg+VwpnxxnCjXiKzqUs0zfOCtC1CJpkjxhiZSorQOt6TTKKuoxApMCMudR4Bxw9OIwuyTNXYEX
 W9JTXiVJ7Nku0EAPaB3o0pnYFb18Wmg6uGMFOOr+XL2iArPmYBJ7mR+rdlsYh8tSCVhDDDh3lvW
 5UVpjbrpIrt11I4TjxKKpd2T6V1UqFNHNSs5qmPnsxaVDiLRzN2qjSQ7N8AIWTUtCy188lC63Tv
 TO1KwKW7AyccNPW3/63TyjQhOcts1TIAUgxXXskJCFM/SVXKvLkDWvnh4NkBblq+Z9EDQwlkOwB
 aMem7QoLPNS9+iihSA8M=
X-Received: by 2002:a17:90b:1e07:b0:339:f09b:d372 with SMTP id
 98e67ed59e1d1-33b513b4c91mr6216076a91.23.1759948270256; 
 Wed, 08 Oct 2025 11:31:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAtXHorjUAFWBrcoGrQwXv8AqMgJyr95gtEozvXIgm/hpMgEEegnykZ2c+L+5g4zxn2u4SrQ==
X-Received: by 2002:a17:90b:1e07:b0:339:f09b:d372 with SMTP id
 98e67ed59e1d1-33b513b4c91mr6216013a91.23.1759948269735; 
 Wed, 08 Oct 2025 11:31:09 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33b52968581sm1407281a91.4.2025.10.08.11.31.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Oct 2025 11:31:09 -0700 (PDT)
Message-ID: <a50612e7-c2c9-4b5a-b646-4bcf32a67aac@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 12:31:07 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Support the new READ_DATA implementation
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Carl Vanderlip <quic_carlv@quicinc.com>
References: <20251007224045.605374-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251007224045.605374-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7YZazfhcsOR_-2mToA4dmJQw01S9EGHh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX3qzMsg6uWSzH
 9h1RYSUs+xjKGZzlzwfVZgmAc/CDMpx4Ja9vZzrOQQnTsfx2rwk4daWD+njrhQANmc0I/8rXo4+
 GgWvUfYFUAGYlvdmClRWWs3iTyRmEX1s2Kvy3szdRBbKO7UlvVKCJ6S/VVULvTKrydarFMeddSV
 DnTPRmZ+wRLoH45Yzbrx5fMe9ZqSYywofNkA0+K/QKeOg3fExGP5g/cCmzSA7rZ3a3Q/4F5z0sC
 jtnv1y8BdHD5J3qnliQFcxTv4DOwwMaoRM7BA6C/9LMZWT0YYnKGJvgRGK5+F+FGLASRZaZtNEy
 4e29WQODF7+xwGMkIq3JWOW8crEs50AsQHEY625J9lhT3xH8C3zIIXiFANBHZBduHUpKy8FuA76
 tLj0UPRRK8g+ROQMBhCLhY8obzYcvQ==
X-Authority-Analysis: v=2.4 cv=SfL6t/Ru c=1 sm=1 tr=0 ts=68e6adef cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=hMcU9Fbdl6L4-kwaL4sA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 7YZazfhcsOR_-2mToA4dmJQw01S9EGHh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/7/2025 4:40 PM, Youssef Samir wrote:
> From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
> 
> AIC200 uses the newer "XBL" firmware implementation which changes the
> expectations of how READ_DATA is performed. Larger data requests are
> supported via streaming the data over the transport instead of requiring
> a single transport transfer for everything.
> 
> Co-developed-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Signed-off-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Signed-off-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
