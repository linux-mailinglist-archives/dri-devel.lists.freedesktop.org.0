Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E48EC392BE3
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 12:34:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 666B46EE68;
	Thu, 27 May 2021 10:33:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D561C6EE66
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 10:33:55 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id j14so4208201wrq.5
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 03:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=eUx4Ww94ghT1OFJYFV4k9kBh2hCOi+Z+Yz3tYP5DhzI=;
 b=AFJ00knjSZZRyeNi0sR41ZdQpTt1HZ4n5swMbRpwTy4JehjZ+iQ3b9O9JeFWhuTXDH
 +Q04s3vxSKD3LCRICT7h00PydUT7UAML3x/I6wU+t1w6WWBS+zp+dBzzYsWphLwfIbK3
 2na3QgUZuk0TlpL3slXn28V6TA4ZIgEXREhqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=eUx4Ww94ghT1OFJYFV4k9kBh2hCOi+Z+Yz3tYP5DhzI=;
 b=ruySFFeIE+LwzHRhzWBLbiBAmWa45X1SwznYpb8gpJEKbEVSJRChVidPKBd98dBu+5
 x3bEdCTA1M9WYoevxhC5bxG/80dIls3Arzcd1j4T/mAOaiMJRQWytka5y+4vOZHTa+V9
 DNPf6BVBfPJsffmgrwxcJE65XIJ9mxI2Bgy3/FHhpAWo2K1TBMEffhV7Js1j8nAzp6CH
 WksGyxv69CfOSd9wTuXExXK5AC6aTaQCbScKeJNWpcm3tiHkzzq4kKE8U9VFNM64//23
 xrWH82A3qyceAwWT/A3unejWPkA59qm7IjXjjARNCY6/LfwowLeMg/e5nxwr2578oMFY
 AMOw==
X-Gm-Message-State: AOAM531BJoR5f91W3Xvh/Y8F6nhPkK8hepf2tJRCoXgDxKRdDbiDMUSI
 lfN4mtLaAoyE91te3/C4/KlBAg==
X-Google-Smtp-Source: ABdhPJznwqtO3kpYhHjv+rwBJ46VyzmMAk9vedbccVxp4EAUNtvI1Dz5Xu5QJO82xXHa4GKwCTtSdA==
X-Received: by 2002:a05:6000:c2:: with SMTP id
 q2mr2637793wrx.288.1622111634527; 
 Thu, 27 May 2021 03:33:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b135sm1234200wmb.5.2021.05.27.03.33.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 03:33:54 -0700 (PDT)
Date: Thu, 27 May 2021 12:33:52 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [Intel-gfx] [PATCH 5/7] dma-buf: Add an API for exporting sync
 files (v11)
Message-ID: <YK91kB0ikqxurHN1@phenom.ffwll.local>
References: <20210525211753.1086069-1-jason@jlekstrand.net>
 <20210525211753.1086069-6-jason@jlekstrand.net>
 <acc1737c-261d-9da5-7ea7-759063136c56@amd.com>
 <CAPj87rN_7vmmWcL1vqhvM=etaTjwts_L0vYbsgvYF0_qZw83gw@mail.gmail.com>
 <770eb698-1dde-9e46-da83-44911d96abec@amd.com>
 <CAPj87rPdMthO2Wv7QxMGnO__BiZVauMa9HaRk+35Sgvm69QSjw@mail.gmail.com>
 <a9de44fc-aa7c-60d7-d7ed-2229d41fb306@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a9de44fc-aa7c-60d7-d7ed-2229d41fb306@amd.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>, Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 26, 2021 at 03:23:01PM +0200, Christian König wrote:
> 
> 
> Am 26.05.21 um 15:12 schrieb Daniel Stone:
> > Hi,
> > 
> > On Wed, 26 May 2021 at 13:46, Christian König <christian.koenig@amd.com> wrote:
> > > Am 26.05.21 um 13:31 schrieb Daniel Stone:
> > > > How would we insert a syncobj+val into a resv though? Like, if we pass
> > > > an unmaterialised syncobj+val here to insert into the resv, then an
> > > > implicit-only media user (or KMS) goes to sync against the resv, what
> > > > happens?
> > > Well this is for exporting, not importing. So we don't need to worry
> > > about that.
> > > 
> > > It's just my thinking because the drm_syncobj is the backing object on
> > > VkSemaphore implementations these days, isn't it?
> > Yeah, I can see that to an extent. But then binary vs. timeline
> > syncobjs are very different in use (which is unfortunate tbh), and
> > then we have an asymmetry between syncobj export & sync_file import.
> > 
> > You're right that we do want a syncobj though. This is probably not
> > practical due to smashing uAPI to bits, but if we could wind the clock
> > back a couple of years, I suspect the interface we want is that export
> > can either export a sync_file or a binary syncobj, and further that
> > binary syncobjs could transparently act as timeline semaphores by
> > mapping any value (either wait or signal) to the binary signal. In
> > hindsight, we should probably just never have had binary syncobj. Oh
> > well.
> 
> Well the later is the case IIRC. Don't ask me for the detail semantics, but
> in general the drm_syncobj in timeline mode is compatible to the binary
> mode.
> 
> The sync_file is also import/exportable to a certain drm_syncobj timeline
> point (or as binary signal). So no big deal, we are all compatible here :)
> 
> I just thought that it might be more appropriate to return a drm_syncobj
> directly instead of a sync_file.

I think another big potential user for this is a vk-based compositor which
needs to interact/support implicit synced clients. And compositor world I
think is right now still more sync_file (because that's where we started
with atomic kms ioctl).

The other slight nudge is that drm_syncobj is a drm thing, so we'd first
need to lift it out into drivers/dma-buf (and hand-wave the DRM prefix
away) for it to be a non-awkward fit for dma-buf.

Plus you can convert them to the other form anyway, so really doesn't
matter much. But for the above reasons I'm leaning slightly towards
sync_file. Except if compositor folks tell me I'm a fool and why :-)
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
