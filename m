Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EE5A8B5A7
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 11:39:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E79B10E8B5;
	Wed, 16 Apr 2025 09:39:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sf6AvJkB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ED4C10E8B5;
 Wed, 16 Apr 2025 09:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744796357; x=1776332357;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9fdBsleaD8dgnq57jOyrHHe3KA3jPINhieNOqKGD4VA=;
 b=Sf6AvJkBuxsdJ6c3neInpKeJFtHG3EXEoXBDC1qvM1RjeuKiBJqh3Ej9
 LqdH9vjtsbz9rwTC9dxNQIW7lemKdjlHnU1HVMYw6egz/GCDEOV9kSWgP
 89dE4x0q1n9CThFLJnMNPGRgjfPBZs9dOOHF55aAQByAxRHOKZ3duU473
 9fmPnG/HTrITfKEZcZfvDZMnF3u/H5fL8Fws9+3acerdJzxNqflLReDSC
 xPxxp7T3eFMAYBHFNKe4GiSuo3IYXvjRUGwq4WSPT5fJrwqcsQDZooKvj
 Lr3zUXLOPARyENrFCbhY/9EWwvKg8xjZl4zfCLN2gUUvmwXq4c4zomuJB Q==;
X-CSE-ConnectionGUID: h4Il3Rq2R/2RQaIWGIhZYA==
X-CSE-MsgGUID: X1TXoeq8SyCz1Uqv/DB7zA==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46497316"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; d="scan'208";a="46497316"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 02:39:17 -0700
X-CSE-ConnectionGUID: WTSAaOr3Qf+M/8N6Ta0UMA==
X-CSE-MsgGUID: DOyLZq5mRLuMjO3OY4M6FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; d="scan'208";a="153610408"
Received: from smile.fi.intel.com ([10.237.72.58])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 02:39:12 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1u4zEb-0000000CoKF-1MhN; Wed, 16 Apr 2025 12:39:09 +0300
Date: Wed, 16 Apr 2025 12:39:09 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@gmail.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] scripts/kernel-doc.py: don't create *.pyc files
Message-ID: <Z_96vRs03t4gkFoR@smile.fi.intel.com>
References: <cover.1744789777.git.mchehab+huawei@kernel.org>
 <4ad5eb8d4b819997c1615d2401581c22a32bb2c1.1744789777.git.mchehab+huawei@kernel.org>
 <87tt6opks7.fsf@intel.com> <20250416171917.0985c0eb@sal.lan>
 <20250416172901.60104103@sal.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416172901.60104103@sal.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Wed, Apr 16, 2025 at 05:29:01PM +0800, Mauro Carvalho Chehab wrote:
> Em Wed, 16 Apr 2025 17:19:17 +0800
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

...

> could you please check if this patch solves the issue?

Doesn't work for me.

-- 
With Best Regards,
Andy Shevchenko


