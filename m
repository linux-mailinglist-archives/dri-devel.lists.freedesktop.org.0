Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1799F96B594
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 10:55:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FC4410E700;
	Wed,  4 Sep 2024 08:55:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JnvhEXGL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FCF210E700
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 08:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725440101; x=1756976101;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=u/8TadMuYKUFhKnQMeDmqC1qJ0hJ+/nvqfXJBcyj304=;
 b=JnvhEXGLBw4b+rytpAThBGC1/ncWHuCyWGumAkuGN+4t1ZTYBfxN1RgH
 KduNwRP4CDLfy5klFUzSnNDU6XHJjtQ9M0+G/hwAAmYiq+D3dKrpiCaFk
 jnGJKeaABVx53FmzHP65ZDN2qMNxhRI6pndH6U/0Mi/nxEkc8Cl9FXmCF
 WuaUH0terBCviQZtN3II06B/2VYKeoahEccejV2hjuqxukS6zHUCoStKy
 5HG/cZyzheleO0rPVQiPeNd1FOwRFUiqvWwTRh4beHc4tUfYtDKoQgv99
 Z9rtj9UPLTnZUpSqGHWl+mO/Vg+HgTc1tW98igFx34AAjG7xtbDV3LaNV g==;
X-CSE-ConnectionGUID: 7k11kihWR4SSVALdPkeIpQ==
X-CSE-MsgGUID: A0GfR/lXRTK3pvKOJJIMuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="35244157"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="35244157"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 01:55:01 -0700
X-CSE-ConnectionGUID: aIVjLDyjT3aNnpyvSWBI2Q==
X-CSE-MsgGUID: ijdeOUFeRn65XMWUj9GN8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="65444076"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.18])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 01:54:52 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Marc
 Gonzalez <mgonzalez@freebox.fr>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Arnaud Vrac <avrac@freebox.fr>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v5 0/2] Basic support for TI TDP158
In-Reply-To: <87ikvcu54c.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240812-tdp158-v5-0-78684a84ec23@freebox.fr>
 <172536721812.2552069.2889737892670833119.b4-ty@kernel.org>
 <87ikvcu54c.fsf@intel.com>
Date: Wed, 04 Sep 2024 11:54:34 +0300
Message-ID: <87zfonsss5.fsf@intel.com>
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

On Tue, 03 Sep 2024, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Tue, 03 Sep 2024, Robert Foss <rfoss@kernel.org> wrote:
>> On Mon, 12 Aug 2024 16:51:00 +0200, Marc Gonzalez wrote:
>>> TDP158 is an AC-coupled DVI / HDMI to TMDS level shifting Redriver.
>>>=20
>>> Like the TFP410, the TDP158 can be set up in 2 different ways:
>>> 1) hard-coding its configuration settings using pin-strapping resistors
>>> 2) placing it on an I2C bus, and defer set-up until run-time
>>>=20
>>> The mode is selected by pin 8 =3D I2C_EN
>>> I2C_EN =3D 1 =3D=3D> I2C Control Mode
>>> I2C_EN =3D 0 =3D=3D> Pin Strap Mode
>>>=20
>>> [...]
>>
>> Applied, thanks!
>>
>> [1/2] dt-bindings: display: bridge: add TI TDP158
>>       https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/887665792b=
99
>> [2/2] drm/bridge: add support for TI TDP158
>>       https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/a15710027a=
fb
>
> Fails build with:
>
> ../drivers/gpu/drm/bridge/ti-tdp158.c: In function =E2=80=98tdp158_enable=
=E2=80=99:
> ../drivers/gpu/drm/bridge/ti-tdp158.c:31:9: error: implicit declaration o=
f function =E2=80=98gpiod_set_value_cansleep=E2=80=99 [-Werror=3Dimplicit-f=
unction-declaration]
>    31 |         gpiod_set_value_cansleep(tdp158->enable, 1);
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/bridge/ti-tdp158.c: In function =E2=80=98tdp158_probe=
=E2=80=99:
> ../drivers/gpu/drm/bridge/ti-tdp158.c:80:26: error: implicit declaration =
of function =E2=80=98devm_gpiod_get_optional=E2=80=99; did you mean =E2=80=
=98devm_regulator_get_optional=E2=80=99? [-Werror=3Dimplicit-function-decla=
ration]
>    80 |         tdp158->enable =3D devm_gpiod_get_optional(dev, "enable",=
 GPIOD_OUT_LOW);
>       |                          ^~~~~~~~~~~~~~~~~~~~~~~
>       |                          devm_regulator_get_optional
> ../drivers/gpu/drm/bridge/ti-tdp158.c:80:65: error: =E2=80=98GPIOD_OUT_LO=
W=E2=80=99 undeclared (first use in this function)
>    80 |         tdp158->enable =3D devm_gpiod_get_optional(dev, "enable",=
 GPIOD_OUT_LOW);
>       |                                                                 ^=
~~~~~~~~~~~~
> ../drivers/gpu/drm/bridge/ti-tdp158.c:80:65: note: each undeclared identi=
fier is reported only once for each function it appears in

Fix at [1].

BR,
Jani.


[1] https://lore.kernel.org/r/20240904085206.3331553-1-jani.nikula@intel.com


--=20
Jani Nikula, Intel
