Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1229A144CFF
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 09:11:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C1A8891C2;
	Wed, 22 Jan 2020 08:11:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92D2F891C2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 08:11:08 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id y11so6192601wrt.6
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 00:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=MLdKRVxCu7DMITJuLsKS7CfdotJ/yffpzNPK5SH7w04=;
 b=Irw4+vmmfd/EzzeSAIfXlIf0O/iwwhrzJ2EV6Nhd8F+q6fvGhqu12DkAoxcAmynItK
 6TRSHWgqXFuSu7mzi5hOCGAthgKfJPns57JLfDRvf1stCugqt1M7q0nq+cTIdL6WyGyG
 Z0H4b87gX/9OV7i8HeHBuuxltb0dVYNcnrdM4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=MLdKRVxCu7DMITJuLsKS7CfdotJ/yffpzNPK5SH7w04=;
 b=jQHSNjxi2UQ5BYqAq3CZBppKLsExD15qan5cPzGi1bjTaAIIkXB1cqzk37194oXq8R
 RVvfp5t8EmOtHYAVptAf6WSsBUAuxJC2oCVPSGz4kb4pgSRVd/iB1n0iXZ7zKPFm7XdK
 ziNUedMj4XhKrlaHV8Hma1loP2zHLHbSVJZ92YiD/sKtHdYhwKG1xtarS/2i6cETNQHU
 aaVeSXv6tutwQhsfu4IvU9lN71NlM1yecc5Y31vQa0gyylvP41SbcQjQmymXpakK3WNf
 azYU8Oc9goKvqDkzNgAheprANhBscpnchUne66J5fG2gicJwCHu6UlgmaxeI6na4qdJ3
 nSxg==
X-Gm-Message-State: APjAAAVJaGNWcjnVGzUBkBAg4muV0lpRrqpy0RaZEjgjD9h8D+jzAf5v
 BHy1dcQTJkKRGmfdv6lIqY640w==
X-Google-Smtp-Source: APXvYqztuld4bzdmsyj2KLc1S6NdMHYyCbYLZF3FzObK/aqsm6geIifeWa3ED02AgFh0nWUH8zE+oQ==
X-Received: by 2002:a5d:4651:: with SMTP id j17mr9794690wrs.237.1579680667094; 
 Wed, 22 Jan 2020 00:11:07 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w8sm3140824wmm.0.2020.01.22.00.11.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 00:11:06 -0800 (PST)
Date: Wed, 22 Jan 2020 09:11:04 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 4/4] drm/simple-kms: Let DRM core send VBLANK events
 by default
Message-ID: <20200122081104.GN43062@phenom.ffwll.local>
References: <20200115125226.13843-1-tzimmermann@suse.de>
 <20200115125226.13843-5-tzimmermann@suse.de>
 <20200116064107.GB8400@dvetter-linux.ger.corp.intel.com>
 <33fdd33f-ce8d-70d3-544e-fac727d2686b@suse.de>
 <CACvgo52gwC6U5HjnsQSUUDgE7Gp_EDb-QqCY8VDFjAX7cE0Lxg@mail.gmail.com>
 <20200116235951.GD8400@dvetter-linux.ger.corp.intel.com>
 <fa8a22b5-9c19-7896-5b0d-06b038ed4862@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fa8a22b5-9c19-7896-5b0d-06b038ed4862@suse.de>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: david@lechnology.com, oleksandr_andrushchenko@epam.com,
 Dave Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 xen-devel@lists.xenproject.org, Emil Velikov <emil.velikov@collabora.com>,
 Sean Paul <sean@poorly.run>, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 17, 2020 at 08:17:10AM +0100, Thomas Zimmermann wrote:
> Hi
> =

