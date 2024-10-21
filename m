Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA219A8FD6
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 21:33:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF4B810E589;
	Mon, 21 Oct 2024 19:32:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XxvmOwlB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B81510E589
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 19:32:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BF389A438AA;
 Mon, 21 Oct 2024 19:32:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 565E5C4CEC3;
 Mon, 21 Oct 2024 19:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729539175;
 bh=gD0ZzmIV4/MlGmBFySRwVIU98Rh6f1sZhpdiCLGXqRc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XxvmOwlBbLAX+xo8z1ab8vZL4BACarSmTkN6zt0cPNNSShyJMRr+DJyyfrMjdQ669
 pTRTgse8o7rOOFXN061RSxBGlZ8P6b2lC6ygE3Loj5BzBjBsW4wk4UCGkJRLHcjQ5i
 H4ZSC+i6vNs6XTKAmunYtdmYFzRImMJ7O800DbTt/ZCqqE9pWdIIDXuoTO47AgFmPl
 C6J2Z1J5Yk3vy5q4ynjhwstIeZv5TI7utkBC4W3RbeHoZiFw8JzjncjUFXgmAdbGzR
 sq66sy8LKoQcL1gfEw+IG2PbqaGVPyWNTJ+lc4ifiQEWSX4s00sudm6CaGXzmKGTJJ
 4SQucOUubnD4g==
Date: Mon, 21 Oct 2024 14:32:54 -0500
From: Rob Herring <robh@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, krzk+dt@kernel.org, conor+dt@kernel.org,
 quic_jesszhan@quicinc.com, mchehab@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 catalin.marinas@arm.com, will@kernel.org,
 sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
 tomi.valkeinen@ideasonboard.com, quic_bjorande@quicinc.com,
 geert+renesas@glider.be, dmitry.baryshkov@linaro.org, arnd@arndb.de,
 nfraprado@collabora.com, thierry.reding@gmail.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, sam@ravnborg.org,
 marex@denx.de, biju.das.jz@bp.renesas.com
Subject: Re: [PATCH v3 08/15] dt-bindings: display: Document dual-link LVDS
 display common properties
Message-ID: <20241021193254.GA1000195-robh@kernel.org>
References: <20241021064446.263619-1-victor.liu@nxp.com>
 <20241021064446.263619-9-victor.liu@nxp.com>
 <y6xpffdtpd4baczoatbotghhes3owh44tzdqvdgv3id4jj6jhj@nrqjn6d3wndx>
 <8f63ae16-f484-401c-a3e7-6c12a2343cc3@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f63ae16-f484-401c-a3e7-6c12a2343cc3@nxp.com>
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

On Mon, Oct 21, 2024 at 04:19:52PM +0800, Liu Ying wrote:
> On 10/21/2024, Krzysztof Kozlowski wrote:
> > On Mon, Oct 21, 2024 at 02:44:39PM +0800, Liu Ying wrote:
> >> Dual-link LVDS displays receive odd pixels and even pixels separately from
> >> dual LVDS links.  One link receives odd pixels and the other receives even
> >> pixels.  Some of those displays may also use only one LVDS link to receive
> >> all pixels, being odd and even agnostic.  Document common properties for
> >> those displays by extending LVDS display common properties defined in
> >> lvds.yaml.
> >>
> >> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> >> ---
> >> v3:
> >> * New patch.  (Dmitry)
> >>
> >>  .../bindings/display/lvds-dual-ports.yaml     | 76 +++++++++++++++++++
> >>  1 file changed, 76 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/display/lvds-dual-ports.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/lvds-dual-ports.yaml b/Documentation/devicetree/bindings/display/lvds-dual-ports.yaml
> >> new file mode 100644
> >> index 000000000000..0ac4c06d0a17
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/display/lvds-dual-ports.yaml
> >> @@ -0,0 +1,76 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/display/lvds-dual-ports.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Dual-link LVDS Display Common Properties
> >> +
> >> +maintainers:
> >> +  - Liu Ying <victor.liu@nxp.com>
> >> +
> >> +description: |
> >> +  This binding documents common properties for LVDS displays with dual LVDS
> > 
> > s/This binding documents//
> 
> Ack.
> 
> > 
> > But anyway there is a binding for common properties used in dual-link
> > panels: panel-common-dual. How is it different? Why this is not suitable
> > there? Why entirely different file name?
> 
> This one references lvds.yaml, which allows data-mapping and data-mirror.
> They are not something common for dual-link panels.
> 
> Also, this one is supposed to cover all dual-link LVDS displays including
> display panels and display bridges, while pane-common-dual.yaml is for
> panels only.

That's all fine, but refactor what is there, don't just duplicate 
things.

If we have the same property name defined (with a type) in 2 or more 
places, then that's a problem.

Rob
