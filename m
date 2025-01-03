Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8552A003A5
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2025 06:37:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57B3A10E0B9;
	Fri,  3 Jan 2025 05:37:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Vs2/dB0d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B95F610E0B9
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2025 05:37:23 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-3022484d4e4so148911691fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jan 2025 21:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735882582; x=1736487382; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MmN8unikKCAbDTYmOgv4w7VHd2QHTqvHtpUA+yq5Q+w=;
 b=Vs2/dB0dG6W36Bx2NTiO1c/hbtZj8xXXPCSpT2vua91s4pfTDcvonrN5fMDTa67aa1
 Z5pNGEJYUlbtL7oVl4FSZ5CZ0fND8Dm9lv+JIm9MhIvlOljOdATIuP32y5L+FRANFbQ9
 6++vm7d0znW52ksD+qvfblRpMITcN+1a4/nfbKXW9uhw2i6jymD82nkJYFLXRrYB7DJo
 2p4YRNC9Z/38lD+CJper4HjYE3atC+HCvc6RT1ddiBRXwH3PHqVd9hnNEkvOdXYJv+b1
 krBP4ykCrW3v2NMrX9nZBN6W5Vh9I6pbBkiJThrhSclgT7i5vQzH56jLIuEK7zjfz5pt
 1VuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735882582; x=1736487382;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MmN8unikKCAbDTYmOgv4w7VHd2QHTqvHtpUA+yq5Q+w=;
 b=dP6s6LkWgJzLJ2m9uw5OYsAbtnbViiEOAJxq0owJwSDZDboNnKWN1FUpqf8vWrtDYl
 yRufkRmI2wQz/L/odHIyMukBaHGdDd4+lZCzvRiegZcUBSQT2+RFbgZkEoInnn8EtBcC
 DVgq5+Yv5Vg2uXuoiUSkObVOqke5fIRdu7is/PR8cvl0pZfaWrWL8S8R/uavMbS5Mi9a
 ofN+MMV/6EEUOoFYNWqQT/HIH/ZtSUf1fILXzAa7sSOS9HCndKUgpxB8ocwwPdjelLJP
 lVLKW9gUNjz9a1wylzr4jlheFiCcKNVUTaGyzlzJEy9rvGLtTCFQ0d698+zRSbdB2+VI
 N4Dw==
X-Gm-Message-State: AOJu0YxAUR8sOFP+n0LFuaFa4foKXspgqozEroaA8O7nNoZ3Mn9UEybt
 Fy3xzRUok4aBFqXvWliNyMFQSQRGyx6AmlGsuSOazTfa296wBBYmUbXDs57ZOlw=
X-Gm-Gg: ASbGnct7eatEwtdRW9BQcpKh+83OfTnZN9J4jQWrHtWETPOHhT+qZX9t6iFdFz7JazM
 A5yWs3OTSuJoopCBqfMJXB6ugYBpNvvzCTKaXC0Ul6bAdFAtBsG2YusE5nVvZO5OslJqzOs/dLE
 b41gZFx+ai14ZiL9sQDC3Y/0dch2GkRcpmOKsn/gFUv0fyt4I/sh+eTBwMyKnuf1ZQ9mPUWD7FW
 j2vTOchdwCZwT9pjaqpek6ZrrPMXQHPxtncNG504N1diRdstY3IhxM6DwaRD1FBpcT6tlZ+pDbK
 I95gaScqxTkf/6mZcrJPjqTNO2doKbm6843K
X-Google-Smtp-Source: AGHT+IE6OID3IdhzMP3XEYNXHpLMaRxF1DCc2ymnBRQhO5cl+gFLOI6zrATEO677AB0hiGN2d3yNug==
X-Received: by 2002:a05:651c:2114:b0:300:38ff:f8cd with SMTP id
 38308e7fff4ca-30468543d63mr161870081fa.9.1735882582025; 
 Thu, 02 Jan 2025 21:36:22 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045ad99d6dsm47284711fa.28.2025.01.02.21.36.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2025 21:36:20 -0800 (PST)
Date: Fri, 3 Jan 2025 07:36:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Liu Ying <victor.liu@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Robert Foss <rfoss@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, 
 Stefan Agner <stefan@agner.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 3/4] drm/lcdif: add DRM_BRIDGE_ATTACH_NO_CONNECTOR
 flag to drm_bridge_attach
Message-ID: <a62utyd6bjhx33ru2aaxwiesexcltbgdcvhgd57c5uyl3htuoa@2kdgodqrqabu>
References: <20241231192925.97614-1-marex@denx.de>
 <20241231192925.97614-3-marex@denx.de>
 <u4hjoteybchte2fdmxle5rsu5jbohm7hjjoejrxiqa6lszqm56@6facok3v55kg>
 <2f2bdcb1-6d83-4939-9dd0-3fb206202273@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f2bdcb1-6d83-4939-9dd0-3fb206202273@denx.de>
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

On Fri, Jan 03, 2025 at 12:20:19AM +0100, Marek Vasut wrote:
> On 1/2/25 6:58 PM, Dmitry Baryshkov wrote:
> 
> [...]
> 
> > > @@ -97,13 +100,36 @@ static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
> > >   			return ret;
> > >   		}
> > > -		ret = drm_bridge_attach(encoder, bridge, NULL, 0);
> > > +		ret = drm_bridge_attach(encoder, bridge, NULL,
> > > +					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> > >   		if (ret) {
> > >   			of_node_put(ep);
> > >   			return dev_err_probe(dev, ret,
> > >   					     "Failed to attach bridge for endpoint%u\n",
> > >   					     of_ep.id);
> > >   		}
> > > +
> > > +		nextbridge = drm_bridge_get_next_bridge(bridge);
> > > +		nextbridge = drm_bridge_get_next_bridge(nextbridge);
> > > +		/* Test if connector node in DT, if not, it was created already */
> > 
> > By whom? And why?
> 
> By the HDMI bridge driver, see 1/4.
> 
> > There is no display-connector bridge, but there is a
> > normal bridge chain, you have passed DRM_BRIDGE_ATTACH_NO_CONNECTOR, so
> > now it's a proper time to create drm_bridge_connector. You have added
> > the next_bridge_optional flag, but it should just prevent the dw driver
> > from returning the error if there is no next_bridge.
> So what exactly should I do here ?
> 
> If dw_hdmi_parse_dt() only exits with 0 if there is no connector node in DT,
> I don't get any output on the HDMI. I have to create a connector in the HDMI
> bridge driver instead and not here, right ?

No. Please make dw_hdmi_parse_dt() return 0 if there is no connector and
the flag is set. Then create drm_bridge_connector here.


-- 
With best wishes
Dmitry
