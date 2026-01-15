Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3BAD263E1
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 18:18:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FA9510E1BE;
	Thu, 15 Jan 2026 17:18:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qVtLmSXj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF6C10E1BE
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 17:18:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A11D040E25;
 Thu, 15 Jan 2026 17:18:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59700C116D0;
 Thu, 15 Jan 2026 17:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768497486;
 bh=tlBpdMlQBYBLhVmEgUbSIOIS5UI2VXeT9ZB6zSWIxfM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qVtLmSXjo6FvIftTAePkjMMLYNqnHXAPCPRIa7DqU14V+8o3w+FBwz+BiGQnqr0/2
 UGqn/mQNnRRVeh2KonGBrK9BEtHlocbBpBsHSksMlFKqnTDIJuVPrzbUwkBrSNdlJV
 4dcJ8bcNjnXbpFPGzs4XWvfIPjxYcrZWo61PllT94t8xxvcutq6myX3Bj++3oKRGGU
 8KY7fBXvOliTtwAn9Z7S5zVXgjzCpfUX4D9NtgpxnlPMqGGH7FdV0o5LvmpEXQ6xji
 h7My1VZziSebUI/weJ0pgoX77FjOCHsTuz5jLlveDNby9+xU1TnktE3QU/bJpqRN3t
 jxH+XHvLWF+Gg==
Date: Thu, 15 Jan 2026 11:18:05 -0600
From: Rob Herring <robh@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Andy Yan <andyshrk@163.com>, heiko@sntech.de,
 dmitry.baryshkov@oss.qualcomm.com, krzk+dt@kernel.org,
 conor+dt@kernel.org, cristian.ciocaltea@collabora.com,
 Laurent.pinchart@ideasonboard.com, mripard@kernel.org,
 hjc@rock-chips.com, tzimmermann@suse.de, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH 1/5] dt-bindings: display: rockchip: Add rk3576 DisplayPort
Message-ID: <20260115171805.GA907039-robh@kernel.org>
References: <20260109080054.228671-1-andyshrk@163.com>
 <20260109080054.228671-2-andyshrk@163.com> <aWa5i52PTNQ_QTQ7@venus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWa5i52PTNQ_QTQ7@venus>
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

On Tue, Jan 13, 2026 at 10:33:52PM +0100, Sebastian Reichel wrote:
> Hi,
> 
> On Fri, Jan 09, 2026 at 04:00:44PM +0800, Andy Yan wrote:
> > From: Andy Yan <andy.yan@rock-chips.com>
> > 
> > The DisplayPort found on RK3576 is very similar to that of RK3588,
> > but work in dual pixel mode. And itself does not depend on the I2S
> > clock or the SPDIF clock when transmit audio.
> > 
> > Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> > 
> > ---
> > 
> >  .../display/rockchip/rockchip,dw-dp.yaml      | 29 +++++++++++++++++--
> >  1 file changed, 26 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml
> > index 6345f0132d43..1bfe1bd6404a 100644
> > --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml
> > +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml
> > @@ -27,13 +27,11 @@ description: |
> >    * Pixel clock up to 594MHz
> >    * I2S, SPDIF audio interface
> >  
> > -allOf:
> > -  - $ref: /schemas/sound/dai-common.yaml#
> > -
> >  properties:
> >    compatible:
> >      enum:
> >        - rockchip,rk3588-dp
> > +      - rockchip,rk3576-dp
> >  
> >    reg:
> >      maxItems: 1
> > @@ -42,6 +40,7 @@ properties:
> >      maxItems: 1
> >  
> >    clocks:
> > +    minItems: 3
> >      items:
> >        - description: Peripheral/APB bus clock
> >        - description: DisplayPort AUX clock
> > @@ -50,6 +49,7 @@ properties:
> >        - description: SPDIF interfce clock
> >  
> >    clock-names:
> > +    minItems: 3
> >      items:
> >        - const: apb
> >        - const: aux
> > @@ -95,6 +95,29 @@ required:
> >    - ports
> >    - resets
> >  
> > +allOf:
> > +  - $ref: /schemas/sound/dai-common.yaml#
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - rockchip,rk3588-dp
> > +    then:
> > +      properties:
> > +        clocks:
> > +          minItems: 5
> > +          maxItems: 5
> > +        clock-names:
> > +          minItems: 5
> > +          maxItems: 5
> 
> I think maxItems is not needed, since 6 items would not work for the
> specified items list anyways. Otherwise:

Correct.

Rob
