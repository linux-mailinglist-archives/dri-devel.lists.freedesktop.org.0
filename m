Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA55A76D728
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 20:49:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A093E10E566;
	Wed,  2 Aug 2023 18:49:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 459FC10E566
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 18:49:22 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-31768ce2e81so118107f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Aug 2023 11:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691002161; x=1691606961;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bzkEv/3BHlJ7OlVSOsOfKszQ06QQoksYW+Yc+Lwcq1g=;
 b=eM7cvHdLlEmipjj5bjVSWJ7vvM0wSmlIcCGrUUbkBT4W4Y18KcgOCeto03Fw/KNenb
 vMQP3pFw1n287gm52hMaERB3nJUdbEi3lGmqGZbJHzpe2mhO31Kgj9FeZn/h/wkVph4+
 KIuq97Ugwxk4tX5L0WkNbMJGGn4LCHlEK4xNmBNIiiEtNXPM5CMNwkcFuOn7HA3LHh9m
 wdmyBVRsRUC4h+JKR+taQB0Sfjp4j7mxM+k2QRTf3L/45Xxmj9bkT/OFPw5GU1IR1v3I
 Xviy7FWy1CUVGIE7q3SB2XW4HzLqIRo+U821YGZdYPkrx/M3JNL+X31pUCsWXfwy5fw8
 dXHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691002161; x=1691606961;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bzkEv/3BHlJ7OlVSOsOfKszQ06QQoksYW+Yc+Lwcq1g=;
 b=DyY/iSvOaGiBOgrx+JfMPDp0iQ+wY+9kuyC8ecPbjke0Bx62HEIuMWVWZadUgzq1TM
 g40TRTB3nk0hN4CQlWoCzHirIsH3tEdobdB1tNHwonZ2iI7SnR60p6h8aTaYWoghQMYP
 VV6vO56aAu/K7jyZrXR/wEoIar5OUH5ZnpTSOBGqN+Hd6CGaEoJCIghy/PDPGvv0FUVz
 YTcatX5h67f2UyMGvW4zBPKJZPEThq1GuNQ2qlz0m+altQ+YAk6JJoqOGtxGMjgCmK3w
 sJIvpbVrvSXD4gnWwtB2riWJc1hlNDjy+KrdLUyzVW3eclpJxAmb8hk1EWHIEHo31Bb+
 +IAA==
X-Gm-Message-State: ABy/qLaWXkj0G2y1Ct6M8JobI015NTWVRc2LqtfQJKVV97Oo4b+479bJ
 mlarNU1i2qIkgjdXWfNEDx05WFtGbNy0Y4JnZkw=
X-Google-Smtp-Source: APBJJlHxs3vm91BnQfSBM/V0+ohNoREMDZXZEXgezlX/a+Jn4TtqurKFcVEelhRXc037y4DXlljGE+FglqW/7ok7RoA=
X-Received: by 2002:adf:f1d1:0:b0:313:ee2e:dae5 with SMTP id
 z17-20020adff1d1000000b00313ee2edae5mr5708514wro.21.1691002160424; Wed, 02
 Aug 2023 11:49:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230802-revert-do-not-generate-hfp-hbp-hsa-eot-packet-v1-1-f8a20084e15a@linaro.org>
 <5cf0e3fa-f66d-06c4-cfda-c48efd8c6508@linaro.org>
 <bf95af44-2510-1835-dec9-183144de8413@denx.de>
 <CAA8EJppp_ZJr-DcoZGd1GZmWuo=AECNS+X9zx0dNB4Edn8M2zg@mail.gmail.com>
