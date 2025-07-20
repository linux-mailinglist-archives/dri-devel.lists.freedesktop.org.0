Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDB9B0B929
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 01:19:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECC2C10E134;
	Sun, 20 Jul 2025 23:19:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KTC3pzMw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C73610E134;
 Sun, 20 Jul 2025 23:19:23 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-558facbc19cso3094790e87.3; 
 Sun, 20 Jul 2025 16:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753053562; x=1753658362; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xDAokI7VKG3qDXjdagIu3rwbLTsdtMxhhRz34acfjGk=;
 b=KTC3pzMwql5qIN5hDp1hvdKRqmLAY3hVlhB+VsOAfH932mWKAJa4AZ9YFfWsWB8vsh
 TChG9oxwRoQssjnrmsEr7woTk/Z7TWIPlh9xGus3HfvVTh1yGoGOw29UCltSGsaiaZ7l
 KLwUSIrfeRhqE3lcTFn489bVYyGjw2QKjQrSh4FBCmz236uH0qvJzVqbqiTkVLpu1Vgz
 jJjPDU6RkfnGmNj49m4C11Z9DIXNJHOPEZjtmV+EFXj1CiOQ5N+gtO6Y9n9g7orPqb+0
 Bv9lhSAjEUPOkRGJffa2Jdap2BMFKDV4svEGIcX5CnnW8Ikb8hyXAJVtUCAFcImyXQMi
 5tYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753053562; x=1753658362;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xDAokI7VKG3qDXjdagIu3rwbLTsdtMxhhRz34acfjGk=;
 b=FFEX43UHd3cqPEupeE7Orw77u9Sgcv+zsf2DhTL1oUOZUmBuhTnfeoRKE0DQNbFmBQ
 rbG2jXvIocINR6tEYY/FENQCPxYYG3kEkteuja9sUObDnwDjaWINjxQR/mb7Netna2x8
 BJ0Fj+LZhFFF77oOKEbcwnk1scUKBvEgyaNKGeNMtssO6PtZYnKQvx4uXJbGu0vAZWoj
 mb07cHKyVTcn1B9Tsvdg2/8tQL0TwePJan2JPzqrj3UT5P7C9v5LtMrD8sa6PD4l4RZU
 ZNPNa4x19/1E2HpnKB1EfJS2bUWpnll0Dg+h79J6OXHTVePQN6kVsliutWkBDMNEuRMo
 IU9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0QKKiFF81a0SSFYdXPHEeUW8xkOmtuKlS58pLqKO2MRdXMn9tK3z8gEipTpMBJ8PC2XR50U7mWSk=@lists.freedesktop.org,
 AJvYcCUTcyWfJ90/Dn91dQu4emCvBWs5d72kOxQLUwmirtKoh+hb/I3462SgAXWUV3oKez4j/3DS+vqITQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxkXemsDwD5CGRUJuNGaqMkBdtBuwrvXCCWTmwIRPnuvCbDGrXA
 49TQdFmCri4nQMWqioAXxBP40qY92IXmK6ClaDSAsTGQsDW6woff7OuaNnIBtHtv9hZnjD0eMxx
 4k6hmLTmx+lq7Z2ibDurNcoLH7v+lyww=
X-Gm-Gg: ASbGncsohkR18fHkQsfcdffhl72aGhpDTh0vg+yoiM5sEU1XL7V3aZj6Cph6Y+B30yi
 LjXABbhr5mwR6g1sykMKj8S4kKkNgKtmm/5H84nWB5bS1I2IHT7t436trFSaA+V7+37XUme+vpE
 ppy4wZulWCLJhweLP7Q8sxFAJhfbLmBjFUfuH4ExhwsCUrXbqYNeKYeNFHp3hU4kIAeL1ER7Kn7
 JouQm7Rq1TOzs1pmZHuAFAfmGo3Z+gviSP1bORQzQ==
X-Google-Smtp-Source: AGHT+IGncn/UOc3MBb99EG9F6oXxwGB/WmBF9SrY2hp0XbPoeHN72PD8Hhix3KJ3ohY4uA9MMfu2RuCp7hWDXpSP5rc=
X-Received: by 2002:a05:6512:3da5:b0:553:2ef3:f73d with SMTP id
 2adb3069b0e04-55a23ef8338mr6237754e87.14.1753053561595; Sun, 20 Jul 2025
 16:19:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250704-core-cstr-prepare-v1-0-a91524037783@gmail.com>
 <20250704-core-cstr-prepare-v1-1-a91524037783@gmail.com>
 <CAJ-ks9nBrT4C5xYk4eWUFX_nX5XXBYHEGo+fLtLWJE-D9Y5hKQ@mail.gmail.com>
 <CANiq72=pS1iPePhi2Vs2AkLs3+tV=TASStPuSCnRNnHNHaawsw@mail.gmail.com>
In-Reply-To: <CANiq72=pS1iPePhi2Vs2AkLs3+tV=TASStPuSCnRNnHNHaawsw@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sun, 20 Jul 2025 19:18:45 -0400
X-Gm-Features: Ac12FXz7n_zGqqSP_crmNt9QLWB3OIlBXY-oQtBefFezfU4rnULUsaaSqCUStUY
Message-ID: <CAJ-ks9krjd2kt8G9e12Fh2Nu=XtKWRZspOkHsmKQdjEU1j2XiA@mail.gmail.com>
Subject: Re: [PATCH 1/6] rust: kernel: remove `fmt!`,
 fix clippy::uninlined-format-args
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
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

On Sun, Jul 20, 2025 at 7:17=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Jul 21, 2025 at 1:04=E2=80=AFAM Tamir Duberstein <tamird@gmail.co=
m> wrote:
> >
> > Just noticed a tiny typo here: it should say "can *be* taken".
> >
> > Miguel, if you can fix that on apply, please do - but if not, no worrie=
s.
>
> Done! (We could also have removed that sentence too, since it sounds a
> bit like something one would write after the `---` line).

Yeah, agreed. Removing it would be fine by me as well!
