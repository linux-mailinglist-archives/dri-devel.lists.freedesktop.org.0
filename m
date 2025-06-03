Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CF4ACC96E
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 16:43:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C247010E1B7;
	Tue,  3 Jun 2025 14:43:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CcPhxPnl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1418210E1B7
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 14:43:52 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5539JKbw032533
 for <dri-devel@lists.freedesktop.org>; Tue, 3 Jun 2025 14:43:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WnAaptpZ09VUKJNzbIUmF1fcjudI6kmHz2onAvseKiQ=; b=CcPhxPnlpzXchT0W
 rYpRiNGmoUXzztdK05haJ65s3m72XJKjoLc+gYE2LGHbQC8QvNb2ESa6erWDTmfg
 RKFWBOyFhX/vsFZ6blP8WaDxYopvSA7kOm7nThIMU6MY1BKvtT9FVbXhrxd20yDs
 PjlWNm6eEH/LM3epvdBwLNNqLI51Gf4srrP39cZwR7KzQFVCe7AD80FPIfqf7+kg
 o12HJNPY0bXX9WtQBY2p4j+DUOl8i226inNMllUH4FlxeYHxTpSpeKDDNdpBfSe2
 Ru0V18h2Tg3Kocd0gZJxFEhPuscRr0pvlg6ZFgfpLQR8DN/PuruOXsy7jjq5K0RD
 Xrb2Lw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471gb2avs5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jun 2025 14:43:51 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-742a969a4d0so4945583b3a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jun 2025 07:43:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748961830; x=1749566630;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WnAaptpZ09VUKJNzbIUmF1fcjudI6kmHz2onAvseKiQ=;
 b=NJi8Th04wMCmx8O26SiR2WU+EurmVIawkQ1Jm5lgqvagHKioUsI81FdUvY25d1bQbH
 Lz9mw3daI/KVuBjNvXquip1MIkZfqZfzPKuoHa72/qNccqfkCYEbBpClHDwpWQ4fVBUh
 PJxOxwnz9B+3tUGPD3dlSvDF0tbiC1jzaV0uBlnLVS9plL+1gJ2eJnWNf7lUCqiDADln
 +QZbunA4z9hHsEEx91bF/7wthOLIJSZkgIxFNoBbD0mBG45rdaT5VApHUyY5RNK1Z7pI
 7eHvAVmGeg9FdOutdN+WtWAlJ/ktkQrSDLJl+UQ08DbvCMS8Hk+lT0KT67n0XCBpuuLQ
 qrjQ==
X-Gm-Message-State: AOJu0Yze7Mwp5QGlGN/abhRk2in2shSoEU9pluxSRFDSXNHm4ZL9HeJF
 +si7BL4UeJbr+3pGnqYkv+OE30iJDiZOqAprLh3a0p7b52tyCphebU0NlTgWXMFSWPoTxM4nx2s
 mq/B5jmQ8XQwpIfMVQyTfHG8NCifw18QHpXrdeEOBAkMgTkI5s9WbN48tL0LiAmmZ8nifCmI=
X-Gm-Gg: ASbGnctfIXCc6EX9J2zHOX5D7Mo97dJn6f4ppO8jLx3+JL0uXzxlASeZ/cDP664RHBe
 YrJS43hWFUZzBlTcPiIwqD2zVZ4Ovub5osieEfvr8GxWUQq8M0fCVODfMGhA/1ZlBV2a2RUomQb
 Ao0K1KJ4kJdH4yBpjY4xHE1NdQmOrbQZZMBTJ6fQVJZ1I3NluKdzggf14iB750MpMZwR37xwgqD
 kXv1E0jbGf/qhZOmS200vriR3mcTCWvpnzb7S8DSRfvzRZAggpTdxR0ZE2ZGHxaBf2d5kV0pbSg
 Pu9ywndMGFL7V7XKiwZvKBZ2msfvnCYtTCFFOG/YfbZi343RBTg326ehC7LFgw==
X-Received: by 2002:a05:6a00:986:b0:736:450c:fa54 with SMTP id
 d2e1a72fcca58-747d1831e8amr14616273b3a.6.1748961830341; 
 Tue, 03 Jun 2025 07:43:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnmmTTOunEhNpY+I/AcenfSNyAkGLYDYgRj9GMjeyspcUOa3FEYxalBx5CvxbM2n1P45xvWg==
