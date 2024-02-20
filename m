Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0418885C2DA
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 18:39:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B761910E51C;
	Tue, 20 Feb 2024 17:39:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="TqtexMvZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E3D610E51C
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 17:39:34 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-6083cabc2f9so22652447b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 09:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1708450773; x=1709055573;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kwojRyXnb4k+PKmGjGyV7kir48vIelar6htRmYR68I0=;
 b=TqtexMvZTd4RtbkxH5Rc9TGtkEK1B+Yajeh8W9LMZZyddIxJDMrEJQvnOE3MLN1MPJ
 JHwYW2JUYwgabXCMGY256mWe7I7+D4D6t4PY3jSNqK8ru9itMUGUNvD8jh+KXeIhzEkM
 gQYqe8zKHno2+mWU9tHueRmYqIyqLGd0sR8upZP5piejp1oH9B0NT/qZua5I3CEuqzYz
 R+V7rEUFr2aeyp96q0bDHWYL/4JWRzqecPJOoys0doue2L7Geuu+BvRFlqGiWBIk+QB5
 I8tDV0RswiDTSP4izLSx6Mf9xoMRyKn5FSnWn6vK0fuLtcUOMOvx46tcAc4uA5PqGKvH
 +gkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708450773; x=1709055573;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kwojRyXnb4k+PKmGjGyV7kir48vIelar6htRmYR68I0=;
 b=DT9IBe6wV8q5IatguAWxHFyQjt1rjt8GYH0idSKZfdMj5GAdAkUtprzF/1YAs5mmbo
 7YhycBWxMGKG/bX1OhUYIPCtRu4mM6TLO6upRC16M7CLBzu/Zf0/MxOYK67by4qI6Bzj
 A9/2LYhZkc8cDYnFm29DT2FTGB7CT1zBW35OyiejKoTEKZ1bJB6YgNEpxWCyQmzyfSlM
 r4f6HRCPg0ZZjspx372atXdgwqjvzHIocx0YFAd28xN1B8nSls7ewM2VmF8p19IjR8wl
 4VUfo9w+bBu2FjmWOhQbDeDfrHRt8x7PxEPyhGIizdvZqWBBOnW0AJEl2RlpkT2kubn3
 9dYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnkQh0uSspRJIVhDZ/viwQRWK64QZeJv+x53hnllwuGlw/WKLK5Rb7F0geRg4/G3rFSNCd3aiX0wOITMXzJRhuxbXfocs4Qo9cvxP4ocBh
X-Gm-Message-State: AOJu0YyrtKGPPyj51ijeValAW49j00oaEcqfAIEXZxXKYWwkHjB/6mwl
 Q/f6dI/tcjMwrp3h9opDumD+Zr3QDXsofsRRA9f20UQRPJLFnxUgHd6o26StMGedka6WfREd+pv
 OJKNpb+gCGHmJtld5n9cUbw144gNQRBPKhsELlA==
X-Google-Smtp-Source: AGHT+IE8J6U2xK7yEEZsILuSsck8nfu3xve4hcGx44M6LMTfhi2LfWK2a02JKylSZA6dA6zPFVlwbedcdS51i/zYlU4=
X-Received: by 2002:a81:84d2:0:b0:607:57c4:6a8c with SMTP id
 u201-20020a8184d2000000b0060757c46a8cmr14485120ywf.43.1708450773360; Tue, 20
 Feb 2024 09:39:33 -0800 (PST)
MIME-Version: 1.0
References: <20240220161017.562241-1-mripard@kernel.org>
In-Reply-To: <20240220161017.562241-1-mripard@kernel.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 20 Feb 2024 17:39:16 +0000
Message-ID: <CAPY8ntDR7yQ5UY4Zy8UGi7DXOO68W2QqZFmfkUZpwUq9pjW=MQ@mail.gmail.com>
Subject: Re: [PATCH] drm/edid/firmware: Remove built-in EDIDs
To: Maxime Ripard <mripard@kernel.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>
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

