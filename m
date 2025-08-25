Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6983BB334ED
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 06:14:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB8EE10E0E6;
	Mon, 25 Aug 2025 04:14:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ehpa2+we";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEA7B10E0E6;
 Mon, 25 Aug 2025 04:14:27 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-4b133b24ed7so33753661cf.3; 
 Sun, 24 Aug 2025 21:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756095267; x=1756700067; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JOh2zrgwMM7O3l0xhloYC/6+a1bBMnQHqCxm2UGL5BM=;
 b=Ehpa2+weSlUDINEPwMYeK38NanCwoI3oDZNjrl066XmpxiUiOhmE7QEctELwE7z36T
 qFxW0sVgqyZ8wBglxiDpJZ0bh0dSjGcXv5dzOC6btUuUux+vDlHtxGkTWEPZ2W2cfj5O
 0+nlZxJET+8alLn6W+YclsZiWdDH8+RhgXPR2HR/eX6wGK8XKCfQSMl2DNRNqmwInmV7
 l+uVEUqXIhzFGmp82Jw1uxJPVU8qgO/k19bYxbxNBj+J7mdGBhyNU9FmZ5+GGC8AwgEx
 XNAk0XSi6eS8OReGvamAqb3ob5WbdGGEdGTqAUQoWYGLOybdKK9Z+JHBkuHBYhVT4AFw
 V8Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756095267; x=1756700067;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JOh2zrgwMM7O3l0xhloYC/6+a1bBMnQHqCxm2UGL5BM=;
 b=hfxyGZVpwSY/63Z8CTn1R2yi9YHZNjF5VgjiuNALi37YPCNCZwVuSnkPFxl2hL9U85
 OMr0MX9FXEAXtxOtW8zPaU65FyqKkHY+P7dqcfPZotp8597Zl+NTNRjLhFk4jJoOS7gv
 I4SPwV5f1R/zqlwuMp6jwnYnBwz8yobzOpUUhW6L5GC7x1vh/3k4LUjjbqEg+eQPWs7f
 vxW3WX2G+WKdfddnD6ChqMYzopr1iDc0pVLhfZSQZMapZCVBkfNCyEU6rn33xvrZjA+s
 aXnb0xf1QdbdPRK0s+84OSWE2oJ/ygMlBMNBlV7wsMAU8CjWn1KVFW9Nlq4L8gmAkmNx
 Agug==
X-Forwarded-Encrypted: i=1;
 AJvYcCUi/z1NdC3YUWadmP/4KPyWURtV7ZRcvRxQDjQdFhCZFGvLEhILo+FbTIVBzCyhpLlFWaAuNYMHAw==@lists.freedesktop.org,
 AJvYcCUtbPBlaTx/XxMfsp84hF9c2xO+5bsvgQj4Qo6hpGkIMyjAidysNtX+QSTZAbsXzRpdbwDOfH/Lt/o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwfBTV9/YjeTNtBhxZ9nSUz+mCWlY6Dv8jv9FeGjefBYg2nxA6Z
 KO8b9gUxd6MUyK3P2hwj88QNpmFPZpXo6vf2/6g37a89NPESyTJOyzq1
X-Gm-Gg: ASbGncuAx53RCGb30zianhjl2TMJbf7FgjRfXe7DTr9El79eWi2wDzl8WkVGw2i343A
 IOuIClu2Fb1tAw2yLaguSXOQ53sNZ0iJQu1RDRHH1c7p1749GJzoQ9DIs1UhDhU8piI4QOZQBP0
 tV7QWbl2LxcKU1DZr7W3RbcYUidp6tw52wEQP4dTFcjhqGR7A/0CZjEXVgN+w8pggAk0O3BGucs
 jZKw6ZuljwrXQ5IpP4fAOsD4GLWoPuC+v2/ASI3eCWi8/o6BpQe/I/H5nqRnMGoQ7Bpgmx/gDQR
 LBxDs8chfr/rCOUwcQE1PxKlYV0OPpZ1bG/aLASoDqfC6K+SefPePQDOUUM13HK3fOjetCRl+g7
 78qboobVjBjIiNfotfNjOY2sV31EOIIRdXuzn9WEph+awONdlopZEPjwt3DSgekyHBLvDJ2WaDR
 P1YGVT1pYty3X/PPjxlwjuZdc=
