Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 352289CF53C
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 20:49:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5DDC10E8AE;
	Fri, 15 Nov 2024 19:49:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xc481kfa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 326C010E3DC
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 19:49:15 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-6e5cec98cceso8685007b3.2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 11:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731700154; x=1732304954; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=y94fAUfM+3cNhhFqsHNtgfO9Mz5/U4lZKL82t/xQEL8=;
 b=xc481kfaX2mb/Bo9XNIFOzhpo4apglR5Oucch03Th7a+O47rR/SrHonhW3XjnRCRca
 4VwzLvwF9UIiE4dsae7a/QYAqLdaLKzc+jRVINJvPjL/4oVMn9CYkfmi9rDTmXofv+45
 hLbH81ROViJFoUAm7XAmoHUo4o2XX8tIAEFAJsYhBBRfpYF+hs6wv4xjuY6bjP02tUpM
 vmFWDw1PY3JAkGuS6QqSOv6vE8iOWBVqNGk9FkPlgSVd3jmH9V7W5xe2Il8gUIxd5blR
 Gx+ZC+OcM5ZAgZizVxNL5DRMyCZtnxVdEvWSXkxZhLiVNPrek48LmPEy3cLOFpCz4PSx
 CWeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731700154; x=1732304954;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y94fAUfM+3cNhhFqsHNtgfO9Mz5/U4lZKL82t/xQEL8=;
 b=E0B1RWKU2L5rTIV2jRXTP9HKSeVt2lisrflibjcogzNEhkCk/RtdA0HbmQxdxm4aHX
 yoQ4WFq27PlcrLK9X5rrdP4WsRYrDO3VleA8r9WQl3bCwzzmMQ7S8woRXiW4VN3CALoH
 M5yEqfR6n++9rQ96kZq7FZQhNrqvfAS2UEJG60Zeiyf993Jxe2HJJJ8+ru7Hak0pSjfT
 NqMMVKSL6BPtvr3PLNuAB3pAuLGhDnLMTMb37rUBudaJcZaegPe5lACvQ8ETR7YCMUr6
 7khzvl45uXdGBi6YklmGr3nOKCzRo2DoM3bwEugOZQZOfZuXMXR5ujmpE8d0C4vwkXo2
 fQ4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVL3uWgnLr91q5en7KyNfirsg4962+IpW7DUhyBWi5HW0asFTICYafiRJE6vadBTKVNpdRQi0aUyuU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzEbAWaetTqU55ADkH8SysIAofAYXsCyjuysiufqUIW3j2bgZA
 n2cweoiJLG+WpoqmWYEvd+IvvpN0ia04a0Fz+wfadCBxCZ83LSAQEXfsY2E+UWMLivFO2isNG/L
 re6Y+swXLioDfcWi5SjR2i4Z7J9qcYlBBBUQiLg==
X-Google-Smtp-Source: AGHT+IEzAvh8fLR6Ax4JJe+zyTZnsvfTpgwuFH5OGzKisu4bE6+zEnCKOEYNIoshN2LGpyOsGJ6ZS1RXQUCkY67ASlM=
X-Received: by 2002:a05:690c:9b10:b0:6e5:d35b:ca80 with SMTP id
 00721157ae682-6ee55a2f663mr39231287b3.5.1731700154212; Fri, 15 Nov 2024
 11:49:14 -0800 (PST)
MIME-Version: 1.0
References: <20241113-adv7511-audio-info-frame-v1-1-49b368b995a5@axis.com>
 <nramdgi4pziet3ypwdi32zolnhdzualv4rpov372s4mfsakdhs@7qjro2oaef7i>
 <d7121d00-4353-2901-e87b-7fef7da5a35f@axis.com>
