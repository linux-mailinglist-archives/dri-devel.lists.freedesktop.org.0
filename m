Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB7DBC1E17
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 17:15:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CC1110E6D9;
	Tue,  7 Oct 2025 15:15:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WyEcLNTH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A62F310E6E7
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 15:15:15 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ETEhS006859
 for <dri-devel@lists.freedesktop.org>; Tue, 7 Oct 2025 15:15:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lAIkMXz0tNDmoCBjrAhuARcVZ/kd32yHfQHf7dX+8Ds=; b=WyEcLNTHzQtrCrNR
 /jyTwA8X9V8UplZbMwz4+1fJj5MPQwfpXW2EWyQn45SdQ/gddaqDGhXKd9MT974b
 3KT23ZHnpHTlsGM2nMG8xJgQjBtGukVInzwx3NOl/Gi5NhBfy/zsEw7IgirU2Cbc
 7pyI6WZVvN1F+P5L0+w6Xs5LkVgzKhRF8TzRubeXV0yg1DnjWRW3QTbG/teXqgwV
 InDzbISrIYHFLUwP/g5vIYb0I7JLosXKH9lFfmgxawRT7vxOTmnSdAJaVpTcjbVK
 ZuvjGtrErTQLTEz5YOyyREmBoVPqKJIU9jQgpDEJ5dBiunB3UeXZLXvOlsJCjF+/
 EEaHbQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jut1qkf4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 15:15:15 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-26e4fcc744dso38757585ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 08:15:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759850107; x=1760454907;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lAIkMXz0tNDmoCBjrAhuARcVZ/kd32yHfQHf7dX+8Ds=;
 b=b2M9aW7enl9k/sVC/A0y5ww04vR71WKGEMCMiJK1AXQI5OEZsstGqkGBANNMYYGEG0
 xyTjbaChop1C9h6e4WWMYGt4Q/TNjZEMcj0igs1J5MGPdC0MtgXPvGusVU46iBi9r0Am
 03+O9SR4VcmaxcEzn6w+7Pv9L0v7nn5KF2jsls2l77ZYYidjl8c+S6zCZqyQylfdfwFY
 3LMh4/bllJKzfrc3XPa0GQVUu3dM2DSHSCPTXAji2MdSYqyTn5MZuWTvDT4AiCjDx+0l
 bk8mKhp1vqOH/gPhr2Nt8DYYv8wqu6Fg6lkA10bZoLpM0/PEDskSzEuhHOA1zrMIOmpT
 tblg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSx9Ru1Et/Mqy4aVEb+/rMRdRxk0vRaR7BJxLm/ZgHB6IyqOK7/5lcKrC5dKNBx3c5HAWv5nHD2lA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYqHPBo+z0BjPDU/n/dDO+lolqized2OpEj9N4uO/SqvaBnK3Y
 qGpa466D7huySsKArqeO6vCz353umcALjPDucZN3H0cBpKfX9klyHvSp3JMmPi3cmgowGPgIQG2
 kdAyziftQJIVSlGrL4vUMRWYhLqowJFZVxbY34Uva2URoYl6D2hpB/Kjh4Aulh9n+Z2e3TFg=
X-Gm-Gg: ASbGncvnZVw8Ug+qy1h3Ca5ouYc+bwQy1x5O+VPrpixmkG8omqeSejBEwrpSPKWcWBs
 Qx0AbMTvxsOIqQjOyQ+Zr5guV0Y9s+j6tjHi7FEUC+t0I/6vr/3IR9EC9xvQxVPp4i7xXx1XxlH
 xljFWIFGMPtbuu6DNn+6CpHhBMxnqac/RH7re5MGNfsnDKlpOrV+2BAVNLLARBg0elGBCXb96Bb
 VK4w+EYjb7b30RDVkUPLvs+DZIeOY9xOc4firhOYGlXTDT0BVD5hXxcEzLIRID5Zt92KaGupXSr
 4ganK7ke4y5F7tPE1+E8j1mfwzsWRJyljiah8LqKf2jo+xNxuN96a7B91Fh2kga6zKpGqk7LyxB
 nl1ZjTyf0AV/B1gUaG7o=
X-Received: by 2002:a17:903:2a87:b0:24a:d213:9e74 with SMTP id
 d9443c01a7336-290272dfbb7mr1731755ad.49.1759850107033; 
 Tue, 07 Oct 2025 08:15:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPqAih4wb7aA5h14uRu3iHi2SVpItnu6Q4K6o3HMbJEvzoe0GtD2go7KnfCkfhD2VmLGPqlA==
X-Received: by 2002:a17:903:2a87:b0:24a:d213:9e74 with SMTP id
 d9443c01a7336-290272dfbb7mr1731175ad.49.1759850106541; 
 Tue, 07 Oct 2025 08:15:06 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-28eb1520260sm89939275ad.19.2025.10.07.08.15.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Oct 2025 08:15:06 -0700 (PDT)
Message-ID: <0c6554b4-ab77-4e6d-b690-7cbbed982e85@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 09:15:04 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Use kvcalloc() for slice requests allocation
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20251007121845.337382-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251007121845.337382-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _a8chJ8dy6dKQyHDeWFg7xmmezLpSFYc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyNyBTYWx0ZWRfX9Qs77T4aBZ7h
 ac1nc18+xXsVgFDvj1Vg3g/xCBUFZYiuY0+Is1qLdM4gIY12ZrCgpkU+OaEet2BhL9oBuZEfVyN
 zrFer/igqmeU1DoaUmrR/XAJowxbW6wfDINs2KM6vAnivFw5EPAaB8OH7tVGUwhdWYqDw+7EaXV
 xx1N53s4PZxtpWBBtk9fiDFIV6SyUbUSXunhngJo26/14xvNatnyQcHBy5JNd7FQ4pN5Gk62wK+
 JiMUx40KAHjQpPEJZahenm6EcP6S1SQAFaFQGB4afV7HtMur2HcCPLu4pxk0b6aKvjkxU3evp4q
 yyNqSbINTCJlWn1Aw2ymbPeq/N23usZ33jHgUoPApW6VY/joR48k/mJlWKXiGokheOe9wDPIYUD
 d63K+V0gkAEfUniBFh7cL6ud+9SDFQ==
X-Authority-Analysis: v=2.4 cv=Vqcuwu2n c=1 sm=1 tr=0 ts=68e52e83 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=57TA5eHKvZbov0TpALUA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: _a8chJ8dy6dKQyHDeWFg7xmmezLpSFYc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040027
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

On 10/7/2025 6:18 AM, Youssef Samir wrote:
> From: Youssef Samir <quic_yabdulra@quicinc.com>
> 
> When a BO is created, qaic will use the page allocator to request the
> memory chunks that the BO will be composed of in-memory. The number of
> chunks increases when memory is segmented. For example, a 16MB BO can
> be composed of four 4MB chunks or 4096 4KB chunks.
> 
> A BO is then sliced into a single or multiple slices to be transferred
> to the device on the DBC's xfer queue. For that to happen, the slice
> needs to encode its memory chunks into DBC requests and keep track of
> them in an array, which is allocated using kcalloc(). Knowing that the
> BO might be very fragmented, this array can grow so large that the
> allocation may fail to find contiguous memory for it.
> 
> Replace kcalloc() with kvcalloc() to allocate the DBC requests array
> for a slice.
> 
> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
