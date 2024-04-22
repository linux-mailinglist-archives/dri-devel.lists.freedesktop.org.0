Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4963C8AD32E
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 19:15:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B9D10F72B;
	Mon, 22 Apr 2024 17:15:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jt/+8w9i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4FC010F72B
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 17:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713806101; x=1745342101;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=BrpU3LoTLXHcoM8ORoBD8hzIx4TTKfnlR5i0LAc22wE=;
 b=jt/+8w9i5nHinYghB/xEV2L6aa9nacOFt9AzROrE7LbGnDkLcGjtOi7U
 EocJWKaQ4AWtDQ5TcDtcDMzPAB5QWAPMIztzWkaB4wk5sbKU6u3S5UBXH
 q7B+ng3osd1mE0dMIzEJeUr2S71SYarALKSzMsaELfTKallmnHi1qzxM+
 feHlZbWF/JuJLc0zhMTzn2b/+Cukn/uWnDdwn+4ZELBmY7i8Y0FjjK9qv
 MDIYG5L2ElBW8ZZn5jQ8KUnryf7KyBmk7wibCVQwjDnEExKUAUNf+SXT1
 GZzJUhu81DclI0Az9NANauq+ROQL70Jmu2C6ZTAD7amQJt2FANLnaN6kv A==;
X-CSE-ConnectionGUID: lHYd+wtrS/ueEmhpowPr8A==
X-CSE-MsgGUID: ckH6NduwStqJzYMYoFCtJg==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="13191431"
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; d="scan'208";a="13191431"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 10:15:01 -0700
X-CSE-ConnectionGUID: OBS6r4f7Q26O3NNuaAsTEw==
X-CSE-MsgGUID: ccl8swbfSOSg+0+wvS8rXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; d="scan'208";a="23955593"
Received: from ralbanes-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.63.128])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 10:14:55 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Linux-Renesas
 <linux-renesas-soc@vger.kernel.org>, Masahiro Yamada
 <masahiroy@kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH 00/11] drm: Restore helper usability
In-Reply-To: <CAMuHMdXCL-gbKr6mUBPWONtRjz=X0vZQgiS=02WXXSFf67yBww@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1713780345.git.geert+renesas@glider.be>
 <87il09ty4u.fsf@intel.com>
 <ff4f9e8f-0825-4421-adf9-e3914b108da7@app.fastmail.com>
 <875xw9ttl6.fsf@intel.com>
 <af6e26d1-1402-4ed2-a650-b58eae77273e@app.fastmail.com>
 <CAMuHMdXCL-gbKr6mUBPWONtRjz=X0vZQgiS=02WXXSFf67yBww@mail.gmail.com>
Date: Mon, 22 Apr 2024 20:14:53 +0300
Message-ID: <87ttjts4j6.fsf@intel.com>
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

On Mon, 22 Apr 2024, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> Hi Arnd,
>
> CC kbuild
>
> On Mon, Apr 22, 2024 at 3:55=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wro=
te:
>> I'm not sure where this misunderstanding comes from, as you
>> seem to be repeating the same incorrect assumption about
>> how select works that Maxime wrote in his changelog. To clarify,
>> this works exactly as one would expect:
>>
>> config HELPER_A
>>        tristate
>>
>> config HELPER_B
>>        tristate
>>        select HELPER_A
>>
>> config DRIVER
>>        tristate "Turn on the driver and the helpers it uses"
>>        select HELPER_B # this recursively selects HELPER_A
>>
>> Whereas this one is broken:
>>
>> config FEATURE_A
>>        tristate "user visible if I2C is enabled"
>>        depends on I2C
>>
>> config HELPER_B
>>        tristate # hidden
>>        select FEATURE_A
>>
>> config DRIVER
>>        tristate "This driver is broken if I2C is disabled"
>>        select HELPER_B
>
> So the DRIVER section should gain a "depends on I2C" statement.

Why should DRIVER have to care that HELPER_B needs either FEATURE_A or
I2C? It should only have to care about HELPER_B. And if the dependencies
of FEATURE_A or HELPER_B later change, that's their business, not
DRIVER's.


BR,
Jani.

>
> Yamada-san: would it be difficult to modify Kconfig to ignore symbols
> like DRIVER that select other symbols with unmet dependencies?
> Currently it already warns about that.
>
> Handling this implicitly (instead of the current explict "depends
> on") would have the disadvantage though: a user who is not aware of
> the implicit dependency may wonder why DRIVER is invisible in his
> config interface.

--=20
Jani Nikula, Intel
