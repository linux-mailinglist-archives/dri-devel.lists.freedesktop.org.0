Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EA8C0D620
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 13:04:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB3F810E44B;
	Mon, 27 Oct 2025 12:04:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jhAqckHa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99A0610E442;
 Mon, 27 Oct 2025 12:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761566663; x=1793102663;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=z6PtE3johW5vJLX1vTiHKPTlmGotYrgMC5atz+ScftI=;
 b=jhAqckHalrn2ahnYkUMhyXwRP22AA9udAVBqZ9utg8cMzB3aSZ4hLF19
 neSyQ3StWK1V5/8lZsk62yVZ3fMNECXKUx+7LMuPC0QTW2403lazCHAEr
 Qm7ce5fEWOKFMB672FZdNxBR9Tde0S3QztIbEt09GvCMR8yO8ejFyBkN/
 4glDicYFI8Lpzh7oMXSLbH6LmpZtlHlaJV6BiscpRuA4VbwUrM8+/j5VS
 D/dNvRDmYZLOMcnMHNcrckIShWWNkVawGWmdivmZlC70qOttMbVdKySc6
 iOm01SipzErsak75xdbPLEyN05ezAmEh8VY9GfwVRqAlxuCd9nVrmj28i A==;
X-CSE-ConnectionGUID: stlQk41fSjiqWTwi0spcWg==
X-CSE-MsgGUID: cnZ5yRCRRuWwrDHv0BgYww==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74985868"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="74985868"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 05:04:22 -0700
X-CSE-ConnectionGUID: oZDx2a3CT4a3Fy6UrTapYw==
X-CSE-MsgGUID: kYy+eSPuSvK3QOGrkYCSAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="190239263"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.35])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 05:04:20 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, maarten.lankhorst@linux.intel.com, Maxime
 Ripard <mripard@kernel.org>, David Airlie <airlied@redhat.com>,
 simona.vetter@ffwll.ch
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2 0/3] drm: replace drm_print.h includes from headers
 with a forward declaration
In-Reply-To: <d2753c3c-9fcc-436b-bbae-75f40b29bce6@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1761126446.git.jani.nikula@intel.com>
 <d2753c3c-9fcc-436b-bbae-75f40b29bce6@suse.de>
Date: Mon, 27 Oct 2025 14:04:17 +0200
Message-ID: <2266c3955cd1153aabc909fd3b7a4f019a549989@intel.com>
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

On Mon, 27 Oct 2025, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Hi,
>
> for the series
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks!

> Some thoughts: Consider merging patches 1 and 2 OR split off the change=20
> to ttm_resource.h from patch 3.=C2=A0 Doing the latter would make a rever=
t of=20
> the forward declaration easier in case some trees stop building. Feel=20
> free to put everything into drm-misc-next if that still compiles then.

I'm sorry, I don't understand what you're getting at. The series is
bisectable, and in the first patch the indirect source of drm_print.h is
drm_mm.h, and in the third patch it's ttm_resource.h.

BR,
Jani.


--=20
Jani Nikula, Intel
