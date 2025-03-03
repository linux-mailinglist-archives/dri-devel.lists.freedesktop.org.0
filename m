Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF180A4C76A
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 17:37:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CC2E10E0B7;
	Mon,  3 Mar 2025 16:37:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JzugNjmB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFA4310E0B7
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 16:37:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 978E35C53FB
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 16:35:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24E84C4CED6
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 16:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741019850;
 bh=2xP1VNckQ2vULtbhOREqEVD3q8xkOcQG3iR8jMeveYc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=JzugNjmB6+Sf/dusRt5fDnVooJlQ0gk4B4/Kjro31zYbH+GW18PBym7it18/y/woV
 r5nKxsE3oayZkZ+4y1h0yhEX5KPXRPgdG/GVdMkPO6WVPDncCTsYExSKrEfNKatads
 GFTJzo1CJPASgZpQWfwXzN1zjI1xh0JYYkWIS+hFYKgB5trllvAbt8Uu7VeBUYEPD1
 paOuY0ay34eXjk/MjcUqv0ybymhfdiUM1r3kVlSP2DHuHUtkgVkl9antvRft7yjrIT
 baCzkHvDUGppLEuhrM0TQwfUpjxJWTGOA8NNWXo6/LQ2+Cqd2tU6nDjIoR0m5DExKV
 2DLBGdJqqlQVg==
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-5e4d3f92250so6142089a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Mar 2025 08:37:30 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXlhUuaqAkEM0kvBjXTijZ866XbnMbjX6HsqRLL8m4ArZxZ1PW+KOtJiD5jrevCx6L+wGPc3nSYiV4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy320tIGV4jEXb4GDNvqFVC9QbKHRxkS2PsO1COWD88KqG6/c5f
 VUFBUSLs8ddXAhVuOMOISPBa1ObLI17xvuZ8z7v60NWnvcTmi3f7+3w049SmGOyNsWRMUSgDjk6
 eV0pzFh9IzyyupQrv1Nc6HDDrkg==
X-Google-Smtp-Source: AGHT+IHUsZAUSMpJRbmPIa6fiiDfbENTCpBzluX0zXK2ogy8xG9qRfPLy2SEI9L4RS00s4IFwPqdkKyO7j94lM74OL0=
X-Received: by 2002:a17:907:7f1f:b0:ac1:dde7:a80b with SMTP id
 a640c23a62f3a-ac1dde7ab19mr235932466b.43.1741019848769; Mon, 03 Mar 2025
 08:37:28 -0800 (PST)
MIME-Version: 1.0
References: <20250217-adpdrm-v7-0-ca2e44b3c7d8@gmail.com>
 <174047913824.2131221.6545389561298332217.b4-ty@linaro.org>
 <CAA8EJpqM8ZQ-ScEtEBXaUF2Nargtp_TBAyMYvbJ49PGbwPWjaQ@mail.gmail.com>
 <2d51cb9e-b8c5-4cf1-bd7a-751fb633275c@linaro.org>
In-Reply-To: <2d51cb9e-b8c5-4cf1-bd7a-751fb633275c@linaro.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 3 Mar 2025 10:37:16 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKXguOAK2pge-TwH4M8JC3UnEi_ia_7QjrgE_6KZzGucg@mail.gmail.com>
X-Gm-Features: AQ5f1JqXNkmMvtXvWaBKtRXTZitqf2vltXXW5gy5b2hrxmHRwoqFlvx_mv3N5EI
Message-ID: <CAL_JsqKXguOAK2pge-TwH4M8JC3UnEi_ia_7QjrgE_6KZzGucg@mail.gmail.com>
Subject: Re: (subset) [PATCH v7 0/5] Driver for pre-DCP apple display
 controller.
To: neil.armstrong@linaro.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Hector Martin <marcan@marcan.st>, 
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
 Janne Grunau <j@jannau.net>, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alyssa Ross <hi@alyssa.is>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Neal Gompa <neal@gompa.dev>, Nick Chan <towinchenmi@gmail.com>
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

On Tue, Feb 25, 2025 at 11:59=E2=80=AFAM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> On 25/02/2025 12:37, Dmitry Baryshkov wrote:
> > On Tue, 25 Feb 2025 at 12:25, Neil Armstrong <neil.armstrong@linaro.org=
> wrote:
> >>
> >> Hi,
> >>
> >> On Mon, 17 Feb 2025 12:39:30 +0100, Sasha Finkelstein wrote:
> >>> This patch series adds support for a secondary display controller
> >>> present on Apple M1/M2 chips and used to drive the display of the
> >>> "touchbar" touch panel present on those.
> >>>
> >>>
> >>
> >> Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git =
(drm-misc-next)
> >>
> >> [3/5] drm: panel: Add a panel driver for the Summit display
> >>        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/4011594=
7b59f2ca361a47615304dff0a2b69a2b4
> >
> > Without the bindings?!
> >
>
> Bindings will be funneled with the rest of the ADP driver, the panel driv=
er can be applied individually.

Uh, no. The bindings go with the user. Now 'make dt_compatible_check'
reports apple,summit is not documented.

Rob
