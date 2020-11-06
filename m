Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BE12AA027
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 23:23:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA7036EB2E;
	Fri,  6 Nov 2020 22:23:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FFC96EB2E
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 22:23:10 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 5F16E2006F;
 Fri,  6 Nov 2020 23:23:07 +0100 (CET)
Date: Fri, 6 Nov 2020 23:23:06 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 04/19] drm/mga/mga_dma: Demote kernel-doc abusers to
 standard comment blocks
Message-ID: <20201106222306.GB826715@ravnborg.org>
References: <20201106214949.2042120-1-lee.jones@linaro.org>
 <20201106214949.2042120-5-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201106214949.2042120-5-lee.jones@linaro.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VbvZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=UyPj0cawAAAA:8 a=UYoTZ2hgAAAA:8 a=977SQLHdAAAA:8
 a=e5mUnYsNAAAA:8 a=KKAkSRfTAAAA:8 a=79bEBMrwVnvcwRRDuU8A:9
 a=CjuIK1q_8ugA:10 a=Y6pI1GxSO5a61sAuGrKI:22 a=V6L1DCqn-8WKw3iEt1hp:22
 a=X9mgP9w9NIdro0Z1KHhB:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=cvBusfyB2V15izCimMoJ:22
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Faith <faith@valinux.com>,
 by <jhartmann@precisioninsight.com>,
 Keith Whitwell <keith@tungstengraphics.com>,
 Jeff Hartmann <jhartmann@valinux.com>, Gareth Hughes <gareth@valinux.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 06, 2020 at 09:49:34PM +0000, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/gpu/drm/mga/mga_dma.c:29: warning: Cannot understand  * file mga_dma.c
>  drivers/gpu/drm/mga/mga_dma.c:455: warning: Function parameter or member 'dev' not described in 'mga_do_agp_dma_bootstrap'
>  drivers/gpu/drm/mga/mga_dma.c:455: warning: Function parameter or member 'dma_bs' not described in 'mga_do_agp_dma_bootstrap'
>  drivers/gpu/drm/mga/mga_dma.c:629: warning: Function parameter or member 'dev' not described in 'mga_do_pci_dma_bootstrap'
>  drivers/gpu/drm/mga/mga_dma.c:629: warning: Function parameter or member 'dma_bs' not described in 'mga_do_pci_dma_bootstrap'
>  drivers/gpu/drm/mga/mga_dma.c:1150: warning: Function parameter or member 'dev' not described in 'mga_driver_unload'
>  drivers/gpu/drm/mga/mga_dma.c:1159: warning: Function parameter or member 'dev' not described in 'mga_driver_lastclose'
> 
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: by <jhartmann@precisioninsight.com>
> Cc: Faith <faith@valinux.com>
> Cc: Jeff Hartmann <jhartmann@valinux.com>
> Cc: Keith Whitwell <keith@tungstengraphics.com>
> Cc: Gareth Hughes <gareth@valinux.com>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
Thanks, apllied to drm-misc-next.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
