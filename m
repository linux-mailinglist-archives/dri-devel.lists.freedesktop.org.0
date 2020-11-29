Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD65F2C7B84
	for <lists+dri-devel@lfdr.de>; Sun, 29 Nov 2020 22:59:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A1EF6E045;
	Sun, 29 Nov 2020 21:59:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C41756E045
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Nov 2020 21:59:29 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 9B40C20034;
 Sun, 29 Nov 2020 22:59:27 +0100 (CET)
Date: Sun, 29 Nov 2020 22:59:26 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 0/3] drm/ingenic: Add support for delta-RGB panels
Message-ID: <20201129215926.GF1162850@ravnborg.org>
References: <20201119155559.14112-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201119155559.14112-1-paul@crapouillou.net>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Ibmpp1ia c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=jAYXITO5OE7wJCMQ_rkA:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 od@zcrc.me, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul.

On Thu, Nov 19, 2020 at 03:55:56PM +0000, Paul Cercueil wrote:
> Hi,
> 
> This patchset adds support for delta-RGB panels to the ingenic-drm
> driver. Delta-RGB panels have diamond-pattern subpixel layout, and
> expect odd lines to have RGB subpixel ordering, and even lines to have
> GBR subpixel ordering.
> 
> Such panel is used in the YLM (aka. Anbernic) RG-99, RG-300, RG-280M
> and RG-280V handheld gaming consoles.
> 
> Cheers,
> -Paul
> 
> Paul Cercueil (3):
>   drm/ingenic: Compute timings according to adjusted_mode->crtc_*
>   drm/ingenic: Properly compute timings when using a 3x8-bit panel
>   drm/ingenic: Add support for serial 8-bit delta-RGB panels

Strange panel, at least strange bit order.
Patches looks good and are all:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
