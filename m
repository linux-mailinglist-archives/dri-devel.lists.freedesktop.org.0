Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7150A26C143
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 11:59:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F1B6E37F;
	Wed, 16 Sep 2020 09:59:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D6CA6E392
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 09:59:30 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id t10so6271804wrv.1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 02:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3+5MUINgS/3kXupUIpF5UdrtH6x938/qY5ueTCYuS7A=;
 b=b5lDIFgqmTLviC3gjjGxPQgnNyy7XbQrAKuUwxP7Ku2nwztn3YYPq4PyP1978qIyYk
 aZ9aF1s/XUmkYigIJofHDOR5G0Pm5UgjznZZPJvg+Q74Bp4CxPB+YI2qHnfTpJ0AAkYL
 cl6HbP8W6pCUhLbAVWlNOwhI6qy54eZgYNgc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3+5MUINgS/3kXupUIpF5UdrtH6x938/qY5ueTCYuS7A=;
 b=LMAVU6OCX3c6QRJIbV0WMDC5zRvxMu1z5tIoPE9TA0G/eYu9IgiiX3lqu8rxbdJWyG
 qosenemY2djTY7xTjD7+tFGPgTY2ZU99/jCEdshSMfznCYYm3YjS1/cTF1SVDGvgNFrM
 HpIgHmoX0ISwnBIBKIxuwSgLmAcTfTpHPJMr04t2+/pcjwyPxcH1UdCCb0sceWgAKwJP
 MwIlDvKWqMnSYQYrc7O1IRcl8DdNfWOREM/0OTz6HOKyYmljwA41rynQ5j3fgyzTu8Yk
 zkKzrj/ITRWBcfku8iKFtEulMEJa8VC4ACTYv/GDnIgASlzSYiHJS2ZxGIkjWVhNApgS
 mRog==
X-Gm-Message-State: AOAM530Dqty/N0ZjkUFCDrxEon6vzw/Zd6UucjZaKnvFaJjlIzvd0c5O
 s1zdYJu/Z8/uei0xwGu/GcYIEqHX7QTzJeoX
X-Google-Smtp-Source: ABdhPJx4rSat5jYIT6/IV5uxY2B7ojnvbYPfcJNaB1zF5LC7sG7GGRH9n5yFXUAfnCZDnFw96E4KSQ==
X-Received: by 2002:a5d:608f:: with SMTP id w15mr2952652wrt.244.1600250369082; 
 Wed, 16 Sep 2020 02:59:29 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o16sm30112339wrp.52.2020.09.16.02.59.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 02:59:28 -0700 (PDT)
Date: Wed, 16 Sep 2020 11:59:26 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] Revert "drm/radeon: handle PCIe root ports with
 addressing limitations"
Message-ID: <20200916095926.GE438822@phenom.ffwll.local>
References: <20200915184607.84435-1-alexander.deucher@amd.com>
 <20200916063300.GJ142621@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200916063300.GJ142621@kroah.com>
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Alex Deucher <alexander.deucher@amd.com>,
 stable@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 16, 2020 at 08:33:00AM +0200, Greg KH wrote:
> On Tue, Sep 15, 2020 at 02:46:07PM -0400, Alex Deucher wrote:
> > This change breaks tons of systems.
> 
> Very vague :(
> 
> This commit has also been merged for over a year, why the sudden
> problem now?

Unrelated rant, but one year is generally what it takes for most users to
upgrade to new kernels, through their distro updates. Especially for older
hw like the radeon drivers (since 5 years or so amd gpus switched over to
amdgpu.ko).

So surprise that bugs only show up after 1+ year shouldn't be a surprise
:-) My personal rule is that I put a 1 year spacer between a risky change
and any cleanup that enables. Too many regrets in the past.

Cheers, Daniel

> 
> > This reverts commit 33b3ad3788aba846fc8b9a065fe2685a0b64f713.
> 
> You mean "33b3ad3788ab ("drm/radeon: handle PCIe root ports with
> addressing limitations")"?
> 
> That's the proper way to reference commits in changelogs please.  It's
> even documented that way...
> 
> > 
> > Bug: https://bugzilla.kernel.org/show_bug.cgi?id=206973
> > Bug: https://bugzilla.kernel.org/show_bug.cgi?id=206697
> > Bug: https://bugzilla.kernel.org/show_bug.cgi?id=207763
> > Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/1140
> > Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/1287
> > Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> > Cc: stable@vger.kernel.org
> > Cc: Christoph Hellwig <hch@lst.de>
> > Cc: christian.koenig@amd.com
> 
> Fixes: 33b3ad3788ab ("drm/radeon: handle PCIe root ports with addressing limitations")
> 
> as well?
> 
> thanks,
> 
> greg k-h
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
