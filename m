Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A7A693FAC
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 09:33:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEEE410E4CB;
	Mon, 13 Feb 2023 08:33:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 367 seconds by postgrey-1.36 at gabe;
 Mon, 13 Feb 2023 07:20:52 UTC
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25A6610E4D8
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 07:20:51 +0000 (UTC)
X-QQ-mid: bizesmtp70t1676272308tfgfr02l
Received: from [192.168.30.129] ( [92.202.159.105])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 13 Feb 2023 15:11:46 +0800 (CST)
X-QQ-SSF: 01100000002000B0E000B00A0000000
X-QQ-FEAT: CR3LFp2JE4lDSCIU1cfFU98cvix/eiTofwryXjxR0CGSihdDvPFb5smRIwM9x
 c/mbifTe/bM8YQqOGm9YhmVqEeSXpR7nDQ8oxPBWV6Ys6DNdiqjSev4FHQq3i6LQte5hP/V
 wqmrQ+YJHxyST2lpuBPYGFL4oolei2CxcjigXKLum5PVsQd78KLv7+2GCu4lzn9mttUQ4iS
 kIDAseMINAes/4q8gpQEH+D1w+Zpd8rMeHh+N0Wa8Kw0i8iaFjx/KpAbbHWM7A6/lNQP0N9
 5hCePHxgw5h/5ibnNVM2QSoFR726G1lW+wPO4IyXOCBJbl6hm19FxTkKTKi4BzKpPUxcNwY
 y01S05cJLcjn7IXPqkMw+06dAVqWB3vaWl1re950TOfER8bI+g=
X-QQ-GoodBg: 0
Message-ID: <43BFE269C2D3B94A+72719122-bfdd-8e99-9176-a6f5e30abfb2@radxa.com>
Date: Mon, 13 Feb 2023 16:11:46 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v5 0/4] drm/rockchip: dw_hdmi: Add 4k@30 support
To: Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org
References: <20230208090816.3810589-1-s.hauer@pengutronix.de>
Content-Language: en-US
From: FUKAUMI Naoki <naoki@radxa.com>
In-Reply-To: <20230208090816.3810589-1-s.hauer@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:radxa.com:qybglogicsvr:qybglogicsvr5
X-Mailman-Approved-At: Mon, 13 Feb 2023 08:33:16 +0000
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
Cc: Dan Johansen <strit@manjaro.org>, Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

hi,

on my rk3399 boards(ROCK Pi 4B+ and ROCK 4C+), fb0 is configured as 
1920x1080, and nothing is displayed... "no signal" on display.

--
FUKAUMI Naoki

On 2/8/23 18:08, Sascha Hauer wrote:
> Some more small changes to this series, see changelog.
> 
> Sascha
> 
> Changes since v4:
> - Use struct vop_reg to store resolutions
> - Only check for valid clock rates when clock != NULL
> 
> Changes since v3
> - Add patch to limit VOP resolutions to hardware capabilitie
> 
> Changes since v2:
> - Use correct register values for mpll_cfg
> - Add patch to discard modes we cannot achieve
> 
> Changes since v1:
> - Allow non standard clock rates only on Synopsys phy as suggested by
>    Robin Murphy
> 
> Sascha Hauer (4):
>    drm/rockchip: vop: limit maximium resolution to hardware capabilities
>    drm/rockchip: dw_hdmi: relax mode_valid hook
>    drm/rockchip: dw_hdmi: Add support for 4k@30 resolution
>    drm/rockchip: dw_hdmi: discard modes with unachievable pixelclocks
> 
>   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c  | 41 ++++++++++++++++----
>   drivers/gpu/drm/rockchip/rockchip_drm_vop.c  | 15 +++++++
>   drivers/gpu/drm/rockchip/rockchip_drm_vop.h  |  6 +++
>   drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  5 ---
>   drivers/gpu/drm/rockchip/rockchip_vop_reg.c  | 18 +++++++++
>   5 files changed, 73 insertions(+), 12 deletions(-)
> 
