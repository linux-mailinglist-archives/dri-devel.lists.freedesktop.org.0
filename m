Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CA563EC3A
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 10:21:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9875210E58A;
	Thu,  1 Dec 2022 09:21:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AB9410E58A
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 09:21:03 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id c15so586910qtw.8
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Dec 2022 01:21:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6fSb3KNzIEE0W7AdsV0sBOucQCqOQ/fqMgUl4ol27wc=;
 b=djnsVwxq5KZUUn5olgtxajqU8c/NltdIs5sKCejIaz1zb666479eez6wz8D9Nc1SRk
 ++CpWX8jNs/jSuU6QJ02XSTuSyNFcET7oeG55xOAna8g7tF6QaxbeHJsSQEtGxheKAAk
 y+ePPWc7lsl6baJ93kQazcIJK2FoAluwoBN0oqeB0qjy5eI88ZRada4vVeOHi0oZ+v4l
 973bkiG4b1yZMMFglWYOvtnU6ToWc56j7tf2T4t+G7BV3aAU0W9TIKwy9yobSQ2H5x/w
 bRyNZNu8ar8mLIPj8Ip3ZbJqI3QLwDsJn8qmipTCp2/N16VxCqreOslh1QFeuiy2GNnM
 8Ggg==
X-Gm-Message-State: ANoB5pmN8qMWXfiCelZb81k9KBHzkJwdT5+335SMcoUgdT0tlT3qUMNA
 jrZCbPIoiQ8/JsT2l3D25yQbfXM9mA3dYg==
X-Google-Smtp-Source: AA0mqf7H7/jkhuohuM5kvIN9H9XkEoaDLAsvJ0d3JuNr7G8O+yFbslKVK964cUBTxRGckMhwsoBrww==
X-Received: by 2002:ac8:1019:0:b0:3a5:42b9:d7aa with SMTP id
 z25-20020ac81019000000b003a542b9d7aamr59709298qti.58.1669886462059; 
 Thu, 01 Dec 2022 01:21:02 -0800 (PST)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com.
 [209.85.128.182]) by smtp.gmail.com with ESMTPSA id
 u19-20020a05620a0c5300b006fa84082b6dsm2961122qki.128.2022.12.01.01.21.00
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Dec 2022 01:21:01 -0800 (PST)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-3b48b139b46so10786697b3.12
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Dec 2022 01:21:00 -0800 (PST)
X-Received: by 2002:a81:a148:0:b0:3b4:8af5:48e with SMTP id
 y69-20020a81a148000000b003b48af5048emr33977890ywg.383.1669886460726; Thu, 01
 Dec 2022 01:21:00 -0800 (PST)
MIME-Version: 1.0
References: <20221123065946.40415-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20221123065946.40415-5-tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <20221123065946.40415-5-tomi.valkeinen+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 1 Dec 2022 10:20:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWAPZHLxgQioNBw1HhZpvAN5WFydc-bbMkpfH5pdc1vNg@mail.gmail.com>
Message-ID: <CAMuHMdWAPZHLxgQioNBw1HhZpvAN5WFydc-bbMkpfH5pdc1vNg@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] arm64: dts: renesas: r8a779g0: Add display related
 nodes
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

On Wed, Nov 23, 2022 at 8:00 AM Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
> Add DT nodes for components needed to get the DSI output working:
> - FCPv
> - VSPd
> - DU
> - DSI
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.3.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
