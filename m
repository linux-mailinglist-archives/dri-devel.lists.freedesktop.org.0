Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EB0A3E082
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 17:24:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE6910E1AB;
	Thu, 20 Feb 2025 16:24:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="aUp8DgfF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D96F10E1AB
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 16:24:07 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43995b907cfso7365945e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 08:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1740068646; x=1740673446; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HHNQaW7mzEdCd/TPuQOkmBComqEtaa6hiKEAKod6XVI=;
 b=aUp8DgfF58tZ5nD7sKW4LoBF9bXByYvLJGW+KL7lC2Cvtr8RxP3GXOpHZkQyhOKCvF
 BqgwLVeWjaHD9tWOhTEzducdCiBC37g1YdItd+rX64+ibEPu6upqRTAx3yTZofl1oIb7
 5e8e6j+ITM/sr6qnkqnbpHi9/WEClLJk3SB08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740068646; x=1740673446;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HHNQaW7mzEdCd/TPuQOkmBComqEtaa6hiKEAKod6XVI=;
 b=IMdaJK9EX1wFCJeZ9VJ372cW79CAdZhVPt3mg+mOtxdpSlRqH6jPImO2XzGVlI1vaz
 ke7Zngd8AzYrrZfjujUt1Un2MVMDwhLiPQ0p8EKYgZELn9E8At+PD8qvIYHuzWyZts0M
 U6TbV6MFuQofnRGHUAFEC1Ji6s7bFi00xAjn1KmNS1DUNl7S/2g/LrQ00UAKu5SUjdbz
 BixKkQ4Unvs5clcLB0ZgiKax87NnmbQnMk+LvbRswL3kb2A4kLnxp2rGM/D3X23bkik3
 uA/qmpYGlaBNhPIWKNh+PKxx4VgCCicmFOsFvRBnksleKaf+rhhZS8BuGfQxQ/5TwKGL
 CRMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgPR0XuUfsXbZZQPvlSDqnR9/OyhLuizxEdXoSfQX8bVcSjpPKThsJdlgotPy/E2T6olbjiYUCnWU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyr2MTnNul6nmiLeMAu7j6sz+9hDfAxLsa9N0XEU/0pN1m6bC2/
 mUShhB5BFMQdtvyHAdRSAf6KSj1W29aN6iIut5NK0hX0hITkhoJ1FzKYq3fUogA=
X-Gm-Gg: ASbGnctwlUqlGX/wUfF0TRi67jRHJ+YCXum8upSjBhFQe4ArnLzcP3U2MOQ7/nTvfr7
 pHdSoaqjzfFX2j6s1PP4+RlinavrGynKifmxif8dEdVyQzLPxy6V6+bwTEmIzS5dNVBNp1WKmvp
 5mhHn2kaTmsuMPC8BihNKVdMaGWazQkCHhWD4hW8aNIkDsKI+R9FPCc/GTcvmRG26o5kAuyipV0
 LevShFkipGp80RJp49twcsIl34VPYk15WZlWRk96dMEM4gpMM2e6J+lY6/8P0pwuVxIFiJTScGE
 RJGyDqbUpFP/LvU4V8fdc0XmAKI=
X-Google-Smtp-Source: AGHT+IGO2UBg3ppa7TE2D8LMax0SXOyah2tNEU1Go0U95uL3vj126aJdb3xWmggfe65ARa8Fbl4nTQ==
X-Received: by 2002:a05:600c:4fc2:b0:439:91dd:cf9c with SMTP id
 5b1f17b1804b1-43991ddd158mr132576415e9.10.1740068645761; 
 Thu, 20 Feb 2025 08:24:05 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a1aa7c7sm249594765e9.27.2025.02.20.08.24.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 08:24:05 -0800 (PST)
Date: Thu, 20 Feb 2025 17:24:01 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: David Airlie <airlied@redhat.com>
Cc: Theodore Ts'o <tytso@mit.edu>, "Dr. Greg" <greg@enjellic.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Hector Martin <marcan@marcan.st>, Dave Airlie <airlied@gmail.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
 Greg KH <gregkh@linuxfoundation.org>, phasta@kernel.org,
 Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 daniel.almeida@collabora.com, aliceryhl@google.com,
 robin.murphy@arm.com, rust-for-linux@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 Bj??rn Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Valentin Obst <kernel@valentinobst.de>,
 open list <linux-kernel@vger.kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
 DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: On community influencing (was Re: [PATCH v8 2/2] rust: add dma
 coherent allocator abstraction.)
