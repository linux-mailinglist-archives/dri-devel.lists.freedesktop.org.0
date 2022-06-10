Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8103E54609E
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 10:59:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A21B91131FA;
	Fri, 10 Jun 2022 08:59:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8336811253E
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 08:59:08 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id p10so35596394wrg.12
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 01:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Ru8T+YLZU7V4N/egCecXbWtTEtZhEL0ZhmuSjOntRzw=;
 b=Tp95PgEHN0rKU80rDK8xrLsw1+WPUnGvuWh/5DZ7d+J9Pb0DL0attu7qNjrArIBKpd
 EFa0dKxqnGP8GmrTFBeBlNJj48Eku8217vUVi2Aw2PxoufoBQu4hETLaOuSiE+b2drzl
 z1n4cdL5nFQbW6lz25KU0gL+CVBK+eQDe0qvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ru8T+YLZU7V4N/egCecXbWtTEtZhEL0ZhmuSjOntRzw=;
 b=AuMTPcSdvPUUWFXpQJgQeOyjPdmxP4OU8/4mwprxOl+lcNgVTeajdj9l3Q3RPI1d9y
 NsAv44YIMv/HEnqLMYAA7u9LnxyvNhWqg2BAlKRKcmZMV+x01rn2ALzMkM54aAHQtruj
 7BO4IS05Q3zlcQaJov2PfCfyG+sU9X8YyKu5WeN1Q/2oBuQLJZt8D1ZBi5FuCNyWxlrY
 mbfujIgqQGCqTKTGsPfNZwf2FsnuQx/Od7wogi0U6wzEe5qM90Pyup4z9GWLCAle9r1G
 Yn69YokgPMCU4kCHhsv07VsslF/klkmsD9OV1IWBYJL9suhFvp+ZHJjALGTS7miSZ5bn
 9d2Q==
X-Gm-Message-State: AOAM5314hr0ZWV4kZX5GP281VjNDJep/QLhu8udS5yczvRHO2LorvWJm
 G5M0mDxX7HU/LKgrjPqmnXqXUg==
X-Google-Smtp-Source: ABdhPJz82TW6vKXl6koZIzaW1VAFxW1B0h8wun8cAJq/gRkjnBk6wUUfVjs5RZe3II6D2WrjVMxsIA==
X-Received: by 2002:a05:6000:1548:b0:217:6480:e65 with SMTP id
 8-20020a056000154800b0021764800e65mr29954757wry.381.1654851547040; 
 Fri, 10 Jun 2022 01:59:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 bp3-20020a5d5a83000000b0020cff559b1dsm26347688wrb.47.2022.06.10.01.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 01:59:05 -0700 (PDT)
Date: Fri, 10 Jun 2022 10:59:03 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 0/6] drm: Add mouse cursor hotspot support to atomic KMS
Message-ID: <YqMH14MEqGZtujfk@phenom.ffwll.local>
References: <20220602154243.1015688-1-zack@kde.org>
 <wRnf-Lm5zz6v1e-NlnFPteyARuLl-R98mOZZVjePHD5ue7QQNR_TSU7RwYBssgUa7xM5hf7Fe59-gMEj81ESrHY3mu_H7yE0dtGhFHFPTnc=@emersion.fr>
 <YqMDoSMOL2rsfJj/@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YqMDoSMOL2rsfJj/@phenom.ffwll.local>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Hans de Goede <hdegoede@redhat.com>, David Airlie <airlied@linux.ie>,
 mombasawalam@vmware.com, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>, krastevm@vmware.com,
 Pekka Paalanen <ppaalanen@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 wayland-devel <wayland-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 10, 2022 at 10:41:05AM +0200, Daniel Vetter wrote:
> Hi all,
> 
> Kinda top post because the thread is sprawling and I think we need a
> summary/restart. I think there's at least 3 issues here:
> 
> - lack of hotspot property support, which means compositors can't really
>   support hotspot with atomic. Which isn't entirely true, because you
>   totally can use atomic for the primary planes/crtcs and the legacy
>   cursor ioctls, but I understand that people might find that a bit silly :-)
> 
>   Anyway this problme is solved by the patch set here, and I think results
>   in some nice cleanups to boot.
> 
> - the fact that cursors for virtual drivers are not planes, but really
>   special things. Which just breaks the universal plane kms uapi. That
>   part isn't solved, and I do agree with Simon and Pekka that we really
>   should solve this before we unleash even more compositors onto the
>   atomic paths of virtual drivers.
> 
>   I think the simplest solution for this is:
>   1. add a new DRM_PLANE_TYPE_VIRTUAL_CURSOR, and set that for these
>   special cursor planes on all virtual drivers
>   2. add the new "I understand virtual cursors planes" setparam, filter
>   virtual cursor planes for userspace which doesn't set this (like we do
>   right now if userspace doesn't set the universal plane mode)
>   3. backport the above patches to all stable kernels
>   4. make sure the hotspot property is only set on VIRTUAL_CURSOR planes
>   and nothing else in the rebased patch series

Simon also mentioned on irc that these special planes must not expose the
CRTC_X/Y property, since that doesn't really do much at all. Or is our
understanding of how this all works for commandeered cursors wrong?

> - third issue: These special virtual display properties arent documented.
>   Aside from hotspot there's also suggested X/Y and maybe other stuff. I
>   have no idea what suggested X/Y does and what userspace should do with
>   it. I think we need a new section for virtualized drivers which:
>   - documents all the properties involved
>   - documents the new cap for enabling virtual cursor planes
>   - documents some of the key flows that compositors should implement for
>     best experience
>   - documents how exactly the user experience will degrade if compositors
>     pretend it's just a normal kms driver (maybe put that into each of the
>     special flows that a compositor ideally supports)
>   - whatever other comments and gaps I've missed, I'm sure
>     Simon/Pekka/others will chime in once the patch exists.

Great bonus would be an igt which demonstrates these flows. With the
interactive debug breakpoints to wait for resizing or whatever this should
be all neatly possible.
-Daniel

> 
> There's a bit of fixing oopsies (virtualized drivers really shouldn't have
> enabled universal planes for their cursors) and debt (all these properties
> predate the push to document stuff so we need to fix that), but I don't
> think it's too much. And I think, from reading the threads, that this
> should cover everything?
> 
> Anything I've missed? Or got completely wrong?
> 
> Cheers, Daniel
> 
> On Fri, Jun 03, 2022 at 02:14:59PM +0000, Simon Ser wrote:
> > Hi,
> > 
> > Please, read this thread:
> > https://lists.freedesktop.org/archives/dri-devel/2020-March/thread.html#259615
> > 
> > It has a lot of information about the pitfalls of cursor hotspot and
> > other things done by VM software.
> > 
> > In particular: since the driver will ignore the KMS cursor plane
> > position set by user-space, I don't think it's okay to just expose
> > without opt-in from user-space (e.g. with a DRM_CLIENT_CAP).
> > 
> > cc wayland-devel and Pekka for user-space feedback.
> > 
> > On Thursday, June 2nd, 2022 at 17:42, Zack Rusin <zack@kde.org> wrote:
> > 
> > > - all userspace code needs to hardcore a list of drivers which require
> > > hotspots because there's no way to query from drm "does this driver
> > > require hotspot"
> > 
> > Can you elaborate? I'm not sure I understand what you mean here.
> > 
> > Thanks,
> > 
> > Simon
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
