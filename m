Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5162AA89F05
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 15:10:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9A5F10E784;
	Tue, 15 Apr 2025 13:10:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="gDatSwNK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D396F10E784
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 13:10:42 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43d0618746bso42900935e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 06:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744722640; x=1745327440;
 darn=lists.freedesktop.org; 
 h=mime-version:message-id:date:user-agent:references:in-reply-to
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zs7KnnfZKLyJy3tHcV0Bgj/q4jqUjfal2AfLl4HBPO0=;
 b=gDatSwNK0sMUFuc6hoG4yERq41SvnATNnv7slfwu4ellu/0PnZHx5OI1eQwgdY+ewO
 E/DcLQgR/LOTJZjvCTI872MnC/VWOehjOG6H/lYxXMUhPeMYeWsSKtEnMt842SDpxt5T
 nEbKucJ4QhJTymfwf5BtHzoNrESyv+XbOIm/0g1M7Ande7OFMmerxOm33SR81gfqOgfU
 bOuDsvQs0tPm9ZOeP2pVcmoaYsndo/f2h163JKkwk1uhdVRz7oedqS/op0Ilk7Cg6SrB
 PNF2gHA11go/kahg7+fXRsQTGn/5vS8i7SNAoNoND/04/BEWT6XxAZ3NLPAtH30Z62DY
 EbuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744722640; x=1745327440;
 h=mime-version:message-id:date:user-agent:references:in-reply-to
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zs7KnnfZKLyJy3tHcV0Bgj/q4jqUjfal2AfLl4HBPO0=;
 b=NCUvn1BlecNF+OHvIaudP6rdmsFzu0ldFKdVv/PKGjPKC1csPwokRgF8c3XDwDKkD1
 LnewZGv5VHJmbaAREyYOXz77NyvXPX0Qk/wY96+4YZssGfxkWDdfjo2WUpKljMHF5Ay1
 x3TV/l40SrJcA8m90sEWauXsS50ttCZENwPIc8I9lRdrhbJeRAwWpYTXQNIrIw31k8eG
 f/A8MJ1g2+mslImjLizkaDQSUYQXHjyBSWK37Q5dxOeaDcG8afv9CcUsNjc8YspYPvpd
 YZs2bFAsJudmLEHnxLDIzdSdcR28blw/3n95w8Q9pUlqbjMgt7wJjC/c4eYLobQO1Jqh
 mB7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuRu/Z2/UaF4c5H8iYRkEs9qtv//qLipYk/l1q/LH3q8uNH1K+sRBHX24xaMLNx78kZfEFKLTdnkM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsEOAbgER9ouGSmm2o8W8GLMc5JUWiS3GohLGH+6NmIXYXhBDj
 g4j/dJm0MxwPHuqccDSOo1aRnFySRHV2hZanP8XaQZc/tvABr5Y4YCV6gs+QPl4=
X-Gm-Gg: ASbGncsaiKMIdgZLRimX52F7FgPIlQt2K71MYGDNOa+ZsCjNOVDAx4dZwBHedIfh3UU
 +ktjGz81lcptVsJnRdkg6iK3RUO+zaqOsdJwc5w0GZPGCaS2yYP8n1uyQfe13J5Z2KlL36+3ZAr
 GN0Yhh9cNhR4kT/BMgPvlB6WrTsPg99Cd/LyX5vleaBrUt2uDndr8ea4powA+Yxhjlt2KgJGWqN
 JMELhy5k7HN+/Rx0cUBB+FfG3bWNqUctqyWeMXoBQY7QvvguP+3OKyiuta5tjuvKyFtlzN+0Duw
 Pnwuo74lVysBI8vMvPTeJsCBbdVcDQTwnw818Y8=
X-Google-Smtp-Source: AGHT+IGLzdEuk1QDPXYsF98Ye9BX9xDuqaq1bbiDW34OCl+7dp6Go4ivXszBVPBh1MuXNgGiw13DfA==
X-Received: by 2002:a7b:ce16:0:b0:43c:fabf:9146 with SMTP id
 5b1f17b1804b1-43f4aafa80dmr77256645e9.17.1744722640535; 
 Tue, 15 Apr 2025 06:10:40 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:357f:4855:d5d:eccb])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-43f233a2c46sm208119145e9.13.2025.04.15.06.10.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 06:10:39 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dave Ertman <david.m.ertman@intel.com>,  Ira Weiny
 <ira.weiny@intel.com>,  "Rafael J. Wysocki" <rafael@kernel.org>,  Stephen
 Boyd <sboyd@kernel.org>,  Arnd Bergmann <arnd@arndb.de>,  Danilo Krummrich
 <dakr@kernel.org>,  Conor Dooley <conor.dooley@microchip.com>,  Daire
 McNamara <daire.mcnamara@microchip.com>,  Philipp Zabel
 <p.zabel@pengutronix.de>,  Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Robert Foss <rfoss@kernel.org>,  Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman
 <jonas@kwiboo.se>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>,  David
 Airlie <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Hans de
 Goede <hdegoede@redhat.com>,  Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,  Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>,  Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>,  Gregory CLEMENT
 <gregory.clement@bootlin.com>,  =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
 Michael Turquette <mturquette@baylibre.com>,  Abel Vesa
 <abelvesa@kernel.org>,  Peng Fan <peng.fan@nxp.com>,  Shawn Guo
 <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,  Fabio Estevam
 <festevam@gmail.com>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org,  platform-driver-x86@vger.kernel.org,
 linux-mips@vger.kernel.org,  linux-clk@vger.kernel.org,
 imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v4 1/8] driver core: auxiliary bus: add device creation
 helpers
In-Reply-To: <2025041508-remix-plasma-cd47@gregkh> (Greg Kroah-Hartman's
 message of "Tue, 15 Apr 2025 14:59:30 +0200")
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
 <20250218-aux-device-create-helper-v4-1-c3d7dfdea2e6@baylibre.com>
 <2025021938-swan-facedown-e96a@gregkh>
 <1jecxtwpr4.fsf@starbuckisacylon.baylibre.com>
 <2025041508-remix-plasma-cd47@gregkh>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 15 Apr 2025 15:10:38 +0200
Message-ID: <1j8qo1woxd.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue 15 Apr 2025 at 14:59, Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> On Tue, Apr 15, 2025 at 02:52:47PM +0200, Jerome Brunet wrote:
>> On Wed 19 Feb 2025 at 15:20, Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
>> 
>> > On Tue, Feb 18, 2025 at 08:29:46PM +0100, Jerome Brunet wrote:
>> >> Add helper functions to create a device on the auxiliary bus.
>> >> 
>> >> This is meant for fairly simple usage of the auxiliary bus, to avoid having
>> >> the same code repeated in the different drivers.
>> >> 
>> >> Suggested-by: Stephen Boyd <sboyd@kernel.org>
>> >> Cc: Arnd Bergmann <arnd@arndb.de>
>> >> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> >
>> > Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> 
>> Hey Greg,
>> 
>> Do you need me to do something else on this topic ?
>
> I don't know what tree it is going through, do you?  If you want me to
> take in the driver-core tree, just let me know.

For patch #1, I think driver-core would be appropriate, unless there is
something more specific for the auxiliary device support ?

I'll wait for this sink into an rc1, then resubmit the different driver
changes to the appropriate tree, no rush.

>
> thanks,
>
> greg k-h

-- 
Jerome
