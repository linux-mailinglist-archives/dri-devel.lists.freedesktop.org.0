Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BF2AE6BC0
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 17:51:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 065D410E5E6;
	Tue, 24 Jun 2025 15:50:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gq+J1d5M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E6210E5E6
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 15:50:55 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id
 af79cd13be357-7d3f5796755so48464285a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 08:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750780254; x=1751385054; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rDR18IrgBtO5TS0RMZe4KQzn+MlNrwNw8bMyZk5uk0w=;
 b=gq+J1d5MS90lc6tlRpGtyuYE8lOWSG4oEa2mRvwsKb/v3Kt2MqmKBTJ5k+QBfPg09v
 GEm2x0/9z3ZdONetQQODBqto/fOyd/gLml3u5FDr34tJJugFdTJrWctKFg+eeZffa46j
 xl+r6A9VS+Xnx9YCUcURvI1QqD6FTbnasbqrlf97TEk71sHjrZkVt2IdOLBwfmOJe/hb
 srjMcgVABZl51gqCVaE3Q2dtodRY8z9kcUJSuIefBnZER+rXMA+d6J8F/HL6qOr+bTR0
 Dy+zHPwepEAw/SWSSoRE0rUbFjbg2RXR4sVc1KeKVI6jPJ4iDVabrBH/DkG1WKyl/h4d
 d+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750780254; x=1751385054;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rDR18IrgBtO5TS0RMZe4KQzn+MlNrwNw8bMyZk5uk0w=;
 b=l1Rw8btK1K7NnBPYiNmy/Lak2YMzFQxh1BwOrAN16FL70iuc2x8ZN7p31HZFSaqBmH
 Sr1p52iVVswcXeLNBc1giu4fvylsnSd9ceRCjoO8RzdkbrnT7k8pfagO1qavrQtMVas6
 Q/aod3BwwowAsgnPQyINub3eg71G4xJa5p396HDkeiTLbe8MCUP14Cq9S3rYuSxfyVhE
 jKfq2cdwycDSbKSwUEI1Q7B9J0MU6qq6XU/OOTwcnaG3+vLK+NgeAiOI3xckOTrDn7bi
 vTDsUQT1HreN0QSxVtqH7B8mkKLx1dY9JQHWwmkS8CvRw2BgsfdDBNSpYshCHt4VDMZj
 MuMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAeNyXtqozZgZ/J/FSE+l70oNvMXTL6hqq3zbm6TM6X6Jaglz9Dx+uC1FdPjfQ9xgSlBAly//IUK8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyy5hMnNFzTlje02ZBcMBeqRo9hO+PT9R50WKzb6bq77fBNzoYO
 XCurjWtShI3MU/+tkhNlod4XaToggul02DGSKkq75iitnkZiRuXJzyUp
X-Gm-Gg: ASbGnctrFlgrbvjYHUVUGeHBczEx0/G8NRx6x0wmImAfVZcArQhQ6nI1tVfZrJc+ndC
 AXms2f+simxOgTxIB77FszFDl1CKexxxE4t8QW9geYe2KpisCQ0yZkjCKIFailft72I4Ngguoxw
 HhpUf/V4h4G9Q2ShhU5iJNZ+KBcq7k1lSpQKiganiR22pO2ntCQ99hlThbhQwBIGiwF4Zz9lEcP
 sGMzJJTqD9Zob6Sru0Ns+TSfFjr2Rn4ot3vwDfQpGgjXTEie3MvLLT3mYZgX1vlY0CotoIWjD1o
 gjYHubFrJMsEr/q1K0EmrmQZLovr0uj2pcZpUxdn0OrDU7VwS8JA8qJAEM2KqOD8PwkNk2UVJ6Y
 6jVG6THS98dgQy33T83bt73JIJ3WEMOV8CZLxcUecEbD4KjKyBtpu
