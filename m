Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFB4BBEADF
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 18:40:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F79110E42C;
	Mon,  6 Oct 2025 16:40:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YauurWJr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED4A210E42D
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 16:40:33 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-b552e730f4aso68367a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 09:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759768833; x=1760373633; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LBA6fOaVmQat7EDMxIX5UPGSZ7U9w/6YSIQNIRnUw64=;
 b=YauurWJrREVBnozB2Q7B+T94yIsqTkvl2kzowEVT9V9GsgwkF2Z8hpEp9DefnjWUUS
 M1MCm0rsIT3vYrKkKpDubIE06MpEx33AuGZt1GHFgmHJxYzybCV3Llo90F+FwR5xJVQy
 CsMup65BngHZFS8Ysl61TrFZrujfUtO68FVIzhTSAkjMyqne0thiNtpJkWEFGJE65/yF
 7j/D6r0dX9NOwm+ZLOEhAntirlYA6PfY6YBLcF+ixg6USEGbQrSCISyH1iTyWyrwbaKv
 ctAF+wFNAcyPksaOaUBKjLXKg/6QWOZLhZAOV8rRvnXCImuuR7BCgj8e9EzSxngh2tFJ
 b3jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759768833; x=1760373633;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LBA6fOaVmQat7EDMxIX5UPGSZ7U9w/6YSIQNIRnUw64=;
 b=W485B6HF/6cHQ6JK1fArUOaB93svxp4SR9yQQgAACjoAqEJIe11OzV7by86UWTcGVL
 uQyEhMG2LFx2QmCi0jqDr/fLTGaryoMGAfsZZHvzC1YR0bwiRIfgu7UzRkfq+ntTOjhH
 g+ya+HHMzhDeO1oIAboMCnMhq2o7876siBI0xcLCxol+ce2oS8ciFcYfz6/vsI6sFmEF
 wb03dB6GKUaNk3hasnHfls/GK8t3UTxl6r9zOfZ8eyd8yTEqK7ZXgsS4gyx7YrGf4ave
 a0ZaSJ+URE9F+9QtelQJnMjiGBLOEsPIzeIsa8COfN9Yim0duRg+txLS6QbHAdfAe/bN
 DXIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVq2rOLLRROc6XtW70URz5ejRelJQXRlcy7pKO257XcKMJ/Xh/zo4t4R4/D7/sNQ1I6XAyCKDF1w7E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDUWnRWDZTlIX+pq5j9yjwElQTSpRwWqhhqSqOCEZfOgPqzgSV
 +tA0HlIqAOuDXU0DrlcKBlMg8bTSmdv+soMEs4CQulnudiHopi4vcAz+yQMh9hxn8gsQCkgxV6N
 +KUNwcGLybqTs1Q6snMh/tws0+lmH+68=
X-Gm-Gg: ASbGnctCOJ9rxdvvM2qKJCfcj9PYAokN3W59Gn5bvmEzUT3toADq1/2uqlSU/dHqL+U
 9EqfxnhwUslFwJ9B3t1LjZxVRz4JTaoxN1EfDZzeMdRe8fiTppDcs4H4VX+yveVa4u9Z/KTvSmY
 oJ8LYseYraJnH/UdgK22m5PMNFr/zs5bleDECdUA95ilns1dScvtSf368VwBEJhtMxI1Kejn/Jt
 KfAytHPmetexJxcaKnQjK6iVLyUAQ3SBkPBCZTsiP8OaQSWTVMLpjJ72Ve/lZpMYT3i2nkob/Kr
 AUtdK26Hgdq3JLH+oTSMvG5aKZ3H9TNTUQ2iPjyxfDIpVIlB2Jzzwce2JuiY
X-Google-Smtp-Source: AGHT+IED5q3x4DCSIrQmSNaI/hNM8JVZko4zCwH8pMSwHQyx8XQQtYie0DUOqb6XI3JebRYkGwAJqCnOXAShGoi26PE=
X-Received: by 2002:a17:902:d4cb:b0:25c:b66e:9c2a with SMTP id
 d9443c01a7336-28e9a6d01b1mr103155035ad.6.1759768833343; Mon, 06 Oct 2025
 09:40:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250930144537.3559207-1-joelagnelf@nvidia.com>
 <20250930144537.3559207-7-joelagnelf@nvidia.com>
 <DD7GCYCZU3P3.1KK174S7MQ5BW@nvidia.com>
 <81490b32-6ea2-400f-a97e-ad2e33e6daab@nvidia.com>
 <DD949OHGD5WP.1X9TCLIEKSHGB@nvidia.com>
 <4324469D-4C47-441E-9AD3-54CEE379537C@nvidia.com>
In-Reply-To: <4324469D-4C47-441E-9AD3-54CEE379537C@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Oct 2025 18:40:20 +0200
X-Gm-Features: AS18NWCxy-Hq0OsmWL4xZOPiIrqjK1XDIHFlDGJPGtRa1Eva01va6UDuU96QULw
Message-ID: <CANiq72mC5pWz92KYtOhtgOcMuTeuzOeM9xrbkna+HkrwHAQqVw@mail.gmail.com>
Subject: Re: [PATCH v5 6/9] rust: bitfield: Add KUNIT tests for bitfield
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, 
 Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, 
 "joel@joelfernandes.org" <joel@joelfernandes.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>, 
 Yury Norov <yury.norov@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Andrea Righi <arighi@nvidia.com>, 
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
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

On Sat, Oct 4, 2025 at 6:14=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.co=
m> wrote:
>
> Well, it can be efficient. It really depends. I have been contributing up=
stream for about 15 years if you see the git log, often when someone chats =
privately with me like you did and they told me they are ok with a patch, I=
 save them the trouble and add their review tag especially after they alrea=
dy added their tag to all my other patches. Surprisingly though this is pro=
bably the first time anyone has been pissed off about it.  Anyway I will no=
t add your tag henceforth unless you publicly reply (or you let me know oth=
erwise by chat).

If they just say they are OK with a patch, that would just mean an
Acked-by, not a Reviewed-by.

In any case, the documentation states those tags cannot be added
without permission -- if someone gives you a tag privately, it is best
that you tell them to please send it in the mailing list instead. That
way there is no confusion and others (including tooling, e.g.
patchwork and b4) can see it.

Thanks!

Cheers,
Miguel
