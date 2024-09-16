Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EADE979C30
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 09:43:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8585410E184;
	Mon, 16 Sep 2024 07:43:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TkgRXZXO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A80DB10E15F;
 Mon, 16 Sep 2024 07:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726472627; x=1758008627;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=69UUwBAZ4rDPxmd5C0S5dgaXwBaxCU0cRIu3YPKdlL4=;
 b=TkgRXZXO6jCy2U2PKX+4SaNTgIBPT1iwhe2+MpAydP/1flA/OoP8ZZKO
 Ij6MmLyvGWASYx+I/+WpK1/on26rdSQMuYRThmKJ0JEumFR0WzIYj+iLE
 XrvmtGzCyXPeJ06RzD865y/mn6xc7xEwk58ijdOPxlcJ9qwL5VPrAjS7w
 auN8UGauiGfyejn6AdwBQorqcffs6kFfzgXGxqMeXol/oCsqUlnKkGuq9
 TaLCWm+DMzAnZ5tfRgNmTMZqHlXw82++nCP3Tc3JbEn88heoT1l4cv3oP
 ok+cQf57z/2A0SpbfA2jX0lzdHlCHWov1pdp/+mfENT1KdbEQdYRxL+8W w==;
X-CSE-ConnectionGUID: 2tVP/abuT2em4iWQeStY0g==
X-CSE-MsgGUID: /0r8SBYTQJ+/G4Q+E7XFTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="35862508"
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; d="scan'208";a="35862508"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 00:43:47 -0700
X-CSE-ConnectionGUID: DURGps4IQyiXfv/iAvS5bg==
X-CSE-MsgGUID: 8YA9GgzyQ024+G4zPL7x4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; d="scan'208";a="68492719"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.249])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 00:43:45 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 6/8] drm/meson: dw-hdmi: annotate
 dw_hdmi_dwc_write_bits() with __maybe_unused
In-Reply-To: <CAFBinCDQzHkvo1tQxa2pcgBHngtiXyCgdbnr=9nW7xDHy0RLdg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1725962479.git.jani.nikula@intel.com>
 <fdc82abdabed667fc85d278cfb03d19e5c472d7b.1725962479.git.jani.nikula@intel.com>
 <CAFBinCDQzHkvo1tQxa2pcgBHngtiXyCgdbnr=9nW7xDHy0RLdg@mail.gmail.com>
Date: Mon, 16 Sep 2024 10:43:41 +0300
Message-ID: <87zfo8cac2.fsf@intel.com>
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

On Sun, 15 Sep 2024, Martin Blumenstingl <martin.blumenstingl@googlemail.co=
m> wrote:
> Hi Jani,
>
> On Tue, Sep 10, 2024 at 12:08=E2=80=AFPM Jani Nikula <jani.nikula@intel.c=
om> wrote:
>>
>> Building with clang and and W=3D1 leads to warning about unused
>> dw_hdmi_dwc_write_bits(). Fix by annotating it with __maybe_unused.
>>
>> See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
>> inline functions for W=3D1 build").
>>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> I prefer dropping this function for which there's a patch already: [0]

Even better, thanks!

BR,
Jani.

>
>
> [0] https://lore.kernel.org/linux-amlogic/20240908-regmap-config-const-v1=
-1-28f349004811@linaro.org/

--=20
Jani Nikula, Intel
