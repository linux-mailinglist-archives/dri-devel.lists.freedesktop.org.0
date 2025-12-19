Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE1BCCF3C5
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 10:56:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AFF710EF0D;
	Fri, 19 Dec 2025 09:56:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mBvM2Wno";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MS5JLhND";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16D0310EF0C
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 09:56:47 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BJ4c95G3939327
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 09:56:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 k2n+SE5qOjIgQy6DMMGVLWGLkjFAmY3VbtNAYsRbVQs=; b=mBvM2WnoXkzYN/kC
 SJGG65cEd1jX1y37nhMNwPXoYap3kWJQ87NpviuiG/9EpW6RY1R2+65CQo0TacQK
 sg5g261EgUkzpSZNRyIQ5Tbq94grrpgA54RJf6dw7RiPrt9VvtizQFAgaUOcEl8M
 GWgnCmPqSj0yr1tNRU87wP08XWkpyiLLJXDEohVRQEIe6jqZ3UEAy9xpKoaXIU/+
 ForMEEIzdxlOZtKRPSjpS3PmCX2Ly5oARuhQGWCswtUnUjrxx7VjBJaXw4Eu3pbN
 YXSBkcSKxsz957JQmEVhedqMLHHF9ABw3MrRhNod1hp64Yv1Ut2wd6spRjrh8MHF
 YF2vfA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2c277m-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 09:56:46 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-88a31ce8214so35790566d6.2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 01:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766138205; x=1766743005;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k2n+SE5qOjIgQy6DMMGVLWGLkjFAmY3VbtNAYsRbVQs=;
 b=MS5JLhNDIdpPzeosItbNmBeXycAt2Ljut9seSUJBKYtvWn9qVpjpj4EHE6n3t6yGVu
 uqUiEev2p5sZEzYyIjojcu3TsnnViUjX1lDei15onO1NlyAvnbJNdCk+pnyDFL3cPn6w
 DxtNzLlV+0/BH0kj2/j9vXfsAHNPyrbc0Sp7gZcj3/l2B0whXnjCSFGJCyPZtqbln1kh
 1ZUdouJtTGbOVbFlQoPU8L+xFUyFVhjz5AJ61dxb2DO1+Y73PTlNG1rfigM3xdjOkvAV
 en/LefgrAGCxLz9/gBSPALJVkU+F5A0h9MQx3Vz5DgP/2ihCEsYnHuZFxo9zVFqH7cVK
 Ha1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766138205; x=1766743005;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k2n+SE5qOjIgQy6DMMGVLWGLkjFAmY3VbtNAYsRbVQs=;
 b=MIcQTiOj734QORnyrWYtz7zBtncO1H6tN8JrBUKz+qCb8CBd8aoE1Hgpn53kJO3mjY
 1cQ37PDuGJoNx2gbgsOSp3iu2Hw5IjLf+j17Y9xZmIgPF4gNC4jEchSnHxCQDuwH1+m/
 PtyREVH4ZgtPTIVMhbmPfFypZ+a3nsa3OiLCrcpbpI6Xxpqb04U5h8rEyeIMZwhE6RxR
 1vm5CzCJWLrHGN0AQ5IlqRFQYy1O/ms66cMwPTUdmGZDmqzEJPzDEF1FxFP4z/5p3EZl
 NIVE4+s2Zp1wdvmSRz1X0NovYsxplXA9MvZOBq0zGCxrGX/r2h4rQ5ENdQ9tNTfdUQzQ
 KaFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhWRWPlvUaBLdnYEcZps0XJw+Djzzhz1GnBAy0/UfPBZRlnhi9MltRhBOFyCgF5lOPeqrqga82dYs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxxKww9JCfJPo2zBe6La4m1B2jnK6rrLZ+y1N/lKMqIb7UdoUC9
 bSIW2Uncb5h/f7AjTIo8tsJcoPpMJTuld5y3PBVcRfxNFWgX9/5Z90nWH/8e+slL0H7zGpRtp/+
 CNzjuh10jVcYSK5ergqHFU63BJ1Y+1SjSWGRSu+AMCp/ylNiUgtMmD2mCtzuGsVxonZBzCLI=
