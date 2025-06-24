Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BEEAE691C
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 16:40:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6191210E5CC;
	Tue, 24 Jun 2025 14:40:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="AN3XKgGl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB88510E5CC
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 14:40:55 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-553dceb342aso4333595e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 07:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750776054; x=1751380854;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EzNCs9Ria+/nsHScn6KKXudzA13G16dAU3b2TbhXQXY=;
 b=AN3XKgGlkYGNA1sbLX/byX6odB/fTaFgyierh7c3S2GoZzJZpHb0Fa8hKZ54Boemaa
 CRR2zaQAs9WJZgwdtIynbyEfGhhXwOySOokVxZI6LnROtK39FWHui7jR7O0tEO4mx7+r
 p0w25YKUgZkSvAPkyoD0J0vpKeIVzzcr493UNl3vFCn9aNqnLIpuQnOxvzXMUI0lorS7
 QrND5CepeKyc1viPZi/sSAKVtRfR5dffLv9WCR+Xl0K9yeqIlUykvYUpAm3NXST7nN/O
 g4CCprVCWR/rHyIMWKpxHZEBabTM+Huntl131RoOt2hWQY03obYcUcjs2NqQtRzptYR9
 Mw6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750776054; x=1751380854;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EzNCs9Ria+/nsHScn6KKXudzA13G16dAU3b2TbhXQXY=;
 b=MqPb4vb3MLW0roDLOGkxj5RBHQ/hrxaG8EHbklv26AzbVWmacQczkWoHXOdEWIiwx8
 KfG3DiZZjgr/Gt9XurTneCQ0XA+Omq8hIxLOLiRtpIlaZc9p2USYk8W+/nS9PKPYxBU6
 bU7KvOGj89+HnS535jAaHawZ4kK0y9Bk8QovqFLYoyLCMeEGZqRkq8WvmQGOoibp2YQH
 Sdy2pkhA2cMtsjLg6DFK7Jr5LLkKB22hy7XQ2wG1hX0uL7Y5Uud8KbiFV1vJLByZIX63
 lQGM/M9YrJ2H+E8HSHOpVA2NFgi9klhfaPaxM0hKG4JG9NfQY11VD43XVU/WLMH37zla
 M7Iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4fKMvGgyEjqkbAAYEVrjoFbZWwyr63fpGjKXkDmBIDair2uQ8SvXQktfm4Ek6O5BB0qnj8rxyLzQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6W+9hXJc1D74VbFBp3nfMjsFd2r6CDm130Vu6aIjZMFb8muSn
 s8ybRpK+HM4loMGmt/M1low5+ZTE8p4RzGa2XkPw6p0+P/IrNLfndvldiZ8WKby66OJPTj4PSd3
 Rq7Sb64GYYYb+wdSQJjFbl6hf7FaUSmv+gYapy4ewoA==
X-Gm-Gg: ASbGncu92PDlK+Gn1sbwfbfXlfKSvamhP++/BGePhA5+b6oWiXBi4qei4Htcx340QBn
 7XhCv3piW+MsLG/IVP83PineylC1NCWMGwP/m31D+mzwLIh1HBLJc5oH9ZWOxkBc/rjGzalRXVW
 2PCjG9rEMj3jrk36FuGny4bNHQ+GkxWTErfFTm/8mqF2iezfClgP5tYXxY/8Uo87F8DgQiKX0DS
 Q0=
X-Google-Smtp-Source: AGHT+IHoYTMP7f+GMTw3uTP6k4I0Bn231yrpp+uoyy9GCq8Fgqpn1kY4nGbARRHfnOknqCIYL6cW4GTWqP9E24930M8=
X-Received: by 2002:a05:6512:6ca:b0:553:3621:efee with SMTP id
 2adb3069b0e04-553e3d07037mr4828362e87.50.1750776053838; Tue, 24 Jun 2025
 07:40:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250624141013.81358-1-brgl@bgdev.pl>
In-Reply-To: <20250624141013.81358-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 24 Jun 2025 16:40:43 +0200
X-Gm-Features: AX0GCFtRDOKAyexKw3msruWQ3iVjYn3wJRU2OMc42QM_NdUIN3Q2ZlDVDbMilcc
Message-ID: <CAMRc=MeKfWsf8T1tJLdj=+7aq0zGpQ07pHd2Mz-Y=Bwae0sAbw@mail.gmail.com>
Subject: Re: [GIT PULL] Immutable tag between the pwrseq, drm and pmdomain
 trees for v6.17-rc1
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Michal Wilczynski <m.wilczynski@samsung.com>, 
 Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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

On Tue, Jun 24, 2025 at 4:10=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Here's an immutable tag containing the thead 1520 power sequencing driver
> for the drm and pmdomain trees to pull from.
>
> Best Regards,
> Bartosz Golaszewski

Just an FYI - there don't seem to be any actual build-time
dependencies between this driver and the rest of the code that uses it
(thanks to the aux bus usage etc.) so Michal, Ulf et al: you can
probably skip the pull if you can rely on this being available in
linux-next for run-time testing.

Bartosz
