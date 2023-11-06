Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D987E2D16
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 20:41:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F4310E3EC;
	Mon,  6 Nov 2023 19:41:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11E9310E3EC
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 19:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699299693; x=1730835693;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=/ApfnDGctoPRAAUz0Kk3TUlchg/jcOFSHz85tJuZkgQ=;
 b=OSm7aVMV7iK9fABzKF+bjtHRoqXgUy+/EKRETeILDJgTFdAsikpS3knr
 WC9Fbxoa1ZzBGrQNqKhr2ulWWmF9PNT0zF4Y+0SItFQRnxXkQHwFtw6Yz
 fCP3Vm3XkZsFjoBnDvHsl6j7EzdrDpY6MIbCxst/jFj02PzQblrSqqg3c
 JAr4ElPdk3y+FjSiG/HWS0V7AbiwI8r80Pkisix2yD9vql8Hs/D02WoFN
 lPdFkrrbHoGC/cZj3bd01m93P+OfkuN6LI1KNgz3dwOWgADwmmmAH3YCg
 kVIFjNSFu2MrNA7VHH64v1vaCeRe81dmaSW8inv73vCGV5a7yG34i/e8A g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="393246965"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="393246965"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 11:41:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="3556452"
Received: from lpilolli-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.36.222])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 11:41:29 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Hunter Chasens <hunter.chasens18@ncf.edu>
Subject: Re: [PATCH v1] docs: gpu: rfc: i915_scheduler.rst remove unused
 directives for namespacing
In-Reply-To: <CAFJe6O1oJnQvLVSJZP6MMXULGrX=a3SEO1X5b4xff06WhqLw_g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231104134708.69432-1-hunter.chasens18@ncf.edu>
 <ZUhvj2uj_PvaDxIM@debian.me> <8734xj18ck.fsf@intel.com>
 <CAFJe6O1oJnQvLVSJZP6MMXULGrX=a3SEO1X5b4xff06WhqLw_g@mail.gmail.com>
Date: Mon, 06 Nov 2023 21:41:25 +0200
Message-ID: <87edh2zn2y.fsf@intel.com>
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
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, corbet@lwn.net, tzimmermann@suse.de,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, mripard@kernel.org,
 Luca Coelho <luciano.coelho@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 06 Nov 2023, Hunter Chasens <hunter.chasens18@ncf.edu> wrote:
> When running `make htmldocs` the following warnings are given.
>
> ```
> Documentation/gpu/rfc/i915_scheduler.rst:138: WARNING:
> Unknown directive type "c:namespace-push".
>
> .. c:namespace-push:: rfc
> Documentation/gpu/rfc/i915_scheduler.rst:143: WARNING:
> Unknown directive type "c:namespace-pop".
>
> .. c:namespace-pop::
> ```
>
> The kernel test robot also reported it here.
> Link: https://lore.kernel.org/all/202311061623.86pTQrie-lkp@intel.com/
>
> Last year Maryam Tahhan <mtahhan@redhat.com> from Redhat noticed something
> similar. "The missing support of c:namespace-push:: and c:namespace-pop::
> directives by helper scripts for kernel documentation prevents using the
> ``c:function::`` directive with proper namespacing." From the context, it
> sounds like this was brought about from a Sphinx update.
>
> Link: https://lore.kernel.org/all/20221123092321.88558-3-mtahhan@redhat.c=
om/
>
> When compiled the `.. kernel-doc::` literal gives it the same formatting =
with
> or without the namespace directives present. Due to the above information=
 I
> think it safe to remove these, as they don't seem to do anything but
> throw warnings.

Not so fast!

Looks like this is because namespacing was introduced in Sphinx 3.1
[1]. With earlier Sphinx, you get a warning about the namespace
directives.

However, with newer Sphinx, you get the warning mentioned in commit
f6757dfcfde7 ("drm/doc: fix duplicate declaration warning") if you
remove the namespace directives:

linux/Documentation/gpu/driver-uapi.rst:2279: WARNING: Duplicate C declarat=
ion, also defined at rfc/i915_scheduler:3.
Declaration is '.. c:struct:: i915_context_engines_parallel_submit'.

It would be short-sighted to just remove the directives. Sooner or later
we're gong to bump the (IMO extremely conservative) minimum version
requirement.


BR,
Jani.


[1] https://www.sphinx-doc.org/en/master/usage/domains/c.html#namespacing


>
> On Mon, Nov 6, 2023 at 5:31=E2=80=AFAM Jani Nikula <jani.nikula@intel.com=
> wrote:
>>
>> On Mon, 06 Nov 2023, Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>> > On Sat, Nov 04, 2023 at 09:47:08AM -0400, Hunter Chasens wrote:
>> >> diff --git a/Documentation/gpu/rfc/i915_scheduler.rst b/Documentation=
/gpu/rfc/i915_scheduler.rst
>> >> index c237ebc024cd..23ba7006929b 100644
>> >> --- a/Documentation/gpu/rfc/i915_scheduler.rst
>> >> +++ b/Documentation/gpu/rfc/i915_scheduler.rst
>> >> @@ -135,13 +135,9 @@ Add I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT and
>> >>  drm_i915_context_engines_parallel_submit to the uAPI to implement th=
is
>> >>  extension.
>> >>
>> >> -.. c:namespace-push:: rfc
>> >> -
>> >>  .. kernel-doc:: include/uapi/drm/i915_drm.h
>> >>          :functions: i915_context_engines_parallel_submit
>> >>
>> >> -.. c:namespace-pop::
>> >> -
>>
>> What makes the namespacing unnecessary?
>>
>> $ git grep '.. kernel-doc:: include/uapi/drm/i915_drm.h'
>> Documentation/gpu/driver-uapi.rst:.. kernel-doc:: include/uapi/drm/i915_=
drm.h
>> Documentation/gpu/rfc/i915_scheduler.rst:.. kernel-doc:: include/uapi/dr=
m/i915_drm.h
>>
>> And you get [1] and [2].
>>
>> >>  Extend execbuf2 IOCTL to support submitting N BBs in a single IOCTL
>> >>  -------------------------------------------------------------------
>> >>  Contexts that have been configured with the 'set_parallel' extension=
 can only
>> >
>> > The warnings go away, thanks!
>>
>> What warnings go away?
>>
>> BR,
>> Jani.
>>
>>
>> [1] https://docs.kernel.org/gpu/driver-uapi.html#c.i915_context_engines_=
parallel_submit
>> [2] https://docs.kernel.org/gpu/rfc/i915_scheduler.html#c.rfc.i915_conte=
xt_engines_parallel_submit
>>
>> >
>> > Fixes: f6757dfcfde7 ("drm/doc: fix duplicate declaration warning")
>> > Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
>>
>> --
>> Jani Nikula, Intel

--=20
Jani Nikula, Intel
