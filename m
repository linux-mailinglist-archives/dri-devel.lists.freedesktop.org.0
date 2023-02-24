Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0740F6A1DE2
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 16:00:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34DD810EC40;
	Fri, 24 Feb 2023 15:00:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 681EA10EC40
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 15:00:46 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id a7so8241781pfx.10
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 07:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hERXaBdrbg/kcoXnyVwjoNZvmUQJOvwdCRNcwJ2qOrY=;
 b=JzGmFBpmxid2uCtm6tJksrka7vIPdsxqSWIl8ozriR3rPinx0iXndBoNsvrKC7ATxZ
 IyXIr22AVL65D6MkHlhRgVsCBvIScfO3Yrn5P4udH9E8SwRm2YMCpEeWs1y6QnvfYWi+
 xEqYP/Lx0zRQ6jucaqhSksQv3k0YGrBFkGXa1OdW17qVCGELFBfXd8kmHBFn0VSsxZ8Z
 86Z2AdwaVYrOG6WGtiBe642Lr/HHs7DF9qpepPcH4ro3+6zm1yxLePVVSYOoX6OeT+BW
 sX7F+ncyHmIx44lJ0kzCeQVCPsF0hhTgeyrg5xuxRQ0iyVM2Zv2vsf6AEqc0ojkFTsaH
 L/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hERXaBdrbg/kcoXnyVwjoNZvmUQJOvwdCRNcwJ2qOrY=;
 b=KzXhaS7Y+GI/8vaycAY8nbkrp5U5L+uYhiAVfKXULdDhgV3vhjEiXE5vCJhJnyM8T0
 wEpDY5wdVbVTy+Oestwo/4DxrE0AbpHNGX3ETA8U6VUxPl3zRXqMjjtQoH18OzSWyWr9
 hFoDyeiVN8oey6jvGngiJwqo4J4m06Le7cb9LZ4h8EoiQL5C5CbflxXE0YkxXnz21wNU
 u2+dA6lzhwArzGCVexw64krQLg76DEeOFXylY16THqXEwLtz3J4gWtJDd52Ab6easCLr
 SIrHS/DZcGD9kS7uQqP9NFb7DMKsHO/BuOtWv5MuGf4bD57KqHmYRQx2gLGlFpeWV8BB
 4iXA==
X-Gm-Message-State: AO0yUKUv/VmERnp61GGG+44vF7Rkg5Uf997Kap3jgwDOxIaEYgYLM8hW
 Q/RwRewvx0+fcqglOsGgRVk1Tf5da0NK1ahTmvo=
X-Google-Smtp-Source: AK7set+7HR6//52GT9V8ZRM0q82UfELDR3N7F6B7l1J/o5zabN46bFB1WGHUZzqfO/jZ+87pweelqPmzE1NebSm7hiI=
X-Received: by 2002:a63:7b58:0:b0:502:d7c8:882d with SMTP id
 k24-20020a637b58000000b00502d7c8882dmr2602619pgn.3.1677250845577; Fri, 24 Feb
 2023 07:00:45 -0800 (PST)
MIME-Version: 1.0
References: <20230126144427.607098-1-jagan@amarulasolutions.com>
 <06e5423f-c022-7a1c-efe0-0f4fbab664c1@prevas.dk>
 <CAMty3ZBRDDnNdmgD5ji11SdCuOcmu3ZyBPyB28cF1aRTyxp+fg@mail.gmail.com>
 <be95e4f7-15a8-ba99-6b39-6f7f0ea71201@prevas.dk>
 <CAMty3ZBNLpV9orVRD897ZeR3Hj9RWOau07b1ZGDUoBRej=Cj-Q@mail.gmail.com>
 <31ccc974-4b01-ae47-9505-626617f07758@denx.de>
 <f6cea911-783c-f59d-503c-1576358ae7cb@prevas.dk>
 <dcc28c36-9b09-ea92-be21-665c6cbf35b3@denx.de>
 <c21ee1e2-b92e-0fad-40bf-91cae9e57f48@prevas.dk>
 <1745c43d-06b4-933b-5dbd-50add565828e@kontron.de>
 <c9dc0b2b-8850-6227-163b-85c53c5d72ef@prevas.dk>
 <b246aae9-b719-02f9-dd0f-305b74611fab@prevas.dk>
 <657fa528-ca01-0c6a-2c2b-bb7f4a95096d@kontron.de>
 <0483dc01-a6b5-89ac-3ac0-41f85405fab3@prevas.dk>
In-Reply-To: <0483dc01-a6b5-89ac-3ac0-41f85405fab3@prevas.dk>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 24 Feb 2023 09:00:34 -0600
Message-ID: <CAHCN7x+v1xpGNDu11Ks8p9vCzRz8jb+8wbVzxNbbKh6OJ7KiKQ@mail.gmail.com>
Subject: Re: [PATCH v12 00/18] drm: Add Samsung MIPI DSIM bridge
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
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
Cc: Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
 matteo.lisi@engicam.com, sw0312.kim@samsung.com, linux-imx@nxp.com,
 dri-devel@lists.freedesktop.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>, kyungmin.park@samsung.com,
 Jagan Teki <jagan@amarulasolutions.com>, andrzej.hajda@intel.com,
 m.szyprowski@samsung.com, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org, Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 24, 2023 at 8:08 AM Rasmus Villemoes
<rasmus.villemoes@prevas.dk> wrote:
>
> On 22/02/2023 11.05, Frieder Schrempf wrote:
>
> > The NXP kernel is completely different. AFAIK it uses the component
> > helpers to bundle all subdrivers from a central driver
> > (display-subsystem). This is not how the mainline approach using the
> > bridge driver interface works. So you can't compare them.
> >
> > Did you look at this extensive thread with findings from Adam?
> >
> > https://lore.kernel.org/lkml/CAHCN7xJ=N1vWVTBjArskJ59fyaLzmAGWfc0E=_iGizrDNR_Udw@mail.gmail.com/
> >
> > It is related to HDMI, but I guess a lot of things are valid for DP, too.
> >
> > Anyway, we need to get this series merged. Otherwise we can't work on
> > fixing all the other issues on top.
>
> Alright, I finally managed to get the imx8mm-dsi-v12 branch (commit
> fdde97c7d553) to work, by modifying Marek's patch for enabling the
> lcdif->mipi pipeline a little. The end result is in
> https://github.com/Villemoes/linux/tree/imx8mp-mipi . There are also a
> few cherry-picks of by-now-upstream patches to imx8mp.dtsi included.
>
> It works on our custom hardware, with the ti,sn65dsi86 mipi->eDP bridge.
>
> It does not seem to work on the imx8mp-evk with the adv7535 hdmi bridge
> daughter board, but that's probably just as much the fault of the
> adv7535 driver as anything in the SOC - it's impossible to get a real
> data sheet for that thing, and there's no end of random patches floating
> around, with the NXP kernel doing completely their own thing. So I've
> given up on getting that to work.

I have a board with an ADV7535, and for that chip to work, there needs
to be some work to do some math on the front porch, back port, and
sync timings based on the number of lanes.  I have a work-in-progress
which supports 1080p, but I was waiting for the series to get accepted
first, since it seems to work when interacting directly with DSI
displays.  I have my patch working on imx8mm, imx8mn and imx8mp.  Once
the base driver is accepted, I'll push the patch for review.

adam



>
> Rasmus
>
