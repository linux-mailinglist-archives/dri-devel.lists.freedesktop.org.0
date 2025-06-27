Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D8DAEC2D8
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jun 2025 00:56:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3696E10EA90;
	Fri, 27 Jun 2025 22:56:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="k5M0k68k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E26910EA90
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 22:56:42 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-7d412988b14so267748185a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 15:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751065002; x=1751669802; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iDoIoBHK7rn8NNEmc8cLOtE3R2Edk/u3sKpTOmNcF9M=;
 b=k5M0k68k8DNai94giV2x99n7SYAOny2lA3wFOmWonfMebBYu4WZjWwt8jFsJHtEJwq
 ILDbbOc158tw5EJdyrbC/UzhrBvFtt0ucbEs/vnGePAEdmJ6t9FTtKDK8/ch5MMFCl9j
 WCbeNSdxvjFbeDUhI9YYaVwLtiYVj9HztzXI+Yh3RPCfArMTTfvYcqbQTBk4uwHwyqQs
 KD/CsLX4zEcWI9fCxOioLcN5UDOTS6t+rn1nKpGK8f6EXwn8tyXHUnxQchNuKqoRRqu5
 0wNPzmYp82b7mkQMrq+ly9LXrXdtdMgZNRK/ZordQPjUlJo7BQ/8Ft25A0BegF88tj+J
 /Kdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751065002; x=1751669802;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iDoIoBHK7rn8NNEmc8cLOtE3R2Edk/u3sKpTOmNcF9M=;
 b=dF/8IpEjGCyRA8G6E13cJjq6mO4LtJsKjdL8StIwbiCmqrSr3KHhJeTu0WiPUQrCrd
 wUZYSV8OXeaFJQOAJVCSMnpxkxgRaaiH3NFjL4JnooFKZyvAoJSk7KgVLyO94UHMPRCS
 uQSIbtDGisIHPV3UBcuhat13zFNtzcDwvPDZiZ9vudGxr9hfz0vN2/KO5ByMUFKdWQHT
 vrebcdYUMkvTKNJuPNtX5WuFYoWwRrgJqwmFLsa+arWtVoI//VY+4o0v2vN4sRBBPJhV
 JUqKFQEKwqABMSYXyURChULonicy0EFs/XlIs+JfmHyt/r9p7Et40nNmLsYQLeoVtJVI
 NHdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWE3oxXjWnC/MpMgoisSri3lYqM8USYXCd8S4gDZj5RhjJ65IbFJRQSqUxscI3bnpy2dwrP1B859Jo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxpgQ3IpTnOuYSC6UBE5+lY3r0MH7shjl59kgWUqM6p8yschw9V
 jJj7bFsxT431zqkksp6mJSu9IHfgETSHmZYx3gyh1TbVaBCaBMSqO8D5
X-Gm-Gg: ASbGnct7r/7twDHv/DMIJQC/+I8Eg1M7YHiTlxgaTJfo/+Y6i8briOlXuDO+7LOWMe8
 U57E8/+qxiB8gAE/iRJ9/V6QLGxteuvYOp6y1rjyQe4KKqLomwkQ0eMD2AcKJAefRFvsl4dNf72
 kKFepzGNTmNa1lPQnfIHqKcigehlxWydiujfC3nmA3Z7wQ0qfsbDVnb0QvWeQryUSzuXhmFzLAZ
 MEzpoJI+SPbLgp4Hj4ybZeoQmmL8MX0zaIu3zN/5iMJKlfxP122Y12QnvCmT5wZboEusyxQTA2M
 Jk7IBOH/AWRn6O+BELB2WSJ20NDRayvkQb+vF4fHnCRuCm/+mdGaEFHBmhp0U5A7n1zelxOQSR9
 oBCcZ1CU5lnpwOhEzgo9bInSKyijGCJoHq7HXBheF9NZ1mt0qGEDj
X-Google-Smtp-Source: AGHT+IFCU9MSnpICIKm+jetw5cPBjIgYpEzSNVMlwUJfw80d7drV1D18juGzglx+pCiPFa+ffk/mFw==
X-Received: by 2002:a05:6214:43c8:b0:6e8:fbb7:6764 with SMTP id
 6a1803df08f44-700131c3c5emr86130976d6.45.1751065001802; 
 Fri, 27 Jun 2025 15:56:41 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com
 (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6fd772e45b1sm28095476d6.69.2025.06.27.15.56.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jun 2025 15:56:41 -0700 (PDT)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal
 [10.202.2.44])
 by mailfauth.phl.internal (Postfix) with ESMTP id C069AF40066;
 Fri, 27 Jun 2025 18:56:40 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-04.internal (MEProxy); Fri, 27 Jun 2025 18:56:40 -0400
