Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 365B19730F8
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 12:05:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9387510E76F;
	Tue, 10 Sep 2024 10:05:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pg2baB2p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A527F10E76E;
 Tue, 10 Sep 2024 10:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725962756; x=1757498756;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=lksaFRNSnbAobheIMXfnXmU79Kn4ZJJEOMJn5NfKkbc=;
 b=Pg2baB2pCnBpyiZjDGemH0D948WQ0JSwJZR2Jlnjpqs7xvHRoIX7M8bL
 HQIGmZ6QI8nHQ/rnFDB8MsjIo5DX3AI6boZ+EzbSAG9yN1j0C6y8gKKJw
 8Nvi58qYTz/GNIGvdiQxDrEJxhawqOJA5Q1QumrqhESWL3vKNiZRpLjLM
 qwaoUHqr+X1UjA+pw1S4pdjHt55LMIfaxs8uP5IMY/9rSZcbblQhw6igb
 mfjTss2qo2DyJciCytSjxoiEDts6cjLDOjwfwVqjj6xOSoxjO4moNHH9X
 /wSO3a6h3hEl2EDEU7lxzPOK5IDHEE8iDHdBhOeCo8/PR8EEsYzIfe+fw w==;
X-CSE-ConnectionGUID: LE6qFt/6SaKlvIFkCtw1DQ==
X-CSE-MsgGUID: Wi28quijS3ij/kgchCAeQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24514424"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="24514424"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 03:05:56 -0700
X-CSE-ConnectionGUID: fDU1dbVuQlGC0o8RX9j80Q==
X-CSE-MsgGUID: cd6ttgs0Ri2ShMxZ8ulRDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="71951966"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.43])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 03:05:53 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm: enable warnings on unused static inlines
In-Reply-To: <87seuer1we.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240904123819.3784906-1-jani.nikula@intel.com>
 <20240904223030.GA1944054@thelio-3990X> <87seuer1we.fsf@intel.com>
Date: Tue, 10 Sep 2024 13:05:50 +0300
Message-ID: <87zfofkem9.fsf@intel.com>
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

On Thu, 05 Sep 2024, Jani Nikula <jani.nikula@intel.com> wrote:
> On Wed, 04 Sep 2024, Nathan Chancellor <nathan@kernel.org> wrote:
>> I ran this through my test matrix and this is what it found (across
>> various configuration options, I can give specifics as necessary):
>
> Thanks, I didn't really expect this would not catch anything. :)
>
> We've already fixed some in drm-misc-next and drm-intel-next, see
> below. Will need to fix more before merging, obviously.

New try with fixes at [1]. Fingers crossed.

BR,
Jani.


[1] https://lore.kernel.org/r/cover.1725962479.git.jani.nikula@intel.com

-- 
Jani Nikula, Intel
