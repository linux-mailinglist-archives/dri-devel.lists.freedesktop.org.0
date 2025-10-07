Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB0FBC1F56
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 17:41:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E36710E6DE;
	Tue,  7 Oct 2025 15:41:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mVmqv1/X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E4AA10E6DE
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 15:41:05 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-71d603acc23so70820997b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 08:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759851664; x=1760456464; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=FaFNh20XxOdj2oQlwRRyR9v75gYMq+FkiOKklphUgxg=;
 b=mVmqv1/X04O8Qjb97KYfk5ljI7LVl83SdwYb71TWQKDRibogq3GxlTQwqEOxdN90sM
 XIoeXBn+501miIglcKzhr8PZC0mhBGACGqWMxo6+t103lFrawfNIrw870lvJd3NtitVu
 xeCj7etCpzF0zyO6H80PWwB2uddzbMi3yuz0WNgeiq+OPVmbWZE3/aLImK8v8W9iJris
 1MLlFtr9dhoaDctCMYI3q3AdRtJZdcLvIdEJw2fQVHRPv0Pv2Ci4wcZFRgf/k17sNC7I
 6oAgVT4INfHaUV5OLzovdfv23lbA/hp/zOuSvwH7YODA7NTxsQpIzqe3vxlwkIIpjIzE
 jkSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759851664; x=1760456464;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FaFNh20XxOdj2oQlwRRyR9v75gYMq+FkiOKklphUgxg=;
 b=EgaHVd4qHbekSIJ0RX9pOoHK8W06B/vhRVBC3+xCO079Bb/1mHn/BNLGLUL8A28fMK
 AQxcV8iTkRrX+h+jJHbzp7CFsSi7Eck9gwGH0VgajzPCM/gD72Iy3cqSwUjaTiW8la4+
 4nptMeQR7QmnzLsNZ0VwVxVGi/8XUOL9rySRIUlGb2PlAffMT+Kgr3CXPIBy6dZeJxRi
 4ioED+xSSUZDUGrRUr4rGIKp981q5Z99eAOmRQEURWsD/LwNLYLnexv0XZqeAkk6r0S6
 t8OJ3Dtx4KdyH7W8lvecnKIfbOM4dNnV/JeDZQPcIfEAj8uLxTplvZsNbr4kxkbfFihr
 hAPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTRrAbig/y6+OlxOtXD5MZPJ4HbSk7VLIUpAC2oDJnoqmQ8RLnq5mqw8ZJMStBglIHqdhf7A1QAoY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyoX3A0YrLQzEPBTvgtnX7MGhGnbdPTqY3ynOD/4tawywaydOFq
 tmA6abSpoe3qQFcCbtH4uOEgC3VnMha2JUS2eEyXAxbvMfZLy6LpTiWE
X-Gm-Gg: ASbGncubj8caPx5MGXMVcdaVXL4Kvr6tamgPbPTkEl1KNefXHdNwpDMDgu5OQAatTdn
 PAQwPM8f+2Q5csR9EZ5acNdzAwuF7mkCrOdR8gKWoAUCIm9pGpP7wwA9DbvayJKrgIQ2gx/pANx
 v3y4di+o/ShOzQiUmmKe+LpOQXW6fb6jR0vVnPEabsvgcerGrGt6LFdH1gsT1x4KpUar13TOA53
 C892J5HIw0M4lXcBHMOtztMicdO4CaGZCnSjI/cfOwN4QbcZW8N61bbhIjLUO7pFHT8bOKcNX82
 Mv3saD67FN3QLiyqgWW0xxy8r0r+Rlpoebaz1SgNgfJRDWKEebBCnqfhh4L9+4T7Mo1FZ/sIz9w
 oHNXzZn0tqPHQ6QLsnC1ahJ7PdbGhmjw6C7ApwWX+kGCaDkI7v9XQQCuODcVhhCvUPhjgYYaQim
 lizMM=