In-Reply-To: <d7121d00-4353-2901-e87b-7fef7da5a35f@axis.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 15 Nov 2024 21:49:03 +0200
Message-ID: <CAA8EJpqbMvevmWZ3AbQOwBbVUOkUPHB_mrv+BtLndAcpLmcVpA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: adv7511_audio: Update Audio InfoFrame properly
To: Stefan Ekenberg <stefan.ekenberg@axis.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel@axis.com
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 15 Nov 2024 at 14:25, Stefan Ekenberg <stefan.ekenberg@axis.com> wrote:
>
> On 11/15/24 09:16, Dmitry Baryshkov wrote:
> > On Wed, Nov 13, 2024 at 08:38:11AM +0100, Stefan Ekenberg wrote:
> >> AUDIO_UPDATE bit (Bit 5 of MAIN register 0x4A) needs to be set to 1
> >> while updating Audio InfoFrame information and then set to 0 when done.
> >> Otherwise partially updated Audio InfoFrames could be sent out. Two
> >> cases where this rule were not followed are fixed:
> >>   - In adv7511_hdmi_hw_params() make sure AUDIO_UPDATE bit is updated
> >>     before/after setting ADV7511_REG_AUDIO_INFOFRAME.
> >>   - In audio_startup() use the correct register for clearing
> >>     AUDIO_UPDATE bit.
> >>
> >> The problem with corrupted audio infoframes were discovered by letting
> >> a HDMI logic analyser check the output of ADV7535.
> >>
> >> Signed-off-by: Stefan Ekenberg <stefan.ekenberg@axis.com>
> >
> > Missing Fixes tag,
>
> Ok, I will add Fixes tag.
>
> >
> >> ---
> >>   drivers/gpu/drm/bridge/adv7511/adv7511_audio.c | 14 ++++++++++++--
> >>   1 file changed, 12 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
> >> index 61f4a38e7d2bf6905683cbc9e762b28ecc999d05..8f786592143b6c81e5a434768b51508d5e5f3c73 100644
> >> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
> >> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
> >> @@ -153,7 +153,16 @@ static int adv7511_hdmi_hw_params(struct device *dev, void *data,
> >>                         ADV7511_AUDIO_CFG3_LEN_MASK, len);
> >>      regmap_update_bits(adv7511->regmap, ADV7511_REG_I2C_FREQ_ID_CFG,
> >>                         ADV7511_I2C_FREQ_ID_CFG_RATE_MASK, rate << 4);
> >> -    regmap_write(adv7511->regmap, 0x73, 0x1);
> >> +
> >> +    /* send current Audio infoframe values while updating */
> >> +    regmap_update_bits(adv7511->regmap, ADV7511_REG_INFOFRAME_UPDATE,
> >> +                       BIT(5), BIT(5));
> >> +
> >> +    regmap_write(adv7511->regmap, ADV7511_REG_AUDIO_INFOFRAME(0), 0x1);
> >> +
> >> +    /* use Audio infoframe updated info */
> >> +    regmap_update_bits(adv7511->regmap, ADV7511_REG_INFOFRAME_UPDATE,
> >> +                       BIT(5), 0);
> >>
> >>      return 0;
> >>   }
> >> @@ -184,8 +193,9 @@ static int audio_startup(struct device *dev, void *data)
> >>      regmap_update_bits(adv7511->regmap, ADV7511_REG_GC(0),
> >>                              BIT(7) | BIT(6), BIT(7));
> >>      /* use Audio infoframe updated info */
> >> -    regmap_update_bits(adv7511->regmap, ADV7511_REG_GC(1),
> >> +    regmap_update_bits(adv7511->regmap, ADV7511_REG_INFOFRAME_UPDATE,
> >>                              BIT(5), 0);
> >
> > Should the REG_GC(1) still be written?
>
> The comment before this line states "use Audio infoframe updated info"
> and, before my change, bit 5 of REG_GC(1) was cleared by the line I
> removed. Bit 5 is positioned within field GC_PP[3:0] and that field
> doesn't control audio infoframe and is read-only. My conclusion
> therefore was that the author if this code actually meant to clear bit 5
> of REG_INFOFRAME_UPDATE from the very beginning. In short, clearing bit
> 5 of REG_GC(1) is invalid since it is a read-only field.

Ack, thanks for the explanation. It might be nice if you can include
this into the commit message.

>
> >
> >> +
> >>      /* enable SPDIF receiver */
> >>      if (adv7511->audio_source == ADV7511_AUDIO_SOURCE_SPDIF)
> >>              regmap_update_bits(adv7511->regmap, ADV7511_REG_AUDIO_CONFIG,
> >>
> >> ---
> >> base-commit: 59b723cd2adbac2a34fc8e12c74ae26ae45bf230
> >> change-id: 20241108-adv7511-audio-info-frame-54614dd4bf57
> >>
> >> Best regards,
> >> --
> >> Stefan Ekenberg <stefan.ekenberg@axis.com>
> >>
> >
>


-- 
With best wishes
Dmitry
