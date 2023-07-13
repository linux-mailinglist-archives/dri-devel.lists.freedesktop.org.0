Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF2975282C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 18:18:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F0B710E70C;
	Thu, 13 Jul 2023 16:18:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 238D910E70C
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 16:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689265106; x=1720801106;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=zaSUoDTd/fYUaIe8J8gT2PySMxfMSjkx0kqXtGWUhg8=;
 b=b4awUwguPsqSC4wVhzvDml5ajCV/stonpa+4O6CJ6YHpMDQ4JsGT30t5
 Q200B9a29jytGRnt//wUQbLKa38qEYqxwcIVU7TvSngsZD4HzuMN0IjF3
 Ni7qsS4YknQ29FIJlKkyxJymmUEIuY2yV7NBmbDB+gSN5dEqrahJkLSBg
 QnkaZve6J9yvkm9no2D9fqDQ32ewToPV1rApoDAslHd8nR00i9B6/sMeo
 NqMheXbZ+rjtZH4bW3Og1wtcLVAWWCtFS1RNndo096NntnIClH1XByp+k
 HQHLnQZpLLRdUtcx2Jzha17Hhu3DPnNKSmiRjNNXkOO98VjQBdIY96LUC w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="429004800"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="429004800"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 09:18:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="787513593"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="787513593"
Received: from atadj-mobl1.amr.corp.intel.com (HELO localhost) ([10.252.50.30])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 09:18:19 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 00/17] drm: rename various struct members "dev" -> "drm"
In-Reply-To: <20230713141023.52dkz5ezicwev74w@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230713082408.2266984-1-u.kleine-koenig@pengutronix.de>
 <874jm8go61.fsf@intel.com>
 <20230713103940.aeqgcbmcoqepvbax@pengutronix.de>
 <2ypl3btshoovedyyq7jaohjgmwr7egnhazuxuffbxudlljktml@syv5u27skpqr>
 <20230713141023.52dkz5ezicwev74w@pengutronix.de>
Date: Thu, 13 Jul 2023 19:18:16 +0300
Message-ID: <87r0pbeqev.fsf@intel.com>
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
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Sui Jingfeng <suijingfeng@loongson.cn>, kernel@pengutronix.de,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 Julia Lawall <julia.lawall@inria.fr>, Luben Tuikov <luben.tuikov@amd.com>,
 Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 13 Jul 2023, Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>=
 wrote:
>  - Jani Nikula
>    unnecessary change.(is this a "no" or a "don't care"?)
>    naming: drm > *

Based on my replies, it's most certainly not "don't care"! ;D

I would prefer not making the change. I avoided the blunt "no" to better
leave room for discussion and arguments. So far I'm not convinced by the
arguments in favour of renaming.


BR,
Jani.


--=20
Jani Nikula, Intel Open Source Graphics Center
