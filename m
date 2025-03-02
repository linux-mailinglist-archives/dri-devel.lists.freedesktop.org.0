Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E436CA4B3DB
	for <lists+dri-devel@lfdr.de>; Sun,  2 Mar 2025 18:45:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE5DB10E191;
	Sun,  2 Mar 2025 17:45:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="P4tn5DNf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C146D10E191
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Mar 2025 17:45:27 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-216513f8104so8484195ad.2
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Mar 2025 09:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740937526; x=1741542326; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k3vFqL/xKCk8f4E661+8gVjTKIGeRjDEleSeHCMboHE=;
 b=P4tn5DNfCcld29tpMsRehEdP7Z4CXvZw+AqqNYXvlt9vmrEdXCb2uESXKobHE4hlBX
 yd1mhqx1Ac0gEXYXYtx0vMg4xohMBjo/pmY0rbDXyonQ44DXE7YI3TmRUnP2dFDnAf5C
 P8tbuHxwv4O7HzSg4g4LRas1oe5m3H/0UIitZ1RldvYzrF6uJOu1fbgIbDBURglPbBjS
 rgpEz7GY4k+CRPx8ozKmNXUt7gf6CwxsT6EyhQqt3zdYDeubeF0AyTxNKi1c5VPPWdpc
 BBGOX4znG69KgzRiSTiYB5GQZVIdltZt5MXGwuxNmeLWcI/FbJU15IczJj2EjL2JLzTB
 cGPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740937526; x=1741542326;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k3vFqL/xKCk8f4E661+8gVjTKIGeRjDEleSeHCMboHE=;
 b=nA7mjmISgnBXL3N6vLgGQL1pshN1NSpHAxBq6hiCSwSa85Vyqfw3ESTt32CYh7XwFD
 Olrm9nTwD2aC5QRJ7UIQWsgmsCD7ykoUY//2tReER4BMBjF5gifeA8WZKNKwPgcVaZl/
 KpuJMJAsyQSzRUjOYO32Pu+09hSdZY5Htx+MzLzcdlXBgo/TlT6JsfWmab2KkXvh6slG
 SN9d6F3wd2JW4qtCITwDukjrYkGSaqGfxHEoKTVMgA7JS2OZaafOXNG636IMsY/bK6NK
 PnO4YjMHyjxMQK+DCnvQgCuqCmgh8YuihbpUJ+F5RlNsa8alkVSexUIwgmumEo6p4kHo
 Fs2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWY4nCn4GXiznoPAJdq1J6LfGKx8/NWV4R8Ta+GLRTqvuOcydZP1XoECHCP7FwpRApbuuLILcVRMUA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsXk5VbosJxu949ZHAxTfbtqkDkk9sulnwenFk4bXbNI2XNYMB
 noCSFSaZh1Tuk5IDx66lUEN602hxVsrVA5fiiSEpRlyF/rBMee+g2477v+VNSZyCMir/Pq6J0hS
 3uhGj7eyGgsiQGQa6Nul2HBtbCT4=
X-Gm-Gg: ASbGncsrvr7b+lG9rWP2fWlBPOUuTMSPgSmtJ+Y+HjwOuuIlXrYlP17yA5mICatT4qv
 oUMXkiatoVNATpV4AKoU9gG1ZOBLkRwNA+aiyyOgCmuEfzY7iNrGKIGM/J5SARtgM/ZY5VRh4hf
 BaycTK9RloSig2M2uB7yZXxQFMIg==
X-Google-Smtp-Source: AGHT+IEM14oBkasxbrfLuhdlkhBgKZTVdRXsNXBGHPpuX7+iINgsw0kMfQM1BNFq3lNwVS4ywEhQiqhc4ZksgvZKfdc=
X-Received: by 2002:a17:903:3ba4:b0:223:5e57:44f0 with SMTP id
 d9443c01a7336-2236925928cmr56864515ad.14.1740937525642; Sun, 02 Mar 2025
 09:45:25 -0800 (PST)
MIME-Version: 1.0
References: <20250301231602.917580-1-ojeda@kernel.org>
 <20250301231602.917580-2-ojeda@kernel.org>
 <CANiq72=69XAOapYBurbwsQOEaw2uamZ6ta=DT6cC-om9XK3dvA@mail.gmail.com>
 <Z8SMTiWzTDjIwGfO@kernel.org>
In-Reply-To: <Z8SMTiWzTDjIwGfO@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 2 Mar 2025 18:45:13 +0100
X-Gm-Features: AQ5f1JrCn6sPBiedOcepz2gVBmJgyJO37jSMsKXrpOq7sHIUfZKwiTfBkhdUN48
Message-ID: <CANiq72nQNFSa0quEwLYMUVw-2CH3FwrV695k-rWfoQn5r0Mo0Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panic: fix overindented list items in
 documentation
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Jocelyn Falempe <jfalempe@redhat.com>, 
 =?UTF-8?Q?Thomas_B=C3=B6hler?= <witcher@wiredspace.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Alex Gaynor <alex.gaynor@gmail.com>, dri-devel@lists.freedesktop.org, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, patches@lists.linux.dev
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

On Sun, Mar 2, 2025 at 5:50=E2=80=AFPM Jarkko Sakkinen <jarkko@kernel.org> =
wrote:
>
> (cosmetic) Nit:
>
> I think you could just:
>
> Cc: stable@vger.kernel.org # v6.12+

Thanks Jarkko -- I did something similar in the past, but sometimes
patches got backported too much because they could be applied.

Normally they don't hurt, but I try to be more explicit nowadays so
that the stable team can decide, and thus I copy-paste that line for
changes that are related to new compiler cleanups and similar.

Cheers,
Miguel
