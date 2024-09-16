Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C7E979D32
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 10:49:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C896210E30B;
	Mon, 16 Sep 2024 08:49:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MGERhGvz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48E2010E30B
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 08:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726476546; x=1758012546;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=y0dx8GuuARn90ku6mYhVfzCBpFhP6UXFQhwsQUiVQI4=;
 b=MGERhGvzLteDxxIu56FAtIyjEJ0u6HilgWZBKb+tmfAUz3NQhtZx1A1g
 eF5QrubKqx/QrV7pMduVFxgEsthcxsfPLeVDIeEY60LLWmxARpBuAwD/v
 K7z+OZ9XlhQaCXI0Eat9pzGt27IulAB4A3M8+Nw3FRG13XGUjWJpQzkJw
 x+K2oExZ9untgN7fi90SGcWo0ZosQdvugcgpYy9lTHxNtqoFBXXlhbLJK
 M9zmga0l7BRL6Q7Mvd5eyEgfe4AJdCwwkS4iItnVV5sIejHilaI7egPVc
 goRXPf7B7NUMfX8mfWwLi8mlsjk3yc0uF+7wW/k+NObcAqsX1e8AbEHkV g==;
X-CSE-ConnectionGUID: JV3AyXGGTLORWENTH32c9Q==
X-CSE-MsgGUID: 96snBwXLQNaU1mt40IniuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="36674294"
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; d="scan'208";a="36674294"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 01:49:05 -0700
X-CSE-ConnectionGUID: RFCo+OPDTvC+TUA0mOrxTA==
X-CSE-MsgGUID: sezL4nipQQyTDiFzW7/z/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; d="scan'208";a="99658833"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.249])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 01:49:01 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>,
 dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, =?utf-8?Q?Ma?=
 =?utf-8?Q?=C3=ADra?= Canal
 <mairacanal@riseup.net>, =?utf-8?Q?Andr=C3=A9?= Almeida
 <andrealmeid@igalia.com>, Arthur
 Grillo <arthurgrillo@riseup.net>, Tales Lelo da Aparecida
 <tales.aparecida@gmail.com>, Carlos Eduardo Gallo Filho
 <gcarlos@disroot.org>
Subject: Re: [PATCH v4 RESEND 8/9] drm/tests: Add test for
 drm_framebuffer_init()
In-Reply-To: <20240911001559.28284-9-gcarlos@disroot.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240911001559.28284-1-gcarlos@disroot.org>
 <20240911001559.28284-9-gcarlos@disroot.org>
Date: Mon, 16 Sep 2024 11:48:58 +0300
Message-ID: <87wmjcc7b9.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 10 Sep 2024, Carlos Eduardo Gallo Filho <gcarlos@disroot.org> wrote:
> +/* Try to init a framebuffer without setting its format */
> +static void drm_test_framebuffer_init_bad_format(struct kunit *test)
> +{
> +	struct drm_framebuffer_test_priv *priv = test->priv;
> +	struct drm_device *dev = &priv->dev;
> +	struct drm_framebuffer fb1 = { .dev = dev, .format = NULL };
> +	struct drm_framebuffer_funcs funcs = { };
> +	int ret;
> +
> +	/* Fails if fb.format isn't set */
> +	ret = drm_framebuffer_init(dev, &fb1, &funcs);

Not only does this fail, it spits a WARN_ON_ONCE() in dmesg. Which in
turn gets flagged as a failure in the test in our CI.

What's the policy with kunit tests causing warnings? I think it's
reasonable for any CI to flag dmesg warnings. We shouldn't be hitting
those. Filtering the warnigs is a tricky business.

BR,
Jani.



> +	KUNIT_EXPECT_EQ(test, ret, -EINVAL);
> +}

-- 
Jani Nikula, Intel
