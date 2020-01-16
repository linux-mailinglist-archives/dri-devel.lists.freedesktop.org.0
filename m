Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC76F13E6BE
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 18:22:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 492A76EE2D;
	Thu, 16 Jan 2020 17:22:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com
 [IPv6:2607:f8b0:4864:20::942])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 889C06EE2D
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 17:22:08 +0000 (UTC)
Received: by mail-ua1-x942.google.com with SMTP id 1so7921930uao.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 09:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hjlPO7BPZ/JlQoLqlUXvQTlJfTAbQfDZ8K8Uze8BU/s=;
 b=YKMxolQBt/5TtzXuM46+gh9+XoXFQUxQh/cVpqTPRL0MhbKQNmtAXQKA013/fyOecO
 w136SaOLrnBnJBQtcqo0CSjSuaDQjPv55UatHkkhtYeF88FMZL8rGhX9mMFc9grHdBXe
 9SuUZBrHr+8b/qwPkCSb4ftodkLJBP1DGWj0o28IQuMPz7nOqJ//eyp+S2oLV/hf1FkZ
 U6ayL/rVh/7ZtcFiYIHF6p1z9xQAcb+9jsVzlmo4YgRCaVHQ4ESCv1TfZvGT8NrH9sLu
 TrKfjOztyqm3R0nOU3nG9D/tKkM9/NO+NWzfV/+d2Pk0xorsvpuk5/1tENmSDHf+cGTy
 IG/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hjlPO7BPZ/JlQoLqlUXvQTlJfTAbQfDZ8K8Uze8BU/s=;
 b=aZdfGTNeCjIGgifMgs89/TTCG/37oWkD0KG5z9LHmIr4AmHVxgdonZk+RO+G7bMNjJ
 /hsVob1Dg1Me5gWSexAkH7d+QvKXyAxc0rllzbRgFkqeYs2UfDwtmzBIP2L5Kjbu+eQN
 zr3K55G8l5JgomkBIoh0Fv3zk0alxTjxS8Ffepb0SZHbIixTNXdGmxu+EYMPl1efbO1/
 mSiCk+IBrNoZrMt22JI5MqSxTbFuCng/AOxgMER68NjoCgxccDQaX78kL7fCWTFL0iA6
 49sabE57ChyyrvdQC92og7w4d0td4+CH7am1qkojZgx1SaFQtkOwBhq7q3az3hOiwn59
 xnQg==
X-Gm-Message-State: APjAAAW8HNcZS7Gb7r8Hb77D653B472dhLQTwnhdFhNbnwcIPpZ5v9F8
 fWxi6iTgcblqFV0GkKbYE/fjmIYKGJ6RKAvsDZk=
X-Google-Smtp-Source: APXvYqyZHt1bqJYkRt6MbFegAzbw6GywWUBqaQuyP76aQnU4RRq0QOEI8YeE5E4qQi+Z4gewiSopIQgd5bPceS0uhj4=
X-Received: by 2002:ab0:14a2:: with SMTP id d31mr18349536uae.106.1579195327403; 
 Thu, 16 Jan 2020 09:22:07 -0800 (PST)
MIME-Version: 1.0
References: <20200115125226.13843-1-tzimmermann@suse.de>
 <20200115125226.13843-5-tzimmermann@suse.de>
 <20200116064107.GB8400@dvetter-linux.ger.corp.intel.com>
 <33fdd33f-ce8d-70d3-544e-fac727d2686b@suse.de>
In-Reply-To: <33fdd33f-ce8d-70d3-544e-fac727d2686b@suse.de>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 16 Jan 2020 17:22:34 +0000
Message-ID: <CACvgo52gwC6U5HjnsQSUUDgE7Gp_EDb-QqCY8VDFjAX7cE0Lxg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drm/simple-kms: Let DRM core send VBLANK events by
 default
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, david@lechnology.com,
 oleksandr_andrushchenko@epam.com, Dave Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, ML dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Hans de Goede <hdegoede@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 xen-devel@lists.xenproject.org, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

On Thu, 16 Jan 2020 at 07:37, Thomas Zimmermann <tzimmermann@suse.de> wrote:

> > diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> > index 7cf3cf936547..23d2f51fc1d4 100644
> > --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> > @@ -149,6 +149,11 @@ void __drm_atomic_helper_crtc_duplicate_state(struct drm_crtc *crtc,
> >       /* Self refresh should be canceled when a new update is available */
> >       state->active = drm_atomic_crtc_effectively_active(state);
> >       state->self_refresh_active = false;
> > +
> > +     if (drm_dev_has_vblank(crtc->dev))
> > +             state->no_vblank = true;
> > +     else
> > +             state->no_vblank = false;
> >  }
> >  EXPORT_SYMBOL(__drm_atomic_helper_crtc_duplicate_state);
>
> I think the if/else branches are in the wrong order.
>
> But generally speaking, is it really that easy? The xen driver already
> has to work around simple-kms's auto-enabling of no_vblank (see patch
> 4). Maybe this settings interferes with other drivers as well. At least
> the calls for sending fake vblanks should be removed from all affected
> drivers.
>

I'm not sure if setting no_vblank based on dev->num_crtcs is the correct thing.
From the original commit and associated description for no_vblank:

In some cases CRTCs are active but are not able to generating events, at
least not at every frame at it's expected to.
This is typically the case when the CRTC is feeding a writeback connector...

Reflects the ability of a CRTC to send VBLANK events....


The proposed handling of no_vblank feels a little dirty, although
nothing better comes to mind.
Nevertheless code seems perfectly reasonable, so if it were me I'd merge it.

HTH
Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
