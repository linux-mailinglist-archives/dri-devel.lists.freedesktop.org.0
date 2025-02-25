Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73604A43DCC
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 12:38:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65DFF10E645;
	Tue, 25 Feb 2025 11:37:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="msI+UTdy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93BAC10E645
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 11:37:57 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-e549be93d5eso5890607276.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 03:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740483476; x=1741088276; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=n1TWnKYSjWgGvb3cyxt3TX5DamTHuovBzjkuSknBSeU=;
 b=msI+UTdy+SvvMX/kAgQPwzB900liSLZI5IrOJeaseYlki9qCL174IGaWFi111DleeS
 Lf17rxA3OCu6t/QmeyAlCeVnarTwBUyEEmkOxAKlGGjnqenfDQXB4HjWUj84JDbcqz9W
 DQGGxzKJ495c1dG9tDtASMYKwdYGXPvjC6iKd5rgEuKubVLNOYYyclDGJfPKIROEbZEg
 3nonXsnq9fu6BU4tvKbwYwEgFbZch8eQRg1gGAnSSzlfkDuBLMlzd6dQuz7wd7QGNooJ
 SEQXOAOAxLqixQY93tdWVyRXO+Nw06QVEWn08a8Q6lOwkc1cx7MPYZSjb7H9bcq/ncD0
 Sfdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740483476; x=1741088276;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n1TWnKYSjWgGvb3cyxt3TX5DamTHuovBzjkuSknBSeU=;
 b=LiTyA6OX2mO4lVbxZ3RX8V8Ng3moFBEa0KDuW+7orQGG20yYMOrsV6LH/xnAcrkLxG
 3F/Uz9CaAXGeSzwtYKDzTYfxiTjLp5k5yLggrMH2xD4Lq2kjHCMRAUykiiufraqiVkHn
 Exn4CnT/vXlbn7vUrg8Rwx3EkD/m2RCBtS80MCYt87aWSY8SeqYbraze+4+dsJx9AoGn
 M2SLz67bsB2m3NJ7N0GiGmQnwEJSrQYXYFp4e6ooFeGVR1nPIDHpj5E8Jvsi843WSR+3
 tkU5dw0JHxwHDLnS37w0ALXyvl8jpPj15vFMIWhtZkOpDxpa5p1jRC8OtQxvdX+MxFIs
 2zPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOhJRujb29OqNdyeE94+lvjSve7+kdJVZmckAgbHXFLybtHxMCZOL47yImHh2cClv5j37dwzVILYA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7YmHcbrbnJXjigtW8x1D2i4DxlZV1efR4IxExFvUebLuhIFEN
 4IhmYxxRHIUNK4dR7ajHyeO7oQUkByAD04G0hNhiu2NLwoKG6x8rkE6XDGcP4qAxu8M2E/owIrN
 FzeD/YqBn9eVEtKT73Q3bqxv3aksf0NS6xqTWwA==
X-Gm-Gg: ASbGncsiQh+mTyEOxcZGknH1MoyIxIn6RdvkTPYjZhlsbdtybd3c7wZO2w2Jml5BEgM
 45eGhrS+k3DWdjspWh3sbeY1uruio8QcGcgaSHiNdnfp3Mvkc6NN9GgzBb3YJQqxWLbhZxLnC9Z
 Doz1o2H3lKmOhxuBzCKbT4/kbKYFqQDryIIbB2yTY=
X-Google-Smtp-Source: AGHT+IFoRV0tABvVleGcPGFjITHVSAozbUIV7vt/JXOPnNAtmYOOQYQ8LJ70dKpeCX04ppbU+mmusjSHjBwHx6qf6uI=
X-Received: by 2002:a05:6902:18cd:b0:e5d:fccc:7907 with SMTP id
 3f1490d57ef6-e607a4e3c9bmr1939202276.14.1740483476663; Tue, 25 Feb 2025
 03:37:56 -0800 (PST)
MIME-Version: 1.0
References: <20250217-adpdrm-v7-0-ca2e44b3c7d8@gmail.com>
 <174047913824.2131221.6545389561298332217.b4-ty@linaro.org>
In-Reply-To: <174047913824.2131221.6545389561298332217.b4-ty@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 25 Feb 2025 13:37:45 +0200
X-Gm-Features: AQ5f1Jq_8vz2X92aaDmmCRK3QuSACEM5CmHNBFF9CumkaBecyk4PuPviBAdIWp0
Message-ID: <CAA8EJpqM8ZQ-ScEtEBXaUF2Nargtp_TBAyMYvbJ49PGbwPWjaQ@mail.gmail.com>
Subject: Re: (subset) [PATCH v7 0/5] Driver for pre-DCP apple display
 controller.
To: Neil Armstrong <neil.armstrong@linaro.org>
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

On Tue, 25 Feb 2025 at 12:25, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Hi,
>
> On Mon, 17 Feb 2025 12:39:30 +0100, Sasha Finkelstein wrote:
> > This patch series adds support for a secondary display controller
> > present on Apple M1/M2 chips and used to drive the display of the
> > "touchbar" touch panel present on those.
> >
> >
>
> Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)
>
> [3/5] drm: panel: Add a panel driver for the Summit display
>       https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/40115947b59f2ca361a47615304dff0a2b69a2b4

Without the bindings?!

-- 
With best wishes
Dmitry
