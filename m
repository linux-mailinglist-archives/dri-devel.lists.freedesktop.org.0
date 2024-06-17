Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEB490AD90
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 14:04:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BEF110E36E;
	Mon, 17 Jun 2024 12:04:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hbsELfGS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AAE610E36D
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 12:04:06 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-52c9034860dso5324855e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 05:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718625844; x=1719230644; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=sMO4mdkOR6FkFmYRW6aL9nqj0CKGlqd49FnlIe+Tzw0=;
 b=hbsELfGSqJJDGK6LhN79O3+SVEM9tr8vLQhvgBpbL2s6oNvCxrhXRIVZydoK6zkP8n
 QXx3TzT0+fxyzs3a8snPpCOKTkmVNVZbpcbnkJKnK/r/n17f4XTxNLx4B6FNJTRvrmqt
 TnQ2xwfytdP4q6SVb2w7bcA9HklAHUIAiW5+d3sGSiV35i2ME4YBTWHsM5qmpvp0W3r9
 Ktt7UPYdf3MRSahZqmE8/0ylhK0b9y122xQEj7bYZ0Ocg35cCPLJWd8eLpBuVzpB9SDj
 JyJ0QcQ+44qBuhn3N6bv/uQyKk53iV8+wIiiGWNZ+r8UuKVMvE7h1XMNLN7r37px5JJn
 Yd0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718625844; x=1719230644;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sMO4mdkOR6FkFmYRW6aL9nqj0CKGlqd49FnlIe+Tzw0=;
 b=t2Z8i4223osOcnQsHEsj4Z47BHFynocFWcyximAwjoWb56S8yTPTeZ6TWImJTV5mID
 jn20X1Ln+GsdNVwpyZId7wvTia9cOCLYlWQxjEXMDMRoDOHRyXq+fosjl5zb9/Nv4T2M
 PEyqwWgmWJEFx5QrF0XFFap/dYPVunmY4VMoCWXRPtSjDcP7h6cp4lVcYiJs9cGhXW9H
 5+X1YPR4r8uqnxr7M0qjG3xUAOzsQl1jbKU5HGwENFGQH8Eh4GKlRtS4MbtlwqotcyW9
 JDZiQKId4l3IKogM6/owZgzT3kO8JvHP6l6oO6LQpDGN277zyv7RRiAPWz6Zx5+Yf1ZS
 d7UA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUG6+UmS1GRXJWqT72dyZFAxf81Ju7aerNoo2x8+IbUHqhC0B+xCsQh30xyaVtmMyCyZxpRY8HRvfrHC0HdNKDaqj8FwhGAnvPQ4RUZk7ND
X-Gm-Message-State: AOJu0Yw8jUc/0/7GwnFsHbELX+Gn9dtlabXrTDkNJUwGMi7z70iA/Smr
 Tpeza7vEcNi7hBmVOtqCUCv+HjBkPQ9NpUSHRIv16T02xWukA3oYCKb6Qq5H9RM=
X-Google-Smtp-Source: AGHT+IH5qlLLJTAfKvCWX5szD04D6YYgsijtmFj095bqr+1145mMD9t8FPMSGpCiR41/LZmhrHNh0w==
X-Received: by 2002:a05:6512:34d9:b0:52c:993d:b462 with SMTP id
 2adb3069b0e04-52ca6e6e25amr6597787e87.29.1718625844211; 
 Mon, 17 Jun 2024 05:04:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cae24eae2sm811360e87.231.2024.06.17.05.04.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 05:04:03 -0700 (PDT)
Date: Mon, 17 Jun 2024 15:04:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Aradhya Bhatia <a-bhatia1@ti.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Jyri Sarha <jyri.sarha@iki.fi>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>, 
 Dominik Haller <d.haller@phytec.de>, Sam Ravnborg <sam@ravnborg.org>, 
 Thierry Reding <treding@nvidia.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, 
 Jayesh Choudhary <j-choudhary@ti.com>, Jai Luthra <j-luthra@ti.com>
Subject: Re: [PATCH v3 06/10] drm/bridge: cdns-dsi: Reset the DCS write FIFO
Message-ID: <aiusds2i3gtfojjffxtbxnay7l37cuubgiysiz23cr452nhqry@o2jpj4tyesvc>
References: <20240617105311.1587489-1-a-bhatia1@ti.com>
 <20240617105311.1587489-7-a-bhatia1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617105311.1587489-7-a-bhatia1@ti.com>
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

On Mon, Jun 17, 2024 at 04:23:07PM GMT, Aradhya Bhatia wrote:
> Allow the DCS Write FIFO in the cdns-dsi controller to reset before any
> DCS packet is transmitted to the DSI sink device.
> 
> The DCS FIFO reset is optional. Not all panels require it. But at
> least one of the DSI based panel that uses Ilitek ILI9881C (DSI to DPI
> bridge) doesn't work with without this reset.

Could you please be more specific, why doesn't it work. Are there any
leftover bytes in the FIFO? Is there any additional delay?

> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> ---
>  drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> index 05d2f4cc50da..87fdd07ca0bc 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> @@ -1037,6 +1037,9 @@ static ssize_t cdns_dsi_transfer(struct mipi_dsi_host *host,
>  
>  	cdns_dsi_init_link(dsi);
>  
> +	/* Reset the DCS Write FIFO */
> +	writel(0x00, dsi->regs + DIRECT_CMD_FIFO_RST);
> +
>  	ret = mipi_dsi_create_packet(&packet, msg);
>  	if (ret)
>  		goto out;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
