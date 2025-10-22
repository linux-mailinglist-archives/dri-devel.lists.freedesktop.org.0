Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D72BFD308
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 18:28:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9018010E0AC;
	Wed, 22 Oct 2025 16:28:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="N8X+xgSg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F5F010E0AC
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 16:28:09 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M9GCXX005518
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 16:28:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hPWRZgsQCGIi/ZyFzVsRxR5WGv5cAzvzCcNnPr9T3GU=; b=N8X+xgSgRykoWsU/
 uq8Z+9wmOUBuwlSxyd94FUWgMmKb/YGCedJvHFjDWpSaXkYa1e611dynipQB5YUd
 GY/KV5EhmMHjdtJrBvXUPDrUvVY+a8k7XN41sRujN+XBFgx+ycl8lRQW4Mvqxt7U
 yahlD8XouBL40tc0E1ubgPC8Va+gnJA6BB2SEN4hW4M7OmNjxjwbDr/bR82krGgM
 wHFm2UnNsFoxnjB0ypkJeE7mvEvWTXuHJLCOEbrW2aEm4CJu1CIHm9LqRfh+D/WT
 z1cQZOxYD1jMiwActPkpRL8TyhhCW3KkCl58gkz270mLFGqf7+u6wJk3nkbTVTPH
 rDJwFA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v469nb2g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 16:28:09 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b67c546a6e3so15444323a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 09:28:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761150488; x=1761755288;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hPWRZgsQCGIi/ZyFzVsRxR5WGv5cAzvzCcNnPr9T3GU=;
 b=meuO2ZBS3l/G6HmhEBcP5oDlsT/VihPZcgh1YZvJRZ7PwNBA1JIk50DveGChirGudK
 35bIo8LfYyTChngF0iuxdc7Lv/8Q5BgT30ajSAoLWdvR8fzaxJso35kA4KllgYyzuJ8Z
 bZI0aKgOH4/myFDB0qOQxxQ4zilHzWDDePF0Hggw8RQVCJSPkrokbaAs/rLgpuDuzHey
 Ja+u8p4gNjkxABTuZsoIRwpfrOi38zwDQqNkkXC3fKYJQtmaZSGLrCZLZBBMFJ9dSaAD
 ARoeNRunauo9la51JoUZgU7y0iqylPYX3LvEEj5jSCMb1O06x+xs7QoFaKcUob1KrLCs
 aXKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgXGCZQtCdUjKGSvR+5mQYcQSBWDsDuzG6vl2GHMn/0MWNLy9PhSCc06lCvZdU/l7KsRHq+ep2d58=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXNhJDYcWN82AqQBeHsKwuYqhwAHv72aW5B2dw+3uVACE/ClBz
 gCXRWkeA4m75w0c1cDpVbNoNqCmNVZ7XycOvKSUYz71kl+uSq0zwUissC7v6qf84jHDk4WH8uYj
 VcBVWcmOzQDjfO85MRVgxRkMQNYrRlZknEQGYtAhB0ECIG3JiK2I196YlYdqBxjaZAQwxPq4=
X-Gm-Gg: ASbGncsVrRo3I01X9Y4dquE/TnHye8eml9DHL8M8/AYMAfjHi5m0hjufCraOu745A8g
 hR336WhyqhWBQT7rLKrPclAYBQve1U8OoBrd9HLEIVeEwfs1DYhJvyxs5ZUHhTPxpawrFpXBGoX
 q9c+T6F6cCTUSUQBnEIdlYF9F59hfle3gtQ2xP4N3wLOyDLrt0CBQ6nZxNXPm5VGXw5BlRHiem1
 ljXEjz9z3o0qOCKQEiwadyqGIGK8p4r8mjwaoWFtVEInRUvRVUgxdwCJcw4wP75gJnigWWLEJBF
 fU/i8ehQk92dyvXe0HncbM8DhyDuFA6QFrfJqbpz0DLNSW51QAem39EGpsMAlMbfsPCJrUmEGwH
 CgukpXWPMJ3xIuNRgJ1dVS/NvzB0HaEh3K6e5nOobpjiQ7PZNkuCS
