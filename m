Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FA69A2068
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 13:00:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13C4E10E307;
	Thu, 17 Oct 2024 11:00:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lHocLMbZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com
 [209.85.217.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2200010E307
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 11:00:42 +0000 (UTC)
Received: by mail-vs1-f43.google.com with SMTP id
 ada2fe7eead31-4a5ad828a0fso239098137.2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 04:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729162841; x=1729767641; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dzueIzrbpWQAQzIPzKgcuzvlN5AJYKxxLdrxhltbeaY=;
 b=lHocLMbZ8AAiCfbJeBDuMefkT5Y/F0ghoUd9Ut4LarhHKSRE6HpODJ/kb+mKHcnMzd
 aHNvz4vlXllRR+YEIme8e4PRsZlo9A7K+xFI8FHTqL2tH6bs3rlxsvfwLNyXcU2JxEKl
 v/nw7vR0cWCNzn2MQoI0yf38egBXTxQ7JYaHTY4Yxpo9J752NaUA+nsCzZXTCWXGgZmd
 RniMohuS4cpo/JleqBhwmOEu69lg+0jlA2v1uQVWUzLOfSKXny1mU4ndVXWgFVW3k+CV
 GTtPe0X4VrIFhB9VoMUrPQzN0P1MqxKwOADx81XztVyMcgqs8m0XEChwhLqnsvfe87pv
 Ba9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729162841; x=1729767641;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dzueIzrbpWQAQzIPzKgcuzvlN5AJYKxxLdrxhltbeaY=;
 b=QMP4xHPke4tM5nSzmHGFDslvvTtfBn+29rgqpjFbgEMQCOW7n72NPLUuqEoqLvddZW
 5HImztpIaeyioL+S2Rza9YCPFoQPb24CLPvjDLRin8rGu8KlEK7r2e4Ti1vQTB2Skx70
 pQoTuC6/h2nppmrqed8xCLaAIfv5ILWJ/Mn83GylqpDnCdIFjDOE7T8flsDNypHT96rT
 kkIJdK417OFUqa0IN3OBlKCFg9b0iAX8LnuDYA8tBDGwbVZQFc/hTT4B2M5A7uzq0xMS
 DGuYZaOGE22JMV9Red9IThJ9m1jvPSGa36yYObJfkOjZZdCWNDVH8PBbh8FC5F9ZxL4t
 ICuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVZQTz+Vd5DqdTzzPcNzR/ZaLlTuT//aQSTTbQd4UQRN+izRvDeRff7aVtTpbhjA10UsDAWsQhqfQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxY+3uRNk+XXCMgo4N0CuqqbHyFElT73gthz8AtdlQ5BWECwuiS
 SUWYiYYM9AGFX7sJwIRcwoyeEcxJBKJ/IpZDHBvggKbuS9mXqn1Pp/l9opt+eb+fvJD5OzsxzxH
 aEvGAzRPnnu+6TokuySEqSzONXeg+Us1HfHKcJA==
X-Google-Smtp-Source: AGHT+IFIkSv1zq1QUikiociz6eI2jMdfdZm0OR2khmhrLpWMG/LnXM7lEBRD+jifjqruQfchix8Rv601CB8w9YyRG6g=
X-Received: by 2002:a05:6102:41a1:b0:4a3:ed09:4746 with SMTP id
 ada2fe7eead31-4a5b57946e1mr6309322137.0.1729162840664; Thu, 17 Oct 2024
 04:00:40 -0700 (PDT)
MIME-Version: 1.0
References: <20241015101716.740829-1-jens.wiklander@linaro.org>
 <20241015101716.740829-3-jens.wiklander@linaro.org>
In-Reply-To: <20241015101716.740829-3-jens.wiklander@linaro.org>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Thu, 17 Oct 2024 16:30:29 +0530
Message-ID: <CAFA6WYMFys_woiF3dzwaXjMy7Y-gTLgHE0PBZtEf6jH-mkc40g@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/2] optee: support restricted memory allocation
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

