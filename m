Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EA469B167
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 17:52:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5A4010F07F;
	Fri, 17 Feb 2023 16:52:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41AAE10E1B1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 16:52:01 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id l23so1302278qtj.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 08:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
 :user-agent:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+lujNOKm++OPcngOcRGWEnMWSJ9dfFfJMQ8v/5cWU2M=;
 b=ngjtQMSncLTvKcktN401ducOT2ym3TeRYm/owld99p8jhnZImVtVzULGekSPv1UXIm
 OYUR+6zJLcoqpQ3SK1+YGsYOZGHP7G06I+dVyn3eFXymFBlYubmrqDyWr0h5EipMf5Fb
 8vHSWYytKku+pDEhg8TeJaA2A8Phn3t2WIoy1UR6NLgN0A8zMeAfpUlRnciC2NiGEInq
 iTaBzZkiiiuvuAYcSUkHc8VwnUhyV9l2/uv9aQu/k7ieEX2bPdWyWqKLchl91l8rhKxg
 FxGFGIqpdJREmO+/gXFcYffV8BBAnaQyB3xMz3/Xp7Vu1HBmgF8WO2TTADjYA8Yaeduc
 jaUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
 :user-agent:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+lujNOKm++OPcngOcRGWEnMWSJ9dfFfJMQ8v/5cWU2M=;
 b=nfa8837mE8gBAxHx1eyyRjxr9gbJfdASeJRBylHshllVkP/12DOdmXrzsv80taeQ3j
 nbtdP4x4W0PxXe0swvlc+8eA6QVKKNgYgLsXyVxJp5bgxihhYZaT+Pnr0yOLHTVEumYK
 TLmDcMto777v9TfOEsWlQ9CkFW8VxyyMvK/4wg27ElHzmohb/F/YZQIjmzBhITrNPCf3
 wEt4M6sALOD6NbZoMSF3sNzaAfMBAWHzHg8CQzKr68nejyogqcRdHGXOfS3/kQNEn6Gj
 y9ndklBZXpcsluUBcb3d8SsPfMBZ+nc/33NV5bY3h1wyMGZc9gvPVfJArLgoVF1iU4db
 EsQA==
X-Gm-Message-State: AO0yUKUTuFz2jed5NOouJ72/ko+qRfj+jWt4IArCZpVG/2aDEMXMVHko
 A/NsErGxCXtahzbBsrQoo2t5L8u2v8Icfsaoxyu7Kw==
X-Google-Smtp-Source: AK7set+fHsj9+KPNXoSNbR9V4av/+GsFWw2XClP2/z4uYd0e4fwI9/unNMmK0pPDEJ42UCz43Q3TPjOpjzE9S+/9Y9E=
X-Received: by 2002:a05:622a:1f98:b0:3ba:1506:f2 with SMTP id
 cb24-20020a05622a1f9800b003ba150600f2mr963995qtb.2.1676652720158; Fri, 17 Feb
 2023 08:52:00 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 17 Feb 2023 08:51:59 -0800
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20221227081011.6426-1-nancy.lin@mediatek.com>
 <20221227081011.6426-5-nancy.lin@mediatek.com>
