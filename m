Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4718A18CA
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 17:33:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2465710F019;
	Thu, 11 Apr 2024 15:33:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GV07tvMU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A97E910F191;
 Thu, 11 Apr 2024 15:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712849588; x=1744385588;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=YU6hBRKEi7nNXwvrwjkbMFWVMjuJkeNtr6EWDwBJeaQ=;
 b=GV07tvMUh+NLCWrZ3yaON7TAWKmqcc4tT2Z5YnlcFfIcAf/U/0fNfIHE
 c0SBumxnqt2w+ziLEwbrqN+ceVymFKlgY3BCEuOKoX+BuzA1CRmzu4kuG
 8+Bz0a3iH4Ygc5Uv827bz8hnlPATIEaz8SKGzUj5hEemZ5g9El5GVEsS6
 Ir7SPFaHDkok7dbAY8x+3gG/IY4s/hWJWuFZ4drnXvmtVk0oTFMmVBz9L
 cV1pkpB68OAl6//3b4uzkcEhhyPRWBTEBLGPxFsHuf/hUyE5d/AMr3ARe
 W6WZzkvFkHRNO+wXehPYu2RDC0B/qsnDSuLjHu/oAaD8iwyV72WslHKwL g==;
X-CSE-ConnectionGUID: soa/umr1T7ix89o5GIxqQg==
X-CSE-MsgGUID: tM9NrqcyQ5KzfWGrKj5u9g==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8185182"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="8185182"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 08:33:08 -0700
X-CSE-ConnectionGUID: LjlKPNDyQb+8XjjusviqIQ==
X-CSE-MsgGUID: VriTakwqTLuORAK7raibbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="21429135"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 08:33:04 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, Dave
 Airlie <airlied@gmail.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Hans de Goede <hdegoede@redhat.com>,
 Ilpo =?utf-8?Q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH v2] drm: move i915_drm.h under include/drm/intel
In-Reply-To: <Zhfx9weiu7Hp19gy@ashyti-mobl2.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <63e199dec91cc2e717d81ab00e28f68b9bec8461.1712743191.git.jani.nikula@intel.com>
 <20240410102615.16506-1-jani.nikula@intel.com>
 <Zhfx9weiu7Hp19gy@ashyti-mobl2.lan>
Date: Thu, 11 Apr 2024 18:33:00 +0300
Message-ID: <874jc76hjn.fsf@intel.com>
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

On Thu, 11 Apr 2024, Andi Shyti <andi.shyti@linux.intel.com> wrote:
> Hi Jani,
>
> On Wed, Apr 10, 2024 at 01:26:15PM +0300, Jani Nikula wrote:
>> Clean up the top level include/drm directory by grouping all the Intel
>> specific files under a common subdirectory.
>>=20
>> v2: Also fix comment in intel_pci_config.h (Ilpo)
>>=20
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: Dave Airlie <airlied@gmail.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Bjorn Helgaas <bhelgaas@google.com>
>> Cc: Hans de Goede <hdegoede@redhat.com>
>> Cc: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  arch/x86/kernel/early-quirks.c             | 2 +-
>>  drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 2 +-
>>  drivers/gpu/drm/i915/gt/intel_ggtt.c       | 2 +-
>>  drivers/gpu/drm/i915/gt/intel_rps.c        | 2 +-
>>  drivers/gpu/drm/i915/intel_pci_config.h    | 2 +-
>>  drivers/gpu/drm/i915/soc/intel_gmch.c      | 2 +-
>>  drivers/gpu/drm/xe/xe_ggtt.c               | 2 +-
>>  drivers/platform/x86/intel_ips.c           | 2 +-
>>  include/drm/{ =3D> intel}/i915_drm.h         | 0
>>  9 files changed, 8 insertions(+), 8 deletions(-)
>>  rename include/drm/{ =3D> intel}/i915_drm.h (100%)
>
> Am I seeing wrong or are you missing a bunch of them, like
> Documentation, MAINTAINERS and many more?

uapi/drm/i915_drm.h is different!

But good point about MAINTAINERS, I'll add a separate patch on top.

BR,
Jani.

>
> Andi

--=20
Jani Nikula, Intel
