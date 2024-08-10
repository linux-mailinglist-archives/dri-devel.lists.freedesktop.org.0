Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1770794DBC5
	for <lists+dri-devel@lfdr.de>; Sat, 10 Aug 2024 11:09:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8501B10E122;
	Sat, 10 Aug 2024 09:09:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="WQS9Tua1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A70A410E122
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Aug 2024 09:09:52 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-1fd69e44596so20024565ad.1
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Aug 2024 02:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1723280992; x=1723885792;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lIhiNkZ8ivhgmM1Cc6VYiyybqghiNsm+0JIy+oF46uI=;
 b=WQS9Tua12/+NZuevpJrtaPVUdZvXVHkQleDA+w34u40g4RRFCNuriao08NFMdmov9Y
 cL4oiFBpTVfEkMDlOO2+xIg2myk3TXiAyOZVwxsHBJgFS55zpFuzz/Z3PalGMXPWa1hF
 dA+8gTaUFV3S/+LRi+cXdSGBZqz7s9eXWicWjFe08ah+iQbWPg87+p2oqWnwLiGbd15S
 aj5FxeRLII5Z5jJ1unbrIJXgXCjqSG3MzVOh4306JxSdwGVKi9995XAnh3qd3wyja9/m
 5bwk6Hjqju7Wg1T9LHwLt2an0LqlMDUJoW8VeXhtv0ZYR+/nm4XEGExAWPkpculiSg+P
 lwnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723280992; x=1723885792;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lIhiNkZ8ivhgmM1Cc6VYiyybqghiNsm+0JIy+oF46uI=;
 b=OLzMAlW+P7cl87g1x0AYi8hc01IqXXbv+Obb1jx7DHM4jBzmcA2oLAs+UnkTp2jwZm
 9ecnJvZmYwkaXA8XLygwexfAzsZvfGdhy8yHcXcXiBc1s86PiepTo8W6b3xUtYipX+aa
 VZqvvko+SGk8UDDo7sQxGmZsmmE9t07MDdEXJQidqCWfaB+pbSe5Qfwjjsr8Q191erhj
 UHCoJmneCN973TXeJ+M0e7fFAO1Y48LirCXzpmB/qMELVKAFINwDUGvayCdOvlXZ5U0C
 tvuLPKPOfilGUVPCVZCB8SIHj5vCU6A2Att6ASpq9pDzJHcojRMKs5G5oyJWm9HiqWTG
 3b2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVY6o9Ijy+rM4PeTtwblLnGQ3Mx1Vz0zJZB6t/voxbqULvrzz3ybV0w8hOPWDlHO7wQY1VnQM0QLVStv6mIW1khrQZqvJOIKINvHqzUFVXT
X-Gm-Message-State: AOJu0YyNxwx7yXo7DliKOpfwaFbNbRMtj32VQ/DLDhfG6ntg0Kzb2Zv4
 RINdpYCG6WFP48lNb7yd1PwrHifR7VS5qWwROZbY/otcK/n7Q69hUfPTN22m6Nw1iWyipZqC49n
 F06MKL/IexLaH84bmQOvdEPghyZo=
X-Google-Smtp-Source: AGHT+IF0omZAMZcq00ACjBVeu35rKGSbTQfOx1gz2tQVmuRuPcEz5qrubbYp8kV3RZnFuDT5aznCRbdgeLj6EanoUrE=
X-Received: by 2002:a17:902:d482:b0:200:97b5:dc3f with SMTP id
 d9443c01a7336-200ae5d86afmr58455285ad.21.1723280992065; Sat, 10 Aug 2024
 02:09:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240809124725.17956-1-abelova@astralinux.ru>
In-Reply-To: <20240809124725.17956-1-abelova@astralinux.ru>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 10 Aug 2024 11:09:40 +0200
Message-ID: <CAFBinCATiUnR=P9VRBxWeQhf49k6PVxK+nU95G7w94f-mR2HWQ@mail.gmail.com>
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

Thank you for working on this!

On Fri, Aug 9, 2024 at 2:48=E2=80=AFPM Anastasia Belova <abelova@astralinux=
.ru> wrote:
[...]
> @@ -373,9 +373,11 @@ static int meson_drv_bind_master(struct device *dev,=
 bool has_components)
>  free_drm:
>         drm_dev_put(drm);
>
> -       meson_encoder_dsi_remove(priv);
> -       meson_encoder_hdmi_remove(priv);
> -       meson_encoder_cvbs_remove(priv);
> +       if (priv) {
> +               meson_encoder_dsi_remove(priv);
> +               meson_encoder_hdmi_remove(priv);
> +               meson_encoder_cvbs_remove(priv);
> +       }
This is the straight-forward approach.

There's been conversions from non-devm_ functions to their devm_*
counterparts in the past in various subsystems.
I just found that there's a devm_drm_dev_alloc() which seems to be
calling drm_dev_put() automatically - but I have never used it myself
before.
As an alternative to your suggested approach: could you please look
into whether devm_drm_dev_alloc() is a suitable replacement (if not:
just explain why - then this patch is good to be merged)?


Thank you!
Martin
