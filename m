Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0889E15A9
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 09:27:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE93210E953;
	Tue,  3 Dec 2024 08:27:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ncGxhiIX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
 [209.85.217.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA53910E953
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 08:27:22 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id
 ada2fe7eead31-4af408f48ceso1562844137.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2024 00:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733214442; x=1733819242; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Xg+F5KKw2r0vQLOAe4QkycJMBq/a07Abzd6JRFG4e9A=;
 b=ncGxhiIXof4FBSqvN8VbmgQUEodXmR0DZUnKOIWQqf6cWktkX9gk5s8CDPnPIm94fF
 jWHWAzE8Bb4N7LIZmHbBzpTfHZmBtPl3OVqobVqy4qYqsqTR0B5VRvgOWYeSVKAYDhjG
 M/DZZvxQI8xzwCQkI2PDQxmBFZIj4t56si7/8TZDcZwCX0EJSzB+vc5jaY0Zs2VNBOj5
 8Aqv9042lLslyeCvJ82SFXGT6nYhR7aV1Md86jpKhn4Tvlrq8dE250vNZh8GD6quHe3B
 vJU6dQRKhn0y2A2EKyHe8ZHjeXMgyB1PGRiM6t92qn24QAIadW0yAOixiUBRMVs2spjx
 nFIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733214442; x=1733819242;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xg+F5KKw2r0vQLOAe4QkycJMBq/a07Abzd6JRFG4e9A=;
 b=qEaYLJdtiQ3ybfYU6CU19Dqi8fyltFjcfo3aZqjNuQFU1Vc8wJ1TAXewBM/w4dRFhN
 GeVKMkb7/EMWBTk6eJYfldZCeJc9TEwPBfGnE3ffM+onQ8hEvyirCaTwuTk42bBfb7Ty
 ctb3zc/eBSZj1h7kh5E2l2L5ef6SMiEgIuiKAdsDOHn74JPIp3jKy7Dgq/u9sg4O3FB3
 P8Zc/T5WJMNE7KzWLEbZxK3X4iZF5abpes38tenAny/reSfT9lyFuZSNZMYrilMVWKuK
 58HEpo805jpQfFN87to7UNMcLEF/uG7krJuZXuVqHtRb4P7YffEfcHgrJi7mWdbM0QPa
 M+gg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWB0ZwAeTiFGm7vkvGZElvZPbGqnwOBO8mjyFkMFXyyx0cs8VbglS8ai5NkgcLTeF+BAvG2sQ9Y/CM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz3zxmFb7J19V83UahP5XIfV7rmYBWPpSQKK6xxPkuBrG50uhDa
 pE8/tVL8hSt7rS7a4+JLARisZbL7eX0+Vkvly/H7BxKts/U6msvM9WvfqA6U43gYSudeIQFjqbQ
 TCkRJmYthkoKw/WIsVohfi3jKlmpiSqUvqGGqJg==
X-Gm-Gg: ASbGncuYKawtIwigrUA4DwuHHUsXkn29wSxMZJg5LXnFBkuMXcOL+pvIWhlt6yO2k95
 yf/Tu5l+/2eqWO0S2Dm5OOKrM+HSD2a5Q1Q==
X-Google-Smtp-Source: AGHT+IGaTN/p8BULgFdyOAJGuWzvkuLZQWmA9o3EM8C85tJ7kIMh9XKXlTdWPk7y0YLXtY2NHUh28nknRnSVJahtofg=
X-Received: by 2002:a05:6102:d87:b0:4af:58f7:15ed with SMTP id
 ada2fe7eead31-4af971838d3mr2334917137.1.1733214441776; Tue, 03 Dec 2024
 00:27:21 -0800 (PST)
MIME-Version: 1.0
References: <20241128150927.1377981-1-jens.wiklander@linaro.org>
 <20241128150927.1377981-3-jens.wiklander@linaro.org>
In-Reply-To: <20241128150927.1377981-3-jens.wiklander@linaro.org>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 3 Dec 2024 13:57:10 +0530
Message-ID: <CAFA6WYPEqCWyvD=pCj6DEkZWN9SCfXMnq4tKbSx1-e8UmgXb=Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] optee: account for direction while converting
 parameters
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
> The OP-TEE backend driver has two internal function pointers to convert
> between the subsystem type struct tee_param and the OP-TEE type struct
> optee_msg_param.
>
> The conversion is done from one of the types to the other, which is then
> involved in some operation and finally converted back to the original
> type. When converting to prepare the parameters for the operation, all
> fields must be taken into account, but then converting back, it's enough
> to update only out-values and out-sizes. So, an update_out parameter is
> added to the conversion functions to tell if all or only some fields
> must be copied.

