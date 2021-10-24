Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2924389D9
	for <lists+dri-devel@lfdr.de>; Sun, 24 Oct 2021 17:36:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4858189E1D;
	Sun, 24 Oct 2021 15:36:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9A9D89E1D
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Oct 2021 15:36:19 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id g141so8163089wmg.4
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Oct 2021 08:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Uo+KZSKbMpCYD2HnQVmUgWBUvnOq/cWI0Zv67K4qsag=;
 b=yu5Z4gfoU+YC7zzBlq9uJ6PXvotAkI9fzmpdOOfZJqkYYQUBQ7/Z/MTdSwgi4nd5jb
 B3dyMlOYGV88bSwN1GoOONZ0UT/2ZqC5ShpiUsJKxBtW6vnCE00UhsZcr8Urk7ytx0/S
 NDdcZXNGmOLXHRjfF6zjYBygT8MkmkWhD/CCxddf844M0hv+4uUkNr4d9WJOAdXOWNI2
 sWAOU5teuRpYkPKTVpSLWSPndpLuaaAaVlhoAbz63sJx/c/IzZtD7mXjtv9bDca89bA5
 1GNLXAbJJLnvKiOAtAE6++GUirONvnRdY8bSlswlBmlY14qE8e7wRWCPqV9F5H+NviO1
 C9Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Uo+KZSKbMpCYD2HnQVmUgWBUvnOq/cWI0Zv67K4qsag=;
 b=1YRmtwcrnK6lnLNv4Qb74/xim5wRmXI29YmdUJ3gObfUSGGCINe6y4Y4/FRwoXg+t0
 AsL2jnDpbN9HQUp9iT6TqpSXzBl/VJmfuBb02NvQnM4PL0NOI175sMPzH1oNoxKQHLLH
 FQNHnnawKUJq9S0RyPfb18EvDlDsTbQ4p1128VVqjfngC41xc6FdtzRLejiKbaTFUjhF
 gTiQjuQN4VEj6jXZG5FIDM0Akf+BMvW6rthdQw7LXPg5sXUpAcQaNC346x5SSGGiyL+k
 IoGaorKnxn7nqcrDggjxAnMqlfzM9TWKyobooAYIoEwAlIIv2QOVhEUuZ4aHZzxOHz/z
 Hxdg==
X-Gm-Message-State: AOAM533S/lAFaZNJxqMW8P5yonzNJIZjHuci+1y9lmaiimEotdbhcweK
 wACYugLHYEKCMv12Dfm0RoK2VA==
X-Google-Smtp-Source: ABdhPJwwN33lxeowWbuondAurMoTKsZYNPHjpTT6hvtmBIMTKVjY9pcuRTU0VfDorky8HCqiHArLDA==
X-Received: by 2002:a1c:7fd0:: with SMTP id a199mr43354530wmd.96.1635089778344; 
 Sun, 24 Oct 2021 08:36:18 -0700 (PDT)
Received: from blmsp ([2a02:2454:3e6:c900:5142:5fbb:5821:5dc3])
 by smtp.gmail.com with ESMTPSA id w7sm7605993wrm.64.2021.10.24.08.36.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Oct 2021 08:36:18 -0700 (PDT)
Date: Sun, 24 Oct 2021 17:36:17 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Rob Herring <robh@kernel.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v5 2/7] dt-bindings: mediatek, dp: Add Display Port binding
Message-ID: <20211024153617.inkbrjzqjp4mspyh@blmsp>
References: <20211021092707.3562523-1-msp@baylibre.com>
 <20211021092707.3562523-3-msp@baylibre.com>
 <YXNG8Qy5jAPdWbHY@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YXNG8Qy5jAPdWbHY@robh.at.kernel.org>
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

On Fri, Oct 22, 2021 at 06:19:13PM -0500, Rob Herring wrote:
> On Thu, 21 Oct 2021 11:27:02 +0200, Markus Schneider-Pargmann wrote:
> > This controller is present on several mediatek hardware. Currently
> > mt8195 and mt8395 have this controller without a functional difference,
> > so only one compatible field is added.
> > 
> > The controller can have two forms, as a normal display port and as an
> > embedded display port.
> > 
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > ---
> > 
> > Notes:
> >     Changes v4 -> v5:
> >     - Removed "status" in the example
> >     - Remove edp_tx compatible.
> >     - Rename dp_tx compatible to dp-tx.
> > 
> >  .../display/mediatek/mediatek,dp.yaml         | 87 +++++++++++++++++++
> >  1 file changed, 87 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> > 
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> But can't be applied without the dependent header (or remove the 
> dependency).

Ok, thank you Rob. Maybe I will remove the dependency.

Thanks,
Markus
