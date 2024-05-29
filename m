Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA768D3A95
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 17:19:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B379410E267;
	Wed, 29 May 2024 15:19:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="svA/9FqC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B074410E257
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 15:19:40 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a6268034cf8so104955666b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 08:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716995979; x=1717600779; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LVMlvGvu+yE6fLI+Siw+dExoNxH7F0Khba0Cygf9Ass=;
 b=svA/9FqCJ8XDXG+ywgSJKDYL2ik0t2aiLiaydDEsrPOSd10lyKw/FGRDyTRKXtHf4i
 3yV8zYUTFiuUYY/xA1+tFd0wds367HUHb8bDWIxaIbR5BxSmsjcPPG7Ixy9h4ZwG7vB2
 rbKc0Zeq7D9jfclyJr4ZMxt9grUvHwhqydOrrAct+W7D6YmAbwSi0UTAECLOLN6fsJcA
 TF1ASSFYTWdxiUxjV0fy9s2GCvZpFsFjv10LbwkWhRBpNVdfMFKRt5e1lhxNYgjrrw5Y
 Cnlk/TLzICfizIp35tOzExvl3fdeLAL2m40/ytmuiks+A9KQgf06pCwbN9dqXRBqO+So
 AYLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716995979; x=1717600779;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LVMlvGvu+yE6fLI+Siw+dExoNxH7F0Khba0Cygf9Ass=;
 b=s+AYaJS+e5Q7hXtQ+v5kJ5xeWk41NJIqdu4Qow0pXKHlFzlNsYtaD81akENQ34/S40
 frJrqplz84utu6j+zI/iwh20mAAzfT/nNTGRLozB+zM5fZO6gfMRGda+nnh4ztWe4wBS
 n8DY2wU/cIG96N4zZdV1pgdvgXdkjm8D/8E84gdfNQiuk8Ti8mJXEZHMhD6vPpKZYF7a
 o9qyPa5mkqvDouDPuHHipTtJeIlobhkJcw0z4l65MEwNQIC9bO65kjQkUQbRSW0ZOgw5
 Yu0JhaP3BUX78huEUG95WMmUUHOYG4YPJUroG5m9LMu0avlAmq1vok1cb2i0ULAJennz
 292g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGztcW+5PqqaBeb+KfIjcKcpll4yoEKaPyf685qReIdjWNpMPt1i+4XkfVCnkYyJFityECKnf6Jd1rIG5GAgHdRqgM2EknrIUiDPBg+pWh
X-Gm-Message-State: AOJu0YyDNGNcEu0gxNQBvy+ViPtESBNhe2EaeBByd0Yq8nvodDeX5Nus
 kJ/dI8CcoFiVjVbVwiRE87hweiox43QO43kBu8ZPtIiEOe1lvTbj2szYArew2x4=
X-Google-Smtp-Source: AGHT+IHCd3nqrD6LOXts5/qJL2JDZ9MXajPdxTu0OJ82kiARsXhmJOxs0nDRy4z6dcf/PiB8YDe+3g==
X-Received: by 2002:a50:d649:0:b0:572:6af5:1b61 with SMTP id
 4fb4d7f45d1cf-57851915266mr14199318a12.6.1716995978643; 
 Wed, 29 May 2024 08:19:38 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-578524bbb5dsm8489083a12.95.2024.05.29.08.19.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 08:19:37 -0700 (PDT)
Date: Wed, 29 May 2024 18:19:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 prabhakar.csengg@gmail.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Rob Herring <robh+dt@kernel.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 coresight@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 resend 2/8] hwtracing: use for_each_endpoint_of_node()
Message-ID: <501d8e92-43c8-4205-9c3a-819888fbd5f2@moroto.mountain>
References: <87ikyx4hm1.wl-kuninori.morimoto.gx@renesas.com>
 <87fru14hl7.wl-kuninori.morimoto.gx@renesas.com>
 <20240529004047.GB1436@pendragon.ideasonboard.com>
 <7fbf421c-6477-4fc4-93a5-10e2788522c4@moroto.mountain>
 <20240529145253.GE19014@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529145253.GE19014@pendragon.ideasonboard.com>
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

On Wed, May 29, 2024 at 05:52:53PM +0300, Laurent Pinchart wrote:
> On Wed, May 29, 2024 at 05:34:41PM +0300, Dan Carpenter wrote:
> > On Wed, May 29, 2024 at 03:40:47AM +0300, Laurent Pinchart wrote:
> > > > @@ -286,7 +286,7 @@ static int of_get_coresight_platform_data(struct device *dev,
> > > >  	}
> > > >  
> > > >  	/* Iterate through each output port to discover topology */
> > > > -	while ((ep = of_graph_get_next_endpoint(parent, ep))) {
> > > > +	for_each_endpoint_of_node(parent, ep) {
> > > >  		/*
> > > >  		 * Legacy binding mixes input/output ports under the
> > > >  		 * same parent. So, skip the input ports if we are dealing
> > > 
> > > I think there's a bug below. The loop contains
> > > 
> > > 		ret = of_coresight_parse_endpoint(dev, ep, pdata);
> > > 		if (ret)
> > > 			return ret;
> > > 
> > > which leaks the reference to ep. This is not introduced by this patch,
> > 
> > Someone should create for_each_endpoint_of_node_scoped().
> > 
> > #define for_each_endpoint_of_node_scoped(parent, child) \
> >         for (struct device_node *child __free(device_node) =           \
> >              of_graph_get_next_endpoint(parent, NULL); child != NULL;  \
> >              child = of_graph_get_next_endpoint(parent, child))
> 
> I was thinking about that too :-) I wondered if we should then bother
> taking and releasing references, given that references to the children
> can't be leaked out of the loop. My reasoning was that the parent
> device_node is guaranteed to be valid throughout the loop, so borrowing
> references to children instead of creating new ones within the loop
> should be fine. This assumes that endpoints and ports can't vanish while
> the parent is there. Thinking further about it, it may not be a safe
> assumption for the future. As we anyway use functions internally that
> create new references, we can as well handle them correctly.
> 
> Using this new macro, the loop body would need to call of_node_get() if
> it wants to get a reference out of the loop.

The child pointer is declared local to just the loop so you'd need
create a different function scoped variable.  If it's not local to the
loop then we'd end up taking a reference on each iteration and never
releasing anything except on error paths.

> That's the right thing to
> do, and I think it would be less error-prone than having to drop
> references when exiting from the loop as we do today. It would still be
> nice if we could have an API that allows catching this missing
> of_node_get() automatically, but I don't see a simple way to do so at
> the moment.

That's an interesting point.

If we did "function_scope_var = ep;" here then we'd need to take a
second reference as you say.  With other cleanup stuff like kfree() it's
very hard to miss it if we forget to call "no_free_ptr(&ep)" because
it's on the success path.  It leads to an immediate crash in testing.
But here it's just ref counting so possibly we might miss that sort of
bug.

regards,
dan carpenter

