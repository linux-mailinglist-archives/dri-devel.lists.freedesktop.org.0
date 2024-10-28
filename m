Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D33BD9B2CA1
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 11:20:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD0A710E375;
	Mon, 28 Oct 2024 10:20:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KmgHNySx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF7110E375
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 10:20:27 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-6e330b7752cso35724317b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 03:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730110826; x=1730715626; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TU2sdGJHKvD0taxHYBsyanzPD/VqU1wUV5/5j1d0+s8=;
 b=KmgHNySxEzy1EwSmvt4uTnGfuGwqJboXvDAJzIopwP3NwDjziYBtjyDmknuSmdAPS7
 6jwsg56QJOZF65V31yrpoi0ZqAh9OefDlGZCKYW4W8ZCXbS8T4hBGU1uyeun322ophMd
 cqDKh9atmsisWfWO8PXNIl8921WngDb/eEAs2/qIai97ikHwov1cMbJjHtQ6cNs7TEEZ
 oROvI+Gs/Os0a4RzDQkwlRyn9bR4aJPf6++/3/Fy8lgNPssPPjdrA9yyaKwoUZqYhMse
 gp9Ds9XWOkFalPhrKBG0SoztjGxht7vpCJDErC+8GDPQwSbJwSMvRS1MfcIX438I4Zdq
 BG3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730110826; x=1730715626;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TU2sdGJHKvD0taxHYBsyanzPD/VqU1wUV5/5j1d0+s8=;
 b=Vvrq6Dae8FVklV0L4XihAg+ezJWLsnk9G4HG68vnFmhvsJYzeilYNlI/934zQ8mNbC
 dbT0eHatOCdRxjTYrxAOsncLDJXQEyKOMvHxVEWrbjZDDicT26rKEaZbpy08Jg+jxeH5
 EJtmN+F6GJ6q8VJNlYzrQH70KYy0+0oSnjrE7RNQ9MOP3HYmyOeBnKE0w893qKbjESwD
 kYC8XrexEgdjfCWn1a+XoYOfy7Sw6VXlU0eXmWuyqkAPdYilnPAeqJCV+GRojvDPNH/t
 9I5kRagjfanivy09v/PZA6cURwRBg0y8d2vWOlfjQUCjth3T7swWtC+pRhaYhj61IUoo
 3xhw==
X-Gm-Message-State: AOJu0YwG1Bg2ub9lRDIk5hGoO/60uhoxszAQ38ur3bmEM7eiEcYeXAFA
 kjPECK7Au0rQ0pWJAkRyFMtPwqQOQgcriwB5kFDowmc+3zd/EhLJ/sgB5soN9Qjqz+WJNrFhBz0
 mf5HTm+D7L0eBIwKZwSO1txkhV6NzEqHTeyqpNg==
X-Google-Smtp-Source: AGHT+IHKdCACUXqx7Rdwg/Prh7fz9WsgaRfTmIR4UCFC4hi7xMX8hmTZVx47XtOQhuApr5txecXLMxKkQJeYoI3DfdM=
X-Received: by 2002:a05:690c:6303:b0:6e3:c92c:1d57 with SMTP id
 00721157ae682-6e842f91cf4mr107258157b3.2.1730110826498; Mon, 28 Oct 2024
 03:20:26 -0700 (PDT)
MIME-Version: 1.0
References: <20241028023740.19732-1-victor.liu@nxp.com>
In-Reply-To: <20241028023740.19732-1-victor.liu@nxp.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 28 Oct 2024 12:19:50 +0200
Message-ID: <CAA8EJprFBbC_=kBHi86j-nE_K68QeG+c2OBzJCbUyNWs5zQK0Q@mail.gmail.com>
Subject: Re: [PATCH v4 00/13] Add ITE IT6263 LVDS to HDMI converter support
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, quic_jesszhan@quicinc.com, mchehab@kernel.org, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
 sakari.ailus@linux.intel.com, hverkuil@xs4all.nl, 
 tomi.valkeinen@ideasonboard.com, quic_bjorande@quicinc.com, 
 geert+renesas@glider.be, arnd@arndb.de, nfraprado@collabora.com, 
 thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
 sam@ravnborg.org, marex@denx.de, biju.das.jz@bp.renesas.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, 28 Oct 2024 at 04:37, Liu Ying <victor.liu@nxp.com> wrote:
>
> Hi,
>
> This patch series aims to add ITE IT6263 LVDS to HDMI converter on
> i.MX8MP EVK.  Combined with LVDS receiver and HDMI 1.4a transmitter,
> the IT6263 supports LVDS input and HDMI 1.4 output by conversion
> function.  IT6263 product link can be found at [1].
>
> Patch 1 is a preparation patch to allow display mode of an existing
> panel to pass the added mode validation logic in patch 3.
>
> Patch 2 allows i.MX8MP LVDS Display Bridge(LDB) bridge driver to find
> the next non-panel bridge, that is the IT6263 in this case.
>
> Patch 3 adds mode validation logic to i.MX8MP LDB bridge driver against
> "ldb" clock so that it can filter out unsupported display modes read
> from EDID.
>
> Patch 4 adds MEDIA_BUS_FMT_RGB101010_1X7X5_{SPWG,JEIDA} support, as they
> are supported by IT6263(with LVDS data bit reversed order).
>
> Patch 5 makes drm_of.c use MEDIA_BUS_FMT_RGB101010_1X7X5_{JEIDA,SPWG}.
>
> Patch 6 supports getting dual-link LVDS pixel order for the sink side as
> needed by IT6263 driver.
>
> Patch 7 documents jeida-30 and vesa-30 data mappings in lvds-data-mapping.yaml,
> as needed by IT6263 DT binding.
>
> Patch 8 extracts common dual-link LVDS display properties into new
> lvds-dual-ports.yaml so that IT6263 DT binding can reference it.
>
> Patch 9 adds DT binding for IT6263.
>
> Patch 10 adds IT6263 bridge driver.  Only video output is supported.
>
> Patch 11 adds DT overlays to support NXP adapter cards[2][3] with IT6263
> populated.
>
> Patch 12 enables the IT6263 bridge driver in defconfig.
>
> Patch 13 updates MAINTAINERS to add maintainer for IT6263 driver.

This has pretty complicated structure from the merging point of view.

I propose we take patches 6, 8, 9 (without 30-bit formats, they can be
dropped while applying), 11, 12 (?) and 13 through drm-misc in one
batch (once DT maintainers review the binding parts). This looks like
a minimal set, having no extra dependencies.

The second set might be 4, 5 + new patch, re-adding 30-bit formats to
IT6263 binding (no driver changes are necessary). This can go in
separately, after an Ack from media maintainers.

Of course both sets can go together if linux-media maintainers reacts
quickly and ack merging media-formats patch through drm-misc tree.

The rest of the patches don't have such strong dependencies and go in
once ready / reviewed.

WDYT?

-- 
With best wishes
Dmitry
