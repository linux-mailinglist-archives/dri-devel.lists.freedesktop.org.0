Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPuKO+n/nmlAYgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 14:58:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADEE198712
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 14:58:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1B6D10E159;
	Wed, 25 Feb 2026 13:57:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SngD41I0";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CgJnHiFD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEA7C10E159
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 13:57:58 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61P9TCpA2365382
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 13:57:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xBYPi7uwmyms6qiKiYpOhYR8HyAd/7uAOTP2ZQu479c=; b=SngD41I08N36oMO6
 tYE2d77d7x+/raH5JgVXcHVUQ8nEjcQrITPqEa2e5yAVeU+u8gH7S2lRGIQI5Ndo
 YIFsSxzcACHZasaST4AD5xRn+hRi1qSKrOjgYRFwlHOaN7W0GGcO+Q8fG0QHEuZa
 m++zp+42KeBUePer+VKMgN7g1bXlLaxRku0dtgMveJpJo+BdO5hzMytiBzI9PZg4
 imrJ2iANeWWl7UP/vlyld9XiBLlmJvC/nfDREkeHpLCqOJilokGRtUxeay9tdy5D
 tIJZVjcEtDoNhTlItSWFjDrNRrpHkPkHgiDx83dp9Q6EsDpPZrqe6h+KS6IoY2SL
 8eTE8Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cherjbr7s-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 13:57:58 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2aaeafeadbcso76227125ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 05:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772027878; x=1772632678;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xBYPi7uwmyms6qiKiYpOhYR8HyAd/7uAOTP2ZQu479c=;
 b=CgJnHiFDf7nH9np7LvYgN6AYwocBKAQ/5GLa0MDhTBMhF1YazR/JoRm9NKG0lo0FeT
 Ii/oVEJdW3TiUIB4mi8oVVZZ5m0Kz+2zEILkAqDqZ+ej1XiMSEft5jirDxnAZ00Ag0ZH
 uSGFKMkqBY6yrLMiVE58ZfCtqi5xq/wEdAybRh6WPhbS5W1iR+9i6trUfpRYxKdFxJq1
 hzR+Xvcn6JN59epUmi0RqhcbpOVX255/nHpleIVP+rtz3vnwi+KOYR1ikg6oW/PfG6MQ
 AJ+hv4mS2y8jyela5g1foq17C4V/sWDjTMDawI68o+5Old+GrW0t/XQss1UcgvWf2igo
 xkYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772027878; x=1772632678;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xBYPi7uwmyms6qiKiYpOhYR8HyAd/7uAOTP2ZQu479c=;
 b=YH939vOW8knmlFZDxPqdMd/2+Yp5vU28jPoaKryz3ibz/XzUpFFa6ZbviXkYE48bnd
 a2Y/q4hbcfRRhdVBsR7K+/EkMeqA7/eQus6382keqEsH0N9CQfYpK5kDRQ1Q5OnhLwju
 MLZ+9PjOBOT5/IE4vpjvkuw7xISVHPzwU//TBDBo88/Xb/PQlFPeKkY3BodAtkDvQj5Y
 jL+80Ajhevf1OhLZBMDcyfPf8QVK4unBHDc7i2gk+t4pE1mpXxK2kEAcvgIpQSnBu3De
 zoTHzUMcUZxxEBAe40zEWBiU/dZhsq4TnJ/Zi4YR/Dx6ljRiaTtqCj4hDaq7KvL0qB7N
 Wmrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWn50hNpI7WoKXZUMbvdOil5qZEim51p4OXpQT951ljmZeA2LWi5Pi+57GbrU9LDH6SMRoUedkyIJE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwE/BrZRh39foP3ls6hk5iftkXEaPyFxI2KBqovuHksVau+/EhN
 7y2iZjZV8TtlmQQp9HM87WInWUrRnBqgFpqJNvBiVp2SBVkn+r/U7uPwaxcVF1RdYZp9qBA2u6M
 Oro2F3HCba6sfiC/QK3/4I35BTEShhGPRqnIr5rxEu8uqh8xLhJOeNI8zBvaHj9MnERCFDAQ=
