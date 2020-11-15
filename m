Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 931D02B384A
	for <lists+dri-devel@lfdr.de>; Sun, 15 Nov 2020 20:09:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0E566E99A;
	Sun, 15 Nov 2020 19:09:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7C256E99A
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 19:09:19 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 959B2804F2;
 Sun, 15 Nov 2020 20:09:17 +0100 (CET)
Date: Sun, 15 Nov 2020 20:09:16 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3] dt-bindings: display: mcde: Convert to YAML schema
Message-ID: <20201115190916.GB4067505@ravnborg.org>
References: <20201115185145.566772-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201115185145.566772-1-linus.walleij@linaro.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VafZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=7gkXJVJtAAAA:8
 a=Y1WVg7_6piav3bcYkzIA:9 a=CjuIK1q_8ugA:10 a=AjGcO6oz07-iQ99wixmX:22
 a=cvBusfyB2V15izCimMoJ:22 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,
On Sun, Nov 15, 2020 at 07:51:45PM +0100, Linus Walleij wrote:
> This moves the MCDE bindings over to using the YAML schema
> to describe the ST-Ericsson MCDE display controller,
> making use of the generic DSI controller schema.
> 
> In the process we correct an error in the old text bindings:
> the clocks for the SDI host controllers were specified as
> part of the main MCDE component while they should be
> specified in the DSI host controller subnodes. This was
> a leftover from an earlier iteration of the first patch
> series adding the MCDE.
> 
> We also add the "port" node, we will use this when adding
> LCD panels using the direct parallel interface DPI instead
> of DSI.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v2->v3:
> - Add resets to the bindings for future-proofing, set
>   additionalProperties: false
> - Extend commit message to explain the the old bindings
>   were incorrect.
Thanks, all looks good now.
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
