Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E57AD5D6C
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 19:48:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C494910E6EC;
	Wed, 11 Jun 2025 17:48:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WtWpHrvv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AC0A10E6E1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 17:48:36 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-e73e9e18556so115759276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 10:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749664115; x=1750268915; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PpvQih8tMJUPnoS+0lHOgNjam/wL5Ni1Nop7KyDY858=;
 b=WtWpHrvveW+Rwzf3q/kwDmdWOHMOrjU3kxbRBNkIM0pve5aisC4KMC3GOgKcIOhTqn
 womB5iMALMU0BfpoUcKe6uwzJVz7yRc8ocMGVsvM2luZbRQCTziAzOqkBuVRQF33ZqlO
 N4TcIfK9zRV/8jhEbP5f7pZOJ0B1Bk2DcBAN16KiGpcjfingWffCsaBMmspQO3ypMaOe
 TGJORCEdfEF0F2Wwa/6ZvFCafWzBL+B7QbqfH2LvIIxJwwvRdlBkJz/JMeMgLHmXc4Q7
 y9McxDiIq8UWWmq93B/oktucUPsZiCGyZATCRaJm7GeDF3xC3qTC5mBV+ac9bVFxVDVT
 RErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749664115; x=1750268915;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PpvQih8tMJUPnoS+0lHOgNjam/wL5Ni1Nop7KyDY858=;
 b=Tq3kEfwHtTL2ot5m/AO0XEHQTdCGRXGkdobJ7HmiymcpQP2SBIgcAOPthIdJArp5zo
 Ff8sB7gXDqdb/IQnyw7KBxY8QLO0bomAwHMop/UZN5jR5WMHnLdpIwxRF6aRs9c7CGcP
 mm9J27TCzSXqIgI1PowOc8ophjMVQ/KtBdorkoZp7OVQPI/sm8b5e8LyBnbWNQCw5KNe
 Mv6T6jjpVtRLezjP44+kbkOVyxvKWjWa8zpDa8tpWGUjZDgX2nZ1IG20Zm03/vCBEm/r
 8jZdKSgE8QsTfYZTnliLYJsdKaXaCUimKXJx2uTWovGp5dvSC54+876cyJfFMdbHSmpP
 hKyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUotAadVAWNuUn2CkEKGopUi4qqAsdA5Jim4WARgiw0SZZguiwiLFAhmxKAxHwZ3vlU/mp+h2NDP90=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyfIPD3gegtuUfQ820s7hMayuz+pnYrUhtwgjKgvXZKbTL8YRjN
 pkIdVnsiHo4fNYw+olXkWPvC99QbTkzcvyyjfrL6P1g1a0tbeELbsFDiKRgcTcF95zvH7GJwzQh
 smdvfQqSXWWouuZIOkMCnDr/7WaWuUMk=
X-Gm-Gg: ASbGncu3oRCKIjo05JuSmNkbR5XfhjVPchQcDo8eGKsC/W3qynU0r6ZJ0Y/9jf0I1C0
 CfevlehpUiPV9RLTOuVsRDzOJ+rAb2sZ/eYdgH26pOXKapgLNvu1z/qnZ3YhvdBzFfbTg7yDkTx
 AhlHXVuXtTTkA0PsHOeIejirzX8DuuaWRv+s0caRa3KrJ0
X-Google-Smtp-Source: AGHT+IH9DABL4wlDn/GdD9XoHB+8QanMkWBj0pjVvFYJ/W1MuhG7BWxLo4YCnNzNiDDh2Shj91H32KBlXFkEPsp6D3I=
X-Received: by 2002:a05:6902:2501:b0:e81:7e20:d737 with SMTP id
 3f1490d57ef6-e820baf7827mr480844276.18.1749664115677; Wed, 11 Jun 2025
 10:48:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250611-sgx-dt-v1-0-7a11f3885c60@gmail.com>
 <aEm_7NECSykMX5cs@blossom>
In-Reply-To: <aEm_7NECSykMX5cs@blossom>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Wed, 11 Jun 2025 19:48:24 +0200
X-Gm-Features: AX0GCFsfxtx0nWUUwofAcCujP5Iz-6oqoAbr15qgAOq6KTl9zDhKhhwtvESKTto
Message-ID: <CAMT+MTQ=oxfdq+tqjxLXqDUPEAHzLtJe1qy1vDBf_SA6wQ+tkA@mail.gmail.com>
Subject: Re: [PATCH 0/2] Bindings and DTS for Apple SoC GPUs
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 11 Jun 2025 at 19:42, Alyssa Rosenzweig <alyssa@rosenzweig.io> wrote:
>
> It would be good to include links to the kernel + m1n1 branches that
> support this binding, since it's not what downstream ships.

Right, will add to cover message on v2.
Kernel: https://github.com/WhatAmISupposedToPutHere/linux/tree/starlight
m1n1 (the bootloader):
https://github.com/WhatAmISupposedToPutHere/m1n1/tree/bootloader-cal-blobs
