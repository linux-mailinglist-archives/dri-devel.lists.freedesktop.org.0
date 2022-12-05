Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1CD64258E
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 10:16:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3232310E04A;
	Mon,  5 Dec 2022 09:16:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C534210E04A
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Dec 2022 09:16:22 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id p12so7798478qvu.5
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Dec 2022 01:16:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NyWCZnYLtOpzCElMxniM5SYUnr8uSBt4bLG5wCjERpo=;
 b=bbb6p4b537MK+KSX1CKjEGV86oVYZQsMSGtdtdWLJfCaXVxT6TvmXVRn+89oE1GVoq
 RfdIgefP4sn8YBVRXVVsQ/meG551KglOAh5HXmqrLscx6Qs8iS294SoDBMwJIGIw3VLl
 pLL8WqEgP386yGIkOwDQTF65mBrRmlqVRHrQhqVsYv2sCrkUmekilwVhtoy26l3b05KM
 bERIwQb64d4OkZzzvSS95ORZPxMp/BWucDgSmj/RJ/6lA6AluAjPWpSB+oPHvgFIuCGI
 GOpKWsje8HlRWOkskSFHWfY3Ijf8eX6VHw2nccHgEP6MU0W+hMwx/x4fAxvavCrGfGGo
 +iNQ==
X-Gm-Message-State: ANoB5plfijqVNHZAudUCRQSU/LIl/9Pk4/TIS+RZJzdp4P2ycpZcRE6n
 AW1BSlizeT+gWHC/+MT+MlUmJ6ODU7eiAQ==
X-Google-Smtp-Source: AA0mqf6ibkqeShMmDWlMIZ/dsWyMI8yI93yn1kUratSPmezoUZnOhNNygF5837zYh3maJb4H+hH4Tg==
X-Received: by 2002:a05:6214:368a:b0:4bb:6b58:2c96 with SMTP id
 nl10-20020a056214368a00b004bb6b582c96mr56977293qvb.127.1670231781359; 
 Mon, 05 Dec 2022 01:16:21 -0800 (PST)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com.
 [209.85.219.170]) by smtp.gmail.com with ESMTPSA id
 w25-20020a05620a129900b006fcaa1eab0esm8749510qki.123.2022.12.05.01.16.20
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Dec 2022 01:16:20 -0800 (PST)
Received: by mail-yb1-f170.google.com with SMTP id d131so10262477ybh.4
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Dec 2022 01:16:20 -0800 (PST)
X-Received: by 2002:a25:d655:0:b0:6fc:1c96:c9fe with SMTP id
 n82-20020a25d655000000b006fc1c96c9femr17074822ybg.36.1670231780461; Mon, 05
 Dec 2022 01:16:20 -0800 (PST)
MIME-Version: 1.0
References: <20221201095631.89448-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20221201095631.89448-4-tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <20221201095631.89448-4-tomi.valkeinen+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 5 Dec 2022 10:16:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVeaZtrm7ohX4O0CGcam+1eDrtSvcqvhwoPbg3zOOgZcA@mail.gmail.com>
Message-ID: <CAMuHMdVeaZtrm7ohX4O0CGcam+1eDrtSvcqvhwoPbg3zOOgZcA@mail.gmail.com>
Subject: Re: [PATCH v5 3/7] clk: renesas: r8a779g0: Add display related clocks
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 1, 2022 at 10:56 AM Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
> Add clocks related to display which are needed to get the DSI output
> working.
>
> Extracted from Renesas BSP tree.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v6.3.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
