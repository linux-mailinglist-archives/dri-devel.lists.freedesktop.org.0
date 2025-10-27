Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F09EC0FDAE
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 19:09:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C402210E541;
	Mon, 27 Oct 2025 18:09:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nxUqA8bM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8239810E541
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 18:09:36 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59RG2w3h3206704
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 18:09:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nER5Vf2N6nzZ19kKqRvG3GDVZFLsgbu45RxSnf2oF+Q=; b=nxUqA8bM6E4wScYk
 uUrJEcdPhSmePzZ6i+OFETjex7hfhy0gv1Pv4HOtHJuYMmcUzrtex2nbAfc2lzWk
 GP9irNBn10AE7HNaRavVxrgQ36VslLiadJ9ZCceKX5KI1273J2duDQdLvOWdSsFK
 Z892xm7/QIFf7q6vEeN3jYree4d8Qu1TpEK0cGFGZ4Xd4YAaupAeo5xWLXRg0YJg
 IHdLt8gXqYcC+ikgjXt8Ljzng1IQDKb3tp3eh79KclTeT2jrtTF7+9TEQGSdq3k2
 Q/N31zvqWSzKtYB6OR7Dc/iAxLxVLb0kd/kRGIeNMMZFXlR5RhuvyogYWywsHTUY
 sw94iw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2bwtgcc5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 18:09:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-290c07feb72so39738625ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 11:09:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761588575; x=1762193375;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nER5Vf2N6nzZ19kKqRvG3GDVZFLsgbu45RxSnf2oF+Q=;
 b=Yx++qNKNCveI5V8qRxJkHthEpmO93KP5JzZaEA9+Jk+2dm3BUqcJEnr9HtnRdnpMec
 1py9PrEooDCBh9uAXmdFJ5BtgueQcITf74+q8jVNyR9+RxcGnnp29OyApOeZwHkOc/ia
 2awZq3v6Yq6SgrrLsCFAa6vQZiPTZJ7fix92CQbLjU3yOqlY+KlDjI4i/FK9rVytFud8
 uPZh57k1rGBI4frz0s9c/7ZtiWDvS/Ub0SxVqP2gX6USnSsXAIs1cNDGEME2cmQecGpG
 lUpiQ6t2ZAlwXI3IEWEU9gg53XiygBkYKus3UYLyQXJO92GNlGSuy0SbK3dOnv1FskD5
 0RCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7kJX+8KKOz71Hd5zrvBkZ5KEmLeK9vJNRM+9gJpmIGKuS36OecnkZLAw0k8W8tgZnc4dYx10TN1w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxEtgUnoD6PcTUVYJMn+q+tZRTOxsmHz9v63c0AonYB78ANdMzQ
 7x0YUom/EbfxBpREMxR1BpGjZ3FLZQ9kaPVDofI25aZ4Hk/QXbPEOuVTECiUXfxD5BY9TKraK5P
 JJUsYApFfUmRbBi3nbV+W5POSPjmRDNjVipcUgXWlHoWbn0Htwt8BorC3/6Z6rKnmyMlNKDM=
X-Gm-Gg: ASbGncsikwOgKO0GojRw6LNIj05rrkeDAn/HdW7S9pdWaSLEMAsLlKzApgg2UKQig+O
 65SKdCf1E6LfmXfSf2HwbGPcKv2wJLHoatM5Oo23x7R/OlBefJTVvSbTtlR6Uz9Dv/J7p5TP2bj
 I1265croE1EsFxAIuBJxFFbtDhlSiGo9Uy3zAPQS9nwjq8l1cKEZArqy35TgijQdzO23o/l/i8n
 w3lYiKZ0RCmZBSgN/iT1QYetOO2Q6USP08RcOsgnYSdIZ5h8YRbeiI/ZYTrc/TbQ0aiqkyzxXM2
 J1yVrj8e3GWPILY7k218mgjpZ56mFmf9JSfWer6lH+sgBFCoruVdntptcwAPOs7iPWmdDyFNHcP
 RR7vQYHjVFUkIfA1GL9DsiMRfHIQbsY2NfHth+rTBYbd3w2Whwi5f
X-Received: by 2002:a17:902:e545:b0:290:7e29:f59f with SMTP id
 d9443c01a7336-294cb3c649cmr9399185ad.27.1761588574660; 
 Mon, 27 Oct 2025 11:09:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE82MYBfO55vca4l+rbNsvxfkVy8h4wEuMXDl8VHNIaPRKmfUeCf7yfL2DCaJZaMig7Ct8ULw==
X-Received: by 2002:a17:902:e545:b0:290:7e29:f59f with SMTP id
 d9443c01a7336-294cb3c649cmr9398905ad.27.1761588574234; 
 Mon, 27 Oct 2025 11:09:34 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29498d097fasm88793685ad.29.2025.10.27.11.09.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 11:09:33 -0700 (PDT)
Message-ID: <4500ae03-c95f-4004-874c-66a6373a6a6c@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 12:09:32 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: rename constant for clarity
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251022141606.3740470-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251022141606.3740470-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=L40QguT8 c=1 sm=1 tr=0 ts=68ffb55f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=f2z2pkWm2ht2ZSlzglkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: NWwulgxbBgrC728LvHJxz5cDXuxYNXo7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDE2OCBTYWx0ZWRfX5NS/bHnhW9mu
 DBNUR/o0zily1aYtSVMMUGG9blHOd6gok4m5ocx4p2fBwg9fM54mqfWdLVKgGxlfkRZi0JnVTP9
 yTCt+rzwwx7H08Z4mR6h+kJWGjAXuuRi2eqZM6QrL3kHpOFtObgqR3fs2WeeGpQOaDnPSUc4tYU
 NO+LehL0NpIJFYvQcBvi0DNOwYGst0kIEJ3QmZo3l6b7BEPFUwGrztQMjflpu5QglRrVSPHxXed
 VZmleT1iWb/CCTFKaNqFnpLfOl+ZsTIG2YF9LEAhjoIdNNVehLmRFvliJpfi/ZGBpt1J+qmiOfG
 OqdTT7j/Gt6TT0UIdwh5bURhEYeSVxrgZjLdHLckiEPfIe2zbz/fkJ6nvzRvv6CQcA2V3wrcY5P
 vhMHGUS8kXJNeeesI5v2DfWiev2EHQ==
X-Proofpoint-ORIG-GUID: NWwulgxbBgrC728LvHJxz5cDXuxYNXo7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270168
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

On 10/22/2025 8:16 AM, Youssef Samir wrote:
> From: Troy Hanson <thanson@qti.qualcomm.com>
> 
> QAIC_MANAGE_EXT_MSG_LENGTH is ambiguous and has been confused with
> QAIC_MANAGE_MAX_MSG_LENGTH. Rename it to clarify it's a wire length.
> 
> Signed-off-by: Troy Hanson <thanson@qti.qualcomm.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
