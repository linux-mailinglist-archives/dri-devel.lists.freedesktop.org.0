Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9E4825918
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 18:33:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1941910E051;
	Fri,  5 Jan 2024 17:33:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3696A10E656
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 17:33:37 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a27e323fdd3so190827366b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jan 2024 09:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704476015; x=1705080815; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fvRwdXp7STtyfwmA3TQz9ECnNAh+xTP7eSbKgSeWVxM=;
 b=GWBto38Nc1T6AB+ehhDS3CpJtne/pMF16XoxDIOGeRrwPHCtlUsBQyYapuCPIg9UaW
 5GptprCIcTb0OB8XqFrLTvysUapGv740xYykGrPpw7dc44OGmTzFcVa16UKYa8Iy6dT8
 Pk/nVV/hetlybbNaIL1uq7Rx36ifXzCSsvxtk4XY0zoTPCplHrUj2yLtnNUP/5I8p6m0
 HT3XHGCTSKjuORL6VPzlTobA/bgB9GHCYEQehMZSPLmw9qDYUsFX4sPcrgjKIuvjBKe8
 mj4vGaVjUEy75Oh1Dn3FkdHuH+OLueKj7+gM2mx6YGv4KMk+zAb5EGUEjuh8R+IRua2z
 cUvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704476015; x=1705080815;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fvRwdXp7STtyfwmA3TQz9ECnNAh+xTP7eSbKgSeWVxM=;
 b=Vus5m4uiAnAb9GSBAo+cz9h72CCTZNZCqKfQWSEJbfph69fddtHubuNR3eDdwrtY8a
 leczBhCRymsLJQwWbjvFd/0bic5UNZU0f43JCxmFbNiqW0SwOvwq4aCx7ZuGRrv4fUg7
 TKAGx1QzVRILtPOAgrX1kHePtzFPPfccV6h2dmF/LpbVeLGF04peHjumB7DIF8y9TKdl
 Qdi6bdU2bUM5cAh/1xXyS7aF2bRfgsJVwkKDvNoX3hTTYmEcu5YxtdEsPSTcw6+mi1Gq
 PzAGWDM313Yhj0R13soS2YGh8epqskPPocPYcgAN/hnosG41gd5wne4aDiZ+fHsOILLb
 NRiw==
X-Gm-Message-State: AOJu0YyucnI4F/MsYzzB1U4aeu5O7KouLr7R+YGHJRCqsjXd9+hUyzyM
 PXMV5yb+qs6wcH4GokeJ3g==
X-Google-Smtp-Source: AGHT+IG2qdAwRrF2BoWjNp5Yp1uIidtzoXmQan0J2+VlX6wkeQ0tdJCag6miAoGA8iKd/ZQLd4emvg==
X-Received: by 2002:a17:906:4116:b0:a29:1648:6030 with SMTP id
 j22-20020a170906411600b00a2916486030mr771950ejk.86.1704476015535; 
 Fri, 05 Jan 2024 09:33:35 -0800 (PST)
Received: from ?IPV6:2a02:810b:f40:4300:890b:36c3:934f:6f56?
 ([2a02:810b:f40:4300:890b:36c3:934f:6f56])
 by smtp.gmail.com with ESMTPSA id
 h24-20020a17090791d800b00a235b01886dsm1102895ejz.10.2024.01.05.09.33.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jan 2024 09:33:35 -0800 (PST)
Message-ID: <31af9449-67df-4a1d-942c-60405f653409@gmail.com>
Date: Fri, 5 Jan 2024 18:33:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v4 00/29] Add HDMI support for RK3128
Content-Language: en-US, de-DE
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
References: <20231222174220.55249-1-knaerzche@gmail.com>
 <170435598418.3166964.9367277671989164237.b4-ty@sntech.de>
 <3e7aa9f2-6e37-44c3-9361-5fa7c4ef203d@gmail.com> <2568547.3Lj2Plt8kZ@diego>
From: Alex Bee <knaerzche@gmail.com>
In-Reply-To: <2568547.3Lj2Plt8kZ@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sandy Huang <hjc@rock-chips.com>, linux-rockchip@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Am 05.01.24 um 18:02 schrieb Heiko Stübner:
> Am Freitag, 5. Januar 2024, 17:47:21 CET schrieb Alex Bee:
>> Hi Heiko,
>>
>>
>> Am 04.01.24 um 09:14 schrieb Heiko Stuebner:
>>> On Fri, 22 Dec 2023 18:41:51 +0100, Alex Bee wrote:
>>>> This is version 4 of my series that aims to add support for the display
>>>> controller (VOP) and the HDMI controller block of RK3128 (which is very
>>>> similar to the one found in RK3036). The original intention of this series
>>>> was to add support for this slightly different integration but is by now,
>>>> driven by maintainer's feedback, exploded to be a rework of inno-hdmi
>>>> driver in large parts. It is, however, a change for the better.
>>>>
>>>> [...]
>>> Applied, thanks!
>>>
>>> [23/29] drm/rockchip: inno_hdmi: Add variant support
>>>           commit: 5f2e93e6719701a91307090f8f7696fd6b3bffdf
>>> [24/29] drm/rockchip: inno_hdmi: Add RK3128 support
>>>           commit: aa54f334c291effe321aa4b9ac0e67a895fd7b58
>>> [25/29] drm/rockchip: inno_hdmi: Add basic mode validation
>>>           commit: 701029621d4141d0c9f8b81a88a37b95ec84ce65
>>> [26/29] drm/rockchip: inno_hdmi: Drop custom fill_modes hook
>>>           commit: 50a3c772bd927dd409c484832ddd9f6bf00b7389
>>>
>>>
>>> For reference, Rob has applied the rk3128 compatible in
>>> https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?id=21960bda59852ca961fcd27fba9f92750caccd06
>> thanks for keeping track on this.
>>
>> Is there any reason the DT paches aren't merged yet? From what I can see
>> they should be fine to be merged in your v6.8-armsoc/dts32 branch which is
>> 6.7-rc1 based. There was only a txt-binding at this point and it's very
>> likely that both the rockchip,inno-hdmi.yaml-conversion and the rk3128
>> additon will both land in 6.8 (they are both in linux-next). Linus' 6.8
>> merge-window will open earliest next week.
> Exactly ... and the arm subarchitectures (Rockchip, etc) feed into the
> more generic soc-tree[0]  and from there in a set of pull requests.
>
> Normally everything needs to go to the soc tree before -rc7 .
> With the whole xmas stuff, I sent some stragglers in a second pull
> request on monday, but that was already before Rob applied the
> binding on tuesday.
>
> So 6.8 devicetree stuff is essentially done and the dts patches
> from this series will go in to 6.9 .
>
>
> Hope that explains things a bit :-)
I assumed (for some reason) that sub-architecture maintainers are allowed
to send PRs to the respective upper tree until the merge window opens and
"all the rest" is done within this  ~2 weeks.
Thanks for explaining.

Alex
> Heiko
>
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/
>
>> I'm really not pressuring here and I'm fine if they land in 6.9 - it's just
>> for my understanding for further submissions.
>>
>> Alex
>>
>>> Best regards,
>
>
>
