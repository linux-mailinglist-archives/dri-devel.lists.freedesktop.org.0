Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 258DC9EB560
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 16:51:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE1DD10E8FF;
	Tue, 10 Dec 2024 15:51:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com
 [209.85.217.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 541B610E3B4
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 15:51:02 +0000 (UTC)
Received: by mail-vs1-f45.google.com with SMTP id
 ada2fe7eead31-4afdfd3124dso979718137.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 07:51:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733845859; x=1734450659;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VM5eZtEFSnellC7wxhcnLuAYVI8OYFt4yC3DLm0J29Y=;
 b=SwpawCUxH3xVoC6vmtt/To6SXjxSJNkMZihsmj3jqlgqraoC2B3QXfJfWV9vj/ARr2
 nGrNIgA/hp5B7rntQuawU4YzwMvennXD1DjI6hPfHFbwm6HwEd+xo70SXmCRydeUS7Co
 lStLwkQ9yozSiYvhzllRhgv7zmvJBprC93rZ1TJFWJtGlR25n3xl03lgcvgNhNQ5m5r/
 6scGGO1l0v51Uk1P7miYKKvpf1U76NUm+0uc+QQFonsuApzbOBgq+JTxTK6B+WDvp9Nc
 HGHmPfr1vJPtCupmHjQ8UZq4zigAU56brKisU4s3jcHDqqOcoE3JeFS/1sl7ixcuXPlY
 6Hcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUZ9+qF5TAjNM5ZVlGmkEaCWAtVkLZ0nvdAoakvyNOFyDRGdOIprHbEvE+SkkgctooCwyxyhurFf8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWOCrVz+3I1WL4qwesQS7hfy8xoKCzPFTqW/B4bWGJ7smd0jfK
 r2YEjYkC4yL2Rt10wCu9vm9C8a0zUc4PjnlwXXDlrmqh/9yui1r5I7v+seys
X-Gm-Gg: ASbGncvGQyDIN/3Z6twsOn71htYb9QaAX63vtPDU8xO3nrtJCCpNb7UIeghg4tw0SaK
 g0CZm/0f7bpi4h03dcEs0lL/szlnxDK/sFlBDznk0U4vKgQhXDD2t3lINELi9cs/3XBiXZOMnCM
 WODpsYEd2N7owiPgMhpaXkOk3qNfcdeB6rs/EjuLOD01mtYI6JcKf7+Oxh4/fytmXI92NFvqOfT
 zz2T8L4vXDVsHWCL3j3WXlpO7vmYR/Oo1FJ3snFc8CGlwhxbFwptABpkKBNJiOZ8wQnNC78y2HP
 W2fECvtGAkLJnYvL
X-Google-Smtp-Source: AGHT+IEF2e/LjXAW3nFG4tdUeZk9APo9i71qbPmV2wH8sUKqsHMzsjli9c4dj3VO2YIDe36FIYuNNA==
X-Received: by 2002:a05:6102:5092:b0:4ad:5c22:8412 with SMTP id
 ada2fe7eead31-4b1161c2827mr5979494137.17.1733845858983; 
 Tue, 10 Dec 2024 07:50:58 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com.
 [209.85.222.49]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-4afe27c75eesm897989137.10.2024.12.10.07.50.57
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 07:50:58 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id
 a1e0cc1a2514c-85c4cd95885so824682241.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 07:50:57 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXlHuZkCJzPxaKBp4SlwFAa958IPaB6qui8FyCCIp9LaSq1YNM8bUf0laznEPp48HwZ1Yc1Lt7w9Mc=@lists.freedesktop.org
X-Received: by 2002:a05:6102:3a08:b0:4ad:497a:268d with SMTP id
 ada2fe7eead31-4b1161c25f5mr5617537137.19.1733845857539; Tue, 10 Dec 2024
 07:50:57 -0800 (PST)
MIME-Version: 1.0
References: <20241206-rcar-gh-dsi-v3-0-d74c2166fa15@ideasonboard.com>
 <20241206-rcar-gh-dsi-v3-8-d74c2166fa15@ideasonboard.com>
In-Reply-To: <20241206-rcar-gh-dsi-v3-8-d74c2166fa15@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Dec 2024 16:50:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVqO0MUVNCuynHGdH4cQaE85FzOei=8QAzQXfp8d07epw@mail.gmail.com>
Message-ID: <CAMuHMdVqO0MUVNCuynHGdH4cQaE85FzOei=8QAzQXfp8d07epw@mail.gmail.com>
Subject: Re: [PATCH v3 08/10] arm64: dts: renesas: gray-hawk-single: Fix
 indentation
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Magnus Damm <magnus.damm@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, LUU HOAI <hoai.luu.ub@renesas.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>, dri-devel@lists.freedesktop.org, 
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-clk@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
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

On Fri, Dec 6, 2024 at 10:33=E2=80=AFAM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>
> Fix the indent on the two regulators.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.14.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
