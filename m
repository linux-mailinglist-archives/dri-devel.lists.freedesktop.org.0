Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0599DAA07
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 15:44:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9AD210EB17;
	Wed, 27 Nov 2024 14:44:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="TckfAQhN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A81EC10EB07
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2024 14:43:59 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2ffa8092e34so66655461fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2024 06:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1732718638; x=1733323438;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9YVIFse3ZChPt5rxLEsxZQnkg/jV/uGoXgcbdEaGy7I=;
 b=TckfAQhNGbk0YsuxOGFJrnw4gpf4J/W+60stlgFH8GiZQ1OHSst4CVX6PRR3S4Mw72
 vfJqNkCj0+kl4BuKh0cc3ZBWbsnOZbh7KVviVcbaQnlDdTBhauGcMXt3bDgemgIDlDL/
 0E7I3qpOVCG/Gsr284xTGkKKdj7bfjIhPDezL6t+2dzlBEpuL1DvtkaCPxJ3bxj2ZY9V
 UnO8IM4pjzdOl4V1PUHgcq9tDzLUh2PSrli5FPScf5mO8JfbvZDmifW/lcMNiCFpz4YS
 XP0LYXIYg8VbE+irvn+TJQLs7nBzLTUnQM5BOU5T7q4hrHowiAo77cPA8ECZALrGZ1u3
 UsmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732718638; x=1733323438;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9YVIFse3ZChPt5rxLEsxZQnkg/jV/uGoXgcbdEaGy7I=;
 b=jbVl3E4pxg2jT4PXxXilunAzVPfjBhTXZogdunCJbJZP9nM8LMPQrX4qg6xbm0jyIN
 Mh6SSYDWwMUuyv1PWFVIYo2JdOAkep6RGDBnltMAErmNJvTQAlyAn4Ij7WL6Pt0VEJET
 Hk6lVFpEi2XV4KKoHFSlriI9QH5zJ4hvlq8Ct2glOtbBi1HxbzH4e/Ahq8JQHg8ju+sI
 76gUbZxMyIAh4Jx5ZwfJu6sXCD89awb/q21Y+MA6lgYyisiJHBajrWiqPLi7+3T72YNr
 9UYqEXtVKy7ORgOV0aMCeBJEYNKdTWIHat+hJ4Sn/gIbM14xfK/EPazm2nRs8XJKjkir
 uzAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0ZG2Mbc7cBZ8UdM9cHczvC6ukaKcOctIBSg2cZFyE6jOJpafbQMRImq0gwzuWeY2SXz+xSGq669U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxD/Bz8i0NF3knoDIPOiAZpDN+M+XhW/C4YRWlqM+O2mxLk9UML
 G1uvZDHYhSb63nmfOH2RNOp9Vv6aBbrdnTFiCMll2tqrZv5v4TCFU1KV60Hq4ypHJvlu8VyqIg8
 Gaqwa+SlQOzs38Of/iDmWuklD5+7CneBgeKZsSg==
X-Gm-Gg: ASbGncv/P7Q21eCJrG6RZ5jeJqd0bqIWx1r3EAD/zdoQjTUlm866NsMGZQms1h1Gb6n
 yi6R/Z4I/J7bwsiAFRFIm4xxjEi0C8pE=
X-Google-Smtp-Source: AGHT+IGRc+pnEqrVmcTeiSgm588KNdJoqDkUIBr6k6jJMRMMQfn38OBTZLWXgC+yJZqrBBmbWXdkKEpuJmNNp8+huYY=
X-Received: by 2002:a2e:b8c9:0:b0:2ff:8a1b:547f with SMTP id
 38308e7fff4ca-2ffd60201f0mr16551901fa.14.1732718637613; Wed, 27 Nov 2024
 06:43:57 -0800 (PST)
MIME-Version: 1.0
References: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
 <CAPY8ntBM=34pTiQ=t-CjtYEE5Ax6D=EtiY-sLT1keUkUMXuLeA@mail.gmail.com>
 <20241122-orthodox-mantis-of-reading-2dcdcf@houat>
 <13cfb66b-f904-4720-8829-a6d9db85aaa5@broadcom.com>
In-Reply-To: <13cfb66b-f904-4720-8829-a6d9db85aaa5@broadcom.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 27 Nov 2024 14:43:38 +0000
Message-ID: <CAPY8ntD7tf6+PXKdWe8_KjCiPoemR0RQDiaHHndtjutOLGbR1w@mail.gmail.com>
Subject: Re: [PATCH 00/37] drm/vc4: Add support for BCM2712 / Pi5 display
 hardware
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Michael Turquette <mturquette@baylibre.com>, 
 Javier Martinez Canillas <javierm@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Stefan Wahren <wahrenst@gmx.net>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, Dom Cobley <popcornmix@gmail.com>
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

On Sun, 24 Nov 2024 at 17:00, Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
>
>
> On 11/22/2024 12:06 AM, Maxime Ripard wrote:
> > On Thu, Nov 21, 2024 at 03:37:00PM +0000, Dave Stevenson wrote:
> >> On Wed, 23 Oct 2024 at 17:50, Dave Stevenson
> >> <dave.stevenson@raspberrypi.com> wrote:
> >>>
> >>> This series adds the required DRM, clock, and DT changes
> >>> required to support the display hardware on Pi5.
> >>> There are a couple of minor fixes first before the main patches.
> >>>
> >>> Many of the patches were authored by Maxime whilst working
> >>> for us, however there have been a number of fixes squashed
> >>> into his original patches as issues have been found. I also
> >>> reworked the way UBM allocations are done to avoid double
> >>> buffering of the handles as they are quite a limited resource.
> >>>
> >>> There are 2 variants of the IP. Most Pi5's released to date
> >>> have used the C1 step of the SoC, whilst the 2GB Pi5 released
> >>> in August is using the D0 step, as will other boards in future.
> >>>
> >>> Due to various reasons the register map got reworked between
> >>> the steps, so there is extra code to handle the differences.
> >>> Which step is in use is read out of the hardware, so they
> >>> share a compatible string.
> >>
> >> A gentle ping on the patches for clk-raspberrypi (patches 29-33) and
> >> Broadcom DT (patches 34-36).
> >>
> >> All the DRM and dtbinding ones are reviewed or acked (thank you!).
> >
> > If the bindings and DRM patches are all merged, you can merge these at
> > least.
>
> I will be taking in the DTS patche shortly. Thanks!

Thank you Florian and Stephen.

I messed up and pinged the v1 cover note :( V2 is
https://lore.kernel.org/linux-arm-kernel/20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com/
Thank you Florian for grabbing the correct version anyway, although
there weren't any changes to the DT side anyway.

V2 includes fixing Maxime's comment on "[PATCH 31/37] clk: bcm: rpi:
Allow cpufreq driver to also adjust gpu clocks" that Stephen also
commented on.

Stephen: Sorry, maintaining newbie, particularly for clocks. I see in
linux-clk patchwork they are marked as "Awaiting Upstream". What, if
anything, do I need to do on those?

I've pushed the v2 DRM patches with dtbindings, so the clock changes
are the only ones left.

Thanks again.
  Dave

> --
> Florian
>
