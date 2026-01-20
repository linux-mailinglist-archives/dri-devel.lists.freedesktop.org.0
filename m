Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E084D3C2FD
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 10:08:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F369C10E58E;
	Tue, 20 Jan 2026 09:08:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="gQsooCwx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 742D110E58E
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 09:08:39 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-47ee33324e8so29491635e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 01:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1768900118; x=1769504918;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=hC+s01KDFNFWTdtskG6IEXC5QH5+p0zo21rA3ZNq6wI=;
 b=gQsooCwx1z6S4vqo9GZ6pgnXKKWJnrnETu40IlE0NQ7DQD2MJrozZNH9XWFBBKaIvr
 sTujDFkU62oku4SFSDtwPexqKYu9QHqIxAWx50a6rEaLH2XJHd9EV2QbEUJs0t+GK/2l
 o+SWU7wUVycrWQQv/sGe7HZXUDOL29lLGvSOwSarnWDkqNsjmw2OsuhR7Kk2VM9oFbKd
 803EiPyCLep3rMw8cWLSa5lJrGMa6CaWkwamyTKO7fFqHr4Yfu9ah8tftiX/B/GeRUvV
 TPoOeeyftVo6dGa+CqRqXzRNWy1doGwUeFvvGi+gkgxGp9CYjrU/G0Zp+HssnJZkiMEk
 H7pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768900118; x=1769504918;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hC+s01KDFNFWTdtskG6IEXC5QH5+p0zo21rA3ZNq6wI=;
 b=doWZg0SgrXLyZkWHIPPXQO1YobYsQK3Yne2hrjfq/sSifC2wUSQLsBEPwwr6sdynyW
 AQtAY8HqLHC9EH5C8qPKuef1ttT5Q/C7rOyZpziHh85+30US5akyHc0PE5Q6jVmSLD1I
 8sfCP7ImSUQ2vgNNnsG+Lzws849P6QHamLsr/4I4DgxSsopKn4m42dTaSeI9Ui8l3cRr
 ftmkXTP1JxlQFB/suEFoddDyPLjnsTwPaFxVS7o4t+ryb7T+YYnY8OSTZytfUXTBn6DQ
 JGvoWzIKVzGZT4xugCaJ+m8i31Gs33pF9cIRlpSCgwi+DzlT7bRYHrOa22r/P7YUJm3U
 QRjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIhk0Q1KYZHcerjS9mInFG4J9wOd5NVvFabWnZJcItLa7i5XSLcNsLKgRggO/TYopc8iD+DnzKqgw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/06Uhyf6voYbf4N9I9ND2luQnJEF1pURQGvQxMayxELDKx5KE
 vC/L6mEhtA7iE1zZz+10EDlIPwB02iPJsAdZNbjkDVPydhqUyEllhxPLkEGn55IRKQcFmpm1VBK
 gHJlpGloN2RAUGezXAg==
X-Received: from wmpv22.prod.google.com ([2002:a05:600c:4d96:b0:47e:e722:72e4])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3e0e:b0:47a:80f8:82ab with SMTP id
 5b1f17b1804b1-4803e7e8592mr14178455e9.24.1768900117989; 
 Tue, 20 Jan 2026 01:08:37 -0800 (PST)
Date: Tue, 20 Jan 2026 09:08:37 +0000
In-Reply-To: <20260119070838.3219739-1-dirk.behme@de.bosch.com>
Mime-Version: 1.0
References: <20260119070838.3219739-1-dirk.behme@de.bosch.com>
Message-ID: <aW9GFf-Yc_r0_JMm@google.com>
Subject: Re: [PATCH] rust: drm: tyr: Fix register name in error print
From: Alice Ryhl <aliceryhl@google.com>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: rust-for-linux@vger.kernel.org, daniel.almeida@collabora.com, 
 dri-devel@lists.freedesktop.org, ojeda@kernel.org, boqun.feng@gmail.com, 
 gary@garyguo.net, a.hindborg@kernel.org, dakr@kernel.org
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

On Mon, Jan 19, 2026 at 08:08:38AM +0100, Dirk Behme wrote:
> The `..IRQ..` register is printed here. Not the `..INT..` one.
> Correct this.
> 
> Fixes: cf4fd52e3236 ("rust: drm: Introduce the Tyr driver for Arm Mali GPUs")
> Link: https://lore.kernel.org/rust-for-linux/A04F0357-896E-4ACC-BC0E-DEE8608CE518@collabora.com/
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>

Merged into drm-rust-next, thanks!

[aliceryhl: update commit message prefix]
[aliceryhl: add cc stable as per Miguel's suggestion]
