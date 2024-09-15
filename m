Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36783979873
	for <lists+dri-devel@lfdr.de>; Sun, 15 Sep 2024 21:34:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B73610E2FE;
	Sun, 15 Sep 2024 19:34:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="VAx7x7FJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00CA510E2FE
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Sep 2024 19:34:44 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-2055136b612so46905755ad.0
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Sep 2024 12:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1726428884; x=1727033684;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nRpxdaFIHzOzVsYksVQ0yHwIyLAz6RoLwdsQAhW66Vo=;
 b=VAx7x7FJ9xsAa7klDChI9VFq2i6XgFuKPY5OKZOr9gGJ38vjqo3wNOElPMMYdEgFVD
 ro9IZN/9WjOxmOoj299yjF5EYICsdtTcaZFoKxQ7xm8yOX4qZrgcsV1MALPGZPt8fVXU
 A9tv9rGFsGo6l6CFtX5V6B/MtiSgHS1DsVloSUoUNhrFpLZBpNKbKe+xw3xKWAhSLMQk
 9xvGrn4WPoHrdDAXbiaImusjc0WD0slOY+uoJB/AKc99oGxq5HB9wcw16cDPoBrIL6q3
 /HMUTxwMjFi01hBeMCqBRiLFtTRkkFUSUjRh7TDl/sjVaWm9nYyQDgF/vNAl13wsLBlw
 dysg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726428884; x=1727033684;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nRpxdaFIHzOzVsYksVQ0yHwIyLAz6RoLwdsQAhW66Vo=;
 b=cK0RTksaBPoQ3z3AojZ5E3eYWsGMSPNg5dG3n7oeteh2eENR2UOOzzXMpwINOrGKx5
 ij+jJ6Z59z5pRfEtmlMXBqZyTdrnXF6WAVb6Btx8CrvP8veG/ILYkT4GbYrrwXX02nPY
 vpYgU4559ZoxMAsKKTJISMN2M2FE8rxPxHyEz8Ahq6FkKz+OIIC+AITphsAlABNYHfcy
 5XU0yFYwwIiy8lAw/OA8geEP+U2wWkDuDgzukR2H6zQAKwcUPM2FCpBDxJfeIKYPxU/L
 OZs0CBVaGV548/z9vH3VnDY4iHbVKwLwqCmhvzfvsjpuLz5xIbS/RD4AngHutBj73/Vh
 +cBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4naWbXUUCFZ5kfV3uV+HJh9YnwwabS50FmTuwGayyU4Iv8XlZpTvG5CrPALGGBH73CCNlRsFqwXk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqvIJ9skDp5veVg/OflBH+WB50OaHlkbN5tGyV1UfaAhuMLF4Y
 1nQNzr2GtNd4TQTLPzYwVTxCCTtxXqrnmjBWNIn88u1uMLR82PC6sSJLXn7gU5+WB5NwzkhVLwD
 N+SrMMWTb0vNqw93n7UAbpWcEvUw=
X-Google-Smtp-Source: AGHT+IEwWAUsKsReKqUwRX6bFUHcxg5LdPrAbDWpBlNKgtnCiuqZNg9QIOcYa1yarrAewo3Icr/xRF2g9uLNksk5XsM=
X-Received: by 2002:a17:902:ecc4:b0:202:508c:b598 with SMTP id
 d9443c01a7336-2076e447f9cmr210991925ad.59.1726428884437; Sun, 15 Sep 2024
 12:34:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240908-regmap-config-const-v1-0-28f349004811@linaro.org>
 <20240908-regmap-config-const-v1-1-28f349004811@linaro.org>
In-Reply-To: <20240908-regmap-config-const-v1-1-28f349004811@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Sep 2024 21:34:33 +0200
Message-ID: <CAFBinCB=4MtDSc94N-ijgjd0T6-O9pe26Wg+B44miX=iY1vmow@mail.gmail.com>
Subject: Re: [PATCH 1/5] drm/meson: drop unused staitc dw_hdmi_dwc_write_bits
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org
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

On Sun, Sep 8, 2024 at 4:21=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> static inline dw_hdmi_dwc_write_bits() function is not used at all:
>
>   drivers/gpu/drm/meson/meson_dw_hdmi.c:276:20: error: unused function 'd=
w_hdmi_dwc_write_bits' [-Werror,-Wunused-function]
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

maybe s/staitc/static/ can be applied to $SUBJECT when applying this patch


Best regards,
Martin
