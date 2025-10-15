Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94039BDBEF6
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 02:52:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4F5710E24C;
	Wed, 15 Oct 2025 00:52:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CgQz0AC+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18B3310E24C
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 00:51:59 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-81efcad9c90so86905746d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 17:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760489518; x=1761094318; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mBvarSClHqKHAsN6DYDAp5r3GXTmqULdVHqWbkOWp+I=;
 b=CgQz0AC+NozRsL2gz/jUFyDds1t2bfmJpwQ9sAXH5LOMIFP2q1eIp+TZZRUiYQA3YU
 eSCslSjRIIHysXBFOOO6alK8uq2pwUFSf9Njw8F6KiEFP1vav3l8e5K3FVGOFVOby6RK
 PSPMS9A03YFsZNId1F1frwTefeTNdxQM38X8xvM1fQUx6OwFIVTMS4ObrvB5YHhZiLm2
 z71T0XD5p2cU54uUjGj10W4TiP/fQrbF4dYIePbnmqbD4hm/BTnvHtcqfGwoSOELGwH1
 1RmqI1iJkepvulo6ZggaCpsFBuFomTPEdfKJB5W5Dqm2cl3+aRRH9nETBMBo1elEz+dr
 sTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760489518; x=1761094318;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mBvarSClHqKHAsN6DYDAp5r3GXTmqULdVHqWbkOWp+I=;
 b=DqONMpeSzOCRR3PuX/diKmmPb7b7xVGPF2dkJIgMyrINHGRV2BaZUEU3exk0rhn2sp
 fPMETUc/jRg6fi4V/kxfDiBJB5RxxtrYPaxsyWMVmNdithxahrBBlYlncdD7cM3wEpZa
 VV+TVZF8G7ai/rfZk5yK6GrESrMbs+svZ0bh8LXqVGHRScqHEPSSLxQaYNYVjccYD3C/
 fsGq5+YMl2XJzW5Kl9yOAfNDIWcT91WW2XreecEf+czczj8My3/QGqv5ayn9Q8BaDgpm
 Dg3c3jTM0Rd3GAVNq7u9hTHYVmxaRnhqGkvtFKDUn4MajAUZsUXWXjn2WlQPl3TFiWvI
 LE4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwNG25eHFUfFVWozjAsqaFHUcLLR8Sy6UevrON6yYStlYPyOoK3sMMGUeqFEP9qjKuCEeSAoX4FJU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyeUbYp+oNdkw5CgCwbztMusZSdwJhpiufPvPSW4NjM3rXGu6nt
 GFyFBYJRMvSGVJOpSzPbS7Ql9VI26/TPVaVwigvitS1Wg+nql9n3TWdpIl0kZtdhHh63IHWQxS2
 nNQUCc3ObEl9Dgn4alvIJkUMM4AjfAEQ=
X-Gm-Gg: ASbGncvuzIGXCs2amyFzRkn96ie8UbAHeDPBubXI0GI33wY32Fhsc5RUsrROPabgm4W
 1xHSSFxuLyWBeYKRYz/0NjMEh3Qx52MpOZutOzr0h4f0rlxEhhGtuzCwM/I7PU7rfkPQDb7bRbF
 ZReo8UEwm7dbGTBSXTfnpqNoca05xZBSCax15CUBPQ/9SIa/sL8FSAIMLT1mIf9JVQV1LtM5ZD8
 4CTcgrQpY/NLoztorhAZ/Au6Fh8SRpIQYE=
X-Google-Smtp-Source: AGHT+IHzqBUoDH15dRZufHzMs4mxLsN1RycWNriUL3NGuph2SDuItJrU+4QQZOIlNYwWq94MB/Cka0WFPf8yqhLO4uw=
X-Received: by 2002:a05:6214:e8d:b0:879:d13a:109e with SMTP id
 6a1803df08f44-87b2ef70547mr393256936d6.58.1760489518004; Tue, 14 Oct 2025
 17:51:58 -0700 (PDT)
MIME-Version: 1.0
References: <20251013143502.1655-1-christian.koenig@amd.com>
In-Reply-To: <20251013143502.1655-1-christian.koenig@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 15 Oct 2025 10:51:46 +1000
X-Gm-Features: AS18NWB-XS67voA6eav_aJkSDh3djLnguC57tZG1zZwSoGbLm_nMzt4FPvSC-dk
Message-ID: <CAPM=9twu_jrR=XnHLtR9hRaRdcLWdDndvFxdNHOQMn4-Pehd+g@mail.gmail.com>
Subject: Re: Independence for dma_fences!
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch, 
 tursulin@ursulin.net, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 14 Oct 2025 at 01:11, Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Hi everyone,
>
> dma_fences have ever lived under the tyranny dictated by the module
> lifetime of their issuer, leading to crashes should anybody still holding
> a reference to a dma_fence when the module of the issuer was unloaded.
>
> But those days are over! The patch set following this mail finally
> implements a way for issuers to release their dma_fence out of this
> slavery and outlive the module who originally created them.
>
> Previously various approaches have been discussed, including changing the
> locking semantics of the dma_fence callbacks (by me) as well as using the
> drm scheduler as intermediate layer (by Sima) to disconnect dma_fences
> from their actual users.
>
> Changing the locking semantics turned out to be much more trickier than
> originally thought because especially on older drivers (nouveau, radeon,
> but also i915) this locking semantics is actually needed for correct
> operation.
>
> Using the drm_scheduler as intermediate layer is still a good idea and
> should probably be implemented to make live simpler for some drivers, but
> doesn't work for all use cases. Especially TLB flush fences, preemption
> fences and userqueue fences don't go through the drm scheduler because it
> doesn't make sense for them.
>
> Tvrtko did some really nice prerequisite work by protecting the returned
> strings of the dma_fence_ops by RCU. This way dma_fence creators where
> able to just wait for an RCU grace period after fence signaling before
> they could be save to free those data structures.
>
> Now this patch set here goes a step further and protects the whole
> dma_fence_ops structure by RCU, so that after the fence signals the
> pointer to the dma_fence_ops is set to NULL when there is no wait nor
> release callback given. All functionality which use the dma_fence_ops
> reference are put inside an RCU critical section, except for the
> deprecated issuer specific wait and of course the optional release
> callback.
>
> Additional to the RCU changes the lock protecting the dma_fence state
> previously had to be allocated external. This set here now changes the
> functionality to make that external lock optional and allows dma_fences
> to use an inline lock and be self contained.
>
> The new approach is then applied to amdgpu allowing the module to be
> unloaded even when dma_fences issued by it are still around.

Can we add some Why? in here, like what use cases does this enable,

Some more explanation about what these hanging about fences will be
used in, like if the module is gone away, I have to assume this is for
already signalled fences, so someone is waiting and hasn't cleaned up
yet?

What problem does it solve wrt module unload, what scenario is
unloading amdgpu not possible in now, what scenario will it be able to
unload in after?

Thanks,

Dave.
