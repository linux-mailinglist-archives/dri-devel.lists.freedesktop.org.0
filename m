Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 630CA51A322
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 17:06:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F05310EC3B;
	Wed,  4 May 2022 15:06:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B34210EC3B
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 15:06:34 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id
 k25-20020a056830169900b00605f215e55dso1063300otr.13
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 08:06:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CMbN7hS5qpXAJ56hrK4Dy33g9tIzfngyx0mx6oH98LI=;
 b=S+CGvOxx4WkCVZ5wcQHeqVAAuX1HJc1SKfNdp3WPx6KduQerr2dfNjcWFNSzFC90Np
 0Ceu+3PypHRxwiKgErBE6EF3ZARTZydjJ+qxEc/OFDexy8oxGSoyMk1vLdr3y2BlkeMJ
 SFIO3vmO26jJ9rsAzjUgN2NzAPUMNmzkl7FWnfwf7vos2boDobkPKeY82DJOhCru6ywG
 97xNxRjtJB/SiBv9siWa0Hej3l8XiuQIRqHaY9vIcGaL19Omhx0POMmOI1lU6uQL+n9l
 aYLx54WD3IC9MUXS3k1m2kAWXAWcxpGdXOUOpJUV+9qipR3/mW5t306m/AiT75+XEueF
 js/Q==
X-Gm-Message-State: AOAM533dnvQ8/rxajr7sBOvMD89qjulYNJRZAzzXxPB75DBom3IfboTU
 QlSxOzvlfT/sdKEIdL8zGA==
X-Google-Smtp-Source: ABdhPJzimC2Mzz2fvZIGRB0h0xrOBQBahibFvTDdc4eoJHIylylulmbJ3HrZO6H+owbGwvZAVRUU7g==
X-Received: by 2002:a05:6830:1059:b0:606:2f92:4c28 with SMTP id
 b25-20020a056830105900b006062f924c28mr3411242otp.253.1651676793648; 
 Wed, 04 May 2022 08:06:33 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 k14-20020a056820016e00b0035eb4e5a6bcsm6164683ood.18.2022.05.04.08.06.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 08:06:33 -0700 (PDT)
Received: (nullmailer pid 1712216 invoked by uid 1000);
 Wed, 04 May 2022 15:06:32 -0000
Date: Wed, 4 May 2022 10:06:32 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] dt-bindings: display: bridge: ldb: Fill in reg property
Message-ID: <YnKWeAu2MxXA7GzV@robh.at.kernel.org>
References: <20220504012601.423644-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220504012601.423644-1-marex@denx.de>
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
Cc: devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
 Maxime Ripard <maxime@cerno.tech>, robert.foss@linaro.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Robby Cai <robby.cai@nxp.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 04 May 2022 03:26:01 +0200, Marek Vasut wrote:
> Add missing reg and reg-names properties for both 'LDB_CTRL'
> and 'LVDS_CTRL' registers.
> 
> Fixes: 463db5c2ed4ae ("drm: bridge: ldb: Implement simple Freescale i.MX8MP LDB bridge")
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Robby Cai <robby.cai@nxp.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> To: dri-devel@lists.freedesktop.org
> ---
>  .../bindings/display/bridge/fsl,ldb.yaml         | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