Is this patch just a refactoring of TEE params handling? Or are we
fixing a real ABI issue here? Also, is this required for restricted
shared memory support to work? Just asking if we want to consider it
as a fix for backporting or if we can handle this refactoring patch
independently of this series?

-Sumit

>
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  drivers/tee/optee/call.c          | 10 ++--
>  drivers/tee/optee/ffa_abi.c       | 43 +++++++++++++----
>  drivers/tee/optee/optee_private.h | 42 +++++++++++------
>  drivers/tee/optee/rpc.c           | 31 +++++++++----
>  drivers/tee/optee/smc_abi.c       | 76 +++++++++++++++++++++++--------
>  5 files changed, 144 insertions(+), 58 deletions(-)
>
> diff --git a/drivers/tee/optee/call.c b/drivers/tee/optee/call.c
> index 16eb953e14bb..f1533b894726 100644
> --- a/drivers/tee/optee/call.c
> +++ b/drivers/tee/optee/call.c
> @@ -400,7 +400,8 @@ int optee_open_session(struct tee_context *ctx,
>         export_uuid(msg_arg->params[1].u.octets, &client_uuid);
>
>         rc = optee->ops->to_msg_param(optee, msg_arg->params + 2,
> -                                     arg->num_params, param);
> +                                     arg->num_params, param,
> +                                     false /*!update_out*/);
>         if (rc)
>                 goto out;
>
> @@ -427,7 +428,8 @@ int optee_open_session(struct tee_context *ctx,
>         }
>
>         if (optee->ops->from_msg_param(optee, param, arg->num_params,
> -                                      msg_arg->params + 2)) {
> +                                      msg_arg->params + 2,
> +                                      true /*update_out*/)) {
>                 arg->ret = TEEC_ERROR_COMMUNICATION;
>                 arg->ret_origin = TEEC_ORIGIN_COMMS;
>                 /* Close session again to avoid leakage */
> @@ -541,7 +543,7 @@ int optee_invoke_func(struct tee_context *ctx, struct tee_ioctl_invoke_arg *arg,
>         msg_arg->cancel_id = arg->cancel_id;
>
>         rc = optee->ops->to_msg_param(optee, msg_arg->params, arg->num_params,
> -                                     param);
> +                                     param, false /*!update_out*/);
>         if (rc)
>                 goto out;
>
> @@ -551,7 +553,7 @@ int optee_invoke_func(struct tee_context *ctx, struct tee_ioctl_invoke_arg *arg,
>         }
>
>         if (optee->ops->from_msg_param(optee, param, arg->num_params,
> -                                      msg_arg->params)) {
> +                                      msg_arg->params, true /*update_out*/)) {
>                 msg_arg->ret = TEEC_ERROR_COMMUNICATION;
>                 msg_arg->ret_origin = TEEC_ORIGIN_COMMS;
>         }
> diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_abi.c
> index f3af5666bb11..02e6175ac5f0 100644
> --- a/drivers/tee/optee/ffa_abi.c
> +++ b/drivers/tee/optee/ffa_abi.c
> @@ -122,15 +122,21 @@ static int optee_shm_rem_ffa_handle(struct optee *optee, u64 global_id)
>   */
>
>  static void from_msg_param_ffa_mem(struct optee *optee, struct tee_param *p,
> -                                  u32 attr, const struct optee_msg_param *mp)
> +                                  u32 attr, const struct optee_msg_param *mp,
> +                                  bool update_out)
>  {
>         struct tee_shm *shm = NULL;
>         u64 offs_high = 0;
>         u64 offs_low = 0;
>
> +       if (update_out) {
> +               if (attr == OPTEE_MSG_ATTR_TYPE_FMEM_INPUT)
> +                       return;
> +               goto out;
> +       }
> +
>         p->attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT +
>                   attr - OPTEE_MSG_ATTR_TYPE_FMEM_INPUT;
> -       p->u.memref.size = mp->u.fmem.size;
>
>         if (mp->u.fmem.global_id != OPTEE_MSG_FMEM_INVALID_GLOBAL_ID)
>                 shm = optee_shm_from_ffa_handle(optee, mp->u.fmem.global_id);
> @@ -141,6 +147,8 @@ static void from_msg_param_ffa_mem(struct optee *optee, struct tee_param *p,
>                 offs_high = mp->u.fmem.offs_high;
>         }
>         p->u.memref.shm_offs = offs_low | offs_high << 32;
> +out:
> +       p->u.memref.size = mp->u.fmem.size;
>  }
>
>  /**
> @@ -150,12 +158,14 @@ static void from_msg_param_ffa_mem(struct optee *optee, struct tee_param *p,
>   * @params:    subsystem internal parameter representation
>   * @num_params:        number of elements in the parameter arrays
>   * @msg_params:        OPTEE_MSG parameters
> + * @update_out: update parameter for output only
>   *
>   * Returns 0 on success or <0 on failure
>   */
>  static int optee_ffa_from_msg_param(struct optee *optee,
>                                     struct tee_param *params, size_t num_params,
> -                                   const struct optee_msg_param *msg_params)
> +                                   const struct optee_msg_param *msg_params,
> +                                   bool update_out)
>  {
>         size_t n;
>
> @@ -166,18 +176,20 @@ static int optee_ffa_from_msg_param(struct optee *optee,
>
>                 switch (attr) {
>                 case OPTEE_MSG_ATTR_TYPE_NONE:
> +                       if (update_out)
> +                               break;
>                         p->attr = TEE_IOCTL_PARAM_ATTR_TYPE_NONE;
>                         memset(&p->u, 0, sizeof(p->u));
>                         break;
>                 case OPTEE_MSG_ATTR_TYPE_VALUE_INPUT:
>                 case OPTEE_MSG_ATTR_TYPE_VALUE_OUTPUT:
>                 case OPTEE_MSG_ATTR_TYPE_VALUE_INOUT:
> -                       optee_from_msg_param_value(p, attr, mp);
> +                       optee_from_msg_param_value(p, attr, mp, update_out);
>                         break;
>                 case OPTEE_MSG_ATTR_TYPE_FMEM_INPUT:
>                 case OPTEE_MSG_ATTR_TYPE_FMEM_OUTPUT:
>                 case OPTEE_MSG_ATTR_TYPE_FMEM_INOUT:
> -                       from_msg_param_ffa_mem(optee, p, attr, mp);
> +                       from_msg_param_ffa_mem(optee, p, attr, mp, update_out);
>                         break;
>                 default:
>                         return -EINVAL;
> @@ -188,10 +200,16 @@ static int optee_ffa_from_msg_param(struct optee *optee,
>  }
>
>  static int to_msg_param_ffa_mem(struct optee_msg_param *mp,
> -                               const struct tee_param *p)
> +                               const struct tee_param *p, bool update_out)
>  {
>         struct tee_shm *shm = p->u.memref.shm;
>
> +       if (update_out) {
> +               if (p->attr == TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT)
> +                       return 0;
> +               goto out;
> +       }
> +
>         mp->attr = OPTEE_MSG_ATTR_TYPE_FMEM_INPUT + p->attr -
>                    TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT;
>
> @@ -211,6 +229,7 @@ static int to_msg_param_ffa_mem(struct optee_msg_param *mp,
>                 memset(&mp->u, 0, sizeof(mp->u));
>                 mp->u.fmem.global_id = OPTEE_MSG_FMEM_INVALID_GLOBAL_ID;
>         }
> +out:
>         mp->u.fmem.size = p->u.memref.size;
>
>         return 0;
> @@ -222,13 +241,15 @@ static int to_msg_param_ffa_mem(struct optee_msg_param *mp,
>   * @optee:     main service struct
>   * @msg_params:        OPTEE_MSG parameters
>   * @num_params:        number of elements in the parameter arrays
> - * @params:    subsystem itnernal parameter representation
> + * @params:    subsystem internal parameter representation
> + * @update_out: update parameter for output only
>   * Returns 0 on success or <0 on failure
>   */
>  static int optee_ffa_to_msg_param(struct optee *optee,
>                                   struct optee_msg_param *msg_params,
>                                   size_t num_params,
> -                                 const struct tee_param *params)
> +                                 const struct tee_param *params,
> +                                 bool update_out)
>  {
>         size_t n;
>
> @@ -238,18 +259,20 @@ static int optee_ffa_to_msg_param(struct optee *optee,
>
>                 switch (p->attr) {
>                 case TEE_IOCTL_PARAM_ATTR_TYPE_NONE:
> +                       if (update_out)
> +                               break;
>                         mp->attr = TEE_IOCTL_PARAM_ATTR_TYPE_NONE;
>                         memset(&mp->u, 0, sizeof(mp->u));
>                         break;
>                 case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT:
>                 case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT:
>                 case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT:
> -                       optee_to_msg_param_value(mp, p);
> +                       optee_to_msg_param_value(mp, p, update_out);
>                         break;
>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
> -                       if (to_msg_param_ffa_mem(mp, p))
> +                       if (to_msg_param_ffa_mem(mp, p, update_out))
>                                 return -EINVAL;
>                         break;
>                 default:
> diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_private.h
> index dc0f355ef72a..20eda508dbac 100644
> --- a/drivers/tee/optee/optee_private.h
> +++ b/drivers/tee/optee/optee_private.h
> @@ -185,10 +185,12 @@ struct optee_ops {
>                                 bool system_thread);
>         int (*to_msg_param)(struct optee *optee,
>                             struct optee_msg_param *msg_params,
> -                           size_t num_params, const struct tee_param *params);
> +                           size_t num_params, const struct tee_param *params,
> +                           bool update_out);
>         int (*from_msg_param)(struct optee *optee, struct tee_param *params,
>                               size_t num_params,
> -                             const struct optee_msg_param *msg_params);
> +                             const struct optee_msg_param *msg_params,
> +                             bool update_out);
>  };
>
>  /**
> @@ -316,23 +318,35 @@ void optee_release(struct tee_context *ctx);
>  void optee_release_supp(struct tee_context *ctx);
>
>  static inline void optee_from_msg_param_value(struct tee_param *p, u32 attr,
> -                                             const struct optee_msg_param *mp)
> +                                             const struct optee_msg_param *mp,
> +                                             bool update_out)
>  {
> -       p->attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT +
> -                 attr - OPTEE_MSG_ATTR_TYPE_VALUE_INPUT;
> -       p->u.value.a = mp->u.value.a;
> -       p->u.value.b = mp->u.value.b;
> -       p->u.value.c = mp->u.value.c;
> +       if (!update_out)
> +               p->attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT +
> +                         attr - OPTEE_MSG_ATTR_TYPE_VALUE_INPUT;
> +
> +       if (attr == OPTEE_MSG_ATTR_TYPE_VALUE_OUTPUT ||
> +           attr == OPTEE_MSG_ATTR_TYPE_VALUE_INOUT || !update_out) {
> +               p->u.value.a = mp->u.value.a;
> +               p->u.value.b = mp->u.value.b;
> +               p->u.value.c = mp->u.value.c;
> +       }
>  }
>
>  static inline void optee_to_msg_param_value(struct optee_msg_param *mp,
> -                                           const struct tee_param *p)
> +                                           const struct tee_param *p,
> +                                           bool update_out)
>  {
> -       mp->attr = OPTEE_MSG_ATTR_TYPE_VALUE_INPUT + p->attr -
> -                  TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
> -       mp->u.value.a = p->u.value.a;
> -       mp->u.value.b = p->u.value.b;
> -       mp->u.value.c = p->u.value.c;
> +       if (!update_out)
> +               mp->attr = OPTEE_MSG_ATTR_TYPE_VALUE_INPUT + p->attr -
> +                          TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
> +
> +       if (p->attr == TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT ||
> +           p->attr == TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT || !update_out) {
> +               mp->u.value.a = p->u.value.a;
> +               mp->u.value.b = p->u.value.b;
> +               mp->u.value.c = p->u.value.c;
> +       }
>  }
>
>  void optee_cq_init(struct optee_call_queue *cq, int thread_count);
> diff --git a/drivers/tee/optee/rpc.c b/drivers/tee/optee/rpc.c
> index ebbbd42b0e3e..580e6b9b0606 100644
> --- a/drivers/tee/optee/rpc.c
> +++ b/drivers/tee/optee/rpc.c
> @@ -63,7 +63,7 @@ static void handle_rpc_func_cmd_i2c_transfer(struct tee_context *ctx,
>         }
>
>         if (optee->ops->from_msg_param(optee, params, arg->num_params,
> -                                      arg->params))
> +                                      arg->params, false /*!update_out*/))
>                 goto bad;
>
>         for (i = 0; i < arg->num_params; i++) {
> @@ -107,7 +107,8 @@ static void handle_rpc_func_cmd_i2c_transfer(struct tee_context *ctx,
>         } else {
>                 params[3].u.value.a = msg.len;
>                 if (optee->ops->to_msg_param(optee, arg->params,
> -                                            arg->num_params, params))
> +                                            arg->num_params, params,
> +                                            true /*update_out*/))
>                         arg->ret = TEEC_ERROR_BAD_PARAMETERS;
>                 else
>                         arg->ret = TEEC_SUCCESS;
> @@ -188,6 +189,7 @@ static void handle_rpc_func_cmd_wait(struct optee_msg_arg *arg)
>  static void handle_rpc_supp_cmd(struct tee_context *ctx, struct optee *optee,
>                                 struct optee_msg_arg *arg)
>  {
> +       bool update_out = false;
>         struct tee_param *params;
>
>         arg->ret_origin = TEEC_ORIGIN_COMMS;
> @@ -200,15 +202,21 @@ static void handle_rpc_supp_cmd(struct tee_context *ctx, struct optee *optee,
>         }
>
>         if (optee->ops->from_msg_param(optee, params, arg->num_params,
> -                                      arg->params)) {
> +                                      arg->params, update_out)) {
>                 arg->ret = TEEC_ERROR_BAD_PARAMETERS;
>                 goto out;
>         }
>
>         arg->ret = optee_supp_thrd_req(ctx, arg->cmd, arg->num_params, params);
>
> +       /*
> +        * Special treatment for OPTEE_RPC_CMD_SHM_ALLOC since input is a
> +        * value type, but the output is a memref type.
> +        */
> +       if (arg->cmd != OPTEE_RPC_CMD_SHM_ALLOC)
> +               update_out = true;
>         if (optee->ops->to_msg_param(optee, arg->params, arg->num_params,
> -                                    params))
> +                                    params, update_out))
>                 arg->ret = TEEC_ERROR_BAD_PARAMETERS;
>  out:
>         kfree(params);
> @@ -270,7 +278,7 @@ static void handle_rpc_func_rpmb_probe_reset(struct tee_context *ctx,
>
>         if (arg->num_params != ARRAY_SIZE(params) ||
>             optee->ops->from_msg_param(optee, params, arg->num_params,
> -                                      arg->params) ||
> +                                      arg->params, false /*!update_out*/) ||
>             params[0].attr != TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT) {
>                 arg->ret = TEEC_ERROR_BAD_PARAMETERS;
>                 return;
> @@ -280,7 +288,8 @@ static void handle_rpc_func_rpmb_probe_reset(struct tee_context *ctx,
>         params[0].u.value.b = 0;
>         params[0].u.value.c = 0;
>         if (optee->ops->to_msg_param(optee, arg->params,
> -                                    arg->num_params, params)) {
> +                                    arg->num_params, params,
> +                                    true /*update_out*/)) {
>                 arg->ret = TEEC_ERROR_BAD_PARAMETERS;
>                 return;
>         }
> @@ -324,7 +333,7 @@ static void handle_rpc_func_rpmb_probe_next(struct tee_context *ctx,
>
>         if (arg->num_params != ARRAY_SIZE(params) ||
>             optee->ops->from_msg_param(optee, params, arg->num_params,
> -                                      arg->params) ||
> +                                      arg->params, false /*!update_out*/) ||
>             params[0].attr != TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT ||
>             params[1].attr != TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT) {
>                 arg->ret = TEEC_ERROR_BAD_PARAMETERS;
> @@ -358,7 +367,8 @@ static void handle_rpc_func_rpmb_probe_next(struct tee_context *ctx,
>         params[0].u.value.b = rdev->descr.capacity;
>         params[0].u.value.c = rdev->descr.reliable_wr_count;
>         if (optee->ops->to_msg_param(optee, arg->params,
> -                                    arg->num_params, params)) {
> +                                    arg->num_params, params,
> +                                    true /*update_out*/)) {
>                 arg->ret = TEEC_ERROR_BAD_PARAMETERS;
>                 return;
>         }
> @@ -384,7 +394,7 @@ static void handle_rpc_func_rpmb_frames(struct tee_context *ctx,
>
>         if (arg->num_params != ARRAY_SIZE(params) ||
>             optee->ops->from_msg_param(optee, params, arg->num_params,
> -                                      arg->params) ||
> +                                      arg->params, false /*!update_out*/) ||
>             params[0].attr != TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT ||
>             params[1].attr != TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT) {
>                 arg->ret = TEEC_ERROR_BAD_PARAMETERS;
> @@ -401,7 +411,8 @@ static void handle_rpc_func_rpmb_frames(struct tee_context *ctx,
>                 goto out;
>         }
>         if (optee->ops->to_msg_param(optee, arg->params,
> -                                    arg->num_params, params)) {
> +                                    arg->num_params, params,
> +                                    true /*update_out*/)) {
>                 arg->ret = TEEC_ERROR_BAD_PARAMETERS;
>                 goto out;
>         }
> diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
> index e9456e3e74cc..d1f79947f58a 100644
> --- a/drivers/tee/optee/smc_abi.c
> +++ b/drivers/tee/optee/smc_abi.c
> @@ -81,20 +81,26 @@ static int optee_cpuhp_disable_pcpu_irq(unsigned int cpu)
>   */
>
>  static int from_msg_param_tmp_mem(struct tee_param *p, u32 attr,
> -                                 const struct optee_msg_param *mp)
> +                                 const struct optee_msg_param *mp,
> +                                 bool update_out)
>  {
>         struct tee_shm *shm;
>         phys_addr_t pa;
>         int rc;
>
> +       if (update_out) {
> +               if (attr == OPTEE_MSG_ATTR_TYPE_TMEM_INPUT)
> +                       return 0;
> +               goto out;
> +       }
> +
>         p->attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT +
>                   attr - OPTEE_MSG_ATTR_TYPE_TMEM_INPUT;
> -       p->u.memref.size = mp->u.tmem.size;
>         shm = (struct tee_shm *)(unsigned long)mp->u.tmem.shm_ref;
>         if (!shm) {
>                 p->u.memref.shm_offs = 0;
>                 p->u.memref.shm = NULL;
> -               return 0;
> +               goto out;
>         }
>
>         rc = tee_shm_get_pa(shm, 0, &pa);
> @@ -103,18 +109,25 @@ static int from_msg_param_tmp_mem(struct tee_param *p, u32 attr,
>
>         p->u.memref.shm_offs = mp->u.tmem.buf_ptr - pa;
>         p->u.memref.shm = shm;
> -
> +out:
> +       p->u.memref.size = mp->u.tmem.size;
>         return 0;
>  }
>
>  static void from_msg_param_reg_mem(struct tee_param *p, u32 attr,
> -                                  const struct optee_msg_param *mp)
> +                                  const struct optee_msg_param *mp,
> +                                  bool update_out)
>  {
>         struct tee_shm *shm;
>
> +       if (update_out) {
> +               if (attr == OPTEE_MSG_ATTR_TYPE_RMEM_INPUT)
> +                       return;
> +               goto out;
> +       }
> +
>         p->attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT +
>                   attr - OPTEE_MSG_ATTR_TYPE_RMEM_INPUT;
> -       p->u.memref.size = mp->u.rmem.size;
>         shm = (struct tee_shm *)(unsigned long)mp->u.rmem.shm_ref;
>
>         if (shm) {
> @@ -124,6 +137,8 @@ static void from_msg_param_reg_mem(struct tee_param *p, u32 attr,
>                 p->u.memref.shm_offs = 0;
>                 p->u.memref.shm = NULL;
>         }
> +out:
> +       p->u.memref.size = mp->u.rmem.size;
>  }
>
>  /**
> @@ -133,11 +148,13 @@ static void from_msg_param_reg_mem(struct tee_param *p, u32 attr,
>   * @params:    subsystem internal parameter representation
>   * @num_params:        number of elements in the parameter arrays
>   * @msg_params:        OPTEE_MSG parameters
> + * @update_out:        update parameter for output only
>   * Returns 0 on success or <0 on failure
>   */
>  static int optee_from_msg_param(struct optee *optee, struct tee_param *params,
>                                 size_t num_params,
> -                               const struct optee_msg_param *msg_params)
> +                               const struct optee_msg_param *msg_params,
> +                               bool update_out)
>  {
>         int rc;
>         size_t n;
> @@ -149,25 +166,27 @@ static int optee_from_msg_param(struct optee *optee, struct tee_param *params,
>
>                 switch (attr) {
>                 case OPTEE_MSG_ATTR_TYPE_NONE:
> +                       if (update_out)
> +                               break;
>                         p->attr = TEE_IOCTL_PARAM_ATTR_TYPE_NONE;
>                         memset(&p->u, 0, sizeof(p->u));
>                         break;
>                 case OPTEE_MSG_ATTR_TYPE_VALUE_INPUT:
>                 case OPTEE_MSG_ATTR_TYPE_VALUE_OUTPUT:
>                 case OPTEE_MSG_ATTR_TYPE_VALUE_INOUT:
> -                       optee_from_msg_param_value(p, attr, mp);
> +                       optee_from_msg_param_value(p, attr, mp, update_out);
>                         break;
>                 case OPTEE_MSG_ATTR_TYPE_TMEM_INPUT:
>                 case OPTEE_MSG_ATTR_TYPE_TMEM_OUTPUT:
>                 case OPTEE_MSG_ATTR_TYPE_TMEM_INOUT:
> -                       rc = from_msg_param_tmp_mem(p, attr, mp);
> +                       rc = from_msg_param_tmp_mem(p, attr, mp, update_out);
>                         if (rc)
>                                 return rc;
>                         break;
>                 case OPTEE_MSG_ATTR_TYPE_RMEM_INPUT:
>                 case OPTEE_MSG_ATTR_TYPE_RMEM_OUTPUT:
>                 case OPTEE_MSG_ATTR_TYPE_RMEM_INOUT:
> -                       from_msg_param_reg_mem(p, attr, mp);
> +                       from_msg_param_reg_mem(p, attr, mp, update_out);
>                         break;
>
>                 default:
> @@ -178,20 +197,25 @@ static int optee_from_msg_param(struct optee *optee, struct tee_param *params,
>  }
>
>  static int to_msg_param_tmp_mem(struct optee_msg_param *mp,
> -                               const struct tee_param *p)
> +                               const struct tee_param *p, bool update_out)
>  {
>         int rc;
>         phys_addr_t pa;
>
> +       if (update_out) {
> +               if (p->attr == TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT)
> +                       return 0;
> +               goto out;
> +       }
> +
>         mp->attr = OPTEE_MSG_ATTR_TYPE_TMEM_INPUT + p->attr -
>                    TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT;
>
>         mp->u.tmem.shm_ref = (unsigned long)p->u.memref.shm;
> -       mp->u.tmem.size = p->u.memref.size;
>
>         if (!p->u.memref.shm) {
>                 mp->u.tmem.buf_ptr = 0;
> -               return 0;
> +               goto out;
>         }
>
>         rc = tee_shm_get_pa(p->u.memref.shm, p->u.memref.shm_offs, &pa);
> @@ -201,19 +225,27 @@ static int to_msg_param_tmp_mem(struct optee_msg_param *mp,
>         mp->u.tmem.buf_ptr = pa;
>         mp->attr |= OPTEE_MSG_ATTR_CACHE_PREDEFINED <<
>                     OPTEE_MSG_ATTR_CACHE_SHIFT;
> -
> +out:
> +       mp->u.tmem.size = p->u.memref.size;
>         return 0;
>  }
>
>  static int to_msg_param_reg_mem(struct optee_msg_param *mp,
> -                               const struct tee_param *p)
> +                               const struct tee_param *p, bool update_out)
>  {
> +       if (update_out) {
> +               if (p->attr == TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT)
> +                       return 0;
> +               goto out;
> +       }
> +
>         mp->attr = OPTEE_MSG_ATTR_TYPE_RMEM_INPUT + p->attr -
>                    TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT;
>
>         mp->u.rmem.shm_ref = (unsigned long)p->u.memref.shm;
> -       mp->u.rmem.size = p->u.memref.size;
>         mp->u.rmem.offs = p->u.memref.shm_offs;
> +out:
> +       mp->u.rmem.size = p->u.memref.size;
>         return 0;
>  }
>
> @@ -223,11 +255,13 @@ static int to_msg_param_reg_mem(struct optee_msg_param *mp,
>   * @msg_params:        OPTEE_MSG parameters
>   * @num_params:        number of elements in the parameter arrays
>   * @params:    subsystem itnernal parameter representation
> + * @update_out:        update parameter for output only
>   * Returns 0 on success or <0 on failure
>   */
>  static int optee_to_msg_param(struct optee *optee,
>                               struct optee_msg_param *msg_params,
> -                             size_t num_params, const struct tee_param *params)
> +                             size_t num_params, const struct tee_param *params,
> +                             bool update_out)
>  {
>         int rc;
>         size_t n;
> @@ -238,21 +272,23 @@ static int optee_to_msg_param(struct optee *optee,
>
>                 switch (p->attr) {
>                 case TEE_IOCTL_PARAM_ATTR_TYPE_NONE:
> +                       if (update_out)
> +                               break;
>                         mp->attr = TEE_IOCTL_PARAM_ATTR_TYPE_NONE;
>                         memset(&mp->u, 0, sizeof(mp->u));
>                         break;
>                 case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT:
>                 case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT:
>                 case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT:
> -                       optee_to_msg_param_value(mp, p);
> +                       optee_to_msg_param_value(mp, p, update_out);
>                         break;
>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
>                         if (tee_shm_is_dynamic(p->u.memref.shm))
> -                               rc = to_msg_param_reg_mem(mp, p);
> +                               rc = to_msg_param_reg_mem(mp, p, update_out);
>                         else
> -                               rc = to_msg_param_tmp_mem(mp, p);
> +                               rc = to_msg_param_tmp_mem(mp, p, update_out);
>                         if (rc)
>                                 return rc;
>                         break;
> --
> 2.43.0
>