In-Reply-To: <CAA8EJppp_ZJr-DcoZGd1GZmWuo=AECNS+X9zx0dNB4Edn8M2zg@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 2 Aug 2023 11:49:08 -0700
Message-ID: <CAF6AEGsfbUMCS4QTfqoyYetqea_ov-AET-iM54B-HvYpwwZvmg@mail.gmail.com>
Subject: Re: [PATCH] Revert "drm/bridge: lt9611: Do not generate HFP/HBP/HSA
 and EOT packet"
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: Marek Vasut <marex@denx.de>, Amit Pundir <amit.pundir@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 2, 2023 at 11:16=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Wed, 2 Aug 2023 at 20:34, Marek Vasut <marex@denx.de> wrote:
> >
> > On 8/2/23 15:38, Dmitry Baryshkov wrote:
> > > On 02/08/2023 11:52, Neil Armstrong wrote:
> > >> This reverts commit [1] to fix display regression on the Dragonboard=
 845c
> > >> (SDM845) devboard.
> > >>
> > >> There's a mismatch on the real action of the following flags:
> > >> - MIPI_DSI_MODE_VIDEO_NO_HSA
> > >> - MIPI_DSI_MODE_VIDEO_NO_HFP
> > >> - MIPI_DSI_MODE_VIDEO_NO_HBP
> > >> which leads to a non-working display on qcom platforms.
> > >>
> > >> [1] 8ddce13ae696 ("drm/bridge: lt9611: Do not generate HFP/HBP/HSA a=
nd
> > >> EOT packet")
> > >>
> > >> Cc: Marek Vasut <marex@denx.de>
> > >> Cc: Robert Foss <rfoss@kernel.org>
> > >> Cc: Jagan Teki <jagan@amarulasolutions.com>
> > >> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > >> Fixes: 8ddce13ae69 ("drm/bridge: lt9611: Do not generate HFP/HBP/HSA
> > >> and EOT packet")
> > >> Reported-by: Amit Pundir <amit.pundir@linaro.org>
> > >> Link:
> > >> https://lore.kernel.org/r/CAMi1Hd0TD=3D2z_=3DbcDrht3H_wiLvAFcv8Z-U_r=
_KUOoeMc6UMjw@mail.gmail.com/
> > >> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > >> ---
> > >>   drivers/gpu/drm/bridge/lontium-lt9611.c | 4 +---
> > >>   1 file changed, 1 insertion(+), 3 deletions(-)
> > >>
> > > Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> #fix db845c
> > >
> > > The boards broken by [1] are used in production by different parties
> > > since 5.10, breaking them doesn't seem more acceptable than breaking =
the
> > > new out-of-tree iMX8m hardware.
> >
> > The MX8M is also in-tree, so this does not apply.
>
> v6.5-rc4:
>
> $ git grep lontium,lt9611 | grep -v 9611uxc
> Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml:$id:
> http://devicetree.org/schemas/display/bridge/lontium,lt9611.yaml#
> Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml:
>     - lontium,lt9611
> Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml:
>       compatible =3D "lontium,lt9611";
> arch/arm64/boot/dts/qcom/sdm845-db845c.dts: compatible =3D "lontium,lt961=
1";
> drivers/gpu/drm/bridge/lontium-lt9611.c: { "lontium,lt9611", 0 },
> drivers/gpu/drm/bridge/lontium-lt9611.c: { .compatible =3D "lontium,lt961=
1" },
>
> next-20230802:
>
> $ git grep lontium,lt9611 | grep -v 9611uxc
> Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml:$id:
> http://devicetree.org/schemas/display/bridge/lontium,lt9611.yaml#
> Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml:
>     - lontium,lt9611
> Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml:
>       compatible =3D "lontium,lt9611";
> arch/arm64/boot/dts/qcom/sdm845-db845c.dts: compatible =3D "lontium,lt961=
1";
> drivers/gpu/drm/bridge/lontium-lt9611.c: { "lontium,lt9611", 0 },
> drivers/gpu/drm/bridge/lontium-lt9611.c: { .compatible =3D "lontium,lt961=
1" },
>
> Your device is not in the tree. Your commit broke existing users.
>
> Can we please end the argument, land the fix (this revert) for 6.5 and
> work on the solution for 6.6 or 6.7?
>

Even if they were in-tree, breaking existing hw means revert and
try-again.  Especially as we get into later -rc's

BR,
-R

> --
> With best wishes
> Dmitry
