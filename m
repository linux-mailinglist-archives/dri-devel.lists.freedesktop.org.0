Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9592B25B0
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 21:41:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 972E96E82C;
	Fri, 13 Nov 2020 20:41:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22BFB6E82C
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 20:41:34 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id o15so11547413wru.6
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 12:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=L5e4DIZV3VJ4/DZhaxMedvf932BuCNS+uWtVsQlOpwI=;
 b=XxNPjkbmXf7MCgGcE/QgflUYbsN17qETnpKjYFS9Tmq8Ug+Eh73nfFd9TdzkCf9AE2
 oXqwEtnOGsYB3/Qkqvm7ruzS2MjUIY3aaFb/sI8NiY9wk+1Z71m9h2JfZmeR80VoBtTg
 7iQXDKjWZq5LlUw07orJj+TOP6gH4hHKFOli0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=L5e4DIZV3VJ4/DZhaxMedvf932BuCNS+uWtVsQlOpwI=;
 b=Ez9AfQHwBh4gZn/Y118zbTzpwqZg37vUoN0Qjt0eaAvjpmAxpIesYKa/UQIXeVKZxa
 N41etgGTwd2a7eo0qKNluxHZj1pLjZk7zE7Dp8zTvvAl4adQ2mV/i++mZv0s9JCYLMhT
 3vDkxZaNBAPV0U473S+vLg5ot1AXYK2Fv3uJJuaPDqm5z3OyCM54t1zwH47w+mIsW3CJ
 F4HsZmUvfRrZmuOtfWInTjZbs1F/vxu3X61UQr2UbAlwvG4DoWSTmVbucUByWeMbKXxD
 LjNzsjaIx45BmrfEt/Cvho3+as4ZHDPneE45H/JZXxMsCq3TBR80y63jp3irLL1emkyI
 0Cdw==
X-Gm-Message-State: AOAM531Nukn4LdxHMxoGE/PYva0zwCIK5hC1CfH1+8Q9djIqqSEjrDEb
 cFAQrdfcAkiesZb9PTJAA6etbg==
X-Google-Smtp-Source: ABdhPJy+vZyBmSoL9CBj+APp8QgyaRgbuZ4I7P5mhruXWGfad54Kzai82pflGZdDNk9mmE7+FVR9aA==
X-Received: by 2002:a5d:4cca:: with SMTP id c10mr5895092wrt.372.1605300092835; 
 Fri, 13 Nov 2020 12:41:32 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o63sm11571531wmo.2.2020.11.13.12.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 12:41:32 -0800 (PST)
Date: Fri, 13 Nov 2020 21:41:30 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v10 6/6] dma-buf: Document that dma-buf size is fixed
Message-ID: <20201113204130.GU401619@phenom.ffwll.local>
References: <1605044477-51833-1-git-send-email-jianxin.xiong@intel.com>
 <1605044477-51833-7-git-send-email-jianxin.xiong@intel.com>
 <20201111163323.GP401619@phenom.ffwll.local>
 <20201112132514.GR244516@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201112132514.GR244516@ziepe.ca>
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
Cc: Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Doug Ledford <dledford@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Jianxin Xiong <jianxin.xiong@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 12, 2020 at 09:25:14AM -0400, Jason Gunthorpe wrote:
> On Wed, Nov 11, 2020 at 05:33:23PM +0100, Daniel Vetter wrote:
> > On Tue, Nov 10, 2020 at 01:41:17PM -0800, Jianxin Xiong wrote:
> > > The fact that the size of dma-buf is invariant over the lifetime of the
> > > buffer is mentioned in the comment of 'dma_buf_ops.mmap', but is not
> > > documented at where the info is defined. Add the missing documentation.
> > > 
> > > Signed-off-by: Jianxin Xiong <jianxin.xiong@intel.com>
> > 
> > Applied to drm-misc-next, thanks for your patch. For the preceeding
> > dma-buf patch I'll wait for more review/acks before I apply it. Ack from
> > Jason might also be good, since looks like this dma_virt_ops is only used
> > in rdma.
> 
> We are likely to delete it entirely this cycle, Christoph already has
> a patch series to do it:
> 
> https://patchwork.kernel.org/project/linux-rdma/list/?series=379277
> 
> So, lets just forget about it

I can get behind that :-) Also I realized that even when we need it,
probably best if you merge it to avoid a partially broken feature in the
rdma tree. So not my problem anyway ...

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
