Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7052B5EBAE8
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 08:46:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47B1B10E8BE;
	Tue, 27 Sep 2022 06:46:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9A0310E2D5;
 Tue, 27 Sep 2022 06:46:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3E0A361528;
 Tue, 27 Sep 2022 06:46:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 801EFC433B5;
 Tue, 27 Sep 2022 06:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664261166;
 bh=eEUvxBZsi9LqCvOrkkoLXt0oGQK0hSltb52/gNuFgZc=;
 h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
 b=YeF1uQu6QOwIwpqO25V8Se5Jh3/7LmTuggyeQGTEqoYTG4OZwBjgCOJSzYSJXKGjw
 YSpsg9ZkD5PAQqvi237xvtgYVpQoMz1J9CIquEp+oYCwBBav3raIhCyTBqjVaoPvmU
 ay7RPeC75QtxLEeiOIoU+mvl5myNqJu+WGuxw9qSyI27+1ZK1u+/KSmpywTDKR1Xlz
 hyZEvZ7WAYFjgNQYbbX+nNrGF72JqlBKrpMk2/j5kexDYuf/xZmg6wfGMIkFk+WhrY
 GrEvw6szTG7DNmjTSArOWa2ufvKVt0dxj4VLmMSZMxcDfHH9jAXpIPfHJF/q2CKhlO
 nU9G5nKrTiy5w==
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailauth.nyi.internal (Postfix) with ESMTP id 5057227C0054;
 Tue, 27 Sep 2022 02:46:04 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute3.internal (MEProxy); Tue, 27 Sep 2022 02:46:04 -0400
X-ME-Sender: <xms:K5wyY55LdtqzTFfDLKVhyXYrIJ0cTmxpm90Lu7DUY7-nij1MOkfKqw>
 <xme:K5wyY25C7E2eG40bp4EjuLLQWoAVbiMahSdIvObFuCS-adsU8r36Yt4wxtuGbNROb
 Ab6ZsWuNyLnbXQiszs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeegfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
 rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugeskhgvrhhnvghlrdhorhhgqeenucggtf
 frrghtthgvrhhnpeelvefgudeiheefledttedthfffgfekudegkeelffdtiedvgfevieet
 teekheffveenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhguodhmvghsmhhtphgruhht
 hhhpvghrshhonhgrlhhithihqdduvdekhedujedtvdegqddvkeejtddtvdeigedqrghrnh
 gupeepkhgvrhhnvghlrdhorhhgsegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:K5wyYwd1DwpulFvQpVuWiRUtcw38-qebHa5Ze62tCAfgwH5X1zJXbg>
 <xmx:K5wyYyKKEGXvXsznp6_nNRSW2EGNR6NSSIpo7fW9pMDAxH9Yicqq4w>
 <xmx:K5wyY9IgwfMahZkMIE7MAebKidgM1Az-LQpJhh2MDT5Kzbd_VeWsAw>
 <xmx:LJwyYyBRqF04xYz6Yfv4-jni5HaTT-P3xGg-v0IhvH6D9IhEZgbYjMr4BjW5YPzC>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 81704B60089; Tue, 27 Sep 2022 02:46:03 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-968-g04df58079d-fm-20220921.001-g04df5807
Mime-Version: 1.0
Message-Id: <854247e0-6276-4f3b-b4e9-b408e151a6b3@www.fastmail.com>
In-Reply-To: <202209261405.619441AC2F@keescook>
References: <20220926191109.1803094-1-keescook@chromium.org>
 <CAKwvOdmCjAQpaF40VStbFNf1ZqmTxTTZzy2v4TwSF0LVO08GYw@mail.gmail.com>
 <202209261405.619441AC2F@keescook>
Date: Tue, 27 Sep 2022 08:45:43 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Kees Cook" <keescook@chromium.org>,
 "Nick Desaulniers" <ndesaulniers@google.com>
Subject: Re: [PATCH v2] overflow: Introduce overflows_type() and
 castable_to_type()
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Tom Rix <trix@redhat.com>,
 Daniel Latypov <dlatypov@google.com>, llvm@lists.linux.dev,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Nathan Chancellor <nathan@kernel.org>, linux-sparse@vger.kernel.org,
 linux-hardening@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org, Vitor Massaru Iha <vitor@massaru.org>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 26, 2022, at 11:07 PM, Kees Cook wrote:
> On Mon, Sep 26, 2022 at 01:17:18PM -0700, Nick Desaulniers wrote:
>> + Arnd
>> 
>> On Mon, Sep 26, 2022 at 12:11 PM Kees Cook <keescook@chromium.org> wrote:
>> > ---
>> > v2:
>> >  - fix comment typo
>> >  - wrap clang pragma to avoid GCC warnings
>> >  - style nit cleanups
>> >  - rename __castable_to_type() to castable_to_type()
>> >  - remove prior overflows_type() definition
>> > v1: https://lore.kernel.org/lkml/20220926003743.409911-1-keescook@chromium.org
>> > diff --git a/lib/overflow_kunit.c b/lib/overflow_kunit.c
>> > index f385ca652b74..fffc3f86181d 100644
>> > --- a/lib/overflow_kunit.c
>> > +++ b/lib/overflow_kunit.c
>> > @@ -16,6 +16,11 @@
>> >  #include <linux/types.h>
>> >  #include <linux/vmalloc.h>
>> >
>> > +/* We're expecting to do a lot of "always true" or "always false" tests. */
>> > +#ifdef CONFIG_CC_IS_CLANG
>> > +#pragma clang diagnostic ignored "-Wtautological-constant-out-of-range-compare"
>> > +#endif
>> 
>> Any chance we can reuse parts of __diag_ignore or __diag_clang from
>> include/linux/compiler_types.h or include/linux/compiler-clang.h
>> respectively?
>
> Hm, I'm not sure how those are supposed to be used. Those defines don't
> seem to be used externally?

We use them in a couple of places. When I originally introduced
them, the idea was to add more infrastructure around these
to replace the various -Wno-... flags in local makefiles with
more targetted annotations, and then have a way to control
the warning levels (W=1 W=2 E=1 etc) per directory and per file,
but I never completed the work to add the interesting bits.

>> Those are needed for pragmas within preprocessor macros, which we
>> don't have here, but I suspect they may be more concise to use here.
>
> Yeah, I was surprised when I had to wrap it in #ifdef given "clang" is
> part of the string.
>
>> 
>> > +#define TEST_SAME_TYPE(t1, t2, same)                   do {    \
>> > +       typeof(t1) __t1h = type_max(t1);                        \
>> > +       typeof(t1) __t1l = type_min(t1);                        \
>> > +       typeof(t2) __t2h = type_max(t2);                        \
>> > +       typeof(t2) __t2l = type_min(t2);                        \
>> 
>> Can we use __auto_type here rather than typeof(macro expansion)?
>
> I'd rather it stay explicit -- otherwise we start to wander into "oops,
> we got lucky" territory for what should be a really distinct test case.

The idea  of __auto_type is to avoid the more deeply nested macros.
If the preprocessed file turns into an absolute mess, adding a temporary
variable may help. Not sure if that applies here.

     Arnd
