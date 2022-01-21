Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E36495FBC
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 14:25:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2E5C10E6E4;
	Fri, 21 Jan 2022 13:25:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7329A10E6E4
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 13:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1642771499; x=1674307499;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b1ZjZfJWEv5qfjNd/5rN2kL2/2EdJgPINvco89nSHpA=;
 b=HPigm0xm3YvmD+XI8civ3XsRHjIBcRC15I0FZjHL5XGX6QBgI3INX8ti
 603KN5/u3uzzsov7TP7rcY0dvRZg4+RuyPJbrpKbl37TCw+VcEaCFXM3v
 s7mfQor9AVFNswCkVtpdJ8Kr5Wu2SzXt4NHdiKJ9Yr3dT6pXtiS9VItr/
 mqx6mIN8NvlKlSfbE/KgcJ+vSrg0mp0xO+9YKmO0NUJgybRuV6Dj0RXz9
 DI8ZahXLGtbR6Cn1Z/edeYp0Ou2IYju5naUK/59OvQV0Wcf3EAIkaTbjD
 RQgaY2Q0yYkrulclOLDIYTVTWoQduxZ6t3gvUG+g/xNp66Pu3+v92NvtE A==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635199200"; d="scan'208";a="21641031"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 21 Jan 2022 14:24:57 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Fri, 21 Jan 2022 14:24:57 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Fri, 21 Jan 2022 14:24:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1642771497; x=1674307497;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b1ZjZfJWEv5qfjNd/5rN2kL2/2EdJgPINvco89nSHpA=;
 b=pcfLDM/dNDghkg4x3qfQWqErVCbjMJkiAsCJiUBgWzNb5HpVOPloYp+H
 Xoep8bRbeeEMyl3/ZX0Swu2IWmkPnymSP/tggLFITwoAL64g+D5IaID5Z
 RD9g7vUmbhYZTCzqVLGMuit+dJxyUddNWJsOcwDQrnfYF+GW/ZSAPQLPX
 VnV/ACml6MMJXkobn6Mr8gu0GbHC8yNeHNntpRs/bQwxP4WUnQx3q6UZC
 l0k2NgZSrEd5bFLGzgCLK31NNCwMbLfpef6H1RnKnA29yidkP0Uhcba64
 eEHxqdnC56SmUiX/aCd3nmQulDpOxHJydFjf2k2idSJH0qMVQDeegllc4 g==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635199200"; d="scan'208";a="21641030"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 21 Jan 2022 14:24:57 +0100
Received: from steina-w.localnet (unknown [10.123.49.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 6D2AF280065;
 Fri, 21 Jan 2022 14:24:57 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Stefan Agner <stefan@agner.ch>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Marek Vasut <marex@denx.de>
Subject: Re: (EXT) Re: [PATCH 1/1] drm: mxsfb: Fix NULL pointer dereference
Date: Fri, 21 Jan 2022 14:24:57 +0100
Message-ID: <2361278.ElGaqSPkdT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <4d3654b5-9a87-1c02-f2d9-d0974e628c20@denx.de>
References: <20220121131238.507567-1-alexander.stein@ew.tq-group.com>
 <4d3654b5-9a87-1c02-f2d9-d0974e628c20@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Freitag, 21. Januar 2022, 14:14:01 CET schrieb Marek Vasut:
> On 1/21/22 14:12, Alexander Stein wrote:
> > Do not deference the NULL pointer if the bridge does not return a
> > bridge state. Assume a fixed format instead.
> > 
> > Fixes: commit b776b0f00f24 ("drm: mxsfb: Use bus_format from the nearest
> > bridge if present") Signed-off-by: Alexander Stein
> > <alexander.stein@ew.tq-group.com>
> > ---
> > This can happen if a "ti,sn75lvds83", "lvds-encoder" bridge is attached
> > to it. atomic_get_input_bus_fmts is only implemented for the
> > lvds-decoder case.
> > 
> >   drivers/gpu/drm/mxsfb/mxsfb_kms.c | 6 +++++-
> >   1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> > b/drivers/gpu/drm/mxsfb/mxsfb_kms.c index 0655582ae8ed..4cfb6c001679
> > 100644
> > --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> > +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> > @@ -361,7 +361,11 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc
> > *crtc,> 
> >   		bridge_state =
> >   		
> >   			drm_atomic_get_new_bridge_state(state,
> >   			
> >   							
mxsfb->bridge);
> > 
> > -		bus_format = bridge_state->input_bus_cfg.format;
> > +		if (!bridge_state)
> > +			bus_format = MEDIA_BUS_FMT_FIXED;
> > +		else
> > +			bus_format = bridge_state-
>input_bus_cfg.format;
> > +
> > 
> >   		if (bus_format == MEDIA_BUS_FMT_FIXED) {
> >   		
> >   			dev_warn_once(drm->dev,
> >   			
> >   				      "Bridge does not provide bus 
format, assuming
> >   				      MEDIA_BUS_FMT_RGB888_1X24.
\n"
> 
> Shouldn't this be fixed on the bridge driver side instead ?
> 
> Which bridge driver do you use ?

It's drivers/gpu/drm/bridge/lvds-codec.c. I thought naming the compatibles 
would suffice. I consider a patch for the bridge driver as a separate issue, 
hence the warning from mxsfb. Although I'm unsure how/what to implement. 
Similar to the encode case where the bus format is specified in DT? 

Anyway, mxsfb should not never dereference the NULL pointer which 
drm_atomic_get_new_bridge_state is allowed to return.

Best regards,
Alexander




