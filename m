Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D89F79C80A
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 09:19:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E54E10E38E;
	Tue, 12 Sep 2023 07:19:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2933 seconds by postgrey-1.36 at gabe;
 Mon, 11 Sep 2023 09:51:28 UTC
Received: from out-221.mta1.migadu.com (out-221.mta1.migadu.com
 [IPv6:2001:41d0:203:375::dd])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1A1810E263
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 09:51:28 +0000 (UTC)
Date: Mon, 11 Sep 2023 19:49:11 +1000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
 t=1694425887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0AVtJvOvxL1Rv82m1/fmLK9vTdLbPmAMKzyqL7jm1Lw=;
 b=wD+Aq9cumadywoTlaZfJQPfztntYR2EA85Ee0fx4LuNSc1kO44IrfGls9Qb4pFGDhfpqio
 eePJailD5wS4SBW1Kmf9bZWc00Ah0ykZP/YkwLnI9xRIkdK2QbvS6CrNPgw0EMomWDTaFl
 aEXPWIgaYgcqRFaXAnr+cfUho6BauW1/+MIRsed3b2fONc6ZAyucKbU7Ex23pZ8RNU938E
 QS6OMptPwxUmqjvGwU7oMLfb0b2SCVUD7l48mLP4EWNmHBSraI6yNRmHZw5gcPU4Kdi4iP
 b/PFGvLBAgdCsK2/48hf652iBm8COsulQHjBhQ3lJ6UMurokaBJZBzfNHmNbKw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: John Watts <contact@jookia.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [RFC PATCH 8/8] dt-bindings: display: panel: add Fascontek
 FS035VG158 panel
Message-ID: <ZP7il27e9cExVWaL@titan>
References: <20230911090206.3121440-1-contact@jookia.org>
 <20230911090206.3121440-9-contact@jookia.org>
 <e22e61e7-02b1-8127-888d-e470838f4a18@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e22e61e7-02b1-8127-888d-e470838f4a18@linaro.org>
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Tue, 12 Sep 2023 07:19:12 +0000
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
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Chris Morgan <macromorgan@hotmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@edgeble.ai>,
 Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello again,

On Mon, Sep 11, 2023 at 11:41:12AM +0200, Krzysztof Kozlowski wrote:
> > +maintainers:
> > +  - John Watts <contact@jookia.org>
> > +
> > +allOf:
> > +  - $ref: panel-common.yaml#
> > +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: fascontek,fs035vg158
> > +
> > +  backlight: true
> > +  port: true
> > +  power-supply: true
> > +  reg: true
> > +  reset-gpios: true
> 
> Why do you need all these 5? They are allowed by panel-common.
> 
> > +
> > +  spi-3wire: true
> > +
> > +required:
> > +  - compatible
> 
> Missing reg. Probably also port.
> 
> 
> > +  - power-supply
> > +  - reset-gpios
> > +

I have just copy pasted the other panel's yaml, so these issues apply
there too. Should I fix that panel's yaml up first then re-copy?

> 
> 
> Best regards,
> Krzysztof
> 

John.