X-Gm-Gg: ATEYQzyXmZchHJB2/HPFcDNgfchARL/XLqiAvUF9FG+RicqvA1O7C3PDIIX8/rjp9KT
 oZsiiJdQ3Qz5e3ERSPJ2J7lym7nQEJ3RR8Rl9yonBWGhe9YBjtpc2bFuwVu5pnNlONTw0UEzN30
 FBjWVD4YC4JMGuja+p3LjD2vdh8vLxmfekCUN4k0t9ZU15HftaG3yillkr2Aq3wfHBer4X2Sb8X
 rzCacROBAuS0f7/2YwObp4GPZm3kByHal6jGTdR7GwOxtktxTWMX/aRqzT8zqWATyGwhzoHWEKg
 2kQ59lsvEFsvfDSJ9VAKz1JZBQ09ajptoIQqiy1DS3mL0cB5sRCIKYWn7gSx71jJakSfD4haMFW
 qjbsDtwo9jTmoCNFIxI2TXxkvHwItFGi5QcrMele3FMUzRhh2I+0=
X-Received: by 2002:a17:903:22d2:b0:2ad:ca65:a398 with SMTP id
 d9443c01a7336-2adca65a58cmr27706765ad.57.1772027877469; 
 Wed, 25 Feb 2026 05:57:57 -0800 (PST)
X-Received: by 2002:a17:903:22d2:b0:2ad:ca65:a398 with SMTP id
 d9443c01a7336-2adca65a58cmr27706515ad.57.1772027876861; 
 Wed, 25 Feb 2026 05:57:56 -0800 (PST)
Received: from [192.168.1.5] ([171.61.227.247])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad750275d0sm175587235ad.61.2026.02.25.05.57.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 05:57:55 -0800 (PST)
Message-ID: <ceba8973-4fb7-4497-aebf-dd41f2d2eaa5@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 19:27:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 01/18] accel/qda: Add Qualcomm QDA DSP accelerator
 driver docs
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 iommu@lists.linux.dev, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Bharath Kumar <quic_bkumar@quicinc.com>,
 Chenna Kesava Raju <quic_chennak@quicinc.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-1-fe46a9c1a046@oss.qualcomm.com>
 <jyd3ufisoz4xcfe2dvu26odesaz2czj22jn46qswkzz6ocg4zu@6krzvyvirkmo>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <jyd3ufisoz4xcfe2dvu26odesaz2czj22jn46qswkzz6ocg4zu@6krzvyvirkmo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDEzMyBTYWx0ZWRfXwnV2FQmXpWK2
 iiUY6qDJs5kxqD6+/qQDmqkjHVd9mRzPUpRB0In+NQ/tOnD5PAEu4HUUAsjNR04nr2y3q4TilpS
 ZPelvo4FhmSI7Q0cbf+uGY4X15Rh6AAcGxeGKP4aEHtwqod80JsaMdsjDwzfzD7B0fKZu4iYLzn
 PWQbZDyfSqZJ88ynJ4k3qyE2pOiHslBnCiK8Q0n3JqZvt3ayBvVRX57gadIC/KBb92TI2WQKR+t
 hhvJ01UAVOCgHudsS6N9UBjQ7R8iL+uX9YJVJoG+PJxPMEmPHsAUSWzZ5DzWMTU9rlRrcVphZ6Y
 1eqnU9ynyHTpU52giCd0hilYa93x5vZFDxdUii/jr9aMjQYudg5wGoBF5200L0RI4PVl78aeCVW
 fwv47h8BAf0m4KpOiL8OEYnd8CTJGJH8eAAW3FypxvwiKECyg3QIMKByuG9mnhbM8Md25Hh6vwK
 VCwoDA9uQUrIhwetriA==
