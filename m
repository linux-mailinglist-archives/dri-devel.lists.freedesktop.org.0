Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A20F4974BFD
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 10:02:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55CE710E108;
	Wed, 11 Sep 2024 08:01:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="akWMcRau";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D996510E02D;
 Wed, 11 Sep 2024 08:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726041717; x=1757577717;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=FCYJeZC+oSTZJzCIsgcWnGwHPLaijSSXhYP4FcqeAsw=;
 b=akWMcRauXSxyr+f1Dve/LoGwT68KUsgh+Sqiw/LRY7xE4avDiK7hAKG3
 w7d72VenIrGwVOfCFrpR7/lp4poDbGi2ImQ58uf9L7NJjsGZsO2gDT6qL
 QTM/MOzibLdgDB8mb+LV0J9KzxTXeLwV/p68KPT9YWuEDGB3kdZOw6ar0
 E1UMWOzUZ/HRZWutBL/Gph292aA49IOu4GRyDSxe4SO5lKtFFrxcQBGWF
 3qxX3xJeEasQ20dyl5ChH2ZcRi2D7jSqAudO0kSI8npQX67/JRkx/fckA
 VEBfEY4ZDtdNmLWl1QfXd9WhEizs3thVRHm0307GDJf5L3E/2Nfj2ka9v w==;
X-CSE-ConnectionGUID: 6uZQIUsSTXKe2nDBEVda8w==
X-CSE-MsgGUID: t6JjSPHYRaukSv9OtMtzUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="35395833"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="35395833"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 01:01:56 -0700
X-CSE-ConnectionGUID: QOdlNPrLS/urVS1FyGk7cg==
X-CSE-MsgGUID: AD0UmJG7SYq5UonpHZSTkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="104752146"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.149])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 01:01:52 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Doug Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH 4/8] drm/bridge: ti-sn65dsi86: annotate
 ti_sn_pwm_pin_{request, release} with __maybe_unused
In-Reply-To: <CAD=FV=XgddDYmOiX1ouQo2ayhJn4GVQrErj-XBy3og5eJ0uBOA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1725962479.git.jani.nikula@intel.com>
 <136ecd978aedd7df39d1b1c37b70596027ff0a3e.1725962479.git.jani.nikula@intel.com>
 <CAD=FV=XgddDYmOiX1ouQo2ayhJn4GVQrErj-XBy3og5eJ0uBOA@mail.gmail.com>
Date: Wed, 11 Sep 2024 11:01:49 +0300
Message-ID: <87h6amk49e.fsf@intel.com>
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

On Tue, 10 Sep 2024, Doug Anderson <dianders@chromium.org> wrote:
> Hi,
>
> On Tue, Sep 10, 2024 at 3:04=E2=80=AFAM Jani Nikula <jani.nikula@intel.co=
m> wrote:
>>
>> Building with clang, W=3D1, CONFIG_PM=3Dn and CONFIG_OF_GPIO=3Dn leads to
>> warning about unused ti_sn_pwm_pin_request() and
>> ti_sn_pwm_pin_release(). Fix by annotating them with __maybe_unused.
>>
>> See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
>> inline functions for W=3D1 build").
>>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>
>> ---
>>
>> Cc: Douglas Anderson <dianders@chromium.org>
>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
>> Cc: Robert Foss <rfoss@kernel.org>
>> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
>> Cc: Jonas Karlman <jonas@kwiboo.se>
>> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
>> Cc: Nathan Chancellor <nathan@kernel.org>
>> ---
>>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> I'm happy to land this in drm-misc-next unless there are any extra
> dependencies. Let me know. In some sense I guess this could even be
> considered a "Fix", though I guess given the history of the compiler
> options that might be a bit of a stretch.

drm-misc-next is fine. Agree on not considering this a fix.

BR,
Jani.


--=20
Jani Nikula, Intel
