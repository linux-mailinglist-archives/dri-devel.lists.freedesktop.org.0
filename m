Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0389D557B
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 23:29:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C15310E3F9;
	Thu, 21 Nov 2024 22:29:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rcWrzrsH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04D2010E303;
 Thu, 21 Nov 2024 22:29:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 93409A41587;
 Thu, 21 Nov 2024 22:27:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93E1AC4AF09;
 Thu, 21 Nov 2024 22:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732228150;
 bh=tjQSsOUWzW3WwJYC83/glQCSqGSvUSIbP3JOWT1OQe4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=rcWrzrsH4tEfQHf3P7q+6wJHhl56AH3LlQmqwrbYgwwVSUSTCOttUuxqiTtt8MYtA
 AT0LT77kW5Hfk1KR228V62O5x2hnzoAn703DD3JdU9rzR8Lnc95qr7UNoNnK7q9J14
 MTi3uIbSJFd2+6flzi3Sx8YcdJXa8XIbTEn2xhIDSiEQMGlQriOdRLbe0Lg27pia8j
 MWY3CBf7TLhCF/27xxkwDcGgOzRxHlyBaQT8hHKs9/KQdFPQFSglmIsxeypi3bisCW
 pdUeHmcNsRH47gwWbmtMDwYtyok7H/GBhI7j/TWRojepAA1ra1E8p1nD73S90uviyc
 Ix5mYtx8tw5pQ==
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-539f53973fdso1330949e87.1; 
 Thu, 21 Nov 2024 14:29:10 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCV6pIosEHQclDGHOP0F0FgVOMxHig+vp1AA3bdQVm73x6tVO5eIOi7Pw7KCYkhcwA6eseTlszQnCpzn@lists.freedesktop.org,
 AJvYcCXctWxBo/RezdyNEMPBp5/O4hNqCdF3Gwr44APmfmZQzwHyG2x6lXYfevP9OZ6CLt9/tuFwP6bI+ew=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3kA0kFqg5haGVusROo0/BHoNiXicjTpTIMDDmvVSI6hBnYBDz
 iTEEj+SgOvliM2jjDIB99UwYarcsREwpabZKrYOJDkX9BOq50yif3lEPJ2QFkxPIrfLQj1yceFy
 qXe4+8S0fHoQWw/LCfSMefkdzQ0k=
X-Google-Smtp-Source: AGHT+IHW+QS4dVHOxA02lbsya/fSi8Nd0koHSYBV9qK4E+o17m5c7V+ut9orQpRQIqJnqhxvz3Dnlr3nqgP2Bv8wIDM=
X-Received: by 2002:a05:6512:1383:b0:53d:d209:d96b with SMTP id
 2adb3069b0e04-53dd209d986mr500586e87.13.1732228149219; Thu, 21 Nov 2024
 14:29:09 -0800 (PST)
MIME-Version: 1.0
References: <20241120204125.52644-1-pvorel@suse.cz>
 <CAK7LNASYr+pjUs-W40d_Gc+vP67nX7NHXyE0AnOpXxXgxrCtqQ@mail.gmail.com>
 <20241121011720.GA69389@pevik>
 <CAF6AEGuzFNVd5fE+b+hKcC8xAOg7CrkPaYuWC6tCVmioutoOOw@mail.gmail.com>
In-Reply-To: <CAF6AEGuzFNVd5fE+b+hKcC8xAOg7CrkPaYuWC6tCVmioutoOOw@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 22 Nov 2024 07:28:33 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQDMJUYUF7BaN10bwctW7fuHmSMrrAjMmn4s7P2ys5P+Q@mail.gmail.com>
Message-ID: <CAK7LNAQDMJUYUF7BaN10bwctW7fuHmSMrrAjMmn4s7P2ys5P+Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] init/Kconfig: add python3 availability config
To: Rob Clark <robdclark@gmail.com>
Cc: Petr Vorel <pvorel@suse.cz>, linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>, 
 linux-kbuild@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Thu, Nov 21, 2024 at 10:49=E2=80=AFAM Rob Clark <robdclark@gmail.com> wr=
ote:
>
> On Wed, Nov 20, 2024 at 5:17=E2=80=AFPM Petr Vorel <pvorel@suse.cz> wrote=
:
> >
> > > On Thu, Nov 21, 2024 at 5:41=E2=80=AFAM Petr Vorel <pvorel@suse.cz> w=
rote:
> >
> > > > It will be used in the next commit for DRM_MSM.
> >
> > > > Suggested-by: Rob Clark <robdclark@gmail.com>
> > > > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > > > ---
> > > > Changes v3->v4:
> > > > * Move definition to the end of the file
> >
> >
> > > I prefer to not check the tool.
> >
> > Ack.
> >
> > > Why don't you install python3?
> >
> > Everybody installs it when it's required, the question is how to inform=
 about
> > the dependency.
> >
> > There build environments are minimal environments:
> > * chroot (e.g. cross compilation)
> > * container
> >
> > These are used by both developers and distros.
>
> I don't think py3 is an _onerous_ dependency, but it has come up as a
> surprise in minimal distro build environments at least once.. so I'd
> be a fan of surfacing this dependency in a predictable/understandable
> way (ie. I'm in favor of this patchset)


"once" is a keyword here.

"/bin/sh: python3: not found" provides sufficient information
about why the compilation failed, and you know what to do
to fix the problem.
This is good.


If you hide CONFIG_DRM_MSM silently
due to missing python3, you may scratch your head
"why drm/msm was not compiled?".
This is worse.








--
Best Regards
Masahiro Yamada
