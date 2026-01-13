Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FC9D19BD1
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 16:09:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68C9D89BE8;
	Tue, 13 Jan 2026 15:09:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WTX3SZUG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF05889BE8
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 15:09:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6EDB6442F0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 15:09:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FA35C2BC87
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 15:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768316962;
 bh=KyC8m2gNZk/Il4ovB1kZcW+oHe9VDxvW8HZF9tdDjNQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WTX3SZUG7zPMAL/K9CPTvxdWd6aqCodVwqmOJcxbny400qnIhSFE65JxhfXNXdjZu
 QAfbpDw2On0sFHBSUjP/XZDUXuF5/6oPrZxQfCaw06ybz36Paju/rSlqb4SXGV0EQo
 UZv3RMFeTUOB7CmiEKELQ8oq+F2vQZ3BOCKVwLJ9DcmT6LqRL4Z75efpsdCM+Sv7kN
 PoXYOEwicCEvmEg3pC8qk5Vd5ZmKZjhuEIOfYP81E4fDzYCpFn6+bKULclQONxwWJ5
 7cCWDX94ARPFn39C/Mu5y85PRa9K4UnJVXuKQAQgoy0h3BsPjOFJxLzT/finfc1IKV
 slYMGKnuviz0A==
Received: by mail-dl1-f42.google.com with SMTP id
 a92af1059eb24-11dd2370722so4513423c88.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 07:09:22 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXGgFpVNvoc1J7TpbI1G231XWH9I9e2aMo9vCYxyRxB6z7cjDq/b8VSgmmqUMexDnfrrbxxk0Eqcow=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5zmX+1emb1D6NxLU0jx21Y8Kxa2EHG9q4ci2UVM5TpuhCsSiP
 srnkz89vDFsedw4DkatfG6xcMmJVnK3SDhwV6XBn2LOEUVY+VpXIbErRn7E+mtNrgm00V8I9Kjh
 kMaHyNBe8WYgnSk6O8CZSpfYlq4nA8g==
X-Google-Smtp-Source: AGHT+IFr2JrSOF8ImGrFuQ6Mt7qtlmEahJzLOuFXtgPwnDTtKrjT5sC06KbFozJDtkI1nA9O77IBJh+xRW0phqq60hw=
X-Received: by 2002:a05:701a:ca89:b0:11b:9386:7ecd with SMTP id
 a92af1059eb24-121f8b5fb2cmr20413768c88.42.1768316961521; Tue, 13 Jan 2026
 07:09:21 -0800 (PST)
MIME-Version: 1.0
References: <20251223095434.492041-1-abhiraj21put@gmail.com>
In-Reply-To: <20251223095434.492041-1-abhiraj21put@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 13 Jan 2026 15:09:09 +0000
X-Gmail-Original-Message-ID: <CAAOTY__AzbO-ngG=kV4g+=p_69nZnaZGJY4J6kFDWpk=WgzrYQ@mail.gmail.com>
X-Gm-Features: AZwV_QislAgxVUx75N856bughiGkNOwa3NXAa2JYoxiwJw-3BGaLcIXFpUgpuFk
Message-ID: <CAAOTY__AzbO-ngG=kV4g+=p_69nZnaZGJY4J6kFDWpk=WgzrYQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: Convert legacy DRM logging to drm_*
 helpers in mtk_crtc.c
