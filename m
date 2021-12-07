Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6799246C176
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 18:14:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA8716F8ED;
	Tue,  7 Dec 2021 17:14:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 169326FC37
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 17:14:53 +0000 (UTC)
Received: by mail-qv1-xf2a.google.com with SMTP id a24so13714444qvb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Dec 2021 09:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wVc8LSPwSI3Fgta6L7kEkmdc/aDqjUxriE82WBGtIW0=;
 b=Rfja9PD8xnDksY1HYbcjkWT4ttEpzcj1mkWQRYEdiFZjxlZutjCEU3l+TzKeZAWZA/
 R3Hgi5Or/0X0d8myLQpzwZQAnhxm/OcfYbG+5B/66ZNNo8nbFHqD9DYlNSXtBgkDujdj
 GS0HSG3F4O5HKNUn9sTmGvZtZoUDvBg3FelKkCyTF22wHUt+fuZxsll/djq0gwdp9UES
 rKe7Ww/zz2n88os5/TA3xAj0fxq+mkd+U3+5eLTUO9k3l8BCEoBS1Bzv7RwiFY3K03FM
 XvX2OC7NgTOQWukgIns3VlWwdovpkxoyJF0F7548j2+41xs1nJaH080SGXg30oO09e0f
 Lkgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wVc8LSPwSI3Fgta6L7kEkmdc/aDqjUxriE82WBGtIW0=;
 b=UoX8wRYstKYRwFWb81b6oa6QYwZ0Mpx5rkk3nzoPp0Cted0L5n0oo/Peruuf7dvXOC
 ImXWR046Z8nNJVfSy/JUNpXN3i+dYo+zWblEunRsrTM0byK8DJ7jGW+sOOLdiX4vVOoC
 lg3kYXYVzTkOUu883uhuEShDCIOD5bU5LYrwShMT1C7Ra5kfxMmGRk99PcyZeuYYIbZ7
 k3JrG98SrRGiySpFGSzCW6tMBjiJWfT5s58OYgL4p/ehb18qGf89f1XuR4da4WtslsH7
 XtGur49af3MUq192IZCJA0Lw8B8OjQa7CwzQH3KnPMs5+qSunQOGsJTVCCuVxlwokDVh
 JR7w==
X-Gm-Message-State: AOAM533q28oJn7FQ1YvdkY2AYsZUkXd0TZFHR/UBnvQVjr37Fx8xX0zc
 Dy2w8/hXRPZAymweu85pD59lVg==
X-Google-Smtp-Source: ABdhPJw0PP90ueBnYWFUDjF76i2hMme/rVXQvmtZfOsQkyWewKl1qaIvxAAjfaYW0kFwWOh6hBhAtQ==
X-Received: by 2002:a05:6214:e65:: with SMTP id
 jz5mr300169qvb.103.1638897293016; 
 Tue, 07 Dec 2021 09:14:53 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.129])
 by smtp.gmail.com with ESMTPSA id n13sm138629qkp.19.2021.12.07.09.14.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 09:14:50 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1mue3D-0005cs-LC; Tue, 07 Dec 2021 13:14:47 -0400
Date: Tue, 7 Dec 2021 13:14:47 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Shunsuke Mie <mie@igel.co.jp>
Subject: Re: [RFC PATCH v4 0/2] RDMA/rxe: Add dma-buf support
Message-ID: <20211207171447.GA6467@ziepe.ca>
References: <20211122110817.33319-1-mie@igel.co.jp>
 <CANXvt5oB8_2sDGccSiTMqeLYGi3Vuo-6NnHJ9PGgZZMv=fnUVw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANXvt5oB8_2sDGccSiTMqeLYGi3Vuo-6NnHJ9PGgZZMv=fnUVw@mail.gmail.com>
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

On Fri, Dec 03, 2021 at 12:51:44PM +0900, Shunsuke Mie wrote:
> Hi maintainers,
> 
> Could you please review this patch series?

Why is it RFC?

I'm confused why this is useful? 

This can't do copy from MMIO memory, so it shouldn't be compatible
with things like Gaudi - does something prevent this?

Jason
