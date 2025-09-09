Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BBBB4A05B
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 05:51:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA82910E3E5;
	Tue,  9 Sep 2025 03:51:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Jqh2Ncv6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E63310E3E5
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 03:51:10 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-817f23fea68so87316485a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 20:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757389869; x=1757994669; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xGykBRkJkYobDp8XrDylU0djV3QXn+TetZuMKoF+CSA=;
 b=Jqh2Ncv6ooN768aZT7WSet7HoRu+xpYY3csbVSkNbNN5H+8aP29YJy6a13oXHUlPft
 gaj7W+EtI91tLsAFRsQ1mqEGmDAwJGYKY36NDhU/A+eNb/W04LG/oYsiETMNeLp837o5
 eGrIBY0hii8mpEus5j1g+/ZnTHUicBBOwGMlW+ibSEVuEwmxRu1lgSTs1pQsIhK7iVVO
 mja+aUzNxZJjPFqQJVyTGzzt+Nf5YxwcMnOfrW/UlYLCMqHjZw/nrmABwtpa6/S4QC/y
 5yCtpDtlaWmZ4cFfa57AvlnWTGXitPefvY6I9PM87zfL/qCtgaBe+YbeEwswji79tMVr
 VmJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757389869; x=1757994669;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xGykBRkJkYobDp8XrDylU0djV3QXn+TetZuMKoF+CSA=;
 b=nC3vModVtwq/VljI0UQdPLX1uEIZixfk8WqXME4d4JnRs3AAyCnimMhckwfP6MRkhN
 bzutLeyVh3ZT4KrMuB1am8X5RY5Cd9UwCcdaRbMhfA1zCT2F1hr2sE7csr6O8GFKcu5N
 +WGui5hai5WKjEZFkQtFkCC9079/nngIBGf7gZVvsGVbklZsPLjTb61ZF5NyFyZrOY3h
 LF32T9yYx7oq6K65J42R9IR06MfVtsb00dgQlJPHcn7bDm/hsYQKt9BbjPfYsTIVU9vo
 v4IINHxKRgJoNHpGV+wrI7pwiGxmPXMPh/lJ4Tq2Vh9VdbNdQPi/kfBAF7+m+jZcXyhN
 hkuw==
X-Gm-Message-State: AOJu0YwJm76qzEs9/XiurDfdZcworjVZAs2h1bM40711c+Msq2sRh68F
 BtKdCKav+/iotCkGH4dhKbQ8eX5pa3GJ7SBGjfdiltQbRjfBHxRaGhd6
X-Gm-Gg: ASbGnctnlbkdFnmMeHyqOl6xBDGHuoKg8L4ueUVFzzUhxirTwYDwABM1W7eflxRiGRo
 Sz4q1vWqDPUFpxA2AWN5dXTMJquqmd1SL4wyj/SNgkW9kLL20yjAfOn5xG2WgbYPF8hE+27wLcJ
 AeVOfa/q4n6CmcdaX6jSuD2o/f23uA6lt1p4+5pL1xLbY7Q6j4BZYsxTAP3+6H8eE6NQxtRp67V
 1cDIy5R5KOnT7XtZfKlW/P6Ei9rGlxw9Yc7mh9Prk1UMWe1alAUP2gjOzr++NrkAptRpim6Mjc+
 Yvs/kf1WYHGyPvUv4s3TyZbPxAsWgEna4zjY8qwRPr8auWrVXFT2/vA9IAqT+GuvL8bXofQfA+x
 Hnss8J/Q950hz9i5am32Vlf9y9NwLyIKDS33DDaTrfJElzQc5JQF9ouRslz3rlB3P6TIS3AMM75
 ge9wny4+NByRQVPBoIc/6w3rk=
