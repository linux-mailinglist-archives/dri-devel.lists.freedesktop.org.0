Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2179C1E0C79
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 13:07:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89CF389E98;
	Mon, 25 May 2020 11:07:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 306DD89E98
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 11:07:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 606ACAD45;
 Mon, 25 May 2020 11:07:36 +0000 (UTC)
Subject: Re: [PATCH v1 1/2] drm/vblank: use drm_* functions for logging
To: Sam Ravnborg <sam@ravnborg.org>, Lyude Paul <lyude@redhat.com>,
 dri-devel@lists.freedesktop.org
References: <20200523071224.1716837-1-sam@ravnborg.org>
 <20200523071224.1716837-2-sam@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 mQENBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAG0J1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPokBVAQTAQgAPhYh
 BHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEGgNwR1TC3ojR80H/jH+vYavwQ+TvO8ksXL9JQWc3IFSiGpuSVXLCdg62AmR
 irxW+qCwNncNQyb9rd30gzdectSkPWL3KSqEResBe24IbA5/jSkPweJasgXtfhuyoeCJ6PXo
 clQQGKIoFIAEv1s8l0ggPZswvCinegl1diyJXUXmdEJRTWYAtxn/atut1o6Giv6D2qmYbXN7
 mneMC5MzlLaJKUtoH7U/IjVw1sx2qtxAZGKVm4RZxPnMCp9E1MAr5t4dP5gJCIiqsdrVqI6i
 KupZstMxstPU//azmz7ZWWxT0JzgJqZSvPYx/SATeexTYBP47YFyri4jnsty2ErS91E6H8os
 Bv6pnSn7eAq5AQ0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRH
 UE9eosYbT6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgT
 RjP+qbU63Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+R
 dhgATnWWGKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zb
 ehDda8lvhFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r
 12+lqdsAEQEAAYkBPAQYAQgAJhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkD
 wmcAAAoJEGgNwR1TC3ojpfcIAInwP5OlcEKokTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2
 h9ifw9Nf2TjCZ6AMvC3thAN0rFDj55N9l4s1CpaDo4J+0fkrHuyNacnT206CeJV1E7NYntxU
 n+LSiRrOdywn6erjxRi9EYTVLCHcDhBEjKmFZfg4AM4GZMWX1lg0+eHbd5oL1as28WvvI/uI
 aMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU2y3ZH2mf5suSKHAMtbE4jKJ8ZHFOo3GhLgjVrBW
 HE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/tsZvyEX6zN8CtirPdPWu/VXNRYAl/lat7lSI
 3H26qrE=
Message-ID: <7151c066-163d-74a5-6338-8e7e036a8fc1@suse.de>
Date: Mon, 25 May 2020 13:07:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200523071224.1716837-2-sam@ravnborg.org>
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
Cc: Y David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: multipart/mixed; boundary="===============0515039265=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0515039265==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="BRMLi5MvdDCV4lCZKIMMGBEzX6Z3RhSBp"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--BRMLi5MvdDCV4lCZKIMMGBEzX6Z3RhSBp
Content-Type: multipart/mixed; boundary="AsFBrKcBuX1vP3ithYvNhObpWxmGq8QZ1";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>, Lyude Paul <lyude@redhat.com>,
 dri-devel@lists.freedesktop.org
Cc: Y David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>
Message-ID: <7151c066-163d-74a5-6338-8e7e036a8fc1@suse.de>
Subject: Re: [PATCH v1 1/2] drm/vblank: use drm_* functions for logging
References: <20200523071224.1716837-1-sam@ravnborg.org>
 <20200523071224.1716837-2-sam@ravnborg.org>
In-Reply-To: <20200523071224.1716837-2-sam@ravnborg.org>

--AsFBrKcBuX1vP3ithYvNhObpWxmGq8QZ1
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 23.05.20 um 09:12 schrieb Sam Ravnborg:
> Replace all DRM_* logging functions with their drm_ counterparts.
> checkpatch emits a few "quoted string split across lines",
> which is left as is. The strings was already split in the original code=

