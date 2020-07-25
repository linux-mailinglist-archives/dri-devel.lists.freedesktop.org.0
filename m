Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 616AB22E001
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 17:04:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5FD789FE6;
	Sun, 26 Jul 2020 15:03:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 627E56E174
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jul 2020 13:52:38 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id q4so5722865edv.13
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jul 2020 06:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=ypjj5pTRTJCGG8++SxjYKdcYv0L6mq3Sd3wiJ6Jmy7Q=;
 b=AqWuWZ01ZIfafFnzObb2vAa1rB2DLoBdSS0ArEZ3p5K4zu9zu9IlBTcZwtgvYdqc2T
 4CDIKRlioidVKO3p3jxd/KbHzeMBvOY2U6iaT1CpJk1QpDxxuV0PTgJOp8uYYVdB2im4
 ajqqStEIsRMVSNDtUIASh9bPBKtXpyfUj3PFCj3+3VaejqN6DOdQOu7tTkzodx2J+bVw
 dPy1ZuLGlepWxQykDzVt3Xon74ilyvqvlhDwe9sqIZ/LM9PLXnfxGo/mspbHF0nhkdt7
 7SXNf0okLTxf2NzgJwIH05UH6n+uX6r6KwT9S3juUMJcUXZHKHYCyTmlVQm/lCpabky/
 LQdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ypjj5pTRTJCGG8++SxjYKdcYv0L6mq3Sd3wiJ6Jmy7Q=;
 b=TUCLciX4R0YjT2ob9BoT+LUC7Q5HNT4/plx8a8IAWjcZP8VsYlLtuBVAGGO/EkjSMc
 CO6DDSgKyOdtphWTSFH0Iyp5fNreS/QByEJwApPCdw6jlJNMgcTD9RGGctGDqIFWRPKO
 yP5FOoAzxW4W8RWpJ7BM0irwyDLyO66vXIeFM0uIEXdneAN0g9F9JxjxExXFGlrc0F8D
 cPr5yEe+fZmve5y2VsNM5UG0rYiYEHGsE/e1sH/2+dSKr7r/tsbC73Qx1KoxjoHZivr2
 6GHh3AF6ePAMiFOOM8fQSHRcZUMzV569k8eiqE6eTCQDJYNEKn2YBFZ0jLrUpLK3pfm+
 ubMg==
X-Gm-Message-State: AOAM532y1ZS7g5sHroaMq8yw934Rpgo87/t+uVUDRVXkJeTqXL6fw8qb
 EEmqu5Lw7ovYrFmEf2PoqA==
X-Google-Smtp-Source: ABdhPJwVPbbE/10wTaNlUQ+7jgUBZiCUFb1Mn8lF5I2ve12C9A0eUah4bQzroLp5+LuSwKgsGcqfnw==
X-Received: by 2002:a05:6402:2037:: with SMTP id
 ay23mr7361933edb.48.1595685156785; 
 Sat, 25 Jul 2020 06:52:36 -0700 (PDT)
Received: from [192.168.200.34] (ip5b436a54.dynamic.kabel-deutschland.de.
 [91.67.106.84])
 by smtp.gmail.com with ESMTPSA id d24sm2918549eje.21.2020.07.25.06.52.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Jul 2020 06:52:36 -0700 (PDT)
Subject: Re: [PATCH v2 0/5] drm: rockchip: various ports for older VOPs
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200722181332.26995-1-knaerzche@gmail.com>
 <CAKMK7uGKyYea_9MamAQw2=ebjW=raYCDeFCf_5jyyJPHL9AZWA@mail.gmail.com>
From: Alex Bee <knaerzche@gmail.com>
Message-ID: <47599ce1-2a3b-87eb-c46e-8f7f79ca945e@gmail.com>
Date: Sat, 25 Jul 2020 15:52:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uGKyYea_9MamAQw2=ebjW=raYCDeFCf_5jyyJPHL9AZWA@mail.gmail.com>
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


Am 22.07.20 um 23:43 schrieb Daniel Vetter:
> On Wed, Jul 22, 2020 at 8:13 PM Alex Bee <knaerzche@gmail.com> wrote:
>> Hi,
>>
>> this series mainly ports existining functionality to older SoCs - most
>> importantly enables alpha blending for RK3036, RK3066, RK3126 and
>> RK3188.
>> Besides that, it also changes the window type from DRM_PLANE_TYPE_CURSOR
>> to DRM_PLANE_TYPE_OVERLAY for VOPs that have only one (1) overlay window.
> This doesn't make much sense, the cursor overlay is really just a hint
> for legacy ioctls that this is the overlay that should be used for
> cursors. Compositors should try to use such planes as full overlays
> (if they don't want to use them as a cursor). So sounds like a case of
> "fix your compositor".
I agree here - but: If HWC windows would have been implemented in this 
particular driver, their max size would be 128x128 on some SoCs - so 
they woudn't be really suitable to create an OSD overlay at 4K, for 
example. I don't know, but I guess other vendors implement their HWC 
windows on this reduced HW resources as well. I guess that is one of the 
reasons, why userspace, which aims to be cross-plattfrom, avoids 
DRM_PLANE_TYPE_CURSOR when its looking for an usable overlay plane. (a 
heuristic, indeed)
> For atomic there's 0 difference between a overlay or a cursor (primary
> plane is still treated somewhat special in the RMFB ioctl, but again
> that's for backwards compat reasons with existing uapi, not because
> the primary plane is different).
>
> What does happen though is that this breaks cursor for legacy
> userspace, which is probably not really what you want.

Indeed not.

Beforhand I was submiiting this, I looked arround and couldn't find 
anything which relies or even depends of a cursor window to be 
available. Even if: as per spec only one DRM_PLANE_TYPE_PRIMARY is 
mandatory, everything else is optional.

> -Daniel
>
>
>> Regards,
>> Alex
>>
>> Changes in v2:
>> - drop not yet upstreamed dsp_data_swap from RK3188 regs
>> - rephrase most commit messages
>>
>> Alex Bee (5):
>>    drm: rockchip: add scaling for RK3036 win1
>>    drm: rockchip: add missing registers for RK3188
>>    drm: rockchip: add alpha support for RK3036, RK3066, RK3126 and RK3188
>>    drm: rockchip: set alpha_en to 0 if it is not used
>>    drm: rockchip: use overlay windows as such
>>
>>   drivers/gpu/drm/rockchip/rockchip_drm_vop.c |  1 +
>>   drivers/gpu/drm/rockchip/rockchip_vop_reg.c | 42 ++++++++++++++++++---
>>   drivers/gpu/drm/rockchip/rockchip_vop_reg.h |  1 +
>>   3 files changed, 38 insertions(+), 6 deletions(-)
>>
>> --
>> 2.17.1
>>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

Best Regards

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
