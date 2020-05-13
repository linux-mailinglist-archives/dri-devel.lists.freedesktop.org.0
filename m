Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDD71D128C
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 14:23:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F40916E9FD;
	Wed, 13 May 2020 12:23:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56C516E9FD
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 12:23:33 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id g12so28247858wmh.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 05:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=t88oFVtb1VDdxKBh3WA5Q6XMLeyFlZJV7nisUtni0uI=;
 b=ZyuUALov7FE1wVwRXgl+yHVGfyrjJwxDxDuPRLYTqvTEM1Ms5c/gCaK7imSqpI0yrC
 aQ5e6QKaw1B7mjFhu2GMeDEdFsBBP8/AEMmZOILapFmeh+Ae/1cJYa3CtVFxiwAcxeCw
 loAt7MIfIkuhgSH/Qh1wSemDw68E5IVQ60AAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=t88oFVtb1VDdxKBh3WA5Q6XMLeyFlZJV7nisUtni0uI=;
 b=GdRkz9g4Mswvaol3cOeLYsHDHWQzK/eBtEoDL3d5is+Uk9MUP07NsBVuaxsSbTorte
 RJuvZqMjo2MIzRec8zwiNPfME8TjosL955KMm9tNfS/efOPB6DDsX0R+u27KzPJkNy5X
 Za3ikD2xS+5yYOmMKWzRVrr54I8KsoHrRDmenL5dWow2/U3cVRnjnZmpGYUBRw+oC2pE
 GzDyJ1q9jUmF/KJbMRBLRr3Y7M//2qBGaLYVEUGAa5ZTscTq1tiqrK/gwAu1NoiaAno0
 fdlyO3TpmH+iyab9Fj/9PN7pTU+lZK1KmCcChozlYcTT3bXwjNiTOnCsmoBtuUeTp3zB
 aThg==
X-Gm-Message-State: AOAM532H3MSw7tOiqyzGe+RgJSQiKTrLaSafFRWxFWeWRLVU8qFIF3qy
 EjXgMfG2kvR+QJlj3NSLP79qXg==
X-Google-Smtp-Source: ABdhPJwIjcUBd7b0BUtA6+qYFw/qIGoTBbbXC7h+4sYuM12NQ6zFhakNTjy/tq+2Z4CTf97Ms96fUg==
X-Received: by 2002:a7b:c146:: with SMTP id z6mr4954894wmi.156.1589372612050; 
 Wed, 13 May 2020 05:23:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r11sm24211204wma.35.2020.05.13.05.23.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 05:23:31 -0700 (PDT)
Date: Wed, 13 May 2020 14:23:29 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH v2 12/15] drm/mgag200: Remove out-commented
 suspend/resume helpers
Message-ID: <20200513122329.GI206103@phenom.ffwll.local>
References: <20200512084258.12673-1-tzimmermann@suse.de>
 <20200512084258.12673-13-tzimmermann@suse.de>
 <CACvgo522zu525bZX=s=h1AeTAFbbAVsWtFLwgt=i0uBORb-oVw@mail.gmail.com>
 <a2cc8ef0-f519-39ae-ea7f-52ff10e79d6a@suse.de>
 <CACvgo51iCz2d+P=CSvcAzD+DvygTVJkEfuB6-A=0uH5+9B5z_g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACvgo51iCz2d+P=CSvcAzD+DvygTVJkEfuB6-A=0uH5+9B5z_g@mail.gmail.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: john.p.donnelly@oracle.com, Thomas Zimmermann <tzimmermann@suse.de>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 13, 2020 at 10:15:25AM +0100, Emil Velikov wrote:
> On Tue, 12 May 2020 at 19:47, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >
> > Hi
> >
> > Am 12.05.20 um 12:14 schrieb Emil Velikov:
> > > Hi Thomas,
> > >
> > > On Tue, 12 May 2020 at 09:43, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > >>
> > >> The suspend/resume helpers are unused. Also remove associated state
> > >> from struct mga_device.
> > >>
> > > Although DPMS in it's traditional sense is no longer a thing, would it
> > > make sense to keep this around for documentation purposes?
> > > In particular, the pci magic and associated PLL/DAC/pixel clock could
> > > be used for dynamic PM.
> >
> > That patch is not about DPMS. The DPMS code is still there. The
> > suspend/resume helpers were outcommented and I don't know if they ever
> > worked. Let's remove them.
> >
> Seems like the idea is to suspend/resume the device on DPMS off/on. A
> rather moot point IMHO.
> As the DPMS semantics and the whole modeset, got more subtle with
> atomic modeset, the idea gets even more moot.

With atomic it's actually a lot easier to do runtime pm in your
modesetting code, since the flow is a lot more structured. There's even a
helper function for that with drm_atomic_helper_commit_tail_rpm, since the
default is optimized for max compatability with old legacy helpers. Maybe
we should switch that around actually.
-Daniel

> If the documentation has that process - sure nuke it. Although for
> dynPM, this code is essential.
> Considering a) one has interest in dynPM and b) the code is (close to) working.
> 
> The last two are very big ifs so I'll leave it there.
> 
> -Emil

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