X-Proofpoint-GUID: FpSyTDDN_yXU-w7SoOKi9dopnYqD2JzC
X-Proofpoint-ORIG-GUID: FpSyTDDN_yXU-w7SoOKi9dopnYqD2JzC
X-Authority-Analysis: v=2.4 cv=NeDrFmD4 c=1 sm=1 tr=0 ts=699effe6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=CLJ8B99oKJtQbdnoKiLypA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7m3UXCOrzlUTUB1U0ZMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_01,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250133
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:ogabbay@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:srinivas.kandagatla@oss.qualcomm.com,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,oss.qualcomm.com,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ekansh.gupta@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 5ADEE198712
X-Rspamd-Action: no action



On 2/24/2026 2:47 AM, Dmitry Baryshkov wrote:
> On Tue, Feb 24, 2026 at 12:38:55AM +0530, Ekansh Gupta wrote:
>> Add initial documentation for the Qualcomm DSP Accelerator (QDA) driver
>> integrated in the DRM accel subsystem.
>>
>> The new docs introduce QDA as a DRM/accel-based implementation of
>> Hexagon DSP offload that is intended as a modern alternative to the
>> legacy FastRPC driver in drivers/misc. The text describes the driver
>> motivation, high-level architecture and interaction with IOMMU context
>> banks, GEM-based buffer management and the RPMsg transport.
>>
>> The user-space facing section documents the main QDA IOCTLs used to
>> establish DSP sessions, manage GEM buffer objects and invoke remote
>> procedures using the FastRPC protocol, along with a typical lifecycle
>> example for applications.
>>
>> Finally, the driver is wired into the Compute Accelerators
>> documentation index under Documentation/accel, and a brief debugging
>> section shows how to enable dynamic debug for the QDA implementation.
>>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  Documentation/accel/index.rst     |   1 +
>>  Documentation/accel/qda/index.rst |  14 +++++
>>  Documentation/accel/qda/qda.rst   | 129 ++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 144 insertions(+)
>>
>> diff --git a/Documentation/accel/index.rst b/Documentation/accel/index.rst
>> index cbc7d4c3876a..5901ea7f784c 100644
>> --- a/Documentation/accel/index.rst
>> +++ b/Documentation/accel/index.rst
>> @@ -10,4 +10,5 @@ Compute Accelerators
>>     introduction
>>     amdxdna/index
>>     qaic/index
>> +   qda/index
>>     rocket/index
>> diff --git a/Documentation/accel/qda/index.rst b/Documentation/accel/qda/index.rst
>> new file mode 100644
>> index 000000000000..bce188f21117
>> --- /dev/null
>> +++ b/Documentation/accel/qda/index.rst
>> @@ -0,0 +1,14 @@
>> +.. SPDX-License-Identifier: GPL-2.0-only
>> +
>> +==============================
>> + accel/qda Qualcomm DSP Driver
>> +==============================
>> +
>> +The **accel/qda** driver provides support for Qualcomm Hexagon DSPs (Digital
>> +Signal Processors) within the DRM accelerator framework. It serves as a modern
>> +replacement for the legacy FastRPC driver, offering improved resource management
>> +and standard subsystem integration.
>> +
>> +.. toctree::
>> +
>> +   qda
>> diff --git a/Documentation/accel/qda/qda.rst b/Documentation/accel/qda/qda.rst
>> new file mode 100644
>> index 000000000000..742159841b95
>> --- /dev/null
>> +++ b/Documentation/accel/qda/qda.rst
>> @@ -0,0 +1,129 @@
>> +.. SPDX-License-Identifier: GPL-2.0-only
>> +
>> +==================================
>> +Qualcomm Hexagon DSP (QDA) Driver
>> +==================================
>> +
>> +Introduction
>> +============
>> +
>> +The **QDA** (Qualcomm DSP Accelerator) driver is a new DRM-based
>> +accelerator driver for Qualcomm's Hexagon DSPs. It provides a standardized
>> +interface for user-space applications to offload computational tasks ranging
>> +from audio processing and sensor offload to computer vision and AI
>> +inference to the Hexagon DSPs found on Qualcomm SoCs.
>> +
>> +This driver is designed to align with the Linux kernel's modern **Compute
>> +Accelerators** subsystem (`drivers/accel/`), providing a robust and modular
>> +alternative to the legacy FastRPC driver in `drivers/misc/`, offering
>> +improved resource management and better integration with standard kernel
>> +subsystems.
>> +
>> +Motivation
>> +==========
>> +
>> +The existing FastRPC implementation in the kernel utilizes a custom character
>> +device and lacks integration with modern kernel memory management frameworks.
>> +The QDA driver addresses these limitations by:
>> +
>> +1.  **Adopting the DRM accel Framework**: Leveraging standard uAPIs for device
>> +    management, job submission, and synchronization.
>> +2.  **Utilizing GEM for Memory**: Providing proper buffer object management,
>> +    including DMA-BUF import/export capabilities.
>> +3.  **Improving Isolation**: Using IOMMU context banks to enforce memory
>> +    isolation between different DSP user sessions.
>> +
>> +Key Features
>> +============
>> +
>> +*   **Standard Accelerator Interface**: Exposes a standard character device
>> +    node (e.g., `/dev/accel/accel0`) via the DRM subsystem.
>> +*   **Unified Offload Support**: Supports all DSP domains (ADSP, CDSP, SDSP,
>> +    GDSP) via a single driver architecture.
>> +*   **FastRPC Protocol**: Implements the reliable Remote Procedure Call
>> +    (FastRPC) protocol for communication between the application processor
>> +    and DSP.
>> +*   **DMA-BUF Interop**: Seamless sharing of memory buffers between the DSP
>> +    and other multimedia subsystems (GPU, Camera, Video) via standard DMA-BUFs.
>> +*   **Modular Design**: Clean separation between the core DRM logic, the memory
>> +    manager, and the RPMsg-based transport layer.
>> +
>> +Architecture
>> +============
>> +
>> +The QDA driver is composed of several modular components:
>> +
>> +1.  **Core Driver (`qda_drv`)**: Manages device registration, file operations,
>> +    and bridges the driver with the DRM accelerator subsystem.
>> +2.  **Memory Manager (`qda_memory_manager`)**: A flexible memory management
>> +    layer that handles IOMMU context banks. It supports pluggable backends
>> +    (such as DMA-coherent) to adapt to different SoC memory architectures.
>> +3.  **GEM Subsystem**: Implements the DRM GEM interface for buffer management:
>> +
>> +    * **`qda_gem`**: Core GEM object management, including allocation, mmap
>> +      operations, and buffer lifecycle management.
>> +    * **`qda_prime`**: PRIME import functionality for DMA-BUF interoperability,
>> +      enabling seamless buffer sharing with other kernel subsystems.
>> +
>> +4.  **Transport Layer (`qda_rpmsg`)**: Abstraction over the RPMsg framework
>> +    to handle low-level message passing with the DSP firmware.
>> +5.  **Compute Bus (`qda_compute_bus`)**: A custom virtual bus used to
>> +    enumerate and manage the specific compute context banks defined in the
>> +    device tree.
> I'm really not sure if it's a bonus or not. I'm waiting for iommu-map
> improvements to land to send patches reworking FastRPC CB from using
> probe into being created by the main driver: it would remove some of the
> possible race conditions between main driver finishing probe and the CB
> devices probing in the background.
>
> What's the actual benefit of the CB bus?
I tried following the Tegra host1x logic here as was discussed here[1]. My understanding is that
with this the CB will become more manageable reducing the scope of races that exists in the
current fastrpc driver.

