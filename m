Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA5176D6A6
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 20:16:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8BE410E20B;
	Wed,  2 Aug 2023 18:16:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 690A710E20B
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 18:16:51 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-ca4a6e11f55so97049276.1
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Aug 2023 11:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691000210; x=1691605010;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pXrsjRwbQ0i9WYPA2zZDm0hKTxjaNDtODB5//GV9BKg=;
 b=Wc2PQOqapUpcm9cw2WmudF0rziszOymA/cnrsah2sRinuo4/OhGhCDy5qJs4yAEDtU
 PM1UMmk7lucKnmoqjnpbznHCWvJ2dhyr8F3vFKGbo72j5lTshMoOtunXZmKtIKM/RAmj
 NblVTDUYBj4Wojz3NNXVCZM134/DUX/qGeV/AgNrP7xltwh+gfEJ+fK2MKkY36r3oYMo
 a3uRWZueUZp/RDK7DcFP8AbB+LvINcOxOR/lj6QUkU/cjxkh3reZSN8QVTtsc1R3lumy
 DBUIsymru6WvPhHNLuJ0hWrg6d0+q7/2Kdg1JR6etY8eH/4AVRiMWn2bDpgGCdIJ36D3
 uc3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691000210; x=1691605010;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pXrsjRwbQ0i9WYPA2zZDm0hKTxjaNDtODB5//GV9BKg=;
 b=SRBg7GHuDrSsm6OBLOCjU3OEvrjekzGvjifHK/EKzcD5bVBW0fN27GO40xgnVm2sfI
 b0H5E5qxP3tnOomNZuwoR7baNS1s8QJ56Jy9123RnsxzHvMKXrKz+HjH4xGe3MIEEi9A
 TPbfnvXF7ybYCB6PSenpyZ7bX1TzAEPQKk8RA8NogODV8RXQyIS3TjXztzQWYVF+7zH3
 vLqM+QF3I0z13GSz0aKB6dzGc3KUZ9g6uKgwQnCNBjfhOtL1G+ibKtfqHa/a4HVj4Fpc
 fpHYY/EKu7CWKLo3sBaANVWP1HJbqh9m9ul0ziHZNvH5/NNktLmD6xtQKPg+R9eVv9fu
 CJ3Q==
X-Gm-Message-State: AOJu0YwYRB2ZfmDJviNnmRK4PzfFhpw6sKwdrI8rUsWWzeXoaKbKbks/
 R43lHw63Wofh5QRcU7WHopregI3lTQMIA2o3hLpi8w==
X-Google-Smtp-Source: AGHT+IFyFGtRP+XqcacYiefZAE6cjaQRA61VxSBcnHHyEu24yGmybugGIsHGUh0vKfetYBrQ/QSMTkASgf6PVQhDsLk=
X-Received: by 2002:a25:938d:0:b0:d0d:4910:cf08 with SMTP id
 a13-20020a25938d000000b00d0d4910cf08mr849153ybm.41.1691000210550; Wed, 02 Aug
 2023 11:16:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230802-revert-do-not-generate-hfp-hbp-hsa-eot-packet-v1-1-f8a20084e15a@linaro.org>
 <5cf0e3fa-f66d-06c4-cfda-c48efd8c6508@linaro.org>
 <bf95af44-2510-1835-dec9-183144de8413@denx.de>
In-Reply-To: <bf95af44-2510-1835-dec9-183144de8413@denx.de>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 2 Aug 2023 21:16:39 +0300
Message-ID: <CAA8EJppp_ZJr-DcoZGd1GZmWuo=AECNS+X9zx0dNB4Edn8M2zg@mail.gmail.com>
Subject: Re: [PATCH] Revert "drm/bridge: lt9611: Do not generate HFP/HBP/HSA
 and EOT packet"
To: Marek Vasut <marex@denx.de>
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
Cc: Amit Pundir <amit.pundir@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2 Aug 2023 at 20:34, Marek Vasut <marex@denx.de> wrote:
>
> On 8/2/23 15:38, Dmitry Baryshkov wrote:
> > On 02/08/2023 11:52, Neil Armstrong wrote:
> >> This reverts commit [1] to fix display regression on the Dragonboard 845c
> >> (SDM845) devboard.
> >>
> >> There's a mismatch on the real action of the following flags:
> >> - MIPI_DSI_MODE_VIDEO_NO_HSA
> >> - MIPI_DSI_MODE_VIDEO_NO_HFP
> >> - MIPI_DSI_MODE_VIDEO_NO_HBP
> >> which leads to a non-working display on qcom platforms.
> >>
> >> [1] 8ddce13ae696 ("drm/bridge: lt9611: Do not generate HFP/HBP/HSA and
> >> EOT packet")
> >>
> >> Cc: Marek Vasut <marex@denx.de>
> >> Cc: Robert Foss <rfoss@kernel.org>
> >> Cc: Jagan Teki <jagan@amarulasolutions.com>
> >> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >> Fixes: 8ddce13ae69 ("drm/bridge: lt9611: Do not generate HFP/HBP/HSA
> >> and EOT packet")
> >> Reported-by: Amit Pundir <amit.pundir@linaro.org>
> >> Link:
> >> https://lore.kernel.org/r/CAMi1Hd0TD=2z_=bcDrht3H_wiLvAFcv8Z-U_r_KUOoeMc6UMjw@mail.gmail.com/
> >> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> >> ---
> >>   drivers/gpu/drm/bridge/lontium-lt9611.c | 4 +---
> >>   1 file changed, 1 insertion(+), 3 deletions(-)
> >>
> > Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> #fix db845c
> >
> > The boards broken by [1] are used in production by different parties
> > since 5.10, breaking them doesn't seem more acceptable than breaking the
> > new out-of-tree iMX8m hardware.
>
> The MX8M is also in-tree, so this does not apply.

v6.5-rc4:

$ git grep lontium,lt9611 | grep -v 9611uxc
Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml:$id:
http://devicetree.org/schemas/display/bridge/lontium,lt9611.yaml#
Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml:
    - lontium,lt9611
Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml:
      compatible = "lontium,lt9611";
arch/arm64/boot/dts/qcom/sdm845-db845c.dts: compatible = "lontium,lt9611";
drivers/gpu/drm/bridge/lontium-lt9611.c: { "lontium,lt9611", 0 },
drivers/gpu/drm/bridge/lontium-lt9611.c: { .compatible = "lontium,lt9611" },

next-20230802:

$ git grep lontium,lt9611 | grep -v 9611uxc
Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml:$id:
http://devicetree.org/schemas/display/bridge/lontium,lt9611.yaml#
Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml:
    - lontium,lt9611
Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml:
      compatible = "lontium,lt9611";
arch/arm64/boot/dts/qcom/sdm845-db845c.dts: compatible = "lontium,lt9611";
drivers/gpu/drm/bridge/lontium-lt9611.c: { "lontium,lt9611", 0 },
drivers/gpu/drm/bridge/lontium-lt9611.c: { .compatible = "lontium,lt9611" },

Your device is not in the tree. Your commit broke existing users.

Can we please end the argument, land the fix (this revert) for 6.5 and
work on the solution for 6.6 or 6.7?

-- 
With best wishes
Dmitry
