Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E0B147042
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2020 19:02:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDCE16E039;
	Thu, 23 Jan 2020 18:02:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E473E6E039
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2020 18:02:53 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id h23so4589742ljc.8
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2020 10:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eDGhNOsnfRqZ1FkvFFgvc9AjFE5Ddur1Pg9CKAfnAxU=;
 b=R8rUnlTAVJ23suSGKIAk3x/NWMyIV1571Zyk795MWw02ibpxnwpaVKBgIpemglXFyP
 UyAn/M4pPrtxudOzb1Yimjimwf7PBh+D79Avp2N7YtdpAxKItUKS5GifZRNjNI8G6ljo
 pty5cnSbJVgpFW0/1axLB6FvRc4gFKR+F0mc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eDGhNOsnfRqZ1FkvFFgvc9AjFE5Ddur1Pg9CKAfnAxU=;
 b=ICtvPu+gIvtXaAQPbJ0Y8MLZZzMuIdicx71dyHsghGAJKUJP93Y82vxxM3K9PIZVQp
 1bZbzmiktRWoVfQjZBRDbV4jEna8KX0z03YR80IluZhRp1JwLOuHzgKKueFOV+7Nuf1I
 cruTE27YPLmv+06nye6XgstakHBYI5PysmGpaDiINeSKpSVUrLLZabs4w5s8y6IEK5O8
 /PiEj/flRGbBRXR/53+kwZDTFiIPnv9HN8I3YwkKci1cEW8P6i32R3Q5CMXbL0TF70IE
 uxWdnfZRIpvZT4GmPGESr0NkIzYpyphAgsLoWlaJYlOSaDA5tbaREnhvOTlRgsLwEykg
 Umsg==
X-Gm-Message-State: APjAAAWRJspvygFaUuUvv8Nm2TAyjoJ0oBWMpUTQni0neC9tbbq1/REJ
 ATKe0/c3/p27nI5bufBRx2VESkFubZA=
X-Google-Smtp-Source: APXvYqz9Q+Ne/q1ov1TcQYdBOEwq9RC6w13AuP98Il4LxinvcDsBGdUSW34Op35rOZySKESDH+VTBg==
X-Received: by 2002:a2e:9999:: with SMTP id w25mr24220063lji.142.1579802571264; 
 Thu, 23 Jan 2020 10:02:51 -0800 (PST)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com.
 [209.85.208.182])
 by smtp.gmail.com with ESMTPSA id q186sm1721099ljq.14.2020.01.23.10.02.50
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2020 10:02:50 -0800 (PST)
Received: by mail-lj1-f182.google.com with SMTP id a13so4570707ljm.10
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2020 10:02:50 -0800 (PST)
X-Received: by 2002:a05:651c:282:: with SMTP id
 b2mr23878285ljo.41.1579802569766; 
 Thu, 23 Jan 2020 10:02:49 -0800 (PST)
MIME-Version: 1.0
References: <fed4f49349913cb6739dac647ba6a61d56b989d2.1579783936.git.christophe.leroy@c-s.fr>
 <e11a8f0670251267f87e3114e0bdbacb1eb72980.1579783936.git.christophe.leroy@c-s.fr>
In-Reply-To: <e11a8f0670251267f87e3114e0bdbacb1eb72980.1579783936.git.christophe.leroy@c-s.fr>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 23 Jan 2020 10:02:33 -0800
X-Gmail-Original-Message-ID: <CAHk-=wg4HEABOZdjxMzbembNmxs1zYfrNAEc2L+JS9FBSnM8JA@mail.gmail.com>
Message-ID: <CAHk-=wg4HEABOZdjxMzbembNmxs1zYfrNAEc2L+JS9FBSnM8JA@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] uaccess: Tell user_access_begin() if it's for a
 write or not
To: Christophe Leroy <christophe.leroy@c-s.fr>
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

On Thu, Jan 23, 2020 at 4:59 AM Christophe Leroy
<christophe.leroy@c-s.fr> wrote:
>
> On 32 bits powerPC (book3s/32), only write accesses to user are
> protected and there is no point spending time on unlocking for reads.

Honestly, I'm starting to think that 32-bit ppc just needs to look
more like everybody else, than make these changes.

We used to have a read/write argument to the old "verify_area()" and
"access_ok()" model, and it was a mistake. It was due to odd i386 user
access issues. We got rid of it. I'm not convinced this is any better
- it looks very similar and for odd ppc access issues.

But if we really do want to do this, then:

> Add an argument to user_access_begin() to tell when it's for write and
> return an opaque key that will be used by user_access_end() to know
> what was done by user_access_begin().

You should make it more opaque than "unsigned long".

Also, it shouldn't be a "is this a write". What if it's a read _and_ a
write? Only a write? Only a read?

                    Linus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
