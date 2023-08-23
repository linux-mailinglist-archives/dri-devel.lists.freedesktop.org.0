Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B957854DF
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 12:07:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6530A10E0C5;
	Wed, 23 Aug 2023 10:07:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7318310E0C5
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 10:06:57 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 21E2F5A4;
 Wed, 23 Aug 2023 12:05:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1692785138;
 bh=wxAvkJUYw4KdN2Mb1F0ed7BLqCHwW/jLls5dR63y9Tw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Cyc8zM//wg/hYM4bq9qJukTYHGx3FoDF1hbSGNQC5nT9sA38RDvWIhB2JmcaZsgsn
 z4ISz3ZNV34edf/m5WCgloDK07kwH7zJpYNBp1D+S6Va5L9OEkZIaFnpRkXohJSnBj
 Y+woov6dDfI5vUqhReVfe636rA5cCutbCzFMa1oc=
Date: Wed, 23 Aug 2023 13:07:02 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: display: panel: add common
 dual-display schema
Message-ID: <20230823100702.GK4143@pendragon.ideasonboard.com>
References: <20230823081500.84005-1-krzysztof.kozlowski@linaro.org>
 <20230823083427.GB4143@pendragon.ideasonboard.com>
 <61ae58eb-d56c-59c1-81d7-b51322468680@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <61ae58eb-d56c-59c1-81d7-b51322468680@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Jianhua Lu <lujianhua000@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Del Regno <angelogioacchino.delregno@somainline.org>,
 Thierry Reding <thierry.reding@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 23, 2023 at 11:35:24AM +0200, Krzysztof Kozlowski wrote:
> On 23/08/2023 10:34, Laurent Pinchart wrote:
> > Hi Krzysztof,
> > 
> > Thank you for the patch.
> > 
> > On Wed, Aug 23, 2023 at 10:14:58AM +0200, Krzysztof Kozlowski wrote:
> >> Add schema with common properties shared among dual display panel ICs.
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>
> >> ---
> >>
> >> v2: https://lore.kernel.org/all/20230502120036.47165-1-krzysztof.kozlowski@linaro.org/
> >> v1: https://lore.kernel.org/all/20230416153929.356330-1-krzysztof.kozlowski@linaro.org/
> >>
> >> Changes since v2:
> >> 1. New Patch
> >> ---
> >>  .../display/panel/panel-common-dual.yaml      | 46 +++++++++++++++++++
> >>  1 file changed, 46 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-common-dual.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/panel/panel-common-dual.yaml b/Documentation/devicetree/bindings/display/panel/panel-common-dual.yaml
> >> new file mode 100644
> >> index 000000000000..83fcd643b5f5
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/display/panel/panel-common-dual.yaml
> >> @@ -0,0 +1,46 @@
> >> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/display/panel/panel-common-dual.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Common Properties for Dual-Display Panels
> >> +
> >> +maintainers:
> >> +  - Thierry Reding <thierry.reding@gmail.com>
> >> +  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >> +
> >> +description:
> >> +  Properties common for Panel IC supporting dual display panels.
> > 
> > Could you elaborate on what you mean by dual display panels ? From what
> > I understand of the patch series, this seems to be what I have called
> > dual port panels, that is panels that have two input ports to double the
> > bandwidth, but still operate as one display.
> 
> Indeed, looks like that. I don't have the datasheets so I am trying to
> get some pieces of information. Judging by the usage of these panels -
> Qualcomm DSI with qcom,dual-dsi-mode - it indeed is one panel with two
> links.
> 
> I would need to rephrase it.

Thanks :-)

Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.yaml
may be of interest to you, it's a bridge with two LVDS inputs. On the
other side, I've used
Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml which
is an LVDS encoder with a single output, but with the ability to operate
in dual link mode by coupling two encoder instances.

-- 
Regards,

Laurent Pinchart
