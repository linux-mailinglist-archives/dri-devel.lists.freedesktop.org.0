Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D433DBDA9FF
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 18:35:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B110510E660;
	Tue, 14 Oct 2025 16:35:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="e2YPznHm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CA2410E65E
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 16:35:05 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EFS19H018106
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 16:35:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 snYkfWqfbWC5mdg1cRDeyos/lJ07Ei5Te1azJy/eYc4=; b=e2YPznHmUEXe+1qv
 hw9RRgrE5C6wGvmchfJi+gKWaJolBVB4TMdyserb0s7ZfeMzmNJpGJpkDc3HYHHY
 VkM4zXhzc76yHpb2CF6U6wZlffSYAtALT+SEjQTX0RzuJ5TZ+AJKoTpBjp3r47a6
 ykzg6fzrkxWlE2pVkSstFwVQ1+KAW7rhHgx8sD5l7IzLivRtTtirw/knlnn5eFyB
 Hsw3Jo067KQxi2O2inaDSCpnRkv6GIqof7Ow56NudKWKIPB6fmzDXd09LFFC3vIU
 IuDfALyvC26ne1qD0GC9qIGQ4VxoUHbJ0RH2TvLR2VIglZ6kiXklM6B4dBlaLwMG
 CWjHOw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfes19my-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 16:35:04 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-330a4d5c4efso9347118a91.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 09:35:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760459703; x=1761064503;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=snYkfWqfbWC5mdg1cRDeyos/lJ07Ei5Te1azJy/eYc4=;
 b=UbqlgbtoEHHYXCssr/xqLCAm8sp3/OixDEG14wAnpGmXF07PW95fVFHPrzHAfnPVgO
 507uamGcp+89M8B07tZ1QNuONaEzutvWnX4LfUJtuDvSpIQ/g+az2jxWLOexQ6GYBgED
 jqd9R3KscVnmW5LqnMizd1XF5Q7ZT+/+ifFdI028O5e/81g25abpsUFWj6lTd8itZ75u
 4+1yUol2aWGamE/qATuzIFwTvlw8OcK1O3Q6y1YtrQdijxQsofSCz09kIj9zt3Pymk9z
 W0XfQhSMFRdoJN41yVBZbK6Pe2X8JLAAU7lYrAkGzknh4/XfhumhpyIW8q/t15d4RxGz
 Js/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsyumeHMkAXbeIIOxLua9waUtvjEk0fDrOR+EDZUL1cp79U+HElE7STpzzuVZxEq5KsMl6huMQzD4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSsHGtjxq2tjYHoZlytGP+3eSI/9hrWiymhJYehMIUdb1vjTuc
 7rSVULHxr7nApln7qDBwfAUkQAqHFpWsJ1pG7NSTRpumVKOu20MMwRjuaYqVcF4DQx0DLKagT98
 2DqT/FUCSR+ujX3SCF5QCIX8Bys7HCyv9+KdSIr131blacWu75/khTOENfj6XAGlZxkQVV24=
X-Gm-Gg: ASbGncuDJuwxd+VDhAKSueR10MTX3u1+imUuWqJhPtabSYQiJFqK4P5rl6oTerorG/L
 jgrgrHi6U/fW4PGHTrCgglwLhpDKFkPj7Fi8z4gytOQXPBcySGnIdWr6h+g9U3vDVQq3WZu8MYa
 61b/TD0idXDGrdcD9qJbTmhkAk+i7sG0kAMhz0Dxo9QvAucm/QztEnKjZ3/yAElz2XZrBtWLrOe
 834D6x5KhRCnXFgo/wqJuMTNMNp4xyDXXwRe2wV7FvYDrrd3kKaD98rtWCqKK/zUE7VbMF1Q5oa
 ja1QLfdN/1x0ToKK9KR7NINL0qdVx3083s2Fv06vURg4m06G66wSy3i2L4G2XSBLYf3oJ3bCjrK
 U/on5lcHDRYqIRA==
X-Received: by 2002:a17:90b:1e06:b0:32e:936f:ad7 with SMTP id
 98e67ed59e1d1-33b513a1e9fmr35677885a91.27.1760459703294; 
 Tue, 14 Oct 2025 09:35:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1IKYgXAviHSRtI5+avVntlXW719Omnbzy36XJd129skhFxQ6xsLsOPzgf/9YPV2w3jXFY6g==
X-Received: by 2002:a17:90b:1e06:b0:32e:936f:ad7 with SMTP id
 98e67ed59e1d1-33b513a1e9fmr35677862a91.27.1760459702839; 
 Tue, 14 Oct 2025 09:35:02 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b67de1d6227sm2429381a12.46.2025.10.14.09.35.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Oct 2025 09:35:02 -0700 (PDT)
Message-ID: <85ecbf95-17f7-4b04-842a-ce7a20877152@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 10:35:01 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Ensure entry belongs to DBC in
 qaic_perf_stats_bo_ioctl()
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251007221212.559474-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251007221212.559474-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=R64O2NRX c=1 sm=1 tr=0 ts=68ee7bb8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=ZyNJWp81KiKnRxZMCyUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: dTop_7kVyH5R6-jKaU3DkuDDPRbs6WiP
X-Proofpoint-ORIG-GUID: dTop_7kVyH5R6-jKaU3DkuDDPRbs6WiP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX9Qs8MA8uEZil
 ZGo5H/w3vaJ/tdW4lpkh3CxNLAzzaDAQgRNXr/wN4el+R3iVDE/ot7+Fi4k9jsqHtWZb7E5n34N
 kX9n+Q9zSa8jaEYn44vtspM9RqnnX49vAas7ls6Lfai7gcYx90dKXRPVt23cKLiLjejjet8fRQR
 s3x9yznxThCXyku+OMT42rCsPaoCREWdkE7B0KFBfk8xJaTyH2Ll3W1rLZwcFvehqOmTKQuva1Q
 htxV8YoSKl7irOnF+ZbE7DMTpFXdB+5SYiHPi/H3fm+KScn7fzUYBl2RG9wq4hTiMR+iP6wN+Gr
 sRJ7FY14Pwts3bMiXYFQUAIw4+4+A6h5B/4JiNm72dafjkBDN6m/TW3hmWyOBH729XfGs2wSXfH
 wZ838lwW5ImXaWDbR4P97aSEXOh9dQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018
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

On 10/7/2025 4:12 PM, Youssef Samir wrote:
> From: Youssef Samir <quic_yabdulra@quicinc.com>
> 
> struct qaic_perf_stats is defined to have a DBC specified in the header,
> followed by struct qaic_perf_stats_entry instances, each pointing to a BO
> that is associated with the DBC. Currently, qaic_perf_stats_bo_ioctl() does
> not check if the entries belong to the DBC specified in the header.
> Therefore, add checks to ensure that each entry in the request is sliced
> and belongs to hdr.dbc_id.
> 
> Co-developed-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
> Signed-off-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Pushed to drm-misc-next.

-Jeff
