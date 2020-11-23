Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C50F32C1F95
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 09:09:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDD586E296;
	Tue, 24 Nov 2020 08:09:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94AF46E06B
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 18:01:28 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id q5so17776914qkc.12
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 10:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=N9MF+lDHqfdrOMOX989mRTQt30eOc1f0uOQNvzhdZdQ=;
 b=D6uZ9GM2gSzH90A+W8GSye1nq4Xzm1qevcYVf+pYSXN0xYRzokBh09/nN+zmFm5Jqf
 XypUTkzeCIYB9Yu8QS8n7UjjZwGfLyIUD7arKUNE+AwkRaS3Mkf+G3TPX9m8KYK8gwYk
 lkkXDYDHEt/sGYUe152wIrwd44mNff5guGZSj2N85ZmhQfJ6vLEvZNrEd+neLuHuumuU
 scG4OWzntq1zohDBVFTDYvDmIxLxISbC79nAZ3fL6Sk+yeoM3NvgtYLMygLPM8LM328U
 yOhLFZnLM4pplOOH4Pzx3ojVEmHiumBQVfIlAOWa8WtWsl5NTm7HDEmnIHqdKKATIM2U
 i1Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=N9MF+lDHqfdrOMOX989mRTQt30eOc1f0uOQNvzhdZdQ=;
 b=e03srf+ft62C3lJbCEstdrznq3BEQGDsDyP8aZQA6Zlo0XaT5r18jtihG61RnNQ+/a
 16zWgwJCYju9HAUZTemwInjh5g/Wycq7Mn7MFIc+t9Sd4dERadt6Qfeim/YxGpPBUTny
 olVVNgxrm2mpYR28/sI1PK0UK7pfkzz0UmUy4EHdVosS14Rq4GcZGMwebSS0CElNViwO
 nE2gWTOa+dPamofYKW2kdJLo3Y1+P8NxtmMSK2k+fV2pzqs6VCfHL9VIGDoJrF3X8xg5
 7WhXBgjljPp7WG2eUC6LFU6CwKL97oiTOUq84UN99l13Yj3C6DzHQP+rUa6+RCqWztKt
 XDMw==
X-Gm-Message-State: AOAM532ZtVmsj4pGeEkN/lTpwaGlBD/qzp/KbleTt1ZJ1hHwCmomv/Jv
 a1qvULEHvKtF8shAKySfnQO5JQ==
X-Google-Smtp-Source: ABdhPJwExL4tn3YzJP9PHafQTkayQM/QNy1uj5WHbFo/XFuVJEnbeV8gasilTeqsR/RtS+StnPS5IA==
X-Received: by 2002:a37:4854:: with SMTP id v81mr725786qka.20.1606154487716;
 Mon, 23 Nov 2020 10:01:27 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id o8sm10201637qtm.9.2020.11.23.10.01.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 10:01:26 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1khG9W-00AESp-6G; Mon, 23 Nov 2020 14:01:26 -0400
Date: Mon, 23 Nov 2020 14:01:26 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jianxin Xiong <jianxin.xiong@intel.com>
Subject: Re: [PATCH rdma-core 1/5] verbs: Support dma-buf based memory region
Message-ID: <20201123180126.GY244516@ziepe.ca>
References: <1606153984-104583-1-git-send-email-jianxin.xiong@intel.com>
 <1606153984-104583-2-git-send-email-jianxin.xiong@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1606153984-104583-2-git-send-email-jianxin.xiong@intel.com>
X-Mailman-Approved-At: Tue, 24 Nov 2020 08:08:40 +0000
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