Message-ID: <Z7dXIfFJ2qXNKtwT@phenom.ffwll.local>
Mail-Followup-To: David Airlie <airlied@redhat.com>,
 Theodore Ts'o <tytso@mit.edu>, "Dr. Greg" <greg@enjellic.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Hector Martin <marcan@marcan.st>, Dave Airlie <airlied@gmail.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
 Greg KH <gregkh@linuxfoundation.org>, phasta@kernel.org,
 Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 daniel.almeida@collabora.com, aliceryhl@google.com,
 robin.murphy@arm.com, rust-for-linux@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 Bj??rn Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Valentin Obst <kernel@valentinobst.de>,
 open list <linux-kernel@vger.kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <2025013148-reversal-pessimism-1515@gregkh>
 <20250131135421.GO5556@nvidia.com>
 <2b9b75d1-eb8e-494a-b05f-59f75c92e6ae@marcan.st>
 <Z6OzgBYZNJPr_ZD1@phenom.ffwll.local>
 <CAPM=9tzPR9wd=3Wbjnp-T0W8-dDfGah-H3Ny52G85B+2Ev9ksA@mail.gmail.com>
 <208e1fc3-cfc3-4a26-98c3-a48ab35bb9db@marcan.st>
 <CAHk-=wi=ZmP2=TmHsFSUGq8vUZAOWWSK1vrJarMaOhReDRQRYQ@mail.gmail.com>
 <20250207121638.GA7356@wind.enjellic.com>
 <20250208204416.GL1130956@mit.edu>
 <CAMwc25pxz2+B329BArDQMpxOvpMtvhop1u_Uwc0axn2LqNP0vA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMwc25pxz2+B329BArDQMpxOvpMtvhop1u_Uwc0axn2LqNP0vA@mail.gmail.com>
X-Operating-System: Linux phenom 6.12.11-amd64
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

On Thu, Feb 13, 2025 at 08:20:52PM +1000, David Airlie wrote:
> On Sun, Feb 9, 2025 at 6:48 AM Theodore Ts'o <tytso@mit.edu> wrote:
> >
> > On Fri, Feb 07, 2025 at 06:16:38AM -0600, Dr. Greg wrote:
> > >
> > > The all powerful sub-system maintainer model works well if the big
> > > technology companies can employ omniscient individuals in these roles,
> > > but those types are a bit hard to come by.
> >
> > I'll let you in a secret.  The maintainers are not "all-powerfui".  We
> > are the "thin blue line" that is trying to keep the code to be
> > maintainable and high quality.  Like most leaders of volunteer
> > organization, whether it is the Internet Engineerint Task Force (the
> > standards body for the Internet), we actually have very little power.
> > We can not *command* people to work on retiring technical debt, or to
> > improve testing infrastructure, or work on some particular feature
> > that we'd very like for our users.
> 
> Just as a courtesy to others can we not use the "thin blue line"
> analogy in this community, it has had some bad connotation thrown on
> it in the US context over the past few years, and I'd rather not as a
> maintainer be aligned with current connotation/interpretations of it,
> despite having family involved in our local force.

Agreed. I dropped a bit the ball on this, because at first I thought this
was only posted on part of the thread that wasn't cc'ed to dri-devel - I
can't pick a fight with the kernel community at large for everything that
happens. And then I let Dave handle this, because I couldn't come up with
anything that's not a nuclear table flip. 2 weeks later I'm still not
better, so let me instead express positively what kind of maintainership I
strive for by linking to an old talk of mine:

https://blog.ffwll.ch/2017/01/maintainers-dont-scale.html

> I'm open to suggestions for any better analogies.

Better analogy aside, I fundamentally disagree with understanding
maintainership as a gatekeeper role that exists to keep the chaos out. My
goal is to help build a community where people enjoy collaborating, and
then gtfo so I don't hinder them. I think the talk I linked above is
holding up quite well even years later, but the last part really embodies
that idea, so let me just quote that:

    Be a Steward, Not a Lord

    I think one of key advantages of open source is that people stick
    around for a very long time. Even when they switch jobs or move
    around. Maybe the usual “for life” qualifier isn’t really a great
    choice, since it sounds more like a mandatory sentence than something
    done by choice. What I object to is the “dictator” part, since if your
    goal is to grow a great community and maybe reach world domination,
    then you as the maintainer need to serve that community. And not that
    the community serves you.

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
