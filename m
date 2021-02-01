Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF15630A9DE
	for <lists+dri-devel@lfdr.de>; Mon,  1 Feb 2021 15:35:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E50176E5CE;
	Mon,  1 Feb 2021 14:35:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 301796E5CE
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 14:35:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A5E0BB19B;
 Mon,  1 Feb 2021 14:35:50 +0000 (UTC)
Subject: Re: [PATCH 2/6] drm/gma500: Remove unused DPST support
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20210201132617.1233-1-patrik.r.jakobsson@gmail.com>
 <20210201132617.1233-2-patrik.r.jakobsson@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <82b6af18-180e-80ff-2fda-655a2d9fd770@suse.de>
Date: Mon, 1 Feb 2021 15:35:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210201132617.1233-2-patrik.r.jakobsson@gmail.com>
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
Cc: airlied@linux.ie
Content-Type: multipart/mixed; boundary="===============0889478233=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0889478233==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="priJkG4UIp2orn2kiUjFc14MUNo31Q5jt"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--priJkG4UIp2orn2kiUjFc14MUNo31Q5jt
Content-Type: multipart/mixed; boundary="V2GLT1p7yZHBxlG9DJYvPIfOohyNCDwCr";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 dri-devel@lists.freedesktop.org
Cc: daniel@ffwll.ch, airlied@linux.ie
Message-ID: <82b6af18-180e-80ff-2fda-655a2d9fd770@suse.de>
Subject: Re: [PATCH 2/6] drm/gma500: Remove unused DPST support
References: <20210201132617.1233-1-patrik.r.jakobsson@gmail.com>
 <20210201132617.1233-2-patrik.r.jakobsson@gmail.com>
In-Reply-To: <20210201132617.1233-2-patrik.r.jakobsson@gmail.com>

