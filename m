Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F7AAB183C
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 17:19:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D3910E2BE;
	Fri,  9 May 2025 15:19:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GVudo9SM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7397910E2BE
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 15:19:40 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5497mmmF019353
 for <dri-devel@lists.freedesktop.org>; Fri, 9 May 2025 15:19:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 DTdhhYB6FCC5ZtrJ/082OOPt7NU3J5IYSW/Bpjk2brs=; b=GVudo9SMBROW5p8m
 HdJcRSKDOb8lNKAXW7PcwYnh6TA3a1JEWL/K9noFutY54pjNHHBgXFB+Dj1tNXje
 8VXChvnEYop18fYt4XmxSHbGXBzYKQJSGV2Fm4PtvdlzJ/2j562Yuxv+M98Vcr88
 gyc9WpZB5Ld8mSSKJxeFqIeWmFkDB3nDyGHryE13DfwEJF6Lms0rzo2uD9/NQ+ND
 YRUWJ9E0ZW+y0kgJwy2vKLDYRlYk0muv2unr/Cr14ozmaMUXy/DKvExiTE9G/b65
 TkXLheoaLz9xsb764K4kWi5WkhrkKyPUGGf+DonBXWsT5XPQvd8DJXwt7TP2Wdcm
 tpSI/A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gsdj4hfa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 15:19:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c54e7922a1so434091985a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 08:19:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746803977; x=1747408777;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DTdhhYB6FCC5ZtrJ/082OOPt7NU3J5IYSW/Bpjk2brs=;
 b=R3uuB6gfE0N4PKOqm+xy6gPYB+vJHiCS2hi5c6OTw41zHt6NaWKBVvNZwkrHdBb1Il
 6u71fyaa0Bo5Shd6aL9Q2dnKvjtfr4xcD4P7MKO7Uja81dtIfloDJolQtDc+wzd4atSL
 hwUjOWHiD27uFalH/aGsznCex5DJ0iHtEvpPq/KjMwHOZTeNAiLuZKOrGmdViN4vw9MR
 2nCLjqgMq3LkA3KfdX34xa6LBA8DR6pHCEFiqzKrjXJnESHxrWlDxCeP4F8LyFjIC4tx
 l6wvroAm5txT1RSuA/sSsU7IyP00jluXthgfJeKoWCFET1CnsH9y60Kx9MiWcQYM64Q4
 dPBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaclygXmEl34Aj7Z3WotKl8KUxvyjBGfKdf9GDhd+SFHBWb8vLMTR8mLk5U8bXJ5QiwJZI7iOVFlg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjLgPt6znpcL4Nk7P4V3VLc0Aohzgf6zJ7sbUlukZlppDacoHc
 OPcSLRRPgFqcDf2Oz1aUvyB1VzcieAvCH1WEvHSMh6v9bcN30aY8LIt9Q3LdDrWeGIIXUw0e4WV
 MC74M5P/1ENWO1fQBkoD+HzaC8USp3gKUAhwlh0JJSqVK6vRj1qO7zJYjiQKbmwFWWsHQzfyHPF
 w=
X-Gm-Gg: ASbGnctmK6H/0wpeLPX4tHzelSAQwCfWkzquSH088AMOX150p3cREhk1LVn1z8AnPiJ
 kLT5BnuNV7uWp3bJO6eC69UhmPZtva+4jFpy4Nciy3p4HU8WsUxfeKB3uhC8AjePyBXnHDJxtWp
 mSt2r4NxvCel6g2qbqy7GlpYacFJRDnMsA/DM7WgoFqRObd8KPAURraIllkSU8jbtB0KhBd85mI
 jHr5tVkhAtjeAzgvUgq6PLXXaRv3q2HsUa+qV7jfhzGxN+t5fyZVuvnSAwyA23Eq8oD7mKarCJN
 k7FPCb6CsK15gBRQX9rh25ovan/bCtO7svDoA9Px7lKxeR9T7Ew4Z3bVka4xcjuKjD25k5IFEtI
 PsuGxEBWFKbu3BGxNCGpZCw+/vm48PhyINiBzKwpb8L0kdooi+0SOneKIFKrBoyP6
X-Received: by 2002:a05:620a:4487:b0:7c9:4d4d:206e with SMTP id
 af79cd13be357-7cd010f18edmr602682485a.6.1746803977052; 
 Fri, 09 May 2025 08:19:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxxH7nrk/AqG3hrr28OmJOlY7nRUo0lL9q5nufep0/yH/q/o1vYXrEJA392S7p+PHBN12kSQ==
X-Received: by 2002:ad4:5dcf:0:b0:6f6:33aa:258b with SMTP id
 6a1803df08f44-6f6e48222e6mr62260126d6.45.1746803965858; 
 Fri, 09 May 2025 08:19:25 -0700 (PDT)
Received: from ?IPV6:2001:14bb:a6:738a:e519:cad2:e720:53eb?
 (2001-14bb-a6-738a-e519-cad2-e720-53eb.rev.dnainternet.fi.
 [2001:14bb:a6:738a:e519:cad2:e720:53eb])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54fc645d03asm306482e87.95.2025.05.09.08.19.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 May 2025 08:19:25 -0700 (PDT)
