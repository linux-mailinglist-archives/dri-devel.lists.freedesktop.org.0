Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B5358753E
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 03:53:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18E5B1123F3;
	Tue,  2 Aug 2022 01:53:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4EB510F5CC
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Aug 2022 01:53:21 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id h132so11131494pgc.10
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Aug 2022 18:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E+nFDuqb/3L3s8wauxeMyHMnw6kIA98zqSTPhFde1Xo=;
 b=OXeOBqhN27K1q55bj/9ziz5oDI7brJcrrdW72DC6DKhgZx2Lw8980pqF2JcxtCLRMc
 l7tDfDT24K1abcYSdhkOD8lGRySQl/oRLGpHCsIREC6yPDU4LQYWqfUIIqMiKJNuwMJ1
 lFAq+eMrLrwfXX5Ut9pZOPI1LrPTuPMwn1E7sbGGAt6Ojt0HrBqHtNMmcJDGkl//Juqy
 ahEfd0x1Im4Fok3MYOpVuQghrLxkbp4U3yh7sT8kiWFJ5QPlpobnR9tmuTOn2huWwfHj
 8TI8X4knOz/1/5ySLu1wgifT4eotif+eOVsj+QvqbCmGB+2/75qb14O8laCdswXYcAWE
 7DfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E+nFDuqb/3L3s8wauxeMyHMnw6kIA98zqSTPhFde1Xo=;
 b=ZJLhUQY7evgezNTjVO3KkgiMY6ivyXY+MLeyGgvxh/l8vVhxQIx9uSggAIbo4fW/nK
 YID8GqmjbEARj+tcqeTsyzZtGVj4p1N43Uod+ZQssDN8o2ZTlKW/bVfhfsNUll7NBqlZ
 QnH1BMevIUqjjO6niqngx6ELxJkvTSbXa80qHf+NDkMScm4EH30FEU90FhlL0WPQzVJ+
 FRx6/arX9Lq0kuSqApHF8JoRDd37L/UP9Hxc9Nn/titwmOCGIRKtmm2I0sKMUXQ0Lc0C
 0oi71fSqxuwNC3As6sRvJZoGTZ0+b2WpUCYMlkJmqP2AjB47QhwfwtXatcmfXT6Nog6r
 8BRA==
X-Gm-Message-State: AJIora9mChWEE1AJ39qLjYTVPDxuvto1BYcieuZrqUuPf5sY4jBQzizd
 oPnY0OxSXpFfMhBf8AXeBicjT9c9rygpsXdMT0U=
X-Google-Smtp-Source: AGRyM1uWk4c/nkRR5Ax2LSzSL8qPEKj6xGzBHmLhIRTO9RMYha61jOqtjFM1V3CcJ1fJOR7M3O0hMclVZX1L6/xS9Q8=
X-Received: by 2002:a63:cc0b:0:b0:41b:51ae:541f with SMTP id
 x11-20020a63cc0b000000b0041b51ae541fmr15883103pgf.50.1659405200775; Mon, 01
 Aug 2022 18:53:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAHCN7xJ=N1vWVTBjArskJ59fyaLzmAGWfc0E=_iGizrDNR_Udw@mail.gmail.com>
 <CAOMZO5BAheG4r1Umnd7bLhOqezsxJgE0x1c-858EcabbpPm6Pg@mail.gmail.com>
 <20220801225538.qtdb5zd66g6ipewz@pengutronix.de>
 <CAOMZO5DUTxQKbpTVOgaVC0V7hPqJG77sgmkW8p=aNpG8th-aLw@mail.gmail.com>
 <CAHCN7xL2w7a=SeXbwcNNxqb3kpRV9Bs0AbK0Nmjbj+dm0NDaVA@mail.gmail.com>
In-Reply-To: <CAHCN7xL2w7a=SeXbwcNNxqb3kpRV9Bs0AbK0Nmjbj+dm0NDaVA@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 1 Aug 2022 22:53:07 -0300
Message-ID: <CAOMZO5BQWnUj4Ouq3=vhqq55zN8otO_9vPX8ht+muFM_5pg9Fg@mail.gmail.com>
Subject: Re: imx8mm lcdif->dsi->adv7535 no video, no errors
To: Adam Ford <aford173@gmail.com>
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

On Mon, Aug 1, 2022 at 10:39 PM Adam Ford <aford173@gmail.com> wrote:

> I managed to get my HDMI output working. I had the lanes set to 2
> instead of 4.  Once I switched to 4-lanes, the monitor came up in
> 1080p.  I haven't yet been able to get other modes to work.

Ok, good. On another thread, you mentioned that you were also trying
to get LVDS to work via SN65DSI83.

Does LVDS work for you on this branch?
