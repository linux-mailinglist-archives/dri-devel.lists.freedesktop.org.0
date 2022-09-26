Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DC05EA01B
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 12:34:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2437510E68C;
	Mon, 26 Sep 2022 10:34:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5921E10E692;
 Mon, 26 Sep 2022 10:34:15 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id cj27so3780111qtb.7;
 Mon, 26 Sep 2022 03:34:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=Lmh1Xq7Cw51uqBYTm5xf2C78YKt/PjveAkuJS0FQxk4=;
 b=0e2GSgKN7eTAPsI6i+5AujgSNbvhqRLBZ9y3psx2VRGTNh36lo1SX4Ig3PxZZWX3q+
 1YCILiKwF6WmH4msP0K6mH0YM2/XlN31aY30k9mr/dQWVgyGdCyW/EqaaMKrPGVQscl1
 HG00ZiupOnuC7FbyyAR6UkpjY+SmN0OBd+96/huc1N2Rh0x+hOIzs+qatOpT66C2zfCf
 qiH89tpKhzGxxTBqc0Pg58qeV99kevRdANQkKjrPvtSQGSAMP2fex/S0QcqoJn/WA96j
 F/7yW+BdHz32Wi2HNH2EC1+vUI7y8ML6m7UBNbeITc+OmfKsUjFqz1qgTmMBncHWszx+
 zBuw==
X-Gm-Message-State: ACrzQf0BPgeb5cwdSD7hbBW8UaxZQBGeA0wLyv87oYfJgcGnm5LlTLft
 QSQ7mS8dyVQCYzqqqgfwY2XhwYNE9Nj4UQ==
X-Google-Smtp-Source: AMsMyM50M6OqXRUDwTJUSCCJC4Kfv2TkR2FsENiZAyAhOAwGbsUZDS0i+m76ySyGhqu3jCiddjMa0g==
X-Received: by 2002:a05:622a:1451:b0:35c:c676:1471 with SMTP id
 v17-20020a05622a145100b0035cc6761471mr16802710qtx.634.1664188454185; 
 Mon, 26 Sep 2022 03:34:14 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com.
 [209.85.128.170]) by smtp.gmail.com with ESMTPSA id
 b4-20020ac86bc4000000b0035c1e18762csm10685719qtt.84.2022.09.26.03.34.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Sep 2022 03:34:13 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-349c4310cf7so63866947b3.3; 
 Mon, 26 Sep 2022 03:34:12 -0700 (PDT)
X-Received: by 2002:a81:758a:0:b0:345:450b:6668 with SMTP id
 q132-20020a81758a000000b00345450b6668mr19133647ywc.316.1664188452440; Mon, 26
 Sep 2022 03:34:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-10-f733a0ed9f90@cerno.tech>
 <72a8c3ce-ed03-0a77-fb92-eaa992eb86fe@suse.de>
 <20220926101716.urehomr2lzv5pqln@houat>
In-Reply-To: <20220926101716.urehomr2lzv5pqln@houat>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Sep 2022 12:34:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXonxXiw4x2PvnQ=xedOQO1y=K0O8g1+ixeSvXmzcOOVw@mail.gmail.com>
Message-ID: <CAMuHMdXonxXiw4x2PvnQ=xedOQO1y=K0O8g1+ixeSvXmzcOOVw@mail.gmail.com>
Subject: Re: [PATCH v2 10/33] drm/modes: Add a function to generate analog
 display modes
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Ben Skeggs <bskeggs@redhat.com>, linux-sunxi@lists.linux.dev,
 intel-gfx@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On Mon, Sep 26, 2022 at 12:17 PM Maxime Ripard <maxime@cerno.tech> wrote:
> On Fri, Sep 23, 2022 at 11:05:48AM +0200, Thomas Zimmermann wrote:
> > > +   /* 63.556us * 13.5MHz = 858 pixels */
> >
> > I kind of get what the comment wants to tell me, but the units don't add up.
>
> I'm not sure how it doesn't add up?
>
> We have a frequency in Hz (equivalent to s^-1) and a duration in s, so
> the result ends up with no dimension, which is to be expected for a
> number of periods?

To make the units add up, it should be 13.5 Mpixel/s
(which is what a pixel clock of 13.5 MHz really means ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
