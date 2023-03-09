Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB916B1DAD
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 09:17:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF8AC10E16B;
	Thu,  9 Mar 2023 08:17:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C57A410E16B
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 08:17:28 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-536cb25982eso20437807b3.13
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 00:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678349848;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2l5Id5YkQHVcDPnMRyRmnfI/ab4qev+27T/LcA5p4xY=;
 b=zHNKNBYRp8ZMtYES6iOOJZdPs+/VrS4r4YOJIdMcn27ttfxXw+5AQLOM553VKzbfnu
 vLHmIOaLbVGba0VsvH1A00WV2qAWWgRg6OCdzr0CGE6bztDfQMn/g9Y5OsP9YhvR9IvQ
 MBPkKaiastTwTZvY+KgDfsVknQjxIsmsmH17UUOwZlFCPeT099gAT1AvqRLyWYGb78VF
 buB27vSGCDqka04+hzRqEy0gBl5mSK5NjjfTzm/G9U23TwZT1xq5DqboEq5enhwfaKIC
 YzzD9CYsGf0djIqiap2rDOQQywTt+nLUZAXM8IkxeeJ6AXIvCT0l3gLpZjJP6pzCZ/ff
 Vvng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678349848;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2l5Id5YkQHVcDPnMRyRmnfI/ab4qev+27T/LcA5p4xY=;
 b=VHlHmyorGMlOPqgCTHXjQCrR+y7ZJiA4U/tgiT55FPtiHDazaQyM+NMe7RFgkaAg5g
 jpuzk7asfzo3TUCHzkY34mNXJx5sMDsynyr8il92u8ij/wl/xG8lk94ePD9YyUVUcfuX
 Ynx+ZpBj22eMyfsfMjVcwoWGbTJLRJKel8P6jNs8r+Uy3blWr1eoT2W+b88nUAwq1uMh
 mN6nC0F4hu/a3QCEDnodUNntFnONKc1KTuc56u+chMnmIzFX1Pm5GYuyUt8v7dVvtxLW
 nnPnyk2+Ia++hXPMIP+SxbdnYUp/nCsYIMc0be6udYMp9U1OfclmavNzFDSjRV29l+Kq
 2SwQ==
X-Gm-Message-State: AO0yUKUGy2bCriFhXrmrvnLVbSA5Q/u7pfdBVolX0ansLjYshEoOyAkK
 yW9xQ3Y80w1POvmL8/PjymSMVVMOIRgwBJ7iNul7sw==
X-Google-Smtp-Source: AK7set9NqrT7RUuXgHnInuqDO8U0SE1ojud6SJk/FpmB3GQVriAzuG0269C9t+4xeg2JU5VBcDK6EbBkG9E/pM7QunM=
X-Received: by 2002:a81:4312:0:b0:52e:b718:24d5 with SMTP id
 q18-20020a814312000000b0052eb71824d5mr13477522ywa.9.1678349847927; Thu, 09
 Mar 2023 00:17:27 -0800 (PST)
MIME-Version: 1.0
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <CACRpkdawSQsNqKJkSSoSw3HmMHyNXFUywxkdszpTC-a_uZA+tQ@mail.gmail.com>
 <0e789778-03ca-e3cb-9c94-e8b55573894c@suse.de>
In-Reply-To: <0e789778-03ca-e3cb-9c94-e8b55573894c@suse.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 9 Mar 2023 09:17:16 +0100
Message-ID: <CACRpkdYUVBq_-iZxtoe65eh3ruUOprF_JEG-sZfUSNVhjacVLA@mail.gmail.com>
Subject: Re: [PATCH 00/22] drm/dma-helper: Add dedicated fbdev emulation
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-aspeed@lists.ozlabs.org, edmund.j.dea@intel.com,
 alexandre.torgue@foss.st.com, dri-devel@lists.freedesktop.org,
 laurent.pinchart@ideasonboard.com, anitha.chrisanthus@intel.com,
 linux-stm32@st-md-mailman.stormreply.com, jbrunet@baylibre.com,
 samuel@sholland.org, javierm@redhat.com, jernej.skrabec@gmail.com,
 linux-imx@nxp.com, alain.volmat@foss.st.com, linux-sunxi@lists.linux.dev,
 raphael.gallais-pou@foss.st.com, martin.blumenstingl@googlemail.com,
 s.hauer@pengutronix.de, laurentiu.palcu@oss.nxp.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, hyun.kwon@xilinx.com, tomba@kernel.org,
 andrew@aj.id.au, jyri.sarha@iki.fi, yannick.fertre@foss.st.com,
 philippe.cornu@foss.st.com, kernel@pengutronix.de, khilman@baylibre.com,
 shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 7, 2023 at 9:55=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
> Am 06.03.23 um 23:19 schrieb Linus Walleij:

> > 2) Why isn't this DRM driver changed?
> > drivers/gpu/drm/mcde/mcde_drv.c
> > AFAICT it also uses GEM buffers in system memory.
>
> This driver requires damage handling
> https://elixir.bootlin.com/linux/v6.2/source/drivers/gpu/drm/mcde/mcde_dr=
v.c#L97
>
> for which we have to call the framebuffer's dirty callback

Oh that one is on me ... I no longer remember exactly why I used
drm_gem_fb_create_with_dirty() but I think it was because I had the
ambition that the driver would only send out updates to DSI command
displays whenever something changed, so as to minimize traffic.

It turns out this ambition with command mode isn't working in
practice because all the MCDE does is to create a continuous stream
of DSI commands and while it is possible to send single frame
updates with it, it's not working in practice. So we are just setting
up continuous updates. We turn of the VBLANK IRQs a bit, but I
guess the DRM framework does that for us when nothing goes on.

I tested to replace this with drm_gem_fb_create and it works just
fine. I'll send out a patch so you can make this change also to the
MCDE driver.

Yours,
Linus Walleij
