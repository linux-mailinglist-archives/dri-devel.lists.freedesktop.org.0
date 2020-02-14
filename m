Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9468D160D19
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 09:22:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C85D6E536;
	Mon, 17 Feb 2020 08:22:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5E596EB88;
 Fri, 14 Feb 2020 13:46:16 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id a142so9424982oii.7;
 Fri, 14 Feb 2020 05:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=Z2AWHyN/sOb4PsOQdZpFIB/8+XI9oSRqPBfKZfRwFiU=;
 b=Cvlk7S2k5FNnFaMpydJh39pH3ElahgOrWipX78FuTVFaxf29cfR+obZPVLb1Fn5iqH
 uDLkhVA0jBDmtwTB3X4MSEOHPBJcXLKCErV9jPgOcdyYFHYwQIOqAghL8TvYQvbMz+5+
 +4TZBxiaF5pLh4ecvXXHacUTkln64pBdi1eQAmrGBrxDjg0xOAiGNyXvOFGcvmKG7PVr
 z/5Chh+c761a76kWqwUuerFL9V2FNYwZzYekwLn2pJQhUZr/E3Y+W7Ywdg6GW6YFdg66
 K/YlabYQv5xVqBZYRlwXrSCgLVMw4IV5wqB0dFL5rO2FihwOIBIIJReYPygoq/8pckPK
 9FMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=Z2AWHyN/sOb4PsOQdZpFIB/8+XI9oSRqPBfKZfRwFiU=;
 b=tfGfy49fkvMT4CwZBhsuDiYVid08Cm8Qv/dCT07DhoOuqEY10Ml8cu1G6zm9Mnft++
 hPU/fP+TjZCrre0HUXYWxZYT33+zvdOvXmb+Yj8l+9IIlePf2NI8ukAkE/2q41/sXB7m
 bTTkFi0GFyLZ4ECzKX5uZE8HeOA+TghA5/CX0IQI77Abiv37fOCBEu1afavJspCo+ghC
 ECgpbWV7C3HUC5sBtmkLgFLjxFxYRhJcvM1zzxbH6bmfvfh9C7KpGDCRTHc0grfCM0Ob
 waRwIUSLDF+Wja73pVfFLtFdSUSFjHsMh9utjDcz2C35KX9ffZ8+EGwex3AsI9KDn6d+
 vlxA==
X-Gm-Message-State: APjAAAWfNf/+ZEKNNqfwBzigc+BwmXEJltJCTnQ83Ytld2RSj/0ZGvhE
 DXg2ZAW8Xsfx28sLMhWLsz4=
X-Google-Smtp-Source: APXvYqzDN8yB/OO+Niqa/er7303KT4elsvbSX2QFbbWCRBEluLHYhvxVws70OxqoDU3dH4uxeKg5Hg==
X-Received: by 2002:aca:4306:: with SMTP id q6mr1922461oia.54.1581687975994;
 Fri, 14 Feb 2020 05:46:15 -0800 (PST)
Received: from ubuntu-m2-xlarge-x86 ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id k17sm1885677oic.45.2020.02.14.05.46.14
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 14 Feb 2020 05:46:15 -0800 (PST)
Date: Fri, 14 Feb 2020 06:46:13 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH] drm/i915: Cast remain to unsigned long in eb_relocate_vma
Message-ID: <20200214134613.GA41838@ubuntu-m2-xlarge-x86>
References: <20200214054706.33870-1-natechancellor@gmail.com>
 <87v9o965gg.fsf@intel.com>
 <158166913989.4660.10674824117292988120@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158166913989.4660.10674824117292988120@skylake-alporthouse-com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Mon, 17 Feb 2020 08:20:47 +0000
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, clang-built-linux@googlegroups.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 14, 2020 at 08:32:19AM +0000, Chris Wilson wrote:
> Quoting Jani Nikula (2020-02-14 06:36:15)
> > On Thu, 13 Feb 2020, Nathan Chancellor <natechancellor@gmail.com> wrote:
> > > A recent commit in clang added -Wtautological-compare to -Wall, which=
 is
> > > enabled for i915 after -Wtautological-compare is disabled for the rest
> > > of the kernel so we see the following warning on x86_64:
> > >
> > >  ../drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:1433:22: warning:
> > >  result of comparison of constant 576460752303423487 with expression =
of
> > >  type 'unsigned int' is always false
> > >  [-Wtautological-constant-out-of-range-compare]
> > >          if (unlikely(remain > N_RELOC(ULONG_MAX)))
> > >             ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
> > >  ../include/linux/compiler.h:78:42: note: expanded from macro 'unlike=
ly'
> > >  # define unlikely(x)    __builtin_expect(!!(x), 0)
> > >                                             ^
> > >  1 warning generated.
> > >
> > > It is not wrong in the case where ULONG_MAX > UINT_MAX but it does not
> > > account for the case where this file is built for 32-bit x86, where
> > > ULONG_MAX =3D=3D UINT_MAX and this check is still relevant.
> > >
> > > Cast remain to unsigned long, which keeps the generated code the same
> > > (verified with clang-11 on x86_64 and GCC 9.2.0 on x86 and x86_64) and
> > > the warning is silenced so we can catch more potential issues in the
> > > future.
> > >
> > > Link: https://github.com/ClangBuiltLinux/linux/issues/778
> > > Suggested-by: Michel D=E4nzer <michel@daenzer.net>
> > > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> > =

> > Works for me as a workaround,
> =

> But the whole point was that the compiler could see that it was
> impossible and not emit the code. Doesn't this break that?
> -Chris

As noted in the commit message, I ran diff <(objdump -Dr) <(objdump -Dr)
on objects files compiled with and without the patch with clang and gcc
for x86_64 and gcc for i386 (i386 does not build with clang) and there
was zero difference aside from the file names.

At the end of the day, I do not really care how the warning get fixed,
just that it does since it is the only one on x86_64 defconfig.

Cheers,
Nathan
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
