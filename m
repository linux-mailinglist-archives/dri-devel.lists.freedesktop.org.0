Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 557E16D988A
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 15:48:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F124710EBC9;
	Thu,  6 Apr 2023 13:48:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1772 seconds by postgrey-1.36 at gabe;
 Thu, 06 Apr 2023 13:48:27 UTC
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 631DB10E65B
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 13:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dYajvoSz9BCuEjUuA1bEd6STrE3vvvgmYvn865RokJs=; b=bTBruZ/qcn/IkL+g5mQk/A5YGA
 Yzya0k/UueXeFpdrXki11tH24TrWU4OjwmPJN8zIPR0qXibsEiEg6L5vtbb+FY5eRfL6ABGbaT2Xm
 Iu0xPpGhQvSjI5rfr6Pu3UXttVcqgIQixJyET1VRA1g23yxci3ISl0mnSycUKG+T8XDdlxZUOvwzW
 YY+brnOn7jToXq6eLBj0vm4UrNb+xXNmZvV9sXN84qxAYAEI1cp3z6hQ7sOOnpYcbaT34IqBJqBkz
 OSKAhZZ2HAq2GP1e8c3PW1T1B7rCurGJgRf3lkwyuBQiHE88nR8oKM6+YO7mbU/aO+8rMdwOTD3Cd
 jGV8RDRA==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=[192.168.1.10]) by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <cyndis@kapsi.fi>)
 id 1pkPVm-00Fcs2-FE; Thu, 06 Apr 2023 16:18:46 +0300
Message-ID: <561c74a9-8fdf-568f-f5f2-d0c80d651ce0@kapsi.fi>
Date: Thu, 6 Apr 2023 16:18:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [GIT PULL] drm/tegra: Changes for v6.4-rc1
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>
References: <20230406121404.967704-1-thierry.reding@gmail.com>
 <ZC7EnnQZ0LBpC/cV@phenom.ffwll.local>
From: Mikko Perttunen <cyndis@kapsi.fi>
In-Reply-To: <ZC7EnnQZ0LBpC/cV@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/6/23 16:09, Daniel Vetter wrote:
> On Thu, Apr 06, 2023 at 02:14:04PM +0200, Thierry Reding wrote:
>> Hi Dave, Daniel,
>>
>> The following changes since commit e8d018dd0257f744ca50a729e3d042cf2ec9da65:
>>
>>    Linux 6.3-rc3 (2023-03-19 13:27:55 -0700)
>>
>> are available in the Git repository at:
>>
>>    https://gitlab.freedesktop.org/drm/tegra.git tags/drm/tegra/for-6.4-rc1
>>
>> for you to fetch changes up to 2429b3c529da29d4277d519bd66d034842dcd70c:
>>
>>    drm/tegra: Avoid potential 32-bit integer overflow (2023-04-06 14:02:33 +0200)
>>
>> Thanks,
>> Thierry
>>
>> ----------------------------------------------------------------
>> drm/tegra: Changes for v6.4-rc1
>>
>> The majority of this is minor cleanups and fixes. Other than those, this
>> contains Uwe's conversion to the new driver remove callback and Thomas'
>> fbdev DRM client conversion. The driver can now also be built on other
>> architectures to easy compile coverage.
> 
> Neat cleanup on top might be too look at the generic fbdev stuff, just as
> an idea.
> 
>> Finally, this adds Mikko as a second maintainer for the driver. As a
>> next step we also want Tegra DRM to move into drm-misc to streamline the
>> maintenance process.
> 
> Amusingly the one patch that dim flagged as lacking a 2nd set of eyes (no
> a-b/rb or committer!=author) is the MAINTAINERS patch, would have been
> good to record Mikko's ack for getting volunteered :-)

Haha, admittedly I was a bit surprised to see myself being added to 
MAINTAINERS so quickly after talking about it with Thierry; but yes, I 
submit myself to the duty :)

Cheers,
Mikko

