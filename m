Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CACD08B52
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 11:52:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50F3610E897;
	Fri,  9 Jan 2026 10:52:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="F2KAnBkX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85F8410E897
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 10:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=dvijv8uUpBbSdpjrMPdUmY9MqFhbG/70BQyKWf7xOy0=; b=F2KAnBkXKhmjoyFSFhoLcIB1UY
 YlCl4a0i0k1Wkn2OjubQVUv8d7+hFouwIXlum5Ezf2sRdpqCkY8IyXh0PAwQcPZ1lirsjgoijnPkg
 1pnRsYycmZl6sPlJvGAOtI1QTl0QWfPUJELoUVkF8jbjK8Wep1cjWOkuH7JZMtaCOaNo6IdJTW020
 vI9Ar+E61U5+tYIOtA9SmMJTfulOUDICm70jtb7QlkyM6HWXmtRrm8KoQAvx2lzFj1/5ES7gMncuS
 v+NyVWPBuD/5gg0Uxq4wJLYzLzWu54FHveuh1SX8T+XioojSCo6JGN0KAfVhBjDbb2CWVbEw5wbk0
 kb4WV4Dw==;
Received: from i53875b6d.versanet.de ([83.135.91.109] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1veA5t-001cZG-Ra; Fri, 09 Jan 2026 11:51:50 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Chaoyi Chen <kernel@airkyi.com>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 8/9] drm/rockchip: Drop ROCKCHIP_IOMMU depend for
 DRM_ROCKCHIP
Date: Fri, 09 Jan 2026 11:51:49 +0100
Message-ID: <2629918.TLnPLrj5Ze@diego>
In-Reply-To: <4e01f121-1912-4897-98e8-cb543a501707@rock-chips.com>
References: <20251106020632.92-1-kernel@airkyi.com> <4072834.X9hSmTKtgW@phil>
 <4e01f121-1912-4897-98e8-cb543a501707@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

Hi,

Am Freitag, 9. Januar 2026, 02:26:00 Mitteleurop=C3=A4ische Normalzeit schr=
ieb Chaoyi Chen:
> On 1/9/2026 3:03 AM, Heiko Stuebner wrote:
> > Am Donnerstag, 6. November 2025, 03:06:31 Mitteleurop=C3=A4ische Normal=
zeit schrieb Chaoyi Chen:
> >> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> >>
> >> On the RK3506 platform, there is no iommu hardware. And even on
> >> platform that have iommu hardware, it should be possible to use
> >> VOP without enabling iommu. In this case, a contiguous memory
> >> space like CMA should be used.
> >>
> >> So this patch removes the dependency on ROCKCHIP_IOMMU.
> >>
> >> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> >> ---
> >>  drivers/gpu/drm/rockchip/Kconfig | 3 ++-
> >>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockch=
ip/Kconfig
> >> index b7b025814e72..a056d419190c 100644
> >> --- a/drivers/gpu/drm/rockchip/Kconfig
> >> +++ b/drivers/gpu/drm/rockchip/Kconfig
> >> @@ -1,7 +1,8 @@
> >>  # SPDX-License-Identifier: GPL-2.0-only
> >>  config DRM_ROCKCHIP
> >>  	tristate "DRM Support for Rockchip"
> >> -	depends on DRM && ROCKCHIP_IOMMU
> >> +	depends on DRM
> >> +	depends on ROCKCHIP_IOMMU || !ROCKCHIP_IOMMU
> >=20
> > I don't really understand this yes+no line :-)
> >=20
> > Can't you just
> > - drop the dependency altogether
> > or
> > - do a depends on ROCKCHIP_IOMMU if ARM64
> >=20
> >
>=20
> This trick is called optional-dependencies [0]. In addition to the=20
> familiar depends on ROCKCHIP_IOMMU part, the newly added !ROCKCHIP_IOMMU
> ensures that DRM_ROCKCHIP can still be built even when ROCKCHIP_IOMMU
> is not build.
>=20
> [0]: https://docs.kernel.org/kbuild/kconfig-language.html#optional-depend=
encies

thanks a lot for pointing me to this nifty feature :-)

Heiko


