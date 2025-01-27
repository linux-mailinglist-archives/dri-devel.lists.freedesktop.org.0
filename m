Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81082A1D9C3
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 16:43:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE5A910E572;
	Mon, 27 Jan 2025 15:43:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="i7lzRVrl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 028BF10E572
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 15:43:10 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-53e3778bffdso5182458e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 07:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737992589; x=1738597389; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hHQd5cjQbBNiv2pY8rRqJIrAWAxmWtuuWMAVaWyuOF4=;
 b=i7lzRVrly2n8eSqNAk8gIqaVXQg/qTbirPAvPcrQgM2xHSu2f7j0ZP4B5YEoNwfZ2i
 djTFgeaV2WUXtWy/CCoaCWY9cG2Fl7hu8AOrOnmbZsGXy/42Jk4YXs3vBJ+Ase0lk+Zp
 wK+DT3epi42rByRHmeAUQdsADJ8a8RoQ3SjA81Jn79QmNuzwG3WaDVtf+iC40EnDjx+k
 R/3FLzCZKO8bpLQEYGRyEYt/li589LtlyYq7IE/buhg5rV77aFc4mtqU0QzQFl+nMKVn
 bKwLAv24FODeXuX8Ua2dT3/Ni86KyyLvjCjRDCXIkfRfhfkiFvkT40Qo9yoe2EtV02zq
 DgbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737992589; x=1738597389;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hHQd5cjQbBNiv2pY8rRqJIrAWAxmWtuuWMAVaWyuOF4=;
 b=KFLxfAN2P9ysIAyRuq5q88pe/yu4ksnDNSgaOcwAHbJsEIxpOZgswNxOg7HUJyys+O
 cR/BV8pG53LAUR05usQpbUd/aHnZ01ZZHkygKRVZ+7X7R4qo9MFqufMB3+SUpSu2e7wA
 ILyv+iHN2+2y3eh/q7t8uAO2hgoKU/QK3v2iKqRdxlb6tNFbJCqF1mFDKwv/5bTP6i7z
 cwLcZ0d0ChSr2vtjctt4EQ4qWuHeE2/KuNYlV/kkwhSzO/ChoM+zsavUreD/2rbuVdzM
 H2m3J5umJh84zGoF+rGMNYOA0l6hl8mKR5C2Q32jwZnP25up0qWDSpuqFrB53vz+GtEE
 HfgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIfEKhTSXq+QDBFXjDENQM5umSTrUP41Rmtb8oux4JY5R6Y/nuz6fciUHzzOmkvfStkUcGUoVJ8DM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxm5maouqoOVun/rTMsrkO4Vveo/e8oa1+Y4F7PODgbZK7x/Low
 5MZQFpP2OVACScLHFblHsarJyMZB073DH73omI+TOIVO+WWt/I/yx3v/CmQd9vODwW+vz07VSjX
 bU4s=
X-Gm-Gg: ASbGncv5vZaTNkKrY5+dQyC+mF8J7Adho7MH1ld/qynDgR3TO/CNAQmfdzMPoKYlnNu
 iaDhhMGHYkV2GeismzJ3vo+UMCxNVJAFZ6TQuJQfKEfRG0yuV8q1M57+mDJeSybhR2NccaEwQuc
 9j7EK2MqfW6/k8gx6Rid+hezM0FDQKp48N04wb+XNF6XnVjvPYkadR06+VHp8RXEwZ4+NqVFMvY
 g82w3WTEvNXT8+KFBhEPVdXFCmVz20ylvyIOgkPF+LuM4VPpjIVFUKcgt1dmXBUEEhoyYA4q6hT
 IRikAowjihH6C4O79Grd1n8jKfjkIYEBa0whM3UPACYdeYqTqSGv1vVmG3qm
