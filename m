Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BEE83BE17
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 10:56:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0DE210F872;
	Thu, 25 Jan 2024 09:56:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8D0B10F85E;
 Thu, 25 Jan 2024 09:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706176569; x=1737712569;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=GxwRbE55YIwDHZtfx76YzVpE3RzFJjrHMcE6Kj92Rps=;
 b=eLLEMHa5l9foFnKJqxnQBAX8Xjvez0u2bQcWX0B4uDL/bYlufuWNjKax
 gpNojaC7pCd/FPrf/6WXQqqPaXthGP5G175UVQHKbmIV0RfgTUF3LG02H
 TSKGNpxrlhAaDbJD8i6BovARojJ0pQRXNq9xumT8shnjWG54nAaRWwnNi
 yC8lPVTFM0ROIhO7pw6STJQnzQYGy2146HBHMNCow9Q/yBI5/keDHmYaw
 D7G4uWFuDDIXvclNIHeC2SNTaDe4VRtVz22ChpX66JFQyXonZeq2f00k1
 Cy/Yv1r+VysgzYkMqmz+/w//aQzOMWwyLHMpXSxCtRhZOEK5D/brIpaQG A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="23578977"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="23578977"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 01:56:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2188240"
Received: from cyrillet-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.58.252])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 01:56:05 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Yury Norov <yury.norov@gmail.com>
Subject: Re: Re: [PATCH 1/3] bits: introduce fixed-type genmasks
In-Reply-To: <170611134445.31262.2799581830173501277@gjsousa-mobl2>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240124050205.3646390-1-lucas.demarchi@intel.com>
 <20240124050205.3646390-2-lucas.demarchi@intel.com>
 <87v87jkvrx.fsf@intel.com>
 <gvkvihpcc45275idrfukjqbvgem767evrux5sx5lnh5hofqemk@ppbkcauitvwb>
 <ZbEsfl0tGLY+xJl0@yury-ThinkPad>
 <170611134445.31262.2799581830173501277@gjsousa-mobl2>
Date: Thu, 25 Jan 2024 11:56:01 +0200
Message-ID: <878r4dlosu.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 24 Jan 2024, Gustavo Sousa <gustavo.sousa@intel.com> wrote:
> Quoting Yury Norov (2024-01-24 12:27:58-03:00)
>>On Wed, Jan 24, 2024 at 08:03:53AM -0600, Lucas De Marchi wrote:
>>> On Wed, Jan 24, 2024 at 09:58:26AM +0200, Jani Nikula wrote:
>>> > On Tue, 23 Jan 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>>> > > From: Yury Norov <yury.norov@gmail.com>
>>> > >=20
>>> > > Generalize __GENMASK() to support different types, and implement
>>> > > fixed-types versions of GENMASK() based on it. The fixed-type versi=
on
>>> > > allows more strict checks to the min/max values accepted, which is
>>> > > useful for defining registers like implemented by i915 and xe drive=
rs
>>> > > with their REG_GENMASK*() macros.
>>> >=20
>>> > Mmh, the commit message says the fixed-type version allows more strict
>>> > checks, but none are actually added. GENMASK_INPUT_CHECK() remains the
>>> > same.
>>> >=20
>>> > Compared to the i915 and xe versions, this is more lax now. You could
>>> > specify GENMASK_U32(63,32) without complaints.
>>>=20
>>> Doing this on top of the this series:
>>>=20
>>> -#define   XELPDP_PORT_M2P_COMMAND_TYPE_MASK            REG_GENMASK(30,=
 27)
>>> +#define   XELPDP_PORT_M2P_COMMAND_TYPE_MASK            REG_GENMASK(62,=
 32)
>>>=20
>>> and I do get a build failure:
>>>=20
>>> ../drivers/gpu/drm/i915/display/intel_cx0_phy.c: In function =E2=80=98_=
_intel_cx0_read_once=E2=80=99:
>>> ../include/linux/bits.h:41:31: error: left shift count >=3D width of ty=
pe [-Werror=3Dshift-count-overflow]
>>>    41 |          (((t)~0ULL - ((t)(1) << (l)) + 1) & \
>>>       |                               ^~

I stand corrected.

>>
>>I would better include this in commit message to avoid people's
>>confusion. If it comes to v2, can you please do it and mention that
>>this trick relies on shift-count-overflow compiler check?
>
> Wouldn't it be better to have explicit check that l and h are not out of =
bounds
> based on BITS_PER_TYPE() than relying on a compiler flag that could be tu=
rned
> off (maybe for some questionable reason, but even so)?

My preference would be the explicit check, a comment in code, or an
explanation in the commit message, in this order. Because honestly, none
of this is obvious, and a future refactoring of GENMASK might just
inadvertently thwart the whole check.

Regardless, my main concern was moot, on the series,

Acked-by: Jani Nikula <jani.nikula@intel.com>


--=20
Jani Nikula, Intel
