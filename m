Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A90A29B49
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 21:36:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3146810E3E6;
	Wed,  5 Feb 2025 20:36:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="A65VArnL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2375B10E3E6
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2025 20:36:43 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-5dcd09af4f9so506569a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2025 12:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738787801; x=1739392601; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7LaIHhUhM3MiwbNj642cr48xuyOAOk/UPtx3aLDwDwM=;
 b=A65VArnL9Dsf1KAtV0zRjD1Fclk+wCXcWXMenHh36BW4TEKqJXL7VI1m8N3I2rm9Bk
 R/DjhV59RPB6bBaOJZOjqeqotHs+yi4yzFSbVmRWWx4EpdRfQsL7RWEKEu+0yB04CDb/
 tZJ5C22abk/+NQyUN81QT95WrkIeC0CBKVodRjBYyCjevSnMyqP3sbSHivdjIXCmtrUH
 MO1slArG4Kx7wnRvIP09dCXE/Git3bXhSrSIBly4XOTlJbdmAf2vtvP3LGSdCmFEKGAJ
 /mFC0hUYRZF/4ZkpvjEAXeuyya/8ILbLS2+LCm0I4WDjBlpGgB4FkGUjc29753Y3u2Yi
 oLEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738787801; x=1739392601;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7LaIHhUhM3MiwbNj642cr48xuyOAOk/UPtx3aLDwDwM=;
 b=K5A7tUct3QW7nNu7y0k7jzac8VQAD+Qt9pcb5dZhZgdvN2cdHjzF6zPsKy7dGAsN4N
 yXWHvZDxAOewpc7V8gYkfhI1xCSkvcnUNd2YxtMjtnsrKRj/xOoKYNxwjEgMddHBoA2S
 vtyEd+bnyDmbmubUYKjicK8CpNO4xOznK+HA0gKSuMkhsUz5ZMtmKaaE+gny0qXlofaK
 ODK3oAEX/UgL0P3XpBEUuTu4QmCKX/PM/8U8XMmYDDTkKCDhdlY1C6cdVEIsyogL3QGJ
 XWt72G3IZsxFE+W5N4fRAfagHul83xzmR8PRJPtHUZpt6+G5wGo63P5RaiO/cf10AEDk
 aTpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoIxjUTxUEzCSyWMpbPSF1wvNw1iygb2dxfLXB3nPhKSCokz+KUY9OtzGBsvW+QGMwajA+8WaRCQI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyhq5mcJvEpahK6jdjRaD92VZujlMbF8dUXGKHZfZNnzKoTwMct
 XwXov2e196dFMhGgiR1PlLHoW6nWEViB1PqX/5DE9DsDegG3cblBdR3G3pvZlrScar365OKC1aR
 bCO+mxTH9ykXz2iF6qpEoqzKRdQw=
X-Gm-Gg: ASbGncthbaBeQGmL8LZsWCM7+W8Ye9YLHGYEcjXoQLIIuv3p2+fKv+IPWaRbZ2xnGAd
 SYBkJ44Yl2s5dhGbdJLVq2vjjKjSR2eC1w2kdEMQizagCzyiGqO6pKXgBJ3czZ2Fwrp7Z63A=
X-Google-Smtp-Source: AGHT+IGCNARq/S6flKBk1hsdDpgzC0mJGccw8CN73wZw3M31xCCPOI69qccB2KG7dZGEukQGOPb+n7mn03YtMGHd1pw=
X-Received: by 2002:a17:906:f593:b0:aaf:c27e:12e8 with SMTP id
 a640c23a62f3a-ab75e35dbc2mr567563366b.37.1738787801129; Wed, 05 Feb 2025
 12:36:41 -0800 (PST)
MIME-Version: 1.0
References: <Z4D5a5NYrAbNxUL6@pollux> <Z4kG5AcVeQKegLnb@pollux>
 <20250128092334.GA28548@lst.de>
 <293df3d54bad446e8fd527f204c6dc301354e340.camel@mailbox.org>
 <20250130154646.GA2298732@nvidia.com> <2025013030-gummy-cosmic-7927@gregkh>
 <20250130172437.GN5556@nvidia.com> <2025013148-reversal-pessimism-1515@gregkh>
 <20250131135421.GO5556@nvidia.com>
 <2b9b75d1-eb8e-494a-b05f-59f75c92e6ae@marcan.st>
 <Z6OzgBYZNJPr_ZD1@phenom.ffwll.local>