X-Google-Smtp-Source: AGHT+IEOhdsMCjgB3JtWmDWWkLH/LAXbv7jCe+u+cwtMRli1g2oWTOkrPyuc6EqENHSVSnXxKLI1vA==
X-Received: by 2002:a05:620a:aa0e:b0:814:fa5c:c5c with SMTP id
 af79cd13be357-814fa5c0f7bmr951533885a.70.1757389869483; 
 Mon, 08 Sep 2025 20:51:09 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com
 (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-81b598cf901sm56891185a.23.2025.09.08.20.51.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 20:51:09 -0700 (PDT)
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
 by mailfauth.phl.internal (Postfix) with ESMTP id 5B8E2F40066;
 Mon,  8 Sep 2025 23:51:08 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-09.internal (MEProxy); Mon, 08 Sep 2025 23:51:08 -0400
X-ME-Sender: <xms:LKS_aFOZbRPDNsWlNYxlSo4Ppzf3kzhev6OS46idRHsNjXFsRDqqyQ>
 <xme:LKS_aAzoqI5eBrOLSi5jujRWT4FqJqOCce7vnqhGe4x4vjmsknw5v6MTP6y9JT_SN
 f_YhCpGD0gwBgPQtA>
X-ME-Received: <xmr:LKS_aFlGR28orB4D0KSX1kI29YSKgcdOe40ewQuuqRL9fuAsaFA-w1HSw0AwdpjwJYhKJNEEIbbUUNYSOr2uy2g1eY-U7v9R>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduleefkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
 vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
 hrnhephedugfduffffteeutddvheeuveelvdfhleelieevtdeguefhgeeuveeiudffiedv
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqh
 hunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddu
 jeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvg
 drnhgrmhgvpdhnsggprhgtphhtthhopedvuddpmhhouggvpehsmhhtphhouhhtpdhrtghp
 thhtoheplhihuhguvgesrhgvughhrghtrdgtohhmpdhrtghpthhtohepughrihdquggvvh
 gvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehlihhn
 uhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehruh
 hsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthho
 pehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpd
 hrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthii
 ihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmh
 grihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthh
X-ME-Proxy: <xmx:LKS_aG_uxw3CVOc7srjkumEPiG8dKo2rUHJ2LuOqw4omD5BWDbCcwg>
 <xmx:LKS_aBPnZzmi4v5FgoRxZsf91YAtN4mx2FHtzFK4a8mU_mjTkAv5cA>
 <xmx:LKS_aI8SgpDdQkRFJ79ytWCvIY6RIS2czsAu9E6Cr1oDMQXZien9Iw>
 <xmx:LKS_aBIoT50ClmK-k3NqinTmS6o4F3M6ynGCXBvjPiYSirqXCJVyEg>
 <xmx:LKS_aDd_CnpmO_CT6koJpB5vI-aT8s7c0rfFoHQy5aTKUzvKfFCYGBON>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 8 Sep 2025 23:51:07 -0400 (EDT)
Date: Mon, 8 Sep 2025 20:51:06 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Asahi Lina <lina+kernel@asahilina.net>
Subject: Re: [PATCH 1/2] Partially revert "rust: drm: gem: Implement
 AlwaysRefCounted for all gem objects automatically"
Message-ID: <aL-kKkJ14pIqhMJh@tardis-2.local>
References: <20250908220657.165715-1-lyude@redhat.com>
 <20250908220657.165715-2-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908220657.165715-2-lyude@redhat.com>
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

Hi Lyude,

On Mon, Sep 08, 2025 at 06:04:44PM -0400, Lyude Paul wrote:
> I made a very silly mistake with this commit that managed to slip by
> because I forgot to mzke sure rvkms was rebased before testing my work last
> - we can't do blanket implementations like this due to rust's orphan rule.
> 

In general, I would avoid using "I did something" to describe the issue
of a previous commit in the commit log of a patch, it's less objective
IMO. Could you reword this a bit? Maybe more focus on why a blanket
implementation is problematic.

Thanks!

Regards,
Boqun

> The code -does- build just fine right now, but it doesn't with the ongoing
> bindings for gem shmem. So, just revert this and we'll introduce a macro
> for implementing AlwaysRefCounted individually for each type of gem
> implementation.
> 
> Note that we leave the IntoGEMObject since it is true that all gem objects
> are refcounted, so any implementations that are added should be
> implementing AlwaysRefCounted anyhow.
> 
> This reverts commit 38cb08c3fcd3f3b1d0225dcec8ae50fab5751549.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
[...]
