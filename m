Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A924EA29977
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 19:52:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82BB710E0BE;
	Wed,  5 Feb 2025 18:52:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="UFgn9lps";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E447E10E0BE
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2025 18:52:53 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-436202dd730so619105e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2025 10:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1738781572; x=1739386372; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ePVNd0w+sVoa196Zz6yKJq58LAUrkT1uJTWGzJaE14w=;
 b=UFgn9lpsTcUJ2zqAW/NrbFa49wthnB/RY351mNfAAfSUlBLddrjWNMQfDsArRMtvFe
 S5Jyg0V/IFefauKejI9SZVkjmXcOzS25hgEEdOGx5OQOIQYPhTYNCSKI7GOv9YqaeMto
 2v296IKrxDrSLTN6yiV0G5+09lZqPXIyYxGxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738781572; x=1739386372;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ePVNd0w+sVoa196Zz6yKJq58LAUrkT1uJTWGzJaE14w=;
 b=vbbIWF5+DDhlXFXLvWTYlj37fKTw5oBOOfNSEOoiJqPZULOL4Q785UIWO+IiQDxwtt
 xgrww7df+x5SmkXNvydd+dQYSTcnKqi4jmMmIMOjeI7E1M/0V/jTKDyBVQm/6rYBcxyh
 VlSqGeC+GJByKXfEm3LwJo+D77aCtM3F6AZDq1Jgr6tgh6G00Lc32cWElN/PsOmmWrJf
 v07kAn20lds7i6hw69nM3F8RC1yXhoOFjqnaqA9fh78RW0V5C/Q0vdcYvJKkdg1Ax+J+
 5YsDI34sEXg3WTNfwBC5nEkSX2yJ7/ZZVXW5rLE6UcdV9fSQ8W46NZJwUDMr23RJAyLh
 AyEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXr/rmmKpw06JMtJb7vNdmyEKEO5Dkw6kgjBlmAoeTzzEl1FqtCXPXhQC8Ll4YOYmfE3/zdQYYZkU8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4AfTYZQPJoQedHP66FGJXi3Hn1v3RVGsWbYfILK8rc/FRKVit
 +HA9pLcbvkDMfNGEVtBeukIvL+ikgbKauCBL/R5B4cR3R7ADifjv/gbAVklPSEA=
X-Gm-Gg: ASbGncuzMVU6H5fhbcE2xoPkdiPQi8zwpkiZaY+dTHdEwYC1W5+jbaLht1rTMU8Ng2z
 Tn+gz3VKOaHlCeQZq/YHJXDhI16Bt86MdRkoAHSjZbAwEVWKtw8jcZAAxPQoJlRb2qy+5wD50iB
 zzbG+3WbceEKYHGQQTyN0M0OIY81xbBFvxI/js3fkHy8pGc1srrEGc1NSfggjK5YPO6FWErQPan
 oqsnAKrJ2CcsVMEGb3CixBLbMIV0pGagbGj1KIYNRh+JFIiqlcudcZgJLItpCazUEqP7REUbRsn
 RCi7EMbz4OTRfGPSrzF+alnYRCE=
X-Google-Smtp-Source: AGHT+IFj/bNfkP952mgSDtZ9yP9hHw6wGl45/r2VXPQTulXqtOd73dZIJPv3lk+l159xaf5CNE6cdw==
X-Received: by 2002:a05:600c:1d9d:b0:434:ffe3:bc7d with SMTP id
 5b1f17b1804b1-4390d43d796mr41071805e9.16.1738781571766; 
 Wed, 05 Feb 2025 10:52:51 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390db11264sm29164665e9.35.2025.02.05.10.52.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2025 10:52:51 -0800 (PST)
