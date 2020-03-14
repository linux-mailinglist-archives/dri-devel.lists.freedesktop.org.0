Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA7E185522
	for <lists+dri-devel@lfdr.de>; Sat, 14 Mar 2020 09:16:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 269696E10A;
	Sat, 14 Mar 2020 08:16:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C1DA6E10A
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Mar 2020 08:16:10 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id DB66D8051D;
 Sat, 14 Mar 2020 09:16:07 +0100 (CET)
Date: Sat, 14 Mar 2020 09:16:06 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH 3/5] drm: panel: add Xingbangda XBD599 panel
Message-ID: <20200314081606.GA10236@ravnborg.org>
References: <20200311163329.221840-1-icenowy@aosc.io>
 <20200311163329.221840-4-icenowy@aosc.io>
 <20200314080000.GE5783@ravnborg.org>
 <6AE386BC-BBC9-491F-82F0-CA32EAFE44DF@aosc.io>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6AE386BC-BBC9-491F-82F0-CA32EAFE44DF@aosc.io>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=QDd3ko92FGBvql3bwNIA:9 a=CjuIK1q_8ugA:10 a=pHzHmUro8NiASowvMSCR:22
 a=nt3jZW36AmriUCFCBwmW:22
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
Cc: Ondrej Jirman <megous@megous.com>, devicetree@vger.kernel.org,
 linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Icenowy

> >> +++ b/drivers/gpu/drm/panel/panel-xingbangda-xbd599.c
> >> @@ -0,0 +1,367 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +/*
> >> + * Xingbangda XBD599 MIPI-DSI panel driver
> >> + *
> >> + * Copyright (C) 2019 Icenowy Zheng <icenowy@aosc.io>
> >2020?
> 
> The work started at Mid 2019.
> 
> Is 2019-2020 okay?

We see this in other places so I guess it is. The point
here is that the driver contains work from 2020 so you should at least
specify 2020.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
