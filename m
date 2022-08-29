Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D5B5A4FD1
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 17:07:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56AB810F35B;
	Mon, 29 Aug 2022 15:07:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F15E10F37D
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 15:07:06 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id cu2so16373237ejb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 08:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=NkjtLGODakxw34RE1ZSCHsppEOgNT9LnIfBodvI5KF0=;
 b=fdvDTlOSk7+R063mphDzc2gTmV8LTm+g93undrgWcmR/VgD6QbDtnXVEw+dxIZ/8nR
 xMoTTkAalTtTS9HV1GX7uSkp2czJriwlDUDK37whez6z/OAlT1OsBIJqka+DR8t0+Cge
 mzP2FRAXlC74Y2mkb9sa+2e0gfIgaNazvcdRf/ZerZmZliy6Z3hLp6Oj4enGV19rA21D
 1btbZEZ5NywIIa8648wDvGaYsl4HiBtonAQsZJJ1YRGX7Pboa+SNDnp5YXdz9trdu8iD
 BMw0gV0nDJ3ak+IkqKD4sYfuNqrXD2cKwTM3PCRfrLbY4j8UqzG01Eaa/ApT78sN7qPS
 S0Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=NkjtLGODakxw34RE1ZSCHsppEOgNT9LnIfBodvI5KF0=;
 b=6StMWy2+0mhc8VBpVNAmBwJKRpShlY2xe+TG5N/tWeK+TDwRY2GQa5BEN4yNrvAMgy
 yIzGC6Ewxuw/0eW7J9usTIROWfLNwaZS5doR0yK5NjhLdqaf75iOHRXiywdXPGM77gkt
 67U8J+Sd301L2wm6e6QTgUUkD/zyXzxegZemVc51WwuJ4pdGWumqhHICIdQ7IejhlfjV
 J6dwYSj1gjjT3ELswTSEJTle1CWTm6zGeGl7HaEkHstSlsQHckf7G/muk2zDuJ+Or/+B
 MQRw0LjVfji1UerS2RL2uAsApXnfialD6+GFxSkFHbnsVHBHlCZxaY+a/6UM47sEIYmn
 y3cA==
X-Gm-Message-State: ACgBeo1E7josFko/WR9GdE3S9mLiECVchWti5nRE7khve44ZIaDlK23l
 n2NKg35EKSS+d1vTDqZuiH7/Wwpv2CTpq/qVYQoBjw==
X-Google-Smtp-Source: AA6agR7MIb19AtTjOyeksEjWUxq8gktFe79/+VMQqBQ/V9UYwiymcHXnHZzTOjVyarRcq0QfPghC9876jcMKi8NBcrc=
X-Received: by 2002:a17:907:6092:b0:731:59f0:49ac with SMTP id
 ht18-20020a170907609200b0073159f049acmr13841200ejc.383.1661785624682; Mon, 29
 Aug 2022 08:07:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220530150548.1236307-1-m.felsch@pengutronix.de>
 <20220726091228.nvvyzab7wyzrnfrr@pengutronix.de>
In-Reply-To: <20220726091228.nvvyzab7wyzrnfrr@pengutronix.de>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 29 Aug 2022 17:06:53 +0200
Message-ID: <CAG3jFyt6A2L0Feeibv_76tVhQ_PjRpowQ=CeJ9FaOOshrEWLuQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] TI SN65DSI83 Features
To: Marco Felsch <m.felsch@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org, kernel@pengutronix.de, jonas@kwiboo.se,
 dri-devel@lists.freedesktop.org, jernej.skrabec@gmail.com, robh+dt@kernel.org,
 laurent.pinchart@ideasonboard.com, krzysztof.kozlowski+dt@linaro.org,
 sam@ravnborg.org, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Marco,

Sorry about the slow reply.

This series no longer applies on drm-misc-next. Can you rebase this
series and send it out a v2?


Rob.
