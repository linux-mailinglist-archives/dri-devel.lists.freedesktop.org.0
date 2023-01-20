Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 735EC674EE5
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 09:04:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6990F10E08C;
	Fri, 20 Jan 2023 08:04:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6180010E08C
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 08:04:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C362461E50;
 Fri, 20 Jan 2023 08:04:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95B49C433EF;
 Fri, 20 Jan 2023 08:04:14 +0000 (UTC)
Message-ID: <26aff75c-8550-957d-ffcd-76b647aaaad9@xs4all.nl>
Date: Fri, 20 Jan 2023 09:04:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 0/7] media/drm: renesas: Add new pixel formats
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 Geert Uytterhoeven <geert@linux-m68k.org>
References: <20221221092448.741294-1-tomi.valkeinen+renesas@ideasonboard.com>
Content-Language: en-US
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20221221092448.741294-1-tomi.valkeinen+renesas@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/12/2022 10:24, Tomi Valkeinen wrote:
> From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> 
> Hi,
> 
> These add new pixel formats for Renesas V3U and V4H SoCs.
> 
> As the display pipeline is split between DRM and V4L2 components, this
> series touches both subsystems. I'm sending all these together to
> simplify review. If needed, I can later split this to V4L2 and DRM
> parts, of which the V4L2 part needs to be merged first.
> 
> Changes in v3:
> - Addressed all the review comments
> - Added Y212
> - Updated the kernel docs for the new formats
> - Changed the RGB format names to match the DRM's format names
> - Updated RPF register field macros according to the comments

For this series:

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Thanks,

	Hans

> 
>  Tomi
> 
> Tomi Valkeinen (7):
>   media: Add 2-10-10-10 RGB formats
>   media: Add Y210, Y212 and Y216 formats
>   media: renesas: vsp1: Change V3U to be gen4
>   media: renesas: vsp1: Add V4H SoC version
>   media: renesas: vsp1: Add new formats (2-10-10-10 ARGB, Y210, Y212)
>   drm: rcar-du: Bump V3U to gen 4
>   drm: rcar-du: Add new formats (2-10-10-10 ARGB, Y210)
> 
>  .../media/v4l/pixfmt-packed-yuv.rst           |  49 ++++-
>  .../userspace-api/media/v4l/pixfmt-rgb.rst    | 194 ++++++++++++++++++
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c         |   2 +-
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c         |  30 +++
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c         |  50 ++++-
>  .../media/platform/renesas/vsp1/vsp1_drv.c    |   4 +-
>  .../media/platform/renesas/vsp1/vsp1_hgo.c    |   4 +-
>  .../media/platform/renesas/vsp1/vsp1_lif.c    |   1 +
>  .../media/platform/renesas/vsp1/vsp1_pipe.c   |  18 ++
>  .../media/platform/renesas/vsp1/vsp1_regs.h   |  26 ++-
>  .../media/platform/renesas/vsp1/vsp1_rpf.c    |  64 +++++-
>  .../media/platform/renesas/vsp1/vsp1_video.c  |   4 +-
>  .../media/platform/renesas/vsp1/vsp1_wpf.c    |   4 +-
>  drivers/media/v4l2-core/v4l2-ioctl.c          |   6 +
>  include/uapi/linux/videodev2.h                |  11 +
>  15 files changed, 447 insertions(+), 20 deletions(-)
> 

