Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 750C46444E0
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 14:48:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9414B10E08D;
	Tue,  6 Dec 2022 13:47:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76D0010E08D
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Dec 2022 13:47:49 +0000 (UTC)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi
 [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id AFF49480;
 Tue,  6 Dec 2022 14:47:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1670334468;
 bh=tJ0X7RQ5yJIhkQffTSluyqTAp/A/x6yOouFyd/oA5V8=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=SNOKP7Us0dslLqJdBj33OeIh2ylqq3Nu2h3lYwcVPq9YZ6xMDJEsuBPgtU1WUEEm6
 YAMpIMTsP3cv5/6HMWaVgBRKzT0BRUvKsIGeqCodX5xxuwoPbuK0F79hjuAVg471el
 PcKLF0bXthdnOvfDdUT53fMR0mzoRdAPuA6cOZeE=
Message-ID: <65167d95-410b-c09d-a082-efe8b07a39c2@ideasonboard.com>
Date: Tue, 6 Dec 2022 15:47:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 0/7] media/drm: renesas: Add new pixel formats
Content-Language: en-US
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20221206133954.397098-1-tomi.valkeinen+renesas@ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20221206133954.397098-1-tomi.valkeinen+renesas@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/12/2022 15:39, Tomi Valkeinen wrote:
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

I forgot to mention: this is based on the "[PATCH v5 0/7] Renesas V4H 
DSI & DP output support" series.

>   Tomi
> 
> Tomi Valkeinen (7):
>    media: Add 2-10-10-10 RGB formats
>    media: Add Y210, Y212 and Y216 formats
>    media: renesas: vsp1: Change V3U to be gen4
>    media: renesas: vsp1: Add V4H SoC version
>    media: renesas: vsp1: Add new formats (2-10-10-10 ARGB, Y210)
>    drm: rcar-du: Bump V3U to gen 4
>    drm: rcar-du: Add new formats (2-10-10-10 ARGB, Y210)
> 
>   drivers/gpu/drm/rcar-du/rcar_du_drv.c         |  2 +-
>   drivers/gpu/drm/rcar-du/rcar_du_kms.c         | 24 +++++++
>   drivers/gpu/drm/rcar-du/rcar_du_vsp.c         | 49 ++++++++++++++-
>   .../media/platform/renesas/vsp1/vsp1_drv.c    |  4 +-
>   .../media/platform/renesas/vsp1/vsp1_hgo.c    |  4 +-
>   .../media/platform/renesas/vsp1/vsp1_lif.c    |  1 +
>   .../media/platform/renesas/vsp1/vsp1_pipe.c   | 15 +++++
>   .../media/platform/renesas/vsp1/vsp1_regs.h   | 25 +++++++-
>   .../media/platform/renesas/vsp1/vsp1_rpf.c    | 62 +++++++++++++++++--
>   .../media/platform/renesas/vsp1/vsp1_video.c  |  4 +-
>   .../media/platform/renesas/vsp1/vsp1_wpf.c    |  4 +-
>   drivers/media/v4l2-core/v4l2-ioctl.c          |  6 ++
>   include/uapi/linux/videodev2.h                | 11 ++++
>   13 files changed, 193 insertions(+), 18 deletions(-)
> 

