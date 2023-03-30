Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB486CF9FF
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 06:11:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1529C10E0BA;
	Thu, 30 Mar 2023 04:11:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com
 [IPv6:2607:f8b0:4864:20::92b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4493410E0BA
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 04:11:30 +0000 (UTC)
Received: by mail-ua1-x92b.google.com with SMTP id s23so12917341uae.5
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 21:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1680149489;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DlqWzaTFeXNF93oCsw3CKOaZb2BdZ8J89dsRkm+g8nE=;
 b=Jwl8XnBNPHXUrgPWG3nOY/ScmyoA1qdPjqbybFRGhnJG73H8ZIYdkEMyoOxUKr4jy0
 RAMQZs8WujJX7IOJFjv2jXyqqRhX7ZHdmLOsQKgvSc6dI3y8AWEMMyZQKBu+6FM90Hu9
 LeUEchBHwB35VJfRrd9cNQUME4vv23vwGtN+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680149489;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DlqWzaTFeXNF93oCsw3CKOaZb2BdZ8J89dsRkm+g8nE=;
 b=VGv0RwRwyH6JeyIkf4YzXjyVgkJUbTvYyW8QXfi6Tp2UdgYH/81HDxhuL/bzKu21KI
 reqmib/XOr5H/jH4ii7zJ/RbbajyiIzm+xmXNNAiVlJERbG9JgXWPHNB4CblkYW/ip9i
 SU9veYij4z+Y0YYCl9A4G6klNyGTqtldPO3dZWj7tGeSXXlh9V6xRRs/vY4qqrRLFf5j
 4GrvzA8OfM9BFjT+gREoMhHc2l2SeJSs6ErJG65H7os/TM6AviG29bjbiexJltE+ovCJ
 jYRtyyNO2kGDCN+3/zzw7s2RCNSbXZih4+fmpOjFkEdOD55zgI5dGfO3wvWHZNwGBiZj
 pgrA==
X-Gm-Message-State: AAQBX9dYvgM2m26ptZHsRFSIPw+wD6fx6AvLu0+YFw1YUk3QwNx7mPMA
 +jBlmnsxY3BdWKTunsJUXOPa4+9UIzLG4GDe8PJkvg==
X-Google-Smtp-Source: AKy350aOTSTGLpyThgFsYnGIfmpFWfK++5W92pNG1SY5fkfAr3BAjmNQvMlKt6sE5LGDBzYjwJbAbGBsSvz5yHx1Zxk=
X-Received: by 2002:ab0:3d9e:0:b0:764:793a:6618 with SMTP id
 l30-20020ab03d9e000000b00764793a6618mr14789585uac.1.1680149489280; Wed, 29
 Mar 2023 21:11:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230218111712.2380225-1-treapking@chromium.org>
 <CAMty3ZD3SY-WCtYK0dexdLxCk8d+2tJ=D9xb5uR06jPGCd=56g@mail.gmail.com>
In-Reply-To: <CAMty3ZD3SY-WCtYK0dexdLxCk8d+2tJ=D9xb5uR06jPGCd=56g@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 30 Mar 2023 12:11:18 +0800
Message-ID: <CAGXv+5HFP-1SFFBsUneyVT-42b3_6BPtQ-CkULmUT6v0pUoLbA@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] Add generic-display-mux driver and bindings
To: Jagan Teki <jagan@amarulasolutions.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Pin-yen Lin <treapking@chromium.org>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, chrome-platform@lists.linux.dev,
 Guenter Roeck <groeck@chromium.org>, linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 30, 2023 at 2:10=E2=80=AFAM Jagan Teki <jagan@amarulasolutions.=
com> wrote:
>
> On Sat, Feb 18, 2023 at 4:47=E2=80=AFPM Pin-yen Lin <treapking@chromium.o=
rg> wrote:
> >
> > This series is developed for and tested on MT8173 board, and the layout=
 is:
> >
> >                                   /-- anx7688
> > -- MT8173 HDMI bridge -- GPIO mux
> >                                   \-- native HDMI
>
> What is the part number of this GPIO mux? Does mux gpio interrupt
> based and able to switch output HDMI and DP. If so, how this gpio
> interrupt is different than the HPD in native HDMI? I mean does HPD
> have any detection bottlenecks with mux gpio interrupt?

It's a full blown HDMI 1:2 demultiplexer, so DDC and HPD signals are muxed
as well. The anx7688 handles all the Type-C stuff, and our EC talks to it.
If HDMI output from the SoC needs to be muxed over for DP alt-mode, the EC
will signal the SoC.

> I do have GPIO Mux that input DSI and two outputs DMD/HDMI Input and
> HDMI Out. 2x1 with 1x2 mux.
>
> I'm thinking having a generic mux to select the specific out number of
> outputs with associated interface outputs can be a viable solution to
> address all use cases here.

AFAIK DRM doesn't allow dynamically changing the constitution of a display
pipeline, so it doesn't really work out for us.

If you're just muxing between different outputs with passive/dumb bridges,
it may still work for you.

ChenYu
