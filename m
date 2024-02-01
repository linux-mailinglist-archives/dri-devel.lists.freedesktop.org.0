Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08ED6845B9E
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 16:33:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19B0910EF39;
	Thu,  1 Feb 2024 15:33:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="hlX6JaaG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4532310EF39
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Feb 2024 15:33:41 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-604191522daso10736117b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Feb 2024 07:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1706801620; x=1707406420;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9g5X/MoP2CIyVb1m6cPTMy+MK/TlLDYbdppGeENsUGg=;
 b=hlX6JaaGk5y3+bomBJMlnk+UPb++PBZl3E9uG+KmJOeEPEkzQodSTnbsoPtBBnCaPY
 XGNSylH8Xs/OEw3cHJioOtxyz/Dm+/1tcicxPleY5xctgY3DEsqF/DooMGmhyzoEGigD
 LWLiJajxiUM6B5aijVg0YOTYvzxd8iuvTvQLC5v6SfVjiihYfD8kVw3HKa01C5FNwu2x
 JIYBT0cjmu5wbhP0CpzZQS53dyrVfiy4Q1RcyGY6jZIMCGuQEVX8Vbp/gzqjmrHssMDg
 0yW+0OH3R8Cd7UUlLeIWxRtV3AyNptsgeY7mbpXJ5WuHt+kOHGJ4j0G0pN5gYQ5nQs9l
 qW4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706801620; x=1707406420;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9g5X/MoP2CIyVb1m6cPTMy+MK/TlLDYbdppGeENsUGg=;
 b=QFkZa36L2ENg0N4GvdLYsEGP9HsMyCzgR6M5pdzkvYdRzirui/mA6qSd6Od+XO2CIN
 1WNNhHqB9ro1GygZh0p9ZecwOFz9HOWYT7YtHAU8GRmMiRjYn9Kdf1oWeLHFCqtfsOjV
 Ogc8pW6EYzE4dBNlYJuLGD4C1i2TUPVhWm20+2uRVReZt/2PSBnCtdQQx+aRY0tkvubj
 D4Iqke+nQo4xnHrJ+YzHeOVlietLkwiTZNTxuCRhR3eBIUtLTaaKIV6ky1XCICzijJCl
 C6ew5F+gMEQfDzJ/LNrKqnwrNveXhJywAyUQ9NGGjNG/3SglcoD6idwh6ds0Q+Ud6i49
 1Upw==
X-Gm-Message-State: AOJu0YwmS9oC2l6hfOC53wNQjUqHSD9AejOq5bQlF99QAgp8LTgZBbSN
 DMZkHKZT5zkMW/rnsBLC+jArSwNYeOg/XzrKdelipw/n4y5JT/rdpFuk/PAOkKXq12u3sosmyqj
 FKaKCy/+NgiF4IVEZRmVTCKkgAFiBXmzzr714DA==
X-Google-Smtp-Source: AGHT+IHqiUtD2JG/xh5leeuuBCGEniE23V5uMzmzrjcmuonFmYWAx3gVWyr/EdUEfJ0Ft8FL9Z4hkCYQ/v1fUQD2kCs=
X-Received: by 2002:a81:b608:0:b0:5ff:b07b:fb0b with SMTP id
 u8-20020a81b608000000b005ffb07bfb0bmr5193403ywh.49.1706801620096; Thu, 01 Feb
 2024 07:33:40 -0800 (PST)
MIME-Version: 1.0
References: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org>
 <20231207-kms-hdmi-connector-state-v5-15-6538e19d634d@kernel.org>
 <CAPY8ntBQ+qY9441-rMzq_JAoYAaY_r+E-ADv7Wry0tJNTzKpwg@mail.gmail.com>
 <jlkoofv7nszj2uqmo2672yo4wjd3yjqarge2l2hxofixcchu6a@j72pa4iybitd>
In-Reply-To: <jlkoofv7nszj2uqmo2672yo4wjd3yjqarge2l2hxofixcchu6a@j72pa4iybitd>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 1 Feb 2024 15:33:24 +0000
Message-ID: <CAPY8ntAmXyKtebMeM7rLtgRR+QwL1H+UCwSO=bLBQN4TsgwsDg@mail.gmail.com>
Subject: Re: Re: [PATCH v5 15/44] drm/connector: hdmi: Compute bpc and format
 automatically
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Emma Anholt <emma@anholt.net>, Jonathan Corbet <corbet@lwn.net>,
 Sandy Huang <hjc@rock-chips.com>, 
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Hans Verkuil <hverkuil@xs4all.nl>, linux-rockchip@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-media@vger.kernel.org
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

Hi Maxime