X-Google-Smtp-Source: AGHT+IEkFCIrfiecKQIn0nuU/0wlpniZedRP2dGP9fDfftQvW+CRiPn1WH0bteoGQtIkJbHJ65nwYQ==
X-Received: by 2002:a05:6512:10c8:b0:540:2f59:7561 with SMTP id
 2adb3069b0e04-5439c28aed9mr15402780e87.50.1737992589021; 
 Mon, 27 Jan 2025 07:43:09 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543c822f8b5sm1356699e87.79.2025.01.27.07.43.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2025 07:43:08 -0800 (PST)
Date: Mon, 27 Jan 2025 17:43:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, 
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v2 2/5] misc: fastrpc: Introduce context params structure
Message-ID: <dbyrbb4q2q2hrdarprfpbg4qnctjfp4uiwp6cqq6epg42ekeba@fyipe2jrhayz>
References: <20250127044239.578540-1-quic_ekangupt@quicinc.com>
 <20250127044239.578540-3-quic_ekangupt@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250127044239.578540-3-quic_ekangupt@quicinc.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 27, 2025 at 10:12:36AM +0530, Ekansh Gupta wrote:
> Add structure to invoke context parameterms. This structure is meant

Nit: for invoke context parameters.

> to carry invoke context specific data. This structure is passed to
> internal invocation call to save the data in context. Examples of
> data intended to part of this structure are: CRC user memory address,
> poll timeout for invoke call, call priority etc.
> 
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 138 ++++++++++++++++++++++++++++++++++-------
>  1 file changed, 117 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 1a936d462519..c29d5536195e 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -254,6 +254,11 @@ struct fastrpc_invoke_ctx {
>  	struct fastrpc_channel_ctx *cctx;
>  };
>  
> +struct fastrpc_ctx_args {
> +	struct fastrpc_invoke_args *args;
> +	void __user *crc;
> +};

Why do we need a separate struct? Can we use fastrpc_invoke_ctx instead?

