Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E6299C434
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 10:55:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8884510E3DB;
	Mon, 14 Oct 2024 08:55:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HP2mzy2x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C90210E3DC
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 08:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1728896140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SZZV3eCjwH17+qwXquSijSlOfzm3AowdcidnwQs1e80=;
 b=HP2mzy2xtdMmOSnu8DmWxwda1zdVy7IHCbzxGvcWJ3fGf2eRBObNn0V8KKj6kjEdhIUxPV
 T4j1XU1kjnKx73yoqoWsOW+GeQ0Grcu+JhwItFSXI1bck2xDno2zPyKqgPuMpqGw37nMml
 KGuiOtW88aTXQoN+K8bHw7jiajXWUy0=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-175-xCOGLbb-NAGEp0CRD4oG_g-1; Mon, 14 Oct 2024 04:55:37 -0400
X-MC-Unique: xCOGLbb-NAGEp0CRD4oG_g-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-539e294566dso1805886e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 01:55:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728896136; x=1729500936;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SZZV3eCjwH17+qwXquSijSlOfzm3AowdcidnwQs1e80=;
 b=O974CHNwvhBSuEaHmDJVZqPC2/roCe8OQowqGRR1cySFPxl4C2pTGMhmLqgsnvINQR
 eA9l5xkhGu/lwMZbstDRUCi7LvTNlxTCEXngw5NjXtuDbUuYqDXrDtV5+uQIkLOpM0Z5
 d+mEAdMWs0mYs8EiMPjFTarpY42Im7HKXq8DRm4qRrKH/SW6Z1MmOOxY1KfIQpU7tKft
 +95WQygJX8lqie0e4pKPhRk/huybnxYTjFu04EQ2mhI0wYiTasx250qgf/kazn22APOf
 jr+W1NZwhBGcVGw2pwea+Fk8pl2w5MJpjXn7qVcwrzGLCy6ff0qPWYgbenClMsIFgUxf
 p/Jw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgOffZEmTsy4hgS+JE0N/gBuy96tLJIrX45jEaOWE8ZZ+MaJVAa2E2Ijh9FR0pkeQ3IMbsDZ7pxYk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzTtCro/c5dFDH0oXVpxwWPryIiiBMAVJCCuUMA9xF+E8XFdA+N
 lRBrVyfpGl43m26ceCL5V3qCdtImT8hQnSrbwpV8UIj6pkL6Hz6AMrsKpDUZBskurHIBkwixhq2
 a+66YOydEqBvTPJsmRhzoXe0PGQ9RHUk8Ov3wsrv5aa5oAUlHel8oxaCtm6OycSFdOQ==
X-Received: by 2002:a05:6512:3196:b0:539:89f7:3187 with SMTP id
 2adb3069b0e04-539da583db0mr4542266e87.47.1728896135547; 
 Mon, 14 Oct 2024 01:55:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsnAdyTUOwoRixLAd99Kcrm/Heu2DZ1kp3SFQWf3sDK6kM96X3+KpLcEanEEOaqVXM5IPHrw==
X-Received: by 2002:a05:6512:3196:b0:539:89f7:3187 with SMTP id
 2adb3069b0e04-539da583db0mr4542248e87.47.1728896135047; 
 Mon, 14 Oct 2024 01:55:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d4b9190f7sm10761253f8f.114.2024.10.14.01.55.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Oct 2024 01:55:34 -0700 (PDT)
Message-ID: <8d1c8667-e032-4d9f-bc8c-f12d71070a11@redhat.com>
Date: Mon, 14 Oct 2024 10:55:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] drm/panic: allow verbose version check
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
 <20241012075312.16342-7-witcher@wiredspace.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20241012075312.16342-7-witcher@wiredspace.de>
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
> Clippy warns about a reimplementation of `RangeInclusive::contains`:
> 
>      error: manual `!RangeInclusive::contains` implementation
>         --> drivers/gpu/drm/drm_panic_qr.rs:986:8
>          |
>      986 |     if version < 1 || version > 40 {
>          |        ^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: use: `!(1..=40).contains(&version)`
>          |
>          = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#manual_range_contains
>          = note: `-D clippy::manual-range-contains` implied by `-D warnings`
>          = help: to override `-D warnings` add `#[allow(clippy::manual_range_contains)]`
> 
> Ignore this and keep the current implementation as that makes it easier
> to read.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Reported-by: Miguel Ojeda <ojeda@kernel.org>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1123
> Signed-off-by: Thomas Böhler <witcher@wiredspace.de>
> ---
>   drivers/gpu/drm/drm_panic_qr.rs | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
> index 226107c02679..fe842466d8d6 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -981,6 +981,7 @@ fn draw_all(&mut self, data: impl Iterator<Item = u8>) {
>   /// * If `url_len` = 0, only removes 3 bytes for 1 binary segment.
>   #[no_mangle]
>   pub extern "C" fn drm_panic_qr_max_data_size(version: u8, url_len: usize) -> usize {
> +    #[allow(clippy::manual_range_contains)]
>       if version < 1 || version > 40 {
>           return 0;
>       }