X-Google-Smtp-Source: AGHT+IEkcHgYm3I1MFNRw2OsYxWZ79jw7Dqd1n6B3m6dIb5JmohqIcLJaaJ9AQ+WvnlX2m3w3mdRiA==
X-Received: by 2002:a05:690c:688d:b0:768:70a1:46c2 with SMTP id
 00721157ae682-780e15f2ee7mr2747787b3.48.1759851664152; 
 Tue, 07 Oct 2025 08:41:04 -0700 (PDT)
Received: from localhost (c-73-105-0-253.hsd1.fl.comcast.net. [73.105.0.253])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-77f81d342basm54065697b3.48.2025.10.07.08.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Oct 2025 08:41:03 -0700 (PDT)
Date: Tue, 7 Oct 2025 11:41:02 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>, nouveau@lists.freedesktop.org
Subject: Re: [PATCH v6 0/5] Introduce bitfield and move register macro to
 rust/kernel/
Message-ID: <aOU0joJQZiU61GBB@yury>
References: <20251003154748.1687160-1-joelagnelf@nvidia.com>
 <aORCwckUwZspBMfv@yury> <DDC0VAHL5OCP.DROT6CPKE5H5@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DDC0VAHL5OCP.DROT6CPKE5H5@nvidia.com>
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

On Tue, Oct 07, 2025 at 07:36:21PM +0900, Alexandre Courbot wrote:
> Hi Yuri,
> 
> On Tue Oct 7, 2025 at 7:29 AM JST, Yury Norov wrote:
> <snip>
> > Regardless, I don't think that this is the right path to move the
> > bitfields into the core. The natural path for a feature that has
> > been originally developed on driver side is to mature in there and
> > get merged to core libraries after a while. Resctrl from Intel is one
> > recent example.
> >
> > With that said, I'm OK if you move the bitfields as a whole, like you
> > do in v5, and I'm also OK if you split out the part essential for nova
> > and take it into the driver. In that case the bitfields will stay in 
> > drivers and you'll be able to focus on the features that _you_ need,
> > not on generic considerations.
> >
> > I'm not OK to move bitfields in their current (v6) incomplete form in
> > rust/kernel. We still have no solid understanding on the API and
> > implementation that we've been all agreed on.
> 
> Initially the plan was indeed to give this code some more time to mature
> in nova-core before moving it out.
> 
> The reason for the early move is that we have another driver (Tyr) who
> wants to start using the register macro. Without it, they would be left
> with the option of either reinventing the wheel, or poking at registers
> the old-fashioned way, which I think we can agree is not going to be any
> safer than the current macro. :)
> 
> IIUC your remaining concern is with the possible loss of data when
> setting a field that is smaller than its primitive type? That should be
> addressed by [0], but as it introduces a new core feature I expect some
> discussion to take place before it can be merged. In the meantime, it
> would be great if we can make the register macro available.
> 
> Because letting it fully mature within nova-core also has the drawback
> that we might miss the perspective of other potential users, which may
> make us draw ourselves into a corner that will make the macro less
> useful generally speaking. We are at a stage where we can still make
> design changes if needed, but we need to hear from other users, and
> these won't come as long as the macro is in nova-core.

Hi Alexandre,

Thanks for the broader perspective.

So if there's another user for register!(), then yeah - it's worth to
move it out of the nova earlier. It doesn't mean that we need to split
bitfields out of it immediately.
 
> [0] https://lore.kernel.org/rust-for-linux/20251002-bounded_ints-v1-0-dd60f5804ea4@nvidia.com/

This resembles the _BitInt from C23 standard, and it looks quite
reasonable to me. I'll get back to your RFC shortly.

https://en.cppreference.com/w/c/language/arithmetic_types.html

--

I'm glad that we started this discussion. From my point, what happens now
is inventing the whole new language, and basic bit operations is the heart
of it.

I would really like to avoid adopting an API that will frustrate people
for decades after invention. Please read the following rant to taste
exactly what I mean:

https://lore.kernel.org/all/CAHk-=whoOUsqPKb7OQwhQf9H_3=5sXGPJrDbfQfwLB3Bi13tcQ@mail.gmail.com/

Thanks,
Yury
