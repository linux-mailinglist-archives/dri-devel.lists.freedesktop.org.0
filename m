Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFE06CAA11
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 18:13:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85FBD10E610;
	Mon, 27 Mar 2023 16:13:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67DC310E610
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 16:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679933579; x=1711469579;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=6nDdB6nJGY9awDPV/o7SbWl0Kh2wlGZpTm2nwuANIKs=;
 b=d9QnAYBjCVidpdFepP4eTEruYwOAsFx//icL7TSkyd2mMSqzuV3B7BxC
 VzAOqOFSvDYLfUUCn8K6ArnhgM681C+qleQh9Z7sj2W7OE5FMnM6UnG23
 GDWlNa5qtGuIsF6ZAvZ/gKkxuXhJ+XxqROK2WzWkCTXUBv533kEJ5/0AP
 sRHhDV13ecS38dZnAODKNYI4FWjYV8RnMmuN5nEW+RHfJt5C0uKU8uNFY
 /srYfnTFlrdJVgCecqR3/dvv36ABNvnPdSgew1NjGEXxo0hrMvZl5GFCK
 LqBnnDaLtqdq2xK7bRYwXZWwaZeq6aJxpjAxDdVIZdgNmDKpa2xqodgQF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="339033783"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; d="scan'208";a="339033783"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 09:12:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="772769879"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; d="scan'208";a="772769879"
Received: from mstancu-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.49.51])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 09:12:05 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>
Subject: Re: Linux 6.3-rc3
In-Reply-To: <CAK7LNATe7Ah-ow9wYGrtL9i4z-VD=MCo=sJjbC_S0ofEoH6CFQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CAHk-=wiPd8R8-zSqTOtJ9KYeZLBByHug7ny3rgP-ZqzpP_KELg@mail.gmail.com>
 <20230320180501.GA598084@dev-arch.thelio-3990X>
 <CAHk-=wgSqpdkeJBb92M37JNTdRQJRnRUApraHKE8uGHTqQuu2Q@mail.gmail.com>
 <20230320185337.GA615556@dev-arch.thelio-3990X>
 <87pm91uf9c.fsf@kernel.org>
 <CA+icZUUYyqhV2HFzVtpi_KjBoYxjk7OB0UBVd2mX6abjmYhDjg@mail.gmail.com>
 <CAHk-=whdrvCkSWh=BRrwZwNo3=yLBXXM88NGx8VEpP1VTgmkyQ@mail.gmail.com>
 <CAK7LNATe7Ah-ow9wYGrtL9i4z-VD=MCo=sJjbC_S0ofEoH6CFQ@mail.gmail.com>
Date: Mon, 27 Mar 2023 19:12:02 +0300
Message-ID: <87bkke5g31.fsf@intel.com>
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
Cc: Kalle Valo <kvalo@kernel.org>, llvm@lists.linux.dev,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 linux-toolchains@vger.kernel.org, sedat.dilek@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 25 Mar 2023, Masahiro Yamada <masahiroy@kernel.org> wrote:
> Hello Linus,
>
>
> Thanks for giving me some more homeworks.
>
>
> On Thu, Mar 23, 2023 at 1:56=E2=80=AFAM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
>>
>> On Wed, Mar 22, 2023 at 9:40=E2=80=AFAM Sedat Dilek <sedat.dilek@gmail.c=
om> wrote:
>> >
>> > You have to pass `make LLVM=3D1` in any case... to `oldconfig` or when
>> > adding any MAKEFLAGS like -j${number-of-available-cpus}.
>>
>> I actually think we should look (again) at just making the compiler
>> choice (and the prefix) be a Kconfig option.
>>
>> That would simplify *so* many use cases.
>>
>> It used to be that gcc was "THE compiler" and anything else was just
>> an odd toy special case, but that's clearly not true any more.
>>
>> So it would be lovely to make the kernel choice a Kconfig choice - so
>> you'd set it only at config time, and then after that a kernel build
>> wouldn't need special flags any more, and you'd never need to play
>> games with GNUmakefile or anything like that.
>
>
> Presumably, this is the right direction.
>
> To achieve it, Kconfig needs to have some mechanism to evaluate
> shell commands dynamically.
>
> If a user switches the toolchain set between GCC and LLVM
> while running the Kconfig, $(cc-option) in Kconfig files must
> be re-calculated.
>
> Currently, Kconfig cannot do it. All macros are static - they are
> expanded in the parse stage, and become constant strings.
>
> Ulf Magnusson and I discussed the dynamic approach a few years back,
> but I adopted the static way since it is much simpler.
> We need to reconsider the dynamic approach to do this correctly.
> I do not think it is too difficult technically.
> We just need to come up with a decent syntax.

I acknowledge being clueless about mostly everything that requires. But
in the mean time, how about just adding something like:

-include .env

near the beginning of the top Makefile?

You could shove the tools or ARCH or output dir etc. there, so you don't
have to remember to add them on the command line every time.

BR,
Jani.



>
>
>
>> Yes, you'd still use environment variables (or make arguments) for
>> that initial Kconfig, but that's no different from the other
>> environment variables we already have, like KCONFIG_SEED that kconfig
>> uses internally, but also things like "$(ARCH)" that we already use
>> *inside* the Kconfig files themselves.
>>
>> I really dislike how you have to set ARCH and CROSS_COMPILE etc
>> externally, and can't just have them *in* the config file.
>>
>> So when you do cross-compiles, right now you have to do something like
>>
>>     make ARCH=3Di386 allmodconfig
>>
>> to build the .config file, but then you have to *repeat* that
>> ARCH=3Di386 when you actually build things:
>>
>>     make ARCH=3Di386
>>
>> because the ARCH choice ends up being in the .config file, but the
>> makefiles themselves always take it from the environment.
>>
>> There are good historical reasons for our behavior (and probably a
>> number of extant practical reasons too), but it's a bit annoying, and
>> it would be lovely if we could start moving away from this model.
>>
>>             Linus
>
>
> Moving ARCH into the .config file needs careful thoughts, I think.
>
> Not all targets include the .config file.
> For example, "make clean", "make help", etc.
>
> It is unclear which targets require explicit ARCH=3D option.
>
> One solution is to move "archhelp", "CLEAN_FILES" etc.
> from arch/*/Makefile to the top Makefile.
> We will lose per-arch splitting in several places, though.
>
>
> U-Boot adopts this model - 'ARCH' is determined in the Kconfig time,
> so users do not need to give ARCH=3D option from the command line.
>
> https://github.com/u-boot/u-boot/blob/v2023.01/arch/Kconfig#L44
>
> You may get a quick idea of what it will look like.
>
>
>
> I will take a look at this direction (the compiler choice in Kconfig firs=
t),
> but it will not happen soonish due to the limited time for upstream work.
>
>
> --
> Best Regards
>
> Masahiro Yamada

--=20
Jani Nikula, Intel Open Source Graphics Center
