Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D179F9498FD
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 22:25:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5657310E3F5;
	Tue,  6 Aug 2024 20:25:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="HeInmlC3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD65310E3F5
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 20:25:00 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-1fd66cddd4dso11668575ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2024 13:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1722975900; x=1723580700;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N/OZFOxNdt1/7u2anSXT4uxWU90giXBBt1zgEgss+ZI=;
 b=HeInmlC3mxnM3nVdVzCCb23yQf6nMwqW7vdXP7mBKiIWth1tDrctRpVVhs2KcBjXyZ
 4vyIrj4aZhm9bwfYRoizvmDBegYNler8KOs4lpccPX32KjwSmzQWF65ZW4Dgy+BYk6Vs
 qgTVME3Bd3zFAux1zNm+4Ui0qXWP6gicJSo2fykvtiD8kGXiHvUF54mvr5FAoKz77dOf
 2+tSy26w/oEgbEuMO4yQBDuJaxkoz2kfzrEd3KIe0/vh4JuLE5PjP87B+nDD6xHzaMk0
 eknmpi0C3NeNL+DWH7Y9QoTaoqg7qzKYCtKm7elzb09rLC8ugtvt9DBcr2NGaB43iEUp
 cJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722975900; x=1723580700;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N/OZFOxNdt1/7u2anSXT4uxWU90giXBBt1zgEgss+ZI=;
 b=h2Kaxlp4y+fFyjeUecgzxbwf+3jP3tBWCdOQHmywHhAjGcfBq9uXbVBxpgw7sKSlag
 4bKM8qTjCzZhZebjqYsiEV/au98HBMGX5LPTjmKYnRRuMQI/Vz7nxFCNmjjgoSF3XFpv
 AmkgiW4SGWhNJ7J7N1xlMpQaGwpe3HoGbAVm1tFykWWqwod0ZLDLn9RKkTT1fYlhTu0W
 wq1M410budNCq9JzXVJ0jqXKjWzRxjBNRJ257CfxVhxlZ78nhqcRcMXJkGmRXSSa1vIJ
 tyGlqPnXmVbbi+lQzxyuyaY/1cE6Z4orBmG9X/XiMq4TE+mlZ2NcOvTom5RlGTmDQDGL
 WizA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZ+2OGnQ4Qb+IU/NWjR5ppz8VhPC0WXPIvh/rQBBxP92m76M/VYOS/3djgn++vXdCey5wDddoa2UCmOX9/O8ErMO7jaG5X6LfcyIouYT2C
X-Gm-Message-State: AOJu0Yydz/uIOWVpcrkY9buWVQ/Ql55/zpYORrdgAw/4AHTQZZ1GbC2D
 GgviioSHqprtGgFVyhokPl1W88X1/C/XaoorMdca1cQFxff7KSEk+cLXbYFtkRWyW9QNre00AJy
 dcuVgW69d9lh6YLKQtNFCUW+GM1s=
X-Google-Smtp-Source: AGHT+IFlOXea9xY5WykUEmvYYAM8wx4DwXepEDxVhNlPibwTYKIK3m/8aLtBzWoY74h9NIrpPaky4Gm7SJWyH642cHA=
X-Received: by 2002:a17:902:f681:b0:1fd:73e6:83c7 with SMTP id
 d9443c01a7336-1ff573cc797mr178847085ad.48.1722975900222; Tue, 06 Aug 2024
 13:25:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240730125023.710237-1-jbrunet@baylibre.com>
 <20240730125023.710237-3-jbrunet@baylibre.com>
In-Reply-To: <20240730125023.710237-3-jbrunet@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 6 Aug 2024 22:24:49 +0200
Message-ID: <CAFBinCB6x3cs3HvrZLaL+qpF1bfuMiRO0nywJPYDa+QUj3c3=Q@mail.gmail.com>
Subject: Re: [PATCH 2/9] drm/meson: vclk: drop hdmi system clock setup
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Kevin Hilman <khilman@baylibre.com>, dri-devel@lists.freedesktop.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Tue, Jul 30, 2024 at 2:50=E2=80=AFPM Jerome Brunet <jbrunet@baylibre.com=
> wrote:
>
> Poking the HHI syscon is a way to setup clocks behind CCF's back.
> Also, 2 drm code paths, the encoder and the hdmi-phy, are racing to do th=
e
> same setup of the HDMI system clock.
>
> This clock is used is used by the HDMI phy and should not be set by the
> encoder, so drop those HHI pokes from vclk.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
