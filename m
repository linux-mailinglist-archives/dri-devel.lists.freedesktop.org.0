Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C465962BBFF
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 12:33:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECB5210E487;
	Wed, 16 Nov 2022 11:33:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D60A710E487
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 11:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668598377; x=1700134377;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=yyz/NpAhYKux7y/lcRBUiBi4se0872yZ68IGfGeSjhg=;
 b=Xt+Ano65xL9S1W0F3qFBtG79wZz8mmVkQwEW0fEEgsfyzAKOSqyLvqG9
 xZAqiUwT1r2uC0O/RsnF/BHRh1OTUmvTb3zFoTfljTSKVh70cEFZe5Rn3
 AOSmKg7mfi2h62BscfZMnzdPehiCKc/t5QLBzFeshh7lwlpXMn2HE+3i/
 zJa6ObNMnEI4NBrEXjYCyP2xvv0AOb/9/WWAX26HvOBbyfR/n5MtNILhn
 Ezs986v7nHiD7RoHGclUTXOA6Pchn5TinBsivYspY5698OBn14kxeHot2
 cRteeBWPYgzR4ljlH2G6LMd881QMdallwF3c2kmZf1bDJBfc07++y/9eL w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="295886235"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; d="scan'208";a="295886235"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2022 03:32:57 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="728340181"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; d="scan'208";a="728340181"
Received: from dariofax-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.59.5])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2022 03:32:54 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: =?utf-8?Q?Ma=C3=ADra?= Canal <mairacanal@riseup.net>, Maxime Ripard
 <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 2/3] drm/tests: helpers: Add module infos
In-Reply-To: <6dba9207-5ba2-5c73-e575-a7a86a2b9520@riseup.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20221116091712.1309651-1-maxime@cerno.tech>
 <20221116091712.1309651-2-maxime@cerno.tech>
 <6dba9207-5ba2-5c73-e575-a7a86a2b9520@riseup.net>
Date: Wed, 16 Nov 2022 13:32:51 +0200
Message-ID: <874juz2kyk.fsf@intel.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 16 Nov 2022, Ma=C3=ADra Canal <mairacanal@riseup.net> wrote:
> Hi Maxime,
>
> On 11/16/22 06:17, Maxime Ripard wrote:
>> The MODULE_LICENSE macro is missing from the kunit helpers file, thus
>> leading to a build error.
>>=20
>> Let's introduce it along with MODULE_AUTHOR.
>>=20
>> Fixes: 44a3928324e9 ("drm/tests: Add Kunit Helpers")
>> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>
> It would be nice to add the SPDX-License-Identifier tag in the source
> file as well. Besides that,

It's not just nice, it's basically mandatory to add license boilerplate.

Checkpatch would've warned about this. And actually about a lot of stuff
in the series.

(And our CI checkpatch did too, although we don't send the replies to
the world, just intel-gfx [1].)

BR,
Jani.


[1] https://lore.kernel.org/r/166846421165.32750.1193593124785451784@emeril=
.freedesktop.org



--=20
Jani Nikula, Intel Open Source Graphics Center
