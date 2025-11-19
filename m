Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCE2C6EEB1
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 14:34:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 618DF10E605;
	Wed, 19 Nov 2025 13:34:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="Riyidxtd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com
 [136.143.184.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CA2210E605;
 Wed, 19 Nov 2025 13:34:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1763559176; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Ye0zlYSjY8a276BMMfjI/83jZrSxRWD1xIyYfPOLAE8Ua6GuF3F55j4fxRxvdR6eFQ6XQbuT5ZwnoTbip+BFc6pDsK84vpGuLQO3H90VxuNX4O9Y2+iB/Nqysm4TBIVuK2ZPxneJr88SYRHFJFMxdg0JWhqvMEFV01n0P2PzB3w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1763559176;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=/VWCsLA/mkk3WiZovd+xaAf7ziw484tjuSfyKDbpymE=; 
 b=Zwz62fMimGc/fpX3l5h0s0w3tkHs6sHM8bKfocUKBIAAv1HObYvDf355d2v88LpAkINnFicTKL612+Qspy+dMcgAr5h4wLbRXzurF49Wi++Tfm4UKCG1yoRLjUXKG6NTHLeWQ7Qjbujm6/acFQR9wTl6v3tAjTWoRjKno9nD6+4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763559176; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=/VWCsLA/mkk3WiZovd+xaAf7ziw484tjuSfyKDbpymE=;
 b=RiyidxtdEZDgiubH8FxAC7DZ1KqEL+Xe6vMfemsGAtERjQOhQoGAXNPX3lDioFq1
 vnKFEoOzG6JL8toQ9GAtUF59aQGWNrmjJRrhQ9uyLpWZFFOYjcM7vR+DZXyLjWDa4eY
 7QzTcPfHfGITtRMbBLBp0bfoYRMbZFnwQx/9Un3E=
Received: by mx.zohomail.com with SMTPS id 1763559173874830.1787013290812;
 Wed, 19 Nov 2025 05:32:53 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v4 05/10] drm/bridge: dw-hdmi-qp: Set bridge
 supported_formats
Date: Wed, 19 Nov 2025 14:32:45 +0100
Message-ID: <4348284.aeNJFYEL58@workhorse>
In-Reply-To: <3863e0e5-677b-4225-9854-3ee420828275@collabora.com>
References: <20251117-color-format-v4-0-0ded72bd1b00@collabora.com>
 <20251117-color-format-v4-5-0ded72bd1b00@collabora.com>
 <3863e0e5-677b-4225-9854-3ee420828275@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

On Tuesday, 18 November 2025 21:00:08 Central European Standard Time Cristian Ciocaltea wrote:
> Hi Nicolas,
> 
> On 11/17/25 9:11 PM, Nicolas Frattaroli wrote:
> > The drm_bridge "supported_formats" member stores a bitmask of supported
> > HDMI output formats if the bridge is in fact an HDMI bridge.
> > 
> > However, until now, the synopsys dw-hdmi-qp driver did not set this
> > member in the bridge it creates.
> > 
> > Set it based on the platform data's supported_formats member, and
> > default to BIT(HDMI_COLORSPACE_RGB) if it's absent, which preserves the
> > previous behaviour.
> > 
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> > index fe4c026280f0..cf888236bd65 100644
> > --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> > +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> > @@ -1269,6 +1269,11 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
> >  		dev_warn(dev, "Set ref_clk_rate to vendor default\n");
> >  	}
> >  
> > +	if (plat_data->supported_formats)
> > +		hdmi->bridge.supported_formats = plat_data->supported_formats;
> 
> This duplicates a change already introduced via commit 1ff27c5929ab
> ("drm/bridge: dw-hdmi-qp: Handle platform supported formats and color depth").

Hmm, looks like I didn't notice that when rebasing onto next-20251117.

(Aside note, that commit is once again lacking from next-20251119,
did it get dropped for some reason or did DRM as a whole not get
pulled into that next version due to a conflict?)

> 
> > +	else
> > +		hdmi->bridge.supported_formats = BIT(HDMI_COLORSPACE_RGB);
> 
> And this one looks redundant as well, since RGB is supposed to be mandatory:
> supported_formats defaults to RGB in drm_bridge_connector_init() if there's no
> HDMI bridge in the pipeline overriding it, while drmm_connector_hdmi_init()
> errors out if supported_formats is unset or doesn't advertise RGB.

Oops, yeah you're right

> 
> Hence I think this patch can be dropped.

Will do! Thanks for the quick review

> 
> Regards,
> Cristian
> 
> 




