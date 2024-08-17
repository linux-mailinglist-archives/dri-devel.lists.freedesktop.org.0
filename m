Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 135E7955484
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 03:11:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D69810E866;
	Sat, 17 Aug 2024 01:11:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WLA1ijsk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A79F010E866;
 Sat, 17 Aug 2024 01:11:23 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-e13cda45037so631597276.3; 
 Fri, 16 Aug 2024 18:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723857082; x=1724461882; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ug8rihSZJE889SueAoqTX9ZWSfO/z3Gsu452Tq7F+6A=;
 b=WLA1ijskhCAhZMoS+jW6WDJR1aKPqY9YEMjLqXjDVi5Smu0dcPwdJULRDVT7B8MXHw
 aFxRfQ1iesd7nnDr3l8glNG5jImnD8bKsT8NUfXZrgRbU2305b/UJ3+JNLokD7ljlp4x
 N4wkPbWvyqZFCOIgmASGEkBZWwVsbB3eC4By0U1zdeJTOqXnePGkZM8lpoKocBl4rmf0
 ZKGy8WKvCvSTKy2YBONK9BlEG9CttTaGb0d3Rp5I+nrcQMpGtrdnUTPEXhGHEpjUEdxB
 7udW+Pz5/kiN3bKCgaj/lmIS7bRIQ8qtgpvXIdstqmz6Q6hX0m9S8kcbkKAmq3M971mr
 Jg+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723857082; x=1724461882;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ug8rihSZJE889SueAoqTX9ZWSfO/z3Gsu452Tq7F+6A=;
 b=AFmzEkZSlOBvSGdpdH2vz5yfmCh85RFhIWXV/czT52hc9OXqOvW89prFZkZBvhKL+o
 BHnij/dycq060ZpeLzsrlnxwOOBdpvfnDujIRr4jhsJzVXDjqiYrhFjAb67gtlBz0HC6
 Io4GgC4kQTBCvFJn+VjiiChXLyToafWznhIOAnk5xuUpr6EQDJYU1Pk1JdlkGyxvoWnK
 NzLkOx5jkwEVYSlju4rlm8NveLZRY5T0fjgq7ewbweE44itQ6aEY5tRZDDchbpPRbZj5
 pQ2Bsn3ZWPEe8D1nvhUG9ooqdni5yT3opJA5/OtzjnSVQLiFc8KXkTTvGs6j0FxNLn5R
 8Y+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5B78yrmqp9lBzZmT+QHSBe7Mh/ecUsrh236r0250oZ44botcrFC9Mvgl765mamgmvvXF7+DQxltL1XKhpOg848HzahGqjd0ZmCuQJCUnytbPuKolaUMFmsU08mjJj43ZOsJmp2tEHEps21S7QjE8=
X-Gm-Message-State: AOJu0YxYM7NtOEHHkCrxo1OGovuR5kdRS4mbgoSVHhmS7VOmnLnlP1nA
 BkqKzRQplinBAIoh++KBwONH5ENJ0UwONhcdorbEL8tgw+/XHSiZx8+ch/b+3gEQOSp6GR0Ke/y
 Q4zhaZDtMixPMVTQcJ5CClE4MC8Y=
X-Google-Smtp-Source: AGHT+IEM2mdGVjOsGnMz8WXTnI9118qcDH2jUCIIbDZ4rPiQ10iGBBlTUuDxRR73hnxLfbHp9nYn32+CIgpvlrRB+hI=
X-Received: by 2002:a05:6902:701:b0:e08:5e73:cdf3 with SMTP id
 3f1490d57ef6-e1180e6c54emr4739180276.9.1723857082428; Fri, 16 Aug 2024
 18:11:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240807-macos-build-support-v1-0-4cd1ded85694@samsung.com>
 <CGME20240807110114eucas1p2e1ca4cbd352c6cd9d60688b1570df8d4@eucas1p2.samsung.com>
 <2024080753-debug-roulette-8cb1@gregkh>
 <3jnp6tnkjpvnisefomxagazu2u3uzzt7rcon3r5jssraxzwegb@gsxc7c5sfh7v>
 <2024080758-dedicator-smoky-44be@gregkh>
In-Reply-To: <2024080758-dedicator-smoky-44be@gregkh>
From: Barry Song <21cnbao@gmail.com>
Date: Sat, 17 Aug 2024 13:11:11 +1200
Message-ID: <CAGsJ_4zA6=ajoOgAm9kweeiBFKz4TJxxjYFGHHd3HQY8dxHpWA@mail.gmail.com>
Subject: Re: [PATCH 00/12] Enable build system on macOS hosts
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Daniel Gomez <da.gomez@samsung.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 William Hubbs <w.d.hubbs@gmail.com>, Chris Brannon <chris@the-brannons.com>, 
 Kirk Reiser <kirk@reisers.ca>, Samuel Thibault <samuel.thibault@ens-lyon.org>, 
 Paul Moore <paul@paul-moore.com>,
 Stephen Smalley <stephen.smalley.work@gmail.com>, 
 Ondrej Mosnacek <omosnace@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, 
 James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, Jiri Slaby <jirislaby@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
 Justin Stitt <justinstitt@google.com>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, 
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "speakup@linux-speakup.org" <speakup@linux-speakup.org>, 
 "selinux@vger.kernel.org" <selinux@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, 
 "llvm@lists.linux.dev" <llvm@lists.linux.dev>, Finn Behrens <me@kloenk.dev>, 
 "Daniel Gomez (Samsung)" <d+samsung@kruces.com>,
 "gost.dev@samsung.com" <gost.dev@samsung.com>, 
 Nick Desaulniers <nick.desaulniers@gmail.com>
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

On Thu, Aug 8, 2024 at 2:20=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Aug 07, 2024 at 01:56:38PM +0000, Daniel Gomez wrote:
> > On Wed, Aug 07, 2024 at 01:01:08PM GMT, Greg Kroah-Hartman wrote:
> > > On Wed, Aug 07, 2024 at 01:09:14AM +0200, Daniel Gomez via B4 Relay w=
rote:
> > > > This patch set allows for building the Linux kernel for arm64 in ma=
cOS with
> > > > LLVM.
> > >
> > > Is this a requirement somewhere that this must work?  It seems like a=
n
> > > odd request, what workflows require cross-operating-system builds lik=
e
> > > this?
> >
> > This isn't a requirement, but it would, for example, support workflows =
for QEMU
> > users and developers on macOS. They could build/compile the kernel nati=
vely and
> > use it to launch QEMU instances, simplifying their process.
>
> But that's not a real workload of anyone?  How often does this ever come
> up?  Who is going to maintain this cross-build functionality over time?

it is a real workload of me,  i was running qemu-system-aarch64 on x86
and it was
pretty slow. so got a M3 pro to accelerate my development. frequently chang=
ing
kernel's source code, i am using qemu-system-aarch64 to do quick verificati=
on.

>
> thanks,
>
> greg k-h
>

Thanks
Barry
