Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D06D727A70
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 10:51:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F0D10E046;
	Thu,  8 Jun 2023 08:50:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6461810E061;
 Thu,  8 Jun 2023 08:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686214255; x=1717750255;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=esMR98J98Uo4sVHFwhlQLtMKzN4zizLA/KffyT7o7ug=;
 b=H0DOm5Gk0cGALACi/0K1C0rhbS8Sbx58BC/2zqbwqT/m0n5K2J2PSeRd
 0Rwcw9AmCwLBVIxJoQTwogdzNHvlGw4NUky5ePmtWALdNNqBaJMTzgKch
 7csqdfZB2GYTagcblCKxB3yFMZ2WvNCMYvVedpzZOUtw3q5Ihg5Iy6bcc
 9qL/vOvzTHohuVXyoKs6tzgptyhNn+gO/ptqd3TRrv8NRmNz1+4HnA2WW
 BUgLZB9xsW+dd1XvicCpvX0vb4B1C2sxu8HKHQvHy8GPr9IJKgaY05774
 ApJmo2f3wrgxI0a9l6N7C9CInTUvVk/StGaZy18h8c13Gf4zs9li+mKSj g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="443621012"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="443621012"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 01:50:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="799744471"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="799744471"
Received: from ovaispap-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.59.117])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 01:50:50 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Dave Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PULL] drm-MISC-fixes
In-Reply-To: <0182c0fb-fa03-9a3b-29c0-25706cc89c4a@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <ZIGUHBz7+LsqN2nm@jlahtine-mobl.ger.corp.intel.com>
 <0182c0fb-fa03-9a3b-29c0-25706cc89c4a@linux.intel.com>
Date: Thu, 08 Jun 2023 11:50:48 +0300
Message-ID: <87zg5as5g7.fsf@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 08 Jun 2023, Maarten Lankhorst <maarten.lankhorst@linux.intel.com> =
wrote:
> Oops, forgot to fix topic. :-)

And replied to the wrong message. ;)

But why was it wrong, not using dim?

BR,
Jani.

>
> On 2023-06-08 10:41, Joonas Lahtinen wrote:
>> Hi Dave & Daniel,
>>
>> Here's the drm-intel-fixes PR for v6.4-rc6.
>>
>> Couple of display compatibility fixes and two static checker fixes for
>> selftests.
>>
>> Regards, Joonas
>>
>> ***
>>
>> drm-intel-fixes-2023-06-08:
>>
>> CDCLK voltage fix for ADL-P and eDP wake sync pulse fix.
>> Two error handling fixes to selftests (to appease static checkers)
>>
>> The following changes since commit 9561de3a55bed6bdd44a12820ba81ec416e70=
5a7:
>>
>>   Linux 6.4-rc5 (2023-06-04 14:04:27 -0400)
>>
>> are available in the Git repository at:
>>
>>   git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2023-=
06-08
>>
>> for you to fetch changes up to 79d0150d2d983a4f6efee676cea06027f586fcd0:
>>
>>   drm/i915/selftests: Add some missing error propagation (2023-06-07 12:=
43:22 +0300)
>>
>> ----------------------------------------------------------------
>> CDCLK voltage fix for ADL-P and eDP wake sync pulse fix.
>> Two error handling fixes to selftests (to appease static checkers)
>>
>> ----------------------------------------------------------------
>> Andi Shyti (1):
>>       drm/i915/gt: Use the correct error value when kernel_context() fai=
ls
>>
>> Chaitanya Kumar Borah (1):
>>       drm/i915/display: Set correct voltage level for 480MHz CDCLK
>>
>> Jouni H=C3=B6gander (1):
>>       drm/i915: Use 18 fast wake AUX sync len
>>
>> Tvrtko Ursulin (1):
>>       drm/i915/selftests: Add some missing error propagation
>>
>>  drivers/gpu/drm/i915/display/intel_cdclk.c         | 30 +++++++++++++++=
++++---
>>  drivers/gpu/drm/i915/display/intel_dp_aux.c        |  2 +-
>>  .../gpu/drm/i915/gem/selftests/i915_gem_context.c  | 14 +++++++---
>>  drivers/gpu/drm/i915/gt/selftest_execlists.c       | 12 ++++++---
>>  4 files changed, 45 insertions(+), 13 deletions(-)

--=20
Jani Nikula, Intel Open Source Graphics Center
