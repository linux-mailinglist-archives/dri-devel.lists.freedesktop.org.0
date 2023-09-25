Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B445F7AE688
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 09:15:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A43B010E373;
	Tue, 26 Sep 2023 07:15:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-203.mta0.migadu.com (out-203.mta0.migadu.com
 [IPv6:2001:41d0:1004:224b::cb])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A2A010E21D
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 09:21:51 +0000 (UTC)
Date: Mon, 25 Sep 2023 19:21:25 +1000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
 t=1695633709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n9O5UKN7tbRZK1Q9LpJlaNZaOpS94daiRwiLSPX4z0c=;
 b=vWTlglalviIbwVryZ8nWg7ttWfbbiBMo5J1cE+AyRX3ulLrW7ftoDRBRETqaWXeHC4LuRH
 CBb/QK5vRkpGVoWFw0efM3uGJQ/AAsh+4L2vSvg6DVo5IegdGfoVHTgEY4JdCcD/8SUNj0
 tyf9W1I9/B1yqEo+AAESJalMbKPNOje0PTB7EGuSzFCsSyfWwc5fcmLnv/ceJbDHYZRVYU
 O5FY0+v277dWCbGJC/juvl0WytI5AtWfvDcaXTf5WhsGN5ahPT8LCIoj1xsd4o1KUCKEl8
 Wpcso/SAMK3/TCL4x54a1oDLU3fTo2UurQ70JkIFClg5j1jvHkttwpH1RY7r2g==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: John Watts <contact@jookia.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [RFC PATCH v3 4/7] drm/panel: nv3052c: Add Fascontek FS035VG158
 LCD display
Message-ID: <ZRFRFXCKTIb9x7GW@titan>
References: <20230925021059.451019-1-contact@jookia.org>
 <20230925021059.451019-5-contact@jookia.org>
 <ebd5808fe3029e46376aea3c25d3770a6b406fdc.camel@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ebd5808fe3029e46376aea3c25d3770a6b406fdc.camel@crapouillou.net>
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Tue, 26 Sep 2023 07:15:08 +0000
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
 Rob Herring <robh+dt@kernel.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Christophe Branchereau <cbranchereau@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 25, 2023 at 11:12:29AM +0200, Paul Cercueil wrote:
> Hi John,
> 
> Just to be sure, your fascontek panel won't work with the
> initialization sequence of the leadtek panel?

Yes, it does work.

> Did you try with the existing display modes? If you can afford the 24
> MHz clock (and if it works with your panel) it will give you a perfect
> 60.0 Hz refresh rate, while this mode above will give you above 59.93
> Hz (which is not that bad though).

No I didn't test with this.

In general I don't feel comfortable submitting code that strays from what is
recommended by the manufacturer.

> Otherwise LGTM.
> 
> Cheers,
> -Paul

John.
