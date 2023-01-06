Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A456600ED
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 14:06:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB1D10E14C;
	Fri,  6 Jan 2023 13:05:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod2-cph3.one.com
 (mailrelay4-1.pub.mailoutpod2-cph3.one.com [46.30.211.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A564C10E14C
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 13:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=gDg2C8wzCWaYAwH+05zvmIArdZV2pjBbAAKytWPoFLQ=;
 b=v1AUk9HWxQCQGwwUrqJr1Ns0WhZoUyTSko2yd+GsncJz68rxo+iuXP1S2ac1EVSME619PvUzwkc43
 wxpYoFm7mA0+S5auap/cT7i+X+20u9g2mFNAtrktK/Og5lLMZZ+yVA4tx2kHhZW1D2nf8Bdp0WGYWA
 4EtjFMwLgoP3qegn+cMkEBtQJ5C4/TRX2ZCg0ge3DwXJ7wq76kboKmoMjZzIop6/e0sQu6+neiT+gC
 tC/JKXF75ulNcNAVp57/yqTN4rNfkk+md7humRcxqpaxQX2tWTXl5111486m76TFUQefL7ye5C6TKw
 0IjtIHkMyVOxAX0ZIE6P9Zi30tY5n3w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=gDg2C8wzCWaYAwH+05zvmIArdZV2pjBbAAKytWPoFLQ=;
 b=qlJdktE2ogNOGWFPtTpqNOqpY1orCMfAN31moczxtBwCYX+lx8uDvs646Yr7lUVAqCTicvdlJb2FM
 RzuRq07Dg==
X-HalOne-ID: b3eccd90-8dc2-11ed-a4d7-87783a957ad9
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay4 (Halon) with ESMTPSA
 id b3eccd90-8dc2-11ed-a4d7-87783a957ad9;
 Fri, 06 Jan 2023 13:04:52 +0000 (UTC)
Date: Fri, 6 Jan 2023 14:04:51 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: document the Visionox
 VTDR6130 AMOLED DSI Panel bindings
Message-ID: <Y7gcc1tjge3wHOf7@ravnborg.org>
References: <20230103-topic-sm8550-upstream-vtdr6130-panel-v1-0-9b746b858378@linaro.org>
 <20230103-topic-sm8550-upstream-vtdr6130-panel-v1-1-9b746b858378@linaro.org>
 <Y7RsnBkgnWbF3uMj@ravnborg.org>
 <877fc236-5f86-3853-0877-33df32689d8c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877fc236-5f86-3853-0877-33df32689d8c@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil,

> > > +properties:
> > > +  compatible:
> > > +    const: visionox,vtdr6130
> > > +
> > > +  vddio-supply: true
> > > +  vci-supply: true
> > > +  vdd-supply: true
> > These 3 looks wrong to me, as the above are not documented in panel-common.
> > But maybe I miss something and this is OK?
> 
> It should be OK, the XXXX-supply properties are standard properties
Thanks for the explanation - patch is then:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
