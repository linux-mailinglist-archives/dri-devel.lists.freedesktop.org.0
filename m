Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 138BB94803B
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 19:25:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4695910E062;
	Mon,  5 Aug 2024 17:25:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.b="P5TynTB2";
	dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="UKNdfPz5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 4502 seconds by postgrey-1.36 at gabe;
 Mon, 05 Aug 2024 17:25:47 UTC
Received: from mailrelay2-1.pub.mailoutpod3-cph3.one.com
 (mailrelay2-1.pub.mailoutpod3-cph3.one.com [46.30.211.241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89DE510E062
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2024 17:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=+5Nqfb5YMT710AixtVrDNejxP1ehFhKM5L8ir5PhOc4=;
 b=P5TynTB2vYXkyWW9AxFtX6wfXMCj/viurWyva9HvodEpuYxqbrJMfHki3ou0cS/wYn4QM4yYfRYQl
 gVieja8w8qfSx1+VvFKsTKXBTX8U3yEOKZzzWr5pDiaC6yMmZj128pd3PzNgdGkCAudi8zftk0vWlA
 p/k7vR/AUL5uIOKXiKL5Omt9ecsZe0EC1bv3OmrzEodD/9sN2PTXGdw3C8HbpIi2KeQ+yLxRJ9r8Yc
 Bi9o3a30KAxyRLHdfwjlvza3dsDVxgvZwTOctcLv86xkADw2NW98ShvtccqbuGnSRWAq34sHmm9CZA
 Un2n9sdBEwPEr8K9QLhPUBOLIJO9gcQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=+5Nqfb5YMT710AixtVrDNejxP1ehFhKM5L8ir5PhOc4=;
 b=UKNdfPz5q5F+W05u/qk0wulGt/VdSbndLOPsd7/bH/pK4Qlr6WtgaXIwA5JYeod5Y0rJqux/vXvcR
 xsK+trnDQ==
X-HalOne-ID: 1e9ebc3d-5345-11ef-a8e9-7155eb331864
Received: from ravnborg.org (2-105-16-150-cable.dk.customer.tdc.net
 [2.105.16.150])
 by mailrelay2.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
 id 1e9ebc3d-5345-11ef-a8e9-7155eb331864;
 Mon, 05 Aug 2024 16:09:42 +0000 (UTC)
Date: Mon, 5 Aug 2024 18:09:41 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Robert Foss <rfoss@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] drm/bridge: lt9611uxc: require
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Message-ID: <20240805160941.GA136880@ravnborg.org>
References: <20240701-lt9611uxc-next-bridge-v1-0-665bce5fdaaa@linaro.org>
 <CAN6tsi5=VmahLzVYEYfp6TAe=w5pB7hgaEy1SN55s7fsUkyoLg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAN6tsi5=VmahLzVYEYfp6TAe=w5pB7hgaEy1SN55s7fsUkyoLg@mail.gmail.com>
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

Hi Robert,
On Tue, Jul 30, 2024 at 01:35:36PM +0200, Robert Foss wrote:
> On Mon, Jul 1, 2024 at 8:20 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > There are no in-kernel DTs that use Lontium LT9611UXC bridge and still
> > require creation of the drm_connector by the bridge on attachment.
> > Drop support for !DRM_BRIDGE_ATTACH_NO_CONNECTOR by the driver.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Dmitry Baryshkov (2):
> >       drm/bridge: lt9611uxc: properly attach to a next bridge
> >       drm/bridge: lt9611uxc: drop support for !DRM_BRIDGE_ATTACH_NO_CONNECTOR
> >
> >  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 103 ++++-------------------------
> >  1 file changed, 12 insertions(+), 91 deletions(-)
> > ---
> > base-commit: 74564adfd3521d9e322cfc345fdc132df80f3c79
> > change-id: 20240625-lt9611uxc-next-bridge-5827d9b17fc1
> >
> > Best regards,
> > --
> > Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> >
> 
> Snoozing this for 2 weeks, since it is removing functionality.
Time to un-snooze?

	Sam