That said, I'm not completely aware about the iommu-map improvements. Is it the one
being discussed for this patch[2]? If it helps in main driver to create CB devices directly, then I
would be happy to adapt the design.

[1] https://lore.kernel.org/all/245d602f-3037-4ae3-9af9-d98f37258aae@oss.qualcomm.com/
[2] https://lore.kernel.org/all/20260126-kaanapali-iris-v1-3-e2646246bfc1@oss.qualcomm.com/
>
>> +6.  **FastRPC Core (`qda_fastrpc`)**: Implements the protocol logic for
>> +    marshalling arguments and handling remote invocations.
>> +
>> +User-Space API
>> +==============
>> +
>> +The driver exposes a set of DRM-compliant IOCTLs. Note that these are designed
>> +to be familiar to existing FastRPC users while adhering to DRM standards.
>> +
>> +*   `DRM_IOCTL_QDA_QUERY`: Query DSP type (e.g., "cdsp", "adsp")
>> +    and capabilities.
>> +*   `DRM_IOCTL_QDA_INIT_ATTACH`: Attach a user session to the DSP's protection
>> +    domain.
>> +*   `DRM_IOCTL_QDA_INIT_CREATE`: Initialize a new process context on the DSP.
> You need to explain the difference between these two.
Ack.
>
>> +*   `DRM_IOCTL_QDA_INVOKE`: Submit a remote method invocation (the primary
>> +    execution unit).
>> +*   `DRM_IOCTL_QDA_GEM_CREATE`: Allocate a GEM buffer object for DSP usage.
>> +*   `DRM_IOCTL_QDA_GEM_MMAP_OFFSET`: Retrieve mmap offsets for memory mapping.
>> +*   `DRM_IOCTL_QDA_MAP` / `DRM_IOCTL_QDA_MUNMAP`: Map or unmap buffers into the
>> +    DSP's virtual address space.
> Do we need to make this separate? Can we map/unmap buffers on their
> usage? Or when they are created? I'm thinking about that the
> virtualization. 
The lib provides ways(fastrpc_mmap/remote_mmap64) for users to map/unmap the
buffers on DSP as per processes requirement. The ioctls are added to support the same.
> An alternative approach would be to merge
> GET_MMAP_OFFSET with _MAP: once you map it to the DSP memory, you will
> get the offset. 
_MAP is not need for all the buffers. Most of the remote call buffers that are passed to DSP
are automatically mapped by DSP before invoking the DSP implementation so the user-space
does not need to call _MAP for these.

