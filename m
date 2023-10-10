Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A4F7BF057
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 03:34:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB74910E30B;
	Tue, 10 Oct 2023 01:33:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FC5610E30B
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 01:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1696901628;
 bh=mZxda45LSjxRlWdtqkpi6JYNGMZ5G2NJZ3ktd0qA/V4=;
 h=Date:From:To:Cc:Subject:From;
 b=E0TLdRRAPRiKWzXfCCSp+m93yqyS+Q5LMghXvLWiV6YYmGFpPCDx6B3+Pt+yYU6TI
 ZJd5/Q/NQFdxdo6ti+a5Ibd+PWWr8TbdDWgi+uZbprOLG6pNv5zzqBC/8MPzoBtw8U
 3FZCfnhGVkZMK8s5igoHtSiUIyb3NOJEYKtM3+239saqTRDQxdSpgkI19xFw4vNGXs
 ULTHTy4QKpNWBMPljaXEi0foUG17siqFXMKv9sGzVkzo4lcPUPU+ZSyNPeJAycChUF
 DDIQQgcowNSNmm3iDLO35FCaBoSKj2ux7qMjdAmMMQiCa7hJX4v8imYlI1ty0fFKh+
 inLmp/zTmPL9A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4S4JMZ2ST8z4xSn;
 Tue, 10 Oct 2023 12:33:46 +1100 (AEDT)
Date: Tue, 10 Oct 2023 12:33:45 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>, Dave Airlie <airlied@redhat.com>
Subject: linux-next: manual merge of the drm-msm tree with the mm, drm trees
Message-ID: <20231010123345.12bfda28@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rWDVrW2M2hR+XA_N0lP.=mV";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Rob Clark <robdclark@chromium.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Qi Zheng <zhengqi.arch@bytedance.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/rWDVrW2M2hR+XA_N0lP.=mV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

FIXME: Add owner of second tree to To:
       Add author(s)/SOB of conflicting commits.

Today's linux-next merge of the drm-msm tree got conflicts in:

  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
  drivers/gpu/drm/msm/msm_drv.c

