Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F59BDA387
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 17:06:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA52F10E638;
	Tue, 14 Oct 2025 15:06:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gAIqTX4a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E59F10E638
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 15:06:26 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87TI9016917
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 15:06:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 yqTpYhfGVvPz23XPvHbBayg5ma4UIcz/b/SwtDOy9b8=; b=gAIqTX4a+rjcVNW5
 ZAEa+YqJyLxStAgdreZds+CFETyK55mAqdktQGAFcRik1rbuDXJeJr/MmTQO7xW2
 k+LFoD47juOLh7RB0qIW0tO0jphVq0ZBJyz9LUeJ417mT/7lTpZFRPbayGIFnRQk
 h9phurJsIp7L8y7qGQmcThLk1TsydJlQZ40MplOIEXLIhhT3mLZQAuxnIcK9+nc4
 bhF5pUlr25hBmXnBheGA4vyUmPgzC9KecG/HS/uQWfdAVN5GRDDZW5FBzWP9IVmj
 HqTl3atVrZgz+kRaeT7cbNCHeTWkGnGGD9TbPBKLkJ7Pmf8Rkw3F9KTgw8LICIbD
 WoUfuA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfd911dj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 15:06:25 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-7fa235e330dso265324566d6.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 08:06:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760454384; x=1761059184;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yqTpYhfGVvPz23XPvHbBayg5ma4UIcz/b/SwtDOy9b8=;
 b=PJcbEknan1UqKmkRcofXX/uxV57ovHzlztYBw55OOOXOAh+3f6eFg8W3nxR7qYcLNm
 0Htnm4gdjAa7Oc0Et7txcUotGKDlYQXYLVT1paF7fvimKMDlxWQVx1YDinmSnK/mrv6t
 OiF+wPrBDT8/Umlg6BXBZcsIasiZOmxTEYcLQoPAa4IGQE65p3mayImowHj864Bu4J+0
 t+x10q3vmsgStzjfpXJ+QZ1phKSp/WqBTLNSnBkaJ845WmOdf1AuTKWBhXdKg2MjF7/W
 XG+YMYIBzbe0swtMq10ok8Hli9ux3j4GznO8CLbQLjrlyvsAQOnb/nEFFrtqJCwM4niK
 o9vQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRFPCca7v2a7FUT48DMg/FqH9fe0OyN+NvTMvSjbUWIvIQbRRxKwbKVzyTQZP4qLAHXypNuV6oJ78=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRjxYWKe4qe/TtmwsfuF/Y4BL/z8zs65hwt8q3gRgpaaCAOAIf
 U1I8A6JyGC5FOI+rDzRu6FSTU1wUPaShEtE8y9XzsoEByTPb3vA9wc1r72DDAn+kquFCpzfmHB/
 lp16cO01c+KN7auhgEZ3v8mBr/ZtJL5CF2Bdj64fWblEkr++siqP+DIocsaRFoPrFVzFa/ALPb/
 b+Qbo=
X-Gm-Gg: ASbGncsRtabK1qyGEkFMbxQfZj6fF8qWyeKBtc0EZepv1rCwpyaP+Ydsa9LAXEUmEAX
 awjyPCxC+JSbZb7XvfkgUTmiui8QkYwuCOzvAHErmLL8KYfLq3FtttZbf3J4CXoyA+msWEY7kjn
 wE1F8NDqCeVJOPnIr5BTSVjEXR2b5yNGday/YbTBnEfSTLmbbpH+9gLBHkqAD9fGdV1e2cJFVzr
 xSCetiWeQLbzNRRUpjABIDV4ResnpOrdj9BToVI0MkixUh1manOyItj5Vs4W7TRaBqARYdJk22N
 efPQZ+C3g9LaPCFfe5OmM1437BBYdT9oiJnMUWsuYJpvfgYkyUAY/mnGZ0RxvISq8NQXBsVwSYd
 mA57WECR2ANiHwg==
X-Received: by 2002:a05:6214:2b0f:b0:7a5:cd51:e7d9 with SMTP id
 6a1803df08f44-87a051f9147mr362686406d6.7.1760454384085; 
 Tue, 14 Oct 2025 08:06:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+lLsyFWuhRG3zPzhlfVw66+28BvmcDUrGr/KCwVz6Qz/aPELfhXLgA4CxUcaThNlgD5ty0Q==
X-Received: by 2002:a17:90b:5824:b0:32d:fd14:600b with SMTP id
 98e67ed59e1d1-339eda5e097mr42605101a91.7.1760453888330; 
 Tue, 14 Oct 2025 07:58:08 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33b61acc413sm16364892a91.20.2025.10.14.07.58.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Oct 2025 07:58:07 -0700 (PDT)
Message-ID: <86179c55-c9c6-4921-9011-9cdbad3b7f71@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 08:58:06 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Synchronize access to DBC request queue head
 & tail pointer
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, quic_pkanojiy@quicinc.com
References: <20251007061837.206132-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251007061837.206132-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9mAXBeWlAZ7Rjs3wRRcCHTNPMRqkdUXt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXyP74Qhb+53kC
 gnkh1r5dOdC78xo9v8KdLqtcNodHTmKJ4NoxfSiodTTTvGgxRfLQ/JX8g7acisZIi9J6+95TSyy
 dkFoZ+4bJaHbsTi4M+aJ4JpmIBLgEvIqTQo1MnS+z/lcD5Yzg7ilfBTkMvHTgZjytxP/9UI6bFJ
 3F3VG23ey0fwMMIS7j3JgEDeiOZMIF8s18totyLxANUesq9MSvQzv2/xtxHNUROclGw8LgVPsxr
 cif6tI0p6n4yCsrLiGm0M5oCq2RZksYKfb/MG2YKpN7RMQpjveQ/zo2ksKwG5Cxcm0Hx0eUrulN
 SIA3d/8PHHOX3phDvNrxIZcaAH62bgchNdvxi7P4rK5REKlJv204p83Ob2OPEKjPTVupq47Xwrw
 frEs35C+sHD7sBm4wuFXaGwHj8CJOw==
X-Proofpoint-GUID: 9mAXBeWlAZ7Rjs3wRRcCHTNPMRqkdUXt
X-Authority-Analysis: v=2.4 cv=PdTyRyhd c=1 sm=1 tr=0 ts=68ee66f1 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=Oh1Qi44SMlBjVNmzfBIA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
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

On 10/7/2025 12:18 AM, Youssef Samir wrote:
> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> 
> Two threads of the same process can potential read and write parallelly to
> head and tail pointers of the same DBC request queue. This could lead to a
> race condition and corrupt the DBC request queue.
> 
> Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Applied to drm-misc-fixes.

-Jeff
