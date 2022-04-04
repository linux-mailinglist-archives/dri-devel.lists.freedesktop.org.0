Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9375C4F1931
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 18:11:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B930810E561;
	Mon,  4 Apr 2022 16:11:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1312510E561
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 16:11:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2E43160BC3
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 16:11:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91CFBC2BBE4
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 16:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649088676;
 bh=g1nATVvrfRA9UAWKcn8TEmGbzT1FkE4IRDRHu7qz7aY=;
 h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
 b=VSwR8cvth3rhQoDHXpPFJOTOxqEMHXQlSUTLUXb6RU4wYcgV0/JdJTLvfUj+2GHvt
 DH9Z/OFmu4v3KNmFPlfRokAjww5feArkOCxkKzSAtIlwEdW/MPKcdUhxU5pC4f0WMR
 oDYrDEEzr6HfdW8z9VvnabvqiUuTBQqNyblE/ngmsW27V/1IfZPTW6V8gV5nNyY3vn
 2jl4u5TdOtN8U3UnSPCjJBl+8KZJ/izn2Yg6xTdxx7vorsB8uoS9taApuSBSjWpMHa
 kTxb3m+TgOLzQXTk7xka6axCXQRtEXwjdnxPtAHSfOB4c9S6rjWOKQeDZodyzVz9ys
 qiCFE3gOxbjNw==
Received: by mail-vk1-f171.google.com with SMTP id j204so5071146vkj.8
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Apr 2022 09:11:16 -0700 (PDT)
X-Gm-Message-State: AOAM532jjRh0FsNrn4H/arFGE9tY4qzecZijfbtsvc9IEcAFFWm586Gr
 tyBk9kFNMYNhZEobI/iWBqtThEJfoub7ZP9CH/Q=
X-Google-Smtp-Source: ABdhPJw9D7xPURqCUzoTlu6KIHOEiOsweC/UpZ/sYIxrlCQYGzUkCyEMyxVMLWLuRCg1LkZf9inwiirxn0cn5uiwIiU=
X-Received: by 2002:a1f:6a82:0:b0:33f:7eeb:5989 with SMTP id
 f124-20020a1f6a82000000b0033f7eeb5989mr276390vkc.29.1649088675514; Mon, 04
 Apr 2022 09:11:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220330190846.13997-1-wens@kernel.org>
 <20220330190846.13997-3-wens@kernel.org>
 <CABxcv==csvqsxM46ce2LecDh4E-UxxD2DG+3E-hCFoyrdtRv7A@mail.gmail.com>
 <CAGb2v64VQPjan=EUkd8UhRZfV0g1GqBwPqhxQakS=7YhgvVDQA@mail.gmail.com>
 <92a46ea2-e23e-b7c8-ea5f-35d458ee1b76@redhat.com>
In-Reply-To: <92a46ea2-e23e-b7c8-ea5f-35d458ee1b76@redhat.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 5 Apr 2022 00:11:05 +0800
X-Gmail-Original-Message-ID: <CAGb2v66zj4x7zx4ht+6ojjKRxEe+M4bTc_mKRgf8wd_TK+Wf4g@mail.gmail.com>
Message-ID: <CAGb2v66zj4x7zx4ht+6ojjKRxEe+M4bTc_mKRgf8wd_TK+Wf4g@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: display: ssd1307fb: Add entry for SINO
 WEALTH SH1106
To: Javier Martinez Canillas <javierm@redhat.com>
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
Reply-To: wens@kernel.org
Cc: devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Linux Kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javier@dowhile0.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 4, 2022 at 11:48 PM Javier Martinez Canillas
<javierm@redhat.com> wrote:
>
> Hello Chen-Yu,
>
> On 4/4/22 17:06, Chen-Yu Tsai wrote:
>
> [snip]
>
> >>>      enum:
> >>> +      - sinowealth,sh1106-i2c
> >>
> >> I like that you didn't include a "fb" suffix for this, the existing
> >> ones are cargo culting from the previous fbdev driver to make existing
> >> DTBs compatible with the DRM driver.
> >>
> >> I've been thinking if I should post a patch to compatible strings
> >> without the "fb" and mark the current ones as deprecated...
> >>
> >> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> >
> > I also thought about dropping the "-i2c" suffix, but then thought
> > there might be a case where someone wanted to search the device
> > tree specifically for an I2C connected node using said compatible
> > string.
> >
> > What do you think?
> >
> >
>
> tl; dr: unfortunately we can't do it due how SPI and I2C report module
> aliases. Otherwise module auto loading will not work. I wrote a much
> longer explanation with some details not so long ago:
>
> https://patchwork.kernel.org/project/dri-devel/patch/20220209091204.2513437-1-javierm@redhat.com/#24730793

Right. I think that crossed my mind at some point, but didn't stick.
Thanks for raising it again. :)

> BTW, I bought a SSD1306 SPI controller and go it working this weekend.
>
> I plan to post the patches once yours land, to avoid in-flight series
> that may conflict. And what I did is mark the -fb as deprecated, then
> added "ssd130x-i2c" and "ssd130x-spi" compatibles strings.
>
> The WIP patches can be found here in case you are interested:
>
> https://github.com/martinezjavier/linux/tree/drm-ssd130x-spi

I took a quick look and a couple things stood out:

1. Would 3-wire SPI ever be considered? If so, might want to
   rename some of variables/functions as *_spi_4wire_* to
   begin with.

2. Maybe we should move the ssd130x_deviceinfo stuff into the
   core module, and define an enum to use for matching compatible
   strings across the modules to their respective device info
   entries? FYI we are doing this in drivers/mfd/axp20x* .

I think a friend of mine has a SPI based SH1106 module that I
could borrow and test/work on, but that's a big if.


Regards
ChenYu
