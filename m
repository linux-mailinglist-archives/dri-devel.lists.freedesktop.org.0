Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 237B6AD7BB1
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 22:05:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB3210E174;
	Thu, 12 Jun 2025 20:05:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UHMPfQ8w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B13D10E174;
 Thu, 12 Jun 2025 20:05:09 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-7d2107eb668so211388385a.1; 
 Thu, 12 Jun 2025 13:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749758708; x=1750363508; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/v8Wi9pmLbzK2fVR/8wTPHTfFlRGupAggALw4VZWcDE=;
 b=UHMPfQ8wVMCkhzeTbo00H5Z04HRq6EMkUwedkbZg5x+2UH/Tr9tQwyfzmTwaZx4Lzh
 Hn+cnsziWhKwhT50gE/w2mSdOyW7Ez8H4pEMJOLgFFgVLliDlKURNiopT0HAD011g0x8
 tkhkcwUyK0v2P80pihM/z8338KSYeb5VJxYieX08FdMKsXB4U2zIYBvGYO7mg187us3j
 z7i53M8qoy260nUyqzUvJXVR/GztEN+gW8bgU5Dbgqp/ddeIVqj//6LtBaXKAHQ7e8tS
 j3cw8fwIRBRF9Q3sic/mIGyFzkQ8tGVOXMm0FoKxZk9i0zWxDQrdlDt2ZhpM9RL/X5Rl
 06Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749758708; x=1750363508;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/v8Wi9pmLbzK2fVR/8wTPHTfFlRGupAggALw4VZWcDE=;
 b=fV+7EfD9IL3ot86FJmSz4VDD3y+PzySkPF/QHDdDzAa9/BoVd+0LBdrc581+hq4dwQ
 cujOdhIBruj/8dMn7GmLLx1OZm3F9pLqMKjTbaL4WYIVPg9WxNOWkfAnEc+8P2opee8Q
 aBU1wHIf0KvH9Ud++/f0GnmUy+AdAI1DGDhJGeCz1MvdJ3TLSX3P8lPPMZ8A2MsIrskr
 DrF7mHXf3Mct3/ZsINtNxpXfpprmdyyugqp5gvUQTqdsWYQaZ3ZT7hphpPjX+rQ/3tUl
 TXUZ4AsButmmfxM+kR6UTyjq+XndtDyzePG89uMpSAsai3IAcqLBc32zZWBcI3lC/3oZ
 CfcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkyGa6/SFKYaoUJzIzjh1ED0LWBV3RV9Cx8ltXdKQOWdIFGCP2Ph+9wU/00DZ/aszNLFA3fI/J4A==@lists.freedesktop.org,
 AJvYcCXnNBCAABynYvnZLCnVTZdIau/opPmN+0Es+PNwbwhxz8wnvkoYvrsvs4i6oteBWJ7Z7zVRbEu6e0Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzB7JZxUoT2RbTEp653W5/FttDWzQgypVB9ZY7iIfJnlJNGw6UO
 0RHvsnjmyNajDUiiCX4T3yQzl3qZ1MoT5Bn2/u/szr9MNU+gVVM5+MT5
X-Gm-Gg: ASbGnctBVUNaYTGfjEffhD0hMDFOST3Cgln0mWg+kExt3Oo3xVxwU8eLJFlU+dGvT0q
 UWfFFdgk+t6BTlECx+esOvWdVm7Ry0v630xg4JFtKgR4dpBEtW1QBH5w4QmUe5mZTxmXHdf/dsT
 Hfp9gMHb40LjbXxcrm1rs4Aj2tWCpgiw0LEipjjO3iEw9Mc/4/9P4dDeV/bC6J6zzqRGlQro5Wq
 1eunrWlqjR2U93cGrvjYn3lg7BxdOMMhQnndPShPyRj4vGyjyToQEF1Y1CVkIA3DxcEFPB4HXac
 sDRagkcbv2vXC+q/aOvktu7QpKOzY0YQI87ve/vkfZcToOUTC3prbKqRaTV3GlBwWMGT/agD344
 l/DsxTVC7gQWkzacLECoJc59AQFVBN6rUiczPiT2yIzdCQolaVUiV
