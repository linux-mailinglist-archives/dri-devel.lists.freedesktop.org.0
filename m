Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A82B02E8F
	for <lists+dri-devel@lfdr.de>; Sun, 13 Jul 2025 05:12:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E46910E10D;
	Sun, 13 Jul 2025 03:12:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cNx8e/aZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C3EF10E10D
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Jul 2025 03:12:55 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-711756ae8c9so25742257b3.3
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 20:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752376374; x=1752981174; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PYXSckiGcJNn/KAUw9jmYJc1dN7gwZ3GM+cfuiI1tqw=;
 b=cNx8e/aZuAf0KKcWxkoHZCcrTIqP/kGMqrmj0xLuj8EMXeDZ4vrIQN5eriK0iZMekb
 FXf35ULKXqbazfDOtvcHJsaYWiUXaujz+Rn51unDOyJVA4nvC+5ls3vRqzLuBKixxMM+
 NpTErVQKP/ePp1FClCU9uRatf/W21on9b57c85LgZOQCJS2038K4+KMdchpyZ5A5AWSX
 e5vKbGIxoi+p6X3MGHMEX+haswlwCutm9Hq5MiL0xl9WOcIiSY72BiD9hXc7w2qh17F5
 8Z3nxvRR0DAysQkb6/Z5OedE0S8/V8VxgFTccTeh6/DH4H/loj6iWHCgT8zQeWI5Gfus
 T0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752376374; x=1752981174;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PYXSckiGcJNn/KAUw9jmYJc1dN7gwZ3GM+cfuiI1tqw=;
 b=BbVYZ/zKnL5At77SwjSM1g0m02HPeV6JA8AUBm7U2AWjWAgm4MXV7THK617h/jeeAp
 UOkFfpQy1oOQ4NVCQvWuQYC6TypTEcu5cJcyU5tYJWjhsJ4ohM3/A73gZG7p0vMX5KTV
 HH6c4s3ANdadNusj+a3wgLtcgsEvvdUUERbW8moYVjESMpJDVPbXJ9nnpmSnTaDdRtwR
 k7hjbgNCcukPlidf8ruoo/TQvYe2UuADD65CLzShtH8A7zpyiLqj5HHyudFZAAUaQ2y9
 RqOseG3+3FbDt+VbqhPEX6iQEWz2wVtYCMLbdIgWyhFe9YHe2PovkKAnTin5LmKL2Eev
 lOsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTQ03VzOf3ZUwkRp3KANa/nepTiJ1SzSWVb615sm46rA+W4W8ww0F9ba33wnu9O90BpxG0wh+xAIo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YweuxOmPP5sFdhcJP4255sAMAP28ikHGIfnrhi/asCK1bdxkC9z
 lIBaX+75VRDQTFaP24NV6bKwuRHuOaYJG1QXwKFVZy2QlGRDQ4pgZsiXZKxvyuJihtUhhKdSjyC
 CuLjg3fw9ASijScM0uWYU20m0K2+8QhA=
X-Gm-Gg: ASbGncvdmXAvX8UwONbH/UN1gH4gB75aGVdkPIJLycI+1WVLfaySWmIgOjFs5Bm5zww
 lYaMcizAK/4REJBSqFEexjlxL5Tv4E4USL/vMEG34C6WRqmpE31Sb1Nsiqae0nquh2fPBO7r4Hy
 JSdEOq9cviUeP4wX+sRLpBwkqsvS4LuPE9+PKeC2fa9cwkiA5wIace+mjmNKNjaRFqoH+xAbmiJ
 QyXpLZwUl5R4shyCCLzKa0nf1KgeerGTwyWIhQ=
X-Google-Smtp-Source: AGHT+IFlVubhR76J04TenbEV/VWoM26QXR5CBaA1M4O4pbJbbN8eGEb8aJ8CPVW6NE+SUJ0q8OELnntKt6OBSMfQDPg=
X-Received: by 2002:a05:690c:6113:b0:70d:ecdd:9bd1 with SMTP id
 00721157ae682-717d5e9310emr135689227b3.24.1752376373865; Sat, 12 Jul 2025
 20:12:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250620235053.164614-1-olvaffe@gmail.com>
 <20250620235053.164614-3-olvaffe@gmail.com>
 <20250623082122.62f69579@fedora>
 <aFkZaoPXkZWaqWID@e110455-lin.cambridge.arm.com>
In-Reply-To: <aFkZaoPXkZWaqWID@e110455-lin.cambridge.arm.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Sat, 12 Jul 2025 20:12:43 -0700
X-Gm-Features: Ac12FXy3WPTrrjYpoDpqZLdmXP9qM0fxFoDRqaumTNKzbc-mSJMltJnSf0MnYdk
Message-ID: <CAPaKu7R57KE+VFNYxaaUBCph__U5kN7xS=FSVsLzh+c=S1cp2Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] panthor: save panthor_file in panthor_group
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
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

Hi,

On Mon, Jun 23, 2025 at 2:07=E2=80=AFAM Liviu Dudau <liviu.dudau@arm.com> w=
rote:
>
> On Mon, Jun 23, 2025 at 08:21:22AM +0200, Boris Brezillon wrote:
> > On Fri, 20 Jun 2025 16:50:51 -0700
> > Chia-I Wu <olvaffe@gmail.com> wrote:
> >
> > > We would like to access panthor_file from panthor_group on gpu errors=
.
> > > Because panthour_group can outlive drm_file, add refcount to
> > > panthor_file to ensure its lifetime.
> >
> > I'm not a huge fan of refcounting panthor_file because people tend to
> > put resource they expect to be released when the last handle goes away,
> > and if we don't refcount these sub-resources they might live longer
> > than they are meant to. Also not a huge fan of the circular referencing
> > that exists between file and groups after this change.
> >
> > How about we move the process info to a sub-object that's refcounted
> > and let both panthor_file and panthor_group take a ref on this object
> > instead?
>
> I agree with Boris on this. One alternative is to put the pid and comm in
> the panthor_group struct as panthor_file makes no use of the fields.
I took this suggestion in v2 because, when the task that opened the
node differs from the task that created the group, we are more
interested in the latter.
