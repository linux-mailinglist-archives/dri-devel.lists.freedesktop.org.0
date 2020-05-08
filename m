Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3491CA97E
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 13:25:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB8776EB12;
	Fri,  8 May 2020 11:25:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6A836EB12
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 11:25:23 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id l18so1428379wrn.6
 for <dri-devel@lists.freedesktop.org>; Fri, 08 May 2020 04:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OEiRu8fDMHeMig14yk3oyA1kFIFsdb4VwqJUmgquhAU=;
 b=bCQwNkMxTP26uja13yTIfjw4d95B04dqZEDRutICRJJ8ZwGLnZeERJ7C+TPFnPBlfK
 7p2VFComMa+YxIY6YW38xPSW/CVkMNsEuPbNO65LYtwX4KzQjiLGxO8P7T48r0TEv7vY
 nYVq0r7DR+0pNJweI5Mho2Vw2spPcLSXBgJXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OEiRu8fDMHeMig14yk3oyA1kFIFsdb4VwqJUmgquhAU=;
 b=p10sONCsvCruufb1twF+v+xXqeAwqpMOjawtux8RX9nqCx9Y8EfA4vyKE32G35gdrr
 x8m2hH0GCMc4gsaPYc0VnO58N15hzNdc6I/8c0l8n8tez/moQp7IiCh0BhUgZ9HsVxM3
 t+rBn4DI1xlKZPrIidfmcpOM7LwXVzV58wySTtzL4fXDBCpy8DYNQ4E3V+Kh+j0Pgyo/
 N0soTA1V3udSryCLP+HKZM9o2BZ1tJxWyWdXC2sc56SQLFLNUDC8gLGNI4TCpTGKWlO3
 NbBLig2qdwPAhrq/nX6lBJxRzmZbdCA7wES22BFGf4LwZO/oqfEJ8Z3p2nd0NmgTLG6K
 u11g==
X-Gm-Message-State: AGi0PuaOUjwDkM6Q8RGvtkDBW+zA5muHvEi0XhAgAcr8wvuQxeTvupUz
 pRYAgwMq95zMSJXDwnI6+W36kQ==
X-Google-Smtp-Source: APiQypJs8jtJoIl/vfKuSaY8FiKYZTELm86tssK3d01t6Nnw698gk4T87xzYbAg88YZscEM1ahFKyw==
X-Received: by 2002:adf:e7cb:: with SMTP id e11mr2314069wrn.145.1588937122602; 
 Fri, 08 May 2020 04:25:22 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h17sm12978205wmm.6.2020.05.08.04.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2020 04:25:21 -0700 (PDT)
Date: Fri, 8 May 2020 13:25:19 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 10/36] drm/gem: add _locked suffix to drm_object_put
Message-ID: <20200508112519.GI1383626@phenom.ffwll.local>
References: <20200507150822.114464-1-emil.l.velikov@gmail.com>
 <20200507150822.114464-11-emil.l.velikov@gmail.com>
 <20200508064053.GB1383626@phenom.ffwll.local>
 <CACvgo53fa1R3gD8hCg+Ch2Tj0ZnDVScNXiZO5FbGfK_VbAP_nQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACvgo53fa1R3gD8hCg+Ch2Tj0ZnDVScNXiZO5FbGfK_VbAP_nQ@mail.gmail.com>
X-Operating-System: Linux phenom 5.4.0-4-amd64 
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
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 08, 2020 at 12:00:40PM +0100, Emil Velikov wrote:
> On Fri, 8 May 2020 at 07:40, Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Thu, May 07, 2020 at 04:07:56PM +0100, Emil Velikov wrote:
> > > From: Emil Velikov <emil.velikov@collabora.com>
> > >
> > > Vast majority of DRM (core and drivers) are struct_mutex free.
> > >
> > > As such we have only a handful of cases where the locked helper should
> > > be used. Make that stand out a little bit better.
> > >
> > > Done via the following script:
> > >
> > > __from=drm_gem_object_put
> > > __to=drm_gem_object_put_locked
> > >
> > > for __file in $(git grep --name-only --word-regexp $__from); do
> > >   sed -i  "s/\<$__from\>/$__to/g" $__file;
> > > done
> > >
> > > Cc: Rob Clark <robdclark@gmail.com>
> > > Cc: Sean Paul <sean@poorly.run>
> > > Cc: linux-arm-msm@vger.kernel.org
> > > Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> >
> > Since
> >
> > commit 48e7f18392c66f9b69ebac11c54f1a2e033ced54
> > Author: Kristian H. Kristensen <hoegsberg@gmail.com>
> > Date:   Wed Mar 20 10:09:08 2019 -0700
> >
> >     drm/msm: Implement .gem_free_object_unlocked
> >
> > msm doesn't need the struct_mutex in the bo_put anymore, the only reason
> > we had to use the _locked version here is historical accidents I think.
> >
> > I think you could convert these all to the _unlocked variant and then
> > entirely drop the _locked version.
> >
> Did not check the msm driver closely, but it makes sense. Let's keep
> that as follow-up series?
> We're already at 36 patches, plus mixing mostly mechanical and locking
> changes doesn't sound wise.

My idea was to simply throw this patch out, and replace it by an msm patch
to switch over to the unlocked variant.

Well maybe then needs 2nd patch to throw the locked version out.

So feels a bit a detour to touch msm twice, which is why I suggested to do
the more direct route. But if you feel strongly I guess we can go this way
and then follow up with converting msm to unlocked and throwing the
_locked variant out for good too.
-Daniel


> > Once we have that we could move struct_mutex into each driver (at least
> > for msm and i915) since it's purely internal, and then wrap it in an
> > #ifdef CONFIG_DRM_LEGACY to gloriously sunset it all :-)
> >
> Indeed, we're nearly there.
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
