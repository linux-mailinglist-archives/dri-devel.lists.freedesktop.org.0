Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F422C619A96
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 15:53:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB23D10E850;
	Fri,  4 Nov 2022 14:53:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6BA710E845
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 14:53:23 +0000 (UTC)
Received: from notapiano (unknown
 [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E30D9660296D;
 Fri,  4 Nov 2022 14:53:19 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1667573602;
 bh=nbrvVX+UhnvF5ENRV50WNSRNnwQj9Mpuw87bW7JfI+I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RmsC+Pbm32Z7NholMslPUTwJiR3ZxsKjJ9YqNeeVaHHcCt+yRHlyG4Gchb+G+9WTm
 SvtiVAgzvbRerlFy+XawTBAaqFM1Qz2tEtlV7DDFMK60UpO+7ohsviZcinoNuKfL9D
 TFSfF2zL37updpctWSqw15JtPXK5Fg/leqi6oRB56ZVo05pfVUmaSY8lHxN7c4UT+e
 uRg9CRgGSrxtHVmxkvdemaxG6XmTWsorAQVoYIcuWJPuJ2ssuaM/u4RgHTyXIYu5Ud
 ZLUDl6mpbb2UiA6b7zxyL4y0vTdl6T6wJYdtN11V78sI4sdue4rde7cUbQrOrSfQQh
 1GvHl1Lg4r8NA==
Date: Fri, 4 Nov 2022 10:53:15 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Nancy Lin =?utf-8?B?KOael+aso+ieoik=?= <Nancy.Lin@mediatek.com>
Subject: Re: [PATCH v27 6/7] drm/mediatek: add drm ovl_adaptor sub driver for
 MT8195
Message-ID: <20221104145315.hsff6kswyquyscx2@notapiano>
References: <20221103032610.9217-1-nancy.lin@mediatek.com>
 <20221103032610.9217-7-nancy.lin@mediatek.com>
 <20221103212800.43nxlxpconqkasvc@notapiano>
 <82f99ec0d0150d7625e87fe6d5aba58382c8aec4.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <82f99ec0d0150d7625e87fe6d5aba58382c8aec4.camel@mediatek.com>
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
Cc: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>,
 Singo Chang =?utf-8?B?KOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
 "ndesaulniers@google.com" <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nathan@kernel.org" <nathan@kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Yongqiang Niu =?utf-8?B?KOeJm+awuOW8uik=?= <yongqiang.niu@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 04, 2022 at 10:57:28AM +0000, Nancy Lin (林欣螢) wrote:
> Dear Nicolas,
> 
> Thanks for the review.
> 
> On Thu, 2022-11-03 at 17:28 -0400, Nícolas F. R. A. Prado wrote:
> > On Thu, Nov 03, 2022 at 11:26:09AM +0800, Nancy.Lin wrote:
> > > Add drm ovl_adaptor sub driver. Bring up ovl_adaptor sub driver if
> > > the component exists in the path.
> > > 
> > > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > > Reviewed-by: AngeloGioacchino Del Regno <
> > > angelogioacchino.delregno@collabora.com>
> > > Reviewed-by: CK Hu <ck.hu@mediatek.com>
> > > Tested-by: AngeloGioacchino Del Regno <
> > > angelogioacchino.delregno@collabora.com>
> > > Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > > Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> > > Change-Id: I0501f3c80e78ec8279366cba9c137a2edd7a852e
> > > ---
> > >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |  61 ++++-----
> > >  drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |   2 +-
> > >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 129 ++++++++++++--
> > > ------
> > >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  50 +++++++-
> > >  drivers/gpu/drm/mediatek/mtk_drm_drv.c      |  78 ++++++------
> > >  drivers/gpu/drm/mediatek/mtk_drm_drv.h      |  12 +-
> > >  6 files changed, 209 insertions(+), 123 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > > b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > > index 30dcb65d8a5a..ce5617ad04cb 100644
> > > --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > > +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > 
> > [..]
> > >  int mtk_drm_crtc_create(struct drm_device *drm_dev,
> > > -			const enum mtk_ddp_comp_id *path, unsigned int
> > > path_len,
> > > +			const unsigned int *path, unsigned int
> > > path_len,
> > 
> > Hi Nancy,
> > 
> > why is 'enum mtk_ddp_comp_id' being changed to 'unsigned int'
> > throughout this
> > patch? Was this intentional?
> > 
> > I saw that this change happened between v16 [1] and v17 [2], but I
> > didn't see
> > any reply or mention about this in the commit message or cover
> > letter.
> > 
> > Thanks,
> > Nícolas
> > 
> > [1] 
> > https://lore.kernel.org/all/20220318142009.2796-21-nancy.lin@mediatek.com/
> > [2] 
> > https://lore.kernel.org/all/20220416020749.29010-20-nancy.lin@mediatek.com/
> 
> 
> The change is for the review in [1] to expose each mod instead of ovl
> adaptor to mtk_mutex.
> Ovl adaptor is an application that combine these mod to achieve ovl
> function, and it's not a real component in mtk_mmsys/mtk_mutex.
> 
> For the above comment, I discussed the solution with MediaTek DRM
> reviewer CK.Hu internally.
> 1. remove the DDP_COMPONENT_OVL_ADAPTOR in enum mtk_ddp_comp_id{}  (ref
> [2])
> 2. add DRM driver component define "DDP_COMPONENT_DRM_OVL_ADAPTOR" in
> mtk_drm_drv.h (ref[3])
> 3. replace mmsys compoent DDP_COMPONENT_OVL_ADAPTOR with DRM driver
> compoent DDP_COMPONENT_DRM_OVL_ADAPTOR in drm mt8195_mtk_ddp_ext[] path
> array. (ref[3] - mtk_drm_drv.c)
>    
>     static const unsigned int mt8195_mtk_ddp_ext[] = {
> 		DDP_COMPONENT_DRM_OVL_ADAPTOR,
> 		DDP_COMPONENT_MERGE5,
> 		DDP_COMPONENT_DP_INTF1,
>     };
> Because the DDP_COMPONENT_DRM_OVL_ADAPTOR is not a real mmsys
> component, change to use "unsigned int" instead of "enum
> mtk_ddp_comp_id{}"

Ah okay, that makes sense. Thank you for the clarification.

Thanks,
Nícolas

> 
> 
> [1] 
> https://patchwork.kernel.org/project/linux-mediatek/patch/20220318142009.2796-10-nancy.lin@mediatek.com/
> [2] 
> https://patchwork.kernel.org/project/linux-mediatek/patch/20220318142009.2796-5-nancy.lin@mediatek.com/
> [3] 
> https://patchwork.kernel.org/project/linux-mediatek/patch/20221103032610.9217-7-nancy.lin@mediatek.com/
> 
> Thanks,
> Nancy
> 
