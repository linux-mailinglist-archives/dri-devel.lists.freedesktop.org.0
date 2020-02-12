Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9301315BA99
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 09:13:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B0486F558;
	Thu, 13 Feb 2020 08:13:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BE8E6E0C2;
 Wed, 12 Feb 2020 17:07:37 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id c16so2723115oic.3;
 Wed, 12 Feb 2020 09:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=q493gbsIG2nzkYQNNXMk8303hOGd7AofSKLTmVfJkrQ=;
 b=X6dnA0RTNXJDidnIaF7rpAQm9PvzOfyg3+2WZzhPcKSua0bjpxviNbu5jelqeJJX8d
 ThzB5qmZwKcDpAb+0WKbvBhC02OeLM+9OSwKuLKcilti+E/82Ld5GfQGWzu8MVW7aoYF
 BGghMfU3ghmMWNe8HA60guR6YC2DDj51kh8pBXxyUJvW91f8HY+7AMEyPlzoX19YxZeK
 KvRigiQNTGhKmTC/v4lPIUzPXc7v0GzPmLr2H07rGqdBaf5FD2+odeIoVZ0lyrGpfj+o
 ZaGJTlEX/ge92xgMybHE3N26Qyl7TZv1tnwirZ74cYWKTBenV6roDnTVYCrbPoqP0u9Y
 RgDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=q493gbsIG2nzkYQNNXMk8303hOGd7AofSKLTmVfJkrQ=;
 b=tTgWAQYRObN/Slv2PYEs1FUI5EUTkJ/2u15muPtFzU1mPLK2+KF78pYOJ3bX3MgjnX
 C5M8qH09DwCxcE3pypoBhmuoIRSLHxadL7ElVIMXtpqPony0R5B0zgGAajbQPHmAPfYu
 83Iv9lG/WVoaGSIGipDndpgvaAOz4Zr74woQkaVuh+GwrIQmWwj/ofvuxQg3fMCoK/Di
 qCFUugQve30afjf1Z9U9AiL112yMt4NH5IfbtBD06iWlJJrVk1iXFbVZOjHyN5EmZ44s
 z86Alz52Ta5Xbw3Sh+potLfupApnFhc9vcEM7lIXdBee2f8UBSPQqxEeGCu7HSuZaFgp
 bwbA==
X-Gm-Message-State: APjAAAUwxDo4POrzHTXrzmrNvVntAZPXKDZby3dwkj6xKtkJCRcXY928
 +5vIIiE3Gf1eGEVOpcBdXu4=
X-Google-Smtp-Source: APXvYqyviBldb4Xv5YdD9F9qx1MwM9JXddB2XpOhzhuPVHIEb7x8ahgRLbCAR8qoy6oNsTdEDQrDzA==
X-Received: by 2002:a05:6808:8ca:: with SMTP id
 k10mr36867oij.164.1581527256335; 
 Wed, 12 Feb 2020 09:07:36 -0800 (PST)
Received: from ubuntu-m2-xlarge-x86 ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id w20sm343637otj.21.2020.02.12.09.07.35
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 12 Feb 2020 09:07:35 -0800 (PST)
Date: Wed, 12 Feb 2020 10:07:34 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH v2] drm/i915: Disable
 -Wtautological-constant-out-of-range-compare
Message-ID: <20200212170734.GA16396@ubuntu-m2-xlarge-x86>
References: <20200211050808.29463-1-natechancellor@gmail.com>
 <20200211061338.23666-1-natechancellor@gmail.com>
 <4c806435-f32d-1559-9563-ffe3fa69f0d1@daenzer.net>
 <20200211203935.GA16176@ubuntu-m2-xlarge-x86>
 <f3a6346b-2abf-0b6a-3d84-66e12f700b2b@daenzer.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f3a6346b-2abf-0b6a-3d84-66e12f700b2b@daenzer.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 13 Feb 2020 08:12:52 +0000
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
Cc: clang-built-linux@googlegroups.com, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 12, 2020 at 09:52:52AM +0100, Michel D=E4nzer wrote:
> On 2020-02-11 9:39 p.m., Nathan Chancellor wrote:
> > On Tue, Feb 11, 2020 at 10:41:48AM +0100, Michel D=E4nzer wrote:
> >> On 2020-02-11 7:13 a.m., Nathan Chancellor wrote:
> >>> A recent commit in clang added -Wtautological-compare to -Wall, which=
 is
> >>> enabled for i915 so we see the following warning:
> >>>
> >>> ../drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:1485:22: warning:
> >>> result of comparison of constant 576460752303423487 with expression of
> >>> type 'unsigned int' is always false
> >>> [-Wtautological-constant-out-of-range-compare]
> >>>         if (unlikely(remain > N_RELOC(ULONG_MAX)))
> >>>             ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
> >>>
> >>> This warning only happens on x86_64 but that check is relevant for
> >>> 32-bit x86 so we cannot remove it.
> >>
> >> That's suprising. AFAICT N_RELOC(ULONG_MAX) works out to the same value
> >> in both cases, and remain is a 32-bit value in both cases. How can it =
be
> >> larger than N_RELOC(ULONG_MAX) on 32-bit (but not on 64-bit)?
> >>
> > =

> > Hi Michel,
> > =

> > Can't this condition be true when UINT_MAX =3D=3D ULONG_MAX?
> =

> Oh, right, I think I was wrongly thinking long had 64 bits even on 32-bit.
> =

> =

> Anyway, this suggests a possible better solution:
> =

> #if UINT_MAX =3D=3D ULONG_MAX
> 	if (unlikely(remain > N_RELOC(ULONG_MAX)))
> 		return -EINVAL;
> #endif
> =

> =

> Or if that can't be used for some reason, something like
> =

> 	if (unlikely((unsigned long)remain > N_RELOC(ULONG_MAX)))
> 		return -EINVAL;
> =

> should silence the warning.

I do like this one better than the former.

> =

> =

> Either of these should be better than completely disabling the warning
> for the whole file.

Normally, I would agree but I am currently planning to leave
-Wtautological-constant-out-of-range-compare disabled when I turn on
-Wtautological-compare for the whole kernel because there are plenty of
locations in the kernel where these kind of checks depend on various
kernel configuration options and the general attitude of kernel
developers is that this particular warning is not really helpful
for that reason.

I'll see if there is a general consensus before moving further since I
know i915 turns on a bunch of extra warnings from the rest of the kernel
(hence why we are in this situation).

Cheers,
Nathan
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
