Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 975B999C429
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 10:54:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D81410E3D7;
	Mon, 14 Oct 2024 08:54:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="VluBzpl4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DB2310E3DC
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 08:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1728896062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AAPK65oHQu3J50zOzXdJ8U1r5A0VvZcKfNK05jHZJ2c=;
 b=VluBzpl49aoyba/l6gk/2Cb2icpm2DGx6ahbcdS7oZdz8RCAuxw5FFeXcfhOoxAGiSOBfi
 RiOvpiTpO/fZw634HKHdGS2jTLDJ9CGUsRMOWF7DkD1Xtxn2yyupjweleJuZLTcxI5j3t+
 Pw3h5YnF5rZtp6VXG/90nXx99JDDkQc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-568-X4UzAtoLMTqeMTJ3ZC3MdQ-1; Mon, 14 Oct 2024 04:54:21 -0400
X-MC-Unique: X4UzAtoLMTqeMTJ3ZC3MdQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-431285dd196so11063255e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 01:54:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728896060; x=1729500860;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AAPK65oHQu3J50zOzXdJ8U1r5A0VvZcKfNK05jHZJ2c=;
 b=RwE25qQFrYwBtKHr09S/FunnIJ4mA3izovWeU3R7emuN1rAfVEylJggMK9mfpS1OT9
 cW5s/5K6lkRkTKs6j+x3qDPL7vXzyzAXFEPnyLXVZ5ZYJddxiwwV1ppL8rKq7MBIsA5G
 Pf1nmhdgU7j66iiHT7t8ROqEOAsAA2nAP89UTZ/IrL7Fdv/JJkOhKNVUSgmEfKx0RaH5
 nhURmsMHMb1Dg9jNJfmV2jUO9GqKT6PeqI782c2f6rJCHaTTqesMQ3HLjoKUUrq/iNu9
 /s9sWtIisAxtIIzpDgcy4o/sTrMMd+rLmqyo19arab3ejp7AZ2IDR0zvrVcRZxQA65rI
 kk1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4mbl7mbnh4MwJT8pcKQvllmH/uyvwXtHMxoDdf3XRetN/ePqBzo/VEAyzyVVUB5o+rl/4lbuE+jk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxe/knApDr5US3MZYp7HX9N9rcYE9S0kNj8RX+4E2mhvXEVBrjx
 OEACDNNECn2W5GR3bBKhBK3fQQh/3m6ZMMnRHpZAXuFa5HDT81kG/lcc9McTmy0Racn3+574q/+
 4btTdxKym/8DBw2pZ1ovqtelEbVT0CpjwPFYWytk8UWAdQXsbHBB5VNfcflKqRlNq/w==
X-Received: by 2002:a05:600c:190d:b0:430:53f6:f20b with SMTP id
 5b1f17b1804b1-4311df56f1amr97191965e9.23.1728896060175; 
 Mon, 14 Oct 2024 01:54:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEo+wwhLLKeEcT9mtsJSQ+F8zv3iqBMb6ip3yhfZKGYz75i1oN0Ri8sKd/qmDLPCYq8GV+9Q==
X-Received: by 2002:a05:600c:190d:b0:430:53f6:f20b with SMTP id
 5b1f17b1804b1-4311df56f1amr97191725e9.23.1728896059688; 
 Mon, 14 Oct 2024 01:54:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-430ccf45df4sm146139445e9.13.2024.10.14.01.54.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Oct 2024 01:54:19 -0700 (PDT)
Message-ID: <13f6f904-bd2c-4b0a-914e-0715d22a7ff5@redhat.com>
Date: Mon, 14 Oct 2024 10:54:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] drm/panic: allow verbose boolean for clarity
To: =?UTF-8?Q?Thomas_B=C3=B6hler?= <witcher@wiredspace.de>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241012075312.16342-1-witcher@wiredspace.de>
 <20241012075312.16342-6-witcher@wiredspace.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20241012075312.16342-6-witcher@wiredspace.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 12/10/2024 09:52, Thomas Böhler wrote:
> Clippy complains about a non-minimal boolean expression with
> `nonminimal_bool`:
> 
>      error: this boolean expression can be simplified
>         --> drivers/gpu/drm/drm_panic_qr.rs:722:9
>          |
>      722 |         (x < 8 && y < 8) || (x < 8 && y >= end) || (x >= end && y < 8)
>          |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>          |
>          = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#nonminimal_bool
>          = note: `-D clippy::nonminimal-bool` implied by `-D warnings`
>          = help: to override `-D warnings` add `#[allow(clippy::nonminimal_bool)]`
>      help: try
>          |
>      722 |         !(x >= 8 || y >= 8 && y < end) || (x >= end && y < 8)
>          |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>      722 |         (y >= end || y < 8) && x < 8 || (x >= end && y < 8)
>          |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> While this can be useful in a lot of cases, it isn't here because the
> line expresses clearly what the intention is. Simplifying the expression
> means losing clarity, so opt-out of this lint for the offending line.

Thanks, I also prefer to keep the non-minimal boolean.

With the suggestions from Alice Ryhl to not introduce a return, and use 
expect:

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Reported-by: Miguel Ojeda <ojeda@kernel.org>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1123
> Signed-off-by: Thomas Böhler <witcher@wiredspace.de>
> ---
>   drivers/gpu/drm/drm_panic_qr.rs | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
> index 58c46f366f76..226107c02679 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -719,7 +719,8 @@ fn draw_finders(&mut self) {
>   
>       fn is_finder(&self, x: u8, y: u8) -> bool {
>           let end = self.width - 8;
> -        (x < 8 && y < 8) || (x < 8 && y >= end) || (x >= end && y < 8)
> +        #[allow(clippy::nonminimal_bool)]
> +        return (x < 8 && y < 8) || (x < 8 && y >= end) || (x >= end && y < 8);
>       }
>   
>       // Alignment pattern: 5x5 squares in a grid.

