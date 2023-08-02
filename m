Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBCF76C9D0
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 11:49:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6023D10E0A1;
	Wed,  2 Aug 2023 09:49:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB87410E0A1
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 09:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690969767; x=1722505767;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=YRcGeOxRUJArRb84NlJwrYbu4BywziVVm/fAE8bkyZc=;
 b=JLqN5Gu4txgD2tHIUiLnpMsXRBjOaBQRj82EA9vRBAjz1ggSKrEO3uHu
 /8lnghhBm2c9DRIKlNCUPEOjucRxdFATKXIvQhfBSL1uwIPqZjrZs8eD+
 BgIP1xAEdVul9mtz8YHeqSQlGG821SxdZL8ERTLfR2AzbLh8u8MaBljCr
 3PJ00BQY336EauVpDJTFe26S+A3omnMk9h1Iqc26EaFzvABBPRloe5uoa
 cdEQwDWMg5cAeQa1F/MEeLiXGwRpgRtAP7glCkDZUiQup9CHzyIHL92SK
 0I84L9O/lUEaZpez/kYWnQ5boqc35xpMPFO1yGdMurWh9agZsxanybRsC g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="455903014"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; d="scan'208";a="455903014"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 02:49:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="902922075"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; d="scan'208";a="902922075"
Received: from osalyk-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.62.215])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 02:49:22 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Paul
 Kocialkowski <paul.kocialkowski@bootlin.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Javier Martinez Canillas <javierm@redhat.com>,
 "Russell King (Oracle)" <linux@armlinux.org.uk>, Christian =?utf-8?Q?K?=
 =?utf-8?Q?=C3=B6nig?= <christian.koenig@amd.com>, Julia
 Lawall <julia.lawall@inria.fr>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Maxime
 Ripard <mripard@kernel.org>, Sui Jingfeng <suijingfeng@loongson.cn>, Luben
 Tuikov <luben.tuikov@amd.com>, Thierry
 Reding <thierry.reding@gmail.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Sean Paul <seanpaul@chromium.org>, Krzysztof
 Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 00/17] drm: rename various struct members "dev" -> "drm"
In-Reply-To: <874jm8go61.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230713082408.2266984-1-u.kleine-koenig@pengutronix.de>
 <874jm8go61.fsf@intel.com>
Date: Wed, 02 Aug 2023 12:49:20 +0300
Message-ID: <87zg39vknz.fsf@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 13 Jul 2023, Jani Nikula <jani.nikula@intel.com> wrote:
> I find it obnoxious to send a new series within 24 hours of the first,
> while the discussion is still in progress, and it's a misrepresentation
> of the in-progress dicussion to say most of the feedback was positive.

Uwe, all -

Back from vacation. In the mean time, it has been brought to my
attention that "obnoxious" is an extremely strong choice of wording
here. Apologies. Absolutely no insult was intended. Turns out my command
of the nuances of the English language is not as good as I like to
believe it is.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
