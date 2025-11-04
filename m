Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC12C32417
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 18:13:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E353210E295;
	Tue,  4 Nov 2025 17:13:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EL2KtXge";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7BDA10E613
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 14:35:50 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id
 46e09a7af769-7c532e3a165so3370526a34.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 06:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762266950; x=1762871750; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zOvuDFw8E3IMboZLcv+wNk+hwh0bnRBGIEk5JfF2cuE=;
 b=EL2KtXge8/KRzy0tGa1tYMtE46iLjXusA/h4n50xPhNQNtNfW9/SHTlzi8pocQFecs
 /VRR8rAwrCOoZslL9+H5ekpNaOKqTpoGiouLvFlVymqO7VCjW4GZdKGMFGoEzcTg41vD
 pmW/gB4culqNBMcBuusgtmJXyUmSQA9o4R13KFGuj+xkFtAeHBZtWjGAkIwnFCrfXiB1
 O8KCX+CrzzuX3VcZXPke9JgcJ/EK+e2wlAtkyqlIOgQv4b5VUxcBavxtbVyldoO+AjzM
 dYcG2L0KiAcoirqAUomYbALu0YbiXpBnptK+ix+Pro0bqWPZOUISlG/0EdnNV5PvJGAE
 H6rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762266950; x=1762871750;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zOvuDFw8E3IMboZLcv+wNk+hwh0bnRBGIEk5JfF2cuE=;
 b=wK8r+IU99xNXqrSuKP3cXtkIcCTKO3r4AUn/DvH8/6SyLKRDNtcFI5aLy6We5PvKOV
 AI2QHbOQnpwl2gVaf9UqbfznDHsrXg+LPogzJC/2FfrKGzLYXZTbAu5bKgIWgg7n5woz
 zLueIzf6KUS2nZklK11c5bGTE4zMQnAcAZn2TsgB8vx1zSXhFgeAUA+hEVgrd+cdYwzY
 RXfJhP4mLZ4RicgtoiAEov8M7c/lkJu1wIzgLnhg+RrwkJxtBL5DtMPNQL8n2O0HZEwJ
 8uDtuUWaIXFSTffyIhj8XQ346v5bysYOABaWxaXnC90PdexgMkeMzeuQ3e3KKmuswMTz
 527Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJQ39gZE34KeAxr8+kXHUuUx/3Zf1b38a0/tY/oGxzQxmEX3LyS485w2JrGmDtWuxbCW+5tz/hrOk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxS68bWGv7aFmeHBG24odu+QWsSkisCvVtE0nsilKf5v9tGKqYS
 6tD+Kcx1A7zY+QsjvGOb+59mUtO93lkff9T0TtIDYbCIXbXULShl20kaAQ5UBOn6cUJKGmwtsoK
 +8gTRgDgTJL9rfyeYnsQY/rPxlIRRfbQ=
X-Gm-Gg: ASbGncsKM6h6p00iXAgJTwUgNuWa9wr5GNTgORdK40N1iDat44qQyaQvp9IoZ+39dOK
 WHNiicqi1uob7ENPNyjISO/CrapI1TWHBAnVuCqOkAlT9q1p6YOIJgXiq/WaeeV/UyR9V7JcrMS
 tmr/dW9n8/4AnSLfMP64pSMY318833vZ/4ixDLVRYETTEBrkcPujzw8OThFG3scpRGZ6F7WtPMF
 CxC+fqjmK6Dnd0TevjyhhdBNNNiON/rsSvUVjlY2Noy4iX7wf0B3hWIPDzT
X-Google-Smtp-Source: AGHT+IH4OCkFruz7BGxua5FpIyeWRlYQkDUOWfGwgmmxmCKwpvX6Z4Dm1zHFn09KPDIAh4UKGSRMn0mdbsaJbqb/nak=
X-Received: by 2002:a05:6808:1791:b0:44d:a99e:45c7 with SMTP id
 5614622812f47-44f95fe6b3dmr6712173b6e.61.1762266949648; Tue, 04 Nov 2025
 06:35:49 -0800 (PST)
MIME-Version: 1.0
References: <20251030190613.1224287-1-joelagnelf@nvidia.com>
 <20251030190613.1224287-2-joelagnelf@nvidia.com>
 <DDX1WYWQNTAB.BBEICMO8NM30@nvidia.com>
 <20251104005812.GA2101511@joelbox2> <DDZYCRCPYMOL.RMTIF0R404Q4@nvidia.com>
 <CANiq72=Cj_gJ27+EAiytxYGYk1dMwu7M3xQpLGByD4QstgDsHw@mail.gmail.com>
In-Reply-To: <CANiq72=Cj_gJ27+EAiytxYGYk1dMwu7M3xQpLGByD4QstgDsHw@mail.gmail.com>
From: Guillaume Gomez <guillaume1.gomez@gmail.com>
Date: Tue, 4 Nov 2025 15:35:38 +0100
X-Gm-Features: AWmQ_bkVG2efaCRVFs-QREr4TF_4XAydKse4BHYewSEAhSr6252jH2iQIzSA-jQ
Message-ID: <CAAOQCfQ_d_C7oZ9uq2siJHn1+m+j059qYUMBvTWOnQ5Etk91ug@mail.gmail.com>
Subject: Re: [PATCH RFC 1/4] rust: clist: Add abstraction for iterating over C
 linked lists
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, dakr@kernel.org, 
 David Airlie <airlied@gmail.com>, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Andrea Righi <arighi@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 nouveau@lists.freedesktop.org, 
 Nouveau <nouveau-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 04 Nov 2025 17:13:18 +0000
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

You can use `cfg(doc)` and `cfg(doctest)` to only include parts of the
docs when running doctests (if that's what this is about).

Le mar. 4 nov. 2025 =C3=A0 15:07, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> a =C3=A9crit :
>
> On Tue, Nov 4, 2025 at 2:42=E2=80=AFPM Alexandre Courbot <acourbot@nvidia=
.com> wrote:
> >
> > What I'm more worried about is that it might be a PITA to write. :/ But
> > maybe the core folks have an example for how this could be done cleanly
> > and in a reusable way (i.e. we don't want to duplicate the dummy list
> > creation code for every example).
>
> Using a shared module/file may be good enough, as long as the `#[path
> =3D ...] mod ...;` or `include!(...)` is hidden with `#`, i.e. as long
> as the user does not need to see that to understand the example.
>
> But, yeah, we have already a few places in the tree with fake `mod
> bindings` for doctests and things like that.
>
> Cc'ing Guillaume in case there is a better way to do this. The "have
> something applied to several parts of docs" has come up before for
> references too (the "external references map" I proposed).
>
> In any case, even if the example does not run, it is still way better
> to have it at least build instead of completely ignored, because that
> means it will not become stale.
>
> Cheers,
> Miguel
