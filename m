Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15127D3A8FB
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 13:35:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68EEC10E433;
	Mon, 19 Jan 2026 12:35:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="lDfevKGL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D65910E430
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 12:35:24 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-4803b4e3b9eso1151595e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 04:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1768826123; x=1769430923;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=L339R8Vsk/eWURHJ0AqPSpw3w1NFXPchbsihcVaLjUM=;
 b=lDfevKGL1CbZSNC94NzsUR9KdXLqYDXCPwCLc3P1AAomrvWtURXfCeUo2S3xyIqY/O
 VvLZt096Dg8AtfF8dLEVXQonDnzNjchZ1pyXTYXY/qeW6D/PG/8gLnhnhMCkt77yWtuB
 14NY9FHEii3Tdu3jrr+rHSQLm7MEIeJkYoi8TVgmc93jrZxfo4d8qG9KI/lVl4CjhsN1
 EZ/mztYFjyjbyqz8Cf7dl1L6Yp3hP4BuTUwV/vANj414lH0V0hkidfuv5A0onfyZlqWX
 wKRcCW1s36Q/nrs6zQ/GHYt1yt3HpkE0ol4Q7VjWlmcJeETo6++egotBAIEEXErlmMDl
 Up7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768826123; x=1769430923;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=L339R8Vsk/eWURHJ0AqPSpw3w1NFXPchbsihcVaLjUM=;
 b=fVxUo82q5ai6Z9kGMmGvG3+4raYyVQvglXHKjdwSTllduBP5KdpO/2Q8GNYyCDw0Xh
 ciNbr3mzARzOMc/lFu3jGjGRlASmFhZsI1Ll6QijBkwSKF+i2DsmabPULxjUV0Ft+C2M
 gu820y0TFqjKKWvyhc89YimWetI5ZlYeEnme4dxU2xoK3bNfFJtYs1z/m0cpXE3se7p0
 7HNgdnOP2uK/td5ymQs8dPyQc+kc2PalqNixzgIoELj57vpuRosduJU25NTccRykCT5z
 BuNLPeQ4a0cTWiJ9TfzKgog5NYwhGqkXGGjpxDSZUNvJ44VipBWjLObOr4OoG+PPjErK
 NbXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGyBgnLn5e24g2gVEr8v/JNtcoPATLDOF3X1ql1g5guxEl5feimRdw8npu/u9klGVml99T/wG1YbA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwBS8gc10cIxr9FSk7keUjZFOuT58FvJNmHoARvcx1Fmjdo7Ffu
 I7300jxgIZadBEY2M32gh2UDxeeGZmNlz67jWhKDWYrHAKIPHZUB9i4AOidBoJFHigd4nBPD22Q
 TiBTnR3k9GY1E4z1NUg==
X-Received: from wmbh20.prod.google.com ([2002:a05:600c:a114:b0:47d:586e:2b7b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:811a:b0:480:1dc6:2686 with SMTP id
 5b1f17b1804b1-4801eac0cfcmr114218055e9.13.1768826122871; 
 Mon, 19 Jan 2026 04:35:22 -0800 (PST)
Date: Mon, 19 Jan 2026 12:35:21 +0000
In-Reply-To: <20260119-thundering-tested-robin-4be817@houat>
Mime-Version: 1.0
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
 <20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com>
 <20260108-delectable-fennec-of-sunshine-ffca19@houat>
 <98CD0BF6-3350-40B9-B8A9-F569AE3E3220@collabora.com>
 <20260119-thundering-tested-robin-4be817@houat>
Message-ID: <aW4lCfUyumOKRRJm@google.com>
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
From: Alice Ryhl <aliceryhl@google.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Drew Fustini <fustini@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
 "Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=" <ukleinek@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 "=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
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

On Mon, Jan 19, 2026 at 11:45:57AM +0100, Maxime Ripard wrote:
> On Thu, Jan 08, 2026 at 11:14:37AM -0300, Daniel Almeida wrote:
> > > For example, it's quite typical to have (at least) one clock for the =
bus
> > > interface that drives the register, and one that drives the main
> > > component logic. The former needs to be enabled only when you're
> > > accessing the registers (and can be abstracted with
> > > regmap_mmio_attach_clk for example), and the latter needs to be enabl=
ed
> > > only when the device actually starts operating.
> > >=20
> > > You have a similar thing for the prepare vs enable thing. The differe=
nce
> > > between the two is that enable can be called into atomic context but
> > > prepare can't.
> > >=20
> > > So for drivers that would care about this, you would create your devi=
ce
> > > with an unprepared clock, and then at various times during the driver
> > > lifetime, you would mutate that state.

The case where you're doing it only while accessing registers is
interesting, because that means the Enable bit may be owned by a local
variable. We may imagine an:

    let enabled =3D self.prepared_clk.enable_scoped();
    ... use registers
    drop(enabled);

Now ... this doesn't quite work with the current API - the current
Enabled stated owns both a prepare and enable count, but the above keeps
the prepare count in `self` and the enabled count in a local variable.
But it could be done with a fourth state, or by a closure method:

    self.prepared_clk.with_enabled(|| {
        ... use registers
    });

All of this would work with an immutable variable of type Clk<Prepared>.

> > > AFAIU, encoding the state of the clock into the Clk type (and thus
> > > forcing the structure that holds it) prevents that mutation. If not, =
we
> > > should make it clearer (by expanding the doc maybe?) how such a patte=
rn
> > > can be supported.
> > >=20
> > > Maxime
> >=20
> > IIUC, your main point seems to be about mutating the state at runtime? =
This is
> > possible with this code. You can just have an enum, for example:
> >=20
> > enum MyClocks {
> >     Unprepared(Clk<Unprepared>),
> >     Prepared(Clk<Prepared>),
> >     Enabled(Clk<Enabled>),=20
> > }

I believe you need an extra state if the state is not bound to the scope
of a function:

enum MyClocks {
    Unprepared(Clk<Unprepared>),
    Prepared(Clk<Prepared>),
    Enabled(Clk<Enabled>),=20
    Transitioning,
}

since mem::replace() needs a new value before you can take ownership of
the existing Clk value.

> > In fact, I specifically wanted to ensure that this was possible when wr=
iting
> > these patches, as it=E2=80=99s needed by drivers. If you want to, I can=
 cover that in
> > the examples, no worries.
>=20
> Yes, that would be great. I do wonder though if it wouldn't make sense
> to turn it the other way around. It creates a fair share of boilerplate
> for a number of drivers. Can't we keep Clk the way it is as a
> lower-level type, and crate a ManagedClk (or whatever name you prefer)
> that drivers can use, and would be returned by higher-level helpers, if
> they so choose?
>=20
> That way, we do have the typestate API for whoever wants to, without
> creating too much boilerplate for everybody else.

I think that if you still want an API where you just call enable/disable
directly on it with no protection against unbalanced calls, then that
should be the special API. Probably called RawClk and functions marked
unsafe. Unbalanced calls seem really dangerous and use should not be
encouraged.

The current type-state based API is the least-boilerplate option for
drivers that exist today.

Alice