In-Reply-To: <20221227081011.6426-5-nancy.lin@mediatek.com>
MIME-Version: 1.0
Date: Fri, 17 Feb 2023 08:51:59 -0800
Message-ID: <CABnWg9s1L2Gk5EfNW22HUJVTCnFyo+YvrjQL16XqyLYEf20Fyg@mail.gmail.com>
Subject: Re: [PATCH v29 4/7] drm/mediatek: add dma dev get function
To: linux-mediatek@lists.infradead.org, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, krzysztof.kozlowski+dt@linaro.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 David Airlie <airlied@linux.ie>, singo.chang@mediatek.com,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 clang-built-linux@googlegroups.com, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 27 Dec 2022 09:10, "" wrote:
>This is a preparation for adding support for the ovl_adaptor sub driver
>Ovl_adaptor is a DRM sub driver, which doesn't have dma dev. Add
>dma_dev_get function for getting representative dma dev in ovl_adaptor.
>
>Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
>Reviewed-by: AngeloGioachino Del Regno <angelogioacchino.delregno@collabora.com>
>Reviewed-by: CK Hu <ck.hu@mediatek.com>
>Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
>---
> drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 15 +++++++++++++++
> drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |  1 +
> drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  8 ++++++++
> 3 files changed, 24 insertions(+)
>
>diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
>index 112615817dcb..78e20f604158 100644
>--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
>+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
>@@ -58,6 +58,7 @@ struct mtk_drm_crtc {
> #endif
>
> 	struct device			*mmsys_dev;
>+	struct device			*dma_dev;
> 	struct mtk_mutex		*mutex;
> 	unsigned int			ddp_comp_nr;
> 	struct mtk_ddp_comp		**ddp_comp;
>@@ -865,6 +866,13 @@ static int mtk_drm_crtc_init_comp_planes(struct drm_device *drm_dev,
> 	return 0;
> }
>
>+struct device *mtk_drm_crtc_dma_dev_get(struct drm_crtc *crtc)
>+{
>+	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
>+
>+	return mtk_crtc->dma_dev;
>+}

While testing out the HDMI patchset for i1200, I've ended up with a
panic here with crtc being NULL.

I've fixed the issue on my side by testing crtc prior doing anything
in that function.

Not sure this is the proper fix.

HTH,
Guillaume.

>+
> int mtk_drm_crtc_create(struct drm_device *drm_dev,
> 			const enum mtk_ddp_comp_id *path, unsigned int path_len)
> {
>@@ -953,6 +961,13 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
> 			return ret;
> 	}
>
>+	/*
>+	 * Default to use the first component as the dma dev.
>+	 * In the case of ovl_adaptor sub driver, it needs to use the
>+	 * dma_dev_get function to get representative dma dev.
>+	 */
>+	mtk_crtc->dma_dev = mtk_ddp_comp_dma_dev_get(&priv->ddp_comp[path[0]]);
>+
> 	ret = mtk_drm_crtc_init(drm_dev, mtk_crtc, pipe);
> 	if (ret < 0)
> 		return ret;
>diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
>index cb9a36c48d4f..f5a6e80c5265 100644
>--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
>+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
>@@ -22,5 +22,6 @@ int mtk_drm_crtc_plane_check(struct drm_crtc *crtc, struct drm_plane *plane,
> 			     struct mtk_plane_state *state);
> void mtk_drm_crtc_async_update(struct drm_crtc *crtc, struct drm_plane *plane,
> 			       struct drm_atomic_state *plane_state);
>+struct device *mtk_drm_crtc_dma_dev_get(struct drm_crtc *crtc);
>
> #endif /* MTK_DRM_CRTC_H */
>diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
>index 2d0052c23dcb..364f3f7f59fa 100644
>--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
>+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
>@@ -71,6 +71,7 @@ struct mtk_ddp_comp_funcs {
> 	void (*bgclr_in_off)(struct device *dev);
> 	void (*ctm_set)(struct device *dev,
> 			struct drm_crtc_state *state);
>+	struct device * (*dma_dev_get)(struct device *dev);
> };
>
> struct mtk_ddp_comp {
>@@ -203,6 +204,13 @@ static inline void mtk_ddp_ctm_set(struct mtk_ddp_comp *comp,
> 		comp->funcs->ctm_set(comp->dev, state);
> }
>
>+static inline struct device *mtk_ddp_comp_dma_dev_get(struct mtk_ddp_comp *comp)
>+{
>+	if (comp->funcs && comp->funcs->dma_dev_get)
>+		return comp->funcs->dma_dev_get(comp->dev);
>+	return comp->dev;
>+}
>+
> int mtk_ddp_comp_get_id(struct device_node *node,
> 			enum mtk_ddp_comp_type comp_type);
> unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
>--
>2.18.0
>
>