> +
>  struct fastrpc_session_ctx {
>  	struct device *dev;
>  	int sid;
> @@ -574,7 +579,7 @@ static void fastrpc_get_buff_overlaps(struct fastrpc_invoke_ctx *ctx)
>  
>  static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
>  			struct fastrpc_user *user, u32 kernel, u32 sc,
> -			struct fastrpc_invoke_args *args)
> +			struct fastrpc_ctx_args *cargs)
>  {
>  	struct fastrpc_channel_ctx *cctx = user->cctx;
>  	struct fastrpc_invoke_ctx *ctx = NULL;
> @@ -605,7 +610,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
>  			kfree(ctx);
>  			return ERR_PTR(-ENOMEM);
>  		}
> -		ctx->args = args;
> +		ctx->args = cargs->args;
>  		fastrpc_get_buff_overlaps(ctx);
>  	}
>  
> @@ -1133,7 +1138,7 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
>  
>  static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
>  				   u32 handle, u32 sc,
> -				   struct fastrpc_invoke_args *args)
> +				   struct fastrpc_ctx_args *cargs)
>  {
>  	struct fastrpc_invoke_ctx *ctx = NULL;
>  	struct fastrpc_buf *buf, *b;
> @@ -1151,7 +1156,7 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
>  		return -EPERM;
>  	}
>  
> -	ctx = fastrpc_context_alloc(fl, kernel, sc, args);
> +	ctx = fastrpc_context_alloc(fl, kernel, sc, cargs);
>  	if (IS_ERR(ctx))
>  		return PTR_ERR(ctx);
>  
> @@ -1233,6 +1238,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  {
>  	struct fastrpc_init_create_static init;
>  	struct fastrpc_invoke_args *args;
> +	struct fastrpc_ctx_args *cargs;
>  	struct fastrpc_phy_page pages[1];
>  	char *name;
>  	int err;
> @@ -1307,15 +1313,25 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  	args[2].length = sizeof(*pages);
>  	args[2].fd = -1;
>  
> +	cargs = kzalloc(sizeof(*cargs), GFP_KERNEL);
> +	if (!cargs) {
> +		err = -ENOMEM;
> +		goto err_invoke;
> +	}
> +
> +	cargs->args = args;
>  	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE_STATIC, 3, 0);
>  
>  	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE,
> -				      sc, args);
> -	if (err)
> +				      sc, cargs);
> +	if (err) {
> +		kfree(cargs);

No, this should be a part of the error path.

>  		goto err_invoke;
> +	}
>  
>  	kfree(args);
>  	kfree(name);
> +	kfree(cargs);
>  
>  	return 0;
>  err_invoke:
> @@ -1351,6 +1367,7 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>  {
>  	struct fastrpc_init_create init;
>  	struct fastrpc_invoke_args *args;
> +	struct fastrpc_ctx_args *cargs;
>  	struct fastrpc_phy_page pages[1];
>  	struct fastrpc_map *map = NULL;
>  	struct fastrpc_buf *imem = NULL;
> @@ -1438,16 +1455,26 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>  	args[5].length = sizeof(inbuf.siglen);
>  	args[5].fd = -1;
>  
> +	cargs = kzalloc(sizeof(*cargs), GFP_KERNEL);
> +	if (!cargs) {
> +		err = -ENOMEM;
> +		goto err_invoke;
> +	}
> +
> +	cargs->args = args;
>  	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE, 4, 0);
>  	if (init.attrs)
>  		sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE_ATTR, 4, 0);
>  
>  	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE,
> -				      sc, args);
> -	if (err)
> +				      sc, cargs);
> +	if (err) {
> +		kfree(cargs);

Likewise.

>  		goto err_invoke;
> +	}
>  
>  	kfree(args);
> +	kfree(cargs);
>  
>  	return 0;
>  
> @@ -1498,17 +1525,27 @@ static void fastrpc_session_free(struct fastrpc_channel_ctx *cctx,
>  static int fastrpc_release_current_dsp_process(struct fastrpc_user *fl)
>  {
>  	struct fastrpc_invoke_args args[1];
> -	int client_id = 0;
> +	struct fastrpc_ctx_args *cargs;
> +	int client_id = 0, err;
>  	u32 sc;
>  
>  	client_id = fl->client_id;
>  	args[0].ptr = (u64)(uintptr_t) &client_id;
>  	args[0].length = sizeof(client_id);
>  	args[0].fd = -1;
> +
> +	cargs = kzalloc(sizeof(*cargs), GFP_KERNEL);
> +	if (!cargs)
> +		return -ENOMEM;
> +
> +	cargs->args = args;
>  	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_RELEASE, 1, 0);
>  
> -	return fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE,
> -				       sc, &args[0]);
> +	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE,
> +				       sc, cargs);
> +	kfree(cargs);
> +
> +	return err;
>  }
>  
>  static int fastrpc_device_release(struct inode *inode, struct file *file)
> @@ -1643,22 +1680,33 @@ static int fastrpc_dmabuf_alloc(struct fastrpc_user *fl, char __user *argp)
>  static int fastrpc_init_attach(struct fastrpc_user *fl, int pd)
>  {
>  	struct fastrpc_invoke_args args[1];
> -	int client_id = fl->client_id;
> +	struct fastrpc_ctx_args *cargs;
> +	int client_id = fl->client_id, err;
>  	u32 sc;
>  
>  	args[0].ptr = (u64)(uintptr_t) &client_id;
>  	args[0].length = sizeof(client_id);
>  	args[0].fd = -1;
> +
> +	cargs = kzalloc(sizeof(*cargs), GFP_KERNEL);
> +	if (!cargs)
> +		return -ENOMEM;
> +
> +	cargs->args = args;
>  	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_ATTACH, 1, 0);
>  	fl->pd = pd;
>  
> -	return fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE,
> -				       sc, &args[0]);
> +	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE,
> +				       sc, cargs);
> +	kfree(cargs);
> +
> +	return err;
>  }
>  
>  static int fastrpc_invoke(struct fastrpc_user *fl, char __user *argp)
>  {
>  	struct fastrpc_invoke_args *args = NULL;
> +	struct fastrpc_ctx_args *cargs;
>  	struct fastrpc_invoke inv;
>  	u32 nscalars;
>  	int err;
> @@ -1679,9 +1727,16 @@ static int fastrpc_invoke(struct fastrpc_user *fl, char __user *argp)
>  			return -EFAULT;
>  		}
>  	}
> +	cargs = kzalloc(sizeof(*cargs), GFP_KERNEL);
> +	if (!cargs) {
> +		kfree(args);
> +		return -ENOMEM;
> +	}
>  
> -	err = fastrpc_internal_invoke(fl, false, inv.handle, inv.sc, args);
> +	cargs->args = args;
> +	err = fastrpc_internal_invoke(fl, false, inv.handle, inv.sc, cargs);
>  	kfree(args);
> +	kfree(cargs);
>  
>  	return err;
>  }
> @@ -1690,6 +1745,8 @@ static int fastrpc_get_info_from_dsp(struct fastrpc_user *fl, uint32_t *dsp_attr
>  				     uint32_t dsp_attr_buf_len)
>  {
>  	struct fastrpc_invoke_args args[2] = { 0 };
> +	struct fastrpc_ctx_args *cargs;
> +	int err;
>  
>  	/*
>  	 * Capability filled in userspace. This carries the information
> @@ -1706,8 +1763,15 @@ static int fastrpc_get_info_from_dsp(struct fastrpc_user *fl, uint32_t *dsp_attr
>  	args[1].length = dsp_attr_buf_len * sizeof(u32);
>  	args[1].fd = -1;
>  
> -	return fastrpc_internal_invoke(fl, true, FASTRPC_DSP_UTILITIES_HANDLE,
> -				       FASTRPC_SCALARS(0, 1, 1), args);
> +	cargs = kzalloc(sizeof(*cargs), GFP_KERNEL);
> +	if (!cargs)
> +		return -ENOMEM;
> +
> +	cargs->args = args;
> +	err = fastrpc_internal_invoke(fl, true, FASTRPC_DSP_UTILITIES_HANDLE,
> +				       FASTRPC_SCALARS(0, 1, 1), cargs);
> +	kfree(cargs);
> +	return err;
>  }
>  
>  static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
> @@ -1794,6 +1858,7 @@ static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
>  static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *buf)
>  {
>  	struct fastrpc_invoke_args args[1] = { [0] = { 0 } };
> +	struct fastrpc_ctx_args *cargs;
>  	struct fastrpc_munmap_req_msg req_msg;
>  	struct device *dev = fl->sctx->dev;
>  	int err;
> @@ -1806,9 +1871,14 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
>  	args[0].ptr = (u64) (uintptr_t) &req_msg;
>  	args[0].length = sizeof(req_msg);
>  
> +	cargs = kzalloc(sizeof(*cargs), GFP_KERNEL);
> +	if (!cargs)
> +		return -ENOMEM;
> +
> +	cargs->args = args;
>  	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MUNMAP, 1, 0);
>  	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc,
> -				      &args[0]);
> +				      cargs);
>  	if (!err) {
>  		dev_dbg(dev, "unmmap\tpt 0x%09lx OK\n", buf->raddr);
>  		spin_lock(&fl->lock);
> @@ -1818,6 +1888,7 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
>  	} else {
>  		dev_err(dev, "unmmap\tpt 0x%09lx ERROR\n", buf->raddr);
>  	}
> +	kfree(cargs);
>  
>  	return err;
>  }
> @@ -1852,6 +1923,7 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
>  static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>  {
>  	struct fastrpc_invoke_args args[3] = { [0 ... 2] = { 0 } };
> +	struct fastrpc_ctx_args *cargs;
>  	struct fastrpc_buf *buf = NULL;
>  	struct fastrpc_mmap_req_msg req_msg;
>  	struct fastrpc_mmap_rsp_msg rsp_msg;
> @@ -1902,12 +1974,18 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>  	args[2].ptr = (u64) (uintptr_t) &rsp_msg;
>  	args[2].length = sizeof(rsp_msg);
>  
> +	cargs = kzalloc(sizeof(*cargs), GFP_KERNEL);
> +	if (!cargs)
> +		return -ENOMEM;
> +
> +	cargs->args = args;
>  	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MMAP, 2, 1);
>  	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc,
> -				      &args[0]);
> +				      cargs);
>  	if (err) {
>  		dev_err(dev, "mmap error (len 0x%08llx)\n", buf->size);
>  		fastrpc_buf_free(buf);
> +		kfree(cargs);
>  		return err;
>  	}
>  
> @@ -1942,17 +2020,20 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>  	dev_dbg(dev, "mmap\t\tpt 0x%09lx OK [len 0x%08llx]\n",
>  		buf->raddr, buf->size);
>  
> +	kfree(cargs);
>  	return 0;
>  
>  err_assign:
>  	fastrpc_req_munmap_impl(fl, buf);
>  
> +	kfree(cargs);
>  	return err;
>  }
>  
>  static int fastrpc_req_mem_unmap_impl(struct fastrpc_user *fl, struct fastrpc_mem_unmap *req)
>  {
>  	struct fastrpc_invoke_args args[1] = { [0] = { 0 } };
> +	struct fastrpc_ctx_args *cargs;
>  	struct fastrpc_map *map = NULL, *iter, *m;
>  	struct fastrpc_mem_unmap_req_msg req_msg = { 0 };
>  	int err = 0;
> @@ -1982,14 +2063,21 @@ static int fastrpc_req_mem_unmap_impl(struct fastrpc_user *fl, struct fastrpc_me
>  	args[0].ptr = (u64) (uintptr_t) &req_msg;
>  	args[0].length = sizeof(req_msg);
>  
> +	cargs = kzalloc(sizeof(*cargs), GFP_KERNEL);
> +	if (!cargs)
> +		return -ENOMEM;
> +
> +	cargs->args = args;
>  	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MEM_UNMAP, 1, 0);
>  	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc,
> -				      &args[0]);
> +				      cargs);
>  	if (err) {
>  		dev_err(dev, "unmmap\tpt fd = %d, 0x%09llx error\n",  map->fd, map->raddr);
> +		kfree(cargs);
>  		return err;
>  	}
>  	fastrpc_map_put(map);
> +	kfree(cargs);
>  
>  	return 0;
>  }
> @@ -2007,6 +2095,7 @@ static int fastrpc_req_mem_unmap(struct fastrpc_user *fl, char __user *argp)
>  static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
>  {
>  	struct fastrpc_invoke_args args[4] = { [0 ... 3] = { 0 } };
> +	struct fastrpc_ctx_args *cargs;
>  	struct fastrpc_mem_map_req_msg req_msg = { 0 };
>  	struct fastrpc_mmap_rsp_msg rsp_msg = { 0 };
>  	struct fastrpc_mem_unmap req_unmap = { 0 };
> @@ -2051,8 +2140,13 @@ static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
>  	args[3].ptr = (u64) (uintptr_t) &rsp_msg;
>  	args[3].length = sizeof(rsp_msg);
>  
> +	cargs = kzalloc(sizeof(*cargs), GFP_KERNEL);
> +	if (!cargs)
> +		return -ENOMEM;
> +
> +	cargs->args = args;
>  	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MEM_MAP, 3, 1);
> -	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc, &args[0]);
> +	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc, cargs);
>  	if (err) {
>  		dev_err(dev, "mem mmap error, fd %d, vaddr %llx, size %lld\n",
>  			req.fd, req.vaddrin, map->size);
> @@ -2072,11 +2166,13 @@ static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
>  		fastrpc_req_mem_unmap_impl(fl, &req_unmap);
>  		return -EFAULT;
>  	}
> +	kfree(cargs);
>  
>  	return 0;
>  
>  err_invoke:
>  	fastrpc_map_put(map);
> +	kfree(cargs);
>  
>  	return err;
>  }
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
