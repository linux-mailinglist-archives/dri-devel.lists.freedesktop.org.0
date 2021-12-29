Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 163364815A9
	for <lists+dri-devel@lfdr.de>; Wed, 29 Dec 2021 18:13:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 459DA10E24B;
	Wed, 29 Dec 2021 17:13:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F85C10E22D
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Dec 2021 17:13:44 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 25D7B71;
 Wed, 29 Dec 2021 18:13:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1640798022;
 bh=+GoLFlShimUPmotDVHXML+tvcBX4Qdq5wGOanFJynoM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BzvVQ4l5+jfdGLDxPAv48qHXCY3Nb6Re8qFKu/gAkVcr6Tk5ZnR8KValwP9RVuFGi
 qOloBJ/AToz2Jl2EPffoixwcuRuikrgkNv28+TxmC/Lq41plBYam4hzMKSzFX11Um5
 IcUVFKeFLj2Us0A68nwjEsyQrbNOY/s0vs0VXJ5U=
Date: Wed, 29 Dec 2021 19:13:39 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a77961: Add lvds0 device node
Message-ID: <YcyXQxW3kRqQ2Yv0@pendragon.ideasonboard.com>
References: <20211224052309.1997096-1-nikita.yoush@cogentembedded.com>
 <20211224052309.1997096-3-nikita.yoush@cogentembedded.com>
 <YcyTV4fJqMHIeyYB@pendragon.ideasonboard.com>
 <87626d61-ada0-c220-bea5-5330f5256629@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87626d61-ada0-c220-bea5-5330f5256629@cogentembedded.com>
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
Cc: devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nikita,

On Wed, Dec 29, 2021 at 08:04:18PM +0300, Nikita Yushchenko wrote:
> Hi.
> 
> Thank you for looking at this.
> 
> >> +				port@1 {
> >> +					reg = <1>;
> >> +					lvds0_out: endpoint {
> >>   					};
> > 
> > Endpoints must have a remote-endpoint property. Let's drop the endpoint
> > here and keep the port only, the endpoint can be declared in board
> > files.
> > 
> > If you're fine with this change I can make it when applying the patch.
> 
> This empty endpoint is currently defined in dtsi files for other r-car
> gen3 SoCs.
>
> Goal here is to define lvds0_out label that is then used in extension
> board dtsi files to link to the port.
> 
> In this patch I just used the same approach as in files laying nearby.
> 
> If this approach is not appropriate, then perhaps need to fix it in
> files for all SoCs, to make it possible for extension board dtsi to be
> compatible with all of them.

I'm writing a patch to drop those right now :-) I'll CC you.

-- 
Regards,

Laurent Pinchart