> 
> Anyway all good, pulled, thanks!
> 
>>
>> ----------------------------------------------------------------
>> Cai Huoqing (3):
>>        drm/tegra: sor: Make use of the helper function dev_err_probe()
>>        drm/tegra: dsi: Make use of the helper function dev_err_probe()
>>        drm/tegra: plane: Improve use of dev_err_probe()
>>
>> Christian König (2):
>>        drm/tegra: Allow compile test on !ARM v2
>>        drm/tegra: Fix another missing include
>>
>> Deepak R Varma (1):
>>        drm/tegra: sor: Remove redundant error logging
>>
>> Diogo Ivo (1):
>>        drm/tegra: dsi: Clear enable register if powered by bootloader
>>
>> Lee Jones (1):
>>        drm/tegra: dc: Remove set but unused variable 'state'
>>
>> Mikko Perttunen (1):
>>        gpu: host1x: Don't rely on dma_fence_wait_timeout return value
>>
>> Nur Hussein (1):
>>        drm/tegra: Avoid potential 32-bit integer overflow
>>
>> Thierry Reding (1):
>>        MAINTAINERS: Add Mikko as backup maintainer for Tegra DRM
>>
>> Thomas Zimmermann (7):
>>        drm/tegra: Include <linux/of.h>
>>        drm/tegra: Include <linux/i2c.h>
>>        drm/tegra: Removed fb from struct tegra_fbdev
>>        drm/tegra: Remove struct tegra_fbdev
>>        drm/tegra: Hide fbdev support behind config option
>>        drm/tegra: Initialize fbdev DRM client
>>        drm/tegra: Implement fbdev emulation as in-kernel client
>>
>> Uwe Kleine-König (12):
>>        gpu: host1x: Make host1x_client_unregister() return void
>>        drm/tegra: rgb: Make tegra_dc_rgb_remove() return void
>>        drm/tegra: dc: Convert to platform remove callback returning void
>>        drm/tegra: dpaux: Convert to platform remove callback returning void
>>        drm/tegra: dsi: Convert to platform remove callback returning void
>>        drm/tegra: gr2d: Convert to platform remove callback returning void
>>        drm/tegra: gr3d: Convert to platform remove callback returning void
>>        drm/tegra: hdmi: Convert to platform remove callback returning void
>>        drm/tegra: hub: Convert to platform remove callback returning void
>>        drm/tegra: nvdec: Convert to platform remove callback returning void
>>        drm/tegra: sor: Convert to platform remove callback returning void
>>        drm/tegra: vic: Convert to platform remove callback returning void
>>
>> Yang Yingliang (2):
>>        gpu: host1x: Fix potential double free if IOMMU is disabled
>>        gpu: host1x: Fix memory leak of device names
>>
>> Ye Xingchen (1):
>>        gpu: host1x: mipi: Use devm_platform_get_and_ioremap_resource()
>>
>>   MAINTAINERS                             |   1 +
>>   drivers/gpu/drm/tegra/Kconfig           |   2 +-
>>   drivers/gpu/drm/tegra/Makefile          |   2 +
>>   drivers/gpu/drm/tegra/dc.c              |  22 +--
>>   drivers/gpu/drm/tegra/dc.h              |   2 +-
>>   drivers/gpu/drm/tegra/dpaux.c           |   6 +-
>>   drivers/gpu/drm/tegra/drm.c             |  23 +--
>>   drivers/gpu/drm/tegra/drm.h             |  27 ++--
>>   drivers/gpu/drm/tegra/dsi.c             |  51 ++++---
>>   drivers/gpu/drm/tegra/fb.c              | 242 +-------------------------------
>>   drivers/gpu/drm/tegra/fbdev.c           | 241 +++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/tegra/gem.c             |   1 +
>>   drivers/gpu/drm/tegra/gr2d.c            |  14 +-
>>   drivers/gpu/drm/tegra/gr3d.c            |  14 +-
>>   drivers/gpu/drm/tegra/hdmi.c            |  14 +-
>>   drivers/gpu/drm/tegra/hub.c             |  13 +-
>>   drivers/gpu/drm/tegra/nvdec.c           |  14 +-
>>   drivers/gpu/drm/tegra/output.c          |   3 +
>>   drivers/gpu/drm/tegra/plane.c           |  16 +--
>>   drivers/gpu/drm/tegra/rgb.c             |   7 +-
>>   drivers/gpu/drm/tegra/sor.c             |  44 ++----
>>   drivers/gpu/drm/tegra/vic.c             |  14 +-
>>   drivers/gpu/host1x/Kconfig              |   2 +-
>>   drivers/gpu/host1x/bus.c                |   6 +-
>>   drivers/gpu/host1x/context.c            |  24 ++--
>>   drivers/gpu/host1x/mipi.c               |   4 +-
>>   drivers/gpu/host1x/syncpt.c             |   8 +-
>>   drivers/staging/media/tegra-video/csi.c |   8 +-
>>   drivers/staging/media/tegra-video/vi.c  |   8 +-
>>   include/linux/host1x.h                  |   2 +-
>>   30 files changed, 370 insertions(+), 465 deletions(-)
>>   create mode 100644 drivers/gpu/drm/tegra/fbdev.c
> 