> base and it would not increase readability to fix them.
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_vblank.c | 130 ++++++++++++++++++++---------------=

>  1 file changed, 73 insertions(+), 57 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.=
c
> index 8837bebc7e13..631d7d60e72f 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -311,15 +311,15 @@ static void drm_update_vblank_count(struct drm_de=
vice *dev, unsigned int pipe,
>  		 * frame/field duration.
>  		 */
> =20
> -		DRM_DEBUG_VBL("crtc %u: Calculating number of vblanks."
> -			      " diff_ns =3D %lld, framedur_ns =3D %d)\n",
> -			      pipe, (long long) diff_ns, framedur_ns);
> +		drm_dbg_vbl(dev, "crtc %u: Calculating number of vblanks."
> +			    " diff_ns =3D %lld, framedur_ns =3D %d)\n",
> +			    pipe, (long long)diff_ns, framedur_ns);
> =20
>  		diff =3D DIV_ROUND_CLOSEST_ULL(diff_ns, framedur_ns);
> =20
>  		if (diff =3D=3D 0 && in_vblank_irq)
> -			DRM_DEBUG_VBL("crtc %u: Redundant vblirq ignored\n",
> -				      pipe);
> +			drm_dbg_vbl(dev, "crtc %u: Redundant vblirq ignored\n",
> +				    pipe);
>  	} else {
>  		/* some kind of default for drivers w/o accurate vbl timestamping */=

>  		diff =3D in_vblank_irq ? 1 : 0;
> @@ -335,15 +335,16 @@ static void drm_update_vblank_count(struct drm_de=
vice *dev, unsigned int pipe,
>  	 * random large forward jumps of the software vblank counter.
>  	 */
>  	if (diff > 1 && (vblank->inmodeset & 0x2)) {
> -		DRM_DEBUG_VBL("clamping vblank bump to 1 on crtc %u: diffr=3D%u"
> -			      " due to pre-modeset.\n", pipe, diff);
> +		drm_dbg_vbl(dev,
> +			    "clamping vblank bump to 1 on crtc %u: diffr=3D%u"
> +			    " due to pre-modeset.\n", pipe, diff);
>  		diff =3D 1;
>  	}
> =20
> -	DRM_DEBUG_VBL("updating vblank count on crtc %u:"
> -		      " current=3D%llu, diff=3D%u, hw=3D%u hw_last=3D%u\n",
> -		      pipe, (unsigned long long)atomic64_read(&vblank->count),
> -		      diff, cur_vblank, vblank->last);
> +	drm_dbg_vbl(dev, "updating vblank count on crtc %u:"
> +		    " current=3D%llu, diff=3D%u, hw=3D%u hw_last=3D%u\n",
> +		    pipe, (unsigned long long)atomic64_read(&vblank->count),
> +		    diff, cur_vblank, vblank->last);
> =20
>  	if (diff =3D=3D 0) {
>  		WARN_ON_ONCE(cur_vblank !=3D vblank->last);
> @@ -483,7 +484,7 @@ static void vblank_disable_fn(struct timer_list *t)=

> =20
>  	spin_lock_irqsave(&dev->vbl_lock, irqflags);
>  	if (atomic_read(&vblank->refcount) =3D=3D 0 && vblank->enabled) {
> -		DRM_DEBUG("disabling vblank on crtc %u\n", pipe);
> +		drm_dbg_core(dev, "disabling vblank on crtc %u\n", pipe);
>  		drm_vblank_disable_and_save(dev, pipe);
>  	}
>  	spin_unlock_irqrestore(&dev->vbl_lock, irqflags);
> @@ -628,18 +629,19 @@ void drm_calc_timestamping_constants(struct drm_c=
rtc *crtc,
>  		if (mode->flags & DRM_MODE_FLAG_INTERLACE)
>  			framedur_ns /=3D 2;
>  	} else

In cases where the if branch has braces, the else branch should have
them too. Might be a good opportunity to fix the coding style.

Best regards
Thomas


> -		DRM_ERROR("crtc %u: Can't calculate constants, dotclock =3D 0!\n",
> -			  crtc->base.id);
> +		drm_err(dev, "crtc %u: Can't calculate constants, dotclock =3D 0!\n"=
,
> +			crtc->base.id);
> =20
>  	vblank->linedur_ns  =3D linedur_ns;
>  	vblank->framedur_ns =3D framedur_ns;
>  	vblank->hwmode =3D *mode;
> =20
> -	DRM_DEBUG("crtc %u: hwmode: htotal %d, vtotal %d, vdisplay %d\n",
> -		  crtc->base.id, mode->crtc_htotal,
> -		  mode->crtc_vtotal, mode->crtc_vdisplay);
> -	DRM_DEBUG("crtc %u: clock %d kHz framedur %d linedur %d\n",
> -		  crtc->base.id, dotclock, framedur_ns, linedur_ns);
> +	drm_dbg_core(dev,
> +		     "crtc %u: hwmode: htotal %d, vtotal %d, vdisplay %d\n",
> +		     crtc->base.id, mode->crtc_htotal,
> +		     mode->crtc_vtotal, mode->crtc_vdisplay);
> +	drm_dbg_core(dev, "crtc %u: clock %d kHz framedur %d linedur %d\n",
> +		     crtc->base.id, dotclock, framedur_ns, linedur_ns);
>  }
>  EXPORT_SYMBOL(drm_calc_timestamping_constants);
> =20
> @@ -692,13 +694,13 @@ drm_crtc_vblank_helper_get_vblank_timestamp_inter=
nal(
>  	int delta_ns, duration_ns;
> =20
>  	if (pipe >=3D dev->num_crtcs) {
> -		DRM_ERROR("Invalid crtc %u\n", pipe);
> +		drm_err(dev, "Invalid crtc %u\n", pipe);
>  		return false;
>  	}
> =20
>  	/* Scanout position query not supported? Should not happen. */
>  	if (!get_scanout_position) {
> -		DRM_ERROR("Called from CRTC w/o get_scanout_position()!?\n");
> +		drm_err(dev, "Called from CRTC w/o get_scanout_position()!?\n");
>  		return false;
>  	}
> =20
> @@ -711,7 +713,8 @@ drm_crtc_vblank_helper_get_vblank_timestamp_interna=
l(
>  	 * Happens during initial modesetting of a crtc.
>  	 */
>  	if (mode->crtc_clock =3D=3D 0) {
> -		DRM_DEBUG("crtc %u: Noop due to uninitialized mode.\n", pipe);
> +		drm_dbg_core(dev, "crtc %u: Noop due to uninitialized mode.\n",
> +			     pipe);
>  		WARN_ON_ONCE(drm_drv_uses_atomic_modeset(dev));
>  		return false;
>  	}
> @@ -735,8 +738,9 @@ drm_crtc_vblank_helper_get_vblank_timestamp_interna=
l(
> =20
>  		/* Return as no-op if scanout query unsupported or failed. */
>  		if (!vbl_status) {
> -			DRM_DEBUG("crtc %u : scanoutpos query failed.\n",
> -				  pipe);
> +			drm_dbg_core(dev,
> +				     "crtc %u : scanoutpos query failed.\n",
> +				     pipe);
>  			return false;
>  		}
> =20
> @@ -750,8 +754,9 @@ drm_crtc_vblank_helper_get_vblank_timestamp_interna=
l(
> =20
>  	/* Noisy system timing? */
>  	if (i =3D=3D DRM_TIMESTAMP_MAXRETRIES) {
> -		DRM_DEBUG("crtc %u: Noisy timestamp %d us > %d us [%d reps].\n",
> -			  pipe, duration_ns/1000, *max_error/1000, i);
> +		drm_dbg_core(dev,
> +			     "crtc %u: Noisy timestamp %d us > %d us [%d reps].\n",
> +			     pipe, duration_ns / 1000, *max_error / 1000, i);
>  	}
> =20
>  	/* Return upper bound of timestamp precision error. */
> @@ -775,11 +780,12 @@ drm_crtc_vblank_helper_get_vblank_timestamp_inter=
nal(
>  	ts_etime =3D ktime_to_timespec64(etime);
>  	ts_vblank_time =3D ktime_to_timespec64(*vblank_time);
> =20
> -	DRM_DEBUG_VBL("crtc %u : v p(%d,%d)@ %lld.%06ld -> %lld.%06ld [e %d u=
s, %d rep]\n",
> -		      pipe, hpos, vpos,
> -		      (u64)ts_etime.tv_sec, ts_etime.tv_nsec / 1000,
> -		      (u64)ts_vblank_time.tv_sec, ts_vblank_time.tv_nsec / 1000,
> -		      duration_ns / 1000, i);
> +	drm_dbg_vbl(dev,
> +		    "crtc %u : v p(%d,%d)@ %lld.%06ld -> %lld.%06ld [e %d us, %d rep=
]\n",
> +		    pipe, hpos, vpos,
> +		    (u64)ts_etime.tv_sec, ts_etime.tv_nsec / 1000,
> +		    (u64)ts_vblank_time.tv_sec, ts_vblank_time.tv_nsec / 1000,
> +		    duration_ns / 1000, i);
> =20
>  	return true;
>  }
> @@ -1111,7 +1117,8 @@ static int drm_vblank_enable(struct drm_device *d=
ev, unsigned int pipe)
>  		 * prevent double-accounting of same vblank interval.
>  		 */
>  		ret =3D __enable_vblank(dev, pipe);
> -		DRM_DEBUG("enabling vblank on crtc %u, ret: %d\n", pipe, ret);
> +		drm_dbg_core(dev, "enabling vblank on crtc %u, ret: %d\n",
> +			     pipe, ret);
>  		if (ret) {
>  			atomic_dec(&vblank->refcount);
>  		} else {
> @@ -1286,8 +1293,8 @@ void drm_crtc_vblank_off(struct drm_crtc *crtc)
>  	spin_lock_irqsave(&dev->event_lock, irqflags);
> =20
>  	spin_lock(&dev->vbl_lock);
> -	DRM_DEBUG_VBL("crtc %d, vblank enabled %d, inmodeset %d\n",
> -		      pipe, vblank->enabled, vblank->inmodeset);
> +	drm_dbg_vbl(dev, "crtc %d, vblank enabled %d, inmodeset %d\n",
> +		    pipe, vblank->enabled, vblank->inmodeset);
> =20
>  	/* Avoid redundant vblank disables without previous
>  	 * drm_crtc_vblank_on(). */
> @@ -1312,9 +1319,9 @@ void drm_crtc_vblank_off(struct drm_crtc *crtc)
>  	list_for_each_entry_safe(e, t, &dev->vblank_event_list, base.link) {
>  		if (e->pipe !=3D pipe)
>  			continue;
> -		DRM_DEBUG("Sending premature vblank event on disable: "
> -			  "wanted %llu, current %llu\n",
> -			  e->sequence, seq);
> +		drm_dbg_core(dev, "Sending premature vblank event on disable: "
> +			     "wanted %llu, current %llu\n",
> +			     e->sequence, seq);
>  		list_del(&e->base.link);
>  		drm_vblank_put(dev, pipe);
>  		send_vblank_event(dev, e, seq, now);
> @@ -1413,8 +1420,8 @@ void drm_crtc_vblank_on(struct drm_crtc *crtc)
>  		return;
> =20
>  	spin_lock_irqsave(&dev->vbl_lock, irqflags);
> -	DRM_DEBUG_VBL("crtc %d, vblank enabled %d, inmodeset %d\n",
> -		      pipe, vblank->enabled, vblank->inmodeset);
> +	drm_dbg_vbl(dev, "crtc %d, vblank enabled %d, inmodeset %d\n",
> +		    pipe, vblank->enabled, vblank->inmodeset);
> =20
>  	/* Drop our private "prevent drm_vblank_get" refcount */
>  	if (vblank->inmodeset) {
> @@ -1477,8 +1484,9 @@ void drm_vblank_restore(struct drm_device *dev, u=
nsigned int pipe)
>  		diff =3D DIV_ROUND_CLOSEST_ULL(diff_ns, framedur_ns);
> =20
> =20
> -	DRM_DEBUG_VBL("missed %d vblanks in %lld ns, frame duration=3D%d ns, =
hw_diff=3D%d\n",
> -		      diff, diff_ns, framedur_ns, cur_vblank - vblank->last);
> +	drm_dbg_vbl(dev,
> +		    "missed %d vblanks in %lld ns, frame duration=3D%d ns, hw_diff=3D=
%d\n",
> +		    diff, diff_ns, framedur_ns, cur_vblank - vblank->last);
>  	store_vblank(dev, pipe, diff, t_vblank, cur_vblank);
>  }
>  EXPORT_SYMBOL(drm_vblank_restore);
> @@ -1637,8 +1645,8 @@ static int drm_queue_vblank_event(struct drm_devi=
ce *dev, unsigned int pipe,
> =20
>  	seq =3D drm_vblank_count_and_time(dev, pipe, &now);
> =20
> -	DRM_DEBUG("event on vblank count %llu, current %llu, crtc %u\n",
> -		  req_seq, seq, pipe);
> +	drm_dbg_core(dev, "event on vblank count %llu, current %llu, crtc %u\=
n",
> +		     req_seq, seq, pipe);
> =20
>  	trace_drm_vblank_event_queued(file_priv, pipe, req_seq);
> =20
> @@ -1729,10 +1737,11 @@ int drm_wait_vblank_ioctl(struct drm_device *de=
v, void *data,
>  	if (vblwait->request.type &
>  	    ~(_DRM_VBLANK_TYPES_MASK | _DRM_VBLANK_FLAGS_MASK |
>  	      _DRM_VBLANK_HIGH_CRTC_MASK)) {
> -		DRM_DEBUG("Unsupported type value 0x%x, supported mask 0x%x\n",
> -			  vblwait->request.type,
> -			  (_DRM_VBLANK_TYPES_MASK | _DRM_VBLANK_FLAGS_MASK |
> -			   _DRM_VBLANK_HIGH_CRTC_MASK));
> +		drm_dbg_core(dev,
> +			     "Unsupported type value 0x%x, supported mask 0x%x\n",
> +			     vblwait->request.type,
> +			     (_DRM_VBLANK_TYPES_MASK | _DRM_VBLANK_FLAGS_MASK |
> +			      _DRM_VBLANK_HIGH_CRTC_MASK));
>  		return -EINVAL;
>  	}
> =20
> @@ -1775,7 +1784,9 @@ int drm_wait_vblank_ioctl(struct drm_device *dev,=
 void *data,
> =20
>  	ret =3D drm_vblank_get(dev, pipe);
>  	if (ret) {
> -		DRM_DEBUG("crtc %d failed to acquire vblank counter, %d\n", pipe, re=
t);
> +		drm_dbg_core(dev,
> +			     "crtc %d failed to acquire vblank counter, %d\n",
> +			     pipe, ret);
>  		return ret;
>  	}
>  	seq =3D drm_vblank_count(dev, pipe);
> @@ -1811,8 +1822,8 @@ int drm_wait_vblank_ioctl(struct drm_device *dev,=
 void *data,
>  	if (req_seq !=3D seq) {
>  		int wait;
> =20
> -		DRM_DEBUG("waiting on vblank count %llu, crtc %u\n",
> -			  req_seq, pipe);
> +		drm_dbg_core(dev, "waiting on vblank count %llu, crtc %u\n",
> +			     req_seq, pipe);
>  		wait =3D wait_event_interruptible_timeout(vblank->queue,
>  			vblank_passed(drm_vblank_count(dev, pipe), req_seq) ||
>  				      !READ_ONCE(vblank->enabled),
> @@ -1836,10 +1847,11 @@ int drm_wait_vblank_ioctl(struct drm_device *de=
v, void *data,
>  	if (ret !=3D -EINTR) {
>  		drm_wait_vblank_reply(dev, pipe, &vblwait->reply);
> =20
> -		DRM_DEBUG("crtc %d returning %u to client\n",
> -			  pipe, vblwait->reply.sequence);
> +		drm_dbg_core(dev, "crtc %d returning %u to client\n",
> +			     pipe, vblwait->reply.sequence);
>  	} else {
> -		DRM_DEBUG("crtc %d vblank wait interrupted by signal\n", pipe);
> +		drm_dbg_core(dev, "crtc %d vblank wait interrupted by signal\n",
> +			     pipe);
>  	}
> =20
>  done:
> @@ -1865,8 +1877,8 @@ static void drm_handle_vblank_events(struct drm_d=
evice *dev, unsigned int pipe)
>  		if (!vblank_passed(seq, e->sequence))
>  			continue;
> =20
> -		DRM_DEBUG("vblank event on %llu, current %llu\n",
> -			  e->sequence, seq);
> +		drm_dbg_core(dev, "vblank event on %llu, current %llu\n",
> +			     e->sequence, seq);
> =20
>  		list_del(&e->base.link);
>  		drm_vblank_put(dev, pipe);
> @@ -2005,7 +2017,9 @@ int drm_crtc_get_sequence_ioctl(struct drm_device=
 *dev, void *data,
>  	if (!vblank_enabled) {
>  		ret =3D drm_crtc_vblank_get(crtc);
>  		if (ret) {
> -			DRM_DEBUG("crtc %d failed to acquire vblank counter, %d\n", pipe, r=
et);
> +			drm_dbg_core(dev,
> +				     "crtc %d failed to acquire vblank counter, %d\n",
> +				     pipe, ret);
>  			return ret;
>  		}
>  	}
> @@ -2071,7 +2085,9 @@ int drm_crtc_queue_sequence_ioctl(struct drm_devi=
ce *dev, void *data,
> =20
>  	ret =3D drm_crtc_vblank_get(crtc);
>  	if (ret) {
> -		DRM_DEBUG("crtc %d failed to acquire vblank counter, %d\n", pipe, re=
t);
> +		drm_dbg_core(dev,
> +			     "crtc %d failed to acquire vblank counter, %d\n",
> +			     pipe, ret);
>  		goto err_free;
>  	}
> =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--AsFBrKcBuX1vP3ithYvNhObpWxmGq8QZ1--

--BRMLi5MvdDCV4lCZKIMMGBEzX6Z3RhSBp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl7LpvQACgkQaA3BHVML
eiPL5gf+M4Eilijjq1SwVtEHX6F+PIfc8BD22IxBjxGJ2khhN2wi1uv9tfAzeSy4
mnrpW18mNMNwm1dHbaho/AEllhPNYCoOamOVZgWeWYqabYllLK62k/Tfm+GtEjUn
gf1DesuwWc2zrzwhFm4WqHmi2H4S9MPw0McuiTmgJKugdGbs5ds2rLxjzJ0FuKth
nevubCklaKae0ySd06Fc/db8rANRgN6Lz7KxbiU8+qzrUPyZvKDVgdl8sPOkAbSC
z/s5RpM9TeiCwU3ImUuO+742xcgcr9W2ApTFcQRRyG4a73EQuIGst9FM7wvBQITP
lho54B5N/AZR7Izgx5GwEFZ1y0iXJg==
=q01P
-----END PGP SIGNATURE-----

--BRMLi5MvdDCV4lCZKIMMGBEzX6Z3RhSBp--

--===============0515039265==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0515039265==--
