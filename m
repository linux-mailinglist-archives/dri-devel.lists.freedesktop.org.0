Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF3F53C94E
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 13:30:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D3DF10EC84;
	Fri,  3 Jun 2022 11:30:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DC7010EB07
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jun 2022 11:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=y0ebr5lsdVfM5kTajeomrbI1xQldQdWbIUK1/oedIOU=; b=YabquAfCy18i22KiuPsIUtELLG
 H2I4Cgtp782lktko4E9EHaLSTCNsaT8QIlNp0S50c41gL4CnNvcGB6WkkMPvVrVv+3EL+bwD0WMnJ
 GfcdXRUWi/407455WfR0krnZIWN34H9SHSlN+YIE4/ZcY/gOzB27U9YebCiR3PPbPNz/NxNZMbxVF
 6qOYUX1O+vfr4/iKISJtF4fp1APZeMdvj7bJ4rObuf4fteFNiNU1oKDArJccH0XkYCAswELUT5VBZ
 Fu2tH9gTC2jVsR7yyYEvQxKq4ZxkREc9+BWvAbkXF6havf5FeDxpIIqD0ve2CtCOwKsHYzZJugd3x
 edWZ1SNw==;
Received: from [165.90.126.25] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1nx5VI-009K8v-2x; Fri, 03 Jun 2022 13:30:08 +0200
Date: Fri, 3 Jun 2022 10:29:54 -0100
From: Melissa Wen <mwen@igalia.com>
To: Peter Robinson <pbrobinson@gmail.com>
Subject: Re: [PATCH v6 2/6] drm/v3d: Get rid of pm code
Message-ID: <20220603112954.u4kjqkwgjf4agitr@mail.igalia.com>
References: <20220603092610.1909675-1-pbrobinson@gmail.com>
 <20220603092610.1909675-3-pbrobinson@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="y2g3niy67prstwdl"
Content-Disposition: inline
In-Reply-To: <20220603092610.1909675-3-pbrobinson@gmail.com>
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>, devicetree@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>, Emma Anholt <emma@anholt.net>,
 Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--y2g3niy67prstwdl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 06/03, Peter Robinson wrote:
