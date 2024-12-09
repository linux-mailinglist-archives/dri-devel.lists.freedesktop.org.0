Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 505B39EA270
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 00:10:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC95410E575;
	Mon,  9 Dec 2024 23:10:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FNGJ743I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A5A010E575
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 23:10:44 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-2ef79243680so603368a91.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2024 15:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733785843; x=1734390643; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QE+fKlDSe7E+kExUzTzdcRgoLew/xvVD6sIuR+E1rNI=;
 b=FNGJ743IzEgz1x80BxEy+qaX1OS8giM1GVf93hcBjBl4GIv53/ThlbpLFRMosF9mom
 xHy5daQlADRUXpvGkc5Gum8yL0n2C0tE/xvP33iMJo41qI1CbP17QEv6CibJhZ+nAyFn
 11x/XMwBnDH9aKNbo7TmJYBkIIDaTnB9VQgRS0zO8VhLxV48zwVQ7d+QJqr98l5iRTpV
 lhTQd8gDsDxcveAYbBsx8/SPSEUmR9RbXSrkcR6DCcpgCIMV8rteIyhgk3YMPI+inylq
 yx7TkSPJimS+0A4PoWElj0/v5txZH2AZY2R3tRSbHs7WyiT0Oma4WaRaxDjpsTmkQNiv
 90xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733785843; x=1734390643;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QE+fKlDSe7E+kExUzTzdcRgoLew/xvVD6sIuR+E1rNI=;
 b=RM93qcWzFUi7557+xpwBLrr+IHVct6mUyzyJUx/kUINNW2s69+Tc+QpHr+5hYfTIpz
 baFClHWPD/UHRIOVkoEbB8oYoUIZl1ggt5LifYET9f2+3VkfcHxiVVHqvseFAzKLi5hX
 UZTpzWTfrcrZOqlav4ELJf3AGJU+hQofC4frSRYHkYnRHs/EwB+wf2ptIVOICwp6ZDH4
 W/A7j4Ufvn0Giko/UeRW4VZA5cnn3y8D+BMrCFngARPSpOee62AoLWUYk5AL/a3Mu2MF
 onBtxrgW1XTOHk1VgAyWBov2xWeb9iCRUCJoJplniybcwBg84PR1fyIvcS4mB8DsLsvh
 bxFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEcqY+L5HRHCDI6oP+oKYIaVWQ/3605PTUdbyO4W1wZ5TW22M18NQZ9Kfseo4HsOfE9MXI9L36eVI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxU10/hCEasJ4k1x+Eyt1+P2rLMe9A7Z1zE8uRLKv2qNXnMoljV
 1pGX0bVxXPDmMCVvRdXylD5i3bpjk98dTfmFt1iYJn19uh8ediyM12dBnokG9xiS3IGofkkGu87
 hJTVfArOFFBWxbbO6t1U4AkdXTqM=
X-Gm-Gg: ASbGncvXK6RNs1hdvOn2ehuSkR4/UrEgaxLDRIJSuLApr70mEL/iiliXJnT/aGOOwmj
 ehDK+pjxoeojrv1NHQ8XFYhkLtZjGc4RSRC8=
X-Google-Smtp-Source: AGHT+IGI8SxF3kv4Towz1Sn0iVeRrBAzBUBXonLAFx+//gR5/lMdXYf3/WqqCG5i0YIC+b+9KFrc1WCKHw6mrXFmPzA=
X-Received: by 2002:a17:90b:4a83:b0:2ee:948b:72d3 with SMTP id
 98e67ed59e1d1-2efd472ea91mr789956a91.1.1733785843572; Mon, 09 Dec 2024
 15:10:43 -0800 (PST)
MIME-Version: 1.0
References: <20241125233332.697497-1-ojeda@kernel.org>
 <fe2a253c-4b2f-4cb3-b58d-66192044555f@redhat.com>
 <CANiq72=PB=r5UV_ekNGV+yewa7tHic8Gs9RTQo=YcB-Lu_nzNQ@mail.gmail.com>
 <e544c1c7-8b00-46d4-8d13-1303fd88dca3@redhat.com>
In-Reply-To: <e544c1c7-8b00-46d4-8d13-1303fd88dca3@redhat.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Dec 2024 00:10:31 +0100
Message-ID: <CANiq72m_b4y6bJJ6sB5gUe+rpa51FXtwpwENQy3zGGMtuFJ3Xg@mail.gmail.com>
Subject: Re: [PATCH] drm/panic: remove spurious empty line to clean warning
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 patches@lists.linux.dev, stable@vger.kernel.org
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

On Tue, Dec 10, 2024 at 12:05=E2=80=AFAM Jocelyn Falempe <jfalempe@redhat.c=
om> wrote:
>
> You can merge it through rust-fixes. I have another patch [1] under
> review that touches this file, but it shouldn't conflict, as the changes
> are far from this line.

Sounds good, thanks! (But of course please feel free to merge fixes through=
 DRM)

> How do you test clippy, so I can check I won't introduce another warning
> with this series?

With `CLIPPY=3D1`, please see:

    https://docs.kernel.org/rust/general-information.html#extra-lints

Cheers,
Miguel