On Tue, 20 Feb 2024 at 16:10, Maxime Ripard <mripard@kernel.org> wrote:
>
> The EDID firmware loading mechanism introduced a few built-in EDIDs that
> could be forced on any connector, bypassing the EDIDs it exposes.
>
> While convenient, this limited set of EDIDs doesn't take into account
> the connector type, and we can end up with an EDID that is completely
> invalid for a given connector.
>
> For example, the edid/800x600.bin file matches the following EDID:
>
>   edid-decode (hex):
>
>   00 ff ff ff ff ff ff 00 31 d8 00 00 00 00 00 00
>   05 16 01 03 6d 1b 14 78 ea 5e c0 a4 59 4a 98 25
>   20 50 54 01 00 00 45 40 01 01 01 01 01 01 01 01
>   01 01 01 01 01 01 a0 0f 20 00 31 58 1c 20 28 80
>   14 00 15 d0 10 00 00 1e 00 00 00 ff 00 4c 69 6e
>   75 78 20 23 30 0a 20 20 20 20 00 00 00 fd 00 3b
>   3d 24 26 05 00 0a 20 20 20 20 20 20 00 00 00 fc
>   00 4c 69 6e 75 78 20 53 56 47 41 0a 20 20 00 c2
>
>   ----------------
>
>   Block 0, Base EDID:
>     EDID Structure Version & Revision: 1.3
>     Vendor & Product Identification:
>       Manufacturer: LNX
>       Model: 0
>       Made in: week 5 of 2012
>     Basic Display Parameters & Features:
>       Analog display
>       Signal Level Standard: 0.700 : 0.000 : 0.700 V p-p
>       Blank level equals black level
>       Sync: Separate Composite Serration
>       Maximum image size: 27 cm x 20 cm
>       Gamma: 2.20
>       DPMS levels: Standby Suspend Off
>       RGB color display
>       First detailed timing is the preferred timing
>     Color Characteristics:
>       Red  : 0.6416, 0.3486
>       Green: 0.2919, 0.5957
>       Blue : 0.1474, 0.1250
>       White: 0.3125, 0.3281
>     Established Timings I & II:
>       DMT 0x09:   800x600    60.316541 Hz   4:3     37.879 kHz     40.000000 MHz
>     Standard Timings:
>       DMT 0x09:   800x600    60.316541 Hz   4:3     37.879 kHz     40.000000 MHz
>     Detailed Timing Descriptors:
>       DTD 1:   800x600    60.316541 Hz   4:3     37.879 kHz     40.000000 MHz (277 mm x 208 mm)
>                    Hfront   40 Hsync 128 Hback   88 Hpol P
>                    Vfront    1 Vsync   4 Vback   23 Vpol P
>       Display Product Serial Number: 'Linux #0'
>       Display Range Limits:
>         Monitor ranges (GTF): 59-61 Hz V, 36-38 kHz H, max dotclock 50 MHz
>       Display Product Name: 'Linux SVGA'
>   Checksum: 0xc2
>
> So, an analog monitor EDID. However, if the connector was an HDMI
> monitor for example, it breaks the HDMI specification that requires,
> among other things, a digital display, the VIC 1 mode and an HDMI Forum
> Vendor Specific Data Block in an CTA-861 extension.
>
> We thus end up with a completely invalid EDID, which thus might confuse
> HDMI-related code that could parse it.
>
> After some discussions on IRC, we identified mainly two ways to fix
> this:
>
>   - We can either create more EDIDs for each connector type to provide
>     a built-in EDID that matches the resolution passed in the name, and
>     still be a sensible EDID for that connector type;
>
>   - Or we can just prevent the EDID to be exposed to userspace if it's
>     built-in.
>
> Or possibly both.
>
> However, the conclusion was that maybe we just don't need the built-in
> EDIDs at all and we should just get rid of them. So here we are.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_edid_load.c | 160 +++-----------------------------

Needs to be removed from the docs too:

"The code (see drivers/gpu/drm/drm_edid_load.c) contains built-in data
sets for commonly used screen resolutions (800x600, 1024x768,
1280x1024, 1600x1200, 1680x1050, 1920x1080) as binary blobs,..."

