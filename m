Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A911A7C054
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 17:13:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF4E310E1C0;
	Fri,  4 Apr 2025 15:13:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="I9a1Np0p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D7510EBE7
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Apr 2025 15:13:26 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 534ErnIQ004625
 for <dri-devel@lists.freedesktop.org>; Fri, 4 Apr 2025 15:13:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 t2ua4t/vTRBqX+aIsROfTHBod/gUhDKVJBELniX8ni0=; b=I9a1Np0pYn9mHAWc
 chlgR/nal1c/6xANU2KM1qXmAlVuNJ8XVqO2kQzDBvGVVlOO89QR1s3x1n4n/s+p
 8HWTvk/mavMUTI+56dpwprpATdiLKNMB05S783FF4yLsOM2VNXyUvHCGNjWDj6Hn
 IQQi2eR4au/SukhsxkyqVJXLMgL8SXPhaBmh6iugy/LGjNN2XLEtqMTzrbctQIua
 G/neHuQVMPcr0XhOLf6ZOTS4icpqLAH/E/XR2ihU4xpQ3A0zh5CnkTdJzX5W38j/
 7Q0WYV4oVOUXOMK1eKWbfRRRQtvQ1JFahm1q1kh1RKoBZLBoP8qKB5oiqtRvK1hh
 JCdFhQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45t2d8j6kt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Apr 2025 15:13:26 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2242ade807fso34896975ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Apr 2025 08:13:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743779605; x=1744384405;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t2ua4t/vTRBqX+aIsROfTHBod/gUhDKVJBELniX8ni0=;
 b=MEMM8vjtUbc/utBuDNgDYyDr4v/Gt+nCx68mjLSX1m2+Uq2hU/2gcHa8McGkghtF3Z
 8Uvw1qVyhzSRtVvSAb9HjGs6JFadnQmY0BckElbpyMssAYMpgqDTnGt+EvGBt+Tqdy1P
 HUOie337pEG3M94byeBWOo3ONKByH7HgVcd36KvgsXjPuyuHmBHsIiIs173Irzfo+9/8
 VYaynZg+e8Xr7vyT6c9+s+koS4FuqjhaxNdpIFRaP1TTsHF/jqQVFIi743CoiHEJM/EF
 pLlstCY04InHkR0ISJ0Bsuke/cDbbAvwt/5VTyKP/tiAFxH56pjkzOm1erKRs7/US5qj
 xz8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/7UmSVM+aNskcxmUF79GdZWkwf4d7B9mtLCk4Gq7en5EXv86K1wTynvdfiZJMY8VjEbn0DuvhCVM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4hrTyg/45sRg6vFoffutU/3URojWUe2aZ2kgBAMS+sKLKzY/u
 wvj61vQs1Lw/BB5+Pdlc53TzFnnDN4CchGvr97zQKQJSQfumev9D1opD4S54ztoOtaJliTe4rHK
 ldY6pRwJ96y6N4OVD8x8USTpOtrWonwoHZ4G5RvSMyFaQ3fiYSK/L5gBAT6ZkZiUX/ug=
X-Gm-Gg: ASbGncsLzWkMC3gY4k7QCbHchPzgwDi0KVdGFtba2Z6zx/bKPfqK29VPbXx9zvWTwZu
 Vfs+fpl33VRjzuseobVIcdnQ36nhgw8oDS3AAWQZfNfbAccKDftXgeqC7qXauB5PGQyt45YbjeU
 IU5UB5/v7zoVEDjY+nW2qlsiabRxLD2+6oY4Hc1hlRTrJEVWmRncPV0GzrFkXg5nF2H8qQ/C6DI
 X6W2t5IJbeNQ/pHe/CfNF/BwGt+TiFI1WK4GCaJhgDYYiNwUiLH3TYwZm2bjxvFx/sy8dEfEWDM
 9mRx+2whj08bo7dQ0EUWv2zR3emeiItJBsz+/tEyGmp0ifp7nesVjsDnrZSK6cd6Tw==
X-Received: by 2002:a17:902:dac7:b0:224:23be:c569 with SMTP id
 d9443c01a7336-22a8a861c6cmr47061135ad.22.1743779605573; 
 Fri, 04 Apr 2025 08:13:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5hwGdHgsdYTQFoa4ZP0RibQRE+cCFqQ2Xbc9JitwxDhhEbAYLIbrEsb95LZNpNetjB7gBqw==
X-Received: by 2002:a17:902:dac7:b0:224:23be:c569 with SMTP id
 d9443c01a7336-22a8a861c6cmr47060805ad.22.1743779605181; 
 Fri, 04 Apr 2025 08:13:25 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22978662508sm33131345ad.139.2025.04.04.08.13.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Apr 2025 08:13:24 -0700 (PDT)
Message-ID: <464ccbb4-3c72-4ecf-a0cf-35d2ad9d04a4@oss.qualcomm.com>
Date: Fri, 4 Apr 2025 09:13:23 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] accel/ivpu: Show NPU frequency in sysfs
To: Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jacek.lawrynowicz@linux.intel.com,
 lizhi.hou@amd.com, Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
References: <20250401155912.4049340-1-maciej.falkowski@linux.intel.com>
 <20250401155912.4049340-3-maciej.falkowski@linux.intel.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250401155912.4049340-3-maciej.falkowski@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1FnwyF0ZuiQ6kjLphOYfwDFMu2CTIQ4u
X-Proofpoint-ORIG-GUID: 1FnwyF0ZuiQ6kjLphOYfwDFMu2CTIQ4u
X-Authority-Analysis: v=2.4 cv=N+gpF39B c=1 sm=1 tr=0 ts=67eff716 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=QyXUC8HyAAAA:8 a=sAlgVzfPqqLbAcrpmQYA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_06,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 mlxlogscore=969 bulkscore=0
 malwarescore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504040105
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

On 4/1/2025 9:59 AM, Maciej Falkowski wrote:
> From: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
> 
> Add sysfs files that show maximum and current
> frequency of the NPU's data processing unit.
> New sysfs entries:
> - npu_max_frequency_mhz

Don't you have an ioctl to get this, which is fixed in patch 1 of the 
series?  Why duplicate that with a sysfs?

> - npu_current_frequency_mhz

Do you have userspace code that consumes these?

> 
> Signed-off-by: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
> ---
>   drivers/accel/ivpu/ivpu_hw.h      |  5 ++++
>   drivers/accel/ivpu/ivpu_hw_btrs.c |  8 +++++
>   drivers/accel/ivpu/ivpu_hw_btrs.h |  1 +
>   drivers/accel/ivpu/ivpu_sysfs.c   | 49 ++++++++++++++++++++++++++++++-

Missing uapi documentation.

Also, should the sysfs maintainers be included in the review?

