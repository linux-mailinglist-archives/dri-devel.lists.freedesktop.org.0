Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B128839269
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 16:16:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE70C10F37E;
	Tue, 23 Jan 2024 15:16:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3341C10F37E
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 15:16:23 +0000 (UTC)
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi
 [89.27.53.110])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 75847BEB;
 Tue, 23 Jan 2024 16:15:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1706022908;
 bh=2FhW9gTePfaDvmlTVNZYpdZiCIBNlL9w99OhMpgdvfw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UddWVSR6bIs3iFwxw8o2Tsn1HSBMpOIAdYPwGp7EnJZigXRL2QL7Dp+pjmm4fxswX
 tSFyEPhSI7RKp0ipqGjRP9e94/rQmDmmRbzLfJP9tHRK0oFoYxHZo3t0FTDILmg/RV
 YzcVhLp8Jv09g0hbnj7GYpbWhjT4xAQOLanAt4Ng=
Date: Tue, 23 Jan 2024 17:16:20 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: Re: [PATCH 2/5] drm/bridge: simple-bridge: Extend match support for
 non-DT based systems
Message-ID: <20240123151620.GN10679@pendragon.ideasonboard.com>
References: <20240122163220.110788-1-sui.jingfeng@linux.dev>
 <20240122163220.110788-3-sui.jingfeng@linux.dev>
 <20240123012139.GD22880@pendragon.ideasonboard.com>
 <95a7a0b2-615d-49ca-b568-1376a35493c4@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <95a7a0b2-615d-49ca-b568-1376a35493c4@linux.dev>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 23, 2024 at 04:20:04PM +0800, Sui Jingfeng wrote:
> On 2024/1/23 09:21, Laurent Pinchart wrote:
> > On Tue, Jan 23, 2024 at 12:32:17AM +0800, Sui Jingfeng wrote:
> >> Which is intended to be used on non-DT environment, where the simple-bridge
> >> platform device is created by either the display controller driver side or
> >> platform firmware subsystem.
> >
> > Could you give an example of a platform where you intend to use this ?
> 
> For example:
> 
> 1) USB based display adapter, such as FL2000DX[1] which use
>     the it66121 HDMI transmitter to convert the RGB888 to HDMI.
> 
> 2) Simple 2D PCIe display controller, such as SM750(EMPV-1201)
>     which using sii9022 HDMI transmitter to convert the RGB888
>     to HDMI.
> 
> 3) Some FPGA PCIe Board (sil9136)
> 
> 4) Be able to run unit test of drm bridges on X86.

Thank you, those are useful examples. It would be nice to capture at
least some of them (first instance the first two) to the commit message.

> [1] https://github.com/FrescoLogic/FL2000

-- 
Regards,

Laurent Pinchart
