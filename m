Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A00751F6F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 13:05:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 960A910E0CB;
	Thu, 13 Jul 2023 11:05:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E1310E0CB
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 11:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689246339; x=1720782339;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=V18dPZ5h9IK0tNEAunzdUTt6GBDpSgqwZ5Wp0OhxscY=;
 b=MecIvnE5ZC+NYkvxQvnEgV+2XKgyCGE71axlMJVLri0v5OsbahJw/p2U
 KCDQ1cGD9+IShqCaACOFkXUylPLijNAmKtKj5sEM0YHoPf67Zmmaps1P0
 CR0n0ExE2cYl5hT2EwydY21F1KEHTMuPJo8UAHcN/3BO3jDyaYd2ZFcON
 /aDgYkWX1V2jBaWOmKxSe+STQmYwAn9LLymnJHTFMIXgVXeFOL7vNHh8W
 N0Dy6B0ts2Xz96y0fgwYJN7j83vYKxQuJzijn3J7TYHUysHccuuwwu+Ig
 ZijikWcqDmj7rsdhZhp9z3i0HToWpY19EzqystandsSicg1jqR32XXIkf Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="364021411"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="364021411"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 04:05:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="968580483"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="968580483"
Received: from atadj-mobl1.amr.corp.intel.com (HELO localhost) ([10.252.50.30])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 04:05:29 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 00/17] drm: rename various struct members "dev" -> "drm"
In-Reply-To: <20230713103940.aeqgcbmcoqepvbax@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230713082408.2266984-1-u.kleine-koenig@pengutronix.de>
 <874jm8go61.fsf@intel.com>
 <20230713103940.aeqgcbmcoqepvbax@pengutronix.de>
Date: Thu, 13 Jul 2023 14:05:27 +0300
Message-ID: <87v8eof4w8.fsf@intel.com>
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
Cc: Sean Paul <seanpaul@chromium.org>, Julia Lawall <julia.lawall@inria.fr>,
 kernel@pengutronix.de, Sui Jingfeng <suijingfeng@loongson.cn>,
 Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 13 Jul 2023, Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>=
 wrote:
> If you say you consider the idea bad or too costly to implement, that's
> fine. But pointing to other areas that are bad shouldn't be a relevant
> reason to shoot down this effort.

I did not point to other places saying they're "bad". That's your
opinion, not mine. I don't think the drm usage of the dev name is bad,
and I pointed out drm is not alone in using it.


BR,
Jani.


--=20
Jani Nikula, Intel Open Source Graphics Center
