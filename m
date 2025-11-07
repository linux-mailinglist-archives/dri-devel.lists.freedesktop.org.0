Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3EDC419C8
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 21:44:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B71B910EB7F;
	Fri,  7 Nov 2025 20:44:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="js5F6wqF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1DA910EB7F
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 20:44:36 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-29498a10972so792265ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Nov 2025 12:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762548276; x=1763153076; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FJwadjvE+x6S4hONQHvG75rq4vKRo6ZUAojElg8WjXQ=;
 b=js5F6wqFnPR6ErCM6YDy0NwWnq6Sj8XWhwAOS+4p/51U8uUjkzW9ebyJRjHePI6OtL
 2q5Js56pFOEsPxF1A+TfWVSmR5G4AiUHee1XSoDqZRGI/UO52eI8BJtcG9B/vrOBxokY
 JRKcLohKINxNNqvncQEYJGojyxQMSd4/C36Yrmdx7OZXs8/WQCSN99Cu3bhuDS1zCcf9
 CRM38QBMkiBXWKFK9X9WJqswXkIl1qe+MU2mXDWpPGCS8d6WIBaL7vlwlustMJyyBEg3
 /bNKRsYTO4aFtSQQ/ByJEvsENxActRMKrWF/njAf3UAGHC2JP8bSuMoPyWLU/64cs128
 0Dpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762548276; x=1763153076;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FJwadjvE+x6S4hONQHvG75rq4vKRo6ZUAojElg8WjXQ=;
 b=MC3Z/7UCsLIaU1fEJ7sEwxEEGqhkTCXFwRrQ6j/OuLzNjOhQ7CygTY98Q+ukjCTeA7
 utED8TJkIk65TDzXMmdcTQx2QyRw/p9DjRV4iPwUbfjp2vQotglkm3QWL7MELY68oaUJ
 X/MxZE6U+t4JsytH1M0sWR9tTU5vE5WwibP6C63OdTdpryrin7EcAdL1mCzMNQDzNT6M
 lB8zEZmD/zOuHHYjBY1jp2l3UBJQo3IUkKO7cl+5bBJoxZAAmiDLw4rvDAIwJVrRyXP0
 v2ine4Qw3WHpG/CitqY3PXkxEBlk8iDSzqwakSYGBSDrz298/xzNBVB2jGWQxFyCjcwF
 O0gA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVR+/57IAXaxEOjuzPnF/Qu4+tfY/NzfrGJlA0e3gmNapWUeFWWI9iA9idBUsvamBRoDpPLk3sKqQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YziNwQyuwl7c/ymsyKDo7xALcY72Y6qS62X9xvRMTwMyc6ey9Sc
 HfGAq3P3LvacHP/2gWk45TS8eNHZqOzF8cbj0zRx2/pFhfpn8XpHrXXDnqmclE58SGSEwGXtIkW
 /91bv4S/ZgxEJ8SQrwaXzdH1ztLforDlUvPg75Zk=
X-Gm-Gg: ASbGncsTnnd/4J8Q9SLLL90lZ69SJ066LPTWfCsv4VzanyhlxWJZBU+Jk3FBJOdGKa2
 SOcsvaS1lx/HJ0VndRwdLld3bOZOctuahHz7oN7qv7gyDKFKaLbu4giPrRxEvCPccp+A526NYi4
 2BWq51Rzg/EiUX8bFw6CXaclVtcwVvl2qNwwvvRZKdmqDkhhaNil3DJAFVNaTdpKri7rNtkXzMB
 75U8gKEh++f8JTCXtF3tW7HOe/WKGBg7AP8A2d7sz/3L53U/O+nftQdMVpaw09TiYUQVYvTprCs
 Oa74uJLMIdy3AS03aDtgnxMK1k5M2PGsqar8eSGmB5emePnwehZgCfTbEqNFgXN5fGzqD8C1Irc
 YQ1E=
X-Google-Smtp-Source: AGHT+IG4kfdE9ns+hw2rpt0h0Ke6GeX0YiddNE3DhFtSBXMZ3HIxQ2OtW0G9wd0osT7WC1CnPcwhL4cL4czBFQyIQaM=
X-Received: by 2002:a17:902:eccc:b0:272:2bf1:6a1f with SMTP id
 d9443c01a7336-297e5657e71mr2838795ad.4.1762548276152; Fri, 07 Nov 2025
 12:44:36 -0800 (PST)
MIME-Version: 1.0
References: <20251107202603.465932-1-lyude@redhat.com>
In-Reply-To: <20251107202603.465932-1-lyude@redhat.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 7 Nov 2025 21:44:22 +0100
X-Gm-Features: AWmQ_bkvvWpH3oiH0ZMom1_CPsAEk9l2Cr9yEraf7Pp4-uYDzYPAwG5chWQGO1w
Message-ID: <CANiq72=c_0+H+ZysBL6a=zVd18sGPex1=e9N3_nDMxFFt9yqjg@mail.gmail.com>
Subject: Re: [PATCH] rust/drm/gem: Fix missing header in `Object` rustdoc
To: Lyude Paul <lyude@redhat.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>,
 Shankari Anand <shankari.ak0208@gmail.com>,
 Asahi Lina <lina+kernel@asahilina.net>
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

On Fri, Nov 7, 2025 at 9:26=E2=80=AFPM Lyude Paul <lyude@redhat.com> wrote:
>
> Invariants should be prefixed with a # to turn it into a header.
>
> There are no functional changes in this patch.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Thanks for taking care of the docs, very much appreciated :)

Cc: stable@vger.kernel.org
Fixes: c284d3e42338 ("rust: drm: gem: Add GEM object abstraction")

Cheers,
Miguel
