Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D5A14BCA4
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2020 16:14:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B86C46E0B9;
	Tue, 28 Jan 2020 15:14:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 310416E0B9
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2020 15:14:47 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id p17so2965950wma.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2020 07:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=wC9C/BsYUjVeK8G1BQ+TqjG6d+uume0GDrnY6oFsX1Q=;
 b=KluDkgOvTVrXsbcZm8SJITVRRmj+jRnR+xflcCbz62cZyc2ZJ+ugUGupwazQ0fjHxW
 39Vw9tHePuIm1zNNWior0QOUaBEnJcIxqu7mu/+IvsSrPgitaJ8WtPT1R2iNmZhH34yI
 m1FMT8KUzzdw0/e9AG8rnXc3Ll8bMaiSQmlu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=wC9C/BsYUjVeK8G1BQ+TqjG6d+uume0GDrnY6oFsX1Q=;
 b=Wui5bRQHKP6F0O9g3h9Be34BTyg9Ewi84AzF3qmOemHbraqU4ZI48wt5nWGhO75vYH
 TbakNR2UY1BfopfI+Wfcfu1iJNPJOGIKo8UCZkQZCeJQyhViFwQcliJI8aUQy7pMEiU9
 gpuMThKumTcmG07WfsBBiYuRX4prqTYnv3+BeL1fD0Ov3ljy7ayo0xCI580VmjlFFCMO
 Qa9xkrK8HESNoQt1CrKAJcwUS1aARVkZ3r3EgrevXB6FnhvitNm/qVB2YDk22nu+cRwE
 7q7n8aGh33mks6L3J5sES+nvXrXs/XLKNJ61JIk1gx3OmXD2Qkyt2Tvnrw4VUvJkWD2i
 9BBA==
X-Gm-Message-State: APjAAAU4peInQJ36MuC5QhtwNPrB9OR/FNLaop5dBpGpSoSyukhqP0kT
 NkVR3kk38vX+OhZB9JjA55xBuA==
X-Google-Smtp-Source: APXvYqwV0uyfdAheNbO9WR0r52FgmbieTRfSTGc5nqZhx6ndvBa2n8MA+ZWkciky+Z/HdaS4N8i+DQ==
X-Received: by 2002:a1c:8095:: with SMTP id b143mr5431868wmd.7.1580224485772; 
 Tue, 28 Jan 2020 07:14:45 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d14sm27670784wru.9.2020.01.28.07.14.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2020 07:14:44 -0800 (PST)
Date: Tue, 28 Jan 2020 16:14:42 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 01/15] drm: Initialize struct drm_crtc_state.no_vblank
 from device settings
Message-ID: <20200128151442.GH43062@phenom.ffwll.local>
References: <20200123092123.28368-1-tzimmermann@suse.de>
 <20200123092123.28368-2-tzimmermann@suse.de>
 <CACvgo53YvKjPNNshZoTjJehHyOX6e05kJ5gAXtjwxs+oLLv7vw@mail.gmail.com>
 <183782e6-164c-bae8-90e0-906edb059a1d@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <183782e6-164c-bae8-90e0-906edb059a1d@suse.de>
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
Cc: david@lechnology.com, Sam Ravnborg <sam@ravnborg.org>,
 oleksandr_andrushchenko@epam.com, Dave Airlie <airlied@linux.ie>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Hans de Goede <hdegoede@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 xen-devel@lists.xenproject.org, Emil Velikov <emil.velikov@collabora.com>,
 Sean Paul <sean@poorly.run>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 27, 2020 at 07:42:27PM +0100, Thomas Zimmermann wrote:
> Hi Emil
> =

> Am 27.01.20 um 19:12 schrieb Emil Velikov:
> > Hi Thomas,
> > =

> > On Thu, 23 Jan 2020 at 09:21, Thomas Zimmermann <tzimmermann@suse.de> w=
rote:
> > =

> >> @@ -174,12 +174,22 @@ struct drm_crtc_state {
> >>          * @no_vblank:
> >>          *
> >>          * Reflects the ability of a CRTC to send VBLANK events. This =
state
> >> -        * usually depends on the pipeline configuration, and the main=
 usuage
> >> -        * is CRTCs feeding a writeback connector operating in oneshot=
 mode.
> >> -        * In this case the VBLANK event is only generated when a job =
is queued
> >> -        * to the writeback connector, and we want the core to fake VB=
LANK
> >> -        * events when this part of the pipeline hasn't changed but ot=
hers had
> >> -        * or when the CRTC and connectors are being disabled.
> >> +        * usually depends on the pipeline configuration. If set to tr=
ue, DRM
> >> +        * atomic helpers will sendout a fake VBLANK event during disp=
lay
> >> +        * updates.
> >> +        *
> >> +        * One usage is for drivers and/or hardware without support fo=
r VBLANK
> >> +        * interrupts. Such drivers typically do not initialize vblank=
ing
> >> +        * (i.e., call drm_vblank_init() wit the number of CRTCs). For=
 CRTCs
> >> +        * without initialized vblanking, the field is initialized to =
true and
> >> +        * a VBLANK event will be send out on each update of the displ=
ay
> >> +        * pipeline.
> >> +        *
> >> +        * Another usage is CRTCs feeding a writeback connector operat=
ing in
> >> +        * oneshot mode. In this case the VBLANK event is only generat=
ed when
> >> +        * a job is queued to the writeback connector, and we want the=
 core
> >> +        * to fake VBLANK events when this part of the pipeline hasn't=
 changed
> >> +        * but others had or when the CRTC and connectors are being di=
sabled.
> >>          *
> > =

> > Perhaps it's just me, yet the following ideas would make the topic
> > significantly easier and clearer.
> > =

> >  - adding explicit "fake" when talking about drm/atomic _helpers_
> > generating/sending a VBLANK event.
> > For example, in 15/15 the commit message says "fake", while inline
> > comment omits it... Leading to the confusion pointed out.
> =

> No problem on being more precise here. I'll update the docs accordingly.
> =

> > =

> > - s/no_vblank/fake_vblank/g or s/no_vblank/no_hw_vblank/g
> > Simple and concise. With slight inclination towards the former wording =
:-)
> =

> I'd prefer to not change the field's name. The current name 'no_vblank'
> indicates state and lets helpers decide what to do with it. The name
> 'fake_vblank' indicates an instruction to the helpers, telling them what
> to do. It does neither seem to fit into drm_crtc_state, nor into the
> overall concept.

Yeah e.g. xen has no hw vblank, but still has special processing of
events, which are kinda triggered by the "hw" (it's an event from the
compositor).

Maybe the confusion is with the helper function that generates the
fake_vblank, since it's not really a fake vblank at all, it's just "send
out this atomic completion event now, I'm not going to do it as part of
the vblank processing since no vblank". So maybe that function should be
called _send_events_i_have_no_hw_vblank, which yeah is not a great name
:-) But maybe you have an idea for that one?
-Daniel

> =

> Best regards
> Thomas
> =

> > =

> > If you and Daniel agree with the rename, then the first sentence of
> > the description should probably be tweaked.
> > =

> > HTH
> > Emil
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
