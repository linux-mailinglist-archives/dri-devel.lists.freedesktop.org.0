Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCAA1AA151
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 14:46:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58D0E6E9D4;
	Wed, 15 Apr 2020 12:46:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9A4A6E9D3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 12:46:04 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id t14so5757455wrw.12
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 05:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=HL4CMR1gS/nWPdlxWM3XgPiFWUO4q+XXr+2sGU/Jcy0=;
 b=EcI1XYssAQQBvpE6ce+63x1UL40ahrxAaNgwhpoxxoPh4+b1K5dk52zgKooeKHAwba
 qUOz99SOkEPtOGU1NG1N6yxN4bOV75qHpx9CgDO4VGhe5ThFmWERoUq0cOH7U7qu7R/C
 Q0VnNHzqw3XzPnGt8mjG5OWl+yCm0GTBxQtWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=HL4CMR1gS/nWPdlxWM3XgPiFWUO4q+XXr+2sGU/Jcy0=;
 b=gPHFP4h1TxE5PZk1spBDdzv4f3RIZz+Q7xPrf7PganOtyBeQR3IsRfCIOEqsTdHPkH
 oz10UNDsgdsGn1B+1Jx+lmQnJBLoD4ckd3H4I2RgtAddz20Oi6cy0GrVNhdhSvk6FU8v
 xnpUnPtifI/MtdngR9X3K3oej3WZ3ZDBhnZM665YUqcp/RKlCxtBtzguNuFyvhG0XjPN
 o0TRXENsG+hDazvRO1BcYBC/EXrhrAT0L0Pmn2wE9+INovkpkwo1BpsKvqceoC1zIyhc
 +DuW7b7jQtbBcZXAIyRsssDZ1OGOKGXbJ+x7tLtWlkXqbcVNIlG3MaT5J+LyhyBgu+nE
 ogmQ==
X-Gm-Message-State: AGi0PuY2tEJIhOjBFNvJHCZ7myY3mTsLyggq7lzId0BiQ7YZEUe51jJN
 UaBLiPbX2LPUcVzQvny7wWpZbCXjcpA=
X-Google-Smtp-Source: APiQypKV70qPHujs63QOoEQqPabK+YMwDDUBWb3RGBt2OldSHbduIv5lkfbp46jW19E2GgiMgeWn8w==
X-Received: by 2002:adf:a509:: with SMTP id i9mr9354350wrb.20.1586954763462;
 Wed, 15 Apr 2020 05:46:03 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l5sm23334725wrm.66.2020.04.15.05.46.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 05:46:02 -0700 (PDT)
Date: Wed, 15 Apr 2020 14:46:00 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v6 00/12] ARM/MIPS: DTS: add child nodes describing the
 PVRSGX GPU present in some OMAP SoC and JZ4780 (and many more)
Message-ID: <20200415124600.GD3456981@phenom.ffwll.local>
Mail-Followup-To: "H. Nikolaus Schaller" <hns@goldelico.com>,
 Maxime Ripard <maxime@cerno.tech>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
 Tony Lindgren <tony@atomide.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Ralf Baechle <ralf@linux-mips.org>,
 Paul Burton <paulburton@kernel.org>,
 James Hogan <jhogan@kernel.org>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Philipp Rossak <embed3d@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, openpvrsgx-devgroup@letux.org,
 letux-kernel@openphoenux.org, kernel@pyra-handheld.com,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
References: <cover.1586939718.git.hns@goldelico.com>
 <20200415101008.zxzxca2vlfsefpdv@gilmour.lan>
 <2E3401F1-A106-4396-8FE6-51CAB72926A4@goldelico.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2E3401F1-A106-4396-8FE6-51CAB72926A4@goldelico.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>,
 James Hogan <jhogan@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 linux-samsung-soc@vger.kernel.org, letux-kernel@openphoenux.org,
 Paul Burton <paulburton@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Philipp Rossak <embed3d@gmail.com>, openpvrsgx-devgroup@letux.org,
 linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
 kernel@pyra-handheld.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 15, 2020 at 02:41:52PM +0200, H. Nikolaus Schaller wrote:
