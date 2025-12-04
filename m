Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC24CA32CB
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 11:14:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDC6C10E1CB;
	Thu,  4 Dec 2025 10:14:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="b905ZK4x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ACDD10E1CB
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 10:14:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D9EEA601F8
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 10:14:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E9C0C2BC86
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 10:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764843258;
 bh=pYNaUleOJNpP+/eYHJsCgPXPDeW7AQVJ1IbGz98O29Y=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=b905ZK4x3GsY/EknocexUQAW5cyJioFfha65t2yOIgucuCHa4UOjGIQBJHCSkiQb3
 Qvan+DLlhRA0hQuG1KYb47PYY4Cja/wy0v+N4yoW+0zuJJ6NKiiJ6nDwwvgcSM4GK9
 Aip+tJ+py4DHpp+Npt598Uv9MYLPuX7eBHLawEo0J443F0OVvdhQjEw1a5mwsUZUeJ
 LoGbzMTxSzJMUavK19CeYZXAnLUB19CIJUv4GxA1DOBvIEea1x4c9+vBnjfQMfgLLr
 ZuLYy4z5vMXHMx6h+1h3+PK6shJYWWgNTf44AoTf7/XH9/G+vlxShEK2jakvlckpb7
 8PAIoEOZ5wwHQ==
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5958931c9c7so784357e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 02:14:18 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUATymFfCnf+0kqGNLOs9Mv6DY3AoGXDggbYYydu7Arloq14KL0PNDqCRG+On5AY0LfVE5r1A8MYTg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzrFln6Dhpg9+wTGe9gf2yXSveNIjDFIfZHGU9pCcG/pCAkhmKX
 jiPQI8qZ9BRsVe6DXxkoSDwVXDMJ+YDmr3t18FPQ+snXx5RPn/E6HXZ+gYHWkv4Zc+daM92OrnH
 RvaAW0+NP/7FW7BbXFtD2Dn1oA71VbYAkDx7lWuwzLg==
X-Google-Smtp-Source: AGHT+IGlPYgkRNo9mBlYM/VnkhHcbC81roAlz2w2S9o/KklcxGJxVASbQLf4maYoGnDUYTQ0hHEqWp1cF5b9IPspFrc=
X-Received: by 2002:a05:6512:124b:b0:594:34b9:a7f4 with SMTP id
 2adb3069b0e04-597d66b7dfcmr940244e87.29.1764843256926; Thu, 04 Dec 2025
 02:14:16 -0800 (PST)
MIME-Version: 1.0
References: <20231127051414.3783108-1-victor.liu@nxp.com>
 <20231127051414.3783108-2-victor.liu@nxp.com>
 <v6rthnruba5xaxazsn4jsptn6catso5qwuyf5xxbf4ml25b6eo@snttjo7oqlod>
 <2023112739-willing-sighing-6bdd@gregkh>
 <CAMRc=Mc3T1u1sa0P+78dfhtoyBPc+9zsJ5sGP=ZLR+S=h16vZg@mail.gmail.com>
 <2025112705-registrar-drivable-2341@gregkh>
 <CAMRc=Meb0-Q7UCPhbfQ+pLybS2Jp=QpwxXGXNfQ+Ti64okoqYw@mail.gmail.com>
 <2025120326-treat-unstopped-f883@gregkh>
In-Reply-To: <2025120326-treat-unstopped-f883@gregkh>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 4 Dec 2025 11:14:04 +0100
X-Gmail-Original-Message-ID: <CAMRc=MdhG7tBoEt2cm8qVJS8tisKPNr6u+umtPW6dFw8yF=N=A@mail.gmail.com>
X-Gm-Features: AWmQ_bmURBdUM8O_DmKkTrT4tt34yC__Hb5uhplwc0lwnHaCcnOqTLp4hNngp4Y
Message-ID: <CAMRc=MdhG7tBoEt2cm8qVJS8tisKPNr6u+umtPW6dFw8yF=N=A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] driver core: Export device_is_dependent() to
 modules
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Maxime Ripard <mripard@kernel.org>, rafael@kernel.org,
 linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-next@vger.kernel.org, 
 sfr@canb.auug.org.au, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
 angelogioacchino.delregno@collabora.com, ulf.hansson@linaro.org, 
 linus.walleij@linaro.org, Liu Ying <victor.liu@nxp.com>
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

On Wed, Dec 3, 2025 at 6:01=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
> >
> > I hope that explains it better.
>
> Yes it does, thanks.
>
> > To answer your question: the caller can't tell GPIO about this relation=
ship,
> > GPIO would have to ask reset about it but having a dedicated symbol for=
 this
> > doesn't really sound like the best approach.
>
> Ah, ick, no it doesn't.  I really don't know what to suggest here,
> sorry.
>

I found a viable workaround inside GPIO where I create another GPIO
shared proxy for the potential reset-gpio device. So that if there are
two users of the same "reset-gpios", we create three proxies in total:
one for user 1, one for user 2 and another one for the reset-gpio
device which may or may not be instantiated.

I think that the best approach would still be having access to
device_is_dependent(). I don't quite get why read-only inspecting
device links outside of PM or driver core should really be a bad
thing, but I can live without it, I guess.

Bart
