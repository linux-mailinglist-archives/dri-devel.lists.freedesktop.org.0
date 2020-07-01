Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8CF210F18
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 17:25:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D3436E0EF;
	Wed,  1 Jul 2020 15:25:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9C476E0EF
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 15:25:38 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 492D920025;
 Wed,  1 Jul 2020 17:25:34 +0200 (CEST)
Date: Wed, 1 Jul 2020 17:25:32 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Ondrej Jirman <megous@megous.com>
Subject: Re: [PATCH v6 00/13] Add support for PinePhone LCD panel
Message-ID: <20200701152532.GA670324@ravnborg.org>
References: <20200701103126.1512615-1-megous@megous.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200701103126.1512615-1-megous@megous.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=J_fg_7IlAAAA:8 a=SxmoPjm5-5tPnGG2PkAA:9
 a=CjuIK1q_8ugA:10 a=zGOw-GkVl6h1W4ZARoUA:22
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
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Purism Kernel Team <kernel@puri.sm>, Samuel Holland <samuel@sholland.org>,
 David Airlie <airlied@linux.ie>,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 Bhushan Shah <bshah@kde.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Martijn Braam <martijn@brixit.nl>, linux-sunxi@googlegroups.com,
 Thierry Reding <thierry.reding@gmail.com>, Luca Weiss <luca@z3ntu.xyz>,
 linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ondrej.

On Wed, Jul 01, 2020 at 12:31:13PM +0200, Ondrej Jirman wrote:
> This patchset adds support for the LCD panel of PinePhone.
> 
> I've tested this on PinePhone 1.0 and 1.2.
> 
> Please take a look.
> 
> thank you and regards,
>   Ondrej Jirman
> 
> Changes in v6:
> - Fixed spacing in yaml
> - Fixed wrong vccio->iovcc supply name in the bindings doc
> - I noticed that the original driver uses a delay of 20ms in the init
>   function to achieve a combined total of 120ms required from post-reset
>   to display_on. I've added a similar delay to xbd599_init, so that
>   xbd599 panel also has the right timing. (patch 9)
> - v5->v6 diff: https://megous.com/dl/tmp/v5-v6.patch
> - Added review/ack tags
> - Learned to run dt_binding_check by myself ;)
The patch-set does not apply clean on top of drm-misc-next - due to
vrefresh removal.
Please re-spin.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
