Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCB8BA6036
	for <lists+dri-devel@lfdr.de>; Sat, 27 Sep 2025 16:03:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56CED10E1B8;
	Sat, 27 Sep 2025 14:03:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kaqCJMwO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D00710E1B8
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Sep 2025 14:03:44 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id
 af79cd13be357-856701dc22aso310105485a.3
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Sep 2025 07:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758981823; x=1759586623; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :feedback-id:from:to:cc:subject:date:message-id:reply-to;
 bh=1RowTgROwHl16yIt+/YH6L82gef48dxD9rHygNzwZv8=;
 b=kaqCJMwOQWTu5uU4gv7CKN+5VkUAcM1nB2Mev98lU+R25iKqkehrA7ro9fRL2/JoBt
 Bwc4hNU61EcCy9VxrMwDTK0ZIeE1iYsGKVg2o3aOAOrTCo3F0vLa23V1Gp7Qnp4Agy5f
 HL3SetQFHcBgoaIlRxm7JKfmNEmSMwhqDBBd2M8SS1E1vawEO5HjNPKhQpErRayfTT6N
 c/7XPOYThj1tXgyfxIUtdl0mZ+IC27NAZ27oe9WBA8fT25zlE8+ntHPb4C3YJES7jljg
 HxQMe9P2u64LcczRYMowgfvI0xCVZbG59KqJRGZEYDMpm6TLsQ8bnANF0V6NMGDyd5r7
 U1qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758981823; x=1759586623;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1RowTgROwHl16yIt+/YH6L82gef48dxD9rHygNzwZv8=;
 b=uzfg6hEIeb1EPz2HJlut0prfvDfi0ViAD/woZDJ8kZj0bE2X3lUDKWWJv4/zgGG1hN
 DXjSPeOyk/zUsyJRao8FkeEBWoH2RBX6XX5Gxcb8xUNf3YfKlfSio0oPiclLxYTWY7BQ
 v0AinklvOGSU2h7BgAJb7YfJJ7FqDmudsllGQSZ6g7wgtlJQv7QMMjN4Rrp0D5sm7TwI
 HHlUQz53S3i5VB+QX7RDUcupxgNn9hphp5DnTv4xRYPISccjZNqSAmpZUV0xf3mcWfad
 XrLQ84OyIoXMk1QvPhjTRsLi9DKGfdKhaFNGsxsgnOtPuFmoCMdI+yuOA7zPpX2az670
 ljbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEdlIGqdHWsIFsE+WeZv11jwq6blCEc7Fhr6VIj/2LKROoWSgZgd5s3YvXB8mdIRTgglpZWP1Pmgw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzwgQ2hR7+OxoaOSaZRCVJ4oJdpIQsEQc6zGIes6ju9Mji9gCwS
 jWIwSxznOqiOHPjh7Qex1HP0xfJtqGf4os+qlT1i2p/WYgxEt1SXUFg+
X-Gm-Gg: ASbGnctw47PeY8ECJokrC4lZNDrheREHC0BkCIQPYNA9BLv525IOc28wfUm8pGfF53A
 4LzWr1UCGXnkFPX6pyTTR1htWKLcrHk3rOSuDd78AeulR1H13tt/u8JL+s1gGRZdWI8Ygn3XbOY
 RTdO5cfWd9tO81BEnqY3P43NurWXlXjTAMyBKOdvtBBPJpHXFawpW3uBTxfz8FzC9dCbVg1mrV8
 6T7JCqw6OQQDg3xIj/vv5A9MlVN3eO/+1TEMVa/4VGy6Gp0+CV1hp7NwPyptnaiH0QTiZgR24r4
 Jls6IMTY1l3sGt71GvOsOWCKMVCAFFWlNMp1JQQvHrkGXZ7tuCl+X9bnI8qM+jq0T7ZTjSfXWiN
 8xFZS/g+UrocxMxNgFtVivTvkLe1wMxPKrq3e9paS3raTecANE4rkh7+hVhv0AQI7JhTkySo2rr
 NVHRncgfvPVWb/MFhVSt/4RZTEA6ebn+W/hnY0+5m1PPr7
