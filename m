Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E41B8624661
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 16:54:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EC3C10E144;
	Thu, 10 Nov 2022 15:54:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D1E010E144
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 15:54:47 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 d13-20020a17090a3b0d00b00213519dfe4aso1869591pjc.2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 07:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5cY9qUsRqtE8TrX9YkzMKcdKUuXawtOb/S7+iZPyZhg=;
 b=ZkgP4TzeZjynPYYUd2OYz6AQRc9SKLkDMpRKeeezyHWelBe0m41B0WyMRGx7iIMrk0
 WSa3/rhSox2m5RimkbZ7okXs9Uw3q+ASfZ7xA13pfLIrn0ipKvINK3y25HdG1jHDEhcD
 ig85+y8y3qCWtu16PZHWYfUSJ8Azdh6UFcniqnlNvhgI9Em0dZXwK0B0PXyXZ7WWLuqk
 4ryCYiHRHmfHwjuyTzxcQjSQDY2iKFmORTt37B028vZV20hvFE9MfJu/Ely92lB5Ca4W
 X7lAs5uOqxGLuZlOI9Ey8AH0uMfYtS/IsmpOdij9IU7EizU6DK+TiCR3lS2hAMeVKC3n
 Y1vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5cY9qUsRqtE8TrX9YkzMKcdKUuXawtOb/S7+iZPyZhg=;
 b=ULmw8ajtxZl1zjPgXnDRu+DHpqZF++LlZ0FppAyjt0yx+95NUNBzb4pj0KJNAmnnDp
 ahZfc1/fkK23DqxbQ4TXCU5g840hAyfRXrmJGCXf5ExTbj8LEvzcOM0mWHxK9XjJB4KC
 6HzPoTy6TVG+D6GQxd59HpmUEucUWw5/rMRPY5sM1fmYbUDZnw2KM1Ue2gFLzODE6o/6
 Cuy/qkzngconRNQcpU5Bnurmxr/MU9uNEKhfbaGBHvGdgfnnttzYr4kW7pJHGGJ/R2oX
 6H65+oWjpjwBgOZbV4JhUxSbK9DZDwuM0SNUEVtK2n92bEMLW977OLF0tamdJ1h2YlqS
 x8Ew==
X-Gm-Message-State: ACrzQf0Zqyo7ZO8uhETUiHq2m7V7578vVfzxgpG7+cHT6+Go4pBQ72Bs
 s16BRi7xuhqSk8Fz7mZzMW2Cvp/n79nPLs+J1nE=
X-Google-Smtp-Source: AMsMyM4MKenHQEpL5igM9bIJh+ijqHRMrG+VpTH9rZPo5TO0pW7paW7eRNDw9JbV9SvME7k+EyGiFEF2uvsWbkywwGA=
X-Received: by 2002:a17:90b:1056:b0:212:dc2f:7ee7 with SMTP id
 gq22-20020a17090b105600b00212dc2f7ee7mr1325884pjb.172.1668095686643; Thu, 10
 Nov 2022 07:54:46 -0800 (PST)
MIME-Version: 1.0
References: <20221005151309.7278-1-jagan@amarulasolutions.com>
 <f1dfac7d-643e-db29-28fe-7a2fcde01894@kontron.de>
In-Reply-To: <f1dfac7d-643e-db29-28fe-7a2fcde01894@kontron.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 10 Nov 2022 12:54:32 -0300
Message-ID: <CAOMZO5AqRRYLTUQWACiCA0RCvsjGaCmK3yhdGP8XfNxjFP1OiA@mail.gmail.com>
Subject: Re: [PATCH v7 00/10] drm: bridge: Add Samsung MIPI DSIM bridge
To: Frieder Schrempf <frieder.schrempf@kontron.de>
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
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 NXP Linux Team <linux-imx@nxp.com>, Matteo Lisi <matteo.lisi@engicam.com>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Nov 7, 2022 at 1:34 PM Frieder Schrempf
<frieder.schrempf@kontron.de> wrote:

> I tested this on the Kontron DL i.MX8MM which uses a TI SN65DSI84 bridge
> and a Jenson 7" LVDS Display.
>
> Thanks for your work, Jagan!
>
> Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de> # Kontron DL
> i.MX8MM

As this series has been successfully tested on multiple devices, is it possible
to apply it so people can make further adjustments?

Thanks