X-Gm-Gg: AY/fxX7OXWc4NPKgu8ZWIPllKEsRtrraan/U0NM4pdgs10j4MK4A+l2hwV+cOSMSsxt
 CAneKRbS6KgIhOsaQ0z/im8Bs0fRdiOWhN9d2TxCzZXVP+zgBV7MvetUULk9VkD6Pm/bMd7bwH8
 ib4aJMeWBGreXaXh/CsW2loH5Je6fO0kzfGApMUdtxPkH9GjyFwyaQ38Yb4Iy6L7BAMWeq2oIz+
 H9q87WIXX7rNDL/SZGdV4zBqPsXft2dytTNBlNhmCmL+GRE3bCPv1HahsONn3QIuWcZ6vgSSZLA
 ZtUp6ezoRu8f+y+CZuo8eDSRu5nWlxTcQ6Q1tN2rGsnn1MDyjKkXgPom/vYwYtrMFrwJmRdfw2b
 OQPIuZgxcFPEYPXN4Aq7AvD7D0x2FHsc3B4vNcLF4F4MZhhGVjwzHrB8RNxYN77c8ZZOc
X-Received: by 2002:a05:6214:1c4a:b0:880:4ed1:ce32 with SMTP id
 6a1803df08f44-88d833b580bmr40114706d6.45.1766138205415; 
 Fri, 19 Dec 2025 01:56:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmL/9SGkWyvSpj/ayO4oxzYHHhXmjwsfj/l32rWMsHt4VSUg1NRyyPchBsCrruiDNCaZinHA==
X-Received: by 2002:a05:6214:1c4a:b0:880:4ed1:ce32 with SMTP id
 6a1803df08f44-88d833b580bmr40114456d6.45.1766138204950; 
 Fri, 19 Dec 2025 01:56:44 -0800 (PST)
Received: from [10.193.196.209] (82-128-196-119.bb.dnainternet.fi.
 [82.128.196.119]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a186f957asm542852e87.28.2025.12.19.01.56.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Dec 2025 01:56:44 -0800 (PST)
Message-ID: <a0acccc3-00d9-4235-9b4a-f4498b2896ac@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 11:56:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/11] drm/connector: hdmi: limit infoframes per driver
 capabilities
To: Maxime Ripard <mripard@kernel.org>
Cc: Daniel Stone <daniel@fooishbar.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Liu Ying <victor.liu@nxp.com>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20250929-gregarious-worm-of-memory-c5354d@houat>
 <itgffxygopi7etkt7xhvmyuvyl5ad3k43nsxvjzw3ubtwiikn7@ocugfdaigtu7>
 <20251003-uptight-echidna-of-stamina-815305@houat>
 <zpygq4kapil3swsmhhqkdwny4ry2dznnzixsw5rkza5p2kqnvp@abvf2vxlbwif>
 <2a5fitdzr2bz235fj6rvqzxr6ckszkjbazjfszlvnizdh2cvbt@w3ypjo7vahhs>
 <pibxhl5hlcpuk3zsgyienfdlda5cwuxrnofwlw356scuzzplqy@zw3ofelgvwik>
 <bsoqyzxi45i67jpzhwr2d4illufa5ghqf25z6flbp67lsbvh22@rrlcihp2oxea>
 <cgzclxjubj5oca3rdnv44qwrkmpddxve4tlz76cc6p3b4hz3oc@3l7mt5ha7do6>
 <20251201-enlightened-zebu-from-asgard-5a20be@houat>
 <5dyhjur3hkhvtlwrl4h2m342byor7f3ssvkunj4cggnhbhlmnb@l2mfz7ypjj37>
 <20251219-honest-slim-crab-02e932@houat>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20251219-honest-slim-crab-02e932@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dLQSO99-0JkoMFeMQhZbKvtl-7ZrnZ0G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4MSBTYWx0ZWRfXwHW2ajVX9cBS
 X8rxm+3ac0NlP4kmbhhZPB7hEiif2XhJFMQgtkFqNcWJhdZ4bMbfaxl3k0oU4zSAWSCF0aRUPQj
 qCPpO230rWIR2dAQp/UDG9DeJ5YfzBI80uqrsdiswdHoR3sXZ6JQs6X3mTO5D4RrDRl7dLYDcri
 D8qd3RnmRB5DnUEKgQCgQZsy6ep4jA+bsbaxLEc6XFNCKPM1c/8ZTMc0fmqnTZmn/A2To3uijEK
 GG1v2C8XTxQAwc3ENAu8sEft1/bR+VuliBQE5mWBZiddkKSTk/9kA9yhsuIguDKe3m1CKGnyvIf
 i3mq32Zj2+y+W9C+KOvSQ0xYk3UNiXW8QKzzOHv1c7KqEy8CXjFCu+vvMeOAe4fQopLkXRXLX92
 5kE8ZiYLXq/096wQjZnkN8goHIUuA6MaKRRBw9z6IVr2UzYzf+ZSL04qZr0MzEUeityW9niwOK9
 7qd9tcpLHbyjHwCz7sA==
