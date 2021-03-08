Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 865C13312C3
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 17:02:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E080A6E16F;
	Mon,  8 Mar 2021 16:02:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com
 [IPv6:2607:f8b0:4864:20::92c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86F956E16F
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Mar 2021 16:02:07 +0000 (UTC)
Received: by mail-ua1-x92c.google.com with SMTP id t15so3472046ual.6
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Mar 2021 08:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=An011ivT1O5IqSBEP+Exr4/mnv85DViHzOw1dLqooWM=;
 b=jeekrIFCRYpPa+xsnZZ0w38J4frFu3ydE5//Ca6SwxwiJuOBITzb8myXXxB2epwxuW
 QXhA0GsxH5Kzy+w/NLBijDaExj4XxJLpS0t12VGvm3drSXU3uYkQFjZAANJI/fqR6Nph
 gsKPjQ4kMSdZYsb4Zne/nZUft7dzr562wi66gmN4jy5EpU/GBYcCWav2RihEOzrGDsHa
 0pjHJLsw8Gmlu69SlBE3wNGCmClYiQQvP6hIm/vyisD+vfpZJ64W+ruYA3M+V7fqYXRz
 bcP2vhChHWWvXtUCl6oNO2ZJmfLt1sB9KH0hlzu1ZN+qSzk0edH0a0EUmTDPuS+GmE0U
 vcMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=An011ivT1O5IqSBEP+Exr4/mnv85DViHzOw1dLqooWM=;
 b=emn0EKET1JtGcej4w0WPfWceEGAPweUV9i53LMVy9ibG/mjthpxYCAO+coPfyfAAGZ
 1DG0Nxr5xxulyXo5tU1lbOeDwfrDu/2culu10UB1efJ/3fKh9sKQmYrXsdMLbOvH1mga
 WjvmSuWHRdn9RBCN3hv7kNYqOdLMOdeC1r/09EFj1PBB77Bx45yaJ4qitju9BCjoIgGp
 dS1tE1E4qah7yE6d5P2+PO6Ey8NOC3x38h2uhrJpZXmpze3byP8HAFUIEbbisVLnLSYm
 tUPQ83VVS1xQCbryQm2zgRPr38p3mWGfwSTi9O2eW/jk6G0l9YR38ILvNncn0tSPwZy/
 R7Rg==
X-Gm-Message-State: AOAM533QUuqLMkZJ5CicZ/fqN96daV7CHQK0WP/mZya5uPAJg6HuJF+Y
 hZD0XOOzVRDyimJMuQbiiX/Er2+Z4dPGObHAYuc=
X-Google-Smtp-Source: ABdhPJwuFYQnKSyKc5E1TZUyp9J9Sp60E60qo2mEIw3WxuI/ANDkpscroQkTo0tFo+0nFPEO/vB6lShkVnmIEsS29mw=
X-Received: by 2002:ab0:382:: with SMTP id 2mr14186118uau.46.1615219326677;
 Mon, 08 Mar 2021 08:02:06 -0800 (PST)
MIME-Version: 1.0
References: <20210305183924.1754026-1-emil.l.velikov@gmail.com>
 <20210305183924.1754026-5-emil.l.velikov@gmail.com>
 <20210308135704.GB18168@pengutronix.de>
In-Reply-To: <20210308135704.GB18168@pengutronix.de>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 8 Mar 2021 16:01:55 +0000
Message-ID: <CACvgo52e8be9MqHOiq4V4a7QnHq__34GcSeOn4scmydW-=vvSA@mail.gmail.com>
Subject: Re: [PATCH 4/7] media: hantro: imx: remove unused include
To: Philipp Zabel <pza@pengutronix.de>
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
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 linux-rockchip <linux-rockchip@lists.infradead.org>, kernel@collabora.com,
 Ezequiel Garcia <ezequiel@collabora.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 8 Mar 2021 at 13:57, Philipp Zabel <pza@pengutronix.de> wrote:
>
> Hi Emil,
>
> On Fri, Mar 05, 2021 at 06:39:21PM +0000, Emil Velikov wrote:
> > From: Emil Velikov <emil.velikov@collabora.com>
> >
> > The current imx8 code does not use the jpeg encoder. Remove the
> > unnecessary include.
> >
> > Cc: Ezequiel Garcia <ezequiel@collabora.com>
> > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > Cc: linux-media@vger.kernel.org
> > Cc: linux-rockchip@lists.infradead.org
> > Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
>
> thank you, patches 2-4 could be tagged
>
> Fixes: 8e4aaa687863 ("media: hantro: add initial i.MX8MQ support")
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
>
Much appreciated. Will add all the tags for v2.

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
