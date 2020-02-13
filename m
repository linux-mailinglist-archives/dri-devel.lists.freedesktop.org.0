Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 732B015D37A
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 09:08:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACCC06F8BD;
	Fri, 14 Feb 2020 08:08:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E8686F885;
 Thu, 13 Feb 2020 21:48:15 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id 77so7132884oty.6;
 Thu, 13 Feb 2020 13:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=OA6xe4auWdZmJjRQ/wLiVug/7u1e1T2hWJ4r61PFbbI=;
 b=Yjbihcz/pjHpfRB3FK6+kvNDhYFYbKTb1fXNAhFDe7n59LWRE2MCoGk1PeaKJHPvF4
 RtNIcD/phGw2ZuoWRUZrK1q4zQOgagT8eH9UxHfJp8JS3HlkHgcoR5wj66yRZoz3lQG1
 0V2azohVyjf1jbPfBR6yNDkaJfpzXLfLX6hHZ30DyW4nRdCBdCiQ+qLLUqxQOE5Aw0RW
 w1TU55yhMAMuOHFWgjyf4knPaW8zX8nR0V70N6aBJz1weth7/T/9DOanwwibX1hGcLqb
 xDYSMNuXGUigliBYkNovwpJSc8hED9QlvnUIOCtqOWazNjan9pkfh6st8JLX1dn4BXGq
 FQoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=OA6xe4auWdZmJjRQ/wLiVug/7u1e1T2hWJ4r61PFbbI=;
 b=XVzvCNxW5u9zLIeSIPPZbyhjLYKyG6eDHG+JaTbs7p5kMCZ2fMU654HyMqoLORTwOs
 AFXdOqXk3SXHVgZYX4WsOuFIvQ6dYNm4XTchuZhlSvSzDYdAcJUyxhDK6RElEWslk7J3
 HjvU5vFyDbus9EEr2xKgbcte6g9jM2pujvi4YAGFXxeIPTvazHszIWQ1DNSZ6s1YHpRk
 U57vnX3Q1/wvB4ChaG46mQO9qhF+GjIWr+ZgYlX/NJz/KQgL3D9m7wYuhjtl+pDtu7yX
 cfqg/T5ceWxyNo/Awtud8vLIVNGmivZLmJzEeVJC33ZzhfOi0l6qwNkKBhleYsrusKfy
 P/kg==
X-Gm-Message-State: APjAAAW5/x86hl5obzySZ9t81p+67W+Q4olwVB9Y/zeCpOddyYJdbHIP
 GHcNp8jYvy1ObPV2pNeZB+Q=
X-Google-Smtp-Source: APXvYqz3P6jxWKRvESHwGthFWB57MpjdHTr6nTaZb86AI0CqwYT2Gh/3W9UwxiWywmhVURTmUZK27Q==
X-Received: by 2002:a9d:138:: with SMTP id 53mr8087394otu.334.1581630494627;
 Thu, 13 Feb 2020 13:48:14 -0800 (PST)
Received: from ubuntu-m2-xlarge-x86 ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id q6sm1225527otn.73.2020.02.13.13.48.13
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 13 Feb 2020 13:48:14 -0800 (PST)
Date: Thu, 13 Feb 2020 14:48:12 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915: Disable
 -Wtautological-constant-out-of-range-compare
Message-ID: <20200213214812.GA7980@ubuntu-m2-xlarge-x86>
References: <20200211050808.29463-1-natechancellor@gmail.com>
 <20200211061338.23666-1-natechancellor@gmail.com>
 <4c806435-f32d-1559-9563-ffe3fa69f0d1@daenzer.net>
 <20200211203935.GA16176@ubuntu-m2-xlarge-x86>
 <f3a6346b-2abf-0b6a-3d84-66e12f700b2b@daenzer.net>
 <20200212170734.GA16396@ubuntu-m2-xlarge-x86>
 <d81a2cfe-79b6-51d4-023e-0960c0593856@daenzer.net>
 <877e0qy2n8.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <877e0qy2n8.fsf@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Fri, 14 Feb 2020 08:07:58 +0000
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
Cc: clang-built-linux@googlegroups.com,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 13, 2020 at 04:37:15PM +0200, Jani Nikula wrote:
> On Wed, 12 Feb 2020, Michel D=E4nzer <michel@daenzer.net> wrote:
> > On 2020-02-12 6:07 p.m., Nathan Chancellor wrote:
> >> On Wed, Feb 12, 2020 at 09:52:52AM +0100, Michel D=E4nzer wrote:
> >>> On 2020-02-11 9:39 p.m., Nathan Chancellor wrote:
> >>>> On Tue, Feb 11, 2020 at 10:41:48AM +0100, Michel D=E4nzer wrote:
> >>>>> On 2020-02-11 7:13 a.m., Nathan Chancellor wrote:
> >>>>>> A recent commit in clang added -Wtautological-compare to -Wall, wh=
ich is
> >>>>>> enabled for i915 so we see the following warning:
> >>>>>>
> >>>>>> ../drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:1485:22: warning:
> >>>>>> result of comparison of constant 576460752303423487 with expressio=
n of
> >>>>>> type 'unsigned int' is always false
> >>>>>> [-Wtautological-constant-out-of-range-compare]
> >>>>>>         if (unlikely(remain > N_RELOC(ULONG_MAX)))
> >>>>>>             ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
> >>>>>>
> >>>>>> This warning only happens on x86_64 but that check is relevant for
> >>>>>> 32-bit x86 so we cannot remove it.
> >>>>>
> >>>>> That's suprising. AFAICT N_RELOC(ULONG_MAX) works out to the same v=
alue
> >>>>> in both cases, and remain is a 32-bit value in both cases. How can =
it be
> >>>>> larger than N_RELOC(ULONG_MAX) on 32-bit (but not on 64-bit)?
> >>>>>
> >>>>
> >>>> Hi Michel,
> >>>>
> >>>> Can't this condition be true when UINT_MAX =3D=3D ULONG_MAX?
> >>>
> >>> Oh, right, I think I was wrongly thinking long had 64 bits even on 32=
-bit.
> >>>
> >>>
> >>> Anyway, this suggests a possible better solution:
> >>>
> >>> #if UINT_MAX =3D=3D ULONG_MAX
> >>> 	if (unlikely(remain > N_RELOC(ULONG_MAX)))
> >>> 		return -EINVAL;
> >>> #endif
> >>>
> >>>
> >>> Or if that can't be used for some reason, something like
> >>>
> >>> 	if (unlikely((unsigned long)remain > N_RELOC(ULONG_MAX)))
> >>> 		return -EINVAL;
> >>>
> >>> should silence the warning.
> >> =

> >> I do like this one better than the former.
> >
> > FWIW, one downside of this one compared to all alternatives (presumably)
> > is that it might end up generating actual code even on 64-bit, which
> > always ends up skipping the return.
> =

> I like this better than the UINT_MAX =3D=3D ULONG_MAX comparison because
> that creates a dependency on the type of remain.
> =

> Then again, a sufficiently clever compiler could see through the cast,
> and flag the warning anyway...

Would you prefer a patch that adds that cast rather than silencing the
warning outright? It does appear to work for clang.

Cheers,
Nathan
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
