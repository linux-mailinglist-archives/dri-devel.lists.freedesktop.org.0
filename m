Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8446589D7AB
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 13:13:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7D9C10F5F5;
	Tue,  9 Apr 2024 11:13:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xi22GX88";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 527A010F5F5
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 11:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712661187; x=1744197187;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=NXG0UT6jJCzP0INeEwW/eyMrQnypHmCbGHpHQ4/tzFk=;
 b=Xi22GX88U1daFPUCOgHwADSghrc9wPJZrA6jPdVFaKNrHl5sug+u6uqD
 6V2kV3EidCGPXY72TphcvKOlozuReDVXF+JGrRECpfAZ3wEWEbL6pYTcN
 z7n7r1aHYYPVgNFeyqmam/iWFYtDGbqeyohBPF6NAzRtcqnLCE9nhfqZi
 Cqi/UJrgTUG1NlNsJrQwVIcsIeM3GkF1uwzsYvLj2fec7d26AcGxFcqTV
 M6NbTwNLlJk/8wG3fpTIeuw9vwvkIBzuf3vg3+bl+ECF/3NyUr8h3deaz
 7QLukhjm4dfIQzMLQ8sEb0UOr2V7dublb9KU4cQqUwQAc42yHdspIRjm3 g==;
X-CSE-ConnectionGUID: oYqtb3IqThSbnYqCwQhVTQ==
X-CSE-MsgGUID: 8AvHQM52QROxZi7CyrpJaA==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="8199253"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="8199253"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 04:13:06 -0700
X-CSE-ConnectionGUID: SRL5sb7wTM21oLCg8Mjllg==
X-CSE-MsgGUID: JnnQ0X5DR22ejbOutQuriA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="24677841"
Received: from mserban-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.59.228])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 04:13:02 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Maxime Ripard <mripard@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, Lucas De Marchi
 <lucas.demarchi@intel.com>, kernel test robot <lkp@intel.com>,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kbuild <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH v3 00/13] drm/display: Convert helpers Kconfig symbols
 to depends on
In-Reply-To: <CAMuHMdVMhXFm-kZ50Un1ZFmEcjJ7SnpyEyw65-wucBGpVRUFww@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240327-kms-kconfig-helpers-v3-0-eafee11b84b3@kernel.org>
 <a816fea-9974-d17f-bed6-69728e223@linux-m68k.org>
 <87sezu97id.fsf@intel.com>
 <CAMuHMdVMhXFm-kZ50Un1ZFmEcjJ7SnpyEyw65-wucBGpVRUFww@mail.gmail.com>
Date: Tue, 09 Apr 2024 14:12:59 +0300
Message-ID: <87edbe94ck.fsf@intel.com>
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

On Tue, 09 Apr 2024, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> Hi Jani,
>
> On Tue, Apr 9, 2024 at 12:04=E2=80=AFPM Jani Nikula <jani.nikula@linux.in=
tel.com> wrote:
>> On Tue, 09 Apr 2024, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>> > The user should not need to know which helpers are needed for the driv=
er
>> > he is interested in.  When a symbol selects another symbol, it should
>> > just make sure the dependencies of the target symbol are met.
>>
>> It's really not "just make sure". This leads to perpetual illegal
>> configurations, and duct tape fixes. Select should not be used for
>> visible symbols or symbols with dependencies [1].
>
> In other words: none of these helpers should be visible...

...and should have no dependencies? :p

>
>> What we'd need for usability is not more abuse of select, but rather 1)
>> warnings for selecting symbols with dependencies, and 2) a way to enable
>
> Kconfig already warns if dependencies of selected symbols are not met.

But it does lead to cases where a builtin tries to use a symbol from a
module, failing at link time, not config time. Then I regularly see
patches trying to fix this with IS_REACHABLE(), making it a silent
runtime failure instead, when it should've been a config issue.

>> a kconfig option with all its dependencies, recursively. This is what we
>> lack.
>
> You cannot force-enable all dependencies of the target symbol, as some
> of these dependencies may be impossible to meet on the system you are
> configuring a kernel for.

Surely kconfig should be able to figure out if they're possible or not.

> The current proper way is to add these dependencies to the source
> symbol, which is what we have been doing everywhere else.  Another
> solution may be to teach Kconfig to ignore any symbols that select a
> symbol with unmet dependencies.

...

It seems like your main argument in favour of using select is that it's
more convenient for people who configure the kernel. Because the user
should be able to just enable a driver, and that would select everything
that's needed. But where do we draw the line? Then what qualifies for
"depends on"?

Look at config DRM_I915 and where select abuse has lead us. Like, why
don't we just select DRM, PCI and X86 as well instead of depend. :p

A lot of things we have to select because it appears to generally be the
case that if some places select and some places depends on a symbol,
it'll lead to circular dependencies.

Sure there may be a usability issue with using depends on. But the
proper fix isn't hacking in kconfig files, it's to fix the usability in
kconfig the tool UI. But nobody steps up, because at least I find the
kconfig source to be inpenetrable. I've tried many times, and given up.

I mean, if you want to enable a driver D, it could, at a minimum, show
you a tree of (possibly alternative) things you also need to enable. But
if the dependencies aren't there, you won't even see the config for
D. That's not something that should be "fixed" by abusing select in
kconfig files.


BR,
Jani.


--=20
Jani Nikula, Intel
