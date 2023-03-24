Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BF36C811A
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 16:23:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED81A10E17B;
	Fri, 24 Mar 2023 15:23:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3669110E17B
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 15:23:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BBF75B824F8;
 Fri, 24 Mar 2023 15:23:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BEF6C433EF;
 Fri, 24 Mar 2023 15:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679671398;
 bh=pSKqpC0a1kWME7wWNk8qBL0xdEmVi13/hyo55l1Pm08=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=HRiqB9cfU8MwjF/Ip6NmJBjYpbr/mpSLcd+TVVfddfoK+QK9yBnzXCdB9MoxAhYfP
 ATnCkS+AnfJK7YaoqAMFy5X//g+iAVIvZZRx0yr21uWb3M5Omm/0cLqwgFAluPa3ty
 8Sw1hqfduRdJSsUr5F6kC1omPyDMoSeYZ0ERDoguL05Mg/5mvUUTfPtM5R7GaoOLJ2
 BmhcBeO7+ipKHkUV4BRhzp00/frpyeJ7p0ylOvoj+6DNPCVTZYNnQyAONo3nd1IRPe
 XnrumaqU5wI6hKVclvYDeAq8ogxYV/UNMRUBUEtnllhvZ7MUvaXxv7naVSKnBJWZjz
 zgH44JrMoozvw==
From: Kalle Valo <kvalo@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: Linux 6.3-rc3
References: <CAHk-=wiPd8R8-zSqTOtJ9KYeZLBByHug7ny3rgP-ZqzpP_KELg@mail.gmail.com>
 <20230320180501.GA598084@dev-arch.thelio-3990X>
 <CAHk-=wgSqpdkeJBb92M37JNTdRQJRnRUApraHKE8uGHTqQuu2Q@mail.gmail.com>
 <20230320185337.GA615556@dev-arch.thelio-3990X>
 <87pm91uf9c.fsf@kernel.org>
 <20230322163637.GA918620@dev-arch.thelio-3990X>
 <87wn36ctdi.fsf@kernel.org>
 <20230324151150.GC428955@dev-arch.thelio-3990X>
Date: Fri, 24 Mar 2023 17:23:12 +0200
In-Reply-To: <20230324151150.GC428955@dev-arch.thelio-3990X> (Nathan
 Chancellor's message of "Fri, 24 Mar 2023 08:11:50 -0700")
Message-ID: <87o7oicgwv.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>, llvm@lists.linux.dev,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linux-toolchains@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Nathan Chancellor <nathan@kernel.org> writes:

>> This is nitpicking but it would be nice if the tarball contents wouldn't
>> conflict with each other. Now both llvm-16.0.0-aarch64.tar.gz and
>> llvm-16.0.0-x86_64.tar extract to the same directory llvm-16.0.0 with
>> same binary names. It would be much better if they would extract to
>> llvm-16.0.0-aarch64 and llvm-16.0.0-x86_64, respectively.
>> 
>> For example, Arnd's crosstool packages don't conflict with each other:
>> 
>> https://mirrors.edge.kernel.org/pub/tools/crosstool/
>
> I could certainly do that but what is the use case for extracting both?
> You cannot run the aarch64 version on an x86_64 host and vice versa, so
> why bother extracting them?

Ah, I didn't realise that. I assumed llvm-16.0.0-aarch64.tar.gz was a
cross compiler. I'm sure you documented that in the page but hey who
reads the documentation ;)

> I had figured the architecture would be irrelevant once installed on
> the host, so I opted only to include it in the tarball name. Perhaps I
> should make it clearer that these are the host architectures, not the
> target architectures (because clang is multi-targeted, unlike GCC)?

Makes sense now. But I still think it's good style that a tarball named
llvm-16.0.0-aarch64.tar.gz extracts to llvm-16.0.0-aarch64.

>> And maybe request a similar llvm directory under pub/tools to make it
>> more official? :)
>
> Yes, I was talking that over with Nick recently, as having it under a
> group on kernel.org would make taking over maintainership easier should
> something happen to me :)

Yeah, sharing the load is always good.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
