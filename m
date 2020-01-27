Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF7114A97C
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2020 19:12:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F4636E5B6;
	Mon, 27 Jan 2020 18:12:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B031A6E5B6
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 18:12:20 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id y3so3805075uae.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 10:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/uvHN7A7OT+bEIM3tP943o1xbsY41GvLCup21iM4/gc=;
 b=tuE4ZEtAUqVx1srhsqnBxX27/n+WfSn6yY0qv6+hFjaKzBiF11NctF8Ez5JX/QETBj
 YVG7g2BPSkjCgd7vjENxbjT6CmhjJ81Lj+0ob5J+dmCSW/wRQ0973iuV7+2Vz2k7MarM
 1LfWu6KQM1WCdoEPTG8Fw5NIlpFTl1eGA71roQvJnyUg9VDPzH5jKYreYybYwb5Gamgp
 DpH4+S3LJDHUrQhN1Uu0+6SnV0kw6Py/blMYwlWCk322fANsSBpURdIfR6QeKa3CK2a8
 jDTRFEjd9Ub7Q2l2DdVPqZEA52BOzCbSrr85zHR81/vuCE8Pq6PiBEkWp1iat+Ocg03L
 D4Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/uvHN7A7OT+bEIM3tP943o1xbsY41GvLCup21iM4/gc=;
 b=aAW3NGxaFF689k2FLmM7wdRfwbHyV6tQzkDMvqN/UTk8+WZJSXHIGs9/fkVCrTvSE0
 nJkoR61NzLy8pW5OwJlosMPaZ356Bse73EU4qM6H2QQ2LThQIAUbakzB5QdYlRbWv0+q
 zw3puEJ7mPTOO4D3nrcj39kBtP1yKQkSudbZzyuOTO0XCgR0+b7ICaH1JS99n5Fxl+uU
 tNaQs/psEg3pJlB88HduLQ8xI75M92IX4a/wboJGEDrvrnc1sC54nAJWFHc4AyZdjOh4
 yRDLi/4qVWqgodX2a1Z94jUEczHIlaRlzyTiMSiiCg79DPB6UUguFNXXbreUC4s9exh5
 pyCA==
X-Gm-Message-State: APjAAAUjd9/LTCQQ72sGt8lAXpnOI5Oc+dulRHLMOQCnZgcMPY3/vLm+
 axtKtRRTOJNDV2VvaerQIKh1SRXhZEP7y3wgLhylZg2V
X-Google-Smtp-Source: APXvYqwK5KmxifcPjLSjf5c8jkZHQcHzkH16GHhUeR4MCzx5Gy8Rt6ekqTRLSWMH36hOxYwaCgiqGLWChyi8dbuYFdA=
X-Received: by 2002:ab0:5bc6:: with SMTP id z6mr10702811uae.46.1580148739730; 
 Mon, 27 Jan 2020 10:12:19 -0800 (PST)
MIME-Version: 1.0
References: <20200123092123.28368-1-tzimmermann@suse.de>
 <20200123092123.28368-2-tzimmermann@suse.de>
In-Reply-To: <20200123092123.28368-2-tzimmermann@suse.de>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 27 Jan 2020 18:12:54 +0000
Message-ID: <CACvgo53YvKjPNNshZoTjJehHyOX6e05kJ5gAXtjwxs+oLLv7vw@mail.gmail.com>
Subject: Re: [PATCH v4 01/15] drm: Initialize struct drm_crtc_state.no_vblank
 from device settings
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
Cc: david@lechnology.com, oleksandr_andrushchenko@epam.com,
 Dave Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Hans de Goede <hdegoede@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 xen-devel@lists.xenproject.org, Emil Velikov <emil.velikov@collabora.com>,
 Sean Paul <sean@poorly.run>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Thu, 23 Jan 2020 at 09:21, Thomas Zimmermann <tzimmermann@suse.de> wrote:

> @@ -174,12 +174,22 @@ struct drm_crtc_state {
>          * @no_vblank:
>          *
>          * Reflects the ability of a CRTC to send VBLANK events. This state
> -        * usually depends on the pipeline configuration, and the main usuage
> -        * is CRTCs feeding a writeback connector operating in oneshot mode.
> -        * In this case the VBLANK event is only generated when a job is queued
> -        * to the writeback connector, and we want the core to fake VBLANK
> -        * events when this part of the pipeline hasn't changed but others had
> -        * or when the CRTC and connectors are being disabled.
> +        * usually depends on the pipeline configuration. If set to true, DRM
> +        * atomic helpers will sendout a fake VBLANK event during display
> +        * updates.
> +        *
> +        * One usage is for drivers and/or hardware without support for VBLANK
> +        * interrupts. Such drivers typically do not initialize vblanking
> +        * (i.e., call drm_vblank_init() wit the number of CRTCs). For CRTCs
> +        * without initialized vblanking, the field is initialized to true and
> +        * a VBLANK event will be send out on each update of the display
> +        * pipeline.
> +        *
> +        * Another usage is CRTCs feeding a writeback connector operating in
> +        * oneshot mode. In this case the VBLANK event is only generated when
> +        * a job is queued to the writeback connector, and we want the core
> +        * to fake VBLANK events when this part of the pipeline hasn't changed
> +        * but others had or when the CRTC and connectors are being disabled.
>          *

Perhaps it's just me, yet the following ideas would make the topic
significantly easier and clearer.

 - adding explicit "fake" when talking about drm/atomic _helpers_
generating/sending a VBLANK event.
For example, in 15/15 the commit message says "fake", while inline
comment omits it... Leading to the confusion pointed out.

- s/no_vblank/fake_vblank/g or s/no_vblank/no_hw_vblank/g
Simple and concise. With slight inclination towards the former wording :-)

If you and Daniel agree with the rename, then the first sentence of
the description should probably be tweaked.

HTH
Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