On Mon, Nov 23, 2020 at 09:53:00AM -0800, Jianxin Xiong wrote:
> Add new API function and new provider method for registering dma-buf
> based memory region. Update the man page and bump the API version.
> 
> Signed-off-by: Jianxin Xiong <jianxin.xiong@intel.com>
>  kernel-headers/rdma/ib_user_ioctl_cmds.h | 14 ++++++++++++
>  libibverbs/cmd_mr.c                      | 38 ++++++++++++++++++++++++++++++++
>  libibverbs/driver.h                      |  7 ++++++
>  libibverbs/dummy_ops.c                   | 11 +++++++++
>  libibverbs/libibverbs.map.in             |  6 +++++
>  libibverbs/man/ibv_reg_mr.3              | 21 ++++++++++++++++--
>  libibverbs/verbs.c                       | 19 ++++++++++++++++
>  libibverbs/verbs.h                       | 10 +++++++++
>  8 files changed, 124 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel-headers/rdma/ib_user_ioctl_cmds.h b/kernel-headers/rdma/ib_user_ioctl_cmds.h
> index 7968a18..dafc7eb 100644
> +++ b/kernel-headers/rdma/ib_user_ioctl_cmds.h
> @@ -1,5 +1,6 @@
>  /*
>   * Copyright (c) 2018, Mellanox Technologies inc.  All rights reserved.
> + * Copyright (c) 2020, Intel Corporation. All rights reserved.
>   *
>   * This software is available to you under a choice of one of two
>   * licenses.  You may choose to be licensed under the terms of the GNU
> @@ -251,6 +252,7 @@ enum uverbs_methods_mr {
>  	UVERBS_METHOD_MR_DESTROY,
>  	UVERBS_METHOD_ADVISE_MR,
>  	UVERBS_METHOD_QUERY_MR,
> +	UVERBS_METHOD_REG_DMABUF_MR,
>  };
>  
>  enum uverbs_attrs_mr_destroy_ids {
> @@ -272,6 +274,18 @@ enum uverbs_attrs_query_mr_cmd_attr_ids {
>  	UVERBS_ATTR_QUERY_MR_RESP_IOVA,
>  };
>  
> +enum uverbs_attrs_reg_dmabuf_mr_cmd_attr_ids {
> +	UVERBS_ATTR_REG_DMABUF_MR_HANDLE,
> +	UVERBS_ATTR_REG_DMABUF_MR_PD_HANDLE,
> +	UVERBS_ATTR_REG_DMABUF_MR_OFFSET,
> +	UVERBS_ATTR_REG_DMABUF_MR_LENGTH,
> +	UVERBS_ATTR_REG_DMABUF_MR_IOVA,
> +	UVERBS_ATTR_REG_DMABUF_MR_FD,
> +	UVERBS_ATTR_REG_DMABUF_MR_ACCESS_FLAGS,
> +	UVERBS_ATTR_REG_DMABUF_MR_RESP_LKEY,
> +	UVERBS_ATTR_REG_DMABUF_MR_RESP_RKEY,
> +};
> +
>  enum uverbs_attrs_create_counters_cmd_attr_ids {
>  	UVERBS_ATTR_CREATE_COUNTERS_HANDLE,
>  };

Please put changes to kernel-headers/ into their own patch

There is a script to make that commit in kernel-headers/update

> diff --git a/libibverbs/cmd_mr.c b/libibverbs/cmd_mr.c
> index 42dbe42..91ce2ef 100644
> +++ b/libibverbs/cmd_mr.c
> @@ -1,5 +1,6 @@
>  /*
>   * Copyright (c) 2018 Mellanox Technologies, Ltd.  All rights reserved.
> + * Copyright (c) 2020 Intel Corporation.  All rights reserved.
>   *
>   * This software is available to you under a choice of one of two
>   * licenses.  You may choose to be licensed under the terms of the GNU
> @@ -116,3 +117,40 @@ int ibv_cmd_query_mr(struct ibv_pd *pd, struct verbs_mr *vmr,
>  	return 0;
>  }
>  
> +int ibv_cmd_reg_dmabuf_mr(struct ibv_pd *pd, uint64_t offset, size_t length,
> +			  uint64_t iova, int fd, int access,
> +			  struct verbs_mr *vmr)
> +{
> +	DECLARE_COMMAND_BUFFER(cmdb, UVERBS_OBJECT_MR,
> +			       UVERBS_METHOD_REG_DMABUF_MR,
> +			       9);
> +	struct ib_uverbs_attr *handle;
> +	uint32_t lkey, rkey;
> +	int ret;
> +
> +	handle = fill_attr_out_obj(cmdb, UVERBS_ATTR_REG_DMABUF_MR_HANDLE);
> +	fill_attr_out_ptr(cmdb, UVERBS_ATTR_REG_DMABUF_MR_RESP_LKEY, &lkey);
> +	fill_attr_out_ptr(cmdb, UVERBS_ATTR_REG_DMABUF_MR_RESP_RKEY, &rkey);
> +
> +	fill_attr_in_obj(cmdb, UVERBS_ATTR_REG_DMABUF_MR_PD_HANDLE, pd->handle);
> +	fill_attr_in_uint64(cmdb, UVERBS_ATTR_REG_DMABUF_MR_OFFSET, offset);
> +	fill_attr_in_uint64(cmdb, UVERBS_ATTR_REG_DMABUF_MR_LENGTH, length);
> +	fill_attr_in_uint64(cmdb, UVERBS_ATTR_REG_DMABUF_MR_IOVA, iova);
> +	fill_attr_in_uint32(cmdb, UVERBS_ATTR_REG_DMABUF_MR_FD, fd);
> +	fill_attr_in_uint32(cmdb, UVERBS_ATTR_REG_DMABUF_MR_ACCESS_FLAGS, access);
> +
> +	ret = execute_ioctl(pd->context, cmdb);
> +	if (ret)
> +		return errno;
> +
> +	vmr->ibv_mr.handle =
> +		read_attr_obj(UVERBS_ATTR_REG_DMABUF_MR_HANDLE, handle);
> +	vmr->ibv_mr.context = pd->context;
> +	vmr->ibv_mr.lkey    = lkey;
> +	vmr->ibv_mr.rkey    = rkey;
> +	vmr->ibv_mr.pd	    = pd;
> +	vmr->ibv_mr.addr    = (void *)offset;
> +	vmr->ibv_mr.length  = length;
> +	vmr->mr_type        = IBV_MR_TYPE_MR;

Remove the extra spaces around the = please

> diff --git a/libibverbs/libibverbs.map.in b/libibverbs/libibverbs.map.in
> index b5ccaca..f67e1ef 100644
> +++ b/libibverbs/libibverbs.map.in
> @@ -148,6 +148,11 @@ IBVERBS_1.11 {
>  		_ibv_query_gid_table;
>  } IBVERBS_1.10;
>  
> +IBVERBS_1.12 {
> +	global:
> +		ibv_reg_dmabuf_mr;
> +} IBVERBS_1.11;

There are a few things missing for this, the github CI should throw
some errors, please check it and fix everything

After this you need to change libibverbs/CMakeLists.txt and update:

  1 1.11.${PACKAGE_VERSION}

To 
  1 1.12.${PACKAGE_VERSION}

You also need to update debian/libibverbs1.symbols, check the git
history for examples
  
> +LATEST_SYMVER_FUNC(ibv_reg_dmabuf_mr, 1_12, "IBVERBS_1.12",
> +		   struct ibv_mr *,
> +		   struct ibv_pd *pd, uint64_t offset,
> +		   size_t length, int fd, int access)

Do not use LATEST_SYMVER_FUNC, it is only for special cases where we
have two implementations of the same function. A normal function and
the map file update is all that is needed

> diff --git a/libibverbs/verbs.h b/libibverbs/verbs.h
> index ee57e05..3961b1e 100644
> +++ b/libibverbs/verbs.h
> @@ -3,6 +3,7 @@
>   * Copyright (c) 2004, 2011-2012 Intel Corporation.  All rights reserved.
>   * Copyright (c) 2005, 2006, 2007 Cisco Systems, Inc.  All rights reserved.
>   * Copyright (c) 2005 PathScale, Inc.  All rights reserved.
> + * Copyright (c) 2020 Intel Corporation.  All rights reserved.
>   *
>   * This software is available to you under a choice of one of two
>   * licenses.  You may choose to be licensed under the terms of the GNU
> @@ -2133,6 +2134,9 @@ struct verbs_context {
>  	struct ibv_xrcd *	(*open_xrcd)(struct ibv_context *context,
>  					     struct ibv_xrcd_init_attr *xrcd_init_attr);
>  	int			(*close_xrcd)(struct ibv_xrcd *xrcd);
> +	struct ibv_mr *		(*reg_dmabuf_mr)(struct ibv_pd *pd, uint64_t offset,
> +						 size_t length, uint64_t iova,
> +						 int fd, int access);
>  	uint64_t _ABI_placeholder3;
>  	size_t   sz;			/* Must be immediately before struct ibv_context */
>  	struct ibv_context context;	/* Must be last field in the struct */

No, delete this whole hunk, it is not needed

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
