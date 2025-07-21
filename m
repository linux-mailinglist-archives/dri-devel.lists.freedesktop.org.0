Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CDAB0C7F4
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 17:47:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FBA9899C7;
	Mon, 21 Jul 2025 15:47:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="S137gOlb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EB7E899C7
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 15:47:22 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-234fcadde3eso51522725ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 08:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1753112837; x=1753717637;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JGN33wEJGPqudqX5w145Jh0yXvNgU9KTiqxmC8hFPY8=;
 b=S137gOlbA8StGDZNd9TCjDYBI5iohXZiveA5/D1cpAEC0SYfcFVdEujDEZaE8EWPg6
 JQJ1WAUISM9A885SDVG5cceXHailC5zIV+GPFWMMffw7UHpncZSt+PkyALD0W0uchIOi
 Mc1dMab7y9CTR8eMaGiDFQzP61vG4FC8DDGw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753112837; x=1753717637;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JGN33wEJGPqudqX5w145Jh0yXvNgU9KTiqxmC8hFPY8=;
 b=M6WvSMzh6DChw6umOOG1xnEzjIwwdUysNkqHhszqgu3QXC7QfoIgm7Qv7NhfzmJ2KR
 s1Ss9jaqA26CAC1KwiaWBYOq63jlvmvGs43pYJXFvXO3DjRpzX2TLG8ePQ5MJAfh5WhW
 geGHFHa2osRBgxr349WSo4ipNDjRkNiEl8HwShuzsEy4pHbaofeZVaoaCSZn1D+t03LC
 atuaKTl8R7FNa6Cx13Xmjx3ongbg+HDE3jqxgoZCdNAEa8eXfGKFMpyF83oFWnijzWHW
 gtvpKll6ULBYD/mjGEgV1WsOewFNyVBYFyIvU1pSKOTkFXc+27Y5U4hoZLN921joX7dF
 QtvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4h4F8PtKnF0+IrYxiMjv8L4DULQ9TChbmezHdbVguqmKTK8XdV+PLR1pGEuoDLa6mKO/XEXJyglo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YymQydaNq9waklN8YbXyWB2Gk+aIcxeIo7oXt53p820WrJSFjUt
 RsKkL1fw46/LXNWVYpAXJO6988C0HA++b84RDwTzOXDtFeSK+57dbWxLyk893iYGRnEgkBUpMSt
 Uw8A=
X-Gm-Gg: ASbGncupRuc3u9HJ0WZHSWBUbE+NHw1iI6N7UU4OqG9nmfyznGSybE/Y5W7a7e9Rsy+
 k2+/0XyKaX0v5nRJeMxPUIT7V7dF6oKoJzxSbJ+xDoajx/fdWrd5jiUGq6vtwdLFVMgNmEpdde4
 AhRYeCKDdpjy6an87gvgmf4XvlyuVB0Bf1NAGu3uHycXvhzRFGukSCm/dZ9Tj1OJVIqbxuGdCJU
 0sMefgXMyEISplK1bhLBN5xBYX2wgrY8pQuL2rnLa9gRleNmjzmN64WVhydvpKeVK8Eoay43ScH
 LLqm83TyjQM49Dons5BxgGfbQh5jXhlKV6UYR3yD2vfPOVwmrS9PIZf+npwhMZCZ3w4l6Vmc36W
 uVY7S+y26FiI2BOM26SMoP67vbLgJmGypOkVqfmMqhArVJuq8g4UsjDcfvJYv9A==
