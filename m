Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 747A2C16910
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 20:08:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D84F610E10C;
	Tue, 28 Oct 2025 19:08:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fy0xIUyH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD2A10E10C
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 19:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761678496; x=1793214496;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=sgu3/CBYH5lnx9Jj/XwSp9HOv7LXumvHgIm7Ct6sxkA=;
 b=Fy0xIUyHbuK2KF/PoEKajIjqj7w366l4hxhpUV3CSQ+ET65M8q3Ktrza
 NKYtqlGpoeI4az7IhouV5SG2NSzVA276w5HD3W5biHPdVOgAZxOmNa8XI
 tiKypX3TijXDqeChRgcqgtTPFXGaaRDwJPicr5x5OLMoGXnSfo3jEPwyA
 QEKmWV9qVeqDKe5O0NcDtd8gJFtWFYrePjCBIXAnipYZPvaAKrLsX5+ZY
 Ig3kWSE2PveEScHiy9+rgErtbcfTnw6UxBDYI9shLPKFrsARV8m4fZjTo
 YFZZrayzBeZTS+V65iuCJw7AerYAXOXGJoG1/qC7HIDt07p4hKtrUodZr w==;
X-CSE-ConnectionGUID: +2nGOppySeOOaIJ3otS9aw==
X-CSE-MsgGUID: 38ViWsKcQuine1cqtFs09A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="75237444"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="75237444"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 12:08:16 -0700
X-CSE-ConnectionGUID: a7OJqYOUQOm8RyCebGIfmA==
X-CSE-MsgGUID: WtZxcn0cQs+Pmv5T/EbqwQ==
X-ExtLoop1: 1
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.90])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 12:08:13 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Tiago Martins =?utf-8?Q?Ara=C3=BAjo?= <tiago.martins.araujo@gmail.com>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 simona@ffwll.ch, mpearson-lenovo@squebb.ca
Subject: Re: DisplayID checksum validation blocking hardware capabilities -
 CSO T3 panel
In-Reply-To: <CACRbrPHM=8DmTD2Wg__fBDpawuugA9C+CNr8-W8BJOnZfmobdA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CACRbrPGvLP5LANXuFi6z0S7XMbAG4X5y2YOLBDxfOVtfGGqiKQ@mail.gmail.com>
 <CAPM=9twtwNGjEXBv1Yj6vNLfEMPxuMgepOkhBKQYYtm0cmc45Q@mail.gmail.com>
 <54375f5e6c5290aa218812c489ffe88e594217bd@intel.com>
 <CACRbrPHM=8DmTD2Wg__fBDpawuugA9C+CNr8-W8BJOnZfmobdA@mail.gmail.com>
Date: Tue, 28 Oct 2025 21:08:10 +0200
Message-ID: <a7d53f43e0c9d4c697946ecec31c9441df540a47@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 15 Sep 2025, Tiago Martins Ara=C3=BAjo <tiago.martins.araujo@gmail.=
com> wrote:
>> That's not the complete EDID data, though. It's missing 6*16 bytes. If
>> you go by the hex offsets, 0x100 does not follow 0x090.
>
>>  please grab the EDID from sysfs.
>
> Fresh from my terminal:
> =E2=9E=9C  ~ cat /sys/class/drm/card1-eDP-1/edid | edid-decode
> edid-decode (hex):
>
> 00 ff ff ff ff ff ff 00 0e 6f 16 14 00 00 00 00
> 00 20 01 04 b5 1e 13 78 03 21 15 a8 53 49 9c 25
> 0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 ce 87 40 a0 b0 08 6a 70 30 20
> 36 00 2d bc 10 00 00 18 00 00 00 fd 00 28 78 e5
> e5 46 01 0a 20 20 20 20 20 20 00 00 00 fe 00 43
> 53 4f 54 20 54 33 0a 20 20 20 20 20 00 00 00 fe
> 00 4d 4e 45 30 30 37 5a 41 31 2d 35 0a 20 01 af
>
> 70 13 79 00 00 03 01 14 9a 0f 01 05 3f 0b 9f 00
> 2f 00 1f 00 07 07 69 00 02 00 05 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 f0 98
>
> ----------------
>
> Block 0, Base EDID:
>   EDID Structure Version & Revision: 1.4
>   Vendor & Product Identification:
>     Manufacturer: CSO
>     Model: 5142
>     Made in: 2022
>   Basic Display Parameters & Features:
>     Digital display
>     Bits per primary color channel: 10
>     DisplayPort interface
>     Maximum image size: 30 cm x 19 cm
>     Gamma: 2.20
>     Supported color formats: RGB 4:4:4
>     First detailed timing includes the native pixel format and preferred
> refresh rate
>     Display supports continuous frequencies
>   Color Characteristics:
>     Red  : 0.6562, 0.3261
>     Green: 0.2851, 0.6103
>     Blue : 0.1445, 0.0595
>     White: 0.3134, 0.3291
>   Established Timings I & II: none
>   Standard Timings: none
>   Detailed Timing Descriptors:
>     DTD 1:  2880x1800   60.000966 Hz  16:10   114.362 kHz    347.660000 M=
Hz
> (301 mm x 188 mm)
>                  Hfront   48 Hsync  32 Hback   80 Hpol N
>                  Vfront    3 Vsync   6 Vback   97 Vpol N
>     Display Range Limits:
>       Monitor ranges (Range Limits Only): 40-120 Hz V, 229-229 kHz H, max
> dotclock 700 MHz
>     Alphanumeric Data String: 'CSOT T3'
>     Alphanumeric Data String: 'MNE007ZA1-5'
>   Extension blocks: 1
> Checksum: 0xaf
>
> ----------------
>
> Block 1, DisplayID Extension Block:
>   Version: 1.3
>   Extension Count: 0
>   Display Product Type: Extension Section
>   Video Timing Modes Type 1 - Detailed Timings Data Block:
>     DTD:  2880x1800  120.000207 Hz  16:10   228.720 kHz    695.310000 MHz
> (aspect 16:10, no 3D stereo)
>                Hfront   48 Hsync  32 Hback   80 Hpol N
>                Vfront    3 Vsync   6 Vback   97 Vpol N
>   Checksum: 0xf0 (should be 0xf8)
> Checksum: 0x98

There's an i915 bug report [1] on what is likely a similar Lenovo model
to yours, with the same display, but with an Intel GPU.

I looked at adding an EDID quirk for this, but actually passing the
information all the way down to the DisplayID checksum validation is
going to be annoying. :(


BR,
Jani.

[1] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14703


--=20
Jani Nikula, Intel