> Hi Maxime,
> 
> > Am 15.04.2020 um 12:10 schrieb Maxime Ripard <maxime@cerno.tech>:
> > 
> > Hi,
> > 
> > On Wed, Apr 15, 2020 at 10:35:07AM +0200, H. Nikolaus Schaller wrote:
> >> * rebased to v5.7-rc1
> >> * added DTS for for a31, a31s, a83t - by Philipp Rossak <embed3d@gmail.com>
> >> * added DTS for "samsung,s5pv210-sgx540-120" - by Jonathan Bakker <xc-racer2@live.ca>
> >> * bindings.yaml fixes:
> >>  - added a31, a31
> >>  - fixes for omap4470
> >>  - jz4780 contains an sgx540-130 and not -120
> >>  - a83t contains an sgx544-115 and not -116
> >>  - removed "additionalProperties: false" because some SoC may need additional properties
> >> 
> >> PATCH V5 2020-03-29 19:38:32:
> >> * reworked YAML bindings to pass dt_binding_check and be better grouped
> >> * rename all nodes to "gpu: gpu@<address>"
> >> * removed "img,sgx5" from example - suggested by Rob Herring <robh+dt@kernel.org>
> >> 
> >> PATCH V4 2019-12-17 19:02:11:
> >> * MIPS: DTS: jz4780: removed "img,sgx5" from bindings
> >> * YAML bindings: updated according to suggestions by Rob Herring
> >> * MIPS: DTS: jz4780: insert-sorted gpu node by register address - suggested by Paul Cercueil
> >> 
> >> PATCH V3 2019-11-24 12:40:33:
> >> * reworked YAML format with help by Rob Herring
> >> * removed .txt binding document
> >> * change compatible "ti,am335x-sgx" to "ti,am3352-sgx" - suggested by Tony Lindgren
> >> 
> >> PATCH V2 2019-11-07 12:06:17:
> >> * tried to convert bindings to YAML format - suggested by Rob Herring
> >> * added JZ4780 DTS node (proven to load the driver)
> >> * removed timer and img,cores properties until we know we really need them - suggested by Rob Herring
> >> 
> >> PATCH V1 2019-10-18 20:46:35:
> >> 
> >> This patch series defines child nodes for the SGX5xx interface inside
> >> different SoC so that a driver can be found and probed by the
> >> compatible strings and can retrieve information about the SGX revision
> >> that is included in a specific SoC. It also defines the interrupt number
> >> to be used by the SGX driver.
> >> 
> >> There is currently no mainline driver for these GPUs, but a project
> >> [1] is ongoing with the goal to get the open-source part as provided
> >> by TI/IMG and others into drivers/gpu/drm/pvrsgx.
> > 
> > Just a heads up, DRM requires an open-source user-space, so if your
> > plan is to move the open-source kernel driver while using the
> > closed-source library (as that page seem to suggest), that might
> > change a few things.
> 
> The far future goal is to arrive at a completely open implementation,
> but nobody knows how to get there. Therefore we bake smaller bread :)
> 
> step 1: get SoC integration right and stable (this is what this series is for)
> step 2: make the open source kernel driver work with closed-source libs
> step 3: write open-source replacements for user-space

step4: clean up the kernel driver
step5: get the mesa driver and kernel driver reviewed
step6: get it all merged

It's a very long road, but awesome to hear that someone is taking care of
pvrsgx. And I'm totally fine with landing stuff like you propose in step
1. Just not the driver/uapi itself.

Goog luck and have fun!

Cheers, Daniel

> 
> > 
> >> The kernel modules built from this project have successfully
> >> demonstrated to work with the DTS definitions from this patch set on
> >> AM335x BeagleBone Black, DM3730 and OMAP5 Pyra and Droid 4. They
> >> partially work on OMAP3530 and PandaBoard ES but that is likely a
> >> problem in the kernel driver or the (non-free) user-space libraries
> >> and binaries.
> >> 
> >> Wotk for JZ4780 (CI20 board) is in progress and there is potential
> >> to extend this work to e.g. BananaPi-M3 (A83) and some Intel Poulsbo
> >> and CedarView devices.
> > 
> > If it's not been tested on any Allwinner board yet, I'll leave it
> > aside until it's been properly shown to work.
> 
> Phillip has testes something on a83.
> 
> BR and thanks,
> Nikolaus

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
