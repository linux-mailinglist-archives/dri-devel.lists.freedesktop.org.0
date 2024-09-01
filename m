Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5A8967761
	for <lists+dri-devel@lfdr.de>; Sun,  1 Sep 2024 18:15:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F162C10E09F;
	Sun,  1 Sep 2024 16:15:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="F5h1/eNL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCA8D10E09F;
 Sun,  1 Sep 2024 16:15:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 904925C3A63;
 Sun,  1 Sep 2024 16:15:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C7FAC4CEC4;
 Sun,  1 Sep 2024 16:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725207338;
 bh=gYIgZOi4sdR4hTdNE3LJJ3LeXGN5BLGNfkofNqnsRBc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=F5h1/eNLAut+K9xbInA8o1Vqa2sZpvVnt33i+mDoFpaubGehtbFtkTdZKWa1mvOQU
 CSsiRwCvOWvZvMvEO8L0Dsxwyr89B9qMvVFfrWbzq6Z8wKms7E7vADuGZJavaJ+Yq9
 ddCRkatwMBI2yP8xVSOJokY6nLAtiaa47fyw12UjAMSKYqFuQqVvxjY3Vk9ZgQzRoc
 6bOCtTkFHWjSazc04tEnJCsudAEBR8Pcv/himZ9VWJRdbe++qCe48wzQKqTx7uOX07
 J7ewjUPy7qvCfaKAR8hR3puGLgD0egOP9gXsf94jOOO8lGHC7jbxrL/PZ8tNivTSUu
 C2srQRHZ3LE7g==
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-53346132348so4320881e87.2; 
 Sun, 01 Sep 2024 09:15:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWW1tZQXVM+za6OWwiX8MUi3lwqZR5NaNDZJ0me/fg62g8Kdfp5LKCmHPrTICpnqupPprT8NQ1n4pg=@lists.freedesktop.org,
 AJvYcCX5mDGPw+1qFupqz0TMZ0ilCJTqjxaAmRxBQ8+81/unkDXL1+VeA0kNLGX7sSSZ7dnW6/Mx8/OH2C4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBkaJiM3mC3WX1XkSKUFzI5760IXJefEGu7rljbGh7VqlKBqIB
 PrL+m+RyXd03kxVLTUmRlYDcHDbidKj3pjQBNeFeV3NK71LVejMUAQfNa+yGMiopuO6SvqCG6xQ
 JC9SBLQftxeBX6/mvY5VPoZ/+U8I=
X-Google-Smtp-Source: AGHT+IEvW4vK5zxx451a7ZmsPELGu2ASm3u0aIbHJUwKBVb/P5sQhkJtI91jLzLi0FROvKEcgj/L3zpZL4SS+3Wibx0=
X-Received: by 2002:a05:6512:282b:b0:533:d3e:16e9 with SMTP id
 2adb3069b0e04-53546bb4402mr4892938e87.57.1725207337206; Sun, 01 Sep 2024
 09:15:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240807-macos-build-support-v1-0-4cd1ded85694@samsung.com>
 <20240807-macos-build-support-v1-8-4cd1ded85694@samsung.com>
 <CGME20240807110435eucas1p2eca071b0a0122b8686d43c57bd94dc8c@eucas1p2.samsung.com>
 <2024080717-cross-retiree-862e@gregkh>
 <dxkmmrlhlhsrjulnyabfgcr37ojway2dxaypelf3uchkmhw4jn@z54e33jdpxmr>
 <2024080720-skyline-recapture-d80d@gregkh>
 <20240807-mottled-stoic-degu-d1e4cb@lindesnes>
 <20240823225450.spuvjs5b5ruujim4@AALNPWDAGOMEZ1.aal.scsc.local>
 <ZtIjNBhqdxmMBxfM@fjasle.eu>
In-Reply-To: <ZtIjNBhqdxmMBxfM@fjasle.eu>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 2 Sep 2024 01:15:01 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQhHBi7nSG5SAbqD3HFO3uMR6GHckZHcQXgWao7G8i9gw@mail.gmail.com>
Message-ID: <CAK7LNAQhHBi7nSG5SAbqD3HFO3uMR6GHckZHcQXgWao7G8i9gw@mail.gmail.com>
Subject: Re: [PATCH 08/12] include: add elf.h support
To: Nicolas Schier <nicolas@fjasle.eu>
Cc: Daniel Gomez <da.gomez@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Nathan Chancellor <nathan@kernel.org>,
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
 "gost.dev@samsung.com" <gost.dev@samsung.com>
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

On Sat, Aug 31, 2024 at 4:54=E2=80=AFAM Nicolas Schier <nicolas@fjasle.eu> =
wrote:
>
> On Sat, Aug 24, 2024 at 12:54:50AM +0200 Daniel Gomez wrote:
> > On Wed, Aug 07, 2024 at 05:46:03PM +0200, Nicolas Schier wrote:
> > > On Wed, Aug 07, 2024 at 04:18:54PM +0200, Greg Kroah-Hartman wrote:
> > > > On Wed, Aug 07, 2024 at 02:13:57PM +0000, Daniel Gomez wrote:
> > > > > > Also, as this is not internal for the kernel, but rather for us=
erspace
> > > > > > builds, shouldn't the include/ path be different?
> > > > >
> > > > > Can you suggest an alternative path or provide documentation that=
 could help
> > > > > identify the correct location? Perhaps usr/include?
> > > >
> > > > That is better than the generic include path as you are attempting =
to
> > > > mix userspace and kernel headers in the same directory :(
> > >
> > > Please keep in mind, that usr/include/ currently does not hold a sing=
le
> > > header file but is used for dynamically composing the UAPI header tre=
e.
> > >
> > > In general, I do not like the idea of keeping a elf.h file here that
> > > possibly is out-of-sync with the actual system's version (even though
> > > elf.h should not see that much changes).  Might it be more helpful to
> > > provide a "development kit" for Linux devs that need to build on MacO=
S
> > > that provides necessary missing system header files, instead of mergi=
ng
> > > those into upstream?
> >
> > I took this suggestion and tried pushing a Homebrew formula/package her=
e [1].
> > I think I chose a wrong name and maybe something like "development kit"=
 would
> > have been better. However, would it be possible instead to include the =
*.rb file
> > in the scripts/ directory? So users of this can generate the developmen=
t kit in
> > their environments. I would maintain the script to keep it in sync with=
 the
> > required glibc version for the latest kernel version.
> >
> > [1] https://github.com/Homebrew/homebrew-core/pull/181885
>
> I think it sounds sensible to hold that formula file in the upstream tree=
.  But
> I am not sure if scripts/ is the best location.
>
> Masahiro, what do you think?


I do not know much about the homebrew, but why does the upstream
kernel need to merge such masOS stuff?



>
> Kind regards,
> Nicolas



--=20
Best Regards
Masahiro Yamada