between commits:

  01790d5e372f ("drm/msm: Convert to platform remove callback returning voi=
d")
  cd61a76c210a ("drm/msm: dynamically allocate the drm-msm_gem shrinker")

from the mm, drm trees and commits:

  283add3e6405 ("drm/msm: remove shutdown callback from msm_platform_driver=
")
  506efcba3129 ("drm/msm: carve out KMS code from msm_drv.c")

from the drm-msm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 82381d12414d,d14ae316796c..000000000000
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@@ -1299,12 -1230,72 +1230,70 @@@ static int dpu_kms_init(struct drm_devi
 =20
  static int dpu_dev_probe(struct platform_device *pdev)
  {
- 	return msm_drv_probe(&pdev->dev, dpu_kms_init);
+ 	struct device *dev =3D &pdev->dev;
+ 	struct dpu_kms *dpu_kms;
+ 	int irq;
+ 	int ret =3D 0;
+=20
+ 	dpu_kms =3D devm_kzalloc(dev, sizeof(*dpu_kms), GFP_KERNEL);
+ 	if (!dpu_kms)
+ 		return -ENOMEM;
+=20
+ 	dpu_kms->pdev =3D pdev;
+=20
+ 	ret =3D devm_pm_opp_set_clkname(dev, "core");
+ 	if (ret)
+ 		return ret;
+ 	/* OPP table is optional */
+ 	ret =3D devm_pm_opp_of_add_table(dev);
+ 	if (ret && ret !=3D -ENODEV)
+ 		return dev_err_probe(dev, ret, "invalid OPP table in device tree\n");
+=20
+ 	ret =3D devm_clk_bulk_get_all(&pdev->dev, &dpu_kms->clocks);
+ 	if (ret < 0)
+ 		return dev_err_probe(dev, ret, "failed to parse clocks\n");
+=20
+ 	dpu_kms->num_clocks =3D ret;
+=20
+ 	irq =3D platform_get_irq(pdev, 0);
+ 	if (irq < 0)
+ 		return dev_err_probe(dev, irq, "failed to get irq\n");
+=20
+ 	dpu_kms->base.irq =3D irq;
+=20
+ 	dpu_kms->mmio =3D msm_ioremap(pdev, "mdp");
+ 	if (IS_ERR(dpu_kms->mmio)) {
+ 		ret =3D PTR_ERR(dpu_kms->mmio);
+ 		DPU_ERROR("mdp register memory map failed: %d\n", ret);
+ 		dpu_kms->mmio =3D NULL;
+ 		return ret;
+ 	}
+ 	DRM_DEBUG("mapped dpu address space @%pK\n", dpu_kms->mmio);
+=20
+ 	dpu_kms->vbif[VBIF_RT] =3D msm_ioremap(pdev, "vbif");
+ 	if (IS_ERR(dpu_kms->vbif[VBIF_RT])) {
+ 		ret =3D PTR_ERR(dpu_kms->vbif[VBIF_RT]);
+ 		DPU_ERROR("vbif register memory map failed: %d\n", ret);
+ 		dpu_kms->vbif[VBIF_RT] =3D NULL;
+ 		return ret;
+ 	}
+=20
+ 	dpu_kms->vbif[VBIF_NRT] =3D msm_ioremap_quiet(pdev, "vbif_nrt");
+ 	if (IS_ERR(dpu_kms->vbif[VBIF_NRT])) {
+ 		dpu_kms->vbif[VBIF_NRT] =3D NULL;
+ 		DPU_DEBUG("VBIF NRT is not defined");
+ 	}
+=20
+ 	ret =3D dpu_kms_parse_data_bus_icc_path(dpu_kms);
+ 	if (ret)
+ 		return ret;
+=20
+ 	return msm_drv_probe(&pdev->dev, dpu_kms_init, &dpu_kms->base);
  }
 =20
 -static int dpu_dev_remove(struct platform_device *pdev)
 +static void dpu_dev_remove(struct platform_device *pdev)
  {
  	component_master_del(&pdev->dev, &msm_drm_ops);
 -
 -	return 0;
  }
 =20
  static int __maybe_unused dpu_runtime_suspend(struct device *dev)
@@@ -1380,8 -1371,8 +1369,8 @@@ MODULE_DEVICE_TABLE(of, dpu_dt_match)
 =20
  static struct platform_driver dpu_driver =3D {
  	.probe =3D dpu_dev_probe,
 -	.remove =3D dpu_dev_remove,
 +	.remove_new =3D dpu_dev_remove,
- 	.shutdown =3D msm_drv_shutdown,
+ 	.shutdown =3D msm_kms_shutdown,
  	.driver =3D {
  		.name =3D "msm_dpu",
  		.of_match_table =3D dpu_dt_match,
diff --cc drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index e5012fa6771f,982b7689e5b6..000000000000
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@@ -557,12 -507,60 +507,58 @@@ static const struct dev_pm_ops mdp4_pm_
 =20
  static int mdp4_probe(struct platform_device *pdev)
  {
- 	return msm_drv_probe(&pdev->dev, mdp4_kms_init);
+ 	struct device *dev =3D &pdev->dev;
+ 	struct mdp4_kms *mdp4_kms;
+ 	int irq;
+=20
+ 	mdp4_kms =3D devm_kzalloc(dev, sizeof(*mdp4_kms), GFP_KERNEL);
+ 	if (!mdp4_kms)
+ 		return dev_err_probe(dev, -ENOMEM, "failed to allocate kms\n");
+=20
+ 	mdp4_kms->mmio =3D msm_ioremap(pdev, NULL);
+ 	if (IS_ERR(mdp4_kms->mmio))
+ 		return PTR_ERR(mdp4_kms->mmio);
+=20
+ 	irq =3D platform_get_irq(pdev, 0);
+ 	if (irq < 0)
+ 		return dev_err_probe(dev, irq, "failed to get irq\n");
+=20
+ 	mdp4_kms->base.base.irq =3D irq;
+=20
+ 	/* NOTE: driver for this regulator still missing upstream.. use
+ 	 * _get_exclusive() and ignore the error if it does not exist
+ 	 * (and hope that the bootloader left it on for us)
+ 	 */
+ 	mdp4_kms->vdd =3D devm_regulator_get_exclusive(&pdev->dev, "vdd");
+ 	if (IS_ERR(mdp4_kms->vdd))
+ 		mdp4_kms->vdd =3D NULL;
+=20
+ 	mdp4_kms->clk =3D devm_clk_get(&pdev->dev, "core_clk");
+ 	if (IS_ERR(mdp4_kms->clk))
+ 		return dev_err_probe(dev, PTR_ERR(mdp4_kms->clk), "failed to get core_c=
lk\n");
+=20
+ 	mdp4_kms->pclk =3D devm_clk_get(&pdev->dev, "iface_clk");
+ 	if (IS_ERR(mdp4_kms->pclk))
+ 		mdp4_kms->pclk =3D NULL;
+=20
+ 	mdp4_kms->axi_clk =3D devm_clk_get(&pdev->dev, "bus_clk");
+ 	if (IS_ERR(mdp4_kms->axi_clk))
+ 		return dev_err_probe(dev, PTR_ERR(mdp4_kms->axi_clk), "failed to get ax=
i_clk\n");
+=20
+ 	/*
+ 	 * This is required for revn >=3D 2. Handle errors here and let the kms
+ 	 * init bail out if the clock is not provided.
+ 	 */
+ 	mdp4_kms->lut_clk =3D devm_clk_get_optional(&pdev->dev, "lut_clk");
+ 	if (IS_ERR(mdp4_kms->lut_clk))
+ 		return dev_err_probe(dev, PTR_ERR(mdp4_kms->lut_clk), "failed to get lu=
t_clk\n");
+=20
+ 	return msm_drv_probe(&pdev->dev, mdp4_kms_init, &mdp4_kms->base.base);
  }
 =20
 -static int mdp4_remove(struct platform_device *pdev)
 +static void mdp4_remove(struct platform_device *pdev)
  {
  	component_master_del(&pdev->dev, &msm_drm_ops);
 -
 -	return 0;
  }
 =20
  static const struct of_device_id mdp4_dt_match[] =3D {
@@@ -573,8 -571,8 +569,8 @@@ MODULE_DEVICE_TABLE(of, mdp4_dt_match)
 =20
  static struct platform_driver mdp4_platform_driver =3D {
  	.probe      =3D mdp4_probe,
 -	.remove     =3D mdp4_remove,
 +	.remove_new =3D mdp4_remove,
- 	.shutdown   =3D msm_drv_shutdown,
+ 	.shutdown   =3D msm_kms_shutdown,
  	.driver     =3D {
  		.name   =3D "mdp4",
  		.of_match_table =3D mdp4_dt_match,
diff --cc drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 8a7b44376bc6,a28fbcd09684..000000000000
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@@ -939,10 -894,43 +894,43 @@@ static int mdp5_dev_probe(struct platfo
  	if (ret)
  		return ret;
 =20
- 	return msm_drv_probe(&pdev->dev, mdp5_kms_init);
+ 	mdp5_kms->pdev =3D pdev;
+=20
+ 	spin_lock_init(&mdp5_kms->resource_lock);
+=20
+ 	mdp5_kms->mmio =3D msm_ioremap(pdev, "mdp_phys");
+ 	if (IS_ERR(mdp5_kms->mmio))
+ 		return PTR_ERR(mdp5_kms->mmio);
+=20
+ 	/* mandatory clocks: */
+ 	ret =3D get_clk(pdev, &mdp5_kms->axi_clk, "bus", true);
+ 	if (ret)
+ 		return ret;
+ 	ret =3D get_clk(pdev, &mdp5_kms->ahb_clk, "iface", true);
+ 	if (ret)
+ 		return ret;
+ 	ret =3D get_clk(pdev, &mdp5_kms->core_clk, "core", true);
+ 	if (ret)
+ 		return ret;
+ 	ret =3D get_clk(pdev, &mdp5_kms->vsync_clk, "vsync", true);
+ 	if (ret)
+ 		return ret;
+=20
+ 	/* optional clocks: */
+ 	get_clk(pdev, &mdp5_kms->lut_clk, "lut", false);
+ 	get_clk(pdev, &mdp5_kms->tbu_clk, "tbu", false);
+ 	get_clk(pdev, &mdp5_kms->tbu_rt_clk, "tbu_rt", false);
+=20
+ 	irq =3D platform_get_irq(pdev, 0);
+ 	if (irq < 0)
+ 		return dev_err_probe(&pdev->dev, irq, "failed to get irq\n");
+=20
+ 	mdp5_kms->base.base.irq =3D irq;
+=20
+ 	return msm_drv_probe(&pdev->dev, mdp5_kms_init, &mdp5_kms->base.base);
  }
 =20
 -static int mdp5_dev_remove(struct platform_device *pdev)
 +static void mdp5_dev_remove(struct platform_device *pdev)
  {
  	DBG("");
  	component_master_del(&pdev->dev, &msm_drm_ops);
@@@ -986,8 -975,8 +974,8 @@@ MODULE_DEVICE_TABLE(of, mdp5_dt_match)
 =20
  static struct platform_driver mdp5_driver =3D {
  	.probe =3D mdp5_dev_probe,
 -	.remove =3D mdp5_dev_remove,
 +	.remove_new =3D mdp5_dev_remove,
- 	.shutdown =3D msm_drv_shutdown,
+ 	.shutdown =3D msm_kms_shutdown,
  	.driver =3D {
  		.name =3D "msm_mdp",
  		.of_match_table =3D mdp5_dt_match,
diff --cc drivers/gpu/drm/msm/msm_drv.c
index 05fe32c3a4b4,401e9ef86074..000000000000
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@@ -457,23 -264,12 +264,14 @@@ static int msm_drm_init(struct device *
  	if (ret)
  		goto err_deinit_vram;
 =20
- 	/* the fw fb could be anywhere in memory */
- 	ret =3D drm_aperture_remove_framebuffers(drv);
- 	if (ret)
- 		goto err_msm_uninit;
-=20
 -	msm_gem_shrinker_init(ddev);
 +	ret =3D msm_gem_shrinker_init(ddev);
 +	if (ret)
 +		goto err_msm_uninit;
 =20
  	if (priv->kms_init) {
- 		ret =3D priv->kms_init(ddev);
- 		if (ret) {
- 			DRM_DEV_ERROR(dev, "failed to load kms\n");
- 			priv->kms =3D NULL;
+ 		ret =3D msm_drm_kms_init(dev, drv);
+ 		if (ret)
  			goto err_msm_uninit;
- 		}
- 		kms =3D priv->kms;
  	} else {
  		/* valid only for the dummy headless case, where of_node=3DNULL */
  		WARN_ON(dev->of_node);
@@@ -1277,37 -971,21 +973,19 @@@ int msm_drv_probe(struct device *master
 =20
  static int msm_pdev_probe(struct platform_device *pdev)
  {
- 	return msm_drv_probe(&pdev->dev, NULL);
+ 	return msm_drv_probe(&pdev->dev, NULL, NULL);
  }
 =20
 -static int msm_pdev_remove(struct platform_device *pdev)
 +static void msm_pdev_remove(struct platform_device *pdev)
  {
  	component_master_del(&pdev->dev, &msm_drm_ops);
 -
 -	return 0;
  }
 =20
- void msm_drv_shutdown(struct platform_device *pdev)
- {
- 	struct msm_drm_private *priv =3D platform_get_drvdata(pdev);
- 	struct drm_device *drm =3D priv ? priv->dev : NULL;
-=20
- 	/*
- 	 * Shutdown the hw if we're far enough along where things might be on.
- 	 * If we run this too early, we'll end up panicking in any variety of
- 	 * places. Since we don't register the drm device until late in
- 	 * msm_drm_init, drm_dev->registered is used as an indicator that the
- 	 * shutdown will be successful.
- 	 */
- 	if (drm && drm->registered && priv->kms)
- 		drm_atomic_helper_shutdown(drm);
- }
-=20
  static struct platform_driver msm_platform_driver =3D {
  	.probe      =3D msm_pdev_probe,
 -	.remove     =3D msm_pdev_remove,
 +	.remove_new =3D msm_pdev_remove,
- 	.shutdown   =3D msm_drv_shutdown,
  	.driver     =3D {
  		.name   =3D "msm",
- 		.pm     =3D &msm_pm_ops,
  	},
  };
 =20

--Sig_/rWDVrW2M2hR+XA_N0lP.=mV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmUkqfkACgkQAVBC80lX
0Gy3bwgAjLUfZneGUf/MjmVhX904NqBVgmvrLjtNqtiCuy24mDxeU0wYmkWpReZE
IT89DVzILJBJIs5MRNQkxg81nxgYLNMzyc73l3L0ho/lBjz9A8EcXiQdVzRzM75j
IwhQ6o6BHyll3vOCf/RLoz7H7uO9pfXJywN1Seo3VVFaEBMlYbbdstUj2mjOfa2C
d6JjTKmILmtskKFQfAJRVEZQkoJOYSNkGS+YwUPW+TaUUIpht6jEFPc4pD3XxsQp
fGIWlj1lKVATPz66JjmbDg2BEcrGJ8dp+wBbAMgbKSv8x9mIBdZcX874fXLPsx4D
8zcGEtzX0PRhzqdEumed6jFG5Tn3vA==
=atEY
-----END PGP SIGNATURE-----

--Sig_/rWDVrW2M2hR+XA_N0lP.=mV--