Message-ID: <83ba11db-9a9e-48b7-afe0-9df7b5de3e85@oss.qualcomm.com>
Date: Fri, 9 May 2025 18:19:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/7] Convert inno hdmi to drm bridge
To: Andy Yan <andyshrk@163.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, hjc@rock-chips.com,
 mripard@kernel.org, neil.armstrong@linaro.org, knaerzche@gmail.com,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
References: <20250422070455.432666-1-andyshrk@163.com>
 <9503607.rMLUfLXkoz@diego>
 <nco27hnwykffzgirhocskltrkcds32tefkix23nfknf3e5m3zd@mkrrbw6kogsi>
 <1a07d69.1e47.196b2c3aa12.Coremail.andyshrk@163.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <1a07d69.1e47.196b2c3aa12.Coremail.andyshrk@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PMAP+eqC c=1 sm=1 tr=0 ts=681e1d0b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=s8YR1HE3AAAA:8 a=U4mCzpOltDhEmR4TI6sA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDE1MSBTYWx0ZWRfX2zViplFnv1rK
 xRLi5np4jQhI5IvSBG7akkBgRPNJjI2vcNpkZbskmSLt7NG/z6YaPHhTm/uVnjUrjFOopm0zSt5
 g0hsWVV+VE3qo1t3mSsUk7x1urIK8hqzD+tQlJIMUCtF9gfjSJD/8k9z5jFdK1qxH2qUVTwXbGb
 YjKesveSllMGCUlz62oJpPBeamSZtOCcVOL0QcKtbJ4NkFY2PTshdVaQtJATN9yPYeB/Q4KUyzh
 c04fAp9KZREu4rOxK909JMlqwGGKUrjA+kywpyq0Uh9Uk+dzlBjMwNMz9obknuwlImllwgOuEVI
 Ouo263/XZLqcY8AVQINT5OOIkCFBQHYo3ZapPxQUIE/FT71iPIhaSAY3rZPUnv0u2g4o2fo/ua+
 zuTaTAx9HzSHtV1gAGxkUWg/Q528ktEzyQPQ7NxIZ+03MPAGJDVquu3HEGveqIIjpNtA5eOL
X-Proofpoint-GUID: Kn4PvxyZfiKRe604Olv-anCOKMcEKDh_
X-Proofpoint-ORIG-GUID: Kn4PvxyZfiKRe604Olv-anCOKMcEKDh_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_06,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 mlxscore=0 suspectscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 malwarescore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090151
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

On 09/05/2025 04:58, Andy Yan wrote:
> 
> Hi Dmitry,
> 
>   Thanks for you review.
> 
> 在 2025-05-05 00:16:35，"Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com> 写道：
>> On Sat, May 03, 2025 at 04:42:04PM +0200, Heiko Stübner wrote:
>>> Am Dienstag, 22. April 2025, 09:04:39 Mitteleuropäische Sommerzeit schrieb Andy Yan:
>>>> From: Andy Yan <andy.yan@rock-chips.com>
>>>>
>>>> When preparing to convert the current inno hdmi driver into a
>>>> bridge driver, I found that there are several issues currently
>>>> existing with it:
>>>>
>>>> 1. When the system starts up, the first time it reads the EDID, it
>>>>     will fail. This is because RK3036 HDMI DDC bus requires it's PHY's
>>>>     reference clock to be enabled first before normal DDC communication
>>>>     can be carried out.
>>>>
>>>> 2. The signal is unstable. When running the glmark2 test on the screen,
>>>>     there is a small probability of seeing some screen flickering.
>>>>     This is because The HSYNC/VSYNC polarity of rk3036 HDMI are controlled
>>>>     by GRF. This part is missing in the current driver.
>>>>
>>>> PATCH 1~6 are try to Fix Document in the dt-binding, then add the
>>>> missing part in driver and dts.
>>>> PATCH 7 converts the curren driver to drm bridge mode.
>>>
>>> After resurrecting my rk3036-kylin which hasn't sucessfully booted in a
>>> while, I could veryify this series, so on a rk3036-kylin
>>>
>>> Tested-by: Heiko Stuebner <heiko@sntech.de>
>>>
>>>
>>> I'll probably apply patches 1-4 to drm-misc later today, as that solely
>>> touches the Rockchip (and only rk3036-)side and patches 5+6 to the
>>> rockchip tree.
>>>
>>> Patch 7 should probably get some attention by people more familiar with
>>> drm-bridges, so I'll let that sit for a bit longer.
>>
>> I will take a look later, but on the first glance it looks like there
>> are too many things going on in that patch, including some unnecessary
>> fnction movements and define movements, etc. I would kindly ask to split
> 
> These registers were initially defined in a separate header file(inno_hdmi.h),
> but they were only used by a single C file, so I think it's not necessary to put
> them in a separate header file. I decided to simply merge them into the inno_hdmi.c file.
> If I first create a patch and separately carry out the merging of this register definition, would that be possible?

Yes, just create a separate commit, folding the header into the source file.

> 
> And I will try to avoid function movements in next version.
> 
> 
>> the non-functional refactorings and the functional ones (splitting to a
>> library, etc).
> 
> Will do in next version.
> 
>>
>>>
>>>
>>> Thanks a lot for working on all this
>>> Heiko
>>>
>>>
>>
>> -- 
>> With best wishes
>> Dmitry


-- 
With best wishes
Dmitry
