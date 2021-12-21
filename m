Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F3247C038
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 13:57:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10A0110FCC7;
	Tue, 21 Dec 2021 12:57:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C5DB10FCC7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 12:57:18 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 g79-20020a9d12d5000000b0058f08f31338so1208879otg.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 04:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i7lL5b0OdWvPRyAvOv2A9DvQi6Y6xWHuiYMXntxrIkY=;
 b=psnTM/ToBMjrt5X15R3dV8wJ2+y3wMyN7/PyjLOuKY81Tj/Rb8BmfIVg9xBMyVdXFb
 0F6RS55dpGZA2xoGXF1U6ODG0JdTpedtNYZrTkLDz3WtvizA2UCjKR/85FMjWJQfklU1
 +uYDP3pu95JZo1n88gknuo2p1ILemCQHs2IEUqDDzWNHjosIj4sUnn6N3xjuwPk2SnvQ
 frLTCloOHv3loyKk0rWhLgRA4TMkQl08592sns7ce7hVM/8DEExGTnG94jzlw+1HJEPq
 iExVLQ5m6uXV+hhi58SJyhQkZaz7lZpS6ectdPvkRY4mALGQ0U9sSWGUZsiEmB5L/7Pk
 GxmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i7lL5b0OdWvPRyAvOv2A9DvQi6Y6xWHuiYMXntxrIkY=;
 b=a6Rubh0NXYUzsEi6L2kwuA3gQEajeSS7CibN7G/FNhHuKouqfDBseRSzsaHlT30I9w
 aQekKRKBuSuuRlCi4NlT2WnF010r1lHPZKoJ5UoZ7gBIGxZN3Hyqau8lSaog++FYRj3o
 CatVwlVT/k3W216ZOtmGevoVN/jrj3/XTd2TrD6e68klUrcvAOVTkXQd1k5XSq0LKTjt
 gebey6npfvT4WMIEP1pjaRsvqWmmZYODl0L/LLAQB+PGPZ9ZdRbkJliXtzD4er9rotgS
 XzruRPIjXVVZcKJMneLc7ScSsVdek6mGCr5QPfyS+2s2YdGHSYd579h7+SmxkY8RNHKK
 Jo4w==
X-Gm-Message-State: AOAM530HbWzSKVq/T3F3ssJ0vHP4zfm4eiy5fE9B6hycf/afZPOjRn0o
 pNZxp4D/0QKgjO6eyznghMemSRvjLUrzwFxpz9ocuA==
X-Google-Smtp-Source: ABdhPJw2UTvhE3ILOv23b6deXxv1ttzrr9G2utXB/hL9pcJ9eOTCvmUjfOr9h8T9c6fASi97ZOtxWGBvlJRWdSR56Wk=
X-Received: by 2002:a9d:74d0:: with SMTP id a16mr1988936otl.237.1640091437413; 
 Tue, 21 Dec 2021 04:57:17 -0800 (PST)
MIME-Version: 1.0
References: <20211221125209.1195932-1-robh@kernel.org>
In-Reply-To: <20211221125209.1195932-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 21 Dec 2021 13:57:04 +0100
Message-ID: <CACRpkdaGG0HNU1j4QaZg7sQKb7Tn7czfU8F5v_rguhc6nFihJw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: Add SPI peripheral schema to SPI
 based displays
To: Rob Herring <robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Jonathan Bakker <xc-racer2@live.ca>, linux-kernel@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, Andrzej Hajda <a.hajda@samsung.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Marek Belisko <marek@goldelico.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 21, 2021 at 1:52 PM Rob Herring <robh@kernel.org> wrote:

> With 'unevaluatedProperties' support enabled, several SPI based display
> binding examples have warnings:
(...)
> Fix all of these by adding a reference to spi-peripheral-props.yaml.
> With this, the description that the binding must follow
> spi-controller.yaml is both a bit out of date and redundant, so remove
> it.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Excellent patch.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
