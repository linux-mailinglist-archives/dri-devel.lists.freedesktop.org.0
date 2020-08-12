Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DDE242AE9
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 16:04:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 509FB6E8E3;
	Wed, 12 Aug 2020 14:04:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 040286E132
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 14:04:27 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id l2so2148480wrc.7
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 07:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ftVAAXyYONm0MJ3piPSWsbbfc05lI/y89O7eQ1Ai4e4=;
 b=A0PvPyXbTludqG4EqauB8WQYvxHfmirC87kEUflcEP3VlIyugWn7YsWYhaQ60n8ys8
 boU9Ztj9rdyz9GuyRoVlfXN/p8oDSiH7JGPl75mmB1u6zrVe1XSFpEoIs0zZo/25n71i
 yg1IXThRUz5H1sjO2keNWxpcJhL+PNaQhGwJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ftVAAXyYONm0MJ3piPSWsbbfc05lI/y89O7eQ1Ai4e4=;
 b=mo9AjoipfxPu0UdRwX109fBzJ0SoFk2sgn+nWOUdOoMvssGXkGV8hUrbyvYEWSbh++
 pXAUigl/jKiQviDGpAUtvegezOjumjhjzrGs1NIGy0Kk/5YT6ufO6rHlAGvwhDvsJo49
 xQiaqqJpsYGFEuamAGHz4sJYLdNcjcUjoPJYQR1MMakqEchkGySySA32GQ3dXChMpgtW
 7QjdQsauvqT1F0itr3jo8oUjia7RaEZZsA/4r3weWJiu4ZainTeIR2IfSVgjb3Z1pC80
 Pim/vMZz/7F0LTPY0wk2rvPoraqjFaEM9Bgl3t0AVhLqE0NALWdjDpJrrmGG/kDMoakn
 FWgQ==
X-Gm-Message-State: AOAM533LvOQfI50XWPPm54oLw6rRCz06nhxnNFHvnCZNs3ZMu7CM9bpJ
 vude+qqG0/4Rjtx1kLuG9l9Rog==
X-Google-Smtp-Source: ABdhPJz/hQ+Rh7GhlcUf+vgZ15DYCV+3J/cahlCVvCWx1tGEeOQhC0KCbbkV8fjx7+4nCNfsujt8LQ==
X-Received: by 2002:a05:6000:1152:: with SMTP id
 d18mr36297414wrx.357.1597241065621; 
 Wed, 12 Aug 2020 07:04:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h14sm3771424wml.30.2020.08.12.07.04.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2020 07:04:24 -0700 (PDT)
Date: Wed, 12 Aug 2020 16:04:23 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v1 4/4] drm/ast: Disable planes while switching display
 modes
Message-ID: <20200812140423.GG2352366@phenom.ffwll.local>
References: <20200805105428.2590-1-tzimmermann@suse.de>
 <20200805105428.2590-5-tzimmermann@suse.de>
 <20200807085000.GO6419@phenom.ffwll.local>
 <890d87c0-195a-8d99-8132-417f2892eb8c@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <890d87c0-195a-8d99-8132-417f2892eb8c@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, emil.l.velikov@gmail.com,
 dri-devel@lists.freedesktop.org, kraxel@redhat.com, airlied@redhat.com,
 stable@vger.kernel.org, sam@ravnborg.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 12, 2020 at 10:25:25AM +0200, Thomas Zimmermann wrote:
> Hi
> =