X-ME-Sender: <xms:qCFfaDXcj823Tc-8ZF5Jys9FLLrEkchqmo14rSPBgbUB7j-Gl9ZOrQ>
 <xme:qCFfaLl86gQ94x3dMygc0JsAAFxXy12juYnZ7EWVoBsW7NjtLUpCvh2zh187NUPfJ
 x3b5m_StXigEhxv4Q>
X-ME-Received: <xmr:qCFfaPao0SNxWwmU98n5t35zfk3oDs19U8LyX6-N0emJaIXszsGZ_JGi4v2BUg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
 epfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcuhfgv
 nhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtthgvrh
 hnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueevieduffeivden
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquh
 hnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudej
 jeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrd
 hnrghmvgdpnhgspghrtghpthhtohepvdejpdhmohguvgepshhmthhpohhuthdprhgtphht
 thhopegurghnihgvlhdrrghlmhgvihgurgestgholhhlrggsohhrrgdrtghomhdprhgtph
 htthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgt
 ohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
 epthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggu
 sehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprh
 gtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgidr
 ghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrrhihsehgrghrhihguh
 hordhnvght
X-ME-Proxy: <xmx:qCFfaOVgvfnuri2a5V2w4IbqVqnr044KMguTSOirQCKCI5dj1HPzzA>
 <xmx:qCFfaNnDD6By1AnwE0SCj7DpGWlZ5eoV_YOPuGG2CEVRLYHYVCFxOQ>
 <xmx:qCFfaLf1nYsqF1_kvTmlr56PekgW9-9RiCEeE-sf22HXE6ABbQRFRA>
 <xmx:qCFfaHGaVQZk3Pv01x3ZDx2qiCM8kZF0hQ9dyjh5vn8dRG1usE16Hg>
 <xmx:qCFfaPkUEQJcbn2Je1iX-1ydBDVHrUFhgfIbKGOCFEFDnkBWXTIcCHIQ>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Jun 2025 18:56:40 -0400 (EDT)
Date: Fri, 27 Jun 2025 15:56:39 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Daniel Stone <daniels@collabora.com>, Rob Herring <robh@kernel.org>,
 Alice Ryhl <alice.ryhl@google.com>,
 Beata Michalska <beata.michalska@arm.com>,
 Carsten Haitzler <carsten.haitzler@foss.arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Ashley Smith <ashley.smith@collabora.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH] Introduce Tyr
Message-ID: <aF8hp5-e5LrHTWfT@tardis.local>
References: <20250627-tyr-v1-1-cb5f4c6ced46@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-tyr-v1-1-cb5f4c6ced46@collabora.com>
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

On Fri, Jun 27, 2025 at 07:34:04PM -0300, Daniel Almeida wrote:
[...]
> +#[pin_data]
> +pub(crate) struct TyrData {
> +    pub(crate) pdev: ARef<platform::Device>,
> +
> +    #[pin]
> +    clks: Mutex<Clocks>,
> +
> +    #[pin]
> +    regulators: Mutex<Regulators>,
> +
> +    // Some inforation on the GPU. This is mainly queried by userspace (mesa).
> +    pub(crate) gpu_info: GpuInfo,
> +}
> +
> +unsafe impl Send for TyrData {}
> +unsafe impl Sync for TyrData {}

I think you better just mark Clk (which is just a refcount to `struct
clk`) and Regulator `Send` and `Sync`?

Then `TyrData` will be `Send` and `Sync` automatically. And the total
number of `unsafe` in this patch goes down to 1.

Regards,
Boqun

> +
[...]
> +// This can be queried by userspace to get information about the GPU.
> +#[repr(C)]
> +pub(crate) struct GpuInfo {
> +    pub(crate) gpu_id: u32,
> +    pub(crate) csf_id: u32,
> +    pub(crate) gpu_rev: u32,
> +    pub(crate) core_features: u32,
> +    pub(crate) l2_features: u32,
> +    pub(crate) tiler_features: u32,
> +    pub(crate) mem_features: u32,
> +    pub(crate) mmu_features: u32,
> +    pub(crate) thread_features: u32,
> +    pub(crate) max_threads: u32,
> +    pub(crate) thread_max_workgroup_size: u32,
> +    pub(crate) thread_max_barrier_size: u32,
> +    pub(crate) coherency_features: u32,
> +    pub(crate) texture_features: [u32; 4],
> +    pub(crate) as_present: u32,
> +    pub(crate) shader_present: u64,
> +    pub(crate) tiler_present: u64,
> +    pub(crate) l2_present: u64,
> +}
> +
[...]
