Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE1B4FC19C
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 17:54:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD0710E65B;
	Mon, 11 Apr 2022 15:54:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B42D10E86A
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 15:54:29 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 u17-20020a05600c211100b0038eaf4cdaaeso3748791wml.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 08:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nmuYtqAwEElb8nxVd+fxQ89gGHmXquxvJjVsYoqHv2Y=;
 b=keocVt8ryOJFNtu5Az/dug++DkTAI4OLWaFHkX4cvSsY1xV/Wskbcl5ImhbUzHtCaE
 4OMIC3t4sUW/61SlvymjUxxHekkkGk8zMK66fM3+/Ff7PxoGkiTMizk0GgsSIZLo/faB
 kLIO1o1ZFqcHSMwQjOHxjyHcqO6AYi7MqD6XDvPzTCtq0xAgBohx+LNW4dE7cbKZg7js
 WdIJ2O1rpMwswpbjOOCj2iLMgUeClP+tOnqgOJc6YJeAyfnjPl7nyIpmEYi7YQvceh2V
 q8elVAXixGrrTSNmOmBdmnykQ14lXvMlgHWhHaASaJrj6SOf2cOsJHVG1CQKSGJ1JfCK
 IUJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nmuYtqAwEElb8nxVd+fxQ89gGHmXquxvJjVsYoqHv2Y=;
 b=K8tdEY5+XvrV6ZB0bWOHZb1WE0AQGjzKUILtDqhjp4AsUOFiFbkMbBKDMzqfINo8ZB
 0Zilq+RaN8Y9ExKNp62rGcb0vyiepj5JhZz0j8y8J1Xmtnxopf2F7e5O//57CZxUO2na
 BeJG95dt9ftZxvUm5FJj9lNvoByOn+0A5+ATm2dTFisFO0KRsQyIlneCHg+8Dy5ismDN
 PXSTdw2oQvn9wYWPsGwZ/c6WcRDR5Bn/zlaTXelGL2FBe5QMW1CwM2KlQlAhBXu5Kaus
 sg4QWpVvzsEgICbwmAuqm5+AZ4lLbPcpAclvOjK36Q44Cej9doJG6nZ3xaSMlH+QXbRl
 EuUQ==
X-Gm-Message-State: AOAM532julM9xaRC7+hK2ql0dMZbyAZwPlhjuBPG7nzNJACuJHQMqS5Q
 fBngR1WVbmpPahuIPt7c9s8=
X-Google-Smtp-Source: ABdhPJwKMQkKpncM2rJZD2K2/Z9LaMxbxU3HY7D5aMcEWRGUB8rsH5POeRJ5rWtiP9HOlGX7T5u88w==
X-Received: by 2002:a05:600c:4ecc:b0:38e:354d:909 with SMTP id
 g12-20020a05600c4ecc00b0038e354d0909mr30666672wmq.33.1649692467942; 
 Mon, 11 Apr 2022 08:54:27 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-32-107.static.triera.net.
 [86.58.32.107]) by smtp.gmail.com with ESMTPSA id
 b1-20020a05600018a100b00207ab2305d5sm1569272wri.16.2022.04.11.08.54.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 08:54:27 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
 Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 10/10] drm/sun4i: Add compatible for D1 display engine
Date: Mon, 11 Apr 2022 17:54:26 +0200
Message-ID: <1908291.usQuhbGJ8B@kista>
In-Reply-To: <20220411043423.37333-11-samuel@sholland.org>
References: <20220411043423.37333-1-samuel@sholland.org>
 <20220411043423.37333-11-samuel@sholland.org>
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
Cc: devicetree@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne ponedeljek, 11. april 2022 ob 06:34:22 CEST je Samuel Holland napisal(a):
> Now that the various blocks in the D1 display engine pipeline are
> supported, we can enable the overall engine.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
> 
>  drivers/gpu/drm/sun4i/sun4i_drv.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/
sun4i_drv.c
> index 6a9ba8a77c77..275f7e4a03ae 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_drv.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
> @@ -418,6 +418,7 @@ static const struct of_device_id sun4i_drv_of_table[] = 
{
>  	{ .compatible = "allwinner,sun8i-r40-display-engine" },
>  	{ .compatible = "allwinner,sun8i-v3s-display-engine" },
>  	{ .compatible = "allwinner,sun9i-a80-display-engine" },
> +	{ .compatible = "allwinner,sun20i-d1-display-engine" },
>  	{ .compatible = "allwinner,sun50i-a64-display-engine" },
>  	{ .compatible = "allwinner,sun50i-h6-display-engine" },
>  	{ }
> -- 
> 2.35.1
> 
> 


