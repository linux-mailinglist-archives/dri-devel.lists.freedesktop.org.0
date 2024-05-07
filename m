Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1848C8BEB67
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 20:17:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 250C71125AA;
	Tue,  7 May 2024 18:17:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Zu/nNZHc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C0D1125AA;
 Tue,  7 May 2024 18:17:19 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-6f4178aec15so2971469b3a.0; 
 Tue, 07 May 2024 11:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715105838; x=1715710638; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-disposition:mime-version
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oywe3KQxnS9HclpdVJ/xJA18qSxgQfQDCthEFA5G4rI=;
 b=Zu/nNZHcPBAqqOFWGm9tneUvEEVnalAc0aHriH7/Uj5lDtpsAm/MUK4dqnCecdM0uk
 yXHqJPw4A/qaDdlqAvKx/9SicbZeXPOKH0hsbSxaQRQhguDprkjAK7MyQnEsAH+oX43Z
 HODdBVhT8i73wBIW2yYQxKCVOE3BP1UFu12+aKR7lQVda+WoRqC/1dTtK35Z0mUGeV9N
 a0gifBsnuqAeeP6IWQ5cf1NDxKlAFD2xQe1Sdksmff3k2QqZ0yjz9/f2omNLhbRSfJRK
 Mk+A5jJa1xGhjJOvJn6UpMNIGSTnYq2rteNEqG7VLAcbrCkdkU/GExGVfzplFJLqXnfQ
 3hYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715105838; x=1715710638;
 h=content-transfer-encoding:content-disposition:mime-version
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oywe3KQxnS9HclpdVJ/xJA18qSxgQfQDCthEFA5G4rI=;
 b=erv1GahDavQvCB00oNmS+ECTJomr5KIDLWtNMDOVVWSRmF3+NTO9PGDpiKlT925UHb
 lNrnJQGO1Th78WDySgAbKVxctEtQHOeUXhpztW5gKcBrFr/L5bgI911VPCvvDGwLjplo
 hkN4EMW5CbBou0zB0qxMYAf17Yvf5ipVPVGl1FzNZq3cAu7OH5sgupvYzFLzQQoU10LV
 LjBevbieMnkWNnUxgKD6qZWCzVdZf8ZzJkaX40N3AghNjNypBT7i5SkCkMuOohY0kq5V
 7N9B3jobC6xadsz9FjxYZvjKiro7cTYWJNLiugVq66NNjM57IwT03u/bQgVwqvsuqemT
 bzUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVB7DFiDgS+O3Ex0tSWg1RIqT2MkUhBP9YQtkcRcGO3LM++sRPq60tWdJ3lGKtTkTh13IfKClxLJaXd4Z2sxkgo/Jur8cuJZY5psbWqrAkXLkUoraSqtlu+HzJa4lDf2GMFYKnyteDA3W5rhGEqCWQ=
X-Gm-Message-State: AOJu0Yz36c8M5HbQjYjllI5xVYmiqWHh97gmiEXeAmtLAXsQd0tkwDbP
 RBwXiqjAfJ2uD9h5jFBeseA0OTbq0nTWc8hVkwZnn/T+uXSiam4JKkcsFibv
X-Google-Smtp-Source: AGHT+IF79wDxy40ULqyQ3AY8NDO8JjKVT+9AN9IPZUOxw65qLzqH3fVyRtlaxOZ37moq4Ijxih1/DQ==
X-Received: by 2002:a05:6a20:ddaf:b0:1af:3ff0:f1f8 with SMTP id
 adf61e73a8af0-1afc8ddc12amr516688637.55.1715105838231; 
 Tue, 07 May 2024 11:17:18 -0700 (PDT)
Received: from joaog-nb ([189.78.25.116]) by smtp.gmail.com with ESMTPSA id
 hy10-20020a056a006a0a00b006f44b3e6d3bsm8064922pfb.51.2024.05.07.11.17.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 May 2024 11:17:17 -0700 (PDT)
Date: Tue, 7 May 2024 15:17:12 -0300
From: =?utf-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?=
 <jpaulo.silvagoncalves@gmail.com>