X-Authority-Analysis: v=2.4 cv=feSgCkQF c=1 sm=1 tr=0 ts=6945215e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=UP4AmmvVc3sGQHJQO2VA4Q==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=wWkPZpA8QBIs0yCpxSwA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: dLQSO99-0JkoMFeMQhZbKvtl-7ZrnZ0G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190081
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

On 19/12/2025 11:54, Maxime Ripard wrote:
> On Sat, Dec 06, 2025 at 01:28:14PM +0200, Dmitry Baryshkov wrote:
>> On Mon, Dec 01, 2025 at 06:01:56PM +0100, Maxime Ripard wrote:
>>> On Fri, Nov 21, 2025 at 07:09:01PM +0200, Dmitry Baryshkov wrote:
>>>>> So it's not really impossible, you just need some hardware and a day's
>>>>> worth of work.
>>>>>
>>>>> There's no reason these should get a pass, it's breaking the spec for no
>>>>> reason.
>>>>>
>>>>>>> For SPD, It's really not clear to me why atomic_check should do that in
>>>>>>> the first place. Your initial concern was about exposing infoframes in
>>>>>>> debugfs that wouldn't be used by the driver.
>>>>>>>
>>>>>>> If the driver doesn't register a debugfs file for SPD, and ignores
>>>>>>> whatever is in the atomic state, what's should we force drivers to do
>>>>>>> that?
>>>>>>
>>>>>> I really don't think that drivers should mess up with debugfs on their
>>>>>> own. Making atomic_check() disable the unsupported InfoFrames makes the
>>>>>> picture perfect: the DRM no longer tries to program them to the
>>>>>> hardware, DebugFS files stay empty, so the whole state becomes
>>>>>> consistent.
>>>>>
>>>>> In the "bridge has no access to infoframes" case, there's really no
>>>>> infoframe. An empty file is "the infoframe can be there but isn't used",
>>>>> not "we don't have access to it and can't report them". Only drivers
>>>>> have those infos.
>>>>>
>>>>> If we do split up write_infoframe into multiple functions though, I
>>>>> guess we could create the debugfs file only if the function pointer is
>>>>> set, which removes drivers' involvement if you don't like that.
>>>>
>>>> I'm fine with not using HDMI connector framework for lt9611uxc.
>>>> Likewise, I think, it's fine to have empty files for the infoframes
>>>> which are not being sent over the wire for any reason (hw not supporting
>>>> it is one of the reasons).
>>>
>>> I can't think of any other example in the kernel where an empty file
>>> means that the driver doesn't support something.
>>
>> Okay. So we need to sort out implementing the split write_infoframes in
>> drm_bridge_connector. Any suggestions there? I'm asking, because I don't
>> want to end up exploding it.
> 
> I guess it's only really a problem if we want to make it const, but we
> don't have to? We could just as well allocate the structure directly at
> probe with a drmm helper and fill it as we need to.


Yes, I wanted to keep it const, as we usually do for all function 
tables. I will use drmm_alloc for it.


-- 
With best wishes
Dmitry