X-Google-Smtp-Source: AGHT+IE78Of8sOkYv8tK1Yo5dnXurnFdDNUUSPuMeYk7bj42R9WN16/oeMHC8j5XrCRqQMqZOeXs7w==
X-Received: by 2002:a17:902:e84f:b0:234:c549:da10 with SMTP id
 d9443c01a7336-23e257882c5mr253059575ad.47.1753112837149; 
 Mon, 21 Jul 2025 08:47:17 -0700 (PDT)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com.
 [209.85.216.52]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6b4e79sm59615265ad.105.2025.07.21.08.47.13
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jul 2025 08:47:15 -0700 (PDT)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-315c1b0623cso4140923a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 08:47:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUw0HqSSds0lbMatpF2dy8bPeKW7DnmDHQoIvCxtdeyksjxTegI5q/nO/PV22mYywZR0UiWqeJeQkA=@lists.freedesktop.org
X-Received: by 2002:a17:90b:224c:b0:313:1769:eb49 with SMTP id
 98e67ed59e1d1-31c9f3c570emr31120725a91.8.1753112832610; Mon, 21 Jul 2025
 08:47:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250717164053.284969-1-me@brighamcampbell.com>
 <20250717164053.284969-3-me@brighamcampbell.com>
 <CAD=FV=Vrp9MM_5de10sV-TC_mp-D7en9gjU8DBoD6mBrRvF2eg@mail.gmail.com>
 <f0d300fc-0141-4eab-a888-d1d32778f5de@tecnico.ulisboa.pt>
 <DBGPVFN5DTGU.5UTP35ALYS2Q@brighamcampbell.com>
 <73686985-27c4-4a4f-8b75-18df112367a7@tecnico.ulisboa.pt>
In-Reply-To: <73686985-27c4-4a4f-8b75-18df112367a7@tecnico.ulisboa.pt>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 21 Jul 2025 08:46:59 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xbijn6j9Oxc88k3iq+wSF9bV76X6uw4ADWWxwR+q=o0w@mail.gmail.com>
X-Gm-Features: Ac12FXwZOEsXzYGcRcET3f78cuk2K33ah-CaSaDSzBavG_qBk9uaa3AvVsHX2XQ
Message-ID: <CAD=FV=Xbijn6j9Oxc88k3iq+wSF9bV76X6uw4ADWWxwR+q=o0w@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] drm/panel: jdi-lpm102a188a: Fix bug and clean up
 driver
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: Brigham Campbell <me@brighamcampbell.com>, tejasvipin76@gmail.com, 
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sun, Jul 20, 2025 at 4:19=E2=80=AFAM Diogo Ivo <diogo.ivo@tecnico.ulisbo=
a.pt> wrote:
>
> On 7/20/25 8:50 AM, Brigham Campbell wrote:
> > On Sat Jul 19, 2025 at 11:10 AM MDT, Diogo Ivo wrote:
> >>> nit: can just be this:
> >>>
> >>> struct mipi_dsi_multi_context dsi_ctx =3D {};
> >>
> >> I am not an expert here but I was under the impression that this is on=
ly
> >> valid with C23 while the kernel is written in C11. Is there something =
I
> >> am missing?
> >>
> >> Diogo
> >
> > You're right, C23 was the first standard to bless the usage of the empt=
y
> > initializer, ` =3D {};`, but if I'm right, it's been a GNU extension lo=
ng
> > before C11. At risk of being pedantic, I'll draw attention to line 580
> > of the kernel's root Makefile:
> >
> > KBUILD_CFLAGS +=3D -std=3Dgnu11
> >
> > The kernel is technically written in the GNU variant of C11, extensions
> > and all. In fact, the first patch of this series uses optional variadic
> > macro arguments, which aren't a part of any official C standard as far
> > as I'm aware.
> >
> > In any case, a simple grep for some forms of the empty initializer show=
s
> > usages all over the drm subsystem.
> >
> > That said, I don't know if GNU extensions are formally documented or
> > where one would look for that information. Importantly, I am by far the
> > junior as far as kernel coding is concerned. I yield to your experience
> > and I'm happy to change this initialization in v6 if that's best.
>
> I found the documentation here [1], and it does state regarding designate=
d
> initializers that "Omitted fields are implicitly initialized the same as =
for
> objects that have static storage duration." so I take it that no v6 is
> needed :)
>
> Diogo
>
> [1]:
> https://gcc.gnu.org/onlinedocs/gcc/Designated-Inits.html#Designated-Inits

Right. I think the key here is (as Brigham said) `git grep '=3D {}'`
shows countless hits in the kernel. :-) ...so we're not introducing
any new compiler requirement here with your patch. ;-)

-Doug
