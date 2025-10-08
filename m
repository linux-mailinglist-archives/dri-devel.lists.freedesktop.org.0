Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A36BC5DBB
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 17:49:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02EEF10E847;
	Wed,  8 Oct 2025 15:49:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="E/ysVkJ6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com
 [209.85.221.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0546F10E84B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 15:49:57 +0000 (UTC)
Received: by mail-vk1-f169.google.com with SMTP id
 71dfb90a1353d-554a627a257so790842e0c.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 08:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759938596; x=1760543396; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=posWhcO7uW0YnkFBpk/sI6hl5Osok5DPG0Lk6uuLAiY=;
 b=E/ysVkJ6PYV+F31rykG30SPINdTt8xV3oAtp6XZJiHlDiD8JFvZW9xxdF/7BiFx+4C
 TNbIEtpikA6zFEBTvPfaSZnwVpBSg29sYMrKIQlDRlfLxn2dUCgq2cWkHlBA1upgnZK/
 I7WH4ZrLo9Qzu30lct/T+1vw0WL+00DgIofsRh2XedejfkcQf0joe4W9WWzp99vr5Z6T
 xGP+yhvFgomRX08kTwglJYmD7CbWfUIUtElUATBfSOZodGL+0d6mMURIQnZVxSm++dhR
 r5Ct56TKXCksB2URh8vr05tQuCbZpkpCbU+PC+h18GRDoysToYUygxoI88sZosHI6enD
 Gg8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759938596; x=1760543396;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=posWhcO7uW0YnkFBpk/sI6hl5Osok5DPG0Lk6uuLAiY=;
 b=VFdadGSfEUMQyGfgBH/PlYrqLw4wwNRoHkFjq4l1r9bc84np0xuAdE18VnC24KPIH7
 ytTt8dOPArNCzKLlGod/PAmv34L0GjqJ9p5RWp+cl1vApQXrZD8qmjkwIfxjWxI0vo8F
 u3nunyQTzQ9fTaEONEvFJ15j/0Q4666/STQa1cipBLK4qpL5pA1WdX9KjhHiUirlK961
 szm3axyFVbWt7ZKWMfA2lzJHWLGyRxLMTkpQipBUtpDch1jN+o2DdM7ehYJl+bDVT1xa
 Klp74crgl5IkmxA7qqvMbKffHpE3q/jtcrqINMMIu00YLlyA1emR2cvkwvp6LwaG7nk6
 6KUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWw757A3toxdg5tBspiA/mtLi/HX+UsAUNhU6+23jJ3yFT2cVPlavhAfLonBRykKITiaccaLQ+Cnl0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxj643cWWCQcbUDe1xa5BIfViAB0LYvQybEfraL7sfjmiKkvJkL
 4BaMEFCYqbTh+6aQR2Upf/i2djpy5bKp4eSr/HUAXUvtjKUis+xorkN6
X-Gm-Gg: ASbGncsra9dJ7Pa+B7idSED3IZQpRSkh2aeC2H36y7o5S8mft0zaOEwoDRU4DwQW9Ft
 5wdFOfkJUbgc6TlWYftxccmg01hsLSFlwOQ/IQZ+IAwbfGppu9tpqXGnBiUX0p2K/OYW3xRcnjM
 o9YMbYayYtF3wVhMJiFezwFCSO8ZB3JHWs0XQNd0EU1L+P60DiyxlgUd5Pg/IAkOpRgnlcgeWPy
 b9frE4ZnoL8A+07g1lE08+czKDc7VzyeRq0tCIc3sJUGTtMouvWw5PG+yza2CqqNvHvRCabowjZ
 l7Po1f/X3wtgwwyjkP8YX81yIzoO2d9Vdf3osXujXGfFXFL+94CIDea3N9xp/HfsacJAMmjCV+9
 S+/Hp8Xeuv8iEhNmdX+mk1P0dNieUwJBe9+D2FRkWx7o=
X-Google-Smtp-Source: AGHT+IEJ9vfvjdDQtiPcrc3cIELW9OyuJZ/EAGgmwTi4uspcOFQieo0RXuDvRCYp8d25pdpbu0sCBg==
X-Received: by 2002:a05:6122:a0a:b0:539:1dbf:3148 with SMTP id
 71dfb90a1353d-554b8b3f3f8mr1700186e0c.2.1759938595679; 
 Wed, 08 Oct 2025 08:49:55 -0700 (PDT)
Received: from localhost ([12.22.141.131]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-55497ee3001sm2300503e0c.6.2025.10.08.08.49.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 08:49:55 -0700 (PDT)
Date: Wed, 8 Oct 2025 11:49:53 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dakr@kernel.org,
 Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
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
 Andrea Righi <arighi@nvidia.com>, nouveau@lists.freedesktop.org
Subject: Re: [PATCH v6 0/5] Introduce bitfield and move register macro to
 rust/kernel/
Message-ID: <aOaIIV8KDA0GjF6E@yury>
References: <20251003154748.1687160-1-joelagnelf@nvidia.com>
 <aORCwckUwZspBMfv@yury> <DDC0VAHL5OCP.DROT6CPKE5H5@nvidia.com>
 <aOU0joJQZiU61GBB@yury>
 <D421296D-FFF3-4998-B467-8E079AEB7499@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D421296D-FFF3-4998-B467-8E079AEB7499@collabora.com>
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

On Tue, Oct 07, 2025 at 06:41:58PM -0300, Daniel Almeida wrote:
> Hi,
> 
> First and foremost I’d like to say sorry for not having the bandwidth to
> chime in here earlier. I’ve been pretty consumed by Tyr itself lately.
> 
> > On 7 Oct 2025, at 12:41, Yury Norov <yury.norov@gmail.com> wrote:
> > 
> > On Tue, Oct 07, 2025 at 07:36:21PM +0900, Alexandre Courbot wrote:
> >> Hi Yuri,
> >> 
> >> On Tue Oct 7, 2025 at 7:29 AM JST, Yury Norov wrote:
> >> <snip>
> >>> Regardless, I don't think that this is the right path to move the
> >>> bitfields into the core. The natural path for a feature that has
> >>> been originally developed on driver side is to mature in there and
> >>> get merged to core libraries after a while. Resctrl from Intel is one
> >>> recent example.
> >>> 
> >>> With that said, I'm OK if you move the bitfields as a whole, like you
> >>> do in v5, and I'm also OK if you split out the part essential for nova
> >>> and take it into the driver. In that case the bitfields will stay in 
> >>> drivers and you'll be able to focus on the features that _you_ need,
> >>> not on generic considerations.
> >>> 
> >>> I'm not OK to move bitfields in their current (v6) incomplete form in
> >>> rust/kernel. We still have no solid understanding on the API and
> >>> implementation that we've been all agreed on.
> >> 
> >> Initially the plan was indeed to give this code some more time to mature
> >> in nova-core before moving it out.
> >> 
> >> The reason for the early move is that we have another driver (Tyr) who
> >> wants to start using the register macro. Without it, they would be left
> >> with the option of either reinventing the wheel, or poking at registers
> >> the old-fashioned way, which I think we can agree is not going to be any
> >> safer than the current macro. :)
> >> 
> 
> Tyr could use both register!() and bitfield!() today FYI. If you move it out, I can
> follow with an actual patch to do so.

Not sure I understand this. Does it mean that you have use cases
for bitfields unrelated to I/O registers? Can you please share
details on what you need and sketch some examples? Particularly,
do you have arrays of bitfields in mind?

If my understanding is correct, then I think the strategy that
meets your interests at best would be moving the registers out of
Nova earlier. After that both Tyr and Nova people will get equally
involved in bitfields (and possible BoundedInt) development.

This is what Danilo proposed in the other email, and I agree that it's
the most structured path.

Regarding timeline, I think 2-stage approach will eventually become
faster.

Thanks,
Yury
