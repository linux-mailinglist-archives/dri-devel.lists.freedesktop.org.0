Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A61AD3347
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 12:10:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F3B610E4D9;
	Tue, 10 Jun 2025 10:10:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fhlXrLBU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6E8C10E4D9;
 Tue, 10 Jun 2025 10:10:10 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-313336f8438so861740a91.0; 
 Tue, 10 Jun 2025 03:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749550210; x=1750155010; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZRl5cQXysfFPXL6AFBbaJUkmuUlj4Q8VKoGcUuUjP+k=;
 b=fhlXrLBU/+ZSBU5H+5M49gjoaphC1jJRPveMXJHSgVV1/B/SoBoc0RMXFXJ5WRifv1
 71Z30m0OIfKbMae2Jt+1gCCMmTDy1D7Q6Gnwq9uPUJI0bdotk2KOcW4E2u4V7XsgaD6J
 lpp+Vn3PmNrF+8a65gN0ZACz16T7sqqafyvoenFhpqSuUzHDB/FkTN+yX3mYvTMu6qmF
 CVVT7eRJNsmba8HevJvRkxPWtueusPbEQjhAjum7cQI8xW5RCqczTkIGLo+4mTILchWS
 JYWcfyhdZevYPWhffWCIy1470nYnP2cGgv9+Rw9j9QM9VsQy15MNhF92yH2KrQMcizMM
 mkIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749550210; x=1750155010;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZRl5cQXysfFPXL6AFBbaJUkmuUlj4Q8VKoGcUuUjP+k=;
 b=FQlCt4bf2LAJ56iJ+ELkDxmmK/lVCrERFy3tVZnFHklFkll2aTH2JD5WMykTjb+5EK
 awLoTv+hAx3DCHA24uuAIv4r9KABP8D+K1nhLCMcYo0xTEsyWMiOZFRzAoeVl/2iT+mI
 ezxyd2zqPwXmPGS0dZ/VqkERgSXQfc00Lba2ZVkiVtzvnVZ/q5DmLQj6CIs4PF+SDNGj
 99whIe2cFAqTHZtHjcsr193YwX/QGgQSkRrpwdyX7TBtOGs2PStvyIGl9Qrn8ByeqY0Z
 5KBsaVRmyqtQzMgl4QmhYhh28H3GQgva9f1rAOHWem3mw3K3YOEuOxOwklOsyFufBmg9
 gu8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUu4vEsluGGIRMIR5jRaGF7vMCG3APqSibWE9CYCDDFeAuYWSdJ9cci81js7NT0mfoUvgQxPmb0jWE=@lists.freedesktop.org,
 AJvYcCXDOumHl9wu5gukXIbo6lFsqM17dvIL1GG3TxO1wKKwQfkFNn8mK6vL3HTw8T7AKVHFT4h7mYZKyQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxzYHiD4RjUc3rANPA7r9ONrV1+LHShlaGDgIjIiLkgkTmc3m1J
 kxr4tBcgl1LrJ6Yo8a9O9OkixTOqSS3w/Ix0rJ+mxi2DNCpFBiyb3HpNxNGOgT+bJsrcbwUTDlY
 d389hxMGgBXluHVwT8Y+1Jf4qTGFH5WU=
X-Gm-Gg: ASbGncuOTSo5V/tKq0g8k3FOvfKCSVeRUmmUrbmknkO60U61aB7brtkDjWbnVSM6sqj
 fJv9FiQS0EFRRAxF16U0Xa0Ub9PB9lWXFy8rSo0Dky3cuKXaLRU5fN7BKQ7DqtO0zQaW2LBQdx1
 JD76ym+L3rsUZtTbSY7i9nlSJeRVC+WtcuknX4/2L5Suw=
X-Google-Smtp-Source: AGHT+IEQw155gVvnxaNkH8ebHs4zS3ADdbJBWxomsZZRx1+0u1ykLUMJIIrhF3RC4Mie1dvmIeEaYGc3fpHk7OOd6YQ=
X-Received: by 2002:a17:90b:1dcb:b0:311:c1da:3858 with SMTP id
 98e67ed59e1d1-3134debe401mr8335583a91.0.1749550210201; Tue, 10 Jun 2025
 03:10:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250609122200.179307-1-trintaeoitogc@gmail.com>
 <DAIQ9342ZFYD.3VQVI80A18HKX@kernel.org>
 <CANiq72kC1j-kprAQ5WU0QVV_zhyKfDPJ_M5E9xZ+8+fxt4R6qQ@mail.gmail.com>
In-Reply-To: <CANiq72kC1j-kprAQ5WU0QVV_zhyKfDPJ_M5E9xZ+8+fxt4R6qQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Jun 2025 12:09:58 +0200
X-Gm-Features: AX0GCFsHP1AlO74yO415mgHq99AB0fqU564MM_NdfP0z3sz9Mc_AdfxhNQWL9po
Message-ID: <CANiq72mEfFK-iZ24aX2_UdnvPLXkBLNEFZ9r=y_Mhvu3qHXyuQ@mail.gmail.com>
Subject: Re: [PATCH] rust: module: remove deprecated author key
To: Benno Lossin <lossin@kernel.org>
Cc: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>, rafael@kernel.org,
 viresh.kumar@linaro.org, 
 dakr@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, mcgrof@kernel.org, 
 russ.weight@linux.dev, ojeda@kernel.org, alex.gaynor@gmail.com, 
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
 leitao@debian.org, gregkh@linuxfoundation.org, david.m.ertman@intel.com, 
 ira.weiny@intel.com, leon@kernel.org, fujita.tomonori@gmail.com, 
 tamird@gmail.com, igor.korotin.linux@gmail.com, walmeida@microsoft.com, 
 anisse@astier.eu, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
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

On Tue, Jun 10, 2025 at 12:03=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> I even saw a URL...

i.e. as the sole thing, not as an addition to a company name:

    MODULE_AUTHOR("https://www.comedi.org");

Perhaps we could have a new key or similar for companies/entities, but
I am not sure if it is important, and we should probably do it in the
C side too in that case.

After all, we can get contact details from the Git log, `MAINTAINERS`, etc.

Cheers,
Miguel
