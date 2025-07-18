Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A72B0AA82
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 21:05:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22B6910E010;
	Fri, 18 Jul 2025 19:05:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GoY/AiUp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31B0210E197;
 Fri, 18 Jul 2025 19:05:08 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id
 af79cd13be357-7e3142e58cfso148334485a.0; 
 Fri, 18 Jul 2025 12:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752865507; x=1753470307; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5j79F8WX6g4zI7dhSEPRiOOy0m3FlFhAAbp2BrZjtaQ=;
 b=GoY/AiUpqxPVc93alt6gnu9yWkCLhTNL/jCwq9jK3r566vD+9XKsAmqgMPCdSqdh+x
 oFsaT/xtXwm7rkNy7EzlmryE7JnK8nX79KNqruA+sqkH19z2gjT9/iZrAzrH3VbknK1c
 B8QdTzAr15r+lsqAn+xnU88MTvIIVEPcDy6owDu54T6eSuSpTEBbRdzY94CbZSozxIyv
 TbwPfIBLzn8i0EvKG9MIsTJ4brADRO9+iwY4hXCwlUGW+GKkT3NiFlNgORnRrmg6HD0r
 pwqdNDdFBpgX8wTiSTV+pTB9SzBYmNjcNXxVbwxtekLSdChpilreky5idQ9MvOKON9Rk
 SvTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752865507; x=1753470307;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5j79F8WX6g4zI7dhSEPRiOOy0m3FlFhAAbp2BrZjtaQ=;
 b=vNb6z8tqO4t/z1c7nvvZAzjbJHg68u1vuQWq+ihiK51lNvuu4gepMmKrMfXxdoJwrs
 Z5PvY70ITCnIvqHQWzZfzyF4ORNtm0vkpmsFdUWXnILifmkddroz9J/1IMPSHyj3ZvTm
 ujKN0+hQ5euetn7bj63qhpQfv0AFTdnzBAlIjE62fqZdRTa6mxRZB25gLLb8ppWkYTrp
 mBRegdH4j3pBBGjFL9r8jFvEPAjRa5hNNiTGliYW1dhQHcDgEK7bkF9GedH9VJDwtThP
 u6NcNLGtsxyT0t5+P+FUEhTUDm/VIR17lXPYxTHbOo38f82tl3f0bIb5k+5LC/dUn5CS
 fojA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqnjuVhIArd47HThcmGp9vRxPtLPmQoRF4cQGhYe1PL1UU7UJgj2WR8f8tiM2pz5zJZBTAw/ghNjw=@lists.freedesktop.org,
 AJvYcCXisI6KmvvWADICCO6cvd1ukeg/esdCGC4o3AUjCGlFgkmqckHmRq7/HSRoiuerR9dN2nUzkjKzTg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+iGt7sOGvGUbZ5N2jzpMnUDXF9gebY4aE955T7iTUGkq01YMv
 RagGlHpyELuC6zuUuIfYKWl6UQTJ1pqTYwbrfezkW1pF/u0wkg84sYKy
X-Gm-Gg: ASbGncuGy4CpJ8veNvA1QLsN665GWb6LH/O83SBeBeSFTCyPlU9/EvgdPjQsu1EyU7y
 u8x6r81aEvmsdEwIFjNPIkCnE7HuJ7DYJWQX84ZHpEt0wfrK09R4e4VlclSsR7n3crG3dOiXLYG
 mozkR+mZoXPIv811/kaAnbKIptkuQB46uwreUYLWGENCFb3xqWDSLVKBWSFO2nh8mrGbB8ecnTC
 aOTHIkg2OZPg3HL5Pe6LwQM3JQDE3Vk+mO/+Mj4DaOdGCbfKBj29I5nfHAj/parKDjdsJmwMa8N
 BvynLPfbgl7YC64ZiW4Qzl8qRT+rXOznPgEJJTQBnh6c/02I68BnrxGzLHdVjt31SUDC5a5BO/W
 XhbEg6eaJdkpO+WdbX6WLBRxmLepZQIJ9h/PMAlw/u1PZ0WIu49U3Z+cz+DwUjzCx6Oi4gAwdLs
 rYjlW8WJb5DSoXoW5RiOLkX06kpBsiyT878g==
