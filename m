Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D991D85BCAA
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 13:56:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87BC410E189;
	Tue, 20 Feb 2024 12:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=inria.fr header.i=@inria.fr header.b="jx5LoPBI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30E3410E0CA;
 Tue, 20 Feb 2024 12:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=9au07Xh01iDRJ+ACUJBW7SSYVgdZeUNwdPgErwM3qcI=;
 b=jx5LoPBItkfHfuclOjTGg5Q4+FsH+nbRtAtc48kC7ZInLuMw5muJDRvN
 MroUg2Fkmyyn5UPPuiXnKqw8Ookr9roTqicSTxFs4N5swy7M5E0OfUcUc
 /Jd+s0uI3prUec+2sXTJA6jssedrYiLF3O6KLasFEudDXLglnP9c7WdiG s=;
Authentication-Results: mail3-relais-sop.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.06,172,1705359600"; d="scan'208";a="80136711"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
 by mail3-relais-sop.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 13:56:33 +0100
Date: Tue, 20 Feb 2024 13:56:32 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
cc: Johan Hovold <johan@kernel.org>, Markus Elfring <Markus.Elfring@web.de>, 
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
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 1/6] drm/bridge: aux-hpd: fix OF node leaks
In-Reply-To: <CAA8EJppH9ey97yKFUccNLHhMKs3eUS55+rY0tXm_a6KGp9jtug@mail.gmail.com>
Message-ID: <4938592e-3f7c-c1ae-dce3-fd1ca363296@inria.fr>
References: <20240217150228.5788-2-johan+linaro@kernel.org>
 <c95f5ff3-8dad-4302-9384-92a9b83f7bdc@web.de>
 <ZdRTx2lmHBVlcLub@hovoldconsulting.com>
 <1afc87c-2c1f-df10-a0c8-2a267d44122@inria.fr>
 <CAA8EJppH9ey97yKFUccNLHhMKs3eUS55+rY0tXm_a6KGp9jtug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1952825116-1708433793=:3417"
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

--8323329-1952825116-1708433793=:3417
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Tue, 20 Feb 2024, Dmitry Baryshkov wrote:

> On Tue, 20 Feb 2024 at 13:52, Julia Lawall <julia.lawall@inria.fr> wrote:
> >
> >
> >
> > On Tue, 20 Feb 2024, Johan Hovold wrote:
> >
> > > On Mon, Feb 19, 2024 at 06:48:30PM +0100, Markus Elfring wrote:
> > > > > The two device node references taken during allocation need to be
> > > > > dropped when the auxiliary device is freed.
> > > > …
> > > > > +++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
> > > > …
> > > > > @@ -74,6 +75,8 @@ struct device *drm_dp_hpd_bridge_register(struct device *parent,
> > > > >
> > > > >   ret = auxiliary_device_init(adev);
> > > > >   if (ret) {
> > > > > +         of_node_put(adev->dev.platform_data);
> > > > > +         of_node_put(adev->dev.of_node);
> > > > >           ida_free(&drm_aux_hpd_bridge_ida, adev->id);
> > > > >           kfree(adev);
> > > > >           return ERR_PTR(ret);
> > > >
> > > > The last two statements are also used in a previous if branch.
> > > > https://elixir.bootlin.com/linux/v6.8-rc5/source/drivers/gpu/drm/bridge/aux-hpd-bridge.c#L63
> > > >
> > > > How do you think about to avoid such a bit of duplicate source code
> > > > by adding a label here?
> > >
> > > No, the current code is fine and what you are suggesting is in any case
> > > unrelated to this fix.
> > >
> > > If this function ever grows a third error path like that, I too would
> > > consider it however.
> >
> > I guess these of_node_puts can all go away shortly with cleanup anyway?
>
> I'm not sure about it. Those are long-living variables, so they are
> not a subject of cleanup.h, are they?

OK, I didn't look at this code in detail, but cleanup would just call
of_node_put, not actually free the data.

julia
--8323329-1952825116-1708433793=:3417--
