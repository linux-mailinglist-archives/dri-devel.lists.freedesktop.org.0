Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0CE755C08
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 08:44:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FE2E10E1F7;
	Mon, 17 Jul 2023 06:44:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FFCF10E1F7
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 06:44:13 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-56fff21c2ebso41542207b3.3
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jul 2023 23:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1689576252; x=1692168252;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CPxyXhOq0yMhGwdIhN47SQ9mxxoFo8fBqlACSvCMBec=;
 b=C9354NTV9FJDNTweJtAEiUmBpjXaDX0eREwuXJzRaaZY98lvuHksDVHM5II29JYduV
 KfJva2PKr67iGdjh0RT2tlYFg5DS7pSPBX9bTS7Qn8Chc2bdlkQaQIJE3J5i12PAwQIo
 syWCIKABedWaaegTdoQ0vQ7NFCfU8YpePUuyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689576252; x=1692168252;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CPxyXhOq0yMhGwdIhN47SQ9mxxoFo8fBqlACSvCMBec=;
 b=gnnvAvGjzIvL1IwG75LKpnOEsYlDKIB1IqdtdRDh0xLNozZCVgqA0Gj/iTbRTXx3P4
 NxY3xw84Zno/8IrUgarsq1JVPkfG1X3Z24mcsnoIH0VsigSiAHi/WwFjPAoptvEGC6lc
 z50wO3tddk0AFqZ1pTzkb2erK40T839bB00IvapKFZRBtxAlBVknMyaEEJAKJnOW+S2b
 wVTlcgk9e0oZ9ts3xv1VuLJA4Zg5eWdLvYVf+TuM9yCcJvXJoNxzJwyZv3XtOlqAxL11
 B/pKlGPHZp59/ViOqiktUQCovc7D66DlnBVb9/QXdY+UGhR3aNOrbc/nhXXSt5PH3E7e
 KWtA==
X-Gm-Message-State: ABy/qLZY3JsQ2NFeB6Q0h7vs0cX+681bJotXvxvXJDbvITUupqjTHMIX
 wMCSOMY6ydWPS21oLLnkQsSEdu79tJZpbO4m8cTbZw==
X-Google-Smtp-Source: APBJJlECuOWcElxDEP2lLqU6Yd6rgdXMubn7FwQoBuI4bs08qGhUgEoxcWDfgPFkaYGvh8rXyJJfyL4vMMG5ewt62+s=
X-Received: by 2002:a81:6d0d:0:b0:577:f47:3d8d with SMTP id
 i13-20020a816d0d000000b005770f473d8dmr11544158ywc.25.1689576252737; Sun, 16
 Jul 2023 23:44:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230717061831.1826878-1-victor.liu@nxp.com>
 <20230717061831.1826878-10-victor.liu@nxp.com>
In-Reply-To: <20230717061831.1826878-10-victor.liu@nxp.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 17 Jul 2023 12:14:01 +0530
Message-ID: <CAMty3ZAdzASJCz+j4iOTJ+wCXWP2Z48jFL687kxDmJLPU7T6gA@mail.gmail.com>
Subject: Re: [PATCH 9/9] drm/bridge: imx: Add i.MX93 MIPI DSI support
To: Liu Ying <victor.liu@nxp.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, rfoss@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, s.hauer@pengutronix.de,
 jonas@kwiboo.se, linux-imx@nxp.com, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, jernej.skrabec@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 17, 2023 at 11:44=E2=80=AFAM Liu Ying <victor.liu@nxp.com> wrot=
e:
>
> Freescale i.MX93 SoC embeds a Synopsys Designware MIPI DSI host
> controller and a Synopsys Designware MIPI DPHY.  Some configurations
> and extensions to them are controlled by i.MX93 media blk-ctrl.
>
> Add a DRM bridge for i.MX93 MIPI DSI by using existing DW MIPI DSI
> bridge helpers and implementing i.MX93 MIPI DSI specific extensions.

I think the better way would add compatibility to be part of existing
dw-mipi-dsi.c with specific driver data. This way it avoids all the
platform-related helpers(extensions) and makes the driver generic to
all SoCs which use DW DSI IP. It would be a straightforward change as
the imx93 drm pipeline already supports bridge topology.

Thanks,
Jagan.
