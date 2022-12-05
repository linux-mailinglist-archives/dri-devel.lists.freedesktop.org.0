Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8660D642674
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 11:10:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B61610E08B;
	Mon,  5 Dec 2022 10:10:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58BC110E055
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Dec 2022 10:10:45 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id q10so7852541qvt.10
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Dec 2022 02:10:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZUxVNYgQpF1NtWJx4x3VZYK+8ZOnXcCaeiuWHvm8oJQ=;
 b=19B6ezHph/UTWnHcqccUnYt2OjEeAer3e7AN8264FNFcnKZRCvkOcwyUbX6tglMlqU
 dvoT5C2I7RNX4S/aUB+AUG4NXaDm7prPKXwjJjgxtc6V+xfvGgfwwNrLdZ6WZgp0MZWM
 MktS2jFUcrIoog09n+u6fOVL+fXgBBQLXJAnsMH7kpQrr4JzsQFy1z8buH6iuDtq80qL
 pPcB5a+DJSNvdYMR/SQrooEmATy/dxcgIFkbASGXukBWQtycGAfVEoSX8x+R0xZeaZYr
 /5MXb4c3f6Qzg3kbLIGm1ofMfpX7xfRSKvR9K83ADZheXGXjQDWCxtgU9nx8Itn4f6mC
 uUqg==
X-Gm-Message-State: ANoB5pm3NZ/6pjtRjrEWVhMK3a09a++0EJTS0vfGVz4oa7S5nyz0DjFX
 lRZ6rPsLvxQccq8rE2D3zPf9BA9vbpoWqQ==
X-Google-Smtp-Source: AA0mqf5EenLcFCRqDFCqLHPyWCE+sX9xCC632osKiJb7Bqb7TrWwjdmOfuF0q9JjNedbyAD3KxbpdQ==
X-Received: by 2002:a05:6214:31a0:b0:4c7:3201:3d1c with SMTP id
 lb32-20020a05621431a000b004c732013d1cmr15257166qvb.61.1670235044284; 
 Mon, 05 Dec 2022 02:10:44 -0800 (PST)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com.
 [209.85.219.179]) by smtp.gmail.com with ESMTPSA id
 w21-20020a05620a445500b006fa4ac86bfbsm12278855qkp.55.2022.12.05.02.10.43
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Dec 2022 02:10:43 -0800 (PST)
Received: by mail-yb1-f179.google.com with SMTP id 7so13798643ybp.13
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Dec 2022 02:10:43 -0800 (PST)
X-Received: by 2002:a25:7204:0:b0:6f0:9ff5:1151 with SMTP id
 n4-20020a257204000000b006f09ff51151mr51492773ybc.543.1670235043063; Mon, 05
 Dec 2022 02:10:43 -0800 (PST)
MIME-Version: 1.0
References: <20221201095631.89448-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20221201095631.89448-6-tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <20221201095631.89448-6-tomi.valkeinen+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 5 Dec 2022 11:10:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXXoNq0CxSqPLzZUPdVTNa+6u+DNhbm_pCSQOvTHf3EjQ@mail.gmail.com>
Message-ID: <CAMuHMdXXoNq0CxSqPLzZUPdVTNa+6u+DNhbm_pCSQOvTHf3EjQ@mail.gmail.com>
Subject: Re: [PATCH v5 5/7] arm64: dts: renesas: white-hawk-cpu: Add DP output
 support
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
>
> Add DT nodes needed for the mini DP connector. The DP is driven by
> sn65dsi86, which in turn gets the pixel data from the SoC via DSI.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

(same comments as v2)
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.3, with the mini-dp-con node
moved up.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