On Thu, 1 Feb 2024 at 12:51, Maxime Ripard <mripard@kernel.org> wrote:
>
> On Thu, Dec 14, 2023 at 03:10:43PM +0000, Dave Stevenson wrote:
> > > +static bool
> > > +sink_supports_format_bpc(const struct drm_connector *connector,
> > > +                        const struct drm_display_info *info,
> > > +                        const struct drm_display_mode *mode,
> > > +                        unsigned int format, unsigned int bpc)
> > > +{
> > > +       struct drm_device *dev = connector->dev;
> > > +       u8 vic = drm_match_cea_mode(mode);
> > > +
> > > +       if (vic == 1 && bpc != 8) {
> > > +               drm_dbg(dev, "VIC1 requires a bpc of 8, got %u\n", bpc);
> > > +               return false;
> > > +       }
> > > +
> > > +       if (!info->is_hdmi &&
> > > +           (format != HDMI_COLORSPACE_RGB || bpc != 8)) {
> > > +               drm_dbg(dev, "DVI Monitors require an RGB output at 8 bpc\n");
> > > +               return false;
> > > +       }
> > > +
> > > +       if (!(connector->hdmi.supported_formats & BIT(format))) {
> > > +               drm_dbg(dev, "%s format unsupported by the connector.\n",
> > > +                       drm_hdmi_connector_get_output_format_name(format));
> > > +               return false;
> > > +       }
> > > +
> > > +       switch (format) {
> > > +       case HDMI_COLORSPACE_RGB:
> > > +               drm_dbg(dev, "RGB Format, checking the constraints.\n");
> > > +
> > > +               if (!(info->color_formats & DRM_COLOR_FORMAT_RGB444))
> > > +                       return false;
> >
> > We've dropped this check from vc4 in our downstream kernel as it stops
> > you using the prebaked EDIDs (eg drm.edid_firmware=edid/1024x768.bin),
> > or any other EDID that is defined as an analog monitor.
> > The EDID parsing bombs out at [1], so info->color_formats gets left at 0.
>
> Right, but it only does so if the display isn't defined as a digital display...
>
> > RGB is mandatory for both DVI and HDMI, so rejecting it seems overly fussy.
>
> ... which is required for both DVI and HDMI.
>
> And sure enough, if we decode that EDID:
>
> edid-decode (hex):
>
> 00 ff ff ff ff ff ff 00 31 d8 00 00 00 00 00 00
> 05 16 01 03 6d 23 1a 78 ea 5e c0 a4 59 4a 98 25
> 20 50 54 00 08 00 61 40 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 64 19 00 40 41 00 26 30 08 90
> 36 00 63 0a 11 00 00 18 00 00 00 ff 00 4c 69 6e
> 75 78 20 23 30 0a 20 20 20 20 00 00 00 fd 00 3b
> 3d 2f 31 07 00 0a 20 20 20 20 20 20 00 00 00 fc
> 00 4c 69 6e 75 78 20 58 47 41 0a 20 20 20 00 55
>
> ----------------
>
> Block 0, Base EDID:
>   EDID Structure Version & Revision: 1.3
>   Vendor & Product Identification:
>     Manufacturer: LNX
>     Model: 0
>     Made in: week 5 of 2012
>   Basic Display Parameters & Features:
>     Analog display
>     Signal Level Standard: 0.700 : 0.000 : 0.700 V p-p
>     Blank level equals black level
>     Sync: Separate Composite Serration
>     Maximum image size: 35 cm x 26 cm
>     Gamma: 2.20
>     DPMS levels: Standby Suspend Off
>     RGB color display
>     First detailed timing is the preferred timing
>   Color Characteristics:
>     Red  : 0.6416, 0.3486
>     Green: 0.2919, 0.5957
>     Blue : 0.1474, 0.1250
>     White: 0.3125, 0.3281
>   Established Timings I & II:
>     DMT 0x10:  1024x768    60.003840 Hz   4:3     48.363 kHz     65.000000 MHz
>   Standard Timings:
>     DMT 0x10:  1024x768    60.003840 Hz   4:3     48.363 kHz     65.000000 MHz
>   Detailed Timing Descriptors:
>     DTD 1:  1024x768    60.003840 Hz   4:3     48.363 kHz     65.000000 MHz (355 mm x 266 mm)
>                  Hfront    8 Hsync 144 Hback  168 Hpol N
>                  Vfront    3 Vsync   6 Vback   29 Vpol N
>     Display Product Serial Number: 'Linux #0'
>     Display Range Limits:
>       Monitor ranges (GTF): 59-61 Hz V, 47-49 kHz H, max dotclock 70 MHz
>     Display Product Name: 'Linux XGA'
> Checksum: 0x55
>
> ----------------
>
> Warnings:
>
> Block 0, Base EDID:
>   Detailed Timing Descriptor #1: DTD is similar but not identical to DMT 0x10.
>
> EDID conformity: PASS
>
> So, if anything, it's the EDID that needs to be updated, not the code there.

So are these EDIDs only valid for VGA outputs and another set needs to
be added for HDMI monitors?

Having drm.edid_firmware=edid/1024x768.bin works on an HDMI connector
prior to this patch, so presumably drm_edid_loader needs to
automatically switch between the existing (analog) and new (digital)
EDIDs based on the connector type? Or are you requiring users to
change the strings they use?

Cheers.
  Dave
