Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC8C58751C
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 03:39:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27A7E1120DF;
	Tue,  2 Aug 2022 01:39:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D508C1120E4
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Aug 2022 01:39:24 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id a7so10469643ejp.2
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Aug 2022 18:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=n/hvrcN3haklNL4BZT6Q3NHuwV54nZb1V2WNeAo3614=;
 b=kwt4HjBfsem/AP1lC8+VnuEw5nbGzMpMdJdWcv6GaiHH9ZN+uCfG0foM/H5gOb7epn
 RQasGtuwVIdA9i9+K8V8xNKJb8N+VLaOwE0HDkUO5018L8vyNKH5n0YJB0+SPZKSZoym
 gJ7ixLRhZL/KQNDBydRa4yP6Cntxsv6fwqcHkE9IGGjoq9ZSc1WqEdBTwz6WkHJUQJCe
 YQuEXhmu1uiTX2S42OBjjdrJnmpnM6raTynQPitWqVAosgK6sAFk0Kv6NoYRcVzqydUy
 YjXcirupuQxcFNvVVZnW4T8dRm72d2y4q4lKOOeliub9Q8If+6Zo5bW16t6hnd2fAiDj
 oaAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=n/hvrcN3haklNL4BZT6Q3NHuwV54nZb1V2WNeAo3614=;
 b=20qdbTmpE3Ozrcg/LwobmxK3tMmlxGDlkWFkPG3r/q15tHD8vM3Rp8Lts6pyMawmXZ
 +wLGFsp7b+jk4r6H2Zf3HGENy6iPlaowVA5Wdkk1ZMHTuRT5TuBxB2RazKG2hlII/bTd
 XS4H6vybxlw+35LfYOSux5NMuaDskQAjstQ/Zg8p8z9s3mO30YOSjC2rBeL5ogFMOYlW
 hB0WuzP9ICmMydzGvUgHriNFy8TID5zOj7SWJslF8IuZy31i+Ue/LbeAHNCTppzoHMFz
 b+zjmATUa8e412Br3acc8O4cjomQqtAQKyZ0T3AUfTFH4FwO6J4WgdyW4Nt0cDZC6Lzb
 2Qzw==
X-Gm-Message-State: ACgBeo3tcHmN/ZIusy/N4R6lsGosHL7Hhp2Gbp09cdmoaztgP3ZpCvpn
 YCbxzQnWKgX5sq6jlKKBvEFIjDPo9QmJ+95BAdg=
X-Google-Smtp-Source: AA6agR5pN8Z8H/ZuPdvMznjqvuBVxB8TB4Qfx+HlpJlxtD6l/Bi4IsqHBHf6Akw6ERiuYYPmUJnTa1w+uD/6zzc0ROw=
X-Received: by 2002:a17:906:9b09:b0:730:9480:9729 with SMTP id
 eo9-20020a1709069b0900b0073094809729mr3785983ejc.588.1659404363236; Mon, 01
 Aug 2022 18:39:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAHCN7xJ=N1vWVTBjArskJ59fyaLzmAGWfc0E=_iGizrDNR_Udw@mail.gmail.com>
 <CAOMZO5BAheG4r1Umnd7bLhOqezsxJgE0x1c-858EcabbpPm6Pg@mail.gmail.com>
 <20220801225538.qtdb5zd66g6ipewz@pengutronix.de>
 <CAOMZO5DUTxQKbpTVOgaVC0V7hPqJG77sgmkW8p=aNpG8th-aLw@mail.gmail.com>
In-Reply-To: <CAOMZO5DUTxQKbpTVOgaVC0V7hPqJG77sgmkW8p=aNpG8th-aLw@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 1 Aug 2022 20:39:12 -0500
Message-ID: <CAHCN7xL2w7a=SeXbwcNNxqb3kpRV9Bs0AbK0Nmjbj+dm0NDaVA@mail.gmail.com>
Subject: Re: imx8mm lcdif->dsi->adv7535 no video, no errors
To: Fabio Estevam <festevam@gmail.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Marco Felsch <m.felsch@pengutronix.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, robert.chiras@nxp.com,
 laurentiu.palcu@nxp.com, NXP Linux Team <linux-imx@nxp.com>,
 Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 1, 2022 at 6:12 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Marco,
>
> On Mon, Aug 1, 2022 at 7:55 PM Marco Felsch <m.felsch@pengutronix.de> wrote:
>
> > Question is, does your setup work for all modes after applying your
> > patches and without using the NXP-downstream porches settings? We also
>
> Without Frieder's patch:
> "drm/exynos: Fix horizontal timing settings in MHPORCH/MSYNC
> registers", I get no HDMI output.
>

I managed to get my HDMI output working. I had the lanes set to 2
instead of 4.  Once I switched to 4-lanes, the monitor came up in
1080p.  I haven't yet been able to get other modes to work.

adam
> Regards,
>
> Fabio Estevam
