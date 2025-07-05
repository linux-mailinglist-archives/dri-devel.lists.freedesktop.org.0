Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47146AF9F28
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jul 2025 10:35:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F344910E1FD;
	Sat,  5 Jul 2025 08:35:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="sLgnrflp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 443D910E1E0
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Jul 2025 08:35:41 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-3a4fd1ba177so1068818f8f.0
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jul 2025 01:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1751704539; x=1752309339;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ah4SIvptMdwSFRwkpjHC9dZIrJE8W7eJFE6nNgvIwz8=;
 b=sLgnrflpJaIV+1pg7SoEZUBBcSqL1AR1OHPGqjpxF0mN6ekJOe/EdNrtZyMvMYEFG5
 HYZp4qWisYu+YARsL1iaiav9XD7KAe3er8sCfti1oBBakrcQ/34d35L4xrEYtAqBwB7e
 70dQGgtgc8l2z54/RshikLD1SHH0UyjuKvUr94NdjYCotRWHxZDNKyW4c2j5LeTJZ7IF
 kEDQylZspZbqXKf52Dhb5W2WIk7p/KJh7vLIu5ivHE/KJwCINnQMPVjlkVPhRtAwDZVR
 qGVXLsoHRaHOwxuUN4/pRCKHG01SfWDp+s6nYV1z44cYbuKFqN9RYBcTqU4uJj8u9uUb
 5POQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751704539; x=1752309339;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ah4SIvptMdwSFRwkpjHC9dZIrJE8W7eJFE6nNgvIwz8=;
 b=VRwxjFdJPTiudKRGJ3f0w1p4R1Bpld/VbD+F8DIMNBivjMr2SZvLcScO6AWq/zpnOg
 pRSHCRHYal2RleMYoWGb3YO/ou5aSJZnKHNNJ8KaDEuu7UfTEagpD6wDDx9NOkN2kUQM
 7NKIsVtBILMZzZ++Va73XJlNPn99q++I6YSsOXf1w2aqJ8yQy9ni5Uc/EyQsflpHDnbl
 VaYkFzRG47LT/fBeOF6xy0428co8MjydwCmBGT/5PVFEK61BLoZFewT25OPom4KI+nlX
 /aM2TLryyDuJEhpFIY0GtyExCau5Wt98p3jd3P62l7QrmFlPWqoJFeavuHFrcS3HzKtX
 AFmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9E5bHy9tNnyjMC8kFTwJAL8861EMORn4nbMm2vPdtekRwbQNz0osWJpBIODcue2OC4DoSZ+7mScQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxhsNLSMAiIxl1OT22biHroEEX5lX0WBmbxfxd6+8nWDCiI0uo1
 UTb8YbJ0WX6l3hcSZ6f4k4ENFTzew3q1TnvULSVl4aoizYK+zHOroNbiPwTq0lg7z4YhtPGlrD+
 LvVfunRQ8nCVPAFbOgBPt8e1st0k1Oxz/miYrUVhx
X-Gm-Gg: ASbGncu1NObKwkx8U9VWvroSfgoNXszl9ASdRZj0Dr7Q1M8TB+zwxx31clTFaie1/P0
 nRC+q5ehTfjLxL22YqdUp0IZKPgnlkK600GX3Z+XLFNj4jh+qwcCuSk96dBR3tEqCXvC5vhER7b
 IC4nQpcpIxu1Gbf4qUsF2vAWuZ02dps9jPyVmWUUe9nY5YhaMtz8XW5LQ=
X-Google-Smtp-Source: AGHT+IH/pkllT3Sy9Cb1lHriZM/tG78khhI42JnRhbPr8kP9tTs+gtmjri5ZYwhkuP07q9yAkZH9HXYofTd095qzzFE=
X-Received: by 2002:adf:e18f:0:b0:3a4:c71a:8119 with SMTP id
 ffacd0b85a97d-3b495cc4ea6mr5351566f8f.25.1751704539369; Sat, 05 Jul 2025
 01:35:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250704-core-cstr-prepare-v1-0-a91524037783@gmail.com>
 <20250704-core-cstr-prepare-v1-4-a91524037783@gmail.com>
In-Reply-To: <20250704-core-cstr-prepare-v1-4-a91524037783@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sat, 5 Jul 2025 10:35:27 +0200
X-Gm-Features: Ac12FXyGVQLpnmxvOqtVG7V_plS_x4VHl-FkqPG4Jcdo-zfXWt7_Lhls-5TlbKw
Message-ID: <CAH5fLgg=4ZqKh1hqFD9bmGJwUf3LK3=K+Q4tTRPnT+NaMubpLQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] rust: str: remove unnecessary qualification
To: Tamir Duberstein <tamird@gmail.com>
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
 Trevor Gross <tmgross@umich.edu>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org
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

On Fri, Jul 4, 2025 at 10:16=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> `core::ffi::*` is in the prelude, which is imported here.
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
