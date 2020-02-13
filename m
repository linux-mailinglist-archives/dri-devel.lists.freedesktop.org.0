Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B12C15D373
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 09:08:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38A386E9EC;
	Fri, 14 Feb 2020 08:08:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABBF06E42D;
 Thu, 13 Feb 2020 23:27:26 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id b18so7666626oie.2;
 Thu, 13 Feb 2020 15:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=phnCn7mKlZPWUI9KXkv1lYA4R+8w6RQ/h4tld1EHfzY=;
 b=tSgExaGoLaq8u6hZyZ70QjOD0b9Mo2pTA/GpwZyxT661oxJn9GDuJ43iuPoGCiWR6Q
 pTGcUIVDI4ZFXeCBb++m1pnArVPMf5e6I1U/+cnUHFgmsvXUwpL9CuB8ilC5wEhU8d7i
 5RQ7cDhGxWjNcavRCyXp03xB7bqyCULjB6OmO8NisychmtVgAK+4ibK0jYdr7deMXSow
 wquazQ+m7XdjmF0zauXHXG/fGjB1NAAENNjzYsiWJHoDvyb4IruZ/5UYiDgkQYuK5EeR
 73COvdUelbwqNooYGrBes6ZzhaMUj++cW7C4+olEZfDl9cZLJ32ZgWNPYSP24SB2SaZy
 a3kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=phnCn7mKlZPWUI9KXkv1lYA4R+8w6RQ/h4tld1EHfzY=;
 b=JbI7CbAtOiTnTsy5fLfUYHpmRtVTienHH4OlMGTtCJ4FeX8yu8+20FHGPmEjsv0BqS
 swS8A8uoZ/24Swln01PFx4i+YIGvJ+iWASDZZ6p+23AF5VD7o22/GcGY97gca35rUWt2
 fSmNHpKQRXElX9l7uJjUCBIHftglKNmUeW6GbA4n6FxAdtgJzvfmE2LeFHG2CgZlL0H2
 +HVXzfSJBYuoHYl5H8p40KJ5qxnb3pRdKRGXt5KegHNmkZjX4Kx8HqT8ca4uyAF6865f
 KI/vRRZ1cuNx4j26VQ9zS3iDq3IqERpmySgpmJfBHMGDDaCrcU8Hje2narp9jPLo3DIt
 qbqg==
X-Gm-Message-State: APjAAAXM/0oR0ZzSDcStn2slku3+RZRY1P8o1KTkFfcP7zfH1GROyBxO
 Z9IyTocAVdi2emhRWg+m13M=
X-Google-Smtp-Source: APXvYqzUb4skfimU29+d3GeNL8MzppZrPxpAt5aUIZc480u59SxuAnYW5JzENtYOmXrsHln3Fw/n9Q==
X-Received: by 2002:a54:488d:: with SMTP id r13mr5819oic.115.1581636445805;
 Thu, 13 Feb 2020 15:27:25 -0800 (PST)
Received: from ubuntu-m2-xlarge-x86 ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id c12sm1291127oic.27.2020.02.13.15.27.25
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 13 Feb 2020 15:27:25 -0800 (PST)
Date: Thu, 13 Feb 2020 16:27:23 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH v2] drm/i915: Disable
 -Wtautological-constant-out-of-range-compare
Message-ID: <20200213232723.GA26697@ubuntu-m2-xlarge-x86>
References: <20200211050808.29463-1-natechancellor@gmail.com>
 <20200211061338.23666-1-natechancellor@gmail.com>
 <4c806435-f32d-1559-9563-ffe3fa69f0d1@daenzer.net>
 <20200211203935.GA16176@ubuntu-m2-xlarge-x86>
 <f3a6346b-2abf-0b6a-3d84-66e12f700b2b@daenzer.net>
 <20200212170734.GA16396@ubuntu-m2-xlarge-x86>
 <d81a2cfe-79b6-51d4-023e-0960c0593856@daenzer.net>
 <CAKwvOdm4eS19-D3pEkKsyZw7VjJP9Jeh5gMZaszwgjrJe63yUg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKwvOdm4eS19-D3pEkKsyZw7VjJP9Jeh5gMZaszwgjrJe63yUg@mail.gmail.com>
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
Cc: Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 13, 2020 at 02:43:21PM -0800, Nick Desaulniers wrote:
> On Wed, Feb 12, 2020 at 9:17 AM Michel D=E4nzer <michel@daenzer.net> wrot=
e:
> >
> > On 2020-02-12 6:07 p.m., Nathan Chancellor wrote:
> > > On Wed, Feb 12, 2020 at 09:52:52AM +0100, Michel D=E4nzer wrote:
> > >> On 2020-02-11 9:39 p.m., Nathan Chancellor wrote:
> > >>> On Tue, Feb 11, 2020 at 10:41:48AM +0100, Michel D=E4nzer wrote:
> > >>>> On 2020-02-11 7:13 a.m., Nathan Chancellor wrote:
> > >>>>> A recent commit in clang added -Wtautological-compare to -Wall, w=
hich is
> > >>>>> enabled for i915 so we see the following warning:
> > >>>>>
> > >>>>> ../drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:1485:22: warnin=
g:
> > >>>>> result of comparison of constant 576460752303423487 with expressi=
on of
> > >>>>> type 'unsigned int' is always false
> > >>>>> [-Wtautological-constant-out-of-range-compare]
> > >>>>>         if (unlikely(remain > N_RELOC(ULONG_MAX)))
> > >>>>>             ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
> > >>>>>
> > >>>>> This warning only happens on x86_64 but that check is relevant for
> > >>>>> 32-bit x86 so we cannot remove it.
> > >>>>
> > >>>> That's suprising. AFAICT N_RELOC(ULONG_MAX) works out to the same =
value
> > >>>> in both cases, and remain is a 32-bit value in both cases. How can=
 it be
> > >>>> larger than N_RELOC(ULONG_MAX) on 32-bit (but not on 64-bit)?
> > >>>>
> > >>>
> > >>> Hi Michel,
> > >>>
> > >>> Can't this condition be true when UINT_MAX =3D=3D ULONG_MAX?
> > >>
> > >> Oh, right, I think I was wrongly thinking long had 64 bits even on 3=
2-bit.
> > >>
> > >>
> > >> Anyway, this suggests a possible better solution:
> > >>
> > >> #if UINT_MAX =3D=3D ULONG_MAX
> > >>      if (unlikely(remain > N_RELOC(ULONG_MAX)))
> > >>              return -EINVAL;
> > >> #endif
> > >>
> > >>
> > >> Or if that can't be used for some reason, something like
> > >>
> > >>      if (unlikely((unsigned long)remain > N_RELOC(ULONG_MAX)))
> > >>              return -EINVAL;
> > >>
> > >> should silence the warning.
> > >
> > > I do like this one better than the former.
> >
> > FWIW, one downside of this one compared to all alternatives (presumably)
> > is that it might end up generating actual code even on 64-bit, which
> > always ends up skipping the return.
> =

> The warning is pointing out that the conditional is always false,
> which is correct on 64b.  The check is only active for 32b.
> https://godbolt.org/z/oQrgT_
> The cast silences the warning for 64b.  (Note that GCC and Clang also
> generate precisely the same instruction sequences in my example, just
> GCC doesn't warn on such tautologies).

Thanks for confirming! I'll send a patch to add the cast later tonight.

Cheers,
Nathan
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
