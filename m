Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F99C4FA6A
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 20:54:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E46910E640;
	Tue, 11 Nov 2025 19:54:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Mr4gAB5n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A0FD10E64B
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 19:54:30 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-29800ac4ef3so147285ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 11:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762890870; x=1763495670; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s9+a/eFiDoDkgzy9Ul2SUezw6cD2/LMwGt4BI4jMuWE=;
 b=Mr4gAB5n2v/F+Y/lj4ZF/mfKu13Ilbz2CRLjMfHXt6/iSYNrZnUUv+R8Hp4lVUaZ4C
 9cgDnq287WJaK71bI7nGMhMJyrooUzgTv2Cwl/SnOlToAlyKxRJY29DOdaVY+ULa+GcB
 BbjmrAGC2b0Y0vDLE89o4JdjjOgAjdUU41t37hHJprVg2pAb1MG8DRbTl1d0zDF/efTX
 UqC4W7c8FuYmp53vnVm/iTaPqal2v5gglgCO20OytjE+6u6cRWPBz9t0RFH+FCjkt+8x
 6JedUVjo1e/CA1OfuA1/dnn6y2CjlvcERuhNxSFfejXaHz5gqkzFxbBeq1h/Hrk0H6Z0
 5vtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762890870; x=1763495670;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=s9+a/eFiDoDkgzy9Ul2SUezw6cD2/LMwGt4BI4jMuWE=;
 b=gKP8P+NZWMai0tV6tg1m5nvNpQoIiIikwd7EmAbheU1fMGNJTb3icwJbASfZgwsANv
 gqbxZjNNeXg//1XjurhpYAn/HwQMdYL9KLZIp9dIq5XlLT52KN3ehuJEGc/d+LYXgW7i
 JmXi5SLLRHcNQcOtu3Ogg0JZEYai1VylDgKWcTYQChOxUsPaxHt+Rs9C1SbT6Fg6NWJ1
 LwZQhy5wJohvbs+ABPdrQRpUUDbSNWdhP5cg6Do1e3fQ0oC2ipp+XQmr1Gz/s2qj3H4i
 N7/dDj4F9NO0z+SiWP4ALy2Dp9m6xvqq63q8Nk5jpOtvQYoU6mABuurjoExgaxzdCM1s
 vsqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUSQ0qr01aEkKI3AGn/d2GVbZ9xtgOwQLTLDUucOG32sEfRKUz0IF0Ib1tVEhtId0WirSNDHqaFJs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJ5B8Oatr6N1lOkGOV6Vwd3wByDQa+5+y8WgGK1vVA6edF26Ty
 almh4mHOM4zv6U4L7Zh5zqHbfSTtyCBJlQZv3tqSL2zxGRaS1WcWNybcu8QLL2ctE76S9Wj3Luk
 OUpFS+wu6W0lJlnFF2zcIKMISva1mZ2k=
X-Gm-Gg: ASbGncs37d3i7uQkylSX6ZpS52Sk/WgFFWfsYI2m4S/auDBdgT9sIg0+G7KSAgT5MYM
 +y+/lQl0mf3KJ9+WbcujYMJ14HzOQ1Vko4Qm23inaA7X02j3sfiOq+xBlzvFBMtCbnboyv52E6X
 st0vXlmgLge3Lw7XOwzpfUPnOgxGVc/ZzH/HlsvpauPNRXvSo/WgvlfEHScdfc3TqrEG/OA8ifD
 x0U2ubRwYlYQt8zK3FYJkKAlRF+pHES5b7UAYTF2wcfeATw6N6IwMU2tvRe7KYSqNM2w4Q9nAR8
 v5hhJUplGT2oRgcoPQwswbfjecsjyQ4wwdrwM3PaZxHwcBtEesRHiL7flNFzpUxpDkFM6l9JO1m
 YtNM=
X-Google-Smtp-Source: AGHT+IFGIw0sPldyd+rtRft0su885bkTxqqUTUuhpd3lcLBUxXPnk/ZZeeLUF53/y6iwwN8RrfJVa1Wt8ImxuyYODE8=
X-Received: by 2002:a17:902:d50f:b0:298:371:94f1 with SMTP id
 d9443c01a7336-2984ed2b38amr3798265ad.1.1762890870059; Tue, 11 Nov 2025
 11:54:30 -0800 (PST)
MIME-Version: 1.0
References: <20251111171315.2196103-1-joelagnelf@nvidia.com>
 <20251111171315.2196103-4-joelagnelf@nvidia.com>
In-Reply-To: <20251111171315.2196103-4-joelagnelf@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 11 Nov 2025 20:54:17 +0100
X-Gm-Features: AWmQ_bl0L-0Cea_Wx26TMHEqrDOWgYHY0NBpoDZ7Qy4Vo4Y76uHd2eVw2Y9spcU
Message-ID: <CANiq72nuHUFGMsEYr-KhCB4oMjX72YskG0s7uCB8dcVtTGW-jQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] rust: Introduce support for C linked list
 interfacing
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, dakr@kernel.org, airlied@gmail.com, 
 acourbot@nvidia.com, apopple@nvidia.com, ojeda@kernel.org, 
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
 aliceryhl@google.com, tmgross@umich.edu, simona@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 jhubbard@nvidia.com, ttabi@nvidia.com, joel@joelfernandes.org, 
 elle@weathered-steel.dev, daniel.almeida@collabora.com, arighi@nvidia.com, 
 phasta@kernel.org, nouveau@lists.freedesktop.org
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

On Tue, Nov 11, 2025 at 6:13=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.c=
om> wrote:
>
> there. I rebased the patches on linux-next. I can also add MAINTAINER ent=
ries
> in a future version, if folks agree this should have its own MAINTAINER
> record.

Yes, it sounds good to me to add one. Please do -- thanks!

Cheers,
Miguel