--V2GLT1p7yZHBxlG9DJYvPIfOohyNCDwCr
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 01.02.21 um 14:26 schrieb Patrik Jakobsson:
> DPST never got enabled so remove it. We keep the reg save/restore code
> just for safety.
>=20
> Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/gma500/psb_drv.h       |   4 -
>   drivers/gpu/drm/gma500/psb_intel_reg.h |  32 -------
>   drivers/gpu/drm/gma500/psb_irq.c       | 110 ------------------------=
-
>   drivers/gpu/drm/gma500/psb_irq.h       |   4 -
>   4 files changed, 150 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500/=
psb_drv.h
> index 020a71b91577..d4f14a5d509b 100644
> --- a/drivers/gpu/drm/gma500/psb_drv.h
> +++ b/drivers/gpu/drm/gma500/psb_drv.h
> @@ -622,13 +622,9 @@ static inline struct drm_psb_private *psb_priv(str=
uct drm_device *dev)
>  =20
>   /* psb_irq.c */
>   extern irqreturn_t psb_irq_handler(int irq, void *arg);
> -extern int psb_irq_enable_dpst(struct drm_device *dev);
> -extern int psb_irq_disable_dpst(struct drm_device *dev);
>   extern void psb_irq_preinstall(struct drm_device *dev);
>   extern int psb_irq_postinstall(struct drm_device *dev);
>   extern void psb_irq_uninstall(struct drm_device *dev);
> -extern void psb_irq_turn_on_dpst(struct drm_device *dev);
> -extern void psb_irq_turn_off_dpst(struct drm_device *dev);
>  =20
>   extern void psb_irq_uninstall_islands(struct drm_device *dev, int hw_=
islands);
>   extern int psb_vblank_wait2(struct drm_device *dev, unsigned int *seq=
uence);
> diff --git a/drivers/gpu/drm/gma500/psb_intel_reg.h b/drivers/gpu/drm/g=
ma500/psb_intel_reg.h
> index 364ea8f06f9c..ced7b433befb 100644
> --- a/drivers/gpu/drm/gma500/psb_intel_reg.h
> +++ b/drivers/gpu/drm/gma500/psb_intel_reg.h
> @@ -550,38 +550,6 @@
>   #define HISTOGRAM_INT_CTRL_CLEAR		(1UL << 30)
>   #define DPST_YUV_LUMA_MODE			0
>  =20
> -struct dpst_ie_histogram_control {
> -	union {
> -		uint32_t data;
> -		struct {
> -			uint32_t bin_reg_index:7;
> -			uint32_t reserved:4;
> -			uint32_t bin_reg_func_select:1;
> -			uint32_t sync_to_phase_in:1;
> -			uint32_t alt_enhancement_mode:2;
> -			uint32_t reserved1:1;
> -			uint32_t sync_to_phase_in_count:8;
> -			uint32_t histogram_mode_select:1;
> -			uint32_t reserved2:4;
> -			uint32_t ie_pipe_assignment:1;
> -			uint32_t ie_mode_table_enabled:1;
> -			uint32_t ie_histogram_enable:1;
> -		};
> -	};
> -};
> -
> -struct dpst_guardband {
> -	union {
> -		uint32_t data;
> -		struct {
> -			uint32_t guardband:22;
> -			uint32_t guardband_interrupt_delay:8;
> -			uint32_t interrupt_status:1;
> -			uint32_t interrupt_enable:1;
> -		};
> -	};
> -};
> -
>   #define PIPEAFRAMEHIGH		0x70040
>   #define PIPEAFRAMEPIXEL		0x70044
>   #define PIPEBFRAMEHIGH		0x71040
> diff --git a/drivers/gpu/drm/gma500/psb_irq.c b/drivers/gpu/drm/gma500/=
psb_irq.c
> index ae9b100e640b..104009e78487 100644
> --- a/drivers/gpu/drm/gma500/psb_irq.c
> +++ b/drivers/gpu/drm/gma500/psb_irq.c
> @@ -101,30 +101,6 @@ psb_disable_pipestat(struct drm_psb_private *dev_p=
riv, int pipe, u32 mask)
>   	}
>   }
>  =20
> -static void mid_enable_pipe_event(struct drm_psb_private *dev_priv, in=
t pipe)
> -{
> -	if (gma_power_begin(dev_priv->dev, false)) {
> -		u32 pipe_event =3D mid_pipe_event(pipe);
> -		dev_priv->vdc_irq_mask |=3D pipe_event;
> -		PSB_WVDC32(~dev_priv->vdc_irq_mask, PSB_INT_MASK_R);
> -		PSB_WVDC32(dev_priv->vdc_irq_mask, PSB_INT_ENABLE_R);
> -		gma_power_end(dev_priv->dev);
> -	}
> -}
> -
> -static void mid_disable_pipe_event(struct drm_psb_private *dev_priv, i=
nt pipe)
> -{
> -	if (dev_priv->pipestat[pipe] =3D=3D 0) {
> -		if (gma_power_begin(dev_priv->dev, false)) {
> -			u32 pipe_event =3D mid_pipe_event(pipe);
> -			dev_priv->vdc_irq_mask &=3D ~pipe_event;
> -			PSB_WVDC32(~dev_priv->vdc_irq_mask, PSB_INT_MASK_R);
> -			PSB_WVDC32(dev_priv->vdc_irq_mask, PSB_INT_ENABLE_R);
> -			gma_power_end(dev_priv->dev);
> -		}
> -	}
> -}
> -
>   /*
>    * Display controller interrupt handler for pipe event.
>    */
> @@ -392,92 +368,6 @@ void psb_irq_uninstall(struct drm_device *dev)
>   	spin_unlock_irqrestore(&dev_priv->irqmask_lock, irqflags);
>   }
>  =20
> -void psb_irq_turn_on_dpst(struct drm_device *dev)
> -{
> -	struct drm_psb_private *dev_priv =3D
> -		(struct drm_psb_private *) dev->dev_private;
> -	u32 hist_reg;
> -	u32 pwm_reg;
> -
> -	if (gma_power_begin(dev, false)) {
> -		PSB_WVDC32(1 << 31, HISTOGRAM_LOGIC_CONTROL);
> -		hist_reg =3D PSB_RVDC32(HISTOGRAM_LOGIC_CONTROL);
> -		PSB_WVDC32(1 << 31, HISTOGRAM_INT_CONTROL);
> -		hist_reg =3D PSB_RVDC32(HISTOGRAM_INT_CONTROL);
> -
> -		PSB_WVDC32(0x80010100, PWM_CONTROL_LOGIC);
> -		pwm_reg =3D PSB_RVDC32(PWM_CONTROL_LOGIC);
> -		PSB_WVDC32(pwm_reg | PWM_PHASEIN_ENABLE
> -						| PWM_PHASEIN_INT_ENABLE,
> -							   PWM_CONTROL_LOGIC);
> -		pwm_reg =3D PSB_RVDC32(PWM_CONTROL_LOGIC);
> -
> -		psb_enable_pipestat(dev_priv, 0, PIPE_DPST_EVENT_ENABLE);
> -
> -		hist_reg =3D PSB_RVDC32(HISTOGRAM_INT_CONTROL);
> -		PSB_WVDC32(hist_reg | HISTOGRAM_INT_CTRL_CLEAR,
> -							HISTOGRAM_INT_CONTROL);
> -		pwm_reg =3D PSB_RVDC32(PWM_CONTROL_LOGIC);
> -		PSB_WVDC32(pwm_reg | 0x80010100 | PWM_PHASEIN_ENABLE,
> -							PWM_CONTROL_LOGIC);
> -
> -		gma_power_end(dev);
> -	}
> -}
> -
> -int psb_irq_enable_dpst(struct drm_device *dev)
> -{
> -	struct drm_psb_private *dev_priv =3D
> -		(struct drm_psb_private *) dev->dev_private;
> -	unsigned long irqflags;
> -
> -	spin_lock_irqsave(&dev_priv->irqmask_lock, irqflags);
> -
> -	/* enable DPST */
> -	mid_enable_pipe_event(dev_priv, 0);
> -	psb_irq_turn_on_dpst(dev);
> -
> -	spin_unlock_irqrestore(&dev_priv->irqmask_lock, irqflags);
> -	return 0;
> -}
> -
> -void psb_irq_turn_off_dpst(struct drm_device *dev)
> -{
> -	struct drm_psb_private *dev_priv =3D
> -	    (struct drm_psb_private *) dev->dev_private;
> -	u32 pwm_reg;
> -
> -	if (gma_power_begin(dev, false)) {
> -		PSB_WVDC32(0x00000000, HISTOGRAM_INT_CONTROL);
> -		PSB_RVDC32(HISTOGRAM_INT_CONTROL);
> -
> -		psb_disable_pipestat(dev_priv, 0, PIPE_DPST_EVENT_ENABLE);
> -
> -		pwm_reg =3D PSB_RVDC32(PWM_CONTROL_LOGIC);
> -		PSB_WVDC32(pwm_reg & ~PWM_PHASEIN_INT_ENABLE,
> -							PWM_CONTROL_LOGIC);
> -		pwm_reg =3D PSB_RVDC32(PWM_CONTROL_LOGIC);
> -
> -		gma_power_end(dev);
> -	}
> -}
> -
> -int psb_irq_disable_dpst(struct drm_device *dev)
> -{
> -	struct drm_psb_private *dev_priv =3D
> -	    (struct drm_psb_private *) dev->dev_private;
> -	unsigned long irqflags;
> -
> -	spin_lock_irqsave(&dev_priv->irqmask_lock, irqflags);
> -
> -	mid_disable_pipe_event(dev_priv, 0);
> -	psb_irq_turn_off_dpst(dev);
> -
> -	spin_unlock_irqrestore(&dev_priv->irqmask_lock, irqflags);
> -
> -	return 0;
> -}
> -
>   /*
>    * It is used to enable VBLANK interrupt
>    */
> diff --git a/drivers/gpu/drm/gma500/psb_irq.h b/drivers/gpu/drm/gma500/=
psb_irq.h
> index 1b577fa7010a..17c9b0b62471 100644
> --- a/drivers/gpu/drm/gma500/psb_irq.h
> +++ b/drivers/gpu/drm/gma500/psb_irq.h
> @@ -23,10 +23,6 @@ int  psb_irq_postinstall(struct drm_device *dev);
>   void psb_irq_uninstall(struct drm_device *dev);
>   irqreturn_t psb_irq_handler(int irq, void *arg);
>  =20
> -int psb_irq_enable_dpst(struct drm_device *dev);
> -int psb_irq_disable_dpst(struct drm_device *dev);
> -void psb_irq_turn_on_dpst(struct drm_device *dev);
> -void psb_irq_turn_off_dpst(struct drm_device *dev);
>   int  psb_enable_vblank(struct drm_crtc *crtc);
>   void psb_disable_vblank(struct drm_crtc *crtc);
>   u32  psb_get_vblank_counter(struct drm_crtc *crtc);
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--V2GLT1p7yZHBxlG9DJYvPIfOohyNCDwCr--