X-Google-Smtp-Source: AGHT+IEjsLJZDcVKW7VjD94SJTTQGuy7D2CuSP0XnP5QiF1Og6sVMZnEnghTHukI4UHYi90JuQhxLA==
X-Received: by 2002:a05:620a:2681:b0:862:79a9:eae9 with SMTP id
 af79cd13be357-86279a9ed9bmr629769085a.85.1758981821539; 
 Sat, 27 Sep 2025 07:03:41 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com
 (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-85c3218ed08sm441368585a.50.2025.09.27.07.03.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Sep 2025 07:03:41 -0700 (PDT)
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
 by mailfauth.phl.internal (Postfix) with ESMTP id 32CA4F40068;
 Sat, 27 Sep 2025 10:03:40 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-12.internal (MEProxy); Sat, 27 Sep 2025 10:03:40 -0400
X-ME-Sender: <xms:vO7XaOkakHRJvsqWLHFtsaCue-4lER0uhhpEdVDiyTQvM-clt7JAqA>
 <xme:vO7XaMowdZoBt1ZvjERssLFIFryVG6xQlckUYy7sujr3aDmGX-PYQHGF_hsK0c2Eo
 Uf2Ova8XFCQsgJX-tw5Pi7_C00N46SUWNM8sWlOBezUOL3bv9Px4g>
X-ME-Received: <xmr:vO7XaFnYgBEE1kaYfoB7fpYi3AmmkijMgLG346jOoVPulJcBdMp3lcmUy8uvHHgxYgCXjKLneOcKzE4rmXrE-KkgUEMVrpF5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdejvdegfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpeffhffvvefukfhfgggtugfgjgesthekrodttddtjeenucfhrhhomhepuehoqhhunhcu
 hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
 gvrhhnpeffleekfedutefhkefhheekhfelvdejgfegvdejjeffudelkedtffeiveejteet
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
 hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
 udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
 gvrdhnrghmvgdpnhgspghrtghpthhtohepfeeipdhmohguvgepshhmthhpohhuthdprhgt
 phhtthhopehmihhguhgvlhdrohhjvggurgdrshgrnhguohhnihhssehgmhgrihhlrdgtoh
 hmpdhrtghpthhtohepphhhrghsthgrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeho
 jhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgidrghgrhihnohhrse
 hgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhr
 tghpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghpth
 htoheplhhoshhsihhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrdhhihhnuggs
 ohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlihgtvghrhihhlhesghhooh
 hglhgvrdgtohhm
X-ME-Proxy: <xmx:vO7XaFbfSe5rN_-sdK1GxSVnOKVKQrMFGfq8HBxu5s7_wZIGPoqLrw>
 <xmx:vO7XaBHfE2uJGEmOZHTQaFl02_Nu9BhbWcr63y4RVIA07jBGfwUAgA>
 <xmx:vO7XaIOoeTYs7_ZW_lDvrSrb4vXqP73TEUrfIfWq1jCcuhcOx4YGkQ>
 <xmx:vO7XaHyutnwLGGZJM2FwjIsFy6LBiPy67EPfnCl-UBGlO2ywf0aDhQ>
 <xmx:vO7XaFn7RDDlFLjCS5q9t1KCy6953tiUDCyGEEqgOuXe_UslZGYeGqpK>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 27 Sep 2025 10:03:39 -0400 (EDT)
Date: Sat, 27 Sep 2025 07:03:38 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Philipp Stanner <phasta@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,	Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>,	Waiman Long <longman@redhat.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>,	Justin Stitt <justinstitt@google.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Asahi Lina <lina+kernel@asahilina.net>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Krishna Ketan Rai <prafulrai522@gmail.com>,
 Lyude Paul <lyude@redhat.com>,	Mitchell Levy <levymitchell0@gmail.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 llvm@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH] rust: sync: Add dma_fence abstractions
Message-ID: <aNfuulKIiLfjHRma@tardis.local>
References: <20250918123100.124738-2-phasta@kernel.org>
 <aNa7BDpKS2KA__4M@tardis.local>
 <CANiq72=6pGtKKr3XeZXLVrJTNMv7YbGzbezSUrZ7A43MJQLwJg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=6pGtKKr3XeZXLVrJTNMv7YbGzbezSUrZ7A43MJQLwJg@mail.gmail.com>
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

On Sat, Sep 27, 2025 at 02:14:22PM +0200, Miguel Ojeda wrote:
> On Fri, Sep 26, 2025 at 6:10 PM Boqun Feng <boqun.feng@gmail.com> wrote:
> >
> > Thoughts? Miguel, Greg, Danilo and Lyude, any idea or suggestion?
> 
> Either way sounds OK.
> 
> More generally, one thing to consider nowadays is whether we will want
> something to eventually live in its own crate etc., but for this I
> don't think it applies and being in the `kernel` crate is fine.
> 

Being in the `kernel` crate is fine to me as well assuming dma-buf is
also in the `kernel` crate, but I think it's not fine to put it in
kernel::sync (see my reply to Philipp) as it is.

IMO, we have a few other issues of file hierarchy as well, so I'm trying
to avoid more.

For example:

- It may actually make more sense to revocable.rs in kernel::sync.
- device_id.rs and devres.rs may be better in kernel::device?
- maybe we should create a kernel::bus and put auxiliary.rs, faux.rs,
  pci.rs and platform.rs into it?
- cpumask.rs could be in kernel::cpu?

Regards,
Boqun

> By the way, should Gustavo and -media be Cc'd?
> 
> Thanks!
> 
> Cheers,
> Miguel
