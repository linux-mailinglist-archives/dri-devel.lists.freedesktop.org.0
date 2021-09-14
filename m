Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5A540B5AB
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 19:10:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 785B989E14;
	Tue, 14 Sep 2021 17:10:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BC7C89E08;
 Tue, 14 Sep 2021 17:10:24 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10107"; a="307625776"
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="307625776"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 10:10:22 -0700
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="544188720"
Received: from lveltman-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.216.6])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 10:10:17 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Nathan Chancellor <nathan@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jason Ekstrand <jason@jlekstrand.net>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Matthew Auld <matthew.auld@intel.com>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>, Nick Desaulniers
 <ndesaulniers@google.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, llvm@lists.linux.dev
Subject: Re: [PATCH 0/3] drm/i915: Enable -Wsometimes-uninitialized
In-Reply-To: <YT+QmKyKCdotTcqA@archlinux-ax161>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210824225427.2065517-1-nathan@kernel.org>
 <YT+QmKyKCdotTcqA@archlinux-ax161>
Date: Tue, 14 Sep 2021 20:10:14 +0300
Message-ID: <87wnnj13t5.fsf@intel.com>
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

On Mon, 13 Sep 2021, Nathan Chancellor <nathan@kernel.org> wrote:
> On Tue, Aug 24, 2021 at 03:54:24PM -0700, Nathan Chancellor wrote:
>> Commit 46e2068081e9 ("drm/i915: Disable some extra clang warnings")
>> disabled -Wsometimes-uninitialized as noisy but there have been a few
>> fixes to clang that make the false positive rate fairly low so it should
>> be enabled to help catch obvious mistakes. The first two patches fix
>> revent instances of this warning then enables it for i915 like the rest
>> of the tree.
>> 
>> Cheers,
>> Nathan
>> 
>> Nathan Chancellor (3):
>>   drm/i915/selftests: Do not use import_obj uninitialized
>>   drm/i915/selftests: Always initialize err in
>>     igt_dmabuf_import_same_driver_lmem()
>>   drm/i915: Enable -Wsometimes-uninitialized
>> 
>>  drivers/gpu/drm/i915/Makefile                        | 1 -
>>  drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c | 7 ++++---
>>  2 files changed, 4 insertions(+), 4 deletions(-)
>> 
>> 
>> base-commit: fb43ebc83e069625cfeeb2490efc3ffa0013bfa4
>> -- 
>> 2.33.0
>> 
>> 
>
> Ping, could this be picked up for an -rc as these are very clearly bugs?

Thanks for the patches and review. Pushed to drm-intel-gt-next and
cherry-picked to drm-intel-fixes, header to -rc2.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
