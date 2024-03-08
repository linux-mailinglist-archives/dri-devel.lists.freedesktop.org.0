Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5F58766F4
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 16:04:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A42910E810;
	Fri,  8 Mar 2024 15:03:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="fAFc+87h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB25C10F29C
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Mar 2024 15:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1709910235;
 bh=6MJiEQmi6Ybx65/uPmpT0ncugXF+/4nMIBl0u7JoXVM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fAFc+87hmcjq+ZmXoJrREKrqll1m77gJhifLsQ/McNwQJpqV/yEkFzoNEdre6Cjsn
 xmedwoSn3qq+Lkt2+AM8NoEjp3hupkysjq13Ydgl03qD2CeoY11wHmtzAEwGplV2Mk
 9nqFZ6SDnUYhvcOh/xPdMbIKnd4rN8rzCxP3eOk0Byd8Jm2oUTJxkRCjgVBT4wsWkg
 CJLkLCjCgfmP6NKRwDJ9BELFHCqTV7S2GGZjUS26fTHERP7bmgK3IkEO5nzB1FfuAB
 sfmPEC1A6funTntcT8bdMA+uctso9qw8uTyMtGJVnRC5ycWpgDim9xw7I5QWxrJIwb
 gRJxz5Hwa4pfg==
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1917237820F1;
 Fri,  8 Mar 2024 15:03:50 +0000 (UTC)
Date: Fri, 8 Mar 2024 10:03:48 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 owen <qwt9588@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Marek Vasut <marex@denx.de>, Adrien Grassein <adrien.grassein@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Bjorn Andersson <andersson@kernel.org>,
 Vinod Koul <vkoul@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vinay Simha BN <simhavcs@gmail.com>,
 Christopher Vollo <chris@renewoutreach.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 8/9] drm/panel: novatek-nt35950: Don't log an error
 when DSI host can't be found
Message-ID: <5977d0e9-c130-4aaf-8169-0303fa57009c@notapiano>
References: <20240229-anx7625-defer-log-no-dsi-host-v2-0-00506941049a@collabora.com>
 <20240229-anx7625-defer-log-no-dsi-host-v2-8-00506941049a@collabora.com>
 <924fdd72-93ef-47dc-bd7f-37ccba2f83f1@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <924fdd72-93ef-47dc-bd7f-37ccba2f83f1@collabora.com>
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

On Fri, Mar 01, 2024 at 09:44:51AM +0100, AngeloGioacchino Del Regno wrote:
> Il 01/03/24 01:12, Nícolas F. R. A. Prado ha scritto:
> > Given that failing to find a DSI host causes the driver to defer probe,
> > make use of dev_err_probe() to log the reason. This makes the defer
> > probe reason available and avoids alerting userspace about something
> > that is not necessarily an error.
> > 
> > Fixes: 623a3531e9cf ("drm/panel: Add driver for Novatek NT35950 DSI DriverIC panels")
> > Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> > ---
> >   drivers/gpu/drm/panel/panel-novatek-nt35950.c | 6 ++----
> >   1 file changed, 2 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35950.c b/drivers/gpu/drm/panel/panel-novatek-nt35950.c
> > index 648ce9201426..028fdac293f7 100644
> > --- a/drivers/gpu/drm/panel/panel-novatek-nt35950.c
> > +++ b/drivers/gpu/drm/panel/panel-novatek-nt35950.c
> > @@ -556,10 +556,8 @@ static int nt35950_probe(struct mipi_dsi_device *dsi)
> >   		}
> >   		dsi_r_host = of_find_mipi_dsi_host_by_node(dsi_r);
> >   		of_node_put(dsi_r);
> > -		if (!dsi_r_host) {
> > -			dev_err(dev, "Cannot get secondary DSI host\n");
> > -			return -EPROBE_DEFER;
> > -		}
> > +		if (!dsi_r_host)
> > +			return dev_err_probe(dev, -EPROBE_DEFER, "Cannot get secondary DSI host\n");
> 
> Nicolas, this is going over 100 columns, which is not ok.
> Please fix.

Neil, as you're the maintainer for this file as well, what do you think of this
occurence?

As I understand 100 columns isn't a hard limit either:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=bdc48fa11e46
https://docs.kernel.org/dev-tools/checkpatch.html?highlight=long_line

Thanks,
Nícolas
