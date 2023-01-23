Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C973C67805D
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 16:48:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A710110E4E0;
	Mon, 23 Jan 2023 15:48:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F53B10E4E0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 15:48:42 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id p141so12596652ybg.12
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 07:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Lad2S3DmWAOKK3//NALgU6IibSlQrTkUVTfexl9hK28=;
 b=iZkcSIQzF/MH/mRCVgA0S+N54Fw4FdVsgLfkRYCRNmmnxQg3ucT9g4RbICTeA1dNdo
 wECwxxE7HSZ1q+E599vwhYLEsvttvYgzdQQMsCVe/sYal0P2zmNR9qYjkqpX3KqtdrVu
 gKJel2BN9+zhKQL8IS5zGQWVQxDccR/2hrdDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Lad2S3DmWAOKK3//NALgU6IibSlQrTkUVTfexl9hK28=;
 b=wbN1dd3CJkITLTjHZgbS1PL1ATk9BQfusdGyKK2ElIOdTy7uqIn59XiNAb9lgqWSIF
 XVVsUP+OqjtWkNCq250oVwPO1heZrQKw/Cd03KJo/+n5Bz+NoaSe1tAAU+B5oyPx39dB
 4OW6nR6MkLzWXVMsbbLwfYsKtWGi+nhnr/O8dltVeO2JNWiOdc/LMCrLcInzK6u967ZK
 WvBGZSM173zwTIrzT5RoFt3YNFtPj7Ufo+0TyrkBkhD0/zri3XG+tSrscCcKBr0cqscB
 O9wMHtRZP9XHRV9Q6K/iaaGL3PmkQULWr2iWfBfrRACYHrZge6YmqW6gj81QoU3aMVA/
 kGJw==
X-Gm-Message-State: AFqh2korZ4saKMSvAg1g0IOX1ZIltd+xXfhOoEsumOTMHOnTiHXX57VR
 fGhS4huz5x2C4KmFIiuW/lNpYqq2o6ale2tO35TLtA==
X-Google-Smtp-Source: AMrXdXtQ6or+o73bm1Dy+HD5HO5+7SmuUrYsEF6I2faUuPEkt7lv4xXbqVlYtJkd+l6OUmAN509bUeHbdrb4wDtMjNw=
X-Received: by 2002:a05:6902:1822:b0:800:e4d5:1bf3 with SMTP id
 cf34-20020a056902182200b00800e4d51bf3mr1270342ybb.159.1674488921411; Mon, 23
 Jan 2023 07:48:41 -0800 (PST)
MIME-Version: 1.0
References: <20221214125907.376148-1-jagan@amarulasolutions.com>
 <CAMty3ZC9TtnupJKF4LA9e-jnYMux28u4Pn3femJZXi4ogV+drA@mail.gmail.com>
 <CAOMZO5AYzZXQ_7jqktKrGcZyE_CaZHZpfyQPWAzbcxGvByH5Kg@mail.gmail.com>
 <CAMty3ZDnNJJQ2=Xbi6tNDzp17Ye=mnVhPOEtWVZbZuot_N513w@mail.gmail.com>
 <CAOMZO5CXCYjmmjs97=c6pVzyG8s0W=XN01k0C_0M_X2-pCFuMQ@mail.gmail.com>
 <CAMty3ZAc=t5FEphQkd=O1eaA70-779zhESwPFqoiGs8x569H2w@mail.gmail.com>
 <ea400d44-a6cb-2f26-9c03-ee1ede2cdf09@denx.de>
In-Reply-To: <ea400d44-a6cb-2f26-9c03-ee1ede2cdf09@denx.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 23 Jan 2023 21:18:29 +0530
Message-ID: <CAMty3ZDeAKhp4W1oA4eLXcw5YjsPjOTshjsipSn-pko06fUzdQ@mail.gmail.com>
Subject: Re: [PATCH v10 00/18] drm: Add Samsung MIPI DSIM bridge
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
Cc: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fancy Fang <chen.fang@nxp.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Neil Armstrong <narmstrong@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Maxime Ripard <maxime@cerno.tech>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

On Fri, Jan 20, 2023 at 8:36 PM Marek Vasut <marex@denx.de> wrote:
>
> On 1/20/23 15:41, Jagan Teki wrote:
> > Hi Fabio,
>
> Hello all,
>
> > On Fri, Jan 20, 2023 at 5:36 PM Fabio Estevam <festevam@gmail.com> wrote:
> >>
> >> Hi Jagan,
> >>
> >> On Thu, Jan 19, 2023 at 2:59 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> >>
> >>> There are two patch series prior to this need to apply.
> >>>
> >>> https://patchwork.kernel.org/project/dri-devel/patch/20221212145745.15387-1-jagan@amarulasolutions.com/
> >>> https://patchwork.kernel.org/project/dri-devel/cover/20221212182923.29155-1-jagan@amarulasolutions.com/
> >>
> >> Would it make sense to re-submit these two patches as part of your series?
> >
> > The previous version's comment was to separate them from the DSIM series.
>
> Hmmmmm, seems like those first two patches got stuck. I fixed up the
> malformed Fixes: line (it was split across two lines and had angular
> brackets around it) and picked the first series via drm-misc-next .
>
> Can you send a subsequent patch to convert the DSIM_* macros to BIT()
> macro , since checkpatch --strict complains about it ?

Fyi: I sent the v11 series for this with RESEND prefix.

Let me know if you have any further comments on this.

Thanks,
Jagan.
