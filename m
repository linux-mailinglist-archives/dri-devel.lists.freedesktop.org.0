Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D8596B663
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 11:21:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E310910E566;
	Wed,  4 Sep 2024 09:21:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ipz7Qz2c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2829D10E566
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 09:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725441701; x=1756977701;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=vBl14jc/d/Ng9281crJ+2Y9cpdIoH2pNrH43r3fm2no=;
 b=Ipz7Qz2cG89w2FRolOViOli4M9IreOMRw6N/qMiJ21p2JQHixAfvlJf1
 osw3sCp8uKmesBVcIkNUpkEl+4Sd4mAFL2wIGrSl214X+ftb6Sv8UkQSC
 kxFMWI6tLi2pA+z+jdQ1blU98oILhc6qvJ9oIaPo74fPhn6U01Kl07mTb
 xMs0YiJdkDuIJqBU4YO/gB8APqHmxYe3UgaX4AZcaecvOsog8BDetmquH
 iJTb6B/hIOAl0gqKn2uQdBi8kX6SCKjtY+O11+29Y8L3KAIZY2B2I/fFB
 +pscYyo5kVdaCBJtIgAgLlrzEDoHaIZqqKlM97jAFPsJCtOI7uHVikiG3 A==;
X-CSE-ConnectionGUID: xmieai5qSfmUVp0NbU7b7Q==
X-CSE-MsgGUID: WG2OWEw/SpK3jMVmdXZ41Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="24199239"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="24199239"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 02:21:41 -0700
X-CSE-ConnectionGUID: mEWaZHA6RKGCVBQ+ajtoBA==
X-CSE-MsgGUID: uF3JKGWeSHGhUBtzH8diCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="70004211"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.18])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 02:21:38 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, Marc Gonzalez <mgonzalez@freebox.fr>,
 Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH] drm/bridge/tdp158: fix build failure
In-Reply-To: <qc2tixiicn26oqimypl4zxgtgkncil22hvo2nsrmim7yhmzoq4@jjp2gz6jmosg>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240904085206.3331553-1-jani.nikula@intel.com>
 <qc2tixiicn26oqimypl4zxgtgkncil22hvo2nsrmim7yhmzoq4@jjp2gz6jmosg>
Date: Wed, 04 Sep 2024 12:21:20 +0300
Message-ID: <87o753srjj.fsf@intel.com>
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

On Wed, 04 Sep 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> On Wed, Sep 04, 2024 at 11:52:06AM GMT, Jani Nikula wrote:
>> ARCH=3Darm build fails with:
>>=20
>>   CC [M]  drivers/gpu/drm/bridge/ti-tdp158.o
>> ../drivers/gpu/drm/bridge/ti-tdp158.c: In function =E2=80=98tdp158_enabl=
e=E2=80=99:
>> ../drivers/gpu/drm/bridge/ti-tdp158.c:31:9: error: implicit declaration =
of function =E2=80=98gpiod_set_value_cansleep=E2=80=99 [-Werror=3Dimplicit-=
function-declaration]
>>    31 |         gpiod_set_value_cansleep(tdp158->enable, 1);
>>       |         ^~~~~~~~~~~~~~~~~~~~~~~~
>> ../drivers/gpu/drm/bridge/ti-tdp158.c: In function =E2=80=98tdp158_probe=
=E2=80=99:
>> ../drivers/gpu/drm/bridge/ti-tdp158.c:80:26: error: implicit declaration=
 of function =E2=80=98devm_gpiod_get_optional=E2=80=99; did you mean =E2=80=
=98devm_regulator_get_optional=E2=80=99? [-Werror=3Dimplicit-function-decla=
ration]
>>    80 |         tdp158->enable =3D devm_gpiod_get_optional(dev, "enable"=
, GPIOD_OUT_LOW);
>>       |                          ^~~~~~~~~~~~~~~~~~~~~~~
>>       |                          devm_regulator_get_optional
>> ../drivers/gpu/drm/bridge/ti-tdp158.c:80:65: error: =E2=80=98GPIOD_OUT_L=
OW=E2=80=99 undeclared (first use in this function)
>>    80 |         tdp158->enable =3D devm_gpiod_get_optional(dev, "enable"=
, GPIOD_OUT_LOW);
>>       |                                                                 =
^~~~~~~~~~~~~
>> ../drivers/gpu/drm/bridge/ti-tdp158.c:80:65: note: each undeclared ident=
ifier is reported only once for each function it appears in
>>=20
>> Add the proper gpio consumer #include to fix this, and juggle the
>> include order to be a bit more pleasant on the eye while at it.
>>=20
>> Fixes: a15710027afb ("drm/bridge: add support for TI TDP158")
>> Cc: Marc Gonzalez <mgonzalez@freebox.fr>
>> Cc: Robert Foss <rfoss@kernel.org>
>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
>> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
>> Cc: Jonas Karlman <jonas@kwiboo.se>
>> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/bridge/ti-tdp158.c | 7 +++++--
>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>=20
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Pushed to drm-misc-next, thanks for the review.

BR,
Jani.

--=20
Jani Nikula, Intel