To: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mesa-dev@lists.freedesktop.org
Cc: Marek Vasut <marex@denx.de>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, joao.goncalves@toradex.com
Subject: NXP i.MX8MM GPU performances
Message-ID: <20240507181712.svjjaryisdgfxkle@joaog-nb>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment
Content-Transfer-Encoding: 8bit
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

Hello all,

I did run some benchmark on i.MX8MM GPU and I have some concerns on the
differences between mainline Linux/etnaviv/Mesa and the proprietary NXP/Vivante
solution.

The tests were executed comparing glmark2 results between a mainline kernel
(6.9.0-rc6) running Mesa 24.0.3 and NXP provided galcore driver
6.4.3.p4.398061 running with a 5.15 based NXP downstream kernel.

The GPU is running in overdrive mode (see [1]).

mainline infos (etnaviv):

> dmesg | grep -i -E '(gpu|etnaviv)'
[    9.113389] etnaviv-gpu 38000000.gpu: model: GC600, revision: 4653
[    9.120939] etnaviv-gpu 38000000.gpu: Need to move linear window on MC1.0, disabling TS
[    9.129238] etnaviv-gpu 38008000.gpu: model: GC520, revision: 5341
[    9.138463] [drm] Initialized etnaviv 1.4.0 20151214 for etnaviv on minor 1

glmark2-es2-wayland info output: 
=======================================================
    glmark2 2023.01
=======================================================
    OpenGL Information
    GL_VENDOR:      Mesa
    GL_RENDERER:    Vivante GC600 rev 4653
    GL_VERSION:     OpenGL ES 2.0 Mesa 24.0.3
    Surface Config: buf=32 r=8 g=8 b=8 a=8 depth=24 stencil=0 samples=0
    Surface Size:   640x480 windowed
=======================================================

galcore infos (vivante):

> dmesg | grep -i -E '(gpu|vivante|gal)'
[    4.524977] Galcore version 6.4.3.p4.398061
[    4.587654] [drm] Initialized vivante 1.0.0 20170808 for 38000000.gpu on minor 0

glmark2-es2-wayland info output: 
=======================================================
    glmark2 2023.01
=======================================================
    OpenGL Information
    GL_VENDOR:      Vivante Corporation
    GL_RENDERER:    Vivante GC7000NanoUltra
    GL_VERSION:     OpenGL ES 2.0 V6.4.3.p4.398061
    Surface Config: buf=32 r=8 g=8 b=8 a=8 depth=24 stencil=0 samples=0
    Surface Size:   640x480 windowed
=======================================================


In screen (weston + DSI) test results:

glmark2 command: 
> glmark2-es2-wayland -b shading:duration=5.0 -b refract -b build -b texture -b shadow -b bump -s 640x480 2>&1

|         |          glmark2 tests                  |
| sw ver  |shading|build|texture|refract|shadow|bump|
|---------|-------|-----|-------|-------|------|----|
| etnaviv | 263   | 334 | 291   | 22    | 63   | 328|
| vivante | 544   | 956 | 790   | 26    | 225  | 894|

we have 50-60% smaller number with etnaviv.

Offscreen test results:

glmark2 command: 
> glmark2-es2-wayland  --off-screen -b shading:duration=5.0 -b refract -b build -b texture -b shadow -b bump -s 640x480 2>&1

|         |          glmark2 tests                  |
| sw ver  |shading|build|texture|refract|shadow|bump|
|---------|-------|-----|-------|-------|------|----|
| etnaviv | 348   | 541 | 466   | 24    | 81   | 498|
| vivante | 402   | 624 | 520   | 26    | 177  | 557|

we have a 10~13% smaller number with etnaviv.

Do anybody did run similar benchmark in the past on NXP i.MX8MM? With what
results?

Is it expected such a difference in the glmark2 tests results?
Any idea on this big difference between running the test offscreen or not?

João Paulo

[1] https://lore.kernel.org/all/20240507143555.471025-1-jpaulo.silvagoncalves@gmail.com/
