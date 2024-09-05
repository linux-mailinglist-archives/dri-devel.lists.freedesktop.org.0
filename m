Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F001496E694
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 01:59:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE9010E594;
	Thu,  5 Sep 2024 23:58:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="B5eOm0Co";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1B8910E594;
 Thu,  5 Sep 2024 23:58:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7682CA4409F;
 Thu,  5 Sep 2024 23:58:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5CD1C4CECF;
 Thu,  5 Sep 2024 23:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725580734;
 bh=8ZHNDVjmXPanHn2/Wa0JiV+2BK75PQlWnht1eUfa8vI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=B5eOm0CoMNNtBGAfzLYf8iSwLLiY/j7DStFcMfcnkf9CEVGR2+rzAvHpdqU1ufPAz
 ZXNBWrkrzKbQ0dPoU+m9kiZZy2mf1ax8lTPOVLHG4OfaI/6QCwA/KkJ8uw2DhmYEX+
 jqAFae7PHeufingMEUSCO/HyhPfYewM66O9VK5YcU3IFfULOAbUILhiNODGo/zoF+U
 QFkYv+fmmy6KA3KdsyUVWIB4XzK5/8Lr2BUsMj1j79Xh3Jf6+abGf4pfmOS7lHIzWX
 KLUQBlKoGvLO3jcTevRA6vQ1NIOa9Esc4apvfVRmuh5VUBi4BdBKP8cHdpNYisvQga
 b6jqytV8FYQLQ==
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2f74e468aa8so12609161fa.1; 
 Thu, 05 Sep 2024 16:58:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUQjOuCxkmMdcR/lvqyAh0em/sJ8x3NznbXa0cmF0RHMXjNZkx8ON/2zu5eZQAy4kG20KsMBojsdx8=@lists.freedesktop.org,
 AJvYcCWJTLm+VSSO71Vm76cyof7Xtel4Q3LmpeUpnqHLLG2AVLbYHJcXP1w+Tf0RnVVxr7EOr8y82pTNxoA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKrtE/pIV5ph6ir1kHM2cqOyile++e7ZhMxTTrJu53UEuXeA9U
 Df7WEx2JCaQqvM7WcwG7AJ9cBeC0BpdwKOHng6EObsbY4j/EkvwWcn9gBAERAXtlvQ5K1L04mJ4
 wKDGIoyWvxi84zaj8cQl6SFi4FtE=
X-Google-Smtp-Source: AGHT+IHwpQbkJrhmqboJoKb4jCLkJYJBTykwt13Bk4HzG9cGEgSCAjDEko9J5cj0FalKeiGaalBZ5m+OpradSeMR65w=
X-Received: by 2002:a05:651c:542:b0:2f0:1a8f:4cd2 with SMTP id
 38308e7fff4ca-2f75249602fmr3868171fa.33.1725580733429; Thu, 05 Sep 2024
 16:58:53 -0700 (PDT)
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
 <CAK7LNAQhHBi7nSG5SAbqD3HFO3uMR6GHckZHcQXgWao7G8i9gw@mail.gmail.com>
 <20240905085626.ehhc5p7qwi57dagm@AALNPWDAGOMEZ1.aal.scsc.local>
In-Reply-To: <20240905085626.ehhc5p7qwi57dagm@AALNPWDAGOMEZ1.aal.scsc.local>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 6 Sep 2024 08:58:15 +0900
X-Gmail-Original-Message-ID: <CAK7LNASt2eP6q46YP0hCN=f5frt5r5qmwj25tiYrxjwOmGOwEg@mail.gmail.com>
Message-ID: <CAK7LNASt2eP6q46YP0hCN=f5frt5r5qmwj25tiYrxjwOmGOwEg@mail.gmail.com>
Subject: Re: [PATCH 08/12] include: add elf.h support
To: Daniel Gomez <da.gomez@samsung.com>
Cc: Nicolas Schier <nicolas@fjasle.eu>,
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

