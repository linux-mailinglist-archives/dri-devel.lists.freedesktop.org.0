Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2C667541B
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 13:06:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D820D10EA29;
	Fri, 20 Jan 2023 12:06:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE90A10EA29
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 12:06:22 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id a184so3772254pfa.9
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 04:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0fHoLFugivtMZ86kgSLqMbkMyqartt/N4bdBqj9xnEE=;
 b=EDQ3LbZIORQv6Wc6NXt5iUyV4RuaokaUOgR77k1Aa/RMyX/8Y5U4RwLjSG/K6XkFWP
 rhFm1GCcdTA+Q0BXiAKOY0Bxh5yQede1Occ/2SSErgBbcnS3xWcilhSwZx1AU2+/nAg8
 uqdZooE11ryi6UPO+/rAAjZMQST0xvB2xZc9zI+XgeYp1EgXXkswaO3NtVuR/9cpM9Yv
 BdC46FAv2X7txfFbeb6oPEGBVqwlx4NJLPv7tvaLUIAgnysFuyvTJJJVoki3NrpCOezS
 NUELWOty/dGfgX1jYEbg7BiYaMQH1ckN+Js0KjADAJ313RtBPyZIqlnX5jpNItnzkGJr
 pTNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0fHoLFugivtMZ86kgSLqMbkMyqartt/N4bdBqj9xnEE=;
 b=VJMynu0XKvD593jcoC2a6fe+L+HXtA8oOlAw6+HSduy+8UFj26fYLWI0vKNYhNNo10
 dGw5ssitTPVWKyfdWJC/ZPjC4KuMVPyeejeOAboLBxcg2MfIDnfK272vsrGSzbyhxWEf
 Ci+kKSVRyXD5IoO/Q5KtADS3BFfA+xrPtyOaX8Ue1wZz9pKFRs7254RdTG6kqvf//QK5
 x08yDWr99omJS16Y6rMJQRxrFBYTg2Cpji/+nLStlOXlPThKhmHlp/YQ991ax74Lr/Hu
 DtMTpu323zji+4Q+wpcX0+D3BWFc7NLNYolBVwvc3Hnj0y3H5eVdHAoRel06pdXq/47X
 q7UA==
X-Gm-Message-State: AFqh2kqTcOseB0dwoplSYqeOibrMj0jMDVKUqkyF/KM9RhnCa4f1Sknu
 AllZcxNvkovTvPC0X0Ovs3GzCCf9JoOC2z9VkiA=
X-Google-Smtp-Source: AMrXdXuRpBSOGSkq99Qq3DZEX5OA7nhrBDuhQ3ECyo4J1HInmfP5JWg/z7eNUFrp4cEL7c4dz3gFndCovBaeoHW2mdg=
X-Received: by 2002:a63:e23:0:b0:4cf:122f:2102 with SMTP id
 d35-20020a630e23000000b004cf122f2102mr1043434pgl.98.1674216382168; Fri, 20
 Jan 2023 04:06:22 -0800 (PST)
MIME-Version: 1.0
References: <20221214125907.376148-1-jagan@amarulasolutions.com>
 <CAMty3ZC9TtnupJKF4LA9e-jnYMux28u4Pn3femJZXi4ogV+drA@mail.gmail.com>
 <CAOMZO5AYzZXQ_7jqktKrGcZyE_CaZHZpfyQPWAzbcxGvByH5Kg@mail.gmail.com>
 <CAMty3ZDnNJJQ2=Xbi6tNDzp17Ye=mnVhPOEtWVZbZuot_N513w@mail.gmail.com>
In-Reply-To: <CAMty3ZDnNJJQ2=Xbi6tNDzp17Ye=mnVhPOEtWVZbZuot_N513w@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 20 Jan 2023 09:06:10 -0300
Message-ID: <CAOMZO5CXCYjmmjs97=c6pVzyG8s0W=XN01k0C_0M_X2-pCFuMQ@mail.gmail.com>
Subject: Re: [PATCH v10 00/18] drm: Add Samsung MIPI DSIM bridge
To: Jagan Teki <jagan@amarulasolutions.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fancy Fang <chen.fang@nxp.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>,
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Neil Armstrong <narmstrong@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Adam Ford <aford173@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan,

On Thu, Jan 19, 2023 at 2:59 PM Jagan Teki <jagan@amarulasolutions.com> wrote:

> There are two patch series prior to this need to apply.
>
> https://patchwork.kernel.org/project/dri-devel/patch/20221212145745.15387-1-jagan@amarulasolutions.com/
> https://patchwork.kernel.org/project/dri-devel/cover/20221212182923.29155-1-jagan@amarulasolutions.com/

Would it make sense to re-submit these two patches as part of your series?
