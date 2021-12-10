Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D33574700DE
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 13:42:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A04FE10E299;
	Fri, 10 Dec 2021 12:42:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B185410E27D
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 12:42:06 +0000 (UTC)
Received: by mail-qv1-xf2c.google.com with SMTP id p3so7836523qvj.9
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 04:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=eO1oR3bssJVHG9Y26Y6bMlgt2qf5AyUrhg5Krs2dEgs=;
 b=nDHGUjCVp/Nzed1y5hlgRbG1rB1VpqFejneQkFUgnd/dOKi9xhgwHQdeHAU7UDO7dL
 LrYc4w9gGDZHDdSVQdmKeccT3bIBJv7XQs872y9Y9XmBMpsEqHghVBMYh1Jti+XjO52O
 5oG93oP6lP3YQYxXNywJisYGEi+hLH2uCUqTDaIh/Q1JWkkeuNkYpct45+7o7lGV0wEW
 xOqVnUOjCMIJRJDI3rkolyOSf0l2vFrO32O8YRFCag4oY1wM7wZGDFAM59KpogZqZPpm
 Iwzd5dUmyO/Y3bq4AshpPEOuX7z2kNyU7O/xsL9Dfv6wYok7wZgOUM+bfh0yRBCNlwSa
 QzrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=eO1oR3bssJVHG9Y26Y6bMlgt2qf5AyUrhg5Krs2dEgs=;
 b=Md6ZiP1VmZdAMd0gu2ODJ7oC71rqj7F9WKgzLkH+nfZaSJlzgjIdGQviz+5/eWLRDH
 SQXLcxswiYS2ww2vbgkDC107wYF+rU9bVyQLHgU+QYi4TjSQM7E54zoYLWyRrRraYNQB
 WDQ6e/h3xgr49wxpvEOMS+HJCPD4vBlJhz6GEr80wq9VgG1vM4oeW8X/lHGSbe3wri8X
 Mk53vIceMeg+SNy9q0GcIFJg62o2rFElj5YvgWjXu/bA7UMO6zAToi4x9uMHN851UGYc
 CT045MtZLEbQgPBZQHMyllN+adlghJNPLFfRJ9OxXuDQkoksaYLgrGV911iV9WOzzhVk
 K9IQ==
X-Gm-Message-State: AOAM532dF6iGvVp0NXVZWfxRIVMs4/iqcA9asSCGys24htRTS3toFaj6
 1h7AuMBGuj1QOwwlp5aLveooqQ==
X-Google-Smtp-Source: ABdhPJzRWU9mGRPVsRFVZCG14NYr/la8f9ijUEtK7ktXons/NVCP2JFtcdHPZxBHFIA6Sx/+qJ1MWA==
X-Received: by 2002:a0c:f6c5:: with SMTP id d5mr24246637qvo.111.1639140125710; 
 Fri, 10 Dec 2021 04:42:05 -0800 (PST)
Received: from ziepe.ca ([206.223.160.26])
 by smtp.gmail.com with ESMTPSA id n6sm1766301qtx.88.2021.12.10.04.42.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 04:42:05 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1mvfDw-001eiM-2r; Fri, 10 Dec 2021 08:42:04 -0400
Date: Fri, 10 Dec 2021 08:42:04 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Shunsuke Mie <mie@igel.co.jp>
Subject: Re: [RFC PATCH v4 0/2] RDMA/rxe: Add dma-buf support
Message-ID: <20211210124204.GG6467@ziepe.ca>
References: <20211122110817.33319-1-mie@igel.co.jp>
 <CANXvt5oB8_2sDGccSiTMqeLYGi3Vuo-6NnHJ9PGgZZMv=fnUVw@mail.gmail.com>
 <20211207171447.GA6467@ziepe.ca>
 <CANXvt5rCayOcengPr7Z_aFmJaXwWj9VcWZbaHnuHj6=2CkPndA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANXvt5rCayOcengPr7Z_aFmJaXwWj9VcWZbaHnuHj6=2CkPndA@mail.gmail.com>
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
Cc: Damian Hobson-Garcia <dhobsong@igel.co.jp>,
 Takanari Hayama <taki@igel.co.jp>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Tomohito Esaki <etom@igel.co.jp>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Doug Ledford <dledford@redhat.com>, Zhu Yanjun <zyjzyj2000@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sean Hefty <sean.hefty@intel.com>,
 Maor Gottlieb <maorg@nvidia.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Jianxin Xiong <jianxin.xiong@intel.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 10, 2021 at 08:29:24PM +0900, Shunsuke Mie wrote:
> Hi Jason,
> Thank you for replying.
> 
> 2021年12月8日(水) 2:14 Jason Gunthorpe <jgg@ziepe.ca>:
> >
> > On Fri, Dec 03, 2021 at 12:51:44PM +0900, Shunsuke Mie wrote:
> > > Hi maintainers,
> > >
> > > Could you please review this patch series?
> >
> > Why is it RFC?
> >
> > I'm confused why this is useful?
> >
> > This can't do copy from MMIO memory, so it shouldn't be compatible
> > with things like Gaudi - does something prevent this?
> I think if an export of the dma-buf supports vmap, CPU is able to access the
> mmio memory.
> 
> Is it wrong? If this is wrong, there is no advantages this changes..

I don't know what the dmabuf folks did, but yes, it is wrong.

IOMEM must be touched using only special accessors, some platforms
crash if you don't do this. Even x86 will crash if you touch it with
something like an XMM optimized memcpy.

Christian? If the vmap succeeds what rules must the caller use to
access the memory?

Jason
