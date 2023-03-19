Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 853F36C0264
	for <lists+dri-devel@lfdr.de>; Sun, 19 Mar 2023 15:24:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 555D510E511;
	Sun, 19 Mar 2023 14:24:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8521210E511
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Mar 2023 14:24:30 +0000 (UTC)
Received: from pendragon.ideasonboard.com (85-76-162-78-nat.elisa-mobile.fi
 [85.76.162.78])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4900A1858;
 Sun, 19 Mar 2023 15:24:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1679235868;
 bh=w+dkC9MWnejOzS6P8ye/zUNBDJBYdWNlGyEoaQz3niE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NQuAAfQ8aiKPzhFhBF5zEauCz3mIDghGKUoDXgAMHIz03NE261MD4vl2NbUXmSJ/K
 vLSdT8cI2KzAAhc4itHT/+ovC7JutO6FuJw+jjRS8ZEet4ePymC63YZUP2ILHYmyMo
 TuB56T+AvBSXkjWEbVHA7UwSnXWIF98rfmK9TYqQ=
Date: Sun, 19 Mar 2023 16:24:32 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Lee Jones <lee@kernel.org>
Subject: Re: [PATCH 02/37] drm/xlnx/zynqmp_disp: Use correct kerneldoc
 formatting in zynqmp_disp
Message-ID: <20230319142432.GM10144@pendragon.ideasonboard.com>
References: <20230317081718.2650744-1-lee@kernel.org>
 <20230317081718.2650744-3-lee@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230317081718.2650744-3-lee@kernel.org>
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

On Fri, Mar 17, 2023 at 08:16:43AM +0000, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/gpu/drm/xlnx/zynqmp_disp.c:151: warning: Function parameter or member 'blend' not described in 'zynqmp_disp'
>  drivers/gpu/drm/xlnx/zynqmp_disp.c:151: warning: Function parameter or member 'avbuf' not described in 'zynqmp_disp'
>  drivers/gpu/drm/xlnx/zynqmp_disp.c:151: warning: Function parameter or member 'audio' not described in 'zynqmp_disp'
> 
> Cc: Hyun Kwon <hyun.kwon@xilinx.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Michal Simek <michal.simek@xilinx.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>  drivers/gpu/drm/xlnx/zynqmp_disp.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> index 3b87eebddc979..63358f4898625 100644
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

This is a hack, it won't work properly if the nested structures get
extended with more fields.

Is there a correct kerneldoc syntax for this code construct ?

>   * @layers: Layers (planes)
>   */
>  struct zynqmp_disp {

-- 
Regards,

Laurent Pinchart