> Runtime PM doesn't seem to work correctly on this driver. On top of
> that, commit 8b6864e3e138 ("drm/v3d/v3d_drv: Remove unused static
> variable 'v3d_v3d_pm_ops'") hints that it most likely never did as the
> driver's PM ops were not hooked-up.
>=20
> So, in order to support regular operation with V3D on BCM2711 (Raspberry
> Pi 4), get rid of the PM code. PM will be reinstated once we figure out
> the underlying issues.

I've spent some time trying to get PM working properly on RPi4, but I
haven=B4t gotten good results yet, and all attempts ended up disabling the
auto suspend option somehow. Keeping in mind how long this has been
unresolved, I agree to clean it now as we continue to investigate the
issue.

Acked-by: Melissa Wen <mwen@igalia.com>
>=20
> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
> Changes since v4:
> - Rebase
>=20
> Changes since v3:
> - Minor updates for rebase
>=20
>  drivers/gpu/drm/v3d/v3d_debugfs.c | 18 +-----------------
>  drivers/gpu/drm/v3d/v3d_drv.c     | 11 -----------
>  drivers/gpu/drm/v3d/v3d_gem.c     | 12 +-----------
>  3 files changed, 2 insertions(+), 39 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/v3d/v3d_debugfs.c b/drivers/gpu/drm/v3d/v3d_=
debugfs.c
> index 29fd13109e43..efbde124c296 100644
> --- a/drivers/gpu/drm/v3d/v3d_debugfs.c
> +++ b/drivers/gpu/drm/v3d/v3d_debugfs.c
> @@ -4,7 +4,6 @@
>  #include <linux/circ_buf.h>
>  #include <linux/ctype.h>
>  #include <linux/debugfs.h>
> -#include <linux/pm_runtime.h>
>  #include <linux/seq_file.h>
>  #include <linux/string_helpers.h>
> =20
> @@ -131,11 +130,7 @@ static int v3d_v3d_debugfs_ident(struct seq_file *m,=
 void *unused)
>  	struct drm_device *dev =3D node->minor->dev;
>  	struct v3d_dev *v3d =3D to_v3d_dev(dev);
>  	u32 ident0, ident1, ident2, ident3, cores;
> -	int ret, core;
> -
> -	ret =3D pm_runtime_get_sync(v3d->drm.dev);
> -	if (ret < 0)
> -		return ret;
> +	int core;
> =20
>  	ident0 =3D V3D_READ(V3D_HUB_IDENT0);
>  	ident1 =3D V3D_READ(V3D_HUB_IDENT1);
> @@ -188,9 +183,6 @@ static int v3d_v3d_debugfs_ident(struct seq_file *m, =
void *unused)
>  			   (misccfg & V3D_MISCCFG_OVRTMUOUT) !=3D 0);
>  	}
> =20
> -	pm_runtime_mark_last_busy(v3d->drm.dev);
> -	pm_runtime_put_autosuspend(v3d->drm.dev);
> -
>  	return 0;
>  }
> =20
> @@ -218,11 +210,6 @@ static int v3d_measure_clock(struct seq_file *m, voi=
d *unused)
>  	uint32_t cycles;
>  	int core =3D 0;
>  	int measure_ms =3D 1000;
> -	int ret;
> -
> -	ret =3D pm_runtime_get_sync(v3d->drm.dev);
> -	if (ret < 0)
> -		return ret;
> =20
>  	if (v3d->ver >=3D 40) {
>  		V3D_CORE_WRITE(core, V3D_V4_PCTR_0_SRC_0_3,
> @@ -246,9 +233,6 @@ static int v3d_measure_clock(struct seq_file *m, void=
 *unused)
>  		   cycles / (measure_ms * 1000),
>  		   (cycles / (measure_ms * 100)) % 10);
> =20
> -	pm_runtime_mark_last_busy(v3d->drm.dev);
> -	pm_runtime_put_autosuspend(v3d->drm.dev);
> -
>  	return 0;
>  }
> =20
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
> index 1afcd54fbbd5..56d5f831e48b 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.c
> +++ b/drivers/gpu/drm/v3d/v3d_drv.c
> @@ -19,7 +19,6 @@
>  #include <linux/module.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
> -#include <linux/pm_runtime.h>
>  #include <linux/reset.h>
> =20
>  #include <drm/drm_drv.h>
> @@ -43,7 +42,6 @@ static int v3d_get_param_ioctl(struct drm_device *dev, =
void *data,
>  {
>  	struct v3d_dev *v3d =3D to_v3d_dev(dev);
>  	struct drm_v3d_get_param *args =3D data;
> -	int ret;
>  	static const u32 reg_map[] =3D {
>  		[DRM_V3D_PARAM_V3D_UIFCFG] =3D V3D_HUB_UIFCFG,
>  		[DRM_V3D_PARAM_V3D_HUB_IDENT1] =3D V3D_HUB_IDENT1,
> @@ -69,17 +67,12 @@ static int v3d_get_param_ioctl(struct drm_device *dev=
, void *data,
>  		if (args->value !=3D 0)
>  			return -EINVAL;
> =20
> -		ret =3D pm_runtime_get_sync(v3d->drm.dev);
> -		if (ret < 0)
> -			return ret;
>  		if (args->param >=3D DRM_V3D_PARAM_V3D_CORE0_IDENT0 &&
>  		    args->param <=3D DRM_V3D_PARAM_V3D_CORE0_IDENT2) {
>  			args->value =3D V3D_CORE_READ(0, offset);
>  		} else {
>  			args->value =3D V3D_READ(offset);
>  		}
> -		pm_runtime_mark_last_busy(v3d->drm.dev);
> -		pm_runtime_put_autosuspend(v3d->drm.dev);
>  		return 0;
>  	}
> =20
> @@ -280,10 +273,6 @@ static int v3d_platform_drm_probe(struct platform_de=
vice *pdev)
>  		return -ENOMEM;
>  	}
> =20
> -	pm_runtime_use_autosuspend(dev);
> -	pm_runtime_set_autosuspend_delay(dev, 50);
> -	pm_runtime_enable(dev);
> -
>  	ret =3D v3d_gem_init(drm);
>  	if (ret)
>  		goto dma_free;
> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
> index 92bc0faee84f..7026214a09f0 100644
> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> @@ -6,7 +6,6 @@
>  #include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> -#include <linux/pm_runtime.h>
>  #include <linux/reset.h>
>  #include <linux/sched/signal.h>
>  #include <linux/uaccess.h>
> @@ -367,9 +366,6 @@ v3d_job_free(struct kref *ref)
>  	dma_fence_put(job->irq_fence);
>  	dma_fence_put(job->done_fence);
> =20
> -	pm_runtime_mark_last_busy(job->v3d->drm.dev);
> -	pm_runtime_put_autosuspend(job->v3d->drm.dev);
> -
>  	if (job->perfmon)
>  		v3d_perfmon_put(job->perfmon);
> =20
> @@ -471,14 +467,10 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *=
file_priv,
>  	job->v3d =3D v3d;
>  	job->free =3D free;
> =20
> -	ret =3D pm_runtime_get_sync(v3d->drm.dev);
> -	if (ret < 0)
> -		goto fail;
> -
>  	ret =3D drm_sched_job_init(&job->base, &v3d_priv->sched_entity[queue],
>  				 v3d_priv);
>  	if (ret)
> -		goto fail_job;
> +		goto fail;
> =20
>  	if (has_multisync) {
>  		if (se->in_sync_count && se->wait_stage =3D=3D queue) {
> @@ -509,8 +501,6 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *fi=
le_priv,
> =20
>  fail_deps:
>  	drm_sched_job_cleanup(&job->base);
> -fail_job:
> -	pm_runtime_put_autosuspend(v3d->drm.dev);
>  fail:
>  	kfree(*container);
>  	*container =3D NULL;
> --=20
> 2.36.1
>=20

--y2g3niy67prstwdl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmKZ8K4ACgkQwqF3j0dL
ehxIyw//eQQCHIm/oNO0quqn422FEu4mcATWQtLsbTM4iGV2zgIPtDuiml+HdSmF
+HWYM9iiYihFd1qf8PSMSyFaTJi0jQbZJQRwCYEnFyQY/YEwFq+IYjzRmvP9zPFL
KRpXgB3xqzbSZeuKPZHgOKuLfB2h7zIvNBb5m/sOKFUOwfZSZH05fSaxfN+ehRRk
TkXv5x7HHtb9UicYtYgTc6G21XIg4zq+ISjR99ogkaV8XC93SwjklyZocfy2ndP8
S09uon4NvTkDc+gWlFeyXFG3oDNTQYSnSBDvxrg1PiDuvae/vACsTNVw8d885SnA
JqDuZQuhi5jFLaKOOYopwhYIE/d7F17n1tbFU5SNYgjA0U88E1936FnRU9aIRLyp
9J0ojsWb4DivscB8dWvc62HMvGesb5k5vFNWtl2KEyAsdQUGlJFKVRZ+2aFdovC8
VMxZj51eiR2uQoPycVInYTotrO427yPn4gPW8vZNik1t3L0PC0H8GaZlIqH2jPik
zAvO0566NEWxrZyDHSO+8jN7xGV/nOlPLB/8E5KcFxtp+84S95hDcZN59tuIOb7P
gPDNZ2Vvs3ZPQiBJ/jDUiMC5103P1Slhj7NRG4rsSvHItBrgkahd3Mg8vHaYlQT3
tzuSictDf1fehsOEQh2BepleLIBb6Jg8SkxcEFKRxmK5SYCvsN4=
=Ndu6
-----END PGP SIGNATURE-----

--y2g3niy67prstwdl--
