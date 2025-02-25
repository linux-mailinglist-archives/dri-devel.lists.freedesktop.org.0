Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC81A44E29
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 22:00:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F8B610E7E3;
	Tue, 25 Feb 2025 21:00:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eDODb+kF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6062910E7E3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 21:00:53 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-6f4bc408e49so51927177b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 13:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740517252; x=1741122052; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aTECS3SKQyqLPvpHn3SdLnl7nJuW0BjxdhYYx7X/Yrs=;
 b=eDODb+kFfzfv+U2eVFDUB3gQ8sSQdHraKMnUOHNNLlkSP1pLfvEIzeZ77b332hGI0+
 fxDKt72yqHil2Eig6X8rkuMOsk98gu5SdQZTjQ2l+RvpweGEssakbN2+G1HwcQxPnCPA
 5QrrfYH8eArpIbRLswCwZ1XSg8RWGzTVVrJvoFh7KiQL6fvJB+RhCVvfQhu09G5ikDHh
 ufOcebDUmpanOOIuOUelkSOQJUsz40hiWg9piumVK1c64W38MiL3+KJ7X2oa94OazCd8
 OTH3FaqRN9BWgGHxynneqmUlsVZdXPgliVUB00B6aaxvT9eXW55BVDwRprRTpXCTHQcU
 Sqjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740517252; x=1741122052;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aTECS3SKQyqLPvpHn3SdLnl7nJuW0BjxdhYYx7X/Yrs=;
 b=Bci5FE+XRM+QSxFu7BxuOGITVEM3VSxvcr/2RfLbI0QipKv7/2VE3T9ySyoXuHp/BT
 A/QO7sYrQ1R51zX97B5EhpYEarnu7Cf50NyuN9lxZqC6thnbWKxQQKPSlyrmTxRpscTp
 RK+jrCocuLJVEeQv6vgEUqQoW8fuLdjVBbYFmXJM7xNK9N9HsM/qr+mlhB3JbYDzYENX
 5ejltZJ4HI6iNdw9zP+UOajg32ptOUq7eQgY9LnEmi0rvmdRQ4ilOdBdyTRyhBQxF8IQ
 Ipc76ZU2U1Nk0idx3BY4BrVLE++BgbAqHtOUwXmxw69DoIdJBTPkjbU6LkdIs8rnBqz0
 fvAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUblbTZwYUf5MsZcBji6aUpJzgBSvHDG1WWkqG/+BowHjsTM1FfHNh6cAzX6/zWFU6Zt14kUhOT0uY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzVCOUez1EIsbBp6vnD3NFCsk6FnBK+LxtAhqTeJJTGhWHH0p5v
 LLBJh1fx3RnVTyywRb/1ICu0NsUKekdQlAGDqqKuagElTp/ySS0lODjZgGBK+RlFYBK3XJWmDu2
 FjLneLumvSzbibSk1B5gcUpcSNtO2PDKv/Y3lgw==
X-Gm-Gg: ASbGnctIxrR61a95n3XBNBL6GIxiKRih4NZEXk/pbUUbtipi7P92rMnIW7ssPF52KxS
 dFJTWBxkbqnEJQs/UuFyvLqKLIhZsR7rW/pw2arzdEaPEHXfoUeU/vtuKLB3xJoPwSBmlEJljLz
 iXO1/475lvhFuWAVm13CexTchIAX2ccHBclxyVzvw=
X-Google-Smtp-Source: AGHT+IHVNAF9M985zwQc8ti2DtEeKOd6IPqcLWmaevOapLPMkqXyG9p9oh+HENqNXQGjtwqlmhkaD1MmqhA217I8byY=
X-Received: by 2002:a05:690c:888:b0:6f7:50b7:8fe0 with SMTP id
 00721157ae682-6fd21dc678cmr11826067b3.1.1740517252440; Tue, 25 Feb 2025
 13:00:52 -0800 (PST)
MIME-Version: 1.0
References: <20250217-adpdrm-v7-0-ca2e44b3c7d8@gmail.com>
 <174047913824.2131221.6545389561298332217.b4-ty@linaro.org>
 <CAA8EJpqM8ZQ-ScEtEBXaUF2Nargtp_TBAyMYvbJ49PGbwPWjaQ@mail.gmail.com>
 <2d51cb9e-b8c5-4cf1-bd7a-751fb633275c@linaro.org>
In-Reply-To: <2d51cb9e-b8c5-4cf1-bd7a-751fb633275c@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 25 Feb 2025 23:00:40 +0200
X-Gm-Features: AWEUYZnjLNgOW9D81B_b4Ug4M1LEmwU_chC0K6f10jOh7vvlfER0M0Paj99xQ-A
Message-ID: <CAA8EJpqu269ttsUcEsJpBOexRUS+pKSaMESLosC9iNCoUCtroQ@mail.gmail.com>
Subject: Re: (subset) [PATCH v7 0/5] Driver for pre-DCP apple display
 controller.
To: neil.armstrong@linaro.org
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
 Janne Grunau <j@jannau.net>, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alyssa Ross <hi@alyssa.is>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Neal Gompa <neal@gompa.dev>, Nick Chan <towinchenmi@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 25 Feb 2025 at 19:59, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> On 25/02/2025 12:37, Dmitry Baryshkov wrote:
> > On Tue, 25 Feb 2025 at 12:25, Neil Armstrong <neil.armstrong@linaro.org> wrote:
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
> >> Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)
> >>
> >> [3/5] drm: panel: Add a panel driver for the Summit display
> >>        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/40115947b59f2ca361a47615304dff0a2b69a2b4
> >
> > Without the bindings?!
> >
>
> Bindings will be funneled with the rest of the ADP driver, the panel driver can be applied individually.

Okay.....



-- 
With best wishes
Dmitry
