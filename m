Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A374B17AB1B
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 18:03:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A8A66E35D;
	Thu,  5 Mar 2020 17:03:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 696536E35D
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2020 17:03:23 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id x22so5235779lff.5
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2020 09:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W2UjAEkYLoxg6JgLNx0dN+e49hTl06XZg+T5mliqMNU=;
 b=QdJpsICtDG2FI/4Z9M6lKYAcG0BpjpbXK8rLQyA4OEixlsxjDiGx3To1lir1sBp1M9
 UwuoRwaVCnVgUPq4inbZJ3TxCkxCrFEJn1E6DTKoLoG9iHe+E01qy4ui4vtj9Q36JSXp
 ZqI3vZjzXINJNR2WZQYS26NJieBM4iEKc5bwAVwHReucih3l3k93tS1OUlLleRX0o1y1
 KtuaE/jXH3s5Pdf2YA/jnZsd2GI9LGTK5wvLZgDIrxGSZbyinFeR134NKThtgyXxUoJU
 f3VfKoFSVmnBne9A3FTkdC4acYw5/x1ZZwLrZ04c0wXHMYb/1RofGGRyRmlBqM+aIrD4
 1aQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W2UjAEkYLoxg6JgLNx0dN+e49hTl06XZg+T5mliqMNU=;
 b=JmX4GL1XqaBASfGre9aL70d/sKcS087uPKb1vtYBrRf3iTxJMWMJ74UNkrVyKS/oeQ
 ALoJaOFQZ1p5OxXBRsRyfx+u+z7bcU2CmKVyLxAw09Pzjocszp2st89m4dDryjrfSjYn
 VExh9ToeAMT7P+zg2VOHn33QS3RAGUQgOv7Tk/fejCcmEW8+GYNspxSNpo6/NNoZzhYM
 ghkyP7SOwVB2btOYCv62+FDZGzLK4xk4+YtE1VWfHEld5Mve+CLWefUjf33eCuNZz1QL
 UToOhQ+ckNP7pAy8uVGkYkT1WAqTVMHRC8o8lqDkc5xskZCm8YdFuV1M5iaRfMGxBT0z
 Lpow==
X-Gm-Message-State: ANhLgQ2VQQAY3+Gfnn6IiO/bpMIiBVFEs0oOuAowP3q5ArLMu0Z3sDM4
 BfrmOlViIwW2k3h+bv3F+42zZJaPTY8hDzgoKCNzvw==
X-Google-Smtp-Source: ADFU+vtj5gp1/LY+e6ph9lZLVyP4h9/sF6S8jMp7MXl11AHO2LcgdwYrHVm+Ah8nGom52hUhqSxPo5r0KmpWtLmClCc=
X-Received: by 2002:a05:6512:692:: with SMTP id
 t18mr6077856lfe.212.1583427801701; 
 Thu, 05 Mar 2020 09:03:21 -0800 (PST)
MIME-Version: 1.0
References: <20200305155950.2705-1-tzimmermann@suse.de>
 <20200305155950.2705-19-tzimmermann@suse.de>
In-Reply-To: <20200305155950.2705-19-tzimmermann@suse.de>
From: Eric Anholt <eric@anholt.net>
Date: Thu, 5 Mar 2020 09:03:10 -0800
Message-ID: <CADaigPXaBRx+DG8TP-BPFycqwzmf-2NMQX6cXQP69MTVE6CzAw@mail.gmail.com>
Subject: Re: [PATCH 18/22] drm/vc4: Use simple encoder
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: hamohammed.sa@gmail.com, alexandre.belloni@bootlin.com,
 David Airlie <airlied@linux.ie>, linux@armlinux.org.uk, paul@crapouillou.net,
 linux-tegra@vger.kernel.org, thierry.reding@gmail.com, krzk@kernel.org,
 sam@ravnborg.org, sebastian.reichel@collabora.com,
 linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com, hjc@rock-chips.com,
 abrodkin@synopsys.com, kong.kongxinwei@hisilicon.com, jonathanh@nvidia.com,
 xinliang.liu@linaro.org, ludovic.desroches@microchip.com, kgene@kernel.org,
 linux-imx@nxp.com, linux-rockchip@lists.infradead.org,
 virtualization@lists.linux-foundation.org, puck.chen@hisilicon.com,
 s.hauer@pengutronix.de, alison.wang@nxp.com, jsarha@ti.com,
 matthias.bgg@gmail.com, wens@csie.org, kernel@pengutronix.de,
 jernej.skrabec@siol.net, kraxel@redhat.com, rodrigosiqueiramelo@gmail.com,
 tomi.valkeinen@ti.com, bbrezillon@kernel.org, jingoohan1@gmail.com,
 DRI Development <dri-devel@lists.freedesktop.org>, sw0312.kim@samsung.com,
 nicolas.ferre@microchip.com, kyungmin.park@samsung.com,
 kieran.bingham+renesas@ideasonboard.com, zourongrong@gmail.com,
 linux-mediatek@lists.infradead.org, shawnguo@kernel.org,
 laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 5, 2020 at 8:00 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> The vc4 driver uses empty implementations for its encoders. Replace
> the code with the generic simple encoder.

Acked-by: Eric Anholt <eric@anholt.net>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
