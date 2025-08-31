Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A29B3D563
	for <lists+dri-devel@lfdr.de>; Sun, 31 Aug 2025 23:42:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E04010E044;
	Sun, 31 Aug 2025 21:42:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JH6hNU0M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E45B610E02B;
 Sun, 31 Aug 2025 21:42:22 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-3d0b6008a8bso1056276f8f.0; 
 Sun, 31 Aug 2025 14:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756676541; x=1757281341; darn=lists.freedesktop.org;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=XrWnjGupWDAHdXimUfuC/NSyB9S8VAE4YTcPqsyV2zU=;
 b=JH6hNU0MQyJriAP0IQnGleNlkHdGS369nfJyLvJoxJZJI/+RjkGh30NMjuEv3tKkgT
 lQZGrulREumYuc85ru+9h49ZrKcl3FsK8jx+SGPfNS1MD+lQSFY072VQM8ymIzqr5anb
 Eg+oqWQ3oeqdh+QNq2rXJ1ddCzAbLGifKDAMUuuJW8Q7GOMKmdSDLFPTimsyz1ej10j0
 4pIEazqw9KsuiE079RyQsUWOrgkadko2/IkAaaO9vgW6Avij8eLnkjscK6GRrtNgzkVu
 uRBpHOH5lgGbpSthiwPWbyDy5f5vu4S/chSkp8sf3ZQ1qeA7LwqLG73ZcD095Hc07m1f
 s2/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756676541; x=1757281341;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XrWnjGupWDAHdXimUfuC/NSyB9S8VAE4YTcPqsyV2zU=;
 b=KlmShWEYydbTJRxNdvhCw59sk1AgTtMiLQK1oF/jt20sHedHawy62lJMCwBWAntyNZ
 VCJEqJKlN8LgTPDjM11uM7dEDkbJcH1K8lSyhXgS8mAizGr4qEB2xQrdGKAjOVPBVV8D
 +yjhpWLv51QpksEy1PRxHogPEwh0n5MeTOMRBWU0Begos9kf4M2Z+c12z3LDkbYzhwL8
 1w/ScNawbCAjVXNPnmRiw8gRiNP1gnfbMBpxnk7S/xJPKCia+alZuhxY59segdvoITZy
 bBwpuox4LefVld0YF9irC7sslENUyj9PrIEeu78Jo8TPFXEIujYbY+p2ZHQ5Z9MZG2Tv
 I5EA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNhgdOp1QKb/XhIZD6uKp/erCkqldUBtVT2zMCzgu5BSM9Rn5Vg+D9P2YQqruuarSH41Y40V2EzyI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwnvTFXwcE9SJau994L1tI1AUA62HcAVtcH+C4k8VOF0KU3V7sJ
 Eb13PxymWXn2rkZ7HyH4KYfy9iJIq0bGLEhnvk/dpNFNIIm6ErL0J2TF
X-Gm-Gg: ASbGncs5Zyx/kvrkHeHu0Y9RNbgxNK/vYTjddEtlJcro1au1wv9ujGpkZAtFMw8EdvH
 LBXVdnbi8EMYajF2SwIq9oTmUlTbBwvNTBQzQApf/XzMfJkwwI6x6qHqih/1qvlbaW8kIBIjsca
 HD4nk+crCencUISS364GIQsDklBqExMmQBoHuOx9BZiUrZ6KN+4n6pFdwBrPwhLQ2wilrCjHCOC
 kMCG6hODF870Wnc50bbaocePCaJ/ebi6BYQ0JVvA+Catbu2t5FU59pWeblOK4YrikfZ8jFbKDhA
 9mzjFhcZ3N2x6oDIf1oYJPoIuMNwxDAs+8bgyi4wdr8fLisv8F/3wT2llwPA6Mn1FAB7ohGf+o3
 PyLvbv28RWSSAkuiKHXMmJqCBCeeAxicQhO0vzFJo8h2ouWAWM0i4TKjdD3eqGVgzML1ibAB79z
 CCcQ6tUdLZAZUZBztsF1mnv03t+kVyRUn79NaochTP65Z6cuM+zfLyrpa64Q30zvxY/ORF+RCD
X-Google-Smtp-Source: AGHT+IEcpg8XF4kOOyrGus10eY7b1mwm4xr5kWKrRe8C/RxRerNfYyIyHxVayFHtIZ1srX+bh6hP3Q==
X-Received: by 2002:a05:6000:2007:b0:3cf:3477:6bb7 with SMTP id
 ffacd0b85a97d-3d1e0a9424cmr5087701f8f.60.1756676541056; 
 Sun, 31 Aug 2025 14:42:21 -0700 (PDT)
Received: from ?IPv6:2001:4c4e:24c1:9400:d6ab:39bc:9d60:a351?
 (20014C4E24C19400D6AB39BC9D60A351.dsl.pool.telekom.hu.
 [2001:4c4e:24c1:9400:d6ab:39bc:9d60:a351])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b69b7529asm127855375e9.0.2025.08.31.14.42.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Aug 2025 14:42:20 -0700 (PDT)
Message-ID: <14a9ed202a304fe895719f406633e79fe16e8535.camel@gmail.com>
Subject: Re: evergreen_packet3_check:... radeon 0000:1d:00.0: vbo resource
 seems too big for the bo
From: Timur =?ISO-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>
To: Borislav Petkov <bp@alien8.de>, Alex Deucher <alexdeucher@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, 	linux-kernel@vger.kernel.org
Date: Sun, 31 Aug 2025 23:42:19 +0200
In-Reply-To: <20250830174810.GAaLM5WkiFc2BtQ6kW@fat_crate.local>
References: <20250829171655.GBaLHgh3VOvuM1UfJg@fat_crate.local>
 <CADnq5_Oqonrth+5T-83dnFBZ67GvykkPt-9aUepJd+fUMwnupw@mail.gmail.com>
 <20250829194044.GCaLICPKJcGJRYdSfO@fat_crate.local>
 <20250829204840.GEaLISKGTwuScnDF8Y@fat_crate.local>
 <CADnq5_MbpYmC2PSyOr0gQk7F8mVz0-LG3dZtUZS2HhV8LTgDww@mail.gmail.com>
 <20250830174810.GAaLM5WkiFc2BtQ6kW@fat_crate.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
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

On Sat, 2025-08-30 at 19:48 +0200, Borislav Petkov wrote:
>=20
>=20
> With newer MESA (version 9.0.2 in Debian), the message


Which Mesa version do you use exactly?
Are you sure that version number is correct?

Mesa 9.0.2 was released on January 22nd, 2013, more than 12 years ago.

Timur
