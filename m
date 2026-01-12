Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6C5D158E4
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 23:22:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1DE310E034;
	Mon, 12 Jan 2026 22:22:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="O6BeZK8w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D6E410E034
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 22:22:08 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-2a0f3f74587so51509995ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 14:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1768256528; x=1768861328;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4w19gL9Si5xuUOM+xx0Gkc/M1vHSFtlbSnI9ldzTAww=;
 b=O6BeZK8wCndkUqBiSq1WxtWpq+kec8qwnZ6TqE0CzB4SqInlXy5QA1rW07PUu0N8/s
 8eSk+eMU7/pQqYIs7nBNo7IEaS6gadJyGU+tRNP/UTPae3kynPIbJsy2ZKj+SsxznQ4/
 Um7pTpTtfSyD+QRVHYgzb2fTVJ/t9gMFxum92hYrFgfC2kFXvzpBBqVsYGIs8QZhFHM4
 sOB0bbghDVvS/UZsZgVzvcZ1H4YGTBVJMS4cCXStZtaaEAOzY7H4VMkRPCVdkVTKPFfL
 6I0GRrqUbUVWXXGEfpCmkZ3j0BizndGUrmku2VUK4taPZqAjj4hFdhT16S8mAZoP2DvK
 p1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768256528; x=1768861328;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4w19gL9Si5xuUOM+xx0Gkc/M1vHSFtlbSnI9ldzTAww=;
 b=kiMkT3+Uf47LO2H2T3u6h6ZmuFJDGEuE7tmkKvpzqZM7NRS8dHUkMBULhpzpBl67Q7
 fs2ZoNI8OQ+vNv8YMvDUwMi9u4VxN+zcYG84bt5eN2n9sS/C3+B9K5MBX88iFKhUuH6p
 wtNDWcd4VXizVTsCaU0I+JDQ8WvGzQiu8OVwxyM64SGkqo88s/cYrDvNArLb1tckxqX+
 AxOVe3q4KPFkvBbMIOGG2O2QWZSjILTXqKELX82C6MpcA0FwV8FgW2hygvcI0591pVP+
 9jrj3ZiVUM5BCMCAVAdc3IK8s8/13qfTWlKttUuLghBOZSqNu6p7hw0kWKMt9cTskppk
 TjeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXx+oW8uu+iRMlv8E8K+R/fE1ygX9AzX9O/LX3vGFc8XvZ2k5jhpkMvejqsPTLLZkiQFwoLdngiV3c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZiY45CfTkX9vm6WUKZSsrjKeEDmrcTGmZKwjvQ8AiyaIHBW8D
 TMyoOosKI7Q0ZSjhXtmDXfytEbfsUp4fMxi3eVd/3hRk5f5tU06DUqZRgFV7LvpSZGoVB27f8Fa
 QO0AGLJbv+1+LI7NNcu/7PfNxZ1JGWMk=
X-Gm-Gg: AY/fxX6AAjo7IPUSVclWMO31qF9nXcvWxQ/p2yUaLRNLrKqBHt2hxdwtsfORR/MBTSv
 DhiTGl4c1boDObNTNxLwZC8kxx/2wzLRCDSgqkSd1eliJ3b4/H/MNN+lt08CG8Ld8Ha/+17BFOp
 tuL7EP5/dwhKlb9IOkq5C/jwS0wMiTe/2eaCNoWP03Lh4tAzkW4eWSbmDap/ZRvpPqNE3MNJj9u
 oeK6ByNFJvSr1gAuwdXG0RZS2W2WheK/xYC8aS+kAFlVeQdO/NUd7+KhlI5j7tDslg0SOdkkPyy
 0gXOZXoExAs9r91e3ipZl6aXP7Ee
X-Google-Smtp-Source: AGHT+IF7+Y5y+W1I/oKu3PaWNvUb9K8PSy+WoJh05TRnlBlC82+qzM+GksYGzWHyPWmgmkdzBXyTwo91e0gYk9qAGBM=
X-Received: by 2002:a17:903:40ca:b0:295:592e:7633 with SMTP id
 d9443c01a7336-2a3ee4c0fb5mr187274885ad.29.1768256527834; Mon, 12 Jan 2026
 14:22:07 -0800 (PST)
MIME-Version: 1.0
References: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-0-8d7a3dbacdf4@bootlin.com>
 <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-2-8d7a3dbacdf4@bootlin.com>
In-Reply-To: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-2-8d7a3dbacdf4@bootlin.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 12 Jan 2026 23:21:56 +0100
X-Gm-Features: AZwV_Qj9tssGMaPejz2Zl0XwPzPqVqwiSQM5-St_AAUm7gwon2Sgi9P4XfkbVUU
Message-ID: <CAFBinCBWUXNwEDCJNEmdCtOcGO9eVFfZFC9p9fpdRTesZ7xBSQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] drm/meson/dw-hdmi: convert to
 of_drm_find_and_get_bridge()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-mediatek@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org
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

Hi Luca,

On Fri, Jan 9, 2026 at 11:03=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> of_drm_find_bridge() is deprecated. Move to its replacement
> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
> is put when done.
>
> dw_hdmi->bridge is used only in dw_hdmi_top_thread_irq(), so in order to
> avoid potential use-after-free ensure the irq is freed before putting the
> dw_hdmi->bridge reference.
>
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

[...]
> @@ -789,8 +789,12 @@ static void meson_dw_hdmi_unbind(struct device *dev,=
 struct device *master,
>                                    void *data)
>  {
>         struct meson_dw_hdmi *meson_dw_hdmi =3D dev_get_drvdata(dev);
> +       struct platform_device *pdev =3D to_platform_device(dev);
> +       int irq =3D platform_get_irq(pdev, 0);
>
> +       devm_free_irq(dev, irq, meson_dw_hdmi);
I have one question (so I can understand things better):
is there a particular reason why you went with free'ing the IRQ
instead of "just" masking it (so the hardware won't fire anymore of
those IRQs)?


Best regards,
Martin