On Thu, Sep 5, 2024 at 5:56=E2=80=AFPM Daniel Gomez <da.gomez@samsung.com> =
wrote:
>
> On Mon, Sep 02, 2024 at 01:15:01AM +0900, Masahiro Yamada wrote:
> > On Sat, Aug 31, 2024 at 4:54=E2=80=AFAM Nicolas Schier <nicolas@fjasle.=
eu> wrote:
> > >
> > > On Sat, Aug 24, 2024 at 12:54:50AM +0200 Daniel Gomez wrote:
> > > > On Wed, Aug 07, 2024 at 05:46:03PM +0200, Nicolas Schier wrote:
> > > > > On Wed, Aug 07, 2024 at 04:18:54PM +0200, Greg Kroah-Hartman wrot=
e:
> > > > > > On Wed, Aug 07, 2024 at 02:13:57PM +0000, Daniel Gomez wrote:
> > > > > > > > Also, as this is not internal for the kernel, but rather fo=
r userspace
> > > > > > > > builds, shouldn't the include/ path be different?
> > > > > > >
> > > > > > > Can you suggest an alternative path or provide documentation =
that could help
> > > > > > > identify the correct location? Perhaps usr/include?
> > > > > >
> > > > > > That is better than the generic include path as you are attempt=
ing to
> > > > > > mix userspace and kernel headers in the same directory :(
> > > > >
> > > > > Please keep in mind, that usr/include/ currently does not hold a =
single
> > > > > header file but is used for dynamically composing the UAPI header=
 tree.
> > > > >
> > > > > In general, I do not like the idea of keeping a elf.h file here t=
hat
> > > > > possibly is out-of-sync with the actual system's version (even th=
ough
> > > > > elf.h should not see that much changes).  Might it be more helpfu=
l to
> > > > > provide a "development kit" for Linux devs that need to build on =
MacOS
> > > > > that provides necessary missing system header files, instead of m=
erging
> > > > > those into upstream?
> > > >
> > > > I took this suggestion and tried pushing a Homebrew formula/package=
 here [1].
> > > > I think I chose a wrong name and maybe something like "development =
kit" would
> > > > have been better. However, would it be possible instead to include =
the *.rb file
> > > > in the scripts/ directory? So users of this can generate the develo=
pment kit in
> > > > their environments. I would maintain the script to keep it in sync =
with the
> > > > required glibc version for the latest kernel version.
> > > >
> > > > [1] https://protect2.fireeye.com/v1/url?k=3D96027706-f7896236-9603f=
c49-000babffaa23-452f645d7a72e234&q=3D1&e=3D343dd31c-5e5b-4b09-8ee5-6c59a1f=
f826e&u=3Dhttps%3A%2F%2Fgithub.com%2FHomebrew%2Fhomebrew-core%2Fpull%2F1818=
85
> > >
> > > I think it sounds sensible to hold that formula file in the upstream =
tree.  But
> > > I am not sure if scripts/ is the best location.
> > >
> > > Masahiro, what do you think?
> >
> >
> > I do not know much about the homebrew, but why does the upstream
> > kernel need to merge such masOS stuff?
>
> The missing headers (in macOS) need to be provided somehow. One way can b=
e
> having the formula (*.rb file) in-tree, so users of this can install them=
 in
> their systems. This would also require to have a tarball with the missing
> headers either in-tree or somewhere accessible so it can be fetched.
>
> To avoid having the formula and a tarball in-tree, I've created a Homebre=
w Tap
> (3rd-Party Repository) called 'Bee Headers Project' [1][2][3] that can pr=
ovision
> the missing headers. The project provides a bee-headers package and formu=
la
> that will install byteswap.h, elf.h and endian.h in the user's system Hom=
brew
> directory. It also provides a *.pc file so pkg-config can be used to find=
 the
> location of these headers. I have a v2 with this solution ready, perhaps =
is
> easier to discuss this with the code.


It is up to you what project you start in Github.

Then, what do you need to submit v2 for this?





>
> I think we can extend the same package and include extra headers if we ne=
ed
> more in the future. I see for x86_64 asm/types.h and others might be requ=
ired.
> The bee-headers package can then be the repository to place and distribut=
e them.
>
> Please, let me know if you think of an alternative solution, I can give a=
 try
> and explore.
>
> [1] Project:
> https://github.com/bee-headers
> [2] Headers repository:
> https://github.com/bee-headers/headers.git
> [3] Homebrew Tap formula:
> https://github.com/bee-headers/homebrew-bee-headers.git
>
>
> >
> >
> >
> > >
> > > Kind regards,
> > > Nicolas
> >
> >
> >
> > --
> > Best Regards
> > Masahiro Yamada



--=20
Best Regards
Masahiro Yamada
