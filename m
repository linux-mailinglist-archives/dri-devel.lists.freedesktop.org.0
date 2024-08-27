Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E64C960300
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 09:26:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1956E10E2AC;
	Tue, 27 Aug 2024 07:26:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com header.b="GIPHFG3+";
	dkim=pass (2048-bit key; unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com header.b="Ffj52xXx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gw2.atmark-techno.com (gw2.atmark-techno.com [35.74.137.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A15810E2AC
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 07:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=atmark-techno.com;
 s=gw2_bookworm; t=1724743600;
 bh=s5SVCmSXXVTlWTSGyITY2lSONRFpLbKxgXI0kEQ0mXg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GIPHFG3+J8qzj+E/niHLxwxVLAFG2ejgyExU/imqTg++GghcDJG0Oe0GQ6F8r30nv
 IarqklviR6D1RDMLriUulvHB1QG4ViyC61C+yLsOEzXiOFJ2+nTSWg3LW3TUGmhGqu
 dKezy8vMYCVVMOt2Dm7KrJWsJ31WXl7pJ5H3ymZLKkjcK2I/edXFwHc23oDAnWkDI9
 So4L3vue1aaNX8BQPp2OQLRmhEEJDQOD4Ok82JuzO0DUnx5IUdOX378wDiA8cD+SJj
 TfX/w3AavL7GEBaYoF6cPDa/mKYg68BVrmYcMo8T7hQT/aLFq6uXPOGMVX2zRNabS0
 +qjp+cvDhhrjg==
Received: from gw2.atmark-techno.com (localhost [127.0.0.1])
 by gw2.atmark-techno.com (Postfix) with ESMTP id 321109FD
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 16:26:40 +0900 (JST)
Authentication-Results: gw2.atmark-techno.com; dkim=pass (2048-bit key;
 unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com
 header.a=rsa-sha256 header.s=google header.b=Ffj52xXx; 
 dkim-atps=neutral
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by gw2.atmark-techno.com (Postfix) with ESMTPS id 954C79FD
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 16:26:36 +0900 (JST)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-2d406dc42f4so5318234a91.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 00:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atmark-techno.com; s=google; t=1724743595; x=1725348395;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yMSxmDf0MF2kmVGar68KDMZHrrKcCPfHUHgljqdD7Xs=;
 b=Ffj52xXxJXazwZNg+t+CU7RYx5miCoKytxxOb3Qo5K97EoXHcLQ07J0w8zJ3wDoSG6
 pp3nw42bgWOABgC4I0MnghyoPpM1bzh4kAojk0emPS4IbxsTfcvQyUyuSq6K6QHXRFjJ
 LWiAq2F6uV7rigxPdl2Fj1zPaqbV5XTAis/9pnZLankDp5RPsfszD8BBY3Hjt7ro+HCK
 s2i7/Mohj/0yPEv5+tiuqiSu5s9OekxI9Ttr7Rms/vkqM8QvMWde8DEaiqmXCHJXGwCW
 NHamqg63EgfQTZifPJ7fUcXHgSMZUp139CS1U5WBUqjRMQV8Q9Mes9a22bM7+EC4dp7I
 ZAcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724743595; x=1725348395;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yMSxmDf0MF2kmVGar68KDMZHrrKcCPfHUHgljqdD7Xs=;
 b=O0CL1JoKNMcKBk9BVlVnIpxdc18TgiMU9PJh7IzbjkmMU9T6LpSn0WMpIDHLf0jerv
 CXnYJCVJM+lsBCSU4TIuVj7PmYaqlRcs4OVvBpa0G2zwvC5Xv2nzzuimRC7DyVcrLIJk
 56tAs3N3xCpnsZyHVGesACeXJwOam1OYCBjaQnr2vhjdvbG0w5aL2rG5IBxUhh8+SkoI
 f9XYWszlQbuYx5JJQfljciljFHPXEblbccYwpgBha0szGs8WltJ72gk9AhKkCxO+05A4
 QfDVFpswsPZ6XBaj1PI6+JZhbTlg8NQtwgjHyW7dKJnKHtTggrFFfQHuf+mNpvK8bC8q
 GMWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAGtVrA1nDzXrO2U0W/TehJq/m/4lbLefMO0mfIrHvCMe+LYfGg6CmytW7bUD2NSn5cIsT0DKFfxg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7Bl7BV4PPO+cWqtG8jA8pu647lwJxVUpiWxo/dRuHHwjpy3z4
 pM+zy8lx67MylRpn1skutz1irMJpynPL2r72yoqqxfEEWaGs1eaNKmOKjdSkncMajN4Kh1q0kvV
 g9YqJMtK+ArR/a5/+vHbrRICbbONFQ90ebm6X0pp3NSB2MSdWF2VLVmSC/9JSjKvNQD4=
X-Received: by 2002:a17:90b:1c11:b0:2cb:4c25:f941 with SMTP id
 98e67ed59e1d1-2d82580e22fmr2028888a91.17.1724743595329; 
 Tue, 27 Aug 2024 00:26:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEW1/oji6zx+gfbgJZ3oB4Xn4c8WVytmZDVMFJCBO9GQDivVWFqkuYDN36JnD5SWjWnqM9TQg==
X-Received: by 2002:a17:90b:1c11:b0:2cb:4c25:f941 with SMTP id
 98e67ed59e1d1-2d82580e22fmr2028858a91.17.1724743594925; 
 Tue, 27 Aug 2024 00:26:34 -0700 (PDT)
Received: from pc-0182.atmarktech (162.198.187.35.bc.googleusercontent.com.
 [35.187.198.162]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d613af145dsm11209569a91.38.2024.08.27.00.26.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Aug 2024 00:26:34 -0700 (PDT)
Received: from martinet by pc-0182.atmarktech with local (Exim 4.96)
 (envelope-from <martinet@pc-zest>) id 1siqb2-00ArlM-2Y;
 Tue, 27 Aug 2024 16:26:32 +0900
Date: Tue, 27 Aug 2024 16:26:22 +0900
From: Dominique MARTINET <dominique.martinet@atmark-techno.com>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Adam Ford <aford173@gmail.com>, Lucas Stach <l.stach@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, marex@denx.de,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 Makoto Sato <makoto.sato@atmark-techno.com>
Subject: Re: drm/bridge/imx8mp-hdmi-tx: Allow inexact pixel clock frequencies
 (Was: [PATCH V8 10/12] drm/bridge: imx: add bridge wrapper driver for
 i.MX8MP DWC HDMI)
Message-ID: <Zs1_nnjtRKWUtBat@atmark-techno.com>
References: <20240203165307.7806-11-aford173@gmail.com>
 <Zm_UzO4Jmm7Aykcm@atmark-techno.com>
 <22a3f5266260dd3915269ae3eec7724f7537eb55.camel@pengutronix.de>
 <cd03ecb1-100e-4699-95ed-d837a2802dc7@kontron.de>
 <CAHCN7x+bh_ka250hOCenO3Et6re4EJ=5TG8=kpG1hs-PV0dQxQ@mail.gmail.com>
 <ZsVluV50NvuGGHFX@atmark-techno.com>
 <CAHCN7xJnjfjr7HfKF+4pwbENP+p2=vvMXWW1AQShNy87vfQ=-A@mail.gmail.com>
 <CAHCN7xKgpqfRf_2p1z5NyKiOYubbcDA7YE5ML8G56pVmcV+1xA@mail.gmail.com>
 <CAHCN7x+HgasGG_v-PdtmRszhJn5odHzfV6ddeeT10_1yCOS+DQ@mail.gmail.com>
 <2d877963-e2be-4090-a86f-aadccf8f5e69@kontron.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2d877963-e2be-4090-a86f-aadccf8f5e69@kontron.de>
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

Frieder Schrempf wrote on Tue, Aug 27, 2024 at 09:00:34AM +0200:
> > Using my PMS calculator and Rev 2 of the Tech Ref Manual, I think I
> > can generate you a table entry for 51.2MHz.  I don't have the ability
> > to test it.  I am still working on figuring out an algorithm to
> > calculate the fractional divider, but 51.2MHz x 5 does not' appear to
> > need the fractional clock divider, so I think I can just get away with
> > the standard PMS calculations.
> 
> Thanks Adam for all the efforts. The initial request for the 51.2 MHz
> clock was from Dominique, not me. I was just jumping onto the bandwagon
> with my own use-cases.

We still have that 51.2 MHz display around, so happy to test -- might
take a little bit of time as this already has a workaround but it's
definitely something I'd like to clean up so more than happy to help.

> > I still think it's a good idea to fall back to the PMS calculator if
> > the fractional stuff isn't found.  We could then determine which clock
> > frequency is closer between the nearest table entry or the PMS
> > calculator until someone can come up with an algorithm for it.
> 
> Yes, I think that's a good idea.

Seconded; we can keep the code as fallback of the table at first and if
it works well maybe even remove the table altogether later, but just
having fallback first would be great.

-- 
Dominique


