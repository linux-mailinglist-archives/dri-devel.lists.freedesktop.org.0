Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9C61A120E
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 18:50:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D84DC6E116;
	Tue,  7 Apr 2020 16:50:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6740C6E116
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 16:50:08 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 7955A80539;
 Tue,  7 Apr 2020 18:50:03 +0200 (CEST)
Date: Tue, 7 Apr 2020 18:50:02 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 00/10] Set up generic fbdev after registering device
Message-ID: <20200407165002.GC2220@ravnborg.org>
References: <20200406134405.6232-1-tzimmermann@suse.de>
 <879068d4-3920-b8ee-2a3c-6cd4fe9d9f88@tronnes.org>
 <eedb5061-56b5-d8c8-6cfa-0ead5e65aaff@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <eedb5061-56b5-d8c8-6cfa-0ead5e65aaff@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=VwQbUJbxAAAA:8
 a=SJz97ENfAAAA:8 a=eNWDtqN9bXa1qs2-eqwA:9 a=CjuIK1q_8ugA:10
 a=AjGcO6oz07-iQ99wixmX:22 a=vFet0B0WnEQeilDPIY6i:22
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, paul@crapouillou.net,
 kraxel@redhat.com, emil.velikov@collabora.com, xinliang.liu@linaro.org,
 kong.kongxinwei@hisilicon.com, tomi.valkeinen@ti.com, chunkuang.hu@kernel.org,
 puck.chen@hisilicon.com, hdegoede@redhat.com, jsarha@ti.com,
 matthias.bgg@gmail.com, sean@poorly.run, zourongrong@gmail.com,
 tiantao6@hisilicon.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas/Noralf.

> > Having DRM core take care of fbdev emulation was an idea Laurent had
> > which was the spark that set me off making the generic fbdev emulation.
> > 
> > Maybe it's still too early to make this move, I don't know.
> 
> I think we should wait a bit. As you mentioned, there are drivers that
> have an fbdev bpp that differs from the preferred one. There might also
> be a chicken-and-egg problem with core and fb-helper modules.

Noralf - you had analyzed what drivers are (yet) to migrate to
to the common fbdev emulation.
Link: https://lore.kernel.org/dri-devel/34e654ae-0cc9-e393-ac02-e4ac6eda60f6@tronnes.org/

rmada
gma500
amd
omapdrm
nouveau
i915
msm
tegra
exynos
radeon
rockchip

Maybe add this list to todo.rst - and if someone knows about it
we could have a small description what is required before a
driver can migrate.
I can cook up the patch if anyone thinks this is useful.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
