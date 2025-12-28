Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65237CE4A80
	for <lists+dri-devel@lfdr.de>; Sun, 28 Dec 2025 10:34:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66B5C10E091;
	Sun, 28 Dec 2025 09:34:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="tmFIC89h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0EB210E091
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 09:34:25 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-47d3c9b8c56so34867005e9.0
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 01:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1766914464; x=1767519264;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=SyDoBKLlFDm6X7YvWEPRli00m3Js5BcrRAsHwDYOeh8=;
 b=tmFIC89hG0QQbVOn26zJRdcTKqUUCFQBI0Yo/qtboEba33x9WoEijnhpDlfRDpStfQ
 3tpwsvGB+ZqCqoYIb4i2PXyh9QVcbj3kAbt5CN8g10cKRV8az4M1faUnhuWG428YVtg/
 tFYCcVWZz+AbyukqZDH0FdDBwGSQgtpdFTeu9LhtjYWCCK14fek/2x+d39iitCvJOdOO
 No5kxbUoiqKWrHT9j3hSkRpL8AgfwH5LfZleHNkinEHTFhbcqBV4Lm1BAHIHD7AnsH+r
 ItMCWYf38Xf/ToQGiYlsAq17ovHPWlHXZekP8nuVjea6Z8J2ijsH83elGv0Rrffo331p
 4ixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766914464; x=1767519264;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SyDoBKLlFDm6X7YvWEPRli00m3Js5BcrRAsHwDYOeh8=;
 b=fg2FC+nb6yOt6A+qQJOARPv244nOeCvOxH2tSmWjOuBYJT3NnncUMdaxhYLjKPi7JQ
 BUTA9RFOBewocmucJH2De3k50CnEkSBncraOzCA/8Zm/PMT8/0EG7/fBpfppkeidC3vN
 GtuHOxW0FsT/pHLfRnXpGCmXyfiUwfSx3GIz/HWVBNb6IF+iuTqQR5dr724O19gfLiSX
 9GQHbM5ljBNW0qS/qWUdQpBx5oIcrZyf9ysPAWEztEDJATs5cq7L5FWIAfHd6eFUq9+z
 2mvfRAWVBIhP/yRa23CcSQ0/LpxJAAlSG6MMtZaiMeSPBrDTGqBDDrdsvasTTDI6XmsR
 xWnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJ3XBWNQ/f2rvrbHmpyC8bUfTYj39C30ZedJ+5Opj8cfymY4ZFDcC0xM1ExoMDczFyAIHwYQ7FlXw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwkRTJIubIHWsqPSebzdMiGjVDopVOU90MJQXN/79RzmhPNqPi6
 1Gl0S9qCl14ZSSn86ML/XySNlemM1nnmWitQzAvfdAGV9Cd7bIzPaaaVmzmgdHRPFyXJVUjkKAt
 +JrQPGCp7Mf6rsLuWIQ==
X-Google-Smtp-Source: AGHT+IHo7pCHMAblDTgfHFeEja9soRj4lOWXPk5g3V/fIQz7xk3TJoKa3VyvAsLqN/oKHDmyKURQ3hBGHwEaI0o=
X-Received: from wrbgv17.prod.google.com
 ([2002:a05:6000:4611:b0:430:f5d7:f015])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4711:b0:47a:9560:5944 with SMTP id
 5b1f17b1804b1-47d195c1a71mr339326945e9.34.1766914464172; 
 Sun, 28 Dec 2025 01:34:24 -0800 (PST)
Date: Sun, 28 Dec 2025 09:34:23 +0000
In-Reply-To: <20251226-drm-gem-safety-comment-v1-1-5ae56d8194b9@ik.me>
Mime-Version: 1.0
References: <20251226-drm-gem-safety-comment-v1-1-5ae56d8194b9@ik.me>
Message-ID: <aVD5n5taYlJuMGKM@google.com>
Subject: Re: [PATCH] rust: drm: Improve safety comment when using
 `Pin::into_inner_unchecked`
From: Alice Ryhl <aliceryhl@google.com>
To: ewan.chorynski@ik.me
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 "=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
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

Thanks for the patch!

On Fri, Dec 26, 2025 at 06:22:36PM +0100, Ewan Chorynski via B4 Relay wrote:
> From: Ewan Chorynski <ewan.chorynski@ik.me>
> 
> The safety requirements for `Pin::into_inner_unchecked` state that the
> returned pointer must be treated as pinned until it is dropped. Such a
> guarantee is provided by the `ARef` type. This patch improve the safety
> comment to to better reflect this.

typo: This patch improves
typo: word "to" is duplicated twice

> ---
> Signed-off-by: Ewan Chorynski <ewan.chorynski@ik.me>

The Signed-off-by needs to go above the --- line. Otherwise it's not
included in the commit message.

Alice