> Am 17.01.20 um 00:59 schrieb Daniel Vetter:
> > On Thu, Jan 16, 2020 at 05:22:34PM +0000, Emil Velikov wrote:
> >> Hi all,
> >>
> >> On Thu, 16 Jan 2020 at 07:37, Thomas Zimmermann <tzimmermann@suse.de> =
wrote:
> >>
> >>>> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu=
/drm/drm_atomic_state_helper.c
> >>>> index 7cf3cf936547..23d2f51fc1d4 100644
> >>>> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> >>>> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> >>>> @@ -149,6 +149,11 @@ void __drm_atomic_helper_crtc_duplicate_state(s=
truct drm_crtc *crtc,
> >>>>       /* Self refresh should be canceled when a new update is availa=
ble */
> >>>>       state->active =3D drm_atomic_crtc_effectively_active(state);
> >>>>       state->self_refresh_active =3D false;
> >>>> +
> >>>> +     if (drm_dev_has_vblank(crtc->dev))
> >>>> +             state->no_vblank =3D true;
> >>>> +     else
> >>>> +             state->no_vblank =3D false;
> >>>>  }
> >>>>  EXPORT_SYMBOL(__drm_atomic_helper_crtc_duplicate_state);
> >>>
> >>> I think the if/else branches are in the wrong order.
> > =

> > Yeah fumbled that.
> > =

> >>> But generally speaking, is it really that easy? The xen driver already
> >>> has to work around simple-kms's auto-enabling of no_vblank (see patch
> >>> 4). Maybe this settings interferes with other drivers as well. At lea=
st
> >>> the calls for sending fake vblanks should be removed from all affected
> >>> drivers.
> > =

> > Hm xen is really special, in that it has a flip complete event, but not=
 a
> > vblank. I think forcing drivers to overwrite stuff in that case makes
> > sense.
> > =

> >> I'm not sure if setting no_vblank based on dev->num_crtcs is the corre=
ct thing.
> >> From the original commit and associated description for no_vblank:
> >>
> >> In some cases CRTCs are active but are not able to generating events, =
at
> >> least not at every frame at it's expected to.
> >> This is typically the case when the CRTC is feeding a writeback connec=
tor...
> > =

> > Yeah, but Thomas' series here wants to extend that. And I think if we r=
oll
> > this out the common case will be "no hw vblank", and the writeback spec=
ial
> =

> Default values should usually be 0 for zalloc and static initializers.
> Should we rename no_vblank to has_vblank then?

Hm, imo feels like hw without vblank is still the uncommon case. I'd leave
this as-is, but also no objections if you feel like repainting :-)

> > case is going to be the exception to the exception. Yup, patch 1 that
> > updates the docs doesn't reflect that, which is why I'm bringing up more
> > suggestions here around code & semantics of all these pieces to make th=
em
> > do the most reasonable thing for most of the drivers.
> > =

> >> Reflects the ability of a CRTC to send VBLANK events....
> >>
> >>
> >> The proposed handling of no_vblank feels a little dirty, although
> >> nothing better comes to mind.
> >> Nevertheless code seems perfectly reasonable, so if it were me I'd mer=
ge it.
> > =

> > The idea with setting it very early is that drivers can overwrite it ve=
ry
> > easily. Feels slightly dirty, so I guess we could also set it somewhere=
 in
> > the atomic_helper_check function (similar to how we set the various
> > crtc->*_changed flags, but we're not entirely consistent on these eithe=
r).
> > =

> > For the overall thing what feels irky to me is making this no_vblank
> > default logic (however we end up computing it in the end, whether like
> > this or what I suggested) specific to simple pipe helpers feels kinda
> > wrong. Simple pipe tends to have a higher ratio of drivers for hw witho=
ut
> > vblank support, but by far not the only ones. Having that special case
> > feels confusing to me (and likely will trip up some people, vblank and
> > event handling is already a huge source of confusion in drm).
> =

> Making it a default for simple KMS was only the start. I intended to
> cover all drivers at some point. I just didn't want to go through all
> drivers at once.
> =

> I guess for the patchset's v3 I'll audit all drivers for the use of
> no_blank and drm_crtc_send_vblank_event(); and convert the possible
> candidates.

Yeah it's a pain, thanks for volunteering. Just figured the half-step here
is too much in the uncanney valley. If we're going to polish this, let's
do it right (and we have plenty enough drivers to make sure what we pick
will be a solid choice I think).
-Daniel

> =

> Best regards
> Thomas
> =

> > =

> > One idea behind drm_dev_has_vblank() is also that we could formalize a =
bit
> > all that, at least for the usual case - xen and maybe others being some
> > exceptions as usual (hence definitely not something the core code should
> > handle).
> > =

> > Cheers, Daniel
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
