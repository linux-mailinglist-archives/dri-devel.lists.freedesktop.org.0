Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCBF9779A9
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 09:31:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1589E10E194;
	Fri, 13 Sep 2024 07:31:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ibgvZqZK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD5C10E194
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 07:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726212677; x=1757748677;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=X0Cd3iWRBdsqEaJgMNolYS7QPw33XBGiOAvAbuhqSWg=;
 b=ibgvZqZK4m6oYjDCZU0GPQJYf5/B4cZD9VBtUWK6CI881/6m8I0KEmkr
 g3eirjYoPQgsjD367B/FG7Aa0ByvKl/j/6wKivzKiMjwATEvQ6z/KYS3E
 UeutNTPVePt6y61PvGUCgFgWzi9rsr8WxumjwfSc9a5P1qYUL2lZeQfUs
 FF9n8njGdnfIzlDWGm8W6uj69j9FNbyTYnkGbPM3ps7HpMb46iV8HqMaO
 UPiTNJ+We1mpA0LWnScttCWKknNUfGEIlxFKLI26QZzmZKmrlWv0NLRJw
 4BCd5zRa14ZRwq6mL3fVqxm41zCR0A6O98JcQp8GDd21M5JUMiRJtFD1E A==;
X-CSE-ConnectionGUID: z31hQ2ijSj+Jh98xemhUKA==
X-CSE-MsgGUID: V6fqvmyRSXG9+qC08iKlOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="28844944"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; d="scan'208";a="28844944"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 00:31:16 -0700
X-CSE-ConnectionGUID: 899fQ0x+SG6WjFTlgneAvQ==
X-CSE-MsgGUID: e8RVK00YQSqrf9PGxyCPMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; d="scan'208";a="67936102"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.64])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 00:31:12 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, =?utf-8?Q?Ma?=
 =?utf-8?Q?=C3=ADra?= Canal
 <mairacanal@riseup.net>, =?utf-8?Q?Andr=C3=A9?= Almeida
 <andrealmeid@igalia.com>, Arthur
 Grillo <arthurgrillo@riseup.net>, Tales Lelo da Aparecida
 <tales.aparecida@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v4 RESEND 0/9] Increase coverage on drm_framebuffer.c
In-Reply-To: <172605715531.956551.13163712003461695066.b4-ty@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240911001559.28284-1-gcarlos@disroot.org>
 <172605715531.956551.13163712003461695066.b4-ty@kernel.org>
Date: Fri, 13 Sep 2024 10:31:08 +0300
Message-ID: <87ttekdn7n.fsf@intel.com>
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

On Wed, 11 Sep 2024, Maxime Ripard <mripard@kernel.org> wrote:
> On Tue, 10 Sep 2024 21:15:25 -0300, Carlos Eduardo Gallo Filho wrote:
>> This patchset includes new KUnit tests for 5 untested functions from
>> drm_framebuffer.c and improvements to the existent one.
>> 
>> The first patch replace the use of dev_private member from drm_device
>> mock on the existent test by embedding it into an outer struct containing
>> a generic pointer.
>> 
>> [...]
>
> Applied to misc/kernel.git (drm-misc-next).

How was this series itself tested? It would be prudent to Cc: intel-gfx
on stuff like this to run it through our CI. I don't think it ever
passed [1].

BR,
Jani.


[1] https://intel-gfx-ci.01.org/tree/drm-tip/shards-all.html?testfilter=drm_framebuffer



-- 
Jani Nikula, Intel
