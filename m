Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C821825896
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 17:47:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A48C10E643;
	Fri,  5 Jan 2024 16:47:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3534E10E643
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 16:47:25 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-55692ad81e3so1938302a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jan 2024 08:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704473243; x=1705078043; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8GhoWygouKwNF/i+Ar+uHKGYE9ZPPakZhcuyJ3HA+yM=;
 b=joPnG3B82cXT11IgmN9PWlhh6vcrYHkzyOBTdv+Oti+NyITCaa0JxsxO6NK0Q6azal
 sTGt39P5Uds8RsJaKBhw9UD7hsFyAeGtOndlzzuvImX/gxL3H95gk/qvqWzcF9+wwtMA
 1DN8Yts0ex+Yo01otfoJs6U2is8eKCDfZqOx3ls8EZZX3vIyEVOs0LRJAsoPBP0YmST9
 u7alXIClYD4zcGcBzR2bPZCzSEgDg1YQD7eod/23t2mQjaR/uRNT9vOXKiWSI0yVc73e
 0HXhSDoD1LJ0suN6gQNxjTTDh8uDT17Gmpl9+/+orAKoG3A0hCzQqCfwGRlSWM7hlY2X
 +yjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704473243; x=1705078043;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8GhoWygouKwNF/i+Ar+uHKGYE9ZPPakZhcuyJ3HA+yM=;
 b=OT+QH0jQ8K9NJ+/IyRlcuDYr3bJF1EYKJtwYWotdgvxEAbpAEwW46hR4kAHTw5hA/j
 UPN0I9ABeSlP/8PbbidcDVjVp9MjIeGOpmt3BfkOefm/jDLgxQv9zqOTk7ZDWHO7C0Kx
 35gx2fFy/KQRjVxG7MklNvE1UjNRwXX32gteNnsny6sV/bQOMT0xjDvqQkgkJy/4p9I9
 kIA7y79Hsqqm2ndk3vAi1E1NRQSpO20yK3QbUQHTXMvRSWlYyYQ0xrBRdkLwf5K3u9Nk
 atSlagSVTsjP/FVpogWMtVN249T/IP1yWnGQ++YSfwMx1ZknJ+yZsI+z2dOaqPy9+QFB
 PQYQ==
X-Gm-Message-State: AOJu0YxZPxZCsWoNqfvArmFzbCnLU9wpWBYrnCWqiFXONs26AvqmmKr3
 vev4BpMlny9mNe0kkcPULA==
X-Google-Smtp-Source: AGHT+IEmqVeHlv3hQC7rMHa0U1jc6f1uX/xyuXiZ6rLuFGn1h9XpROfBTFyH9I651Ze1bS12LJUPyw==
X-Received: by 2002:a17:906:2853:b0:a27:a258:f340 with SMTP id
 s19-20020a170906285300b00a27a258f340mr1240311ejc.65.1704473243418; 
 Fri, 05 Jan 2024 08:47:23 -0800 (PST)
Received: from ?IPV6:2a02:810b:f40:4300:890b:36c3:934f:6f56?
 ([2a02:810b:f40:4300:890b:36c3:934f:6f56])
 by smtp.gmail.com with ESMTPSA id
 r11-20020a1709062ccb00b00a26aa845084sm1064504ejr.17.2024.01.05.08.47.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jan 2024 08:47:23 -0800 (PST)
Message-ID: <3e7aa9f2-6e37-44c3-9361-5fa7c4ef203d@gmail.com>
Date: Fri, 5 Jan 2024 17:47:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v4 00/29] Add HDMI support for RK3128
Content-Language: en-US, de-DE
To: Heiko Stuebner <heiko@sntech.de>
References: <20231222174220.55249-1-knaerzche@gmail.com>
 <170435598418.3166964.9367277671989164237.b4-ty@sntech.de>
From: Alex Bee <knaerzche@gmail.com>
In-Reply-To: <170435598418.3166964.9367277671989164237.b4-ty@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi Heiko,


Am 04.01.24 um 09:14 schrieb Heiko Stuebner:
> On Fri, 22 Dec 2023 18:41:51 +0100, Alex Bee wrote:
>> This is version 4 of my series that aims to add support for the display
>> controller (VOP) and the HDMI controller block of RK3128 (which is very
>> similar to the one found in RK3036). The original intention of this series
>> was to add support for this slightly different integration but is by now,
>> driven by maintainer's feedback, exploded to be a rework of inno-hdmi
>> driver in large parts. It is, however, a change for the better.
>>
>> [...]
> Applied, thanks!
>
> [23/29] drm/rockchip: inno_hdmi: Add variant support
>          commit: 5f2e93e6719701a91307090f8f7696fd6b3bffdf
> [24/29] drm/rockchip: inno_hdmi: Add RK3128 support
>          commit: aa54f334c291effe321aa4b9ac0e67a895fd7b58
> [25/29] drm/rockchip: inno_hdmi: Add basic mode validation
>          commit: 701029621d4141d0c9f8b81a88a37b95ec84ce65
> [26/29] drm/rockchip: inno_hdmi: Drop custom fill_modes hook
>          commit: 50a3c772bd927dd409c484832ddd9f6bf00b7389
>
>
> For reference, Rob has applied the rk3128 compatible in
> https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?id=21960bda59852ca961fcd27fba9f92750caccd06
thanks for keeping track on this.

Is there any reason the DT paches aren't merged yet? From what I can see
they should be fine to be merged in your v6.8-armsoc/dts32 branch which is
6.7-rc1 based. There was only a txt-binding at this point and it's very
likely that both the rockchip,inno-hdmi.yaml-conversion and the rk3128
additon will both land in 6.8 (they are both in linux-next). Linus' 6.8
merge-window will open earliest next week.
I'm really not pressuring here and I'm fine if they land in 6.9 - it's just
for my understanding for further submissions.

Alex

>
> Best regards,
