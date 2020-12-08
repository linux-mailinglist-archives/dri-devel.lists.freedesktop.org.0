Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A31ED2D3D5A
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 09:32:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79CEB6E169;
	Wed,  9 Dec 2020 08:32:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED3F16E0D0
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Dec 2020 23:41:32 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id z9so122233qtn.4
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Dec 2020 15:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rPNigW+nYiMVFpS2HNpPz+E34HVn3r2r0I5yXJefsg0=;
 b=INvPDUjmBQg/XN/s94mwe+p9VTcHDyg24OIgi8usg+LPtqCKJ/yLY3fOZv/k1QJfmk
 ghsp/Lj9V5tu7Dy2VE/ajVWjzMyKghABF3dcRxHo33vLciJkdAtH9PbnfGnIaGtoEHb6
 hdXwuYBNOQ4S7ifBs8upiX3auZc/7iLC5oRZHDlarJHur4kCSgbMWeBYs4iDV7q1FIOr
 sw8TyZFDjFwpHqkfpV/1K3XVVOYlw56mXOz+MPLpCGPVeFSukrmigdP6jNpAtQRNN4Gf
 AUAAAxGpEwTz3p+YkIlMCCa7nUDgA4eb4lLDXqmv/i3lkkuaRJ855iiPgnmAtKN8M2D0
 VZWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rPNigW+nYiMVFpS2HNpPz+E34HVn3r2r0I5yXJefsg0=;
 b=F67Es9MM0MpKD8UJIYDE8tHIxwPPgdy/6GM+vv2In8BNEQZCDL7BZ9s/14ommgG0Xh
 +zI+JFO57qNaYPSuOTivgv+MPjmLqEFgA/YlyRm1sDd31b+3vOTAcomz0Erc1dVvw9ap
 G9W19Uaqb5HNp7ckMnDJdD0Qq5ys+N9s0z5b0XSGM8Wbf5AGXLLhMItVJz0XKTMAPadM
 FQEMUB+gLi5Xyt3+TFiZrvhW20Q40traq3NEyy8Q93mc1WEXYNxTvUShA1dObUdE3sbC
 ByE60SN0Mhp9HXvulFSNeePVHYPQgPDouoIsvOYUEBUGZuO2aomiCCmGzn396kFez8/x
 vWGg==
X-Gm-Message-State: AOAM532RkTIvZ+fVcgrddhX2EEmSDKixIk1gaQLyyX9Qr3PUHp9zPs+R
 sW+KJVEOSbbovs12FU9qq5SxFw==
X-Google-Smtp-Source: ABdhPJzH06GR1oL/I8np/AXOA+PRONtRyvvr67W9LuNjviB7kkzJ7iR5hHdRJNdVVeoz687VjkhPCg==
X-Received: by 2002:ac8:5a03:: with SMTP id n3mr677650qta.240.1607470892118;
 Tue, 08 Dec 2020 15:41:32 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.115.133])
 by smtp.gmail.com with ESMTPSA id o68sm200168qkf.84.2020.12.08.15.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 15:41:31 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kmmbq-0083ZD-Vj; Tue, 08 Dec 2020 19:41:30 -0400
Date: Tue, 8 Dec 2020 19:41:30 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jianxin Xiong <jianxin.xiong@intel.com>
Subject: Re: [PATCH v14 0/4] RDMA: Add dma-buf support
Message-ID: <20201208234130.GS5487@ziepe.ca>
References: <1607467155-92725-1-git-send-email-jianxin.xiong@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1607467155-92725-1-git-send-email-jianxin.xiong@intel.com>
X-Mailman-Approved-At: Wed, 09 Dec 2020 08:32:01 +0000
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
Cc: Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Doug Ledford <dledford@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 08, 2020 at 02:39:11PM -0800, Jianxin Xiong wrote:
> This is the fourteenth version of the patch set. Changelog:
> 
> v14:
> * Check return value of dma_fence_wait()
> * Fix a dma-buf leak in ib_umem_dmabuf_get()
> * Fix return value type cast for ib_umem_dmabuf_get()
> * Return -EOPNOTSUPP instead of -EINVAL for unimplemented functions
> * Remove an unnecessary use of unlikely()
> * Remove left-over commit message resulted from rebase

You should probably slow down a bit, v13 needed rebasing too.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