X-Google-Smtp-Source: AGHT+IFSr/qTOXafKTj+NvpW/Gjb5c10LaPSJ3957VJkh5+DYtNOSMgLq0V6H1bLfcrQepQewUFBmA==
X-Received: by 2002:a05:620a:2699:b0:7d4:de4:a7cb with SMTP id
 af79cd13be357-7d428c9f7fcmr15258785a.16.1750780254306; 
 Tue, 24 Jun 2025 08:50:54 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com
 (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7d3f9a0727bsm513818385a.108.2025.06.24.08.50.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jun 2025 08:50:53 -0700 (PDT)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfauth.phl.internal (Postfix) with ESMTP id 33CED1200043;
 Tue, 24 Jun 2025 11:50:53 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-11.internal (MEProxy); Tue, 24 Jun 2025 11:50:53 -0400
X-ME-Sender: <xms:XclaaEqoYkJ0tfWVrlshbCkEozM8GTyWDFmnVV5lAI2-DSnu2jtsVw>
 <xme:XclaaKo_Yn9ozhYPT7zKyvzSUcYoSfyjBQ146x9qUcg6oRE5sLpOjJdhxGWnWZ5ZN
 CGORsKIGXo4inkqVg>
X-ME-Received: <xmr:XclaaJMvIJYAbMQW0B2TJuyw7uI2pofH_ggQAdNpiaP18skXejWuCBprOg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvtddvlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
 vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
 hrnhephedugfduffffteeutddvheeuveelvdfhleelieevtdeguefhgeeuveeiudffiedv
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqh
 hunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddu
 jeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvg
 drnhgrmhgvpdhnsggprhgtphhtthhopedujedpmhhouggvpehsmhhtphhouhhtpdhrtghp
 thhtoheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepmhgrrg
 hrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphht
 thhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtiihimhhmvg
 hrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdr
 tghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepoh
 hjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdr
 ohhrghdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvth
X-ME-Proxy: <xmx:XclaaL6_2XBaLpF35rjNnwBwDCT2oXNskgG-EyGND7fKpNXpKfP63w>
 <xmx:XclaaD4cZ3JuKmvXt3KFhyLa7hUw5E4LgyWP7Yawz3vvw2MTg8-JUw>
 <xmx:XclaaLhWVafqbMmSCcVSMyfX1yW8R-yuf0ejqHhJa8TLaw8uqFmO9g>
 <xmx:XclaaN7NfN9SnkOW5g6IJqUNFXRI6hZxRH0o4MrKOAsJ5Q5Gc5uQ-w>
 <xmx:XclaaGLocZ4woJHHb2yoZgdfYcgbXaZEjxz7CTN2k-OJxp71YcVwVvso>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Jun 2025 11:50:52 -0400 (EDT)
Date: Tue, 24 Jun 2025 08:50:51 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Add Opaque::cast_from
Message-ID: <aFrJW31m8anUpnJ2@Mac.home>
References: <20250624-opaque-from-raw-v2-0-e4da40bdc59c@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624-opaque-from-raw-v2-0-e4da40bdc59c@google.com>
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

On Tue, Jun 24, 2025 at 03:27:54PM +0000, Alice Ryhl wrote:
> Since commit b20fbbc08a36 ("rust: check type of `$ptr` in
> `container_of!`") we have enforced that the field pointer passed to
> container_of! must match the declared field. This caused mismatches when
> using a pointer to bindings::x for fields of type Opaque<bindings::x>.
> 
> This situation encourages the user to simply pass field.cast() to the
> container_of! macro, but this is not great because you might
> accidentally pass a *mut bindings::y when the field type is
> Opaque<bindings::x>, which would be wrong.
> 
> To help catch this kind of mistake, add a new Opaque::cast_from that
> wraps a raw pointer in Opaque without changing the inner type. Also
> rename raw_get() to cast_into() for naming consistency.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Acked-by: Boqun Feng <boqun.feng@gmail.com>

Thanks!

Regards,
Boqun
