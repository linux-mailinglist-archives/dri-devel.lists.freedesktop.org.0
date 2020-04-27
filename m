Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4391B9950
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 10:04:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C01489E43;
	Mon, 27 Apr 2020 08:04:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06DF489E43
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 08:04:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: rcn)
 with ESMTPSA id A8AAE2A00ED
Date: Mon, 27 Apr 2020 10:04:33 +0200
From: Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH] dt-bindings: display: anx7814.txt: convert to yaml
Message-ID: <20200427080433.6okx5jbq4pfasd63@rcn-XPS-13-9360>
References: <20200424065354.23781-1-ricardo.canuelo@collabora.com>
 <481401ed-93a4-6918-3d8b-6c769d8c7617@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <481401ed-93a4-6918-3d8b-6c769d8c7617@collabora.com>
User-Agent: NeoMutt/20171215
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
Cc: devicetree@vger.kernel.org, kernel@collabora.com, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On vie 24-04-2020 16:08:10, Enric Balletbo i Serra wrote:
> Hi Ricardo,
> 
> Thank you for your patch.

Hi Enric,

Thanks for reviewing it.

> > +      "#size-cells":
> > +        const: 0
> > +
> 
> I don't' think you need to specify this. You can drop it (better double check
> with Rob, though)

I think you're right. I put it just to be clear about it and because
some other yaml bindings specify them, but this is already well defined
in Documentation/devicetree/bindings/mediavideo-interfaces.txt, which is
referenced in the binding.

I agree with the rest of the comments.

Kind regards,
Ricardo
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