https://github.com/torvalds/linux/blob/master/Documentation/admin-guide/edid.rst

I'm sad to see these go, but c'est la vie. Descriptions of using these
built in EDIDs abound in various tutorials, so those are all now
invalid :/

  Dave

>  1 file changed, 13 insertions(+), 147 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid_load.c b/drivers/gpu/drm/drm_edid_load.c
> index 60fcb80bce61..d1c7e8298702 100644
> --- a/drivers/gpu/drm/drm_edid_load.c
> +++ b/drivers/gpu/drm/drm_edid_load.c
> @@ -20,162 +20,28 @@
>
>  static char edid_firmware[PATH_MAX];
>  module_param_string(edid_firmware, edid_firmware, sizeof(edid_firmware), 0644);
> -MODULE_PARM_DESC(edid_firmware, "Do not probe monitor, use specified EDID blob "
> -       "from built-in data or /lib/firmware instead. ");
> -
> -#define GENERIC_EDIDS 6
> -static const char * const generic_edid_name[GENERIC_EDIDS] = {
> -       "edid/800x600.bin",
> -       "edid/1024x768.bin",
> -       "edid/1280x1024.bin",
> -       "edid/1600x1200.bin",
> -       "edid/1680x1050.bin",
> -       "edid/1920x1080.bin",
> -};
> -
> -static const u8 generic_edid[GENERIC_EDIDS][128] = {
> -       {
> -       0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00,
> -       0x31, 0xd8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -       0x05, 0x16, 0x01, 0x03, 0x6d, 0x1b, 0x14, 0x78,
> -       0xea, 0x5e, 0xc0, 0xa4, 0x59, 0x4a, 0x98, 0x25,
> -       0x20, 0x50, 0x54, 0x01, 0x00, 0x00, 0x45, 0x40,
> -       0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
> -       0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0xa0, 0x0f,
> -       0x20, 0x00, 0x31, 0x58, 0x1c, 0x20, 0x28, 0x80,
> -       0x14, 0x00, 0x15, 0xd0, 0x10, 0x00, 0x00, 0x1e,
> -       0x00, 0x00, 0x00, 0xff, 0x00, 0x4c, 0x69, 0x6e,
> -       0x75, 0x78, 0x20, 0x23, 0x30, 0x0a, 0x20, 0x20,
> -       0x20, 0x20, 0x00, 0x00, 0x00, 0xfd, 0x00, 0x3b,
> -       0x3d, 0x24, 0x26, 0x05, 0x00, 0x0a, 0x20, 0x20,
> -       0x20, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xfc,
> -       0x00, 0x4c, 0x69, 0x6e, 0x75, 0x78, 0x20, 0x53,
> -       0x56, 0x47, 0x41, 0x0a, 0x20, 0x20, 0x00, 0xc2,
> -       },
> -       {
> -       0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00,
> -       0x31, 0xd8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -       0x05, 0x16, 0x01, 0x03, 0x6d, 0x23, 0x1a, 0x78,
> -       0xea, 0x5e, 0xc0, 0xa4, 0x59, 0x4a, 0x98, 0x25,
> -       0x20, 0x50, 0x54, 0x00, 0x08, 0x00, 0x61, 0x40,
> -       0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
> -       0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x64, 0x19,
> -       0x00, 0x40, 0x41, 0x00, 0x26, 0x30, 0x08, 0x90,
> -       0x36, 0x00, 0x63, 0x0a, 0x11, 0x00, 0x00, 0x18,
> -       0x00, 0x00, 0x00, 0xff, 0x00, 0x4c, 0x69, 0x6e,
> -       0x75, 0x78, 0x20, 0x23, 0x30, 0x0a, 0x20, 0x20,
> -       0x20, 0x20, 0x00, 0x00, 0x00, 0xfd, 0x00, 0x3b,
> -       0x3d, 0x2f, 0x31, 0x07, 0x00, 0x0a, 0x20, 0x20,
> -       0x20, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xfc,
> -       0x00, 0x4c, 0x69, 0x6e, 0x75, 0x78, 0x20, 0x58,
> -       0x47, 0x41, 0x0a, 0x20, 0x20, 0x20, 0x00, 0x55,
> -       },
> -       {
> -       0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00,
> -       0x31, 0xd8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -       0x05, 0x16, 0x01, 0x03, 0x6d, 0x2c, 0x23, 0x78,
> -       0xea, 0x5e, 0xc0, 0xa4, 0x59, 0x4a, 0x98, 0x25,
> -       0x20, 0x50, 0x54, 0x00, 0x00, 0x00, 0x81, 0x80,
> -       0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
> -       0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x30, 0x2a,
> -       0x00, 0x98, 0x51, 0x00, 0x2a, 0x40, 0x30, 0x70,
> -       0x13, 0x00, 0xbc, 0x63, 0x11, 0x00, 0x00, 0x1e,
> -       0x00, 0x00, 0x00, 0xff, 0x00, 0x4c, 0x69, 0x6e,
> -       0x75, 0x78, 0x20, 0x23, 0x30, 0x0a, 0x20, 0x20,
> -       0x20, 0x20, 0x00, 0x00, 0x00, 0xfd, 0x00, 0x3b,
> -       0x3d, 0x3e, 0x40, 0x0b, 0x00, 0x0a, 0x20, 0x20,
> -       0x20, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xfc,
> -       0x00, 0x4c, 0x69, 0x6e, 0x75, 0x78, 0x20, 0x53,
> -       0x58, 0x47, 0x41, 0x0a, 0x20, 0x20, 0x00, 0xa0,
> -       },
> -       {
> -       0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00,
> -       0x31, 0xd8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -       0x05, 0x16, 0x01, 0x03, 0x6d, 0x37, 0x29, 0x78,
> -       0xea, 0x5e, 0xc0, 0xa4, 0x59, 0x4a, 0x98, 0x25,
> -       0x20, 0x50, 0x54, 0x00, 0x00, 0x00, 0xa9, 0x40,
> -       0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
> -       0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x48, 0x3f,
> -       0x40, 0x30, 0x62, 0xb0, 0x32, 0x40, 0x40, 0xc0,
> -       0x13, 0x00, 0x2b, 0xa0, 0x21, 0x00, 0x00, 0x1e,
> -       0x00, 0x00, 0x00, 0xff, 0x00, 0x4c, 0x69, 0x6e,
> -       0x75, 0x78, 0x20, 0x23, 0x30, 0x0a, 0x20, 0x20,
> -       0x20, 0x20, 0x00, 0x00, 0x00, 0xfd, 0x00, 0x3b,
> -       0x3d, 0x4a, 0x4c, 0x11, 0x00, 0x0a, 0x20, 0x20,
> -       0x20, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xfc,
> -       0x00, 0x4c, 0x69, 0x6e, 0x75, 0x78, 0x20, 0x55,
> -       0x58, 0x47, 0x41, 0x0a, 0x20, 0x20, 0x00, 0x9d,
> -       },
> -       {
> -       0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00,
> -       0x31, 0xd8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -       0x05, 0x16, 0x01, 0x03, 0x6d, 0x2b, 0x1b, 0x78,
> -       0xea, 0x5e, 0xc0, 0xa4, 0x59, 0x4a, 0x98, 0x25,
> -       0x20, 0x50, 0x54, 0x00, 0x00, 0x00, 0xb3, 0x00,
> -       0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
> -       0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x21, 0x39,
> -       0x90, 0x30, 0x62, 0x1a, 0x27, 0x40, 0x68, 0xb0,
> -       0x36, 0x00, 0xb5, 0x11, 0x11, 0x00, 0x00, 0x1e,
> -       0x00, 0x00, 0x00, 0xff, 0x00, 0x4c, 0x69, 0x6e,
> -       0x75, 0x78, 0x20, 0x23, 0x30, 0x0a, 0x20, 0x20,
> -       0x20, 0x20, 0x00, 0x00, 0x00, 0xfd, 0x00, 0x3b,
> -       0x3d, 0x40, 0x42, 0x0f, 0x00, 0x0a, 0x20, 0x20,
> -       0x20, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xfc,
> -       0x00, 0x4c, 0x69, 0x6e, 0x75, 0x78, 0x20, 0x57,
> -       0x53, 0x58, 0x47, 0x41, 0x0a, 0x20, 0x00, 0x26,
> -       },
> -       {
> -       0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00,
> -       0x31, 0xd8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -       0x05, 0x16, 0x01, 0x03, 0x6d, 0x32, 0x1c, 0x78,
> -       0xea, 0x5e, 0xc0, 0xa4, 0x59, 0x4a, 0x98, 0x25,
> -       0x20, 0x50, 0x54, 0x00, 0x00, 0x00, 0xd1, 0xc0,
> -       0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
> -       0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x02, 0x3a,
> -       0x80, 0x18, 0x71, 0x38, 0x2d, 0x40, 0x58, 0x2c,
> -       0x45, 0x00, 0xf4, 0x19, 0x11, 0x00, 0x00, 0x1e,
> -       0x00, 0x00, 0x00, 0xff, 0x00, 0x4c, 0x69, 0x6e,
> -       0x75, 0x78, 0x20, 0x23, 0x30, 0x0a, 0x20, 0x20,
> -       0x20, 0x20, 0x00, 0x00, 0x00, 0xfd, 0x00, 0x3b,
> -       0x3d, 0x42, 0x44, 0x0f, 0x00, 0x0a, 0x20, 0x20,
> -       0x20, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xfc,
> -       0x00, 0x4c, 0x69, 0x6e, 0x75, 0x78, 0x20, 0x46,
> -       0x48, 0x44, 0x0a, 0x20, 0x20, 0x20, 0x00, 0x05,
> -       },
> -};
> +MODULE_PARM_DESC(edid_firmware,
> +                "Do not probe monitor, use specified EDID blob from /lib/firmware instead.");
>
>  static const struct drm_edid *edid_load(struct drm_connector *connector, const char *name)
>  {
>         const struct firmware *fw = NULL;
> -       const u8 *fwdata;
>         const struct drm_edid *drm_edid;
> -       int fwsize, builtin;
> +       int err;
>
> -       builtin = match_string(generic_edid_name, GENERIC_EDIDS, name);
> -       if (builtin >= 0) {
> -               fwdata = generic_edid[builtin];
> -               fwsize = sizeof(generic_edid[builtin]);
> -       } else {
> -               int err;
> -
> -               err = request_firmware(&fw, name, connector->dev->dev);
> -               if (err) {
> -                       drm_err(connector->dev,
> -                               "[CONNECTOR:%d:%s] Requesting EDID firmware \"%s\" failed (err=%d)\n",
> -                               connector->base.id, connector->name,
> -                               name, err);
> -                       return ERR_PTR(err);
> -               }
> -
> -               fwdata = fw->data;
> -               fwsize = fw->size;
> +       err = request_firmware(&fw, name, connector->dev->dev);
> +       if (err) {
> +               drm_err(connector->dev,
> +                       "[CONNECTOR:%d:%s] Requesting EDID firmware \"%s\" failed (err=%d)\n",
> +                       connector->base.id, connector->name,
> +                       name, err);
> +               return ERR_PTR(err);
>         }
>
> -       drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] Loaded %s firmware EDID \"%s\"\n",
> -                   connector->base.id, connector->name,
> -                   builtin >= 0 ? "built-in" : "external", name);
> +       drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] Loaded external firmware EDID \"%s\"\n",
> +                   connector->base.id, connector->name, name);
>
> -       drm_edid = drm_edid_alloc(fwdata, fwsize);
> +       drm_edid = drm_edid_alloc(fw->data, fw->size);
>         if (!drm_edid_valid(drm_edid)) {
>                 drm_err(connector->dev, "Invalid firmware EDID \"%s\"\n", name);
>                 drm_edid_free(drm_edid);
> --
> 2.43.2
>
