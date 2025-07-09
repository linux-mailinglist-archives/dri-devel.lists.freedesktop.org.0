Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D01AAAFF4F9
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 00:51:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3754910E868;
	Wed,  9 Jul 2025 22:51:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gwbv/yBb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B63A710E868;
 Wed,  9 Jul 2025 22:51:34 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-32f1df5703aso2514141fa.3; 
 Wed, 09 Jul 2025 15:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752101493; x=1752706293; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AT7zdgEz0XpzQD4/Kb0V7s5h4j2xaoLGpeNlxuiDd50=;
 b=gwbv/yBbhHbLXD7yoRph2Oy1BWnqPeozg0uCdJsP33gnL4Nc+HNmlsVo0F0oiPej8r
 FgudNH5zWkgvNogi7pjtvXQmWz5qi1rabb01QRtEAKxgIWmLKyAHMcLFhitaGiCArums
 gG1JOtyegF868O7nh4ZWzfUOGlPyijeHAOUcmhNLcBTxTwVU1tGA0j3J+0rAjFdyQYpT
 QClCReNk75/L8ACdouzVZeM7jQTZ9dzVaHt9HLWYLIo0GbyIsmlKOcotheKvw9+u0wNI
 39Ydl3oVrRwGnjp3t1/0aM6bzJB1u/P3zOX+wg/Oc8Y4VYPvyJ5Hr4tkXdKg/82DtBk7
 9zTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752101493; x=1752706293;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AT7zdgEz0XpzQD4/Kb0V7s5h4j2xaoLGpeNlxuiDd50=;
 b=jQdD66O5vsTePCJLihzcS5v5uP7+CFsBTRuvMMmFDOaaxjulQWsHfY9jNtTRBXIxuS
 Bj9D6A6k0XRb41U4fG143dUXSTmEhsCjby5p2WzFElMy7dsT1Ahol1NRejJg/lODdf3R
 S5AzyXW32Gf2nAxgbaCW294Kse1VUVmETHvIzRNJFN0qsnKm3vY9ycds6CtWyGNOB/PT
 prN0X83C7qZYG+COIXkWqjrOvJNz6Q0F1FQWpuIvhrYRgVq5veZ5QCoTTFgx8Lo5gxS/
 6BJ00xz5w/Zh5DKtJv+B8x0eyivogflrR5LFWgRLyfi88k4Yf22MFwuDrM79MKjscNTV
 Zlfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhTG2q+oMqYi6DxCV6UlhGYLeH7a/D53LQcRgxnBr9ufHzwhJYTRDoaQnotNfsJC910yGDiZUDmcw=@lists.freedesktop.org,
 AJvYcCWDgdH4LXO5XDjSd2TdzGdrwR983scXhalH/FetL51BFFdobmXDODzFiPFmvCKrgnTwuxL+zSu70g==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwS8PNPBKTPQYyWh/7jZM6d8a6zY35LtucHj8v+K/h9pfPWVMbL
 ASWxNm0yg2VxnS1AVxAZF+mGTjZ4rHpnhMiwYkoP+2jKRBHjwPY5YEkeXRcG3UE3qLGqOcyZQID
 LJHNepmoz4M2kjTGxSnfL3NILmw7v3MI=
X-Gm-Gg: ASbGncsr3eTcSlpedHKxv0egUDbm432olP3AAx/dJ/YxaYG7Lfx/yrn6AIP1uxJrhge
 tcua8llq8szlXgFJ977iUiBQAhKxpMx7u2y0ZNchAynIKEgBDsry4W0Jvr5r2oP5qtSQdBVTTi7
 3KPlPLGUmUAsh0Mj46CzMVPrDdRh9Egw1Ai4mK/X7yN3xWtJWE0UnyoN5po1SJ4AHn14SM0+9Od
 vj0IY9fyHvWxW7O
X-Google-Smtp-Source: AGHT+IF27+KrVs2nw7zMxm/lAjmI7ad0idRyIl1c4CvKZ8/UEyE7oxDB/OUDydZblbt7SfQMSlfdwda0M1ohVpNso+I=
X-Received: by 2002:a05:651c:220d:b0:32f:41a4:5584 with SMTP id
 38308e7fff4ca-32f48584db9mr13809651fa.27.1752101492829; Wed, 09 Jul 2025
 15:51:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250709-core-cstr-fanout-1-v1-0-64308e7203fc@gmail.com>
 <20250709-core-cstr-fanout-1-v1-7-64308e7203fc@gmail.com>
 <DB7SVTBZ46QB.31WTHFLWDHPZY@kernel.org>
 <CAJ-ks9nNc_pThtb+gHUcjEnvR6V0RAEG0tkv+_DHYYjXs1N7=A@mail.gmail.com>
 <DB7V0GL2HVMV.BR1JSWQPDMC3@kernel.org>
 <CAJ-ks9n9Z0PtBmqNupS2390B+gq7UJuV0npD+3Ri0tJrQZVB9g@mail.gmail.com>
In-Reply-To: <CAJ-ks9n9Z0PtBmqNupS2390B+gq7UJuV0npD+3Ri0tJrQZVB9g@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 9 Jul 2025 18:50:56 -0400
X-Gm-Features: Ac12FXy4ZkLQdVyOcORlDTRU2dOMP13FGi20G8_0yikxCOUmMBlYgA2CbZFOSII
Message-ID: <CAJ-ks9=hdDghvG5d2sK6SWz3OME6BFxZEmrDmfkrAV7Dse8wXQ@mail.gmail.com>
Subject: Re: [PATCH 7/9] rust: pin-init: use `kernel::{fmt,prelude::fmt!}`
To: Benno Lossin <lossin@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Jens Axboe <axboe@kernel.dk>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
 Rae Moar <rmoar@google.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-block@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Jul 9, 2025 at 6:36=E2=80=AFPM Tamir Duberstein <tamird@gmail.com> =
wrote:
>
>
> Ack, sent https://lore.kernel.org/all/20250709-init-remove-old-workaround=
-v1-1-a922d32338d2@gmail.com/.

Messed it up, sent v2:
https://lore.kernel.org/all/20250709-init-remove-old-workaround-v2-0-a3b1be=
8fd490@gmail.com/.
