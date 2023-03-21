Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 566F66C3C01
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 21:40:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E055710E2AD;
	Tue, 21 Mar 2023 20:40:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B597410E2AD;
 Tue, 21 Mar 2023 20:40:24 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id z83so18797627ybb.2;
 Tue, 21 Mar 2023 13:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679431223;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rnJYCIHb3YOLk6h7F2Xo1WPCj6zYYjtkpvkZ8wpoQJs=;
 b=jLlwwP11Eqd3QcuN1GuSMsYw65pUik7rYOLx5A1BPNTMKYJnucTWfSjnqUytJNHQXy
 GlAFJL6HyR3XP707iPGwPLT9NY80fMZ/hCISBwSyJBwHfz7eX+lK3CL2OIHoNHXO5Kyz
 no+vIz2/4ucVrHHNXkTOmblHIkWNlzdaISIxpB3ZjQRTD5u2I/FgqtMhRgiy9YzTWTcX
 waavRaNlKiFGoog+iFNJImDr8t2BuR/0PLfTa74EW/SK1wMrTJ1l2qBB/fA5N5Y/t28Q
 /rPFIaJLKvcae0dQ9PRxX/RisjwpluW3tmFgSdLMjx7xzAexmNpGqZa2XA5/3IwG7ffU
 1+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679431223;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rnJYCIHb3YOLk6h7F2Xo1WPCj6zYYjtkpvkZ8wpoQJs=;
 b=6a5cK5pIpk+RnOJQ0hUyUWeFrLX+a5Cer0RWhTEDgGiGPTnxjGmg/+T5aearAZRFC+
 Kk+BiYOum+QulQT9zM3KZdb66JWcyod+hqP43N1Yf+8HS+Xx3pPK8ayrcThCuHequ9Ka
 hYxXT/o6XH0nqXEnm4tKtC5OKJW8tObvXEcYTXXolrS7fuUv85+EVMZVqNuMAe66cD+0
 y27TBllv8zJDsWBvuKt8vjCC/yt1jErZq4JWjzRxBjqpTLVyKWxl1BvAeWZtlNNVJ6cX
 zHYFFDJh3BriUE8CBmzqi9fB0kwYOtqePfZ1NXAkZiSYGHSfLp/GSULitp/wGVnmLSlr
 WkrQ==
X-Gm-Message-State: AAQBX9cGrkdHBH400qXjqQY6EgX0ZxmIFuOZH07HavxncLmmHCZJoKpE
 9oT1qv+tCfDZaKI3rU34wSbdQJdP7RrvR2q8Q3U=
X-Google-Smtp-Source: AKy350Yr0lFcvlrRV/aUYAmitKBlF/YIDHoHGNgfQJQ9fN+jGmA0gMeojAbcNNdTi/SlMNF7cHZPfM6jxoOO65XX8gM=
X-Received: by 2002:a05:6902:6:b0:b5c:f48:3083 with SMTP id
 l6-20020a056902000600b00b5c0f483083mr2322649ybh.11.1679431223686; Tue, 21 Mar
 2023 13:40:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230320233823.2919475-1-robh@kernel.org>
In-Reply-To: <20230320233823.2919475-1-robh@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 21 Mar 2023 21:40:12 +0100
Message-ID: <CANiq72m+cNuGiU_J9xU9QKmQK-ncD=1Y5imskrFNFSezzmjq8A@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: display: Drop unneeded quotes
To: Rob Herring <robh@kernel.org>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Robert Foss <rfoss@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jyri Sarha <jyri.sarha@iki.fi>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, NXP Linux Team <linux-imx@nxp.com>,
 Miguel Ojeda <ojeda@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 linux-tegra@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-mediatek@lists.infradead.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Tomi Valkeinen <tomba@kernel.org>,
 Robin van der Gracht <robin@protonic.nl>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 21, 2023 at 12:38=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:
>
>  .../bindings/auxdisplay/holtek,ht16k33.yaml   |  2 +-

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
