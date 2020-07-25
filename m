Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DF622DFE3
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 17:03:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C933C89F69;
	Sun, 26 Jul 2020 15:02:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F32A6E2A8
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jul 2020 18:48:07 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id by13so9266241edb.11
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jul 2020 11:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=J+Mg8FrXjOOpUXGKNdsJwjOwj3SmjqQEXToX5OfPGgg=;
 b=Jj8V+g5CBjwKufxhqOSZQdk2PR87G5SB1sP1DxTgqrtzTDOs8t/xRSGVc+9lryMSOJ
 y4joCsPIsVUq/BwYFV66ROD1qHkeAkKgjdH+jfI+ggX0b2/rnlVIEvBxe37AdYJM22P3
 93Toaxn/Ubt21KRJyEjgg4y7MItquN/o/8v4Uph7novYd2edC3zum9nhW2cGg24VUtIy
 k6ZXZsZJkho8Hi8WasP+nD0R/DZNHS1odz0qs9BKi2btJ1oq6rnE0cdM23UK0T99lTZM
 zd1i3sr7/xb0npgogbHiP3CtKnembKl8P3E/DGbD1iKgc9UnoSkRLxWgxR+3qy5dwz6a
 DaOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=J+Mg8FrXjOOpUXGKNdsJwjOwj3SmjqQEXToX5OfPGgg=;
 b=ZLvXQNvZQHo5u7tVX41ZSAWAicTnRN2p3jiPeYGnF+cp7afOthi6FpvWbJtp3ArJ2J
 /3i49D3QW75FeDq5S40QFfyQAHsraThHy94JWoigNykOOlGc9ww2EHdYrhuksgHjeW4o
 OjZVc5KvRXdWISx7tAK8EaePK3IkymjMhg1god9Wh2sb55pT6LzeD0LCLYO+euXbzpZz
 Sf2bIWgPYaticQ9Wfv+8fO6QkKTj6+k6eAtWa6/vjZECxodYuOqu0x/Ga/gct0X/VT/9
 a/3wGLhp+FkuO9evk5dNQampdjYiAqQMCdWt0dkZK+gytrZoQR810Vw1GkRXpV5cufEm
 v6yg==
X-Gm-Message-State: AOAM533Rj2F8MO1LSxGFydb1FDr4N1WsqNnxeJuBh4gG2GcZZuyy2eaN
 gLz4u+Pw9owrq5YzEWK00XlpRAvTJA==
X-Google-Smtp-Source: ABdhPJy2GWv6Wb+FYd0PBNz124ebLOiMzSnYouKGt+VDudPTH3Gt0GRTzt2LTf9Q2y8OnTLrsPEzQQ==
X-Received: by 2002:a50:bf07:: with SMTP id f7mr6053745edk.356.1595702885977; 
 Sat, 25 Jul 2020 11:48:05 -0700 (PDT)
Received: from [192.168.200.34] (ip5b436a54.dynamic.kabel-deutschland.de.
 [91.67.106.84])
 by smtp.gmail.com with ESMTPSA id i2sm3612187edk.30.2020.07.25.11.48.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Jul 2020 11:48:05 -0700 (PDT)
Subject: Re: [PATCH v2 0/5] drm: rockchip: various ports for older VOPs
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200722181332.26995-1-knaerzche@gmail.com>
 <CAKMK7uGKyYea_9MamAQw2=ebjW=raYCDeFCf_5jyyJPHL9AZWA@mail.gmail.com>
 <47599ce1-2a3b-87eb-c46e-8f7f79ca945e@gmail.com>
 <CAKMK7uEn0552JuTuwpL-XdYSVk7OA=fEsphpivS8ouE-10--Zg@mail.gmail.com>
