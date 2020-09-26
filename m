Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24EE9279BDD
	for <lists+dri-devel@lfdr.de>; Sat, 26 Sep 2020 20:25:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FD796E061;
	Sat, 26 Sep 2020 18:25:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E4786E061
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Sep 2020 18:25:51 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id BD6E48068D;
 Sat, 26 Sep 2020 20:25:49 +0200 (CEST)
Date: Sat, 26 Sep 2020 20:25:48 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 0/7] Ingenic-drm improvements + new pixel formats
Message-ID: <20200926182548.GB91317@ravnborg.org>
References: <20200926170501.1109197-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200926170501.1109197-1-paul@crapouillou.net>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=A5ZCwZeG c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=sgGEiIrZ8JUFcs7D_jkA:9
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
Cc: David Airlie <airlied@linux.ie>, od@zcrc.me,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul.

On Sat, Sep 26, 2020 at 07:04:54PM +0200, Paul Cercueil wrote:
> Hi,
> 
> This is a V2 of my small patchset "Small improvements to ingenic-drm"
> that I sent about two weeks ago. In that time, I worked on new
> improvements, so I thought I'd just add them to the patchset, since
> I needed a V2 anyway.
> 
> Sam: the patches you acked have been all slightly modified, I kept your
> acked-by on them, please tell me if that's OK.

All patches except "Add support for paletted 8bpp" are:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>



	sam
> 
> Cheers,
> -Paul
> 
> Paul Cercueil (7):
>   drm/ingenic: Reset pixclock rate when parent clock rate changes
>   drm/ingenic: Add support for reserved memory
>   drm/ingenic: Alloc F0 and F1 DMA descriptors at once
>   drm/ingenic: Support handling different pixel formats in F0/F1 planes
>   drm/ingenic: Add support for paletted 8bpp
>   drm/ingenic: Add support for 30-bit modes
>   drm/ingenic: Add support for 24-bit modes
> 
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 262 +++++++++++++++++++---
>  drivers/gpu/drm/ingenic/ingenic-drm.h     |   3 +
>  2 files changed, 228 insertions(+), 37 deletions(-)
> 
> -- 
> 2.28.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
