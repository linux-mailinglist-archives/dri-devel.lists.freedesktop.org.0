Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 945B7275B81
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 17:21:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0709F6E95F;
	Wed, 23 Sep 2020 15:21:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C46E56E949
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 15:21:28 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id e2so485054wme.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 08:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2K9Z7Gv19r32rwISFfeeU+p3IhQHbLyZj3mcqhUjB5I=;
 b=MERnuQXGwroua2if1L0VAdqH0dK2zxzg/yeRefum0A/26toU0brOQ1vVClrhlN8DaM
 Qi9cWKc57sAFuosYFkjTNH9hUOULge0gNOU6SMztChxwzMCbDrgD/vUFFx7S1rtC4Wws
 wMx1OtUeVG0f9iOHsHWvx6enLnLqH2jrGug7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2K9Z7Gv19r32rwISFfeeU+p3IhQHbLyZj3mcqhUjB5I=;
 b=D5xSsJktN75SQPQK83Y97eZSaEYbuCKT6NeN6gxxSuPRvjBc6f98S3C6YmozHZ0eMx
 VLHczgdbYM5NSuNic6J4E6Z6/1HiA7IhFdRg57avrXzFQ/yu87wYAXyhBJdz9VRt/MVM
 0VR/pDDy4NdRQVHJCbB/kdSlnBOiKLwKV1YOvJpdrJQRHZEdvcXQmwxyUTTCYyraeON5
 GacEumMB7Sokx0BiYuE5MeezEvCWqgYCWvvqjaRHiAc9kzYIP/5EOeBeuRszTg5SDdeU
 MrBOMWYu7f4jFL/PQVAx3XnLB7AC8ItwS5+oTq+W0UNMkeqhrhikrVlu0ZZEn+ClAon/
 46sA==
X-Gm-Message-State: AOAM530G3/6Vude1qcGLPwPE/kdhZ1aioZivr/27jyJfrfDqdqfsHdHx
 9dD/y4//UNfSclCmwYKxOUz4vA==
X-Google-Smtp-Source: ABdhPJxH2AEo1L7I/ztdxnpoPdTHMcs8+vqe1evuGgCmQJAOjRv/sEDWITiVdrOYZe8ze1pDTkn5gw==
X-Received: by 2002:a1c:2ed0:: with SMTP id u199mr38440wmu.125.1600874487324; 
 Wed, 23 Sep 2020 08:21:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y5sm162482wrh.6.2020.09.23.08.21.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 08:21:26 -0700 (PDT)
Date: Wed, 23 Sep 2020 17:21:24 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [Nouveau] [PATCH 0/6] drm/nouveau: Support sync FDs and sync
 objects
Message-ID: <20200923152124.GO438822@phenom.ffwll.local>
References: <20200828104016.1672195-1-thierry.reding@gmail.com>
 <20200923091853.GA1229032@ulmo>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200923091853.GA1229032@ulmo>
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
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 23, 2020 at 11:18:53AM +0200, Thierry Reding wrote:
> On Fri, Aug 28, 2020 at 12:40:10PM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> > 
> > Hi,
> > 
> > This series implements a new IOCTL to submit push buffers that can
> > optionally return a sync FD or sync object to userspace. This is useful
> > in cases where userspace wants to synchronize operations between the GPU
> > and another driver (such as KMS for display). Among other things this
> > allows extensions such as eglDupNativeFenceFDANDROID to be implemented.
> > 
> > Note that patch 4 modifies the ABI introduced in patch 3 by allowing DRM
> > sync objects to be passed rather than only sync FDs. It also allows any
> > number of sync FDs/objects to be passed in or emitted. I think those are
> > useful features, but I left them in a separate patch in case everybody
> > else thinks that this won't be needed. If we decide to merge the new ABI
> > then patch 4 should be squashed into patch 3.
> > 
> > The corresponding userspace changes can be found here:
> > 
> >   libdrm: https://gitlab.freedesktop.org/tagr/drm/-/commits/nouveau-sync-fd-v2/
> >   mesa: https://gitlab.freedesktop.org/tagr/mesa/-/commits/nouveau-sync-fd/
> > 
> > I've verified that this works with kmscube's --atomic mode and Weston.
> 
> Hi Ben,
> 
> any thoughts on this series? I realize that this is somewhat suboptimal
> because we're effectively adding a duplicate of the existing IOCTL with
> only the "minor" extension of adding sync FDs/objects, but at the same
> time I don't have any good ideas on what else to add to make this more
> appealing or if you have any plans of your own to address this in the
> future.

drm core automatically zero-extends ioctl structs both ways, so if all you
do is add more stuff to the top level ioctl struct at the bottom, there's
no need to duplicate any code. At least as long as you guarantee that 0 ==
old behaviour for both in and out parameters.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
