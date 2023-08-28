Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFE078B572
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 18:39:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 063FC10E316;
	Mon, 28 Aug 2023 16:39:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8DB710E316
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 16:39:16 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 49E7D5AA;
 Mon, 28 Aug 2023 18:37:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1693240674;
 bh=l1xYuLhYKsgSs0UaqJUnGbUJuxaauT0l+VB86QnqciI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U2LXTCRDc4Cc9G+ZJ+vVF5paaE0JAC4bRkYgtLDR64dUEfJ4cEZxmTn1ybF/PIXWf
 taDlSuB0RkLmQ/9cDcemc9y5K7zImS2WTkQ26/m2A7BtNYV3hjI1bu6KwuMZa0vW6n
 1Gp7sSDtdsRDNMXPINO/ca1/Y3b0iqqAB115maAI=
Date: Mon, 28 Aug 2023 19:39:25 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Lee Jones <lee@kernel.org>
Subject: Re: [PATCH 01/20] drm/xlnx/zynqmp_disp: Use correct kerneldoc
 formatting in zynqmp_disp
Message-ID: <20230828163925.GU14596@pendragon.ideasonboard.com>
References: <20230824073710.2677348-1-lee@kernel.org>
 <20230824073710.2677348-2-lee@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230824073710.2677348-2-lee@kernel.org>
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
Cc: Hyun Kwon <hyun.kwon@xilinx.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Michal Simek <michal.simek@xilinx.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lee,

Thank you for the patch.

On Thu, Aug 24, 2023 at 08:36:46AM +0100, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/gpu/drm/xlnx/zynqmp_disp.c:151: warning: Function parameter or member 'blend' not described in 'zynqmp_disp'
>  drivers/gpu/drm/xlnx/zynqmp_disp.c:151: warning: Function parameter or member 'avbuf' not described in 'zynqmp_disp'
>  drivers/gpu/drm/xlnx/zynqmp_disp.c:151: warning: Function parameter or member 'audio' not described in 'zynqmp_disp'
> 
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
> Cc: Hyun Kwon <hyun.kwon@xilinx.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Michal Simek <michal.simek@xilinx.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/gpu/drm/xlnx/zynqmp_disp.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> index 407bc07cec69a..7c64ab11fe2b0 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> @@ -128,9 +128,9 @@ struct zynqmp_disp_layer {
>   * struct zynqmp_disp - Display controller
>   * @dev: Device structure
>   * @dpsub: Display subsystem
> - * @blend.base: Register I/O base address for the blender
> - * @avbuf.base: Register I/O base address for the audio/video buffer manager
> - * @audio.base: Registers I/O base address for the audio mixer
> + * @blend: .base: Register I/O base address for the blender
> + * @avbuf: .base: Register I/O base address for the audio/video buffer manager
> + * @audio: .base: Registers I/O base address for the audio mixer

This is really a hack to work around the warning, and not a clean fix.
kerneldoc is still today unable, as far as I understand, to document
nested structures. That's annoying, and the warning is a good way to
remind us that it needs to be fixed. I'd be tempted to keep the warning
for that reason.

>   * @layers: Layers (planes)
>   */
>  struct zynqmp_disp {

-- 
Regards,

Laurent Pinchart