X-Google-Smtp-Source: AGHT+IHH/NifKTKz2dbR90WbWGGqf2VV3ZDVe1t3kE2kVXHFT8QLOk9feQkrf4IyGuzEzg2JakRnyA==
X-Received: by 2002:a05:620a:2811:b0:7e0:9977:a803 with SMTP id
 af79cd13be357-7e34363599dmr1583267185a.54.1752865506723; 
 Fri, 18 Jul 2025 12:05:06 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com
 (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e356b62e63sm120881285a.47.2025.07.18.12.05.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 12:05:05 -0700 (PDT)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal
 [10.202.2.48])
 by mailfauth.phl.internal (Postfix) with ESMTP id 3B879F40070;
 Fri, 18 Jul 2025 15:05:03 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-08.internal (MEProxy); Fri, 18 Jul 2025 15:05:03 -0400
X-ME-Sender: <xms:35p6aKs_0L9U1v9PEKDAHghrb8pBMTy6Y_CSJVs2sxTVoTEhmG7DLA>
 <xme:35p6aLRdSW2XmEFlD9KxPuMSpgDYq67TpE8rivNKbQkE9g74EEG_frD4xNPenvUGl
 2Fei3aKqk913i14VQ>
X-ME-Received: <xmr:35p6aMPBwwc2QfgaCuu05VCiZPH9ydnYVNS_PW32DK9zsQg9Vu3wS2k--Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeigedvgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
 vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
 hrnhephedugfduffffteeutddvheeuveelvdfhleelieevtdeguefhgeeuveeiudffiedv
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqh
 hunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddu
 jeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvg
 drnhgrmhgvpdhnsggprhgtphhtthhopedugedpmhhouggvpehsmhhtphhouhhtpdhrtghp
 thhtoheprggtohhurhgsohhtsehnvhhiughirgdrtghomhdprhgtphhtthhopegurghkrh
 eskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtgho
 mhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepmhgrrg
 hrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphht
 thhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtiihimhhmvg
 hrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtohepuggrnhhivghlrdgrlhhmvghiuggr
 segtohhllhgrsghorhgrrdgtohhmpdhrtghpthhtohepsggvrghtrgdrmhhitghhrghlsh
 hkrgesrghrmhdrtghomh
X-ME-Proxy: <xmx:35p6aB63XXyz8ju8xf2icVscA4L8vXiK6DrLQCcWzQsJgW3hZrYU2g>
 <xmx:35p6aPVevi0ooEtaSNsSsdGrEIwePW1wWUAKNqsrfQDxpeWaSX1OZw>
 <xmx:35p6aIP8HeSkU_tBsNcNzqWa9DUz1ZWFcxmvajorjI32IYqAaDLb2g>
 <xmx:35p6aGgF-Moe335sqLuvWFUTe7_TofctfCedLXnMpuZiXJu9Uckhcw>
 <xmx:35p6aO7HAIcMVeE7dESfP_QlvJHWJshyCbdI6rYJuOmvCkWz2WFBH-JW>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Jul 2025 15:05:02 -0400 (EDT)
Date: Fri, 18 Jul 2025 12:05:00 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Beata Michalska <beata.michalska@arm.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/19] gpu: nova-core: register: fix typo
Message-ID: <aHqa3HVUjIC7zHAr@tardis.local>
References: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
 <20250718-nova-regs-v2-2-7b6a762aa1cd@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718-nova-regs-v2-2-7b6a762aa1cd@nvidia.com>
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

On Fri, Jul 18, 2025 at 04:26:07PM +0900, Alexandre Courbot wrote:
> A space was missing between arguments in this invocation.
> 

It's obvious up to driver and Nova folks, but I feel this commit better
folded into another patch or we make the title a bit more clear, say:

gpu: nova-core: register: add the missing space in register!()

Otherwise my fear is we're going to end up with a few "fix typo" commits
in the future.

Anyway

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

Regards,
Boqun

> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/regs/macros.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
> index 864d1e83bed2979f5661e038f4c9fd87d33f69a7..93e9055d5ebd5f78ea534aafd44d884da0fce345 100644
> --- a/drivers/gpu/nova-core/regs/macros.rs
> +++ b/drivers/gpu/nova-core/regs/macros.rs
> @@ -116,7 +116,7 @@ macro_rules! register {
>      ) => {
>          register!(@common $name @ $offset $(, $comment)?);
>          register!(@field_accessors $name { $($fields)* });
> -        register!(@io$name @ + $offset);
> +        register!(@io $name @ + $offset);
>      };
>  
>      // Creates a alias register of relative offset register `alias` with its own fields.
> 
> -- 
> 2.50.1
> 
> 