X-Received: by 2002:a17:90b:3848:b0:32e:e18a:368c with SMTP id
 98e67ed59e1d1-33bcf84e18emr28608314a91.7.1761150488044; 
 Wed, 22 Oct 2025 09:28:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQ9pZV+drnSPSOTW4FSOUHLGTx6mQsPIYki/6EQ52FOOurt3jDk95FYht3zLzrueSRAuQ/mA==
X-Received: by 2002:a17:90b:3848:b0:32e:e18a:368c with SMTP id
 98e67ed59e1d1-33bcf84e18emr28608283a91.7.1761150487643; 
 Wed, 22 Oct 2025 09:28:07 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33e222d8652sm2999932a91.0.2025.10.22.09.28.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 09:28:07 -0700 (PDT)
Message-ID: <0514142e-b3a7-4d44-8ef3-31b3ce1ebc4a@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 10:28:05 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Support the new READ_DATA implementation
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Carl Vanderlip <quic_carlv@quicinc.com>
References: <20251007224045.605374-1-youssef.abdulrahman@oss.qualcomm.com>
 <77abcd1d-ce69-42c8-9608-4a9557613d21@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <77abcd1d-ce69-42c8-9608-4a9557613d21@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3O8FtPu7zsQw0helB6w3EhIHnpuJR2wE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMiBTYWx0ZWRfX56/nu8fU1LGb
 8PbGG8/JJwHhois2wVXR0xAwuwSF95F4z+O5YDlG69zwq2P7eS30ywcnDAywzffVzqTAbF09q8P
 vlfsm1zNuOMoGJou3QwqgwCuLB14raqqe3iOdgJxAfFY+6SNfZH9Y7+NsOE8pQZXhLbFwhbmdbq
 sLmJkX327CxcXh1YnXW7UOydUa5lFLArsL+97T3X/98WHr8LblYMM1PIiL+BgFYCzOgePU/QyCk
 APUpEVPSz1uHEBHBioRVQAJKLlUFPEg7GSfNpt7RFYhKAxkTUVKnA3uW8YrRC54+HOddGSrl6PF
 vGTXpKdQuxOVy9GwcstLGY3hzLanjuuP7fzk6uoptfDl4B/NQsINKN+H6xRN2KA4w7OjCvTI10W
 3AlaU4TskCldbxSA5+ty+LqtbI7CHw==
X-Authority-Analysis: v=2.4 cv=U8qfzOru c=1 sm=1 tr=0 ts=68f90619 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=hYh2W50GH4enn7eNEKEA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: 3O8FtPu7zsQw0helB6w3EhIHnpuJR2wE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180032
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

On 10/22/2025 10:03 AM, Konrad Dybcio wrote:
> On 10/8/25 12:40 AM, Youssef Samir wrote:
>> From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
>>
>> AIC200 uses the newer "XBL" firmware implementation which changes the
>> expectations of how READ_DATA is performed. Larger data requests are
>> supported via streaming the data over the transport instead of requiring
>> a single transport transfer for everything.
> 
> tldr just like reading/writing images in 'raw_mode' up until now?

I'm not sure I understand what you are asking here.

AIC100 is the "old" SBL architecture. When the "current" XBL 
architecture came about, quite a bit of the components were rewritten. 
It seems like a different interpretation of the Sahara spec was taken 
for the XBL implementation.

In both cases, the boot component that is driving the Sahara component 
in FW will want segment X of the elf for the next step of processing.

In SBL, the Sahara component would have a specific MTU and break up the 
request (segment X of the elf) into MTU sized read requests for the 
host. The MTU is negotiated with the transport (MHI). The Sahara 
component expects the entire read request to be satisfied in a single 
return from the transport - anything less is an error.

In XBL, the Sahara component would make a single read request to the 
host for the entire request from the boot component (segment X of the 
elf), and expects the underlying transport to shove up data until the 
entire read request is satisfied (Sahara will sit in a loop until it 
gets all of the data).

There is a bit of oddity because the Sahara spec says that the host can 
indicate an error by sending a packet that is anything other than the 
requested read size, but "packet" is not defined. The SBL interpretation 
is that a "packet" is the transport packet - aka the MHI transfer.  The 
XBL interpretation is that the packet is a "Sahara packet" which is 
decoupled from the transport.

In the end, we have two different Sahara implementations in FW with 
different expectations, and both need to be supported.

-Jeff