On Tue, 15 Oct 2024 at 15:47, Jens Wiklander <jens.wiklander@linaro.org> wrote:
>
> Add support in the OP-TEE backend driver for restricted memory
> allocation. The support is limited to only the SMC ABI and for secure
> video buffers.
>
> OP-TEE is probed for the range of restricted physical memory and a
> memory pool allocator is initialized if OP-TEE have support for such
> memory.
>
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  drivers/tee/optee/core.c          | 21 +++++++++++++++
>  drivers/tee/optee/optee_private.h |  6 +++++
>  drivers/tee/optee/optee_smc.h     | 35 ++++++++++++++++++++++++
>  drivers/tee/optee/smc_abi.c       | 45 ++++++++++++++++++++++++++++---
>  4 files changed, 104 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
> index 39e688d4e974..b6d5cbc6728d 100644
> --- a/drivers/tee/optee/core.c
> +++ b/drivers/tee/optee/core.c
> @@ -95,6 +95,25 @@ void optee_release_supp(struct tee_context *ctx)
>         optee_supp_release(&optee->supp);
>  }
>
> +int optee_rstmem_alloc(struct tee_context *ctx, struct tee_shm *shm,
> +                      u32 flags, size_t size)
> +{
> +       struct optee *optee = tee_get_drvdata(ctx->teedev);
> +
> +       if (!optee->sdp_pool)
> +               return -EINVAL;
> +       if (flags != TEE_IOC_FLAG_SECURE_VIDEO)
> +               return -EINVAL;
> +       return optee->sdp_pool->ops->alloc(optee->sdp_pool, shm, size, 0);
> +}
> +
> +void optee_rstmem_free(struct tee_context *ctx, struct tee_shm *shm)
> +{
> +       struct optee *optee = tee_get_drvdata(ctx->teedev);
> +
> +       optee->sdp_pool->ops->free(optee->sdp_pool, shm);
> +}
> +
>  void optee_remove_common(struct optee *optee)
>  {
>         /* Unregister OP-TEE specific client devices on TEE bus */
> @@ -111,6 +130,8 @@ void optee_remove_common(struct optee *optee)
>         tee_device_unregister(optee->teedev);
>
>         tee_shm_pool_free(optee->pool);
> +       if (optee->sdp_pool)
> +               optee->sdp_pool->ops->destroy_pool(optee->sdp_pool);
>         optee_supp_uninit(&optee->supp);
>         mutex_destroy(&optee->call_queue.mutex);
>  }
> diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_private.h
> index 424898cdc4e9..1f6b2cc992a9 100644
> --- a/drivers/tee/optee/optee_private.h
> +++ b/drivers/tee/optee/optee_private.h
> @@ -200,6 +200,7 @@ struct optee_ops {
>   * @notif:             notification synchronization struct
>   * @supp:              supplicant synchronization struct for RPC to supplicant
>   * @pool:              shared memory pool
> + * @sdp_pool:          restricted memory pool for secure data path
>   * @rpc_param_count:   If > 0 number of RPC parameters to make room for
>   * @scan_bus_done      flag if device registation was already done.
>   * @scan_bus_work      workq to scan optee bus and register optee drivers
> @@ -218,6 +219,7 @@ struct optee {
>         struct optee_notif notif;
>         struct optee_supp supp;
>         struct tee_shm_pool *pool;
> +       struct tee_shm_pool *sdp_pool;
>         unsigned int rpc_param_count;
>         bool   scan_bus_done;
>         struct work_struct scan_bus_work;
> @@ -340,6 +342,10 @@ void optee_rpc_cmd(struct tee_context *ctx, struct optee *optee,
>  int optee_do_bottom_half(struct tee_context *ctx);
>  int optee_stop_async_notif(struct tee_context *ctx);
>
> +int optee_rstmem_alloc(struct tee_context *ctx, struct tee_shm *shm,
> +                      u32 flags, size_t size);
> +void optee_rstmem_free(struct tee_context *ctx, struct tee_shm *shm);
> +
>  /*
>   * Small helpers
>   */
> diff --git a/drivers/tee/optee/optee_smc.h b/drivers/tee/optee/optee_smc.h
> index 7d9fa426505b..c3b8a1c204af 100644
> --- a/drivers/tee/optee/optee_smc.h
> +++ b/drivers/tee/optee/optee_smc.h
> @@ -234,6 +234,39 @@ struct optee_smc_get_shm_config_result {
>         unsigned long settings;
>  };
>
> +/*
> + * Get Secure Data Path memory config
> + *
> + * Returns the Secure Data Path memory config.
> + *
> + * Call register usage:
> + * a0   SMC Function ID, OPTEE_SMC_GET_SDP_CONFIG
> + * a2-6 Not used, must be zero
> + * a7   Hypervisor Client ID register
> + *
> + * Have config return register usage:
> + * a0   OPTEE_SMC_RETURN_OK
> + * a1   Physical address of start of SDP memory
> + * a2   Size of SDP memory
> + * a3   Not used
> + * a4-7 Preserved
> + *
> + * Not available register usage:
> + * a0   OPTEE_SMC_RETURN_ENOTAVAIL
> + * a1-3 Not used
> + * a4-7 Preserved
> + */
> +#define OPTEE_SMC_FUNCID_GET_SDP_CONFIG        20
> +#define OPTEE_SMC_GET_SDP_CONFIG \
> +       OPTEE_SMC_FAST_CALL_VAL(OPTEE_SMC_FUNCID_GET_SDP_CONFIG)
> +
> +struct optee_smc_get_sdp_config_result {
> +       unsigned long status;
> +       unsigned long start;
> +       unsigned long size;
> +       unsigned long flags;
> +};
> +
>  /*
>   * Exchanges capabilities between normal world and secure world
>   *
> @@ -278,6 +311,8 @@ struct optee_smc_get_shm_config_result {
>  #define OPTEE_SMC_SEC_CAP_ASYNC_NOTIF          BIT(5)
>  /* Secure world supports pre-allocating RPC arg struct */
>  #define OPTEE_SMC_SEC_CAP_RPC_ARG              BIT(6)
> +/* Secure world supports Secure Data Path */
> +#define OPTEE_SMC_SEC_CAP_SDP                  BIT(7)
>
>  #define OPTEE_SMC_FUNCID_EXCHANGE_CAPABILITIES 9
>  #define OPTEE_SMC_EXCHANGE_CAPABILITIES \
> diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
> index 844285d4f03c..05068c70c791 100644
> --- a/drivers/tee/optee/smc_abi.c
> +++ b/drivers/tee/optee/smc_abi.c
> @@ -1164,6 +1164,8 @@ static void optee_get_version(struct tee_device *teedev,
>                 v.gen_caps |= TEE_GEN_CAP_REG_MEM;
>         if (optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_MEMREF_NULL)
>                 v.gen_caps |= TEE_GEN_CAP_MEMREF_NULL;
> +       if (optee->sdp_pool)
> +               v.gen_caps |= TEE_GEN_CAP_RSTMEM;
>         *vers = v;
>  }
>
> @@ -1186,6 +1188,8 @@ static const struct tee_driver_ops optee_clnt_ops = {
>         .cancel_req = optee_cancel_req,
>         .shm_register = optee_shm_register,
>         .shm_unregister = optee_shm_unregister,
> +       .rstmem_alloc = optee_rstmem_alloc,
> +       .rstmem_free = optee_rstmem_free,
>  };
>
>  static const struct tee_desc optee_clnt_desc = {
> @@ -1202,6 +1206,8 @@ static const struct tee_driver_ops optee_supp_ops = {
>         .supp_send = optee_supp_send,
>         .shm_register = optee_shm_register_supp,
>         .shm_unregister = optee_shm_unregister_supp,
> +       .rstmem_alloc = optee_rstmem_alloc,
> +       .rstmem_free = optee_rstmem_free,
>  };
>
>  static const struct tee_desc optee_supp_desc = {
> @@ -1582,6 +1588,32 @@ static inline int optee_load_fw(struct platform_device *pdev,
>  }
>  #endif
>
> +static int optee_sdp_pool_init(struct optee *optee)
> +{
> +       struct tee_shm_pool *pool;
> +       union {
> +               struct arm_smccc_res smccc;
> +               struct optee_smc_get_sdp_config_result result;
> +       } res;
> +
> +       if (!(optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_SDP))
> +               return 0;
> +
> +       optee->smc.invoke_fn(OPTEE_SMC_GET_SDP_CONFIG, 0, 0, 0, 0, 0, 0, 0,
> +                            &res.smccc);

IMHO, to put more weight on this proposal we should also include
allocation from the kernel CMA pool alongside the reserved restricted
memory pool. The implementation would be quite similar to how we
support dynamic SHM based on platform specific capability:
OPTEE_SMC_SEC_CAP_DYNAMIC_SHM. We can have a similar capability for
dynamic restricted memory as: OPTEE_SMC_SEC_CAP_DYNAMIC_RSTMEM.

The major reason to support it is to allow mediatek use-case [1] of
restricting memory dynamically which gets allocated from the CMA pool.
Although, it won't be something that we can test on Qemu from a
hardware enforcement perspective, at least we can test it on Qemu
conceptually. Thoughts?

[1] https://lore.kernel.org/linux-arm-kernel/20240515112308.10171-9-yong.wu@mediatek.com/

-Sumit

> +       if (res.result.status != OPTEE_SMC_RETURN_OK) {
> +               pr_err("Secure Data Path service not available\n");
> +               return 0;
> +       }
> +
> +       pool = tee_rstmem_gen_pool_alloc(res.result.start, res.result.size);
> +       if (IS_ERR(pool))
> +               return PTR_ERR(pool);
> +       optee->sdp_pool = pool;
> +
> +       return 0;
> +}
> +
>  static int optee_probe(struct platform_device *pdev)
>  {
>         optee_invoke_fn *invoke_fn;
> @@ -1677,7 +1709,7 @@ static int optee_probe(struct platform_device *pdev)
>         optee = kzalloc(sizeof(*optee), GFP_KERNEL);
>         if (!optee) {
>                 rc = -ENOMEM;
> -               goto err_free_pool;
> +               goto err_free_shm_pool;
>         }
>
>         optee->ops = &optee_ops;
> @@ -1685,10 +1717,14 @@ static int optee_probe(struct platform_device *pdev)
>         optee->smc.sec_caps = sec_caps;
>         optee->rpc_param_count = rpc_param_count;
>
> +       rc = optee_sdp_pool_init(optee);
> +       if (rc)
> +               goto err_free_optee;
> +
>         teedev = tee_device_alloc(&optee_clnt_desc, NULL, pool, optee);
>         if (IS_ERR(teedev)) {
>                 rc = PTR_ERR(teedev);
> -               goto err_free_optee;
> +               goto err_sdp_pool_uninit;
>         }
>         optee->teedev = teedev;
>
> @@ -1786,9 +1822,12 @@ static int optee_probe(struct platform_device *pdev)
>         tee_device_unregister(optee->supp_teedev);
>  err_unreg_teedev:
>         tee_device_unregister(optee->teedev);
> +err_sdp_pool_uninit:
> +       if (optee->sdp_pool)
> +               optee->sdp_pool->ops->destroy_pool(optee->sdp_pool);
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
