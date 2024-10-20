Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BDE9A56E7
	for <lists+dri-devel@lfdr.de>; Sun, 20 Oct 2024 23:04:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A18610E121;
	Sun, 20 Oct 2024 21:04:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IsJejgCI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77B0A10E121
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Oct 2024 21:04:29 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-2e31977c653so684905a91.0
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Oct 2024 14:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729458269; x=1730063069; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pUATmSfCv27W3Mka25ndw/fZUUEfWKvZU2Hc9HtXU4g=;
 b=IsJejgCIw8hyZ6fYk4OFuKxfxC9SGINh7bfhrjhNt1nlWPxA0AphSth6buoZLu//Lh
 W/9lRL3MwvBb7amBoE2G3oyLIOY3BCidgTWYrwymu0un1MV+lgNpovuMXl7uSlgo5Ipa
 BpYG8r9PyXBW5Rd9PwukZuPofDA9EFObNIK5oKPPk/PCVyI+/EszG3KEwuY8+GMbs0jz
 DXNuBjtbenskjjlm/WccAFJXaIvV2fG0cZ4iuLz3BI9qQ7HmEEwA7G5vez6795DCcBAS
 7JiSw1+OZO25CjFB78TVb5zAibCw6FhAOeDrdKYyLhzFchk8dltq6eXA0bl5kCaNnwtp
 BxVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729458269; x=1730063069;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pUATmSfCv27W3Mka25ndw/fZUUEfWKvZU2Hc9HtXU4g=;
 b=DSxsRNygHVrudgexgucuTPTKPJ8ZC48CcPZDjeJLpG0WSdJApa8h7wQNcfz/eUIe91
 GX67YpPa98djQThuEKE736nxWeSlDrdyQYt5OTtBV9nPz7XEEmN3XoNKtr5pQUpH/ueQ
 GZ3jYab+QdbKpaSEEpUYYkGrCVAKVdLVSpxTU4dCPwMFt3ERJPYXNZ9PFRTHurmmrVne
 jfiwIhZbELj7lm4kW6IOBoHSEK3H13VUp/xF/Mv0BG3yxd/+BIHtboOSgVUhDxzXj6Q+
 pOdKTr2M0RNooNRuAcmPOsQNtcRsyMckX0N/Nj1LEh0T9TMYFCxFmgbhfEZIrtlrqU6d
 TQ6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbqIqf67e4UCfVZDKtbr8X5sgjh/7qnsOwWGyyRgyGM12FxYAWac7hIjcbzFC61XYPNoQyYECwKBs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6KZLlE9ymD2Yt4KCKaDNYa9xN+ZcJuPWYmyUMnVKGScWlUXOq
 4H9CYNSfr/0x9oEffYCaZOmNWXmlyzH+nOR4+DSyp9vmVGo1EEZ37g5JhGCpB6BLBVrvbcYMltP
 NomFBEuDiFhaAsJQ2PQJGRLAcJPGSkdJpHIc=
X-Google-Smtp-Source: AGHT+IGbb8SvqnhDRVnQof3SJzAdGMzboePIlLB2BLxQxSnmOnedwP/eIElCwjyUsMPZIW7RxW8ToytJ0ApID//+6SE=
X-Received: by 2002:a17:90b:1889:b0:2e2:c1e5:2df3 with SMTP id
 98e67ed59e1d1-2e561856753mr4552264a91.8.1729458268896; Sun, 20 Oct 2024
 14:04:28 -0700 (PDT)
MIME-Version: 1.0
References: <20241019084048.22336-1-witcher@wiredspace.de>
In-Reply-To: <20241019084048.22336-1-witcher@wiredspace.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 20 Oct 2024 23:04:16 +0200
Message-ID: <CANiq72=FAV_aijHyPLO3EJ4LVXQVysNfK6y=RqNZSKdDTXkg6w@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] Cleanup Clippy issues in drm_panic_qr.rs
To: =?UTF-8?Q?Thomas_B=C3=B6hler?= <witcher@wiredspace.de>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Jocelyn Falempe <jfalempe@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Sat, Oct 19, 2024 at 10:41=E2=80=AFAM Thomas B=C3=B6hler <witcher@wireds=
pace.de> wrote:
>
> The file drivers/gpu/drm/drm_panic_qr.rs has some lints that Clippy
> complains about. This series cleans them up by either allowing what is
> written or conforming to what Clippy expects where it makes sense.

Applied to `rust-next` -- thanks everyone!

    [ Reworded to indent Clippy's message. - Miguel ]

    [ Reworded to add Clippy warning like it is done in the rest of the
      series. - Miguel ]

    [ Reworded to mention the redundant closure cleanup too. - Miguel ]

Cheers,
Miguel
