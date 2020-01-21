Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0091445A1
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2020 21:05:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFDFB6E288;
	Tue, 21 Jan 2020 20:05:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF7FF6E288
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 20:05:13 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id B32EA20023;
 Tue, 21 Jan 2020 21:05:09 +0100 (CET)
Date: Tue, 21 Jan 2020 21:05:08 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: display: add panel-timing.yaml
Message-ID: <20200121200508.GA12997@ravnborg.org>
References: <20200120200641.15047-1-sam@ravnborg.org>
 <20200120200641.15047-2-sam@ravnborg.org>
 <CAGgjyvGh8idpvijVcV0vA8R_iaB0mQMTk_=wWDSSKWX7hwdYPw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGgjyvGh8idpvijVcV0vA8R_iaB0mQMTk_=wWDSSKWX7hwdYPw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=m8ToADvmAAAA:8
 a=mQmKYES7xw7GLjSqz8EA:9 a=CjuIK1q_8ugA:10 a=kCrBFHLFDAq2jDEeoMj9:22
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
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Oleksandr.

> 
> There some typos:
> 
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-timing.yaml b/Documentation/devicetree/bindings/display/panel/panel-timing.yaml
> > new file mode 100644
> > index 000000000000..59891c7a58ee
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-timing.yaml
> > @@ -0,0 +1,253 @@
> ...
> > +description: |
> > +  There are different ways of describing the timing data data of a panel. The
> -----------------------------------------------------------------------^^^^^^^^^
> s/data data/data/
> 
> ...
> > +  vactive:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: |
> > +      Verical panel resolution in pixels
> ---------^^^^^^
> Vertical

Fixed in v2 - thanks.

> 
> Anyway, those are minor issues, so
> 
> Reviewed-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