--priJkG4UIp2orn2kiUjFc14MUNo31Q5jt
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAYEcUFAwAAAAAACgkQlh/E3EQov+DH
xA//V3TARrqe3cKDXwFMUEfG7c4iPQgDIDkjKeRM9PwAKdlz1Bk+Gx/b2kzgcPcJ6yibwB+OGe0A
9m2nMaqAp4rfbSE7+nmcBl8nYWdf/TU/DNK6dUFuEpAfDnCHvyPADlCox1fcafcgx2EBB0kQI1ij
z/v9SYuTh8W1dRu7AecLPPfg6UndHARFmlnYN3sZyeJGltTFiAymieDnym3wJmljL/GSYaVDYHdB
q4RK2zKXWD8aNnBnmLmdrA2YmFlI3fIKBJrN6VudNQmJHF1lW6iCLbptQQh8ZPEitgnF9euDbXmi
Lii9EEwTahFjB/JHqxDnQ17Ks0Vyb94ma8uh1zy5AXyP8nc5WHvn8Sp/IEhO/fSwXoAyWyckF48S
QW2uHreyZ/vBD9xffSDSyhaqVdUzaf2tnT6HUydDWB4L7+1i1n50QTYWSHl1nSuvNWHlHE60FqJz
Cv66Hth56UNn/mVvge1w5loLfHv3e3+eEonexxvu6sNS7VHv3YfvSJC2Rt1qsJs2xI7IF6HyIOKt
zeAKC+NnDGGLgYtkxQ3Ma2Yi7rbcJiBVwopFgjrEZiIE0WXEQoyTY6jaF8cAbOEzunZzDFq8QeyM
FV8uHFZSCh/IpicMdsxz+p7Z5XcQfXQVfyzedOJ7Cf3XgkAFNP3o911bgRT8KkTUIujjBJ3TU0Xn
t6A=
=JkKt
-----END PGP SIGNATURE-----

--priJkG4UIp2orn2kiUjFc14MUNo31Q5jt--

--===============0889478233==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0889478233==--
