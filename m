Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E670C85BB3D
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 12:59:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 037BA10E37B;
	Tue, 20 Feb 2024 11:59:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=inria.fr header.i=@inria.fr header.b="Pql6VQnC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 429 seconds by postgrey-1.36 at gabe;
 Tue, 20 Feb 2024 11:59:38 UTC
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 778C310E37B;
 Tue, 20 Feb 2024 11:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=1M4BVBMt80+EpGUdBvcdqZq7UMSH5rmWkvh/86/IyP0=;
 b=Pql6VQnC508MlZQr0ue7CCu89plVt/X6lTdZnJ+Of3+4gTP5Ip6joogh
 27bbqBwHYV2sV2qL7VhZJLKnUzpN89pRC+l90k8ldZjsXwMvkYZhacpsn
 c/QtgZ0mSU1Gfgg+8IRt5GbdySMyiWwcPKq7o5D3v1szRxKr1MizjemHy 0=;
Authentication-Results: mail3-relais-sop.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.06,172,1705359600"; d="scan'208";a="80129118"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
 by mail3-relais-sop.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 12:52:25 +0100
Date: Tue, 20 Feb 2024 12:52:25 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Johan Hovold <johan@kernel.org>
cc: Markus Elfring <Markus.Elfring@web.de>, 
 Johan Hovold <johan+linaro@kernel.org>, freedreno@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Vinod Koul <vkoul@kernel.org>, 
 LKML <linux-kernel@vger.kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 1/6] drm/bridge: aux-hpd: fix OF node leaks
In-Reply-To: <ZdRTx2lmHBVlcLub@hovoldconsulting.com>
Message-ID: <1afc87c-2c1f-df10-a0c8-2a267d44122@inria.fr>
References: <20240217150228.5788-2-johan+linaro@kernel.org>
 <c95f5ff3-8dad-4302-9384-92a9b83f7bdc@web.de>
 <ZdRTx2lmHBVlcLub@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1071210912-1708429945=:3417"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1071210912-1708429945=:3417
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Tue, 20 Feb 2024, Johan Hovold wrote:

> On Mon, Feb 19, 2024 at 06:48:30PM +0100, Markus Elfring wrote:
> > > The two device node references taken during allocation need to be
> > > dropped when the auxiliary device is freed.
> > …
> > > +++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
> > …
> > > @@ -74,6 +75,8 @@ struct device *drm_dp_hpd_bridge_register(struct device *parent,
> > >
> > >  	ret = auxiliary_device_init(adev);
> > >  	if (ret) {
> > > +		of_node_put(adev->dev.platform_data);
> > > +		of_node_put(adev->dev.of_node);
> > >  		ida_free(&drm_aux_hpd_bridge_ida, adev->id);
> > >  		kfree(adev);
> > >  		return ERR_PTR(ret);
> >
> > The last two statements are also used in a previous if branch.
> > https://elixir.bootlin.com/linux/v6.8-rc5/source/drivers/gpu/drm/bridge/aux-hpd-bridge.c#L63
> >
> > How do you think about to avoid such a bit of duplicate source code
> > by adding a label here?
>
> No, the current code is fine and what you are suggesting is in any case
> unrelated to this fix.
>
> If this function ever grows a third error path like that, I too would
> consider it however.

I guess these of_node_puts can all go away shortly with cleanup anyway?

julia
--8323329-1071210912-1708429945=:3417--
