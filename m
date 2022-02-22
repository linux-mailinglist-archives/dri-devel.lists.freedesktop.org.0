Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3F64C03EE
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 22:36:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 113C510E787;
	Tue, 22 Feb 2022 21:36:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75C6E10E787
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 21:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645565767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GHlvL+qa3AWJMC3bfUfdMF0t/irgJlBJMoEQilLmh9s=;
 b=ZctQLvWyQjk/c42zA9nlUQ1if8pzPQ/GTt8Q6pCJaP30auN4l5QlDqmXusPkFTPY+eW/VS
 vGVGbopFdbaKPSckZjBRgq49b42s0p1aFtxzfRQcaQvfLxMy9JVAQ8mMn18JZccpoRbY3D
 6aO10q7Fw/m8BJvOf7BQnlzcp9j79Cw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-27-nfLNgj4EOW-DmvryB2ptzw-1; Tue, 22 Feb 2022 16:36:06 -0500
X-MC-Unique: nfLNgj4EOW-DmvryB2ptzw-1
Received: by mail-wr1-f71.google.com with SMTP id
 g15-20020adfbc8f000000b001e9506e27ddso6438476wrh.22
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 13:36:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GHlvL+qa3AWJMC3bfUfdMF0t/irgJlBJMoEQilLmh9s=;
 b=cENScThcdnVpeIs/+o3wXtH8KGyRFvI55Wco+hF1gPSbzeS0sfDKFWpxIykmmbD+cu
 x2HggQhYbOuDGuTqOhuk6edCXUDWl6csVTltKEDM9s1pmhdDjWD2rND2EIWKWaTfJEdz
 MAEL8i5CnuyMz565AP4fjHDEf9zLc82MD0GocExFNe8UYjJsdKt3sD+R9PJjRSVUsmyP
 A0K6spokexwkjozrcvB46t2YkDKBMBM8up+/E+0EJ44JkqEwq55LNjLZOe6oLBQnOJEW
 txF4N7YolzlMbx4d2hHI3fUUJ/YJlWnrlABxlSPLz9E3CUoluaKg0COJ/TuErFBIVgj2
 scOw==
X-Gm-Message-State: AOAM532TIQSCVq33GNWro3rvJcrOB152uxAjNidBt9dxkmQ0xKjQP2vd
 8xt4Dv9c0Co7hrhReFPNLN8NTJq5GpuGoleW6yn9vWxBESqjxRulyXhwAF9Ky2jwjMReLoddZKz
 LRTGzDVwDvlBE5GOfA6abHgLMjMvJzkh2C1bskN9jWlDL
X-Received: by 2002:a05:6000:1888:b0:1e7:cd21:c24f with SMTP id
 a8-20020a056000188800b001e7cd21c24fmr21273866wri.308.1645565764921; 
 Tue, 22 Feb 2022 13:36:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxKZwco+lhuaJW5BywbUxVn+xeac+1syv9SkgSbImzQ0M3bxnzm2aY0asfxEm3N6JXLroTqCYY88lEXCZWmouM=
X-Received: by 2002:a05:6000:1888:b0:1e7:cd21:c24f with SMTP id
 a8-20020a056000188800b001e7cd21c24fmr21273857wri.308.1645565764737; Tue, 22
 Feb 2022 13:36:04 -0800 (PST)
MIME-Version: 1.0
References: <20220221095918.18763-1-maxime@cerno.tech>
 <20220221095918.18763-14-maxime@cerno.tech>
 <CACO55tt8eTkEZp_DSFQ3Lt3+WBX1g3iwrB6-eTT=91bAk1NPEw@mail.gmail.com>
 <20220222140237.jeae5o27z6oy5imp@houat>
In-Reply-To: <20220222140237.jeae5o27z6oy5imp@houat>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 22 Feb 2022 22:35:53 +0100
Message-ID: <CACO55tvTF33YPZbCgPZ0LmbQdcNabszbx9M+YZUe0ORtRWZF9A@mail.gmail.com>
Subject: Re: [PATCH v2 13/22] drm/nouveau/kms: Remove redundant zpos
 initialisation
To: Maxime Ripard <maxime@cerno.tech>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 22, 2022 at 3:02 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi,
>
> On Mon, Feb 21, 2022 at 05:42:36PM +0100, Karol Herbst wrote:
> > On Mon, Feb 21, 2022 at 11:00 AM Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > The nouveau KMS driver will call drm_plane_create_zpos_property() with
> > > an init value depending on the plane purpose.
> > >
> > > Since the initial value wasn't carried over in the state, the driver had
> > > to set it again in nv50_wndw_reset(). However, the helpers have been
> > > adjusted to set it properly at reset, so this is not needed anymore.
> > >
> > > Cc: nouveau@lists.freedesktop.org
> > > Cc: Ben Skeggs <bskeggs@redhat.com>
> > > Cc: Karol Herbst <kherbst@redhat.com>
> > > Cc: Lyude Paul <lyude@redhat.com>
> > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > ---
> > >  drivers/gpu/drm/nouveau/dispnv50/wndw.c | 2 --
> > >  1 file changed, 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> > > index 133c8736426a..0c1a2ea0ed04 100644
> > > --- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> > > +++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> > > @@ -635,8 +635,6 @@ nv50_wndw_reset(struct drm_plane *plane)
> > >                 plane->funcs->atomic_destroy_state(plane, plane->state);
> > >
> > >         __drm_atomic_helper_plane_reset(plane, &asyw->state);
> > > -       plane->state->zpos = nv50_wndw_zpos_default(plane);
> > > -       plane->state->normalized_zpos = nv50_wndw_zpos_default(plane);
> >
> > so reading the surrounding code a little it feels like those
> > assignments actually do something. If my understanding is correct
> > plane->state points to &asyw->state, but asyw was just kzalloced in
> > this function. __drm_atomic_helper_plane_reset doesn't set the zpos or
> > normalized_zpos fields as long as zpos_property is 0, so those fields
> > won't be set with that change anymore.
> >
> > I just don't know if it's fine like that or if this function should
> > set zpos_property instead or something. Anyway, the commit description
> > makes it sound like that an unneeded assignment would be removed here,
> > which doesn't seem to be the case. But I don't really know much about
> > all the drm API interactions, so it might just be fine, mostly asking
> > to get a better idea on how all those pieces fit together.
>
> If you're looking at the code without that patch series, you're right.
>
> These patches change that however:
> https://lore.kernel.org/dri-devel/20220221095918.18763-7-maxime@cerno.tech/
> https://lore.kernel.org/dri-devel/20220221095918.18763-8-maxime@cerno.tech/
>
> So, once they have been applied those assignments are made in
> __drm_atomic_helper_plane_reset and are no longer relevant here.
>

yeah, I saw those, but I see now where I got confused: the arguments
of __drm_atomic_helper_plane_reset and
__drm_atomic_helper_plane_state_reset are swapped, so I thought
&asyw->state being all 0 was the second arg to
__drm_atomic_helper_plane_state_reset. Yeah the code is alright then.

Reviewed-by: Karol Herbst <kherbst@redhat.com>

> Maxime