In-Reply-To: <Z6OzgBYZNJPr_ZD1@phenom.ffwll.local>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 6 Feb 2025 06:36:28 +1000
X-Gm-Features: AWEUYZl4PgDWEAOqJs8geanKYzm8-RmxJs8QL-ZQeTHW_IM3hse2lK_-6T3WYCA
Message-ID: <CAPM=9tzPR9wd=3Wbjnp-T0W8-dDfGah-H3Ny52G85B+2Ev9ksA@mail.gmail.com>
Subject: Re: On community influencing (was Re: [PATCH v8 2/2] rust: add dma
 coherent allocator abstraction.)
To: Hector Martin <marcan@marcan.st>, Jason Gunthorpe <jgg@nvidia.com>, 
 Greg KH <gregkh@linuxfoundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, 
 phasta@kernel.org, Christoph Hellwig <hch@lst.de>,
 Danilo Krummrich <dakr@kernel.org>, 
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, daniel.almeida@collabora.com, 
 aliceryhl@google.com, robin.murphy@arm.com, rust-for-linux@vger.kernel.org, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Valentin Obst <kernel@valentinobst.de>, 
 open list <linux-kernel@vger.kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 airlied@redhat.com, "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>, 
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 6 Feb 2025 at 04:52, Simona Vetter <simona.vetter@ffwll.ch> wrote:
>
> On Tue, Feb 04, 2025 at 03:46:14AM +0900, Hector Martin wrote:
> > Adding Linus
> >
> > My 2c: If Linus doesn't pipe up with an authoritative answer to this
> > thread, Miguel and the other Rust folks should just merge this series
> > once it is reviewed and ready, ignoring Christoph's overt attempt at
> > sabotaging the project. If Linus pulls it, what Christoph says doesn't
> > matter. If Linus doesn't pull it, the R4L project is essentially dead
> > until either Linus or Christoph make a move. Everything else is beating
> > around the bush.
> >
> > Rust folks: Please don't waste your time and mental cycles on drama like
> > this. It's not worth your time. Either Linus likes it, or he doesn't.
> > Everything else is distractions orchestrated by a subset of saboteur
> > maintainers who are trying to demoralize you until you give up, because
> > they know they're going to be on the losing side of history sooner or
> > later. No amount of sabotage from old entrenched maintainers is going to
> > stop the world from moving forward towards memory-safe languages.
> >
> > FWIW, in my opinion, the "cancer" comment from Christoph would be enough
> > to qualify for Code-of-Conduct action, but I doubt anything of the sort
> > will happen.
>
> Yeah no.
>
> https://chaos.social/@sima/113942119012147959
>
> This was about you, because typing a proper answer takes a bit longer. It
> was also about your toots on fedi, like this:
>
> https://social.treehouse.systems/@marcan/113941468353031993
>
> And "haha it's only a joke" does not work with your public profile and following.
>
> I do understand the frustration and temptation to just burn it all to the
> ground, head the call of the sirens, or maybe for me more pick up goat
> farming in the Swiss Alps. But you can't have it both and expect to also
> be part of and contribute to the same community. And personally I don't
> appreciate getting drenched in gasoline while I'm trying to quench flames
> on the ground.
>
> And this isn't the first time or the second, by now it's a pretty clear
> pattern over some years. And with the first I could explain why you react
> like that and you had my full understanding, but eventually that runs a
> bit thin as an excuse.  Now I'm left with the unlikely explanation that
> you just like thundering in as the cavalry, fashionably late, maximally
> destructive, because it entertains the masses on fedi or reddit or
> wherever. I have no idea what you're trying to achieve here, I really
> don't get it, but I am for sure fed up dealing with the fallout.
>

To back up Sima here, we don't need grandstanding, brigading, playing
to the crowd, streamer drama creation or any of that in discussions
around this.

The r4l team and drm maintainer team have this sort of thing in hand,
it's not like we don't understand the community of the Linux kernel,
and having this first reaction to blow shit up and dramatise it just
isn't helpful.

Being toxic on the right side of an argument is still toxic, please
try and be better, and maybe take a step back and consider is what you
are posting going to help the discussion or just adding pointless
drama to it.

Dave.
