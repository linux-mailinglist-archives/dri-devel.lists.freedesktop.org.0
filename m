Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CE26CAB61
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 19:03:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B40ED10E118;
	Mon, 27 Mar 2023 17:03:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43CCF10E118
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 17:03:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B3D0D61357;
 Mon, 27 Mar 2023 17:03:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3048CC433EF;
 Mon, 27 Mar 2023 17:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679936619;
 bh=DNwoMAHx/naFTub4e3g7Qvz60taxpwVzggpquY2OoJ0=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=TSLfZXWk/AS39G+IOvNDv9h+VS8ZG2iJMprsb7TBdpu6+HHfhygzsE3nS5ukHZHZA
 mlUnFW15tHVhp63v8Xt2oYuSba24MD9o/kZseGNC31rGFcPS6EOnEeuzGsmUT0jZEA
 vfdggh4rwIWFCb89PQfUFRNjaYdyTg1oR6RULq/EmdG3vvIMn0yoU5yN0CIoLMl+N9
 8qtem2gVxTMYj6On1AEhtyNujuMUiH2ffnkPH0WF7DiuSzK/vuq+Gz51oO/HDKyK20
 Ihn1oY+vXxjZ891UVLWughgZ21iJqVy72yrvAPEsgyF72ooO6IRQHPCPe3JS5Rr1QQ
 AyNhC+IwqnPjQ==
From: Kalle Valo <kvalo@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: Linux 6.3-rc3
References: <CAHk-=wiPd8R8-zSqTOtJ9KYeZLBByHug7ny3rgP-ZqzpP_KELg@mail.gmail.com>
 <20230320180501.GA598084@dev-arch.thelio-3990X>
 <CAHk-=wgSqpdkeJBb92M37JNTdRQJRnRUApraHKE8uGHTqQuu2Q@mail.gmail.com>
 <20230320185337.GA615556@dev-arch.thelio-3990X>
 <87pm91uf9c.fsf@kernel.org>
 <CA+icZUUYyqhV2HFzVtpi_KjBoYxjk7OB0UBVd2mX6abjmYhDjg@mail.gmail.com>
 <CAHk-=whdrvCkSWh=BRrwZwNo3=yLBXXM88NGx8VEpP1VTgmkyQ@mail.gmail.com>
 <CAK7LNATe7Ah-ow9wYGrtL9i4z-VD=MCo=sJjbC_S0ofEoH6CFQ@mail.gmail.com>
 <87bkke5g31.fsf@intel.com>
Date: Mon, 27 Mar 2023 20:03:34 +0300
In-Reply-To: <87bkke5g31.fsf@intel.com> (Jani Nikula's message of "Mon, 27 Mar
 2023 19:12:02 +0300")
Message-ID: <87jzz2cejd.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
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
Cc: Masahiro Yamada <masahiroy@kernel.org>, llvm@lists.linux.dev,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 linux-toolchains@vger.kernel.org, sedat.dilek@gmail.com,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Jani Nikula <jani.nikula@linux.intel.com> writes:

> On Sat, 25 Mar 2023, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
>> On Thu, Mar 23, 2023 at 1:56=E2=80=AFAM Linus Torvalds
>> <torvalds@linux-foundation.org> wrote:
>>>
>>> On Wed, Mar 22, 2023 at 9:40=E2=80=AFAM Sedat Dilek <sedat.dilek@gmail.=
com> wrote:
>>> >
>>> > You have to pass `make LLVM=3D1` in any case... to `oldconfig` or when
>>> > adding any MAKEFLAGS like -j${number-of-available-cpus}.
>>>
>>> I actually think we should look (again) at just making the compiler
>>> choice (and the prefix) be a Kconfig option.
>>>
>>> That would simplify *so* many use cases.
>>>
>>> It used to be that gcc was "THE compiler" and anything else was just
>>> an odd toy special case, but that's clearly not true any more.
>>>
>>> So it would be lovely to make the kernel choice a Kconfig choice - so
>>> you'd set it only at config time, and then after that a kernel build
>>> wouldn't need special flags any more, and you'd never need to play
>>> games with GNUmakefile or anything like that.
>>
>>
>> Presumably, this is the right direction.
>>
>> To achieve it, Kconfig needs to have some mechanism to evaluate
>> shell commands dynamically.
>>
>> If a user switches the toolchain set between GCC and LLVM
>> while running the Kconfig, $(cc-option) in Kconfig files must
>> be re-calculated.
>>
>> Currently, Kconfig cannot do it. All macros are static - they are
>> expanded in the parse stage, and become constant strings.
>>
>> Ulf Magnusson and I discussed the dynamic approach a few years back,
>> but I adopted the static way since it is much simpler.
>> We need to reconsider the dynamic approach to do this correctly.
>> I do not think it is too difficult technically.
>> We just need to come up with a decent syntax.
>
> I acknowledge being clueless about mostly everything that requires. But
> in the mean time, how about just adding something like:
>
> -include .env
>
> near the beginning of the top Makefile?
>
> You could shove the tools or ARCH or output dir etc. there, so you don't
> have to remember to add them on the command line every time.

Yes, please! Something like this, but officially supported, would be
just perfect for a lazy person like me.

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes
