Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4E59551A9
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 21:55:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74A2E10E83E;
	Fri, 16 Aug 2024 19:55:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="FPV42YSL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E0F10E83B
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 19:55:48 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-201cd78c6a3so18345635ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 12:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1723838148; x=1724442948;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MGWxg1wOx8lJ4g1VL18IcZyVgXvmEtS03cqmIV5LuWw=;
 b=FPV42YSLZRCbnoBYt3DfxHE7zHQilelDmILUgLMdkRoMQF0FtSOmFYPBt9k49/9z9x
 trW1mBjWN1gfeYOc22lNLFy8P1R0/5r1KOpl5EVRpEjpuOBt3hQ9rpBhrJvx0E+JGzae
 KOJFeo7E9ZtQR5HZrbPgQDKL0ehqWmLkC0F+qtMDBDHn43P05TSOCsiFMzsDgFZc80Ne
 Yv67g/5UffNeNrJqDktrubI4p7M9Wjl0+OS6W1O/OyoiZoqZv6flvEdVY9aTaVnRvNIT
 LA0qT719SphUOwWeVJ1QXRELFCTzsFbkFj5A4YhLyMhoTBEh3KvorxUsSAYJaRNk8G5x
 BTEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723838148; x=1724442948;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MGWxg1wOx8lJ4g1VL18IcZyVgXvmEtS03cqmIV5LuWw=;
 b=AHJ29WCwMAPECtKpUsk8zucPNUPXnR4Y0Ps8P8FNsEMw0he6u/GdWBz5w2xG3+1Hbl
 QSHIrh8DYFJP4lGNcHRMXTyio70LOySCwButsL/zx31E6aesqRwJinCJQhHPgDzbcHcw
 eX5VT6Az6t/gPgd6bu7bO/Y73arx8EmVwmjp+k2O5pEL1nOaS7WaCoClsERQoZ3kMCLX
 yjreAsETqUKE6b4WgC+HqG09kN+otFT2vEF+D7MXh1ujjIyqO81+E3gepCo45ZgT39Ke
 mF/v3Q2eeWbhhLeh7fhOQ2gvr0xrnqXGEqm+04Pz9+VW1ePgzn2lZfEAE5EqRCPEV2CU
 kRnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3hJFyFnj1PzYt7MfBsSz7NlVfs3yqzkLt08dQRC+MjQJ5wBuSeftHhXcCx9SOsgAd9pd/b2WD5bXO6hl9VQtyF9QXsarS0UUuXn0pBWvc
X-Gm-Message-State: AOJu0Yz+ItATwZ5JhJAOImsF45pdO/NQeTy+gkeAfQrbF73sn+iugotj
 i72yFgzO/q1vbCEdIIgoTDusZ+w5OC/T2c5/hxfEJ42p+4PwzNXHl2qk09Bht/tGvhrArAqx6Rf
 4xmSNGj/XNz2Q+k07we+rrZ9tLPU=
X-Google-Smtp-Source: AGHT+IGH6vqIACm8gz7WSIiK1hLIMfs+2kbloGFsHHYX1GswdRuWB0AyXiwovzGrueJUPrhdZoQKawfIyTwS/JlzZ5M=
X-Received: by 2002:a17:902:ce91:b0:1fd:9e6e:7c1f with SMTP id
 d9443c01a7336-20203f514a7mr51522695ad.56.1723838147914; Fri, 16 Aug 2024
 12:55:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240809124725.17956-1-abelova@astralinux.ru>
 <CAFBinCATiUnR=P9VRBxWeQhf49k6PVxK+nU95G7w94f-mR2HWQ@mail.gmail.com>
 <bb45ed80-7871-47ba-a1fd-ee71dc21a409@astralinux.ru>
In-Reply-To: <bb45ed80-7871-47ba-a1fd-ee71dc21a409@astralinux.ru>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 16 Aug 2024 21:55:37 +0200
Message-ID: <CAFBinCCW6E46+cMUC0M+n_4d7A6AhoJkQT=EHBxOD5wjn9O1hw@mail.gmail.com>
Subject: Re: [PATCH] drm/meson: add check to prevent dereference of NULL
To: Anastasia Belova <abelova@astralinux.ru>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 lvc-project@linuxtesting.org
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

Hello Anastasia,

On Mon, Aug 12, 2024 at 11:32=E2=80=AFAM Anastasia Belova <abelova@astralin=
ux.ru> wrote:
[...]
> > As an alternative to your suggested approach: could you please look
> > into whether devm_drm_dev_alloc() is a suitable replacement (if not:
> > just explain why - then this patch is good to be merged)?
>
> If I understood correctly, devm_drm_dev_alloc allows to delete drm_dev_pu=
t
> from error path in meson_drv_bind_master and in meson_drv_unbind.
Correct, that's the idea.

> Then the proposed check may be ommited and function may just return
> instead of jumping to free_drm.
That's right

> And would it be better to rename free_drm to remove_encoders?
That free_drm label is very confusing anyways.
The short answer is: yes
The longer answer is: we'll need to work on the removal order again:
- encoders are probed *after* afbcd
- removal should happen in opposite order of probe, so encoders should
be freed *before* afbcd
- however, this order is not implemented

There's no harm for you to rename the label now. It just means that we
need to do some more cleanups.

Looking forward to v2 of the patch!


Best regards,
Martin
