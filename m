Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9A02A9194
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 09:36:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F19F06EE3B;
	Fri,  6 Nov 2020 08:35:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C83EB6E87D
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 00:20:11 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id h12so2543601qtu.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 16:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=hV4SEbrM/cIWHspZNhYKzuHjXt0GCuMNZj9nj+83JqM=;
 b=YA3K7K0g8CwFP10WeAX3bc05toLcAkgLDj1VIunQGfgs+3C430y9AiRL5TrmQaR4Ta
 4DhzgDL8DEeOKyreCZ8T/NXmUUF3HTjEG1a/n4wIuTSUWYTxZoG0XpDTKny5nm56Dy52
 H80wvIlLHcBf9Hu2ujzsyGxpXrJq6SrwpT8aQsXkE32Bk8iD32fcmzx6Ikz0RIMpkaKl
 D++YryJXtQLMOG3WOoLXJ9ldn9rPkw/YlfbDzgtgLZQmaZqtcLcdeQa0TeW0gqO2QNTH
 jq0p5DjRevgzzYHTzlirXnoa0Ko7nRRQoN8GozGc+sguMLGtjjVSAP+hthGiddIHmWpl
 CygQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hV4SEbrM/cIWHspZNhYKzuHjXt0GCuMNZj9nj+83JqM=;
 b=Ah5wMMT7bQEJE8N3nyf5chARjPoHIychH/JpXJ9e82FGVRgBY3khZzD9oRT28HA5U9
 htezgVHObSS5oEc4eLk96K47OF5jIKUhgWRb3Cq8V4dwWVlcW/BbnsNcqub2Bvs6nyE6
 WehWEDc1ufX7nbSnZukvxACaAVmbB1Y/8p0eQCcBkSxLnFoyiM9OHHV/g2EwNTU90mvM
 7MfpPN4SENb/X7AIT4f31u7HxLnDJB2YYco0mT9NpklTpMXfYFH4+Mi3b7PR3x97+7HE
 awwBz9epQ/HJplM08E7F5e5lQt6s9VnHbaSVMZnPE5gCkH6INB0UY9JPyMn4WB5hysGu
 i0/A==
X-Gm-Message-State: AOAM532xzL7hTRR5IqKuM8EIoTs3X7cVrQg7Lag0WkqSo5/aBvtBVwAo
 H1F4cN56svmNoEm4m4ZvzLnf9mrIkUmWTkfR
X-Google-Smtp-Source: ABdhPJylFIt5cEtGoDhOoFF3X0K+8oi4lVXCQkELBUl3PeuOzt7toSBJrjXXUA6DCJh0zXLdu9LGwQ==
X-Received: by 2002:a37:a2d1:: with SMTP id l200mr4141877qke.237.1604621584929; 
 Thu, 05 Nov 2020 16:13:04 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id r204sm2186885qka.122.2020.11.05.16.13.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 16:13:04 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kapNH-000YyW-NU; Thu, 05 Nov 2020 20:13:03 -0400
Date: Thu, 5 Nov 2020 20:13:03 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jianxin Xiong <jianxin.xiong@intel.com>
Subject: Re: [PATCH v8 3/5] RDMA/uverbs: Add uverbs command for dma-buf based
 MR registration
Message-ID: <20201106001303.GL36674@ziepe.ca>
References: <1604616489-69267-1-git-send-email-jianxin.xiong@intel.com>
 <1604616489-69267-4-git-send-email-jianxin.xiong@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1604616489-69267-4-git-send-email-jianxin.xiong@intel.com>
X-Mailman-Approved-At: Fri, 06 Nov 2020 08:34:42 +0000
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

On Thu, Nov 05, 2020 at 02:48:07PM -0800, Jianxin Xiong wrote:

> +	ret = ib_check_mr_access(access_flags);
> +	if (ret)
> +		return ret;

This should also reject unsupportable flags like ACCESS_ON_DEMAND and
HUGETLB

> +
> +	mr = pd->device->ops.reg_user_mr_dmabuf(pd, offset, length, virt_addr,
> +						fd, access_flags,
> +						&attrs->driver_udata);
> +	if (IS_ERR(mr))
> +		return PTR_ERR(mr);
> +
> +	mr->device  = pd->device;
> +	mr->pd      = pd;
> +	mr->type    = IB_MR_TYPE_USER;
> +	mr->uobject = uobj;
> +	atomic_inc(&pd->usecnt);

Fix intending when copying code please

> +
> +	uobj->object = mr;

Also bit surprised this works at all, it needs to call

  uverbs_finalize_uobj_create()

Right here.

Seems like the core code is missing some check that the API is being
used properly.

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
> +
> +	return ret;
> +}
> +
>  DECLARE_UVERBS_NAMED_METHOD(
>  	UVERBS_METHOD_ADVISE_MR,
>  	UVERBS_ATTR_IDR(UVERBS_ATTR_ADVISE_MR_PD_HANDLE,

> @@ -253,6 +364,7 @@ static int UVERBS_HANDLER(UVERBS_METHOD_QUERY_MR)(
>  DECLARE_UVERBS_NAMED_OBJECT(
>  	UVERBS_OBJECT_MR,
>  	UVERBS_TYPE_ALLOC_IDR(uverbs_free_mr),
> +	&UVERBS_METHOD(UVERBS_METHOD_REG_DMABUF_MR),
>  	&UVERBS_METHOD(UVERBS_METHOD_DM_MR_REG),
>  	&UVERBS_METHOD(UVERBS_METHOD_MR_DESTROY),
>  	&UVERBS_METHOD(UVERBS_METHOD_ADVISE_MR),

I trie to keep these sorted, but I see it has become unsorted. You can
re-sort it in this patch

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