X-Received: by 2002:a05:6a00:986:b0:736:450c:fa54 with SMTP id
 d2e1a72fcca58-747d1831e8amr14616237b3a.6.1748961829866; 
 Tue, 03 Jun 2025 07:43:49 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747affd41c3sm9788976b3a.149.2025.06.03.07.43.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jun 2025 07:43:49 -0700 (PDT)
Message-ID: <40c64ab3-ac6d-4844-bc40-95c895df534c@oss.qualcomm.com>
Date: Tue, 3 Jun 2025 08:43:47 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] accel/qaic: delete qaic_bo.handle
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 intel-xe@lists.freedesktop.org,
 Carl Vanderlip <quic_carlv@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Simona Vetter <simona.vetter@intel.com>
References: <20250528091307.1894940-1-simona.vetter@ffwll.ch>
 <20250528091307.1894940-5-simona.vetter@ffwll.ch>
 <70ad82b5-19f3-4e05-bc7a-858dafc563ef@oss.qualcomm.com>
 <aD24l3NoZWWwScx6@phenom.ffwll.local>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <aD24l3NoZWWwScx6@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EsXSrTcA c=1 sm=1 tr=0 ts=683f0a27 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=He-YNEgCv3n_4aK0K0sA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: OdI9IZiwuw5eSa3Riby6w_0zkyV6XXOI
X-Proofpoint-ORIG-GUID: OdI9IZiwuw5eSa3Riby6w_0zkyV6XXOI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDEyOCBTYWx0ZWRfX+V+UPdjJqa5k
 ShqPN8PMepeRnSlNizVw2kCL9gRSdWZokGczlhQUI+fYyTprCz8mOnRmtlHXM//esA0hHFY+Ici
 1RWdPQpkU8YzQweNg5WmyDEvmwCths+MD9QPSLzEg4FX65Nr/lTpEJ4085XwfMGpXMT3lmxhTUn
 gffBVsRF6q1RftxBcVVUEjuHn+xSg0uRFjfnij5GgYsD2F6ByxFSacsAZS3XOS3+NQ6ezY2O4Xa
 Eg92T/3YmYwokengsH6VmIzrGNzf5tVge3/tn0An332y9kcDO26p2mj7g9SUQ8CQ4wsOb3dsuld
 f/Ylbnml3ZQG5gjxDRTUGuQ+XzmDz7cBG4dC1Huqn801/p2o6JsH1iFq5QWsVP7uBLL/UebyskO
 Cs71ZO6kWEheD8aWxCPHcLvK+lcXQTf0zCRorXB1MA30aPCa5pzEwYuHnW+tlbTNYyw6qOYy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 suspectscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 mlxscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506030128
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

On 6/2/2025 8:43 AM, Simona Vetter wrote:
> On Wed, May 28, 2025 at 09:15:22AM -0600, Jeff Hugo wrote:
>> On 5/28/2025 3:13 AM, Simona Vetter wrote:
>>> Handles are per-file, not global, so this makes no sense. Plus it's
>>> set only after calling drm_gem_handle_create(), and drivers are not
>>> allowed to further intialize a bo after that function has published it
>>> already.
>>
>> intialize -> initialize
>>
>>> It is also entirely unused, which helps enormously with removing it
>>> :-)
>>
>> There is a downstream reference to it which hasn't quite made it upstream
>> yet, but tweaking that should be fine. This is clearly a problem anyways, so
>> we'll need to find a solution regardless. Thank you very much for the audit.
>>
>>> Since we're still holding a reference to the bo nothing bad can
>>> happen, hence not cc: stable material.
>>>
>>> Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
>>> Cc: Carl Vanderlip <quic_carlv@quicinc.com>
>>> Cc: linux-arm-msm@vger.kernel.org
>>> Signed-off-by: Simona Vetter <simona.vetter@ffwll.ch>
>>> Signed-off-by: Simona Vetter <simona.vetter@intel.com>
>>
>> SOB chain seems weird to me. I got this email from @ffwll.ch, which would be
>> the author. Where is @intel.com contributing to the handoff of the patch?
> 
> I work for intel, so I just whack both of my emails on there for sob
> purposes. The intel email tends to be a blackhole for public mail, which
> is why I don't use it as From: for anything public.>
>> Overall, looks good to me. Seems like either I can ack this, and you can
>> merge, or I can just take it forward. I have no preference.  Do you?
> 
> Whatever you like most, I'll resend the series with the wrong patches
> dropped soon anyway.

I think I'll apply it this week, with the typo fixed. Then I can 
mentally check it off my list as closed.

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

-Jeff