X-Google-Smtp-Source: AGHT+IHTpmBSdC9OospIa44n4b+nt4viPlNUNTHKQNuykbjihG/uNqp4xTDAwFri6VpVN5FwW8kVWg==
X-Received: by 2002:a05:622a:1ba3:b0:4ab:42a5:7f1b with SMTP id
 d75a77b69052e-4b2aab04a8fmr128331761cf.47.1756095266463; 
 Sun, 24 Aug 2025 21:14:26 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com
 (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7ebede53d5esm403947485a.24.2025.08.24.21.14.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Aug 2025 21:14:26 -0700 (PDT)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfauth.phl.internal (Postfix) with ESMTP id 7B0E5F40066;
 Mon, 25 Aug 2025 00:14:25 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Mon, 25 Aug 2025 00:14:25 -0400
X-ME-Sender: <xms:IeOraAqVH0xHpIKyWQ3ybJ_Kshjv0YpB6lPdCifKz6WF4djBaEhJ8w>
 <xme:IeOraEVYpeMnNsdmg52cN7iFAaw0sI7AL_f9UYJro-7w4mfeat8HJMwc_x0CyISKF
 9HfAjhXBt2RnPrzJA>
X-ME-Received: <xmr:IeOraG99wwM06ImfE2hoTc02kCFVMNREZV0BhweHSpTD0gaOJmzB0g1oZNwAs36khWqjtyp_FUJGf2Zt3rAcgpVBMPXMGvcf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddujedugeduucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
 hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
 gvrhhnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueevieduffei
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
 hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
 udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
 gvrdhnrghmvgdpnhgspghrtghpthhtohepvddtpdhmohguvgepshhmthhpohhuthdprhgt
 phhtthhopehjohgvlhgrghhnvghlfhesnhhvihguihgrrdgtohhmpdhrtghpthhtoheplh
 hinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
 uggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrtghouhhrsghothesnhhvih
 guihgrrdgtohhmpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgt
 phhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepohhjvggurgeskh
 gvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdr
 tghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvth
X-ME-Proxy: <xmx:IeOraEbbrZyUqYjMScyfJ-LJA6t6Jpt2QYEsAKW25DbudEMMkMtWEw>
 <xmx:IeOraGfX6oGaAe0wjNwJ0xqGCfMSc8fGy_Kg_CoQSICGyB3WSSZnfw>
 <xmx:IeOraGpiQj177fPWnyMZxuOOBmK9PRMdHc_MfV5WShnqpgIFs8JBqA>
 <xmx:IeOraFDXdSn8FLG6f3J8YLE8iwP_27ELJNiNLIQbiNBmU1oACjQzIw>
 <xmx:IeOraMWaGOO-91bFCJRNYaTjfXFvjB-Vitnlz9G1q4h7zE3vFnHmo3_A>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Aug 2025 00:14:24 -0400 (EDT)
Date: Sun, 24 Aug 2025 21:14:24 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/2] nova-core: Add a library for bitfields in Rust structs
Message-ID: <aKvjIM39f1oGyn23@tardis-2.local>
References: <20250824135954.2243774-1-joelagnelf@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250824135954.2243774-1-joelagnelf@nvidia.com>
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

On Sun, Aug 24, 2025 at 09:59:52AM -0400, Joel Fernandes wrote:
> Add a minimal bitfield library for defining in Rust structures (called
> bitstruct), similar in concept to bit fields in C structs. This will be used
> for defining page table entries and other structures in nova-core.
> 
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>

FWIW, Joel, I only received patch 1/2.

Regards,
Boqun

[..]
