Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C0A67E1DD
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 11:39:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE04710E442;
	Fri, 27 Jan 2023 10:39:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0473810E444
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 10:39:37 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-4fda31c3351so61239237b3.11
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 02:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+UJopeyyxAviHgbfTKRe0a3GHBuVXTQ2ZS0wdQedRMU=;
 b=NSzsKWR55MLIj2BwSSAY7xu5odSWc8Wpa5I2UzBnvWkkUbEVm5BNyo/qqs32doZIND
 U9oY3uygc2XSEIqnJcIv+b9jsGhEinu+KykBsWg0XRI4YGQ/1cS5FGI3A1Nw4gZ+J85z
 TJP7EuF+xLG+YBGXibi80d9Sca8pD4Dh8N5XI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+UJopeyyxAviHgbfTKRe0a3GHBuVXTQ2ZS0wdQedRMU=;
 b=W4UnUb7d7VP6hwmh/wN6e8S/oclawUkKleBsLk1OWPORq18L1O77gawPcyaX3vkq3K
 H/xLasp2intdJxijiS/NEQdNL7E/auXXvEirqHiJSjqpk1zxUfsE+Tccn+3O8m+THUEK
 HYmFiql06oJJNtMRfpWGf1+ikB1h90tUHqpXS0Dd7XCccfK0uCGXsoZdTF8Zx29XSFrT
 eyKT0h31WLkmYWOBjDlFKCc5o0I5o66mvLMCHs44wGzKV/omQFhGj6J2oEf8oOnLFNIE
 ho7Z2TICWXi9K+ezx+OCzkycpG3PvnfNmjSp6bAzzJdXIWFq2OAgbbSXUQPvNIhvAAit
 MLcw==
X-Gm-Message-State: AFqh2kpCUdxZAtnjpOLot/IAvhciPnUCH/UAWHQY7+6DmgMfkWFxIhzh
 U3KIEClTl5+kTo9u8e5KSE0WuK+0WW4tpsZUbUNlSQ==
X-Google-Smtp-Source: AMrXdXt7VHM5i5gwr/v0SJKIzXfWwXeopdfWws0tbqOqzwabBR1mb7WiM96wbFyqUwYsoxOIXsr+LjvOPeA9Sz+98RQ=
X-Received: by 2002:a81:48c:0:b0:500:fbbd:a4d2 with SMTP id
 134-20020a81048c000000b00500fbbda4d2mr3279206ywe.186.1674815977087; Fri, 27
 Jan 2023 02:39:37 -0800 (PST)
MIME-Version: 1.0
References: <20230126144427.607098-1-jagan@amarulasolutions.com>
 <06e5423f-c022-7a1c-efe0-0f4fbab664c1@prevas.dk>
In-Reply-To: <06e5423f-c022-7a1c-efe0-0f4fbab664c1@prevas.dk>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Fri, 27 Jan 2023 16:09:25 +0530
Message-ID: <CAMty3ZBRDDnNdmgD5ji11SdCuOcmu3ZyBPyB28cF1aRTyxp+fg@mail.gmail.com>
Subject: Re: [PATCH v12 00/18] drm: Add Samsung MIPI DSIM bridge
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
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
Cc: marex@denx.de, linux-samsung-soc@vger.kernel.org, matteo.lisi@engicam.com,
 linux-amarula@amarulasolutions.com, sw0312.kim@samsung.com,
 dri-devel@lists.freedesktop.org, frieder.schrempf@kontron.de,
 kyungmin.park@samsung.com, Laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com, robert.foss@linaro.org, m.szyprowski@samsung.com,
 aford173@gmail.com, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 27, 2023 at 4:03 PM Rasmus Villemoes
<rasmus.villemoes@prevas.dk> wrote:
>
> Hi Jagan and others
>
> I'm trying to test this series on our imx8mp-based boards, which has the
> mipi-dsi connected to a ti,sn65dsi86 bridge (in turn connected to a
> full-size DP-connector). But I don't know how to add the proper nodes to
> imx8mp.dtsi. My current, obviously incomplete, attempt is

Please use this repo - https://github.com/openedev/kernel/tree/imx8mm-dsi-v12

Jagan.
