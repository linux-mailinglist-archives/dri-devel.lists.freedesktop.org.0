Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 690739BCBCB
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 12:26:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FE7910E574;
	Tue,  5 Nov 2024 11:26:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bm6gDmO+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48C2210E574
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 11:26:28 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-e2915f00c12so4667753276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Nov 2024 03:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730805987; x=1731410787; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZbPFk8wJiQvrTCXjlYgvumUQ0j3KXfVkR1pWzQFIBYw=;
 b=bm6gDmO+cbBWcjQL1fafUrdD2Y6hX3XvEpt83vfZNxkUytBPgGH7HG5quDTNca9JKK
 QU1N/dQVDfK3wx+Nap1eBxmNe+1m3pDM/jarmbjRxwPaUZi8kiNQU+PRE5G8Oa/KXfPA
 UfZoA9X+5iO4RxysRe/xqMZPPHtRjqiJOtyOk8bj7+BSTAvDNiurOMNUjgaTOYIHx9zw
 u76CkpuNQET2u9pL4Wp1LqXVmCTOmkoA8NBgtZ7XEBhnRrQ/srqnPwDJT7tvwC26yemG
 +RLqEtd7oLL/jn/srzqKjM1lHc4O++915P9KUbv3KFrGwJYE8hRdCGnFx7RG9V4Ktcy7
 Sgyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730805987; x=1731410787;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZbPFk8wJiQvrTCXjlYgvumUQ0j3KXfVkR1pWzQFIBYw=;
 b=asuOX0HSJStGoy4Za+/rALKM33rQSEjXzvJa9gYRYL4EQrJ56ujKVgYzSJFJ+lCUC2
 IW2QH8ujMY0F43bEqVUflRtEzGyv00RsN0WWL3cT+WsHvuRxaFiZZ0hfypqes7fO0pAd
 pWk4mdP/g9Ttu6N1IN8KFZTEIKS8IJhz0RH48LKJ8ZR5ZhbQGExtqzI6VspI8xeMQYNJ
 HxbTXcVYMuL8VXAGLgI1bUG1l3uCDhwGhcP9R+DB+f9ywTcgmuT+1KklulblnhBIn2eu
 AA01AAczgK29HXh4RIaPB/NJGBeu8sXQ0HEoQvgWaJMHYTDs3wz/n/g0Pk847+KejK2E
 GRqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVA8+ZqFyty7OqAzInN7RQ+WsObQzeSHplOyQtNUy7uZ+2NsnuUiSZmz0Q4K9HerknrxfnzLJSYjAY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzrglsTHZiju7eHg1SiXi6YBE0QO94cD7cHys/4DDSPAQpuPxHh
 1qRT09SA+WWea8uQKmdy/kvdmLZ0OZ+H3Y5V52/o/ZeOAWE9O+i2bj/OOqpWIrCxgJSH7gm+zjM
 PGxFmnyEVFtLNRVwLmLbUF4xtVc3P04jLY8k37g==
X-Google-Smtp-Source: AGHT+IHwht1pfSwQlaqWWbyXJaYST2v470nqEkV0Y3tMwYWqipVeiUaNoITHKiBik6whym2zw0rsn51UBBneR8aGa1Y=
X-Received: by 2002:a05:690c:fd0:b0:6ea:8d6f:b1bf with SMTP id
 00721157ae682-6ea8d6fb48amr78680707b3.0.1730805987251; Tue, 05 Nov 2024
 03:26:27 -0800 (PST)
MIME-Version: 1.0
References: <20241028023740.19732-1-victor.liu@nxp.com>
 <20241028023740.19732-5-victor.liu@nxp.com>
 <Zyn5CgZvyg05cgJW@kekkonen.localdomain>
In-Reply-To: <Zyn5CgZvyg05cgJW@kekkonen.localdomain>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 5 Nov 2024 11:26:16 +0000
Message-ID: <CAA8EJpoaLnw46DUaZ+z-YSkbdk-f45-dKMjoQWu16zaC6i-H-w@mail.gmail.com>
Subject: Re: [PATCH v4 04/13] media: uapi: Add
 MEDIA_BUS_FMT_RGB101010_1X7X5_{SPWG, JEIDA}
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, quic_jesszhan@quicinc.com, mchehab@kernel.org, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
 hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com, 
 quic_bjorande@quicinc.com, geert+renesas@glider.be, arnd@arndb.de, 
 nfraprado@collabora.com, thierry.reding@gmail.com, 
 prabhakar.mahadev-lad.rj@bp.renesas.com, sam@ravnborg.org, marex@denx.de, 
 biju.das.jz@bp.renesas.com
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

On Tue, 5 Nov 2024 at 10:53, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Hi Ying,
>
> On Mon, Oct 28, 2024 at 10:37:31AM +0800, Liu Ying wrote:
> > Add two media bus formats that identify 30-bit RGB pixels transmitted
> > by a LVDS link with five differential data pairs, serialized into 7
> > time slots, using standard SPWG/VESA or JEIDA data mapping.
> >
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
>
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>
> It's fine to merge this via another tree, too.

Thank you!


-- 
With best wishes
Dmitry
