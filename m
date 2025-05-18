Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 144B0ABB0CC
	for <lists+dri-devel@lfdr.de>; Sun, 18 May 2025 18:21:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 588E410E066;
	Sun, 18 May 2025 16:21:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CEF010E066
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 16:21:24 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-54298ec925bso5393264e87.3
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 09:21:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747585278; x=1748190078;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=R4350qFjP5pmMxVLhOYIwlVLJLk/mrj5F3+vFg2NAYI=;
 b=UWrtHKRq8sneUks/EvKM91PemY18R2LDoC0PbDcLcrxzM4fhxIgY2e6qN56S1oDRO7
 hhb69Gf3kHXtFKNDT89u60fit7AXIImhEcOeDVHNRg4NCTadlwe9a/cbkbaV0xsvZSZl
 CRm6IgFdtD4PmhIUzmIJ+dpWFqp68/gt60gPH7BfTZjCu4b74M+80TTcXnn9FboXOPX6
 1swnMbB74gb8c26Rk31UR41icpSc+12joqZNaq+UKNQ6Euwbni6bPUf/1ZxsPEeMG870
 JrluSkg4NnjeA2Oyp354Rd3f+eOOjBHodRu9iXlgHVj8o7AUygi3+wmp9mzCNRfX1L8e
 5SdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkuCuuJhUgYXXb972lywP9pmzNJSCd7ejJndfYK3QS8gw7WC5RCB4QS8vv7aeGoGK685Lmqbuxu1M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjypAF1YwJ1MOCBOLfvXdV6k2NqhlHdjYvG/0Z/XR9AA79oUOd
 8AjClmonQaE1/OapbqZLmIli4UkWJwoNb05tluT3mBarAbNQVrOOPSk0Aa8luKs1
X-Gm-Gg: ASbGncvr5qcfenh0Yh1nbVWvU7vfYXWCqWvST1i+z4dIasrX/LlLavXMIShw/0pks0h
 5M6hnc9OraHi0T/SFnkh95cStqhH5ndgCEGLeBUTQUr7esdlMN1gEUqqkrXeg7KSZwDPypk7nJd
 2gnzcp/RrAaHW7VLpIa+grgOQ3BAHiTNp/FrJXHujuMIQzD+mAfmpEdhM60xdc/Z9njk7atf2Rt
 qiki+prVc0p6wKERhtTQXzlL+9pSmXmKINW6U33ylgsqhURMWg+cnG22S70B8e77UGw+GfVYa2q
 RZGNJ6wA8U/IY2zyJwGaPPxItbsDHhrAe2gQCr5G66fIUMt1TQcNtBMXBS17ACDb+qCSzLIUScP
 OltNoj6CY
X-Google-Smtp-Source: AGHT+IElD1HT64L1aoVYKHkDnJK9RaYUdwkzctaC8/5qI1fazeMpP5qM85HUjyLbIs9clFQzIQu91Q==
X-Received: by 2002:a05:6512:3d03:b0:54f:cfdd:276c with SMTP id
 2adb3069b0e04-550e720b9cbmr2989207e87.34.1747585278172; 
 Sun, 18 May 2025 09:21:18 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com.
 [209.85.208.181]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e702cf77sm1452491e87.184.2025.05.18.09.21.16
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 May 2025 09:21:17 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-329157c9f79so1704131fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 09:21:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWLhxlK3Oh7qqw7n+RnMqkukwPiTxrJR6wVUXdSnHTbh6bkbU06bg2aGLz6DNOnNeQdJyC+CJhLXlc=@lists.freedesktop.org
X-Received: by 2002:a2e:8a9c:0:b0:30d:7c85:14f5 with SMTP id
 38308e7fff4ca-328077a2e48mr31714831fa.25.1747585276327; Sun, 18 May 2025
 09:21:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250516105101.11650-1-ryan@testtoast.com>
 <20250516105101.11650-2-ryan@testtoast.com>
In-Reply-To: <20250516105101.11650-2-ryan@testtoast.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 19 May 2025 00:21:04 +0800
X-Gmail-Original-Message-ID: <CAGb2v67rSp-ap+QkBX=gATfaxDWbBM0aMn_kjNUP10giLKFaHQ@mail.gmail.com>
X-Gm-Features: AX0GCFuJznDa_ICl2sGWtQLsZH04UWSn1aHqHteb8YSDT7ZfJxBtky01EaefvaI
Message-ID: <CAGb2v67rSp-ap+QkBX=gATfaxDWbBM0aMn_kjNUP10giLKFaHQ@mail.gmail.com>
Subject: Re: [PATCH v11 1/8] drm: sun4i: de2/de3: add mixer version enum
To: Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Andre Przywara <andre.przywara@arm.com>, Chris Morgan <macroalpha82@gmail.com>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Philippe Simons <simons.philippe@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
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
Reply-To: wens@csie.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 16, 2025 at 6:51=E2=80=AFPM Ryan Walklin <ryan@testtoast.com> w=
rote:
>
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
>
> The Allwinner DE2 and DE3 display engine mixers are currently identified
> by a simple boolean flag. This will not scale to support additional DE
> variants.
>
> Convert the boolean flag to an enum.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
