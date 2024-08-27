Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C71A3960561
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 11:20:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1971B10E2BC;
	Tue, 27 Aug 2024 09:20:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nDLjZyku";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFF7410E2BB;
 Tue, 27 Aug 2024 09:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724750405; x=1756286405;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=cIQ5Lx8hu1UIWOCXbxQbBrh8ZnqEEBadqw0L0XigrBE=;
 b=nDLjZykuTtXTfnRU4Cj/C+I9PkQ7F9MDpgZYnqgYIS/sySunujnppSa/
 mXvNELKyLSs9YOwQMsn9VUdRSelhK88YkteClsTdA5u4JMUci5eAmg73E
 SwlQYBsEEr4VuqpYbAlJMyEcQskpcM3rXSKFkD2A1myZh4C7MnQgtUcLk
 qejTn9HpP/28Y6Y3DoKUIP65FoKo9Fwyl09TEAodiN1sk3S1eAk5HmIiQ
 dm2+RlZFvq/I8hO8r6UvOnOHptH0VfQEc4W0JtS6Xc2ScPiLoeryvDgk3
 M5n86ID5/kq3LNiuDOeMyrl1ebvr9V9ywrp1PqcPgzvtKbwlLcXSNLdb0 A==;
X-CSE-ConnectionGUID: WHGD15W6QLWNfYfaKxkSoA==
X-CSE-MsgGUID: SoUuzzeFSCuuPqkkhYiK6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="26981150"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="26981150"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 02:20:04 -0700
X-CSE-ConnectionGUID: nVbmHnI8QJKLEkpX+9k0lA==
X-CSE-MsgGUID: Sfkx1TgPQGuIlOReiqqttQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="67612392"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.226])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 02:19:58 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Andi Shyti
 <andi.shyti@linux.intel.com>, renjun wang <renjunw0@foxmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, daniel@ffwll.ch, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, lyude@redhat.com,
 imre.deak@intel.com, Wayne.Lin@amd.com, ville.syrjala@linux.intel.com,
 vidya.srinivas@intel.com, jouni.hogander@intel.com,
 janusz.krzysztofik@linux.intel.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH] drm: Fix kerneldoc for "Returns" section
In-Reply-To: <c9c9e482-f80c-4158-8dc4-695f8e0c62cd@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <tencent_37A873672B5CD20DECAF99DEDAC5E45C3106@qq.com>
 <Zsz9pwQ3m9zHrjo-@ashyti-mobl2.lan>
 <c9c9e482-f80c-4158-8dc4-695f8e0c62cd@suse.de>
Date: Tue, 27 Aug 2024 12:19:54 +0300
Message-ID: <87y14iz5j9.fsf@intel.com>
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

On Tue, 27 Aug 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> My fault. Apologies if I crossed a line by just merging it into 
> drm-misc. It's just doc syntax, so I didn't think it was a big deal.

No worries, retrospective ack.

BR,
Jani.

-- 
Jani Nikula, Intel
