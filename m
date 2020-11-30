Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E31012C8890
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 16:48:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 476BE6E52D;
	Mon, 30 Nov 2020 15:48:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C62E6E4D4
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 15:48:29 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id r3so16843326wrt.2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 07:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=VsjS9sFdFIzuVa1oG+p5rhoHubl6KuRC4vyj01W3OVA=;
 b=j70Crfk0QawmtawocJ/scZuaWs9oBeT9QrgeFe/KVp2w6czHgJc3U6sn23OQ9j8A+h
 76ApI3c+QN4OI+uHeLBtRGFMFrVNFQUPfxz3KlTO3869OvB0q69cPuYxacLSGXTRG7sn
 IFaNUF2iYoABftHyyhsQXsTp+qRz7S/EzMKcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VsjS9sFdFIzuVa1oG+p5rhoHubl6KuRC4vyj01W3OVA=;
 b=uKNFdAgQ3QEWLs+ok8wArlep55qrzQFYPQp6ZaZtTiD0V0xHTCAjUasFP67heDZixn
 L3Ds9fSu/mYiMoFwXQc170uXkYAP4pcGcn4tOdSuWfBM1p5BjTss+F+gDABqDOc8Q2iy
 +y71npN96qSQtnizofwW/sBGX9YVF/tO9NagKvfqtR+CIPW23p16/1LDtRRH28eMTW1x
 DvExFHVaKrRmgaVuliFoiGoOAi75mhUehvel4NMwSKz7G7W6kRiKa7gQtLAxXWpjdb+C
 OKt0tW+utjbQHuUFOmWqng5+Ma/PqoIQbG4DDV3ym5cH4dbQa0y2UDUhlWFPFWqTYtSb
 qwUA==
X-Gm-Message-State: AOAM5330wzIJyr0zV48klJpUC40b4x2dvOk7mypMGCB8ETP9oPjQQ3fj
 fLxFKYGhBzxmDs1hhzPWGJQAgNve5rLUTQ==
X-Google-Smtp-Source: ABdhPJwxS5XHkC2xILoI521QwYdFBvLDSw4n4h2OX1jG2gVviMbcO3LVAPnz9tyjISBr0pifzpzdXQ==
X-Received: by 2002:a5d:6186:: with SMTP id j6mr29767712wru.359.1606751308039; 
 Mon, 30 Nov 2020 07:48:28 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p4sm29070338wrm.51.2020.11.30.07.48.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 07:48:27 -0800 (PST)
Date: Mon, 30 Nov 2020 16:48:25 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Alexander Monakov <amonakov@ispras.ru>
Subject: Re: GPU-side memory protection landscape
Message-ID: <20201130154825.GU401619@phenom.ffwll.local>
References: <alpine.LNX.2.20.13.2011301603550.26319@monopod.intra.ispras.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.LNX.2.20.13.2011301603550.26319@monopod.intra.ispras.ru>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 30, 2020 at 05:07:00PM +0300, Alexander Monakov wrote:
> Hi,
> 
> On #dri-devel Daniel invited me to chime in on the topic of clearing GPU
> memory handed to userspace, so here I go.
> 
> I was asking how information leak from giving userspace dirty memory
> previously used by another process is not seen as a security issue.
> I was pointed to a recent thread, which offers a little perspective:
> https://lists.freedesktop.org/archives/dri-devel/2020-November/287144.html
> 
> I think the main argument shown there is weak:
> 
> > And for the legacy node model with authentication of clients against
> > the X server, leaking that all around was ok.
> 
> seeing how there's the XCSECURITY extension that is supposed to limit
> what clients can retrieve, or there could be two X servers running for
> different users.
> 
> 
> My other concern is how easy it is to cause system instability or hangs
> by out-of-bounds writes from the GPU (via compute shaders or copy
> commands). In my experience of several years doing GPU computing with
> NVIDIA tech, I don't recall needing to lose time rebooting my PC after
> running a buggy CUDA "kernel". Heck, I could run the GCC C testsuite on
> the GPU without worrying about locking myself and others from the
> server. But now when I develop on a laptop with AMD's latest mobile SoC,
> every time I make a mistake in my GLSL code it more often than not forces
> a reboot. I hope you understand what a huge pain it is.

That sounds like amdgpu reset not being great. Which it is (from what I've
seen looking at it). There shouldn't be any leaks after that.

> What are the existing GPU hardware capabilities for memory protection
> (both in terms of preventing random accesses to system memory like with
> an IOMMU, and in terms of isolating different process contexts from each
> other), and to what extend Linux DRM drivers are taking advantage of
> them?
> 
> Would you consider producing a document with answers to the above so
> users know what to expect?

Atm not documented anywhere unfortunately. There's some documentation
about rendernode, but it is not very explicit on what it guarantees wrt
security:

https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#render-nodes

Currently render nodes should guarantee that you never see anything else
from another gpu client (including some hw exploits, where that's doable).
Without render nodes we only try to make sure to protect the system
overall from gpu workloads, but not gpu workloads against each another.
That's mostly a thing on older hardware though.

Note that the reality is slightly more disappointing, like amdgpu not
force clearing vram when rendernodes are used. But there's more like that
I think.

Cheers, Daniel

> 
> Thank you.
> Alexander

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
