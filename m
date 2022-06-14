Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C5D54B4FA
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 17:46:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEC901127E3;
	Tue, 14 Jun 2022 15:45:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AF311127D7
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 15:45:58 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id kq6so17968968ejb.11
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 08:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YSB5MTfStk1UspqZc+McpHC5WrZMD/bRWtNH57v7Pi8=;
 b=GMGDlORopVsfXCvr45KKTAZgyKiLinGmJP2++AkxuZWakX4DhNgvG1i9J6wUmCLEPZ
 pYjhhb9/n4/K3dV/LoJnfWi9Ev4QLvBEo7GBmQXWaFn43GMCGHMs6mKdDc0WvOB57thE
 b139b7GZPQW7DIQOit2W89RVb31QoAfooMGSzC2/2tk7cSUIDZEcslP5o0l3UOST1PsR
 BeBVPXDeRp2qRvNa6zAP/fGVSeEUtNg4fdJq+EOqkumXhoz5mnZBtpmE6+ZWbQC4uJRl
 TeKxjnN/Pi919oQPJn3jG6iIWR+9dEp75pCEWqlKNZYTznlUO+SPXT0a4OinMDQaE5NI
 Ex1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YSB5MTfStk1UspqZc+McpHC5WrZMD/bRWtNH57v7Pi8=;
 b=IleShAdUFUkfHJ+ySw4yYtuSlNypbpIQJ/3q9cGT6l0+Oq0pF9QGgg99lP6AWhIGdX
 RXBwxCkiOzAOnChfm2ab/kDR8aZkuI1uP4oWvAWYIrUrdDdpadXFqTQN2eEgelLzdTsx
 beSWyOAvlqx8gTMLLCjB6/8BxlKZXIuKzg75EYKRBUxMlxmojE3zqxLBlgVr005dFZTg
 KUXSqc/bIhqM00LLwbpf/r2n25iSKB6MMSE4Z6q7R7qxP803zyuOdWjkDIpY24QfaiVE
 ZLu/iIg4K71vftRW3cE0rmbpMzpbvKk5LLR0y0TbNJ5nK7b7omNDebPSTw4xeXv09JAq
 mXAQ==
X-Gm-Message-State: AJIora8ReV6RgBROoa6dG4zvbgbafG+g0kD4xBimUFmI7ZdUJVdtKk/m
 XeEijGNvnTIHSYJD9u7Gdy8=
X-Google-Smtp-Source: AGRyM1t6j6k1HmO4uYue7LESoFEcMf8JICSTSvZZkVWPlcUQUTc9Bxqf6cAzusx7gQvkL9WUcNPxOw==
X-Received: by 2002:a17:907:9496:b0:711:f459:664 with SMTP id
 dm22-20020a170907949600b00711f4590664mr4815819ejc.704.1655221557066; 
 Tue, 14 Jun 2022 08:45:57 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net.
 [213.161.3.76]) by smtp.gmail.com with ESMTPSA id
 da26-20020a056402177a00b004315050d7dfsm7271922edb.81.2022.06.14.08.45.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 08:45:56 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH] drm/sun4i: dw-hdmi: Fix ddc-en GPIO consumer conflict
Date: Tue, 14 Jun 2022 17:45:55 +0200
Message-ID: <8075386.T7Z3S40VBb@kista>
In-Reply-To: <20220614073100.11550-1-samuel@sholland.org>
References: <20220614073100.11550-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Paul Cercueil <paul@crapouillou.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne torek, 14. junij 2022 ob 09:31:00 CEST je Samuel Holland napisal(a):
> commit 6de79dd3a920 ("drm/bridge: display-connector: add ddc-en gpio
> support") added a consumer for this GPIO in the HDMI connector device.
> This new consumer conflicts with the pre-existing GPIO consumer in the
> sun8i HDMI controller driver, which prevents the driver from probing:
> 
>   [    4.983358] display-connector connector: GPIO lookup for consumer ddc-
en
>   [    4.983364] display-connector connector: using device tree for GPIO 
lookup
>   [    4.983392] gpio-226 (ddc-en): gpiod_request: status -16
>   [    4.983399] sun8i-dw-hdmi 6000000.hdmi: Couldn't get ddc-en gpio
>   [    4.983618] sun4i-drm display-engine: failed to bind 6000000.hdmi (ops 
sun8i_dw_hdmi_ops [sun8i_drm_hdmi]): -16
>   [    4.984082] sun4i-drm display-engine: Couldn't bind all pipelines 
components
>   [    4.984171] sun4i-drm display-engine: adev bind failed: -16
>   [    4.984179] sun8i-dw-hdmi: probe of 6000000.hdmi failed with error -16
> 
> Both drivers have the same behavior: they leave the GPIO active for the
> life of the device. Let's take advantage of the new implementation, and
> drop the now-obsolete code from the HDMI controller driver.
> 
> Fixes: 6de79dd3a920 ("drm/bridge: display-connector: add ddc-en gpio 
support")
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