Some buffers(e.g., shared persistent buffers) do require explicit mapping, which is why
MAP/MUNMAP exists in FastRPC.

Because of this behavioral difference, merging GET_MMAP_OFFSET with MAP is not accurate.
GET_MMAP_OFFSET is for CPU‑side mmap via GEM, whereas MAP is specifically for DSP
virtual address assignment.
>
>> +
>> +Usage Example
>> +=============
>> +
>> +A typical lifecycle for a user-space application:
>> +
>> +1.  **Discovery**: Open `/dev/accel/accel*` and check
>> +    `DRM_IOCTL_QDA_QUERY` to find the desired DSP (e.g., CDSP for
>> +    compute workloads).
>> +2.  **Initialization**: Call `DRM_IOCTL_QDA_INIT_ATTACH` and
>> +    `DRM_IOCTL_QDA_INIT_CREATE` to establish a session.
>> +3.  **Memory**: Allocate buffers via `DRM_IOCTL_QDA_GEM_CREATE` or import
>> +    DMA-BUFs (PRIME fd) from other drivers using `DRM_IOCTL_PRIME_FD_TO_HANDLE`.
>> +4.  **Execution**: Use `DRM_IOCTL_QDA_INVOKE` to pass arguments and execute
>> +    functions on the DSP.
>> +5.  **Cleanup**: Close file descriptors to automatically release resources and
>> +    detach the session.
>> +
>> +Internal Implementation
>> +=======================
>> +
>> +Memory Management
>> +-----------------
>> +The driver's memory manager creates virtual "IOMMU devices" that map to
>> +hardware context banks. This allows the driver to manage multiple isolated
>> +address spaces. The implementation currently uses a **DMA-coherent backend**
>> +to ensure data consistency between the CPU and DSP without manual cache
>> +maintenance in most cases.
>> +
>> +Debugging
>> +=========
>> +The driver includes extensive dynamic debug support. Enable it via the
>> +kernel's dynamic debug control:
>> +
>> +.. code-block:: bash
>> +
>> +    echo "file drivers/accel/qda/* +p" > /sys/kernel/debug/dynamic_debug/control
> Please add documentation on how to build the test apps and how to load
> them to the DSP.
Ack.
>
>> -- 
>> 2.34.1
>>