Date: Wed, 5 Feb 2025 19:52:48 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Hector Martin <marcan@marcan.st>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Greg KH <gregkh@linuxfoundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, phasta@kernel.org,
 Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 daniel.almeida@collabora.com, aliceryhl@google.com,
 robin.murphy@arm.com, rust-for-linux@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Valentin Obst <kernel@valentinobst.de>,
 open list <linux-kernel@vger.kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, airlied@redhat.com,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
 DRI Development <dri-devel@lists.freedesktop.org>
Subject: On community influencing (was Re: [PATCH v8 2/2] rust: add dma
 coherent allocator abstraction.)
Message-ID: <Z6OzgBYZNJPr_ZD1@phenom.ffwll.local>
Mail-Followup-To: Hector Martin <marcan@marcan.st>,
 Jason Gunthorpe <jgg@nvidia.com>,
 Greg KH <gregkh@linuxfoundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, phasta@kernel.org,
 Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 daniel.almeida@collabora.com, aliceryhl@google.com,
 robin.murphy@arm.com, rust-for-linux@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Valentin Obst <kernel@valentinobst.de>,
 open list <linux-kernel@vger.kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, airlied@redhat.com,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <Z4D5a5NYrAbNxUL6@pollux> <Z4kG5AcVeQKegLnb@pollux>
 <20250128092334.GA28548@lst.de>
 <293df3d54bad446e8fd527f204c6dc301354e340.camel@mailbox.org>
 <20250130154646.GA2298732@nvidia.com>
 <2025013030-gummy-cosmic-7927@gregkh>
 <20250130172437.GN5556@nvidia.com>
 <2025013148-reversal-pessimism-1515@gregkh>
 <20250131135421.GO5556@nvidia.com>
 <2b9b75d1-eb8e-494a-b05f-59f75c92e6ae@marcan.st>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b9b75d1-eb8e-494a-b05f-59f75c92e6ae@marcan.st>
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

On Tue, Feb 04, 2025 at 03:46:14AM +0900, Hector Martin wrote:
> Adding Linus
> 
> My 2c: If Linus doesn't pipe up with an authoritative answer to this
> thread, Miguel and the other Rust folks should just merge this series
> once it is reviewed and ready, ignoring Christoph's overt attempt at
> sabotaging the project. If Linus pulls it, what Christoph says doesn't
> matter. If Linus doesn't pull it, the R4L project is essentially dead
> until either Linus or Christoph make a move. Everything else is beating
> around the bush.
> 
> Rust folks: Please don't waste your time and mental cycles on drama like
> this. It's not worth your time. Either Linus likes it, or he doesn't.
> Everything else is distractions orchestrated by a subset of saboteur
> maintainers who are trying to demoralize you until you give up, because
> they know they're going to be on the losing side of history sooner or
> later. No amount of sabotage from old entrenched maintainers is going to
> stop the world from moving forward towards memory-safe languages.
> 
> FWIW, in my opinion, the "cancer" comment from Christoph would be enough
> to qualify for Code-of-Conduct action, but I doubt anything of the sort
> will happen.

Yeah no.

https://chaos.social/@sima/113942119012147959

This was about you, because typing a proper answer takes a bit longer. It
was also about your toots on fedi, like this:

https://social.treehouse.systems/@marcan/113941468353031993

And "haha it's only a joke" does not work with your public profile and following.

I do understand the frustration and temptation to just burn it all to the
ground, head the call of the sirens, or maybe for me more pick up goat
farming in the Swiss Alps. But you can't have it both and expect to also
be part of and contribute to the same community. And personally I don't
appreciate getting drenched in gasoline while I'm trying to quench flames
on the ground.

And this isn't the first time or the second, by now it's a pretty clear
pattern over some years. And with the first I could explain why you react
like that and you had my full understanding, but eventually that runs a
bit thin as an excuse.  Now I'm left with the unlikely explanation that
you just like thundering in as the cavalry, fashionably late, maximally
destructive, because it entertains the masses on fedi or reddit or
wherever. I have no idea what you're trying to achieve here, I really
don't get it, but I am for sure fed up dealing with the fallout.

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