X-Google-Smtp-Source: AGHT+IGPvbhYn1lrn4qrmeoqzJFjK9J0A7QGgbiWc7FHysFCIXuha98d9b++ZX/ELwLmeM9pGf4jzg==
X-Received: by 2002:a05:620a:28c5:b0:7cc:fddb:74d9 with SMTP id
 af79cd13be357-7d3bc3aa135mr102342385a.22.1749758707841; 
 Thu, 12 Jun 2025 13:05:07 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com
 (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7d3b8e014dcsm78864185a.34.2025.06.12.13.05.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jun 2025 13:05:07 -0700 (PDT)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfauth.phl.internal (Postfix) with ESMTP id A02B01200069;
 Thu, 12 Jun 2025 16:05:06 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-11.internal (MEProxy); Thu, 12 Jun 2025 16:05:06 -0400
X-ME-Sender: <xms:8jJLaDKg1c-9WrSx28hWxxjLGRPk-oC9LXUQXrH7iYPsPfmRxfKG6g>
 <xme:8jJLaHI98L03KajeyCOFSEhjpbfFLEDSLmvOCQZ0RfDaBO4JoiHAt_1ovxTbHdkCD
 8foDAuobfUGm_rjtQ>
X-ME-Received: <xmr:8jJLaLvt9i59zBXEyTt_YbiW5XQE0leVQffWjB_jhVQ7AWkwHLZNU40kESA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduheelkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
 necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
 drtghomheqnecuggftrfgrthhtvghrnhephedugfduffffteeutddvheeuveelvdfhleel
 ieevtdeguefhgeeuveeiudffiedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
 hmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghl
 ihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepgh
 hmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedvhedpmhho
 uggvpehsmhhtphhouhhtpdhrtghpthhtohepjhhhuhgssggrrhgusehnvhhiughirgdrtg
 homhdprhgtphhtthhopegrtghouhhrsghothesnhhvihguihgrrdgtohhmpdhrtghpthht
 ohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnh
 horhesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgv
 thdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomhdprh
 gtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
 rghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepthhmghhrohhssh
 esuhhmihgthhdrvgguuh
X-ME-Proxy: <xmx:8jJLaMamAHDz7-udyNIXaRAnQ5xED8QoPEp7Vi9OM1U-oarB-YAKnQ>
 <xmx:8jJLaKaq6PRdbPepVJaW_bsaSLlxn2oAo5ggiqXbd9brNEG7wnkirA>
 <xmx:8jJLaABpUBZ_vC7o5pmrsbmXztk0Mv4neO5_MKsYE9cNAfEfp-lrzw>
 <xmx:8jJLaIZGMP1bP5oyTJkZ5v-KBjTvfqzJBLQlOLYji6S0FsvmZRB56g>
 <xmx:8jJLaOo3I22I0K7cjp0hS0Av5MFGXjhucJXIc_y_asDa0_aC3TqKWFek>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Jun 2025 16:05:06 -0400 (EDT)
Date: Thu, 12 Jun 2025 13:05:05 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: John Hubbard <jhubbard@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Benno Lossin <lossin@kernel.org>, Ben Skeggs <bskeggs@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 04/23] rust: add new `num` module with `PowerOfTwo` type
Message-ID: <aEsy8XDy6JW8zb6v@tardis.local>
References: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
 <20250612-nova-frts-v5-4-14ba7eaf166b@nvidia.com>
 <aErtL6yxLu3Azbsm@tardis.local>
 <f8d9af76-fc1d-4f7a-8dfb-a0606e44c56b@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8d9af76-fc1d-4f7a-8dfb-a0606e44c56b@nvidia.com>
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

On Thu, Jun 12, 2025 at 01:00:12PM -0700, John Hubbard wrote:
> On 6/12/25 8:07 AM, Boqun Feng wrote:
> > On Thu, Jun 12, 2025 at 11:01:32PM +0900, Alexandre Courbot wrote:
> ...
> >> +                #[inline(always)]
> >> +                pub const fn align_down(self, value: $t) -> $t {
> > 
> > I'm late to party, but could we instead implement:
> > 
> >     pub const fn round_down<i32>(value: i32, shift: i32) -> i32 {
> >         value & !((1 << shift) - 1)
> >     }
> > 
> >     pub const fn round_up<i32>(value: i32, shift: i32) -> i32 {
> >         let mask = (1 << shift) - 1;
> >         value.wrapping_add(mask) & !mask
> >     }
> 
> Just a naming concern here.
> 
> The function name, and the "shift" argument is extremely odd there.
> And that's because it is re-inventing the concept of align_down()
> and align_up(), but with a misleading name and a hard to understand
> "shift" argument.
> 
> If you are "rounding" to a power of two, that's normally called
> alignment, at least in kernel code. And if you are rounding to the
> nearest...integer, for example, that's rounding.
> 
> But "rounding" with a "shift" argument? That's a little too 
> creative! :) 
> 

Oh, sorry, I should have mentioned where I got these names, see
round_up() and round_down() in include/linux/math.h. But no objection to
find a better name for "shift".

Regards,
Boqun

> > 
> > ? It's much harder to pass an invalid alignment with this.
> 
> Hopefully we can address argument validation without blowing up
> the usual naming conventions.
> 
> 
> thanks,
> -- 
> John Hubbard
> 
