Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0056FE425
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 20:44:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A1910E509;
	Wed, 10 May 2023 18:44:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FC1310E509
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 18:44:08 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-50bd875398dso11568986a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 11:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683744246; x=1686336246;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wPS2VOYPj9tvhVnf11tmZgqUIiOL0oJR1EZsgcJxV5Y=;
 b=BrXkYLveWgEDMLIx+hk2YsTKuck1qBJH2+cVNfTxpVbGMw3PO3P9v2ilSoAs2esdyU
 R+C/jPQPrldO9hwRMTtrYIVggF+Jqn3303ZhYxN+zGIo8OuNGoY7+s8Cf4XHdPcMU+RA
 FaycWzcf+Y4cls7Z43lP3FRp2gN0yadZlXTq7uGzsDVCMX1ffGmSq83ewYF6TfZHMTTh
 yJ1GxVV//IT97eW5fvylBXOgnQDycwvpQG5jCUXW4wnB0Tyx5wVe1nWhj+qa56qUHJT+
 sE/0qaicg19IXMYEEqMvy0o1a5Z4x1dXCIxi6OkBqgYyRollUbHzJ/3JBTrQrNQUbqc/
 8H/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683744246; x=1686336246;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wPS2VOYPj9tvhVnf11tmZgqUIiOL0oJR1EZsgcJxV5Y=;
 b=js3PuYwI4jNbeM63XqQGKCuyUDOcBO4Zxl7FcXbPyx52+zeOSOmxc34+VZLPn5XtIS
 jDGBSZRKEqYfbXB3XW8fXQd+Ga+Oz5gbBP5HnklMQsDjuQWXI6JrhhdanRI+6r38AwY1
 mM/UIYdTdPkZ3S+gMSQCdD1an8vj7OLRqo9JQmCrD9MZvF2sICse964uGx81XSXR9MT8
 tY3EZ/ccDEGOuPUSUxZ1eUSjVeWmA4+H88v+fa4Hl/zK6BAUG+bhaslySv7jxpoKrRmc
 QORYy2rBQyKSJC89xWAYgnJs53zK30t3CzcqFf309ShBkApJveLDmHItpIF/vo1IdGQ0
 MR3Q==
X-Gm-Message-State: AC+VfDxR/1KX8R7+YDKnqe0OYDBWAuiPP9x9ZeAdj75BgA8BYoLBW4CL
 6BBzMmJyoPPdvns/jRFb2+0=
X-Google-Smtp-Source: ACHHUZ4hCWeeIeHV2i78urTzM1T1DLqwN/c7QodoCeW4ajn/Fdkro9dtvrwr4zJg5A9dC5Mm+S7kRA==
X-Received: by 2002:a17:907:25c3:b0:961:b0:3dff with SMTP id
 ae3-20020a17090725c300b0096100b03dffmr15898231ejc.14.1683744246050; 
 Wed, 10 May 2023 11:44:06 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net.
 [82.149.1.233]) by smtp.gmail.com with ESMTPSA id
 h21-20020aa7c615000000b0050bcaedc299sm2151054edq.33.2023.05.10.11.44.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 11:44:05 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Roman Beranek <me@crly.cz>
Subject: Re: [PATCH v4 2/4] ARM: dts: sunxi: rename tcon's clock output
Date: Wed, 10 May 2023 20:44:03 +0200
Message-ID: <4830298.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20230505052110.67514-3-me@crly.cz>
References: <20230505052110.67514-1-me@crly.cz>
 <20230505052110.67514-3-me@crly.cz>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Frank Oltmanns <frank@oltmanns.dev>, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, Ondrej Jirman <megi@xff.cz>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne petek, 05. maj 2023 ob 07:21:08 CEST je Roman Beranek napisal(a):
> While the rate of TCON0's DCLK matches dotclock for parallel and LVDS
> outputs, this doesn't hold for DSI. According manuals from Allwinner,
> DCLK is an abbreviation of Data Clock, not dotclock, so go with that
> instead.
> 
> Signed-off-by: Roman Beranek <me@crly.cz>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