From: Alex Bee <knaerzche@gmail.com>
Message-ID: <0e5f6e41-5fa4-2989-f4b8-89a9471db931@gmail.com>
Date: Sat, 25 Jul 2020 20:48:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uEn0552JuTuwpL-XdYSVk7OA=fEsphpivS8ouE-10--Zg@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Sun, 26 Jul 2020 15:02:44 +0000
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
Cc: David Airlie <airlied@linux.ie>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Am 25.07.20 um 17:54 schrieb Daniel Vetter:
> On Sat, Jul 25, 2020 at 3:52 PM Alex Bee <knaerzche@gmail.com> wrote:
>>
>> Am 22.07.20 um 23:43 schrieb Daniel Vetter:
>>> On Wed, Jul 22, 2020 at 8:13 PM Alex Bee <knaerzche@gmail.com> wrote:
>>>> Hi,
>>>>
>>>> this series mainly ports existining functionality to older SoCs - most
>>>> importantly enables alpha blending for RK3036, RK3066, RK3126 and
>>>> RK3188.
>>>> Besides that, it also changes the window type from DRM_PLANE_TYPE_CURSOR
>>>> to DRM_PLANE_TYPE_OVERLAY for VOPs that have only one (1) overlay window.
>>> This doesn't make much sense, the cursor overlay is really just a hint
>>> for legacy ioctls that this is the overlay that should be used for
>>> cursors. Compositors should try to use such planes as full overlays
>>> (if they don't want to use them as a cursor). So sounds like a case of
>>> "fix your compositor".
>> I agree here - but: If HWC windows would have been implemented in this
>> particular driver, their max size would be 128x128 on some SoCs - so
>> they woudn't be really suitable to create an OSD overlay at 4K, for
>> example. I don't know, but I guess other vendors implement their HWC
>> windows on this reduced HW resources as well. I guess that is one of the
>> reasons, why userspace, which aims to be cross-plattfrom, avoids
>> DRM_PLANE_TYPE_CURSOR when its looking for an usable overlay plane. (a
>> heuristic, indeed)
> Which userspace does that?
kodi-gbm: 
https://github.com/xbmc/xbmc/blob/master/xbmc/windowing/gbm/DRMUtils.cpp#L406 

> We should fix that, not try to work around
> that in all the drivers in upstream, that wont work.
You're right I'll drop this part.
> -Daniel
>
>>> For atomic there's 0 difference between a overlay or a cursor (primary
>>> plane is still treated somewhat special in the RMFB ioctl, but again
>>> that's for backwards compat reasons with existing uapi, not because
>>> the primary plane is different).
>>>
>>> What does happen though is that this breaks cursor for legacy
>>> userspace, which is probably not really what you want.
>> Indeed not.
>>
>> Beforhand I was submiiting this, I looked arround and couldn't find
>> anything which relies or even depends of a cursor window to be
>> available. Even if: as per spec only one DRM_PLANE_TYPE_PRIMARY is
>> mandatory, everything else is optional.
>>
>>> -Daniel
>>>
>>>
>>>> Regards,
>>>> Alex
>>>>
>>>> Changes in v2:
>>>> - drop not yet upstreamed dsp_data_swap from RK3188 regs
>>>> - rephrase most commit messages
>>>>
>>>> Alex Bee (5):
>>>>     drm: rockchip: add scaling for RK3036 win1
>>>>     drm: rockchip: add missing registers for RK3188
>>>>     drm: rockchip: add alpha support for RK3036, RK3066, RK3126 and RK3188
>>>>     drm: rockchip: set alpha_en to 0 if it is not used
>>>>     drm: rockchip: use overlay windows as such
>>>>
>>>>    drivers/gpu/drm/rockchip/rockchip_drm_vop.c |  1 +
>>>>    drivers/gpu/drm/rockchip/rockchip_vop_reg.c | 42 ++++++++++++++++++---
>>>>    drivers/gpu/drm/rockchip/rockchip_vop_reg.h |  1 +
>>>>    3 files changed, 38 insertions(+), 6 deletions(-)
>>>>
>>>> --
>>>> 2.17.1
>>>>
>>> --
>>> Daniel Vetter
>>> Software Engineer, Intel Corporation
>>> http://blog.ffwll.ch
>> Best Regards
>>
>
Best regards
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