> Am 07.08.20 um 10:50 schrieb daniel@ffwll.ch:
> > On Wed, Aug 05, 2020 at 12:54:28PM +0200, Thomas Zimmermann wrote:
> >> The ast HW cursor requires the primary plane and CRTC to display at
> >> a valid mode and format. This is not the case while switching
> >> display modes, which can lead to the screen turing permanently dark.
> >>
> >> As a workaround, the ast driver now disables active planes while the
> >> mode or format switch takes place. It also synchronizes with the verti=
cal
> >> refresh to give CRTC and planes some time to catch up on each other.
> >> The active planes planes (primary or cursor) will be re-enabled by
> >> each plane's atomic_update() function.
> >>
> >> v2:
> >> 	* move the logic into the commit-tail function
> >>
> >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >> Fixes: 4961eb60f145 ("drm/ast: Enable atomic modesetting")
> >> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> >> Cc: Gerd Hoffmann <kraxel@redhat.com>
> >> Cc: Dave Airlie <airlied@redhat.com>
> >> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> >> Cc: Sam Ravnborg <sam@ravnborg.org>
> >> Cc: Emil Velikov <emil.l.velikov@gmail.com>
> >> Cc: "Y.C. Chen" <yc_chen@aspeedtech.com>
> >> Cc: <stable@vger.kernel.org> # v5.6+
> >> ---
> >>  drivers/gpu/drm/ast/ast_drv.h  |  2 +
> >>  drivers/gpu/drm/ast/ast_mode.c | 68 ++++++++++++++++++++++++++++++++--
> >>  2 files changed, 66 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_d=
rv.h
> >> index c1af6b725933..467049ca8430 100644
> >> --- a/drivers/gpu/drm/ast/ast_drv.h
> >> +++ b/drivers/gpu/drm/ast/ast_drv.h
> >> @@ -177,6 +177,8 @@ struct ast_private *ast_device_create(struct drm_d=
river *drv,
> >>  =

> >>  #define AST_IO_MM_OFFSET		(0x380)
> >>  =

> >> +#define AST_IO_VGAIR1_VREFRESH		BIT(3)
> >> +
> >>  #define __ast_read(x) \
> >>  static inline u##x ast_read##x(struct ast_private *ast, u32 reg) { \
> >>  u##x val =3D 0;\
> >> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_=
mode.c
> >> index ae5cb0a333f7..a379d51f3543 100644
> >> --- a/drivers/gpu/drm/ast/ast_mode.c
> >> +++ b/drivers/gpu/drm/ast/ast_mode.c
> >> @@ -514,6 +514,17 @@ static void ast_set_start_address_crt1(struct ast=
_private *ast,
> >>  =

> >>  }
> >>  =

> >> +static void ast_wait_for_vretrace(struct ast_private *ast)
> >> +{
> >> +	unsigned long timeout =3D jiffies + HZ;
> >> +	u8 vgair1;
> >> +
> >> +	do {
> >> +		vgair1 =3D ast_io_read8(ast, AST_IO_INPUT_STATUS1_READ);
> >> +	} while (!(vgair1 & AST_IO_VGAIR1_VREFRESH) &&
> >> +		 time_before(jiffies, timeout));
> >> +}
> >> +
> >>  /*
> >>   * Primary plane
> >>   */
> >> @@ -1043,23 +1054,72 @@ static int ast_connector_init(struct drm_devic=
e *dev)
> >>   * Mode config
> >>   */
> >>  =

> >> +static bool
> >> +ast_crtc_needs_planes_disabled(struct drm_crtc_state *old_crtc_state,
> >> +			       struct drm_crtc_state *new_crtc_state)
> >> +{
> >> +	struct ast_crtc_state *old_ast_crtc_state, *new_ast_crtc_state;
> >> +
> >> +	if (drm_atomic_crtc_needs_modeset(new_crtc_state))
> >> +		return true;
> >> +
> >> +	old_ast_crtc_state =3D to_ast_crtc_state(old_crtc_state);
> >> +	new_ast_crtc_state =3D to_ast_crtc_state(new_crtc_state);
> >> +
> >> +	if (old_ast_crtc_state->format !=3D new_ast_crtc_state->format)
> >> +		return true;
> >> +
> >> +	return false;
> >> +}
> >> +
> >>  static void
> >>  ast_mode_config_helper_commit_tail(struct drm_atomic_state *old_state)
> >>  {
> >>  	struct drm_device *dev =3D old_state->dev;
> >> +	struct ast_private *ast =3D to_ast_private(dev);
> >> +	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
> >> +	struct drm_crtc *crtc;
> >> +	int i;
> >> +	bool wait_for_vretrace =3D false;
> >>  =

> >>  	drm_atomic_helper_commit_modeset_disables(dev, old_state);
> >>  =

> >> -	drm_atomic_helper_commit_planes(dev, old_state, 0);
> >> +	/*
> >> +	 * HW cursors require the underlying primary plane and CRTC to
> >> +	 * display a valid mode and image. This is not the case during
> >> +	 * full modeset operations. So we temporarily disable any active
> >> +	 * plane, including the HW cursor. Each plane's atomic_update()
> >> +	 * helper will re-enable it if necessary.
> >> +	 *
> >> +	 * We only do this during *full* modesets. It does not affect
> >> +	 * simple pageflips on the planes.
> >> +	 */
> >> +	for_each_oldnew_crtc_in_state(old_state, crtc,
> >> +				      old_crtc_state,
> >> +				      new_crtc_state, i) {
> >> +		if (!ast_crtc_needs_planes_disabled(old_crtc_state,
> >> +						    new_crtc_state))
> >> +			continue;
> >> +		drm_atomic_helper_disable_planes_on_crtc(old_crtc_state,
> >> +							 false);
> >> +		wait_for_vretrace =3D true;
> >> +	}
> > =

> > Hm this still feels like you're fighting the framework more than using =
it.
> > Comment here, but it's kinda review comments on the entire series.
> > =

> > - ast_crtc_needs_planes_disabled feels a bit strange, the usual way to
> >   handle this kind of stuff is to set crtc_state->needs_modeset from yo=
ur
> >   plane's atomic_check function. You might need your own atomic_check
> >   implementation for that, so that after the plane checks you run the
> >   modeset checks again.
> > =

> > - with that you can put your call here to disable all planes into the c=
rtc
> >   ->atomic_disable callback. You can then also put the
> >   ast_wait_for_retrace in there, at the end.
> =

> The CRTC's atomic_disable/enable only run if needs_modeset() is true.
> =

> I brought back support for fast format changes of the primary plane.
> Moving that code into atomic_disable/enable would require to set
> needs_modeset in atomic_check() for format changes. And later figure out
> in atomic_disable/enable if it's really a modeset or just a change of
> the format. That's not good either.

Hm so the uapi rules are somewhat quirky, but NEEDS_MODESET generally
means "no flickering". You can do transitions which take longer than 1
vblank (if resources need to be reallocated) without signalling a
NEEDS_MODESET. But going to black and back is not something that should be
done without signalling a modeset. Userspace would like to make that
distinction and avoid such flickering as much as possible.

Maybe not super relevant for ast, but still, needs_modeset should flag
true for this I think.

Not sure how to best model that with helpers tbh so you can keep the fast
format change. Clever drivers with tricks like this all have their own
modeset flow by now. Maybe just have ast state for whether you need a
modeset (before you overwrite that due to plane changes) and forced plane
disable (any time a modeset is indicated) and then call functions from
your commit_tail depending upon that directly.
-Daniel

> =

> Best regards
> Thomas
> =

> > =

> >> +
> >> +	/*
> >> +	 * Ensure that no scanout takes place before reprogramming mode
> >> +	 * and format registers.
> >> +	 */
> >> +	if (wait_for_vretrace)
> >> +		ast_wait_for_vretrace(ast);
> >> +
> >> +	drm_atomic_helper_commit_planes(dev, old_state,
> >> +					DRM_PLANE_COMMIT_ACTIVE_ONLY);
> > =

> > This order also feels a bit strange, especially with the first 2 patches
> > where you put the crtc modeset code into atomic_begin. It feels a bit l=
ike
> > if you do the plane commit _after_ modeset enables, then you could move
> > the crtc code into the crtc ->atomic_enable hook, and then let the plane
> > update stuff roll through all in commit_planes. Moving the modset code
> > into atomic_begin at least suggests you want modeset enables before pla=
ne
> > commit, and lots of drivers have that sequence in their commit_tail. It=
's
> > even a default implementation with drm_atomic_helper_commit_tail_rpm.
> > =

> > Sorry this is all dragging around so much, figuring out the best atomic
> > flow is occasionally a bit an endeavour :-/
> > =

> > Cheers, Daniel
> > =

> >>  =

> >>  	drm_atomic_helper_commit_modeset_enables(dev, old_state);
> >>  =

> >>  	drm_atomic_helper_fake_vblank(old_state);
> >> -
> >>  	drm_atomic_helper_commit_hw_done(old_state);
> >> -
> >>  	drm_atomic_helper_wait_for_vblanks(dev, old_state);
> >> -
> >>  	drm_atomic_helper_cleanup_planes(dev, old_state);
> >>  }
> >>  =

> >> -- =

> >> 2.28.0
> >>
> > =

> =

> -- =

> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> (HRB 36809, AG N=FCrnberg)
> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> =





-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
