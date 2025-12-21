Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E0FCD460B
	for <lists+dri-devel@lfdr.de>; Sun, 21 Dec 2025 22:50:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C4610E288;
	Sun, 21 Dec 2025 21:50:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="SJt5z3Lm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 422ED10E288
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Dec 2025 21:50:36 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-2a0d0788adaso29265055ad.3
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Dec 2025 13:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1766353836; x=1766958636;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I8ESPuhbHJz02YptQK1tw7Lrl7Cucbn6A3EDj5euzbk=;
 b=SJt5z3Lmkwunx3LFUsyLK6+GiON5/8gJ+TnXvIP+CXWikokQ+/trgOkSLaILIY+EEo
 zEZNNN1iMAzDky4J+vRsIhZkRsK7YESjSxmpDQO1ufw2W4we+mrTPh2WNZP8Iq3xX1t4
 3BcZfwRAdVNsudE7HhVEUzh6XuvkcOjbWQcxYhgW4VrfNRnEgA+DSelDwnkvy1hiHT0y
 WMJzu37Rz1AvBmE7T8k3k4iTO5ycTcxlc1B9f0mRO/FUrJRN3N/SZpbOL7ma5FcBhw7t
 ursQD1ytNm/t4LUUx66I/7gV0C7b4QFRlwrW3r6J12Q4CZN5G+UBb+uaRY59Z0S7Mvlq
 hIZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766353836; x=1766958636;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=I8ESPuhbHJz02YptQK1tw7Lrl7Cucbn6A3EDj5euzbk=;
 b=eWNhWF3uE7UHUH0O9c9uxqC58cSOmjmJwj1NqIjz120v4bvaKIRslTs03I4XJhox8U
 WEkORVUlpXVEhaFd8VI/mzO4qfqcfYTW7YpEDywkyItnEWYxfFUUqwJkmtHp67FoIpmS
 NeoxVOD8lAHayxUrugNmJ4pSkUUq9FHk8FnCBUgoSxnfyC9v4EKICpvziVefGAy55wjH
 e6/8+Cq0uZ2dwqNEhxAkI2uHbW+jlwDbMCZEY3gLq8AJ+NPccrek6hYMdqwl2J7n7xCS
 aeQu6huMhvHpFmZt/08Ok8oe0AS2PaKP4rF2qUf9wmvstcCePZGmoe0N5xneQtpwJn+U
 kZCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWp20vuHUOk9o7TfQLXFvq9VKKLZ1N9FPkXf+/QT16Su30ikvHSIPl83st+WhcKuFT5L7FHYpm7Vkw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx36tIs/A/HnHg8QiHTOTT/xkK8hZqqRq+/vW09KuFzAnfUZBNh
 0V9INp6zb5Ddyf77/PlcJe772QInASXVqtesX3tNGdvkCcKHQDQs0x2fPHgKKJa5zLLNnOVO5Xn
 56PAF+g7ryeMMt5eUIoWgw8GpuStrdsY=
X-Gm-Gg: AY/fxX7GQXfPaZ+WNGBSlWj8aXrYvkMRQd6jhWeG9x1OTghErUe/Z2gJ6VXwmR5J5DW
 YqVvLhdzcsEK/yxANXYCvx1zOnKLnnOk3BbIv8jlp/E36RwybRsislbxDTFR+6o3955Fci+1q0H
 Z/Kj6dwRkX1YbhhTEWQnetwKmeJTqxrH+WW9JvKievSuOmOGtJlCU5xp8Zb4A4DFATHphiJ42iY
 QesvVachLzGAShwUOparilcbHsMGtzy8q2lZHKf46t4BmdrweBm8Fr/FJcwHD17L7HqHsEtSElP
 QLdsnEVBSY5PZhdnfKwyQ6T0wskb
X-Google-Smtp-Source: AGHT+IGw0n+Vw3mSNWIuK6jiR5TwNM1Orq2NMptHhH0WFtIprggK0653bvytXvjKFmmgd9+xofkm/n3sIE9SOEugciA=
X-Received: by 2002:a17:903:b83:b0:2a1:388d:8ef3 with SMTP id
 d9443c01a7336-2a2f222bc6amr92154845ad.18.1766353835637; Sun, 21 Dec 2025
 13:50:35 -0800 (PST)
MIME-Version: 1.0
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
 <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-10-b5165fab8058@bootlin.com>
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-10-b5165fab8058@bootlin.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 21 Dec 2025 22:50:23 +0100
X-Gm-Features: AQt7F2repQdtBoV8d-ez3LVKkRTtOC5SATWZ81V_d9C-sFP5czyoEjd7MirbIfc
Message-ID: <CAFBinCDt=9H1ccXatr8JYA=atG+vDCBX9x0xor9kibUfo1NKpA@mail.gmail.com>
Subject: Re: [PATCH v3 10/22] drm/meson: encoder_cvbs: get/put the next bridge
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
 Jonathan Corbet <corbet@lwn.net>, Alexey Brodkin <abrodkin@synopsys.com>,
 Phong LE <ple@baylibre.com>, 
 Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
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

On Tue, Dec 16, 2025 at 7:00=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> This driver obtains a bridge pointer from of_drm_find_bridge() in the pro=
be
> function and stores it until driver removal. of_drm_find_bridge() is
> deprecated. Move to of_drm_find_and_get_bridge() for the bridge to be
> refcounted and use bridge->next_bridge to put the reference on
> deallocation.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
