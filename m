Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB4D2B1762
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 09:38:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F1626E487;
	Fri, 13 Nov 2020 08:38:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E6206E2B8
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 00:34:00 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id v20so544447qvx.4
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 16:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=afW4WZCzKSBkopY3D+EVH1mNn8OfkBRY3siF83lMqQE=;
 b=GUB8oXHn8qWx1yZtNDBUNGqTLGpekKppaOjDD2/QhlEVR9N0rxsCnt3wtwTpUAoqZ5
 PGK138XPCL/h3BSPAWJhZCi+5FuqJgzGaf+au5hUAKFkpgxpTHcAadz1vo1a8Q/SAy8L
 MI+lP9mVzqVmmkxzorDX3NvY0A/j1ot5n3Tt94i8bC+FU0mlVX86NxbZLjPgjcrP8JpB
 D/tHzmselKJEt2LNgNXviNM2vM0kYITy0CLHHcwvaXfVaOTkAoLWD151voKCmVizgULW
 2AZZgo2sFFC/RsxFoQj81yg+6A9YWQF6JKUxxD2OqFpzi6Ds5p21p/IBe+ZdknM851fN
 kdPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=afW4WZCzKSBkopY3D+EVH1mNn8OfkBRY3siF83lMqQE=;
 b=lUM64By5ky747izeflxTIKgK2tlNUhf90omrWN17MDjJhIW6MIMDhlVapCH/W3cNdv
 /98e2QMtsWLqOhXEctj5huJ7KJwaVWimxnndMrxAm6anrf6uQxA49alqBU3+EzY5J+If
 k1MCPOJSC9iBk4h2h7Gl0HICPx0K2KnqqzMRCxyrkZXnnpAyTJhIAGNX2M6yjEFq762w
 oRs7IDTelLgLo8JRJYwduEhU+g0DLCn9L+LEkSrGJhiRq89YgNjYekEvGtq1yBSbjbP1
 K5p+ITpdVpDDbRITWV2nPKNUe/baQpl+0A2XAiqco8GXNvZK/KI87yqF2Ln76NVo8uQv
 q+fQ==
X-Gm-Message-State: AOAM530xLmwJVvX42bz9WJNoLVtOFtTDqWjToPbzOtcRgtFOvX40IHQZ
 80FpOX8i+/3E2zrhCUrzrEQZSw==
X-Google-Smtp-Source: ABdhPJxTEQq72i7ob2HRVE794ShOLxAvgR60EjaYjpz/aWIW8rfgL1FNfruWyXs0j85qUGJNVa9aUA==
X-Received: by 2002:a0c:8b91:: with SMTP id r17mr2393438qva.29.1605227639736; 
 Thu, 12 Nov 2020 16:33:59 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id t133sm6123625qke.82.2020.11.12.16.33.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 16:33:59 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kdN2M-004CW8-It; Thu, 12 Nov 2020 20:33:58 -0400
Date: Thu, 12 Nov 2020 20:33:58 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jianxin Xiong <jianxin.xiong@intel.com>
Subject: Re: [PATCH v10 3/6] RDMA/uverbs: Add uverbs command for dma-buf
 based MR registration
Message-ID: <20201113003358.GZ244516@ziepe.ca>
References: <1605044477-51833-1-git-send-email-jianxin.xiong@intel.com>
 <1605044477-51833-4-git-send-email-jianxin.xiong@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1605044477-51833-4-git-send-email-jianxin.xiong@intel.com>
X-Mailman-Approved-At: Fri, 13 Nov 2020 08:38:02 +0000
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

On Tue, Nov 10, 2020 at 01:41:14PM -0800, Jianxin Xiong wrote:
> +	mr = pd->device->ops.reg_user_mr_dmabuf(pd, offset, length, virt_addr,
> +						fd, access_flags,
> +						&attrs->driver_udata);
> +	if (IS_ERR(mr))
> +		return PTR_ERR(mr);
> +
> +	mr->device = pd->device;
> +	mr->pd = pd;
> +	mr->type = IB_MR_TYPE_USER;
> +	mr->uobject = uobj;
> +	atomic_inc(&pd->usecnt);
> +
> +	uobj->object = mr;
> +
> +	uverbs_finalize_uobj_create(attrs, UVERBS_ATTR_REG_DMABUF_MR_HANDLE);
> +
> +	ret = uverbs_copy_to(attrs, UVERBS_ATTR_REG_DMABUF_MR_RESP_LKEY,
> +			     &mr->lkey, sizeof(mr->lkey));
> +	if (ret)
> +		goto err_dereg;
> +
> +	ret = uverbs_copy_to(attrs, UVERBS_ATTR_REG_DMABUF_MR_RESP_RKEY,
> +			     &mr->rkey, sizeof(mr->rkey));
> +	if (ret)
> +		goto err_dereg;
> +
> +	return 0;
> +
> +err_dereg:
> +	ib_dereg_mr_user(mr, uverbs_get_cleared_udata(attrs));

This isn't how the error handling works with
uverbs_finalize_uobj_create() - you just return the error code and the
caller deals with destroying the fully initialized HW object
properly. Calling ib_dereg_mr_user() here will crash the kernel.

Check the other uses for an example.

Again I must ask what the plan is for testing as even a basic set of
pyverbs sanity tests would catch this.

I've generally been insisting that all new uABI needs testing support
in rdma-core. This *might* be the exception but I want to hear a
really good reason why we can't have a test first...

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
