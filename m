Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A22F92A88C9
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 22:17:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D62B86E07F;
	Thu,  5 Nov 2020 21:17:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B40066E07F
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 21:17:45 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id E0F5520068;
 Thu,  5 Nov 2020 22:17:43 +0100 (CET)
Date: Thu, 5 Nov 2020 22:17:42 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 16/19] gpu: drm: panel: panel-ilitek-ili9322: Demote
 non-conformant kernel-doc header
Message-ID: <20201105211742.GD216923@ravnborg.org>
References: <20201105144517.1826692-1-lee.jones@linaro.org>
 <20201105144517.1826692-17-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105144517.1826692-17-lee.jones@linaro.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VbvZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8 a=7gkXJVJtAAAA:8 a=KKAkSRfTAAAA:8
 a=e5mUnYsNAAAA:8 a=-dKZvmfMDusZ7wBAw4gA:9 a=CjuIK1q_8ugA:10
 a=E9Po1WZjFZOl8hwRPBS3:22 a=cvBusfyB2V15izCimMoJ:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lee.

On Thu, Nov 05, 2020 at 02:45:14PM +0000, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/gpu/drm/panel/panel-ilitek-ili9322.c:177: warning: Enum value 'ILI9322_INPUT_SRGB_THROUGH' not described in enum 'ili9322_input'
>  drivers/gpu/drm/panel/panel-ilitek-ili9322.c:177: warning: Enum value 'ILI9322_INPUT_SRGB_ALIGNED' not described in enum 'ili9322_input'
>  drivers/gpu/drm/panel/panel-ilitek-ili9322.c:177: warning: Enum value 'ILI9322_INPUT_SRGB_DUMMY_320X240' not described in enum 'ili9322_input'
>  drivers/gpu/drm/panel/panel-ilitek-ili9322.c:177: warning: Enum value 'ILI9322_INPUT_SRGB_DUMMY_360X240' not described in enum 'ili9322_input'
>  drivers/gpu/drm/panel/panel-ilitek-ili9322.c:177: warning: Enum value 'ILI9322_INPUT_DISABLED_1' not described in enum 'ili9322_input'
>  drivers/gpu/drm/panel/panel-ilitek-ili9322.c:177: warning: Enum value 'ILI9322_INPUT_PRGB_THROUGH' not described in enum 'ili9322_input'
>  drivers/gpu/drm/panel/panel-ilitek-ili9322.c:177: warning: Enum value 'ILI9322_INPUT_PRGB_ALIGNED' not described in enum 'ili9322_input'
>  drivers/gpu/drm/panel/panel-ilitek-ili9322.c:177: warning: Enum value 'ILI9322_INPUT_YUV_640X320_YCBCR' not described in enum 'ili9322_input'
>  drivers/gpu/drm/panel/panel-ilitek-ili9322.c:177: warning: Enum value 'ILI9322_INPUT_YUV_720X360_YCBCR' not described in enum 'ili9322_input'
>  drivers/gpu/drm/panel/panel-ilitek-ili9322.c:177: warning: Enum value 'ILI9322_INPUT_DISABLED_2' not described in enum 'ili9322_input'
>  drivers/gpu/drm/panel/panel-ilitek-ili9322.c:177: warning: Enum value 'ILI9322_INPUT_ITU_R_BT656_720X360_YCBCR' not described in enum 'ili9322_input'
>  drivers/gpu/drm/panel/panel-ilitek-ili9322.c:177: warning: Enum value 'ILI9322_INPUT_ITU_R_BT656_640X320_YCBCR' not described in enum 'ili9322_input'
>  drivers/gpu/drm/panel/panel-ilitek-ili9322.c:177: warning: Enum value 'ILI9322_INPUT_UNKNOWN' not described in enum 'ili9322_input'
> 
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Applied to drm-misc-next.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
