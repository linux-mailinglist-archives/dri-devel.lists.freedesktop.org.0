Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F195147238
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2020 20:58:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6232B6E128;
	Thu, 23 Jan 2020 19:58:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B5ED6E128
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2020 19:58:20 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id n18so5038373ljo.7
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2020 11:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8DVtOQwrFkEAE5or+ctC9NfF/UngBhO5F9zvyg/cwIE=;
 b=eQxTZQW0N74htNr8ZIoBTg2RQDPW3OjTEHCMc4sFe5oYhaOUGSJvrl6o1eL0CZRoF6
 x82sJpEoaWzhBeyAQr4AJVLWbXFgY8LgUhy1SsB1ddXX6DI1lqW3atZTfWsWptXew+SX
 fwPcf1xNLR3ZLFeVh0I0M9xVVUDiWrMIvhW4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8DVtOQwrFkEAE5or+ctC9NfF/UngBhO5F9zvyg/cwIE=;
 b=nAz/nMhYZMY30HFHceTDEP3s0/FWkEnZmDZGyGY/nrbRIOk1sZAE9lJ9DGyJDZGYoY
 Rb6slx/eEc8sjyacWqvM6N/G1YsMtuo86m3V5DnolvQvyrIR2fRAvoWzgkupPm2ZKCxl
 tadL9k/kAOQ3vzhvWVv5rkIMOiIhskUuMXGOLadkJ717e319vtLNkJo0xxe8XZ87mphP
 a/LYgQ4UCqiFeIDeNmEXNqZsHGBZRaPzJ0z7Dq4XZz3EQEK73vjdgLwrAKkgpiVRDS0f
 whS89Zgn8fIZm4oYdiWY2LPAmTcPHw32+4r2CWWs8Ct14heONOvz4gEIrv4Kp4bLBuHd
 pjxQ==
X-Gm-Message-State: APjAAAWiUYb2gC9Hrzrgjf0X4TXsFvPbXMO8/0H3SSdMO266+BLBT1SX
 9ASu76h0WmM0KVAyDIMuLDwOYxsT5bY=
X-Google-Smtp-Source: APXvYqz0fqtvgDNAgIa9/M/HK7YZ8tzb4AcSa2cQjLOHLo+qoTA0mJ/cGFdcp1e4BF9eRbHK/Kvp0w==
X-Received: by 2002:a2e:99ca:: with SMTP id l10mr23127ljj.276.1579809497925;
 Thu, 23 Jan 2020 11:58:17 -0800 (PST)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com.
 [209.85.208.170])
 by smtp.gmail.com with ESMTPSA id u23sm1585191lfg.89.2020.01.23.11.58.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2020 11:58:14 -0800 (PST)
Received: by mail-lj1-f170.google.com with SMTP id z22so5092678ljg.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2020 11:58:14 -0800 (PST)
X-Received: by 2002:a2e:88c5:: with SMTP id a5mr3682ljk.201.1579809493632;
 Thu, 23 Jan 2020 11:58:13 -0800 (PST)
MIME-Version: 1.0
References: <fed4f49349913cb6739dac647ba6a61d56b989d2.1579783936.git.christophe.leroy@c-s.fr>
 <e11a8f0670251267f87e3114e0bdbacb1eb72980.1579783936.git.christophe.leroy@c-s.fr>
 <CAHk-=wg4HEABOZdjxMzbembNmxs1zYfrNAEc2L+JS9FBSnM8JA@mail.gmail.com>
 <fc5c94a2-5a25-0715-5240-5ba3cbe0f2b2@c-s.fr>
In-Reply-To: <fc5c94a2-5a25-0715-5240-5ba3cbe0f2b2@c-s.fr>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 23 Jan 2020 11:57:57 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi8FvaeRv6PpisQ+L_Cv52yE6jCxZzUHQPZ_K7HzFkaBQ@mail.gmail.com>
Message-ID: <CAHk-=wi8FvaeRv6PpisQ+L_Cv52yE6jCxZzUHQPZ_K7HzFkaBQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] uaccess: Tell user_access_begin() if it's for a
 write or not
To: christophe leroy <christophe.leroy@c-s.fr>
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
Cc: the arch/x86 maintainers <x86@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Ingo Molnar <mingo@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Michael Ellerman <mpe@ellerman.id.au>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, Borislav Petkov <bp@alien8.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 23, 2020 at 11:47 AM christophe leroy
<christophe.leroy@c-s.fr> wrote:
>
> I'm going to leave it aside, at least for the time being, and do it as a
> second step later after evaluating the real performance impact. I'll
> respin tomorrow in that way.

Ok, good.

From a "narrow the access window type" standpoint it does seem to be a
good idea to specify what kind of user accesses will be done, so I
don't hate the idea, it's more that I'm not convinced it matters
enough.

On x86, we have made the rule that user_access_begin/end() can contain
_very_ few operations, and objtool really does enforce that. With
objtool and KASAN, you really end up with very small ranges of
user_access_begin/end().

And since we actually verify it statically on x86-64, I would say that
the added benefit of narrowing by access type is fairly small. We're
not going to have complicated code in that user access region, at
least in generic code.

> > Also, it shouldn't be a "is this a write". What if it's a read _and_ a
> > write? Only a write? Only a read?
>
> Indeed that was more: does it includes a write. It's either RO or RW

I would expect that most actual users would be RO or WO, so it's a bit
odd to have those choices.

Of course, often writing ends up requiring read permissions anyway if
the architecture has problems with alignment handling or similar, but
still... The real RW case does exist conceptually (we have
"copy_in_user()", after all), but still feels like it shouldn't be
seen as the only _interface_ choice.

IOW, an architecture may decide to turn WO into RW because of
architecture limitations (or, like x86 and arm, ignore the whole
RO/RW/WO _entirely_ because there's just a single "allow user space
accesses" flag), but on an interface layer if we add this flag, I
really think it should be an explicit "read or write or both".

So thus my "let's try to avoid doing it in the first place, but if we
_do_ do this, then do it right" plea.

                 Linus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
