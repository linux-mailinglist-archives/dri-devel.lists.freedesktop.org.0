Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E07534C8E17
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 15:45:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBF7910E581;
	Tue,  1 Mar 2022 14:45:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 050E910E561;
 Tue,  1 Mar 2022 14:45:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D3761615F2;
 Tue,  1 Mar 2022 14:45:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A06B7C340FC;
 Tue,  1 Mar 2022 14:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646145917;
 bh=o2NgCtFCCViEWWJZ/MxDt8WYruV+Na6/HFB90W3Ddms=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=lMdLBJopxDEHQ2byF9/34TX2fjEtkjCCJ8lMoLev24s9mqzvVl87yTCPxcZIksJKl
 iFb5iGRXli28GDe7sXTT7Boj+U8Eg0FFMeFAzJRsZ1VLyvH0x9p0acTDHkBbyBqsLK
 k5GCyDImzqYKb1WXjZEAobLz7CO7SuNCGUByyyVyMH8DuIEprdCTCknAO9lUxgt+yR
 pVRZR5DVF1IMygzEppyOSCmoUaVPFsRdchUQFKaFwxPaHHYfrB2RmfLexGkWWN0XqO
 H0GQE+Gf4s59y/zQ4Gbl1QvMsp5nw9rNyEsHwyGkuLG862yxhilFyASVQEUhhaxMMj
 5BMGXA7qPfjPw==
Received: by mail-wr1-f54.google.com with SMTP id j17so20955362wrc.0;
 Tue, 01 Mar 2022 06:45:17 -0800 (PST)
X-Gm-Message-State: AOAM533b5Iak0Er/8HAVcnGdN5ug+kdK0mSlBuZbS/wMM3akiGgwDeho
 +Ninwk+ILs7cQwFyIaNtLtAPYd0hhM53SWcoZBU=
X-Google-Smtp-Source: ABdhPJyPIqVYEILvQbfggjtl7CioQ8YL3W5DTBrAMuOdPQLuzbvqdbkn4EaLjO6EST24WGkIh2N7mmmwovoE5hxEokE=
X-Received: by 2002:a5d:63c2:0:b0:1ef:840e:e139 with SMTP id
 c2-20020a5d63c2000000b001ef840ee139mr12407945wrw.192.1646145915672; Tue, 01
 Mar 2022 06:45:15 -0800 (PST)
MIME-Version: 1.0
References: <20220228103142.3301082-1-arnd@kernel.org>
 <CANiq72=wmYeBcJvRbBgRj1q_cHjZBVjxStXSu-8Ogv5bJhCqpA@mail.gmail.com>
In-Reply-To: <CANiq72=wmYeBcJvRbBgRj1q_cHjZBVjxStXSu-8Ogv5bJhCqpA@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 1 Mar 2022 15:44:59 +0100
X-Gmail-Original-Message-ID: <CAK8P3a160RneN60cA2apHVt1D6oiV2KprG=uJ2mJwVvrR3z4pg@mail.gmail.com>
Message-ID: <CAK8P3a160RneN60cA2apHVt1D6oiV2KprG=uJ2mJwVvrR3z4pg@mail.gmail.com>
Subject: Re: [PATCH] [v2] Kbuild: move to -std=gnu11
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Marek <michal.lkml@markovi.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 linux-staging@lists.linux.dev, Masahiro Yamada <masahiroy@kernel.org>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, greybus-dev@lists.linaro.org,
 Alex Shi <alexs@kernel.org>, Federico Vaga <federico.vaga@vaga.pv.it>,
 Hu Haowen <src.res@email.cn>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Linux Btrfs <linux-btrfs@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-doc-tw-discuss@lists.sourceforge.net,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 1, 2022 at 11:43 AM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Feb 28, 2022 at 11:32 AM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > -under ``-std=gnu89`` [gcc-c-dialect-options]_: the GNU dialect of ISO C90
> > -(including some C99 features). ``clang`` [clang]_ is also supported, see
> > +under ``-std=gnu11`` [gcc-c-dialect-options]_: the GNU dialect of ISO C11
> > +(including some C17 features). ``clang`` [clang]_ is also supported, see
>
> I think the "(including some C17)" bit would not make much sense
> anymore. There were no major changes in C17 and GCC implements
> `-std=c11` and `-std=c17` as basically the same thing according to the
> docs (and GNU extensions apply equally to both, I would assume).

Ok, changed now.

> When I wrote the "(including some C99 features)" I meant that GCC
> implemented some C99 features as extensions in C90 mode, and the
> kernel used some of those (e.g. the now gone VLAs).

I suppose it's still true for some c2x features (static_assert, fallthrough,
binary literals, ...), but it seems easier to just leave it out.

> With that changed, for `programming-language.rst`:
>
> Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

Thanks.
