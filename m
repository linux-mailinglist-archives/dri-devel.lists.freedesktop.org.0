Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D699E156F
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 09:19:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D20010E945;
	Tue,  3 Dec 2024 08:19:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eUWnf2pA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com
 [209.85.221.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1544810E945
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 08:19:51 +0000 (UTC)
Received: by mail-vk1-f171.google.com with SMTP id
 71dfb90a1353d-5151541426fso1433691e0c.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2024 00:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733213990; x=1733818790; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Vsj8i3VF0/AL4g+rLDoTFB1nT9yk0yv1XKITOpKGRhs=;
 b=eUWnf2pAgqS5yHiWXQAcUAa+RixgLrL8Vioh3SulQP0lEPWbBqgMWj7Y82CkDVf7rw
 xp6TAeuJBbLVXG9RvZim0Moe+aSoF9pSZrLwMlbfO0/x9abNGs8NJxXAFHlCoFjQgvHP
 oeGrIQb0dREqicEx0d9lKgcAQA03MGQWxMwvQQlKnWZFTP0T/IlD4YC6lAAGDvh1xRii
 5rxF1sJP17m71k5NGSPepIk1ZwCWyhGaf5G5lRVI3yNsJnUzTE15tWAozVI39cnnwyV1
 Zti1ozu5ng0mqRphE9RJIrgmse5wM38RjvPtIeLZnTdR5HRkWmxDrdVmNEXKR2my/aeS
 UuZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733213990; x=1733818790;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Vsj8i3VF0/AL4g+rLDoTFB1nT9yk0yv1XKITOpKGRhs=;
 b=H3LJcVYWwfQp9r8ZIIHrCHq5yukX1fen2YQ545FZRPzp6kv1KUC3e4zad9HlSTC6QO
 j7TuMlanMKcb8blx55YoIhsmpYylwul9w7EC17oS5xdRWhGYmqoWnwXLnwoehaRAUwFp
 f94HpEwBpnk+rXjS7xrN9GvgNOcJ/sppiPlJUdAtIgzZA2iFHhKj8tnW3kZaDPilue4T
 Upo5kiKdGKMA9lqO8LUX7Ixp3kdsApyjxd/6ZBg+WtZbiScx+/S5xaqXbGAw1Q/7UJ8T
 VUzYeRwbQzkPZVnKLXopdVufIpMO0+asNk5Boa3NeQoWrRZhVouSWYaIX7zxklc4PF8N
 IzQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMVEObk5pOBWAQoWR01DlFMY3fyi5wueHTsCsJC3NXFkneqdDCazwjdB1bWwmkBA0tkjp/fIk7bRI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+vYK469ZO9EHPWTcKlw8+vjBOjP8NnsUWmyFzSRB3xfgU+nnx
 qvBKa5kcyJNw5z1TN2uF03BB1CGeQr7UITDlptcLQVVF10D+WGPA8lEGBBOPtl3XI5R/WCcHOmT
 sXvyfRluy+5glK1KQeyu53H9tSWx1lSBu84dwog==
X-Gm-Gg: ASbGncu+/VF0WXlipqF5l8S2GwDgeTdGQVwn+zysBLxOm798d3jnjokzrBeX2DHyfJr
 oH9V+2N89UnokKLRuzlPvrSKPTSnFkjkteA==
X-Google-Smtp-Source: AGHT+IHhgRi6le33djtnnabxus579I8WGDDs7fxmGGJ7In3V8yy+9XEA+ZTYMpYeh6He6To4nl16qk2TElOKF7lE40A=
X-Received: by 2002:a05:6102:2909:b0:4af:5eb5:843d with SMTP id
 ada2fe7eead31-4af971f93c6mr2422981137.6.1733213989604; Tue, 03 Dec 2024
 00:19:49 -0800 (PST)
MIME-Version: 1.0
References: <20241128150927.1377981-1-jens.wiklander@linaro.org>
 <20241128150927.1377981-5-jens.wiklander@linaro.org>
In-Reply-To: <20241128150927.1377981-5-jens.wiklander@linaro.org>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 3 Dec 2024 13:49:38 +0530
Message-ID: <CAFA6WYMi6X37=nKx4v52xYWU2wkW1dmcPMeXn6=6k4nv2igpPA@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] optee: support restricted memory allocation
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
 Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
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

Hi Jens,

On Thu, 28 Nov 2024 at 20:39, Jens Wiklander <jens.wiklander@linaro.org> wrote:
>
> Add support in the OP-TEE backend driver for restricted memory
> allocation.
>
> The restricted memory can be allocated from a static carveout, but also
> be dynamically allocated from CMA and turned into restricted memory by
> OP-TEE, inaccessible by the kernel. The restricted memory configuration
> is depends on the platform and is probed by driver.
>
> A restricted memory pool is allocated during probe if a static carveout
> is available. The restricted memory pools for dynamically allocated
> restrict memory are instantiated when requested by user-space. This
> instantiation can fail if OP-TEE doesn't support the requested use-case
> of restricted memory.

Can we split this patch into smaller reviewable pieces as follows?

- Patch 1: Adds support for static carveout using SMC ABI
- Patch 2: Adds support for dynamic CMA pool using SMC ABI
- Patch 3: Adds support for both using FF-A ABI

-Sumit

