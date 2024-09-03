Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E4396A2A2
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 17:30:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D33310E5D1;
	Tue,  3 Sep 2024 15:30:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hK3D2O9t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 923D110E5D1
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 15:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725377451; x=1756913451;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=quTbfbSANe4t1ypJkD07DT3rhHexlQR6l0nLd4Z6XAI=;
 b=hK3D2O9tfnrlq9Tj99tbph6Y4G2+zSOE4RP2R51ISjw9vY7GPN8A9oat
 vFCizbtreJsVEiwTId5ZGdNqsBpL1vGe8mqqaz2f4V/qTc0n5Thp+g8Lx
 QMd545fLVCW4Bmz5lPTn6jZYKEjUxbKCuRn2S+tyyX8s5YfFpoZVYNxaJ
 J1shuRKdFFx5Rfk8/7hEBoqrtVSOdmxqUSMFRIkJRWMod4ScOr5VkHqQF
 a9mSVyMTUXTBk39KLfGhlyplGjm1yhCZIsukKWm2aOSyW6IOMxfS6eymq
 AVtyONVHeJshT/nerzHV8b+/vaeqECA8icgpqKsPSZVRbJ/9N3E6x8xCY w==;
X-CSE-ConnectionGUID: 1eJtJCVOSTKZOPj6EMTwzA==
X-CSE-MsgGUID: a7NFpGq8S4iqqpdJ5K+GpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23499586"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; d="scan'208";a="23499586"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 08:30:51 -0700
X-CSE-ConnectionGUID: pb/Tlxs0SKiDGNNW7wjiuQ==
X-CSE-MsgGUID: 74l3oSr4Q4yytKDl2k7EHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; d="scan'208";a="65169306"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.148])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 08:30:43 -0700
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
In-Reply-To: <172536721812.2552069.2889737892670833119.b4-ty@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240812-tdp158-v5-0-78684a84ec23@freebox.fr>
 <172536721812.2552069.2889737892670833119.b4-ty@kernel.org>
Date: Tue, 03 Sep 2024 18:30:27 +0300
Message-ID: <87ikvcu54c.fsf@intel.com>
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

On Tue, 03 Sep 2024, Robert Foss <rfoss@kernel.org> wrote:
> On Mon, 12 Aug 2024 16:51:00 +0200, Marc Gonzalez wrote:
>> TDP158 is an AC-coupled DVI / HDMI to TMDS level shifting Redriver.
>>=20
>> Like the TFP410, the TDP158 can be set up in 2 different ways:
>> 1) hard-coding its configuration settings using pin-strapping resistors
>> 2) placing it on an I2C bus, and defer set-up until run-time
>>=20
>> The mode is selected by pin 8 =3D I2C_EN
>> I2C_EN =3D 1 =3D=3D> I2C Control Mode
>> I2C_EN =3D 0 =3D=3D> Pin Strap Mode
>>=20
>> [...]
>
> Applied, thanks!
>
> [1/2] dt-bindings: display: bridge: add TI TDP158
>       https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/887665792b99
> [2/2] drm/bridge: add support for TI TDP158
>       https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/a15710027afb

Fails build with:

../drivers/gpu/drm/bridge/ti-tdp158.c: In function =E2=80=98tdp158_enable=
=E2=80=99:
../drivers/gpu/drm/bridge/ti-tdp158.c:31:9: error: implicit declaration of =
function =E2=80=98gpiod_set_value_cansleep=E2=80=99 [-Werror=3Dimplicit-fun=
ction-declaration]
   31 |         gpiod_set_value_cansleep(tdp158->enable, 1);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/bridge/ti-tdp158.c: In function =E2=80=98tdp158_probe=E2=
=80=99:
../drivers/gpu/drm/bridge/ti-tdp158.c:80:26: error: implicit declaration of=
 function =E2=80=98devm_gpiod_get_optional=E2=80=99; did you mean =E2=80=98=
devm_regulator_get_optional=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]
   80 |         tdp158->enable =3D devm_gpiod_get_optional(dev, "enable", G=
PIOD_OUT_LOW);
      |                          ^~~~~~~~~~~~~~~~~~~~~~~
      |                          devm_regulator_get_optional
../drivers/gpu/drm/bridge/ti-tdp158.c:80:65: error: =E2=80=98GPIOD_OUT_LOW=
=E2=80=99 undeclared (first use in this function)
   80 |         tdp158->enable =3D devm_gpiod_get_optional(dev, "enable", G=
PIOD_OUT_LOW);
      |                                                                 ^~~=
~~~~~~~~~~
../drivers/gpu/drm/bridge/ti-tdp158.c:80:65: note: each undeclared identifi=
er is reported only once for each function it appears in


BR,
Jani.

--=20
Jani Nikula, Intel
