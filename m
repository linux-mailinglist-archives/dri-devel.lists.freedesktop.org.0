Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A6DC0DE0A
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 14:10:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2655D10E487;
	Mon, 27 Oct 2025 13:10:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T4vQqcTu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0384C10E487;
 Mon, 27 Oct 2025 13:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761570654; x=1793106654;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=bhZUeB7NmVzZmUhr+5uicqGdjLVXnR5+IWSyaKEneVk=;
 b=T4vQqcTuo7r+em9ylt1SMfUb1UUaAQaa0cKa7BkMFLniV/LY9zxVkOUP
 Tzp4A12hW5TXuhaGumR+ELvIx9DfR6MvXGEMGtOIJrhI9rCGnKZJTEed8
 0USAJjNGq0zxgFv9R9fC54ptJGxV0E9AUBDHNNDTuJsAhvCMJ/tqOG9Q3
 UgtRp1LcEF1mjZGV02IANIx6y76GVYL/HdHCncy/H4YdUo85mYhWhqGcC
 q4yJXy5RuRqBdm/0qHFBmIJ+6Tl0s8PWMrG+RYm07l/B+x/lCN9DRMBdm
 5bTPs4xRtMlhJFRmZ5tBqO/STtYF2fum0IypQ+WXHrGskIXO/BC4hXsGs g==;
X-CSE-ConnectionGUID: GruytmYZSZO0vy28U5Nr3g==
X-CSE-MsgGUID: 7FYeLs9bQLmBhl5auJ5NLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63536820"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="63536820"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 06:10:54 -0700
X-CSE-ConnectionGUID: rVKPhgXuQu2SDUnXFjJu2A==
X-CSE-MsgGUID: 552ySiwKSF2XJ+x8KmK7Hw==
X-ExtLoop1: 1
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.35])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 06:10:50 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, maarten.lankhorst@linux.intel.com, Maxime
 Ripard <mripard@kernel.org>, David Airlie <airlied@redhat.com>,
 simona.vetter@ffwll.ch
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2 0/3] drm: replace drm_print.h includes from headers
 with a forward declaration
In-Reply-To: <625c965e-e875-4d5b-88a3-0adaed39fbd6@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1761126446.git.jani.nikula@intel.com>
 <d2753c3c-9fcc-436b-bbae-75f40b29bce6@suse.de>
 <2266c3955cd1153aabc909fd3b7a4f019a549989@intel.com>
 <625c965e-e875-4d5b-88a3-0adaed39fbd6@suse.de>
Date: Mon, 27 Oct 2025 15:10:48 +0200
Message-ID: <4058ecec85069f67787bb2757cdb9b450405d70f@intel.com>
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
> Hi
>
> Am 27.10.25 um 13:04 schrieb Jani Nikula:
>> On Mon, 27 Oct 2025, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>>> Hi,
>>>
>>> for the series
>>>
>>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Thanks!
>>
>>> Some thoughts: Consider merging patches 1 and 2 OR split off the change
>>> to ttm_resource.h from patch 3.=C2=A0 Doing the latter would make a rev=
ert of
>>> the forward declaration easier in case some trees stop building. Feel
>>> free to put everything into drm-misc-next if that still compiles then.
>> I'm sorry, I don't understand what you're getting at. The series is
>> bisectable, and in the first patch the indirect source of drm_print.h is
>> drm_mm.h, and in the third patch it's ttm_resource.h.
>
> Sorry, I misread that. Then maybe consider splitting off those header=20
> changes into separate patches. They could be reverted by themselves=20
> easily without touching all the drivers. Your choice.

You mean first change all the drivers, and then nuke the includes in the
headers? Okay, I can do that, though I believe it would just be easier
to add the includes in the places that break.

BR,
Jani.


>
> Best regards
> Thomas
>
>>
>> BR,
>> Jani.
>>
>>

--=20
Jani Nikula, Intel
