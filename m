Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6DC47A75E
	for <lists+dri-devel@lfdr.de>; Mon, 20 Dec 2021 10:43:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7656113F0A;
	Mon, 20 Dec 2021 09:43:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0CA7113F01
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 09:43:42 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id c66so2726375wma.5
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 01:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ROJgopUUnQZIGTv5KtOBScHw/EXv42kqY46Z9OcVbwo=;
 b=eDWoH43bh1PI7YYFmv2Tx4Rp9Nzx9YnJKURGmQduqjCStXmpMN/ZBOuq1eDLLnhxn2
 9akO1ISbxn+7rv5gHE5dNoqCv+26S02GRXM0a3T/42OGtPKmEwLFZy3VjNIOpzeudIVe
 /CPydC17jvPADVWejcN6jl+QyT3AeCYh8yx54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ROJgopUUnQZIGTv5KtOBScHw/EXv42kqY46Z9OcVbwo=;
 b=LkUc3I+GBlnJLyRQDHQRKc6UdPBUTXsLP63WbT9EeuYhalivS/Jkb98YB13GHqXgu/
 rFYPYxyhcvZMqo5FGmf+QW7ScPEGF9SwzFOijnHg0YPblypduLEx5qjwt0iSEFsRcV9T
 pEqVB9s6m0m0HvOwI0NDBrYqdA0P5Vr+S1pB7I8Zrz/j85CYRd1J9O1SvsK89iSOChxa
 e47LMPhHY/5JKRpu0x+gMG3hhXpFv0HFr/Z1DIFeMh47JFg9yfZgWtyEN44/fyZX0Ud1
 38lC2VKl/vKMdtKc7HkJby1/iDClBoyAufaQ+c7HHrf3wm56AxRKOmPCWjIQNzTIryLj
 BLBw==
X-Gm-Message-State: AOAM531nsiMFxGsMAwEkQM4AOeD57+Vw6bsWke+kxDzlXZcv6NGCG7B4
 LjmXIHxtk99e+2/tzFJqeLGRiQ==
X-Google-Smtp-Source: ABdhPJxb4gGIn5faIu5r7HvECNQYNxSUIzRj4gATdfoNmhxaFErxEkNl5vV+eEHvD/bnuPT3q5Frjw==
X-Received: by 2002:a1c:f302:: with SMTP id q2mr15004583wmq.107.1639993421223; 
 Mon, 20 Dec 2021 01:43:41 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d4sm6156222wrx.102.2021.12.20.01.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 01:43:40 -0800 (PST)
Date: Mon, 20 Dec 2021 10:43:38 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [RFC 0/6] Define and use reset domain for GPU recovery in amdgpu
Message-ID: <YcBQSgynkO0VYUoC@phenom.ffwll.local>
References: <20211217222745.881637-1-andrey.grodzovsky@amd.com>
 <0a30778e-28b8-7d02-01e9-9db690227222@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0a30778e-28b8-7d02-01e9-9db690227222@gmail.com>
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
Cc: horace.chen@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com, Monk.Liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 20, 2021 at 08:25:05AM +0100, Christian König wrote:
> Am 17.12.21 um 23:27 schrieb Andrey Grodzovsky:
> > This patchset is based on earlier work by Boris[1] that allowed to have an
> > ordered workqueue at the driver level that will be used by the different
> > schedulers to queue their timeout work. On top of that I also serialized
> > any GPU reset we trigger from within amdgpu code to also go through the same
> > ordered wq and in this way simplify somewhat our GPU reset code so we don't need
> > to protect from concurrency by multiple GPU reset triggeres such as TDR on one
> > hand and sysfs trigger or RAS trigger on the other hand.
> > 
> > As advised by Christian and Daniel I defined a reset_domain struct such that
> > all the entities that go through reset together will be serialized one against
> > another.
> > 
> > TDR triggered by multiple entities within the same domain due to the same reason will not
> > be triggered as the first such reset will cancel all the pending resets. This is
> > relevant only to TDR timers and not to triggered resets coming from RAS or SYSFS,
> > those will still happen after the in flight resets finishes.
> > 
> > [1] https://patchwork.kernel.org/project/dri-devel/patch/20210629073510.2764391-3-boris.brezillon@collabora.com/
> > 
> > P.S Going through drm-misc-next and not amd-staging-drm-next as Boris work hasn't landed yet there.
> 
> Patches #1 and #5, #6 are Reviewed-by: Christian König
> <christian.koenig@amd.com>
> 
> Some minor comments on the rest, but in general absolutely looks like the
> way we want to go.

I only scrolled through quickly, but yeah I'm concurring.
-Daniel
> 
> Regards,
> Christian.
> 
> > 
> > Andrey Grodzovsky (6):
> >    drm/amdgpu: Init GPU reset single threaded wq
> >    drm/amdgpu: Move scheduler init to after XGMI is ready
> >    drm/amdgpu: Fix crash on modprobe
> >    drm/amdgpu: Serialize non TDR gpu recovery with TDRs
> >    drm/amdgpu: Drop hive->in_reset
> >    drm/amdgpu: Drop concurrent GPU reset protection for device
> > 
> >   drivers/gpu/drm/amd/amdgpu/amdgpu.h        |   9 +
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 206 +++++++++++----------
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c  |  36 +---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |   2 +-
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h   |   2 +
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c   |  10 +-
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h   |   3 +-
> >   7 files changed, 132 insertions(+), 136 deletions(-)
> > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