To: Abhishek Rajput <abhiraj21put@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, lkp@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Abhishek Rajput <abhiraj21put@gmail.com> =E6=96=BC 2025=E5=B9=B412=E6=9C=88=
23=E6=97=A5=E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=889:55=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Replace DRM_ERROR() and DRM_DEBUG_DRIVER() calls in
> drivers/gpu/drm/mediatek/mtk_crtc.c with the corresponding drm__err()
> and drm_dbg_driver() helpers.
>
> The drm_*() logging helpers take a struct drm_device * argument,
> allowing the DRM core to prefix log messages with the correct device
> name and instance. This is required to correctly distinguish log
> messages on systems with multiple GPUs.
>
> This change aligns the Mediatek DRM driver with the DRM TODO item:
> "Convert logging to drm_* functions with drm_device parameter".

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes:
> https://lore.kernel.org/oe-kbuild-all/202512220515.z3QybJ8I-lkp@intel.com=
/
> Signed-off-by: Abhishek Rajput <abhiraj21put@gmail.com>
> ---
> v2:
> - Fix unused variable warning when CONFIG_MTK_CMDQ is disabled
> - Added Reported-by and Closes tags
> Link to v1:
> https://lore.kernel.org/all/20251217070303.689913-1-abhiraj21put@gmail.co=
m/
>  drivers/gpu/drm/mediatek/mtk_crtc.c | 22 ++++++++++++++--------
>  1 file changed, 14 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediat=
ek/mtk_crtc.c
> index 991cdb3d7d5f..bca2e40bca54 100644
> --- a/drivers/gpu/drm/mediatek/mtk_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
> @@ -227,11 +227,12 @@ static int mtk_crtc_ddp_clk_enable(struct mtk_crtc =
*mtk_crtc)
>  {
>         int ret;
>         int i;
> +       struct drm_device *dev =3D mtk_crtc->base.dev;
>
>         for (i =3D 0; i < mtk_crtc->ddp_comp_nr; i++) {
>                 ret =3D mtk_ddp_comp_clk_enable(mtk_crtc->ddp_comp[i]);
>                 if (ret) {
> -                       DRM_ERROR("Failed to enable clock %d: %d\n", i, r=
et);
> +                       drm_err(dev, "Failed to enable clock %d: %d\n", i=
, ret);
>                         goto err;
>                 }
>         }
> @@ -343,6 +344,7 @@ static int mtk_crtc_ddp_hw_init(struct mtk_crtc *mtk_=
crtc)
>         struct drm_connector *connector;
>         struct drm_encoder *encoder;
>         struct drm_connector_list_iter conn_iter;
> +       struct drm_device *dev =3D mtk_crtc->base.dev;
>         unsigned int width, height, vrefresh, bpc =3D MTK_MAX_BPC;
>         int ret;
>         int i;
> @@ -371,19 +373,19 @@ static int mtk_crtc_ddp_hw_init(struct mtk_crtc *mt=
k_crtc)
>
>         ret =3D pm_runtime_resume_and_get(crtc->dev->dev);
>         if (ret < 0) {
> -               DRM_ERROR("Failed to enable power domain: %d\n", ret);
> +               drm_err(dev, "Failed to enable power domain: %d\n", ret);
>                 return ret;
>         }
>
>         ret =3D mtk_mutex_prepare(mtk_crtc->mutex);
>         if (ret < 0) {
> -               DRM_ERROR("Failed to enable mutex clock: %d\n", ret);
> +               drm_err(dev, "Failed to enable mutex clock: %d\n", ret);
>                 goto err_pm_runtime_put;
>         }
>
>         ret =3D mtk_crtc_ddp_clk_enable(mtk_crtc);
>         if (ret < 0) {
> -               DRM_ERROR("Failed to enable component clocks: %d\n", ret)=
;
> +               drm_err(dev, "Failed to enable component clocks: %d\n", r=
et);
>                 goto err_mutex_unprepare;
>         }
>
> @@ -648,10 +650,11 @@ static void mtk_crtc_ddp_irq(void *data)
>         struct mtk_drm_private *priv =3D crtc->dev->dev_private;
>
>  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
> +       struct drm_device *dev =3D mtk_crtc->base.dev;
>         if (!priv->data->shadow_register && !mtk_crtc->cmdq_client.chan)
>                 mtk_crtc_ddp_config(crtc, NULL);
>         else if (mtk_crtc->cmdq_vblank_cnt > 0 && --mtk_crtc->cmdq_vblank=
_cnt =3D=3D 0)
> -               DRM_ERROR("mtk_crtc %d CMDQ execute command timeout!\n",
> +               drm_err(dev, "mtk_crtc %d CMDQ execute command timeout!\n=
",
>                           drm_crtc_index(&mtk_crtc->base));
>  #else
>         if (!priv->data->shadow_register)
> @@ -776,9 +779,10 @@ static void mtk_crtc_atomic_enable(struct drm_crtc *=
crtc,
>  {
>         struct mtk_crtc *mtk_crtc =3D to_mtk_crtc(crtc);
>         struct mtk_ddp_comp *comp =3D mtk_crtc->ddp_comp[0];
> +       struct drm_device *dev =3D mtk_crtc->base.dev;
>         int ret;
>
> -       DRM_DEBUG_DRIVER("%s %d\n", __func__, crtc->base.id);
> +       drm_dbg_driver(dev, "%s %d\n", __func__, crtc->base.id);
>
>         ret =3D mtk_ddp_comp_power_on(comp);
>         if (ret < 0) {
> @@ -803,9 +807,10 @@ static void mtk_crtc_atomic_disable(struct drm_crtc =
*crtc,
>  {
>         struct mtk_crtc *mtk_crtc =3D to_mtk_crtc(crtc);
>         struct mtk_ddp_comp *comp =3D mtk_crtc->ddp_comp[0];
> +       struct drm_device *dev =3D mtk_crtc->base.dev;
>         int i;
>
> -       DRM_DEBUG_DRIVER("%s %d\n", __func__, crtc->base.id);
> +       drm_dbg_driver(dev, "%s %d\n", __func__, crtc->base.id);
>         if (!mtk_crtc->enabled)
>                 return;
>
> @@ -845,10 +850,11 @@ static void mtk_crtc_atomic_begin(struct drm_crtc *=
crtc,
>                                                                          =
 crtc);
>         struct mtk_crtc_state *mtk_crtc_state =3D to_mtk_crtc_state(crtc_=
state);
>         struct mtk_crtc *mtk_crtc =3D to_mtk_crtc(crtc);
> +       struct drm_device *dev =3D mtk_crtc->base.dev;
>         unsigned long flags;
>
>         if (mtk_crtc->event && mtk_crtc_state->base.event)
> -               DRM_ERROR("new event while there is still a pending event=
\n");
> +               drm_err(dev, "new event while there is still a pending ev=
ent\n");
>
>         if (mtk_crtc_state->base.event) {
>                 mtk_crtc_state->base.event->pipe =3D drm_crtc_index(crtc)=
;
> --
> 2.34.1
>
