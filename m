Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 391FC7F6B04
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 04:44:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EE7B10E009;
	Fri, 24 Nov 2023 03:44:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92C8110E009
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 03:44:20 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-50797cf5b69so2045992e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 19:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1700797459; x=1701402259;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RcJej9WUdZZWtLL0jZR7KWhn0SxMMquSiq9yLi1GeNc=;
 b=YO5edapDA3lw28S0UuJ5Np2aYtoX1yYMZY71T747yyyaau90C4XsSxCCrpmL6QQjD9
 pZM8E77YI7w+XCdzzMDDNzJrqgoUekMU1jPa+RakZ9+SIt6N8FN8UUOFs2SE2lX0nkEp
 L0wgYHcfeU1uum1Efo5gWWO3SxNe8TkP7qf3A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700797459; x=1701402259;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RcJej9WUdZZWtLL0jZR7KWhn0SxMMquSiq9yLi1GeNc=;
 b=WEu6sLgbws+Tmb39mLp2pUmWqEPdwX+Ta8sBCKug6agpXPFytscUuMk9dBKEWr2Gwk
 KJbNryGVO/blC4EBEltXqbHAcOEZ9bct/d20TQtkzF52eLCJ2SnRaOERqjOl5V/GJ8ry
 wh7vPULjIcBtVAxNsu4hFKVkTRLeFeVl8WN7q6wrqhteoudS30lTgeznt0+Rb7GG9Y7/
 EnhQYTRZ90Ds5JBEkKNNfkrB8c4XaCC9w07rfXpR3spUyuyHvlNbo0dWJPWl+QN9OXnV
 JHsuUsLwtvx+46ItwvfwRwcdDf4/YUgSMOqP1+K+aXj03/r4RIZUIRzicSz4EjDBT+Ts
 kc5Q==
X-Gm-Message-State: AOJu0YzC9mdoHHBPn1frLeXxXA9ZpZvffbxeS4KoMpeO0Vr97Fy3HGVI
 p5KDwE0Pca4uzX4C3oh+tyx02ZE9SlrBIavHKEqZ9w==
X-Google-Smtp-Source: AGHT+IH7191VcJzspX2lbzBmIE7QpGIGT/USZRwoE7pZJ5nRJbeokYOjJ7hZq8T0ALMqi3yp2bhgV8yGSW2RcGOPhbU=
X-Received: by 2002:ac2:5dc8:0:b0:50a:a9e1:6c58 with SMTP id
 x8-20020ac25dc8000000b0050aa9e16c58mr703080lfq.32.1700797458184; Thu, 23 Nov
 2023 19:44:18 -0800 (PST)
MIME-Version: 1.0
References: <20231123133749.2030661-1-mwalle@kernel.org>
 <20231123133749.2030661-4-mwalle@kernel.org>
In-Reply-To: <20231123133749.2030661-4-mwalle@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 Nov 2023 11:44:07 +0800
Message-ID: <CAGXv+5EcT3OjyaW6LkARugWZN2AE5TWRx=Bh5TqfVBG2tcs5Ew@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: mediatek: mt8195: add DSI and MIPI DPHY
 nodes
To: Michael Walle <mwalle@kernel.org>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-phy@lists.infradead.org, Xinlei Lee <xinlei.lee@mediatek.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jitao Shi <jitao.shi@mediatek.com>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 23, 2023 at 9:38=E2=80=AFPM Michael Walle <mwalle@kernel.org> w=
rote:
>
> Add the two DSI controller node and the associated DPHY nodes.
> Individual boards have to enable them in the board device tree.
>
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

I checked all the address ranges and interrupt values and they are all
correct. The other bits seem to be correct, extrapolating from previous
chips such as MT8183 and MT8192.
