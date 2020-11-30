Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 626A32C9953
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 09:24:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E14E6E536;
	Tue,  1 Dec 2020 08:23:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AD836E4A5
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 15:55:47 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id e60so8482133qtd.3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 07:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=CjVLOOEtBqUtB/09GI5wIXC8/zFmYYrYUeLfPULXHCc=;
 b=XDk9ObBj653+EScMyll6sJbalbBB5wbOv1Zw6deoHHA575dMosxoGicwjijLY0xijn
 kIVb3ixHJDRvYuYYMkMueqhqAVGJyQ3OxMdaunwzXkjUjlJNvHmB3eWhfy05oO/Sl5KY
 kqb25dIKw0YXdHqAuhDJbuCDOMruvl3AV4Br0hb8RJU3klkO6Ymmhj4GnZ7UekUbYOtb
 AkkBDF34E/wwgltfeKyT2YXSUckHOTV5ngHJ67T8C1lEDNelROFy8PeKxRpQiUtZwuG+
 S4KNaGneyHnkbCXuvmf/zkdajT5fLf5hNdAkoLgmwgYKn2LgrV/61qbJEcZABPea7ar3
 n0rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CjVLOOEtBqUtB/09GI5wIXC8/zFmYYrYUeLfPULXHCc=;
 b=P/mmLUgM/ZnlrLcHaMIn7q9yvSoKkS93WUj3IYnPwvi1yamLvzFXWYwWZnHbxoCNQ+
 Em25prRB4Xey2xq/KNF9xQZcelyPYRVKP01nJlqGcZNYWYiAd3mdLVF10lYgX42eTY2R
 /iLdoIHe0syKB2EaSANx4DQ4QlOTzU1AdxZQ0HVIm6GeJCCWaUxb9ipPoLiKv9SFnE8W
 AiR2e/uCP0dHjy1gZEvUY3Iyq/JXeBfBSRniGOXQFe4/+IS78VPpkZ9cWXYbNLfNtQQ/
 xhcVLGUaRL9ZKa7EKl4XK0NXytqjcOQ0f9ZjNt+ggWXVV+qK8KcbJg7VdkmrFykk6ERR
 i4cg==
X-Gm-Message-State: AOAM532+yBoKWnV0xjz/TOo9BQ9pBsm1qJbzdGzoQ9VOOTEHGWrabvL3
 FnSNgrHQfayeZyQh10a7DRFI0CO30LYlBhNY
X-Google-Smtp-Source: ABdhPJyqY+NbTgrfg0rrr34jfN9FWUEJU+D/A6r+m4+LvoHrlHDw9X08cY6TAx+Zy/fxU5+UavX81w==
X-Received: by 2002:aed:3025:: with SMTP id 34mr22385936qte.39.1606751746458; 
 Mon, 30 Nov 2020 07:55:46 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id v15sm16156986qti.92.2020.11.30.07.55.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 07:55:45 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kjlWi-0045D3-GJ; Mon, 30 Nov 2020 11:55:44 -0400
Date: Mon, 30 Nov 2020 11:55:44 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH rdma-core v3 4/6] pyverbs: Add dma-buf based MR support
Message-ID: <20201130155544.GA5487@ziepe.ca>
References: <1606510543-45567-1-git-send-email-jianxin.xiong@intel.com>
 <1606510543-45567-5-git-send-email-jianxin.xiong@intel.com>
 <20201130145741.GP401619@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201130145741.GP401619@phenom.ffwll.local>
X-Mailman-Approved-At: Tue, 01 Dec 2020 08:23:37 +0000
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
 Christian Koenig <christian.koenig@amd.com>,
 Jianxin Xiong <jianxin.xiong@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 30, 2020 at 03:57:41PM +0100, Daniel Vetter wrote:
> > +	err = ioctl(dri->fd, DRM_IOCTL_AMDGPU_GEM_CREATE, &gem_create);
> > +	if (err)
> > +		return err;
> > +
> > +	*handle = gem_create.out.handle;
> > +	return 0;
> > +}
> > +
> > +static int radeon_alloc(struct dri *dri, size_t size, uint32_t *handle)
> 
> Tbh radeon chips are old enough I wouldn't care. Also doesn't support p2p
> dma-buf, so always going to be in system memory when you share. Plus you
> also need some more flags like I suggested above I think.

What about nouveau?

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
