Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C7668E2E7
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 22:23:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76D0610E2A9;
	Tue,  7 Feb 2023 21:23:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay6-1.pub.mailoutpod2-cph3.one.com
 (mailrelay6-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:405::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9918F10E2A9
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Feb 2023 21:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=ybD3WFRL0t0/WmswXzTvoSrr9MBfbijMUcC+L8zj4iY=;
 b=FS5aWY+Hf/9ypkhLJQY5kPKvbxvBs67v8pNBuO8l0aTvHed0/68+JCIxPHmpJF1nMF6Ulj4GrZZUA
 Plnz1hbgkco99FEH+QMKzeClczPXlIUObhvxJ1GBMWzHW09/OlaI1tBlnPGgrgPrkcOkPm94RY2LNd
 epOVAYmO0zE8Mfm/iVWdngVREwLbgpYfxvGAbBnwrxr7LBmpOwNpXy4/E5FLxoxjW32N2MN0XAPEvJ
 se0g/rjGt6JoxO3fY8qroCKBh2IuDtQjY01kbFIP8WLZ34yNpWps22FRePsqqqiH1wH1jJ4KMzcAIY
 ut5rp3GbsAWHsVTg0wsKR8xF/n8EUQQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=ybD3WFRL0t0/WmswXzTvoSrr9MBfbijMUcC+L8zj4iY=;
 b=c/3WRaPt80qqT4bLQkA//sLai9x8OJKnz5MMIPAIe1vqqlounWCmyJpr3Owj2s3p1hFZQ7f3rQqpG
 zlrRI6TDA==
X-HalOne-ID: 956b5577-a72d-11ed-b026-cde5ad41a1dd
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay6 (Halon) with ESMTPSA
 id 956b5577-a72d-11ed-b026-cde5ad41a1dd;
 Tue, 07 Feb 2023 21:22:56 +0000 (UTC)
Date: Tue, 7 Feb 2023 22:22:55 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: display: panel: visionox,vtdr6130: add
 missing reg property
Message-ID: <Y+LBL08Xr3vYg4p5@ravnborg.org>
References: <20230207-topic-sm8550-upstream-vtdr6130-bindings-fix-v1-1-0ba2323420c5@linaro.org>
 <Y+KaEPO7he39Gmd5@ravnborg.org>
 <20230207203716.GA4104426-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230207203716.GA4104426-robh@kernel.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 07, 2023 at 02:37:16PM -0600, Rob Herring wrote:
> On Tue, Feb 07, 2023 at 07:36:00PM +0100, Sam Ravnborg wrote:
> > Hi Neil.
> > 
> > 
> > On Tue, Feb 07, 2023 at 11:04:36AM +0100, Neil Armstrong wrote:
> > > Add missing reg property and update example to add dsi top node.
> > > 
> > > Fixes: ef85db911134 ("dt-bindings: display: panel: document the Visionox VTDR6130 AMOLED DSI Panel")
> > > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > ---
> > >  .../bindings/display/panel/visionox,vtdr6130.yaml  | 34 ++++++++++++++--------
> > >  1 file changed, 22 insertions(+), 12 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml b/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml
> > > index 49e2fd4b4e99..84562a5b710a 100644
> > > --- a/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml
> > > +++ b/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml
> > > @@ -16,6 +16,10 @@ properties:
> > >    compatible:
> > >      const: visionox,vtdr6130
> > >  
> > > +  reg:
> > > +    maxItems: 1
> > > +    description: DSI virtual channel
> > > +
> > Other panels using dsi uses a simple
> > "	reg: true"
> > 
> > I think that would suffice here too.
> 
> Yes, because dsi-controller.yaml restricts it to a single entry. 
> However, it's description says there can be more than 1 virtual channel 
> for a device. In that case, it shouldn't be restricted in 
> dsi-controller.yaml and the above with 'maxItems: 1' would be correct. 
> So I'd keep this as-is.
Thanks for the explanation.
> 
> Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