>
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  drivers/tee/optee/Makefile        |   1 +
>  drivers/tee/optee/core.c          |   1 +
>  drivers/tee/optee/ffa_abi.c       | 135 ++++++++++-
>  drivers/tee/optee/optee_private.h |  33 ++-
>  drivers/tee/optee/rstmem.c        | 380 ++++++++++++++++++++++++++++++
>  drivers/tee/optee/smc_abi.c       | 138 ++++++++++-
>  6 files changed, 683 insertions(+), 5 deletions(-)
>  create mode 100644 drivers/tee/optee/rstmem.c
>
> diff --git a/drivers/tee/optee/Makefile b/drivers/tee/optee/Makefile
> index a6eff388d300..498969fb8e40 100644
> --- a/drivers/tee/optee/Makefile
> +++ b/drivers/tee/optee/Makefile
> @@ -4,6 +4,7 @@ optee-objs += core.o
>  optee-objs += call.o
>  optee-objs += notif.o
>  optee-objs += rpc.o
> +optee-objs += rstmem.o
>  optee-objs += supp.o
>  optee-objs += device.o
>  optee-objs += smc_abi.o
> diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
> index c75fddc83576..f4fa494789a4 100644
> --- a/drivers/tee/optee/core.c
> +++ b/drivers/tee/optee/core.c
> @@ -182,6 +182,7 @@ void optee_remove_common(struct optee *optee)
>         tee_device_unregister(optee->teedev);
>
>         tee_shm_pool_free(optee->pool);
> +       optee_rstmem_pools_uninit(optee);
>         optee_supp_uninit(&optee->supp);
>         mutex_destroy(&optee->call_queue.mutex);
>         rpmb_dev_put(optee->rpmb_dev);
> diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_abi.c
> index 02e6175ac5f0..f500cf101c8d 100644
> --- a/drivers/tee/optee/ffa_abi.c
> +++ b/drivers/tee/optee/ffa_abi.c
> @@ -672,6 +672,122 @@ static int optee_ffa_do_call_with_arg(struct tee_context *ctx,
>         return optee_ffa_yielding_call(ctx, &data, rpc_arg, system_thread);
>  }
>
> +static int do_call_lend_rstmem(struct optee *optee, u64 cookie, u32 use_case)
> +{
> +       struct optee_shm_arg_entry *entry;
> +       struct optee_msg_arg *msg_arg;
> +       struct tee_shm *shm;
> +       u_int offs;
> +       int rc;
> +
> +       msg_arg = optee_get_msg_arg(optee->ctx, 1, &entry, &shm, &offs);
> +       if (IS_ERR(msg_arg))
> +               return PTR_ERR(msg_arg);
> +
> +       msg_arg->cmd = OPTEE_MSG_CMD_ASSIGN_RSTMEM;
> +       msg_arg->params[0].attr = OPTEE_MSG_ATTR_TYPE_VALUE_INPUT;
> +       msg_arg->params[0].u.value.a = cookie;
> +       msg_arg->params[0].u.value.b = use_case;
> +
> +       rc = optee->ops->do_call_with_arg(optee->ctx, shm, offs, false);
> +       if (rc)
> +               goto out;
> +       if (msg_arg->ret != TEEC_SUCCESS) {
> +               rc = -EINVAL;
> +               goto out;
> +       }
> +
> +out:
> +       optee_free_msg_arg(optee->ctx, entry, offs);
> +       return rc;
> +}
> +
> +static int optee_ffa_lend_rstmem(struct optee *optee, struct tee_shm *rstmem,
> +                                u16 *end_points, unsigned int ep_count)
> +{
> +       struct ffa_device *ffa_dev = optee->ffa.ffa_dev;
> +       const struct ffa_mem_ops *mem_ops = ffa_dev->ops->mem_ops;
> +       const struct ffa_msg_ops *msg_ops = ffa_dev->ops->msg_ops;
> +       struct ffa_send_direct_data data;
> +       struct ffa_mem_region_attributes *mem_attr;
> +       struct ffa_mem_ops_args args = {
> +               .use_txbuf = true,
> +               .tag = rstmem->use_case,
> +       };
> +       struct page *page;
> +       struct scatterlist sgl;
> +       unsigned int n;
> +       int rc;
> +
> +       mem_attr = kcalloc(ep_count, sizeof(*mem_attr), GFP_KERNEL);
> +       for (n = 0; n < ep_count; n++) {
> +               mem_attr[n].receiver = end_points[n];
> +               mem_attr[n].attrs = FFA_MEM_RW;
> +       }
> +       args.attrs = mem_attr;
> +       args.nattrs = ep_count;
> +
> +       page = phys_to_page(rstmem->paddr);
> +       sg_init_table(&sgl, 1);
> +       sg_set_page(&sgl, page, rstmem->size, 0);
> +
> +       args.sg = &sgl;
> +       rc = mem_ops->memory_lend(&args);
> +       kfree(mem_attr);
> +       if (rc)
> +               return rc;
> +
> +       rc = do_call_lend_rstmem(optee, args.g_handle, rstmem->use_case);
> +       if (rc)
> +               goto err_reclaim;
> +
> +       rc = optee_shm_add_ffa_handle(optee, rstmem, args.g_handle);
> +       if (rc)
> +               goto err_unreg;
> +
> +       rstmem->sec_world_id = args.g_handle;
> +
> +       return 0;
> +
> +err_unreg:
> +       data = (struct ffa_send_direct_data){
> +               .data0 = OPTEE_FFA_RELEASE_RSTMEM,
> +               .data1 = (u32)args.g_handle,
> +               .data2 = (u32)(args.g_handle >> 32),
> +       };
> +       msg_ops->sync_send_receive(ffa_dev, &data);
> +err_reclaim:
> +       mem_ops->memory_reclaim(args.g_handle, 0);
> +       return rc;
> +}
> +
> +static int optee_ffa_reclaim_rstmem(struct optee *optee, struct tee_shm *rstmem)
> +{
> +       struct ffa_device *ffa_dev = optee->ffa.ffa_dev;
> +       const struct ffa_msg_ops *msg_ops = ffa_dev->ops->msg_ops;
> +       const struct ffa_mem_ops *mem_ops = ffa_dev->ops->mem_ops;
> +       u64 global_handle = rstmem->sec_world_id;
> +       struct ffa_send_direct_data data = {
> +               .data0 = OPTEE_FFA_RELEASE_RSTMEM,
> +               .data1 = (u32)global_handle,
> +               .data2 = (u32)(global_handle >> 32)
> +       };
> +       int rc;
> +
> +       optee_shm_rem_ffa_handle(optee, global_handle);
> +       rstmem->sec_world_id = 0;
> +
> +       rc = msg_ops->sync_send_receive(ffa_dev, &data);
> +       if (rc)
> +               pr_err("Release SHM id 0x%llx rc %d\n", global_handle, rc);
> +
> +       rc = mem_ops->memory_reclaim(global_handle, 0);
> +       if (rc)
> +               pr_err("mem_reclaim: 0x%llx %d", global_handle, rc);
> +
> +       return rc;
> +}
> +
>  /*
>   * 6. Driver initialization
>   *
> @@ -785,7 +901,10 @@ static void optee_ffa_get_version(struct tee_device *teedev,
>                 .gen_caps = TEE_GEN_CAP_GP | TEE_GEN_CAP_REG_MEM |
>                             TEE_GEN_CAP_MEMREF_NULL,
>         };
> +       struct optee *optee = tee_get_drvdata(teedev);
>
> +       if (optee->rstmem_pools)
> +               v.gen_caps |= TEE_GEN_CAP_RSTMEM;
>         *vers = v;
>  }
>
> @@ -804,6 +923,8 @@ static const struct tee_driver_ops optee_ffa_clnt_ops = {
>         .cancel_req = optee_cancel_req,
>         .shm_register = optee_ffa_shm_register,
>         .shm_unregister = optee_ffa_shm_unregister,
> +       .rstmem_alloc = optee_rstmem_alloc,
> +       .rstmem_free = optee_rstmem_free,
>  };
>
>  static const struct tee_desc optee_ffa_clnt_desc = {
> @@ -820,6 +941,8 @@ static const struct tee_driver_ops optee_ffa_supp_ops = {
>         .supp_send = optee_supp_send,
>         .shm_register = optee_ffa_shm_register, /* same as for clnt ops */
>         .shm_unregister = optee_ffa_shm_unregister_supp,
> +       .rstmem_alloc = optee_rstmem_alloc,
> +       .rstmem_free = optee_rstmem_free,
>  };
>
>  static const struct tee_desc optee_ffa_supp_desc = {
> @@ -833,6 +956,8 @@ static const struct optee_ops optee_ffa_ops = {
>         .do_call_with_arg = optee_ffa_do_call_with_arg,
>         .to_msg_param = optee_ffa_to_msg_param,
>         .from_msg_param = optee_ffa_from_msg_param,
> +       .lend_rstmem = optee_ffa_lend_rstmem,
> +       .reclaim_rstmem = optee_ffa_reclaim_rstmem,
>  };
>
>  static void optee_ffa_remove(struct ffa_device *ffa_dev)
> @@ -937,11 +1062,17 @@ static int optee_ffa_probe(struct ffa_device *ffa_dev)
>             (sec_caps & OPTEE_FFA_SEC_CAP_RPMB_PROBE))
>                 optee->in_kernel_rpmb_routing = true;
>
> +       if (sec_caps & OPTEE_FFA_SEC_CAP_RSTMEM) {
> +               rc = optee_rstmem_pools_init(optee);
> +               if (rc)
> +                       goto err_free_pool;
> +       }
> +
>         teedev = tee_device_alloc(&optee_ffa_clnt_desc, NULL, optee->pool,
>                                   optee);
>         if (IS_ERR(teedev)) {
>                 rc = PTR_ERR(teedev);
> -               goto err_free_pool;
> +               goto err_free_rstmem_pools;
>         }
>         optee->teedev = teedev;
>
> @@ -1020,6 +1151,8 @@ static int optee_ffa_probe(struct ffa_device *ffa_dev)
>         tee_device_unregister(optee->teedev);
>  err_free_pool:
>         tee_shm_pool_free(pool);
> +err_free_rstmem_pools:
> +       optee_rstmem_pools_uninit(optee);
>  err_free_optee:
>         kfree(optee);
>         return rc;
> diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_private.h
> index 20eda508dbac..dd2a3a2224bc 100644
> --- a/drivers/tee/optee/optee_private.h
> +++ b/drivers/tee/optee/optee_private.h
> @@ -174,9 +174,14 @@ struct optee;
>   * @do_call_with_arg:  enters OP-TEE in secure world
>   * @to_msg_param:      converts from struct tee_param to OPTEE_MSG parameters
>   * @from_msg_param:    converts from OPTEE_MSG parameters to struct tee_param
> + * @lend_rstmem:       lends physically contiguous memory as restricted
> + *                     memory, inaccessible by the kernel
> + * @reclaim_rstmem:    reclaims restricted memory previously lent with
> + *                     @lend_rstmem() and makes it accessible by the
> + *                     kernel again
>   *
>   * These OPs are only supposed to be used internally in the OP-TEE driver
> - * as a way of abstracting the different methogs of entering OP-TEE in
> + * as a way of abstracting the different methods of entering OP-TEE in
>   * secure world.
>   */
>  struct optee_ops {
> @@ -191,6 +196,23 @@ struct optee_ops {
>                               size_t num_params,
>                               const struct optee_msg_param *msg_params,
>                               bool update_out);
> +       int (*lend_rstmem)(struct optee *optee, struct tee_shm *rstmem,
> +                          u16 *end_points, unsigned int ep_count);
> +       int (*reclaim_rstmem)(struct optee *optee, struct tee_shm *rstmem);
> +};
> +
> +/**
> + * struct optee_rstmem_pools - restricted memory pools
> + * @mutex:     serializes write access to @xa when adding a new pool.
> + * @xa:                XArray of struct tee_shm_pool where the index is the
> + *             use case ID TEE_IOC_UC_* supplied for TEE_IOC_RSTMEM_ALLOC.
> + */
> +struct optee_rstmem_pools {
> +       /*
> +        * Serializes write access to @xa when adding a new pool.
> +        */
> +       struct mutex mutex;
> +       struct xarray xa;
>  };
>
>  /**
> @@ -206,6 +228,7 @@ struct optee_ops {
>   * @notif:             notification synchronization struct
>   * @supp:              supplicant synchronization struct for RPC to supplicant
>   * @pool:              shared memory pool
> + * @rstmem_pool:       restricted memory pool for secure data path
>   * @mutex:             mutex protecting @rpmb_dev
>   * @rpmb_dev:          current RPMB device or NULL
>   * @rpmb_scan_bus_done flag if device registation of RPMB dependent devices
> @@ -230,6 +253,7 @@ struct optee {
>         struct optee_notif notif;
>         struct optee_supp supp;
>         struct tee_shm_pool *pool;
> +       struct optee_rstmem_pools *rstmem_pools;
>         /* Protects rpmb_dev pointer */
>         struct mutex rpmb_dev_mutex;
>         struct rpmb_dev *rpmb_dev;
> @@ -286,6 +310,9 @@ void optee_supp_init(struct optee_supp *supp);
>  void optee_supp_uninit(struct optee_supp *supp);
>  void optee_supp_release(struct optee_supp *supp);
>
> +int optee_rstmem_pools_init(struct optee *optee);
> +void optee_rstmem_pools_uninit(struct optee *optee);
> +
>  int optee_supp_recv(struct tee_context *ctx, u32 *func, u32 *num_params,
>                     struct tee_param *param);
>  int optee_supp_send(struct tee_context *ctx, u32 ret, u32 num_params,
> @@ -378,6 +405,10 @@ void optee_rpc_cmd(struct tee_context *ctx, struct optee *optee,
>  int optee_do_bottom_half(struct tee_context *ctx);
>  int optee_stop_async_notif(struct tee_context *ctx);
>
> +int optee_rstmem_alloc(struct tee_context *ctx, struct tee_shm *shm,
> +                      u32 flags, u32 use_case, size_t size);
> +void optee_rstmem_free(struct tee_context *ctx, struct tee_shm *shm);
> +
>  /*
>   * Small helpers
>   */
> diff --git a/drivers/tee/optee/rstmem.c b/drivers/tee/optee/rstmem.c
> new file mode 100644
> index 000000000000..cf300929171f
> --- /dev/null
> +++ b/drivers/tee/optee/rstmem.c
> @@ -0,0 +1,380 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2024, Linaro Limited
> + */
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/cma.h>
> +#include <linux/dma-map-ops.h>
> +#include <linux/errno.h>
> +#include <linux/genalloc.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +#include <linux/tee_core.h>
> +#include <linux/types.h>
> +#include "optee_private.h"
> +
> +struct optee_rstmem_cma_pool {
> +       struct tee_shm_pool pool;
> +       struct page *page;
> +       struct optee *optee;
> +       size_t page_count;
> +       u16 *end_points;
> +       u_int end_point_count;
> +       u_int align;
> +       refcount_t refcount;
> +       struct tee_shm rstmem;
> +       /* Protects when initializing and tearing down this struct */
> +       struct mutex mutex;
> +};
> +
> +static struct optee_rstmem_cma_pool *
> +to_rstmem_cma_pool(struct tee_shm_pool *pool)
> +{
> +       return container_of(pool, struct optee_rstmem_cma_pool, pool);
> +}
> +
> +static int init_cma_rstmem(struct optee_rstmem_cma_pool *rp)
> +{
> +       struct cma *cma = dev_get_cma_area(&rp->optee->teedev->dev);
> +       int rc;
> +
> +       rp->page = cma_alloc(cma, rp->page_count, rp->align, true/*no_warn*/);
> +       if (!rp->page)
> +               return -ENOMEM;
> +
> +       /*
> +        * TODO unmap the memory range since the physical memory will
> +        * become inaccesible after the lend_rstmem() call.
> +        */
> +
> +       rp->rstmem.paddr = page_to_phys(rp->page);
> +       rp->rstmem.size = rp->page_count * PAGE_SIZE;
> +       rc = rp->optee->ops->lend_rstmem(rp->optee, &rp->rstmem,
> +                                        rp->end_points, rp->end_point_count);
> +       if (rc)
> +               goto err_release;
> +
> +       rp->pool.private_data = gen_pool_create(PAGE_SHIFT, -1);
> +       if (!rp->pool.private_data) {
> +               rc = -ENOMEM;
> +               goto err_reclaim;
> +       }
> +
> +       rc = gen_pool_add(rp->pool.private_data, rp->rstmem.paddr,
> +                         rp->rstmem.size, -1);
> +       if (rc)
> +               goto err_free_pool;
> +
> +       refcount_set(&rp->refcount, 1);
> +       return 0;
> +
> +err_free_pool:
> +       gen_pool_destroy(rp->pool.private_data);
> +err_reclaim:
> +       rp->optee->ops->reclaim_rstmem(rp->optee, &rp->rstmem);
> +err_release:
> +       cma_release(cma, rp->page, rp->page_count);
> +       rp->rstmem.paddr = 0;
> +       rp->rstmem.size = 0;
> +       rp->rstmem.sec_world_id = 0;
> +       return rc;
> +}
> +
> +static int get_cma_rstmem(struct optee_rstmem_cma_pool *rp)
> +{
> +       int rc = 0;
> +
> +       if (!refcount_inc_not_zero(&rp->refcount)) {
> +               mutex_lock(&rp->mutex);
> +               if (rp->pool.private_data) {
> +                       /*
> +                        * Another thread has already initialized the pool
> +                        * before us, or the pool was just about to be torn
> +                        * down. Either way we only need to increase the
> +                        * refcount and we're done.
> +                        */
> +                       refcount_inc(&rp->refcount);
> +               } else {
> +                       rc = init_cma_rstmem(rp);
> +               }
> +               mutex_unlock(&rp->mutex);
> +       }
> +
> +       return rc;
> +}
> +
> +static void release_cma_rstmem(struct optee_rstmem_cma_pool *rp)
> +{
> +       gen_pool_destroy(rp->pool.private_data);
> +       rp->optee->ops->reclaim_rstmem(rp->optee, &rp->rstmem);
> +       cma_release(dev_get_cma_area(&rp->optee->teedev->dev), rp->page,
> +                   rp->page_count);
> +
> +       rp->pool.private_data = NULL;
> +       rp->page = NULL;
> +       rp->rstmem.paddr = 0;
> +       rp->rstmem.size = 0;
> +       rp->rstmem.sec_world_id = 0;
> +}
> +
> +static void put_cma_rstmem(struct optee_rstmem_cma_pool *rp)
> +{
> +       if (refcount_dec_and_test(&rp->refcount)) {
> +               mutex_lock(&rp->mutex);
> +               if (rp->pool.private_data)
> +                       release_cma_rstmem(rp);
> +               mutex_unlock(&rp->mutex);
> +       }
> +}
> +
> +static int rstmem_pool_op_cma_alloc(struct tee_shm_pool *pool,
> +                                   struct tee_shm *shm, size_t size,
> +                                   size_t align)
> +{
> +       struct optee_rstmem_cma_pool *rp = to_rstmem_cma_pool(pool);
> +       size_t sz = ALIGN(size, PAGE_SIZE);
> +       phys_addr_t pa;
> +       int rc;
> +
> +       rc = get_cma_rstmem(rp);
> +       if (rc)
> +               return rc;
> +
> +       pa = gen_pool_alloc(rp->pool.private_data, sz);
> +       if (!pa) {
> +               put_cma_rstmem(rp);
> +               return -ENOMEM;
> +       }
> +
> +       shm->size = sz;
> +       shm->paddr = pa;
> +       shm->offset = pa - page_to_phys(rp->page);
> +       shm->sec_world_id = rp->rstmem.sec_world_id;
> +
> +       return 0;
> +}
> +
> +static void rstmem_pool_op_cma_free(struct tee_shm_pool *pool,
> +                                   struct tee_shm *shm)
> +{
> +       struct optee_rstmem_cma_pool *rp = to_rstmem_cma_pool(pool);
> +
> +       gen_pool_free(rp->pool.private_data, shm->paddr, shm->size);
> +       shm->size = 0;
> +       shm->paddr = 0;
> +       shm->offset = 0;
> +       shm->sec_world_id = 0;
> +       put_cma_rstmem(rp);
> +}
> +
> +static void pool_op_cma_destroy_pool(struct tee_shm_pool *pool)
> +{
> +       struct optee_rstmem_cma_pool *rp = to_rstmem_cma_pool(pool);
> +
> +       mutex_destroy(&rp->mutex);
> +       kfree(rp);
> +}
> +
> +static struct tee_shm_pool_ops rstmem_pool_ops_cma = {
> +       .alloc = rstmem_pool_op_cma_alloc,
> +       .free = rstmem_pool_op_cma_free,
> +       .destroy_pool = pool_op_cma_destroy_pool,
> +};
> +
> +static int get_rstmem_config(struct optee *optee, u32 use_case,
> +                            size_t *min_size, u_int *min_align,
> +                            u16 *end_points, u_int *ep_count)
> +{
> +       struct tee_param params[2] = {
> +               [0] = {
> +                       .attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT,
> +                       .u.value.a = use_case,
> +               },
> +               [1] = {
> +                       .attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT,
> +               },
> +       };
> +       struct optee_shm_arg_entry *entry;
> +       struct tee_shm *shm_param = NULL;
> +       struct optee_msg_arg *msg_arg;
> +       struct tee_shm *shm;
> +       u_int offs;
> +       int rc;
> +
> +       if (end_points && *ep_count) {
> +               params[1].u.memref.size = *ep_count * sizeof(*end_points);
> +               shm_param = tee_shm_alloc_priv_buf(optee->ctx,
> +                                                  params[1].u.memref.size);
> +               if (IS_ERR(shm_param))
> +                       return PTR_ERR(shm_param);
> +               params[1].u.memref.shm = shm_param;
> +       }
> +
> +       msg_arg = optee_get_msg_arg(optee->ctx, ARRAY_SIZE(params), &entry,
> +                                   &shm, &offs);
> +       if (IS_ERR(msg_arg)) {
> +               rc = PTR_ERR(msg_arg);
> +               goto out_free_shm;
> +       }
> +       msg_arg->cmd = OPTEE_MSG_CMD_GET_RSTMEM_CONFIG;
> +
> +       rc = optee->ops->to_msg_param(optee, msg_arg->params,
> +                                     ARRAY_SIZE(params), params,
> +                                     false /*!update_out*/);
> +       if (rc)
> +               goto out_free_msg;
> +
> +       rc = optee->ops->do_call_with_arg(optee->ctx, shm, offs, false);
> +       if (rc)
> +               goto out_free_msg;
> +       if (msg_arg->ret && msg_arg->ret != TEEC_ERROR_SHORT_BUFFER) {
> +               rc = -EINVAL;
> +               goto out_free_msg;
> +       }
> +
> +       rc = optee->ops->from_msg_param(optee, params, ARRAY_SIZE(params),
> +                                       msg_arg->params, true /*update_out*/);
> +       if (rc)
> +               goto out_free_msg;
> +
> +       if (!msg_arg->ret && end_points &&
> +           *ep_count < params[1].u.memref.size / sizeof(u16)) {
> +               rc = -EINVAL;
> +               goto out_free_msg;
> +       }
> +
> +       *min_size = params[0].u.value.a;
> +       *min_align = params[0].u.value.b;
> +       *ep_count = params[1].u.memref.size / sizeof(u16);
> +
> +       if (msg_arg->ret == TEEC_ERROR_SHORT_BUFFER) {
> +               rc = -ENOSPC;
> +               goto out_free_msg;
> +       }
> +
> +       if (end_points)
> +               memcpy(end_points, tee_shm_get_va(shm_param, 0),
> +                      params[1].u.memref.size);
> +
> +out_free_msg:
> +       optee_free_msg_arg(optee->ctx, entry, offs);
> +out_free_shm:
> +       if (shm_param)
> +               tee_shm_free(shm_param);
> +       return rc;
> +}
> +
> +static struct tee_shm_pool *alloc_rstmem_pool(struct optee *optee, u32 use_case)
> +{
> +       struct optee_rstmem_cma_pool *rp;
> +       size_t min_size;
> +       int rc;
> +
> +       rp = kzalloc(sizeof(*rp), GFP_KERNEL);
> +       if (!rp)
> +               return ERR_PTR(-ENOMEM);
> +       rp->rstmem.use_case = use_case;
> +
> +       rc = get_rstmem_config(optee, use_case, &min_size, &rp->align, NULL,
> +                              &rp->end_point_count);
> +       if (rc) {
> +               if (rc != -ENOSPC)
> +                       goto err;
> +               rp->end_points = kcalloc(rp->end_point_count,
> +                                        sizeof(*rp->end_points), GFP_KERNEL);
> +               if (!rp->end_points) {
> +                       rc = -ENOMEM;
> +                       goto err;
> +               }
> +               rc = get_rstmem_config(optee, use_case, &min_size, &rp->align,
> +                                      rp->end_points, &rp->end_point_count);
> +               if (rc)
> +                       goto err_kfree_eps;
> +       }
> +
> +       rp->pool.ops = &rstmem_pool_ops_cma;
> +       rp->optee = optee;
> +       rp->page_count = min_size / PAGE_SIZE;
> +       mutex_init(&rp->mutex);
> +
> +       return &rp->pool;
> +
> +err_kfree_eps:
> +       kfree(rp->end_points);
> +err:
> +       kfree(rp);
> +       return ERR_PTR(rc);
> +}
> +
> +int optee_rstmem_alloc(struct tee_context *ctx, struct tee_shm *shm,
> +                      u32 flags, u32 use_case, size_t size)
> +{
> +       struct optee *optee = tee_get_drvdata(ctx->teedev);
> +       struct tee_shm_pool *pool;
> +       int rc;
> +
> +       if (!optee->rstmem_pools)
> +               return -EINVAL;
> +       if (flags)
> +               return -EINVAL;
> +
> +       pool = xa_load(&optee->rstmem_pools->xa, use_case);
> +       if (!pool) {
> +               pool = alloc_rstmem_pool(optee, use_case);
> +               if (IS_ERR(pool))
> +                       return PTR_ERR(pool);
> +               rc = xa_insert(&optee->rstmem_pools->xa, use_case, pool,
> +                              GFP_KERNEL);
> +               if (rc) {
> +                       pool->ops->destroy_pool(pool);
> +                       return rc;
> +               }
> +       }
> +
> +       return pool->ops->alloc(pool, shm, size, 0);
> +}
> +
> +void optee_rstmem_free(struct tee_context *ctx, struct tee_shm *shm)
> +{
> +       struct optee *optee = tee_get_drvdata(ctx->teedev);
> +       struct tee_shm_pool *pool;
> +
> +       pool = xa_load(&optee->rstmem_pools->xa, shm->use_case);
> +       if (pool)
> +               pool->ops->free(pool, shm);
> +       else
> +               pr_err("Can't find pool for use_case %u\n", shm->use_case);
> +}
> +
> +int optee_rstmem_pools_init(struct optee *optee)
> +{
> +       struct optee_rstmem_pools *pools;
> +
> +       pools = kmalloc(sizeof(*pools), GFP_KERNEL);
> +       if (!pools)
> +               return -ENOMEM;
> +
> +       mutex_init(&pools->mutex);
> +       xa_init(&pools->xa);
> +       optee->rstmem_pools = pools;
> +       return 0;
> +}
> +
> +void optee_rstmem_pools_uninit(struct optee *optee)
> +{
> +       if (optee->rstmem_pools) {
> +               struct tee_shm_pool *pool;
> +               u_long idx;
> +
> +               xa_for_each(&optee->rstmem_pools->xa, idx, pool) {
> +                       xa_erase(&optee->rstmem_pools->xa, idx);
> +                       pool->ops->destroy_pool(pool);
> +               }
> +
> +               xa_destroy(&optee->rstmem_pools->xa);
> +               mutex_destroy(&optee->rstmem_pools->mutex);
> +               kfree(optee->rstmem_pools);
> +               optee->rstmem_pools = NULL;
> +       }
> +}
> diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
> index d1f79947f58a..7fa7d9d14c94 100644
> --- a/drivers/tee/optee/smc_abi.c
> +++ b/drivers/tee/optee/smc_abi.c
> @@ -1001,6 +1001,67 @@ static int optee_smc_do_call_with_arg(struct tee_context *ctx,
>         return rc;
>  }
>
> +static int optee_smc_lend_rstmem(struct optee *optee, struct tee_shm *rstmem,
> +                                u16 *end_points, unsigned int ep_count)
> +{
> +       struct optee_shm_arg_entry *entry;
> +       struct optee_msg_arg *msg_arg;
> +       struct tee_shm *shm;
> +       u_int offs;
> +       int rc;
> +
> +       msg_arg = optee_get_msg_arg(optee->ctx, 2, &entry, &shm, &offs);
> +       if (IS_ERR(msg_arg))
> +               return PTR_ERR(msg_arg);
> +
> +       msg_arg->cmd = OPTEE_MSG_CMD_LEND_RSTMEM;
> +       msg_arg->params[0].attr = OPTEE_MSG_ATTR_TYPE_VALUE_INPUT;
> +       msg_arg->params[0].u.value.a = OPTEE_MSG_RSTMEM_SECURE_VIDEO_PLAY;
> +       msg_arg->params[1].attr = OPTEE_MSG_ATTR_TYPE_TMEM_INPUT;
> +       msg_arg->params[1].u.tmem.buf_ptr = rstmem->paddr;
> +       msg_arg->params[1].u.tmem.size = rstmem->size;
> +       msg_arg->params[1].u.tmem.shm_ref = (u_long)rstmem;
> +
> +       rc = optee->ops->do_call_with_arg(optee->ctx, shm, offs, false);
> +       if (rc)
> +               goto out;
> +       if (msg_arg->ret != TEEC_SUCCESS) {
> +               rc = -EINVAL;
> +               goto out;
> +       }
> +
> +out:
> +       optee_free_msg_arg(optee->ctx, entry, offs);
> +       return rc;
> +}
> +
> +static int optee_smc_reclaim_rstmem(struct optee *optee, struct tee_shm *rstmem)
> +{
> +       struct optee_shm_arg_entry *entry;
> +       struct optee_msg_arg *msg_arg;
> +       struct tee_shm *shm;
> +       u_int offs;
> +       int rc;
> +
> +       msg_arg = optee_get_msg_arg(optee->ctx, 1, &entry, &shm, &offs);
> +       if (IS_ERR(msg_arg))
> +               return PTR_ERR(msg_arg);
> +
> +       msg_arg->cmd = OPTEE_MSG_CMD_RECLAIM_RSTMEM;
> +       msg_arg->params[0].attr = OPTEE_MSG_ATTR_TYPE_RMEM_INPUT;
> +       msg_arg->params[0].u.rmem.shm_ref = (u_long)rstmem;
> +
> +       rc = optee->ops->do_call_with_arg(optee->ctx, shm, offs, false);
> +       if (rc)
> +               goto out;
> +       if (msg_arg->ret != TEEC_SUCCESS)
> +               rc = -EINVAL;
> +
> +out:
> +       optee_free_msg_arg(optee->ctx, entry, offs);
> +       return rc;
> +}
> +
>  /*
>   * 5. Asynchronous notification
>   */
> @@ -1201,6 +1262,8 @@ static void optee_get_version(struct tee_device *teedev,
>                 v.gen_caps |= TEE_GEN_CAP_REG_MEM;
>         if (optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_MEMREF_NULL)
>                 v.gen_caps |= TEE_GEN_CAP_MEMREF_NULL;
> +       if (optee->rstmem_pools)
> +               v.gen_caps |= TEE_GEN_CAP_RSTMEM;
>         *vers = v;
>  }
>
> @@ -1223,6 +1286,8 @@ static const struct tee_driver_ops optee_clnt_ops = {
>         .cancel_req = optee_cancel_req,
>         .shm_register = optee_shm_register,
>         .shm_unregister = optee_shm_unregister,
> +       .rstmem_alloc = optee_rstmem_alloc,
> +       .rstmem_free = optee_rstmem_free,
>  };
>
>  static const struct tee_desc optee_clnt_desc = {
> @@ -1239,6 +1304,8 @@ static const struct tee_driver_ops optee_supp_ops = {
>         .supp_send = optee_supp_send,
>         .shm_register = optee_shm_register_supp,
>         .shm_unregister = optee_shm_unregister_supp,
> +       .rstmem_alloc = optee_rstmem_alloc,
> +       .rstmem_free = optee_rstmem_free,
>  };
>
>  static const struct tee_desc optee_supp_desc = {
> @@ -1252,6 +1319,9 @@ static const struct optee_ops optee_ops = {
>         .do_call_with_arg = optee_smc_do_call_with_arg,
>         .to_msg_param = optee_to_msg_param,
>         .from_msg_param = optee_from_msg_param,
> +       .lend_rstmem = optee_smc_lend_rstmem,
> +       .reclaim_rstmem = optee_smc_reclaim_rstmem,
> +       //.alloc_rstmem_pool = optee_smc_alloc_rstmem_pool,
>  };
>
>  static int enable_async_notif(optee_invoke_fn *invoke_fn)
> @@ -1619,6 +1689,62 @@ static inline int optee_load_fw(struct platform_device *pdev,
>  }
>  #endif
>
> +static int optee_sdp_pool_init(struct optee *optee)
> +{
> +       bool dyn_sdp = optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_DYNAMIC_RSTMEM;
> +       bool sdp = optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_SDP;
> +       struct tee_shm_pool *pool;
> +       int rc;
> +
> +       /*
> +        * optee_sdp_pools_init() must be called if secure world has any
> +        * SDP capability. If the static carvout is available initialize
> +        * and add a pool for that. If there's an error from secure world
> +        * we complain but don't call optee_sdp_pools_uninit() unless we
> +        * know that there is no SDP capability left.
> +        */
> +       if (!dyn_sdp && !sdp)
> +               return 0;
> +
> +       rc = optee_rstmem_pools_init(optee);
> +       if (rc)
> +               return rc;
> +
> +       if (optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_SDP) {
> +               union {
> +                       struct arm_smccc_res smccc;
> +                       struct optee_smc_get_sdp_config_result result;
> +               } res;
> +
> +               optee->smc.invoke_fn(OPTEE_SMC_GET_SDP_CONFIG, 0, 0, 0, 0, 0, 0,
> +                                    0, &res.smccc);
> +               if (res.result.status != OPTEE_SMC_RETURN_OK) {
> +                       pr_err("Secure Data Path service not available\n");
> +                       if (!dyn_sdp)
> +                               goto err;
> +                       return 0;
> +               }
> +
> +               pool = tee_rstmem_gen_pool_alloc(res.result.start,
> +                                                res.result.size);
> +               if (IS_ERR(pool)) {
> +                       rc = PTR_ERR(pool);
> +                       goto err;
> +               }
> +               rc = xa_insert(&optee->rstmem_pools->xa,
> +                              TEE_IOC_UC_SECURE_VIDEO_PLAY, pool, GFP_KERNEL);
> +               if (rc) {
> +                       pool->ops->destroy_pool(pool);
> +                       goto err;
> +               }
> +       }
> +
> +       return 0;
> +err:
> +       optee_rstmem_pools_uninit(optee);
> +       return rc;
> +}
> +
>  static int optee_probe(struct platform_device *pdev)
>  {
>         optee_invoke_fn *invoke_fn;
> @@ -1714,7 +1840,7 @@ static int optee_probe(struct platform_device *pdev)
>         optee = kzalloc(sizeof(*optee), GFP_KERNEL);
>         if (!optee) {
>                 rc = -ENOMEM;
> -               goto err_free_pool;
> +               goto err_free_shm_pool;
>         }
>
>         optee->ops = &optee_ops;
> @@ -1726,10 +1852,14 @@ static int optee_probe(struct platform_device *pdev)
>             (sec_caps & OPTEE_SMC_SEC_CAP_RPMB_PROBE))
>                 optee->in_kernel_rpmb_routing = true;
>
> +       rc = optee_sdp_pool_init(optee);
> +       if (rc)
> +               goto err_free_optee;
> +
>         teedev = tee_device_alloc(&optee_clnt_desc, NULL, pool, optee);
>         if (IS_ERR(teedev)) {
>                 rc = PTR_ERR(teedev);
> -               goto err_free_optee;
> +               goto err_rstmem_pools_uninit;
>         }
>         optee->teedev = teedev;
>
> @@ -1836,9 +1966,11 @@ static int optee_probe(struct platform_device *pdev)
>         tee_device_unregister(optee->supp_teedev);
>  err_unreg_teedev:
>         tee_device_unregister(optee->teedev);
> +err_rstmem_pools_uninit:
> +       optee_rstmem_pools_uninit(optee);
>  err_free_optee:
>         kfree(optee);
> -err_free_pool:
> +err_free_shm_pool:
>         tee_shm_pool_free(pool);
>         if (memremaped_shm)
>                 memunmap(memremaped_shm);
> --
> 2.43.0
>
