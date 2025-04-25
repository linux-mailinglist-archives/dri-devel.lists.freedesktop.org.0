Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D92AA9CA80
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 15:36:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD4DF10E2AB;
	Fri, 25 Apr 2025 13:36:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xX7wpJAF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D77CD10E2AB
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 13:36:46 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-5f62ef3c383so4321088a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 06:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745588205; x=1746193005; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HTyBdYK9QHtfmQZsIeeNm4rwCrR2M4f8xsWgO6o7yV4=;
 b=xX7wpJAF6zr4KIwi7oZDkjuYGPRyMl8qJcZe5EhJsP0tPMXgQhiZEfrOBmb4Spsj0T
 YkkxJb4mzuFzGqsx1yyfj+5vCvDq9kjLMw0yC06RyXNGEQ19xZ1Unbix95KfkYVKmWsX
 kZlzM1yo/d2sFT6dqZMyAToiibEbeUj4OSIc78mVFkXFPK8BIvE+I9+Iqfqa/XWXTU8R
 QMogjXzsW0vHJCz/+WqZ7dv8pLQlazHbdHG6ltURa/FszfDOu1RFCt5MeUlpSROrPm6l
 FhBGsIaYuf/lV3fggoggbjPgSYwnIVwbNaHo48e2AZYB4aE5oLmTKXy+oeXq9+1zuf/s
 CVZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745588205; x=1746193005;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HTyBdYK9QHtfmQZsIeeNm4rwCrR2M4f8xsWgO6o7yV4=;
 b=vjXqSLF+uYqyMAQpZOI6ILJ0s8vltSmBDnBDsgMYZt5XNG+seTY32B0flJG7nI1VMm
 PeCXjsU4dWFGx9rRQCJ3CUOqS8C55MJNmolX76dX6t096qcEbVWowKTySll+EV/juxEg
 WEohqIQeI/kThJemDEmV1nQYplkpuqRC4+UyK+PNH5Mf9Jqhpw3FvkBZzkBSca+DKvOA
 FWKwVjeV9plcKIMv8+CMnSyANnYcabr30m6K4y+umo8g+7w3ElYaMdIyRNMfbAUZGgFA
 JaDU4vUCX0KF2bQFLjlwNZ03Db7WxMMfJZ7zzYNZ/jkudRdSvIS9bXBMpc1E5iZVNBxq
 Igcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEtqwW0bOnLZ1l4jChiyFihTNImnLTnSp9+uVQB1a0YMPrXbS/pvJi3b16l1VAtX6kFdtEdknt82Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7pFaQWsfd0YLACdMf8o/2ejIiAIHIHlmwnFGfTw1ElrbnTL6e
 bkU5PQ9FTSihXMMZIIOeEtvcbBFGK0Y3+BILJP/JMjkTqk05L2uJbmwk/zsW1i9rDfOemuIcB9b
 DqkTu0CYmJJufkkZivuDc77yossSIE6gY54d/IQ==
X-Gm-Gg: ASbGncukXOH/0JUWpEgCvfSeyLAIG2yY6ag7HGeCShEpV1SRPEEpv6NBpbMSdQ2cpRL
 WWvsKaRIBDJk3ACSZQXjhM7Pxwk20WREIVxoGH5GRT1p+95hU15mNg9ymgkc9ISd8zYhpyuj49K
 yZeTl/HgBRjMj6X9zAvZqTr5lCbyHnAUUvkEC60BjuVtPBVZVQrG/hPeU=
X-Google-Smtp-Source: AGHT+IE7SPxlVH3PkxOOB55XTbBPfO/7JEFTukIQStQPN0fihbHuXz0FkHYC68Cqk0Q9M/qOq82CDuNzvmZ6Nh2nFq4=
X-Received: by 2002:a05:6402:4309:b0:5f6:23b1:ab4b with SMTP id
 4fb4d7f45d1cf-5f723a1d32fmr2029504a12.30.1745588205252; Fri, 25 Apr 2025
 06:36:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250404143215.2281034-1-jens.wiklander@linaro.org>
 <20250404143215.2281034-5-jens.wiklander@linaro.org>
In-Reply-To: <20250404143215.2281034-5-jens.wiklander@linaro.org>
From: Rouven Czerwinski <rouven.czerwinski@linaro.org>
Date: Fri, 25 Apr 2025 15:36:33 +0200
X-Gm-Features: ATxdqUGYPWHtY03dwLh1zXB-k8A70x8RLBAD7gk6FeZVRcqYmVrqVAOIUH5hmp8
Message-ID: <CAK8z29XHZXo5e1u8q_0D=iWxr3V2m7PateRGgqVGFe-WDeFKGg@mail.gmail.com>
Subject: Re: [PATCH v7 04/11] optee: sync secure world ABI headers
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
 Sumit Garg <sumit.garg@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, 
 Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>
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

Hi,

On Fri, 4 Apr 2025 at 16:31, Jens Wiklander <jens.wiklander@linaro.org> wrote:
>
> Update the header files describing the secure world ABI, both with and
> without FF-A. The ABI is extended to deal with protected memory, but as
> usual backward compatible.
>
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  drivers/tee/optee/optee_ffa.h | 27 +++++++++---
>  drivers/tee/optee/optee_msg.h | 83 ++++++++++++++++++++++++++++++-----
>  drivers/tee/optee/optee_smc.h | 71 +++++++++++++++++++++++++++++-
>  3 files changed, 163 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/tee/optee/optee_ffa.h b/drivers/tee/optee/optee_ffa.h
> index 257735ae5b56..cc257e7956a3 100644
> --- a/drivers/tee/optee/optee_ffa.h
> +++ b/drivers/tee/optee/optee_ffa.h
> @@ -81,7 +81,7 @@
>   *                   as the second MSG arg struct for
>   *                   OPTEE_FFA_YIELDING_CALL_WITH_ARG.
>   *        Bit[31:8]: Reserved (MBZ)
> - * w5:   Bitfield of secure world capabilities OPTEE_FFA_SEC_CAP_* below,
> + * w5:   Bitfield of OP-TEE capabilities OPTEE_FFA_SEC_CAP_*
>   * w6:   The maximum secure world notification number
>   * w7:   Not used (MBZ)
>   */
> @@ -94,6 +94,8 @@
>  #define OPTEE_FFA_SEC_CAP_ASYNC_NOTIF  BIT(1)
>  /* OP-TEE supports probing for RPMB device if needed */
>  #define OPTEE_FFA_SEC_CAP_RPMB_PROBE   BIT(2)
> +/* OP-TEE supports Protected Memory for secure data path */
> +#define OPTEE_FFA_SEC_CAP_PROTMEM      BIT(3)
>
>  #define OPTEE_FFA_EXCHANGE_CAPABILITIES OPTEE_FFA_BLOCKING_CALL(2)
>
> @@ -108,7 +110,7 @@
>   *
>   * Return register usage:
>   * w3:    Error code, 0 on success
> - * w4-w7: Note used (MBZ)
> + * w4-w7: Not used (MBZ)
>   */
>  #define OPTEE_FFA_UNREGISTER_SHM       OPTEE_FFA_BLOCKING_CALL(3)
>
> @@ -119,16 +121,31 @@
>   * Call register usage:
>   * w3:    Service ID, OPTEE_FFA_ENABLE_ASYNC_NOTIF
>   * w4:   Notification value to request bottom half processing, should be
> - *       less than OPTEE_FFA_MAX_ASYNC_NOTIF_VALUE.
> + *       less than OPTEE_FFA_MAX_ASYNC_NOTIF_VALUE
>   * w5-w7: Not used (MBZ)
>   *
>   * Return register usage:
>   * w3:    Error code, 0 on success
> - * w4-w7: Note used (MBZ)
> + * w4-w7: Not used (MBZ)
>   */
>  #define OPTEE_FFA_ENABLE_ASYNC_NOTIF   OPTEE_FFA_BLOCKING_CALL(5)
>
> -#define OPTEE_FFA_MAX_ASYNC_NOTIF_VALUE 64
> +#define OPTEE_FFA_MAX_ASYNC_NOTIF_VALUE        64
> +
> +/*
> + * Release Protected memory
> + *
> + * Call register usage:
> + * w3:    Service ID, OPTEE_FFA_RECLAIM_PROTMEM
> + * w4:    Shared memory handle, lower bits
> + * w5:    Shared memory handle, higher bits
> + * w6-w7: Not used (MBZ)
> + *
> + * Return register usage:
> + * w3:    Error code, 0 on success
> + * w4-w7: Note used (MBZ)
> + */
> +#define OPTEE_FFA_RELEASE_PROTMEM      OPTEE_FFA_BLOCKING_CALL(8)
>
>  /*
>   * Call with struct optee_msg_arg as argument in the supplied shared memory
> diff --git a/drivers/tee/optee/optee_msg.h b/drivers/tee/optee/optee_msg.h
> index e8840a82b983..22d71d6f110d 100644
> --- a/drivers/tee/optee/optee_msg.h
> +++ b/drivers/tee/optee/optee_msg.h
> @@ -133,13 +133,13 @@ struct optee_msg_param_rmem {
>  };
>
>  /**
> - * struct optee_msg_param_fmem - ffa memory reference parameter
> + * struct optee_msg_param_fmem - FF-A memory reference parameter
>   * @offs_lower:           Lower bits of offset into shared memory reference
>   * @offs_upper:           Upper bits of offset into shared memory reference
>   * @internal_offs: Internal offset into the first page of shared memory
>   *                reference
>   * @size:         Size of the buffer
> - * @global_id:    Global identifier of Shared memory
> + * @global_id:    Global identifier of the shared memory
>   */
>  struct optee_msg_param_fmem {
>         u32 offs_low;
> @@ -165,7 +165,7 @@ struct optee_msg_param_value {
>   * @attr:      attributes
>   * @tmem:      parameter by temporary memory reference
>   * @rmem:      parameter by registered memory reference
> - * @fmem:      parameter by ffa registered memory reference
> + * @fmem:      parameter by FF-A registered memory reference
>   * @value:     parameter by opaque value
>   * @octets:    parameter by octet string
>   *
> @@ -296,6 +296,18 @@ struct optee_msg_arg {
>   */
>  #define OPTEE_MSG_FUNCID_GET_OS_REVISION       0x0001
>
> +/*
> + * Values used in OPTEE_MSG_CMD_LEND_PROTMEM below
> + * OPTEE_MSG_PROTMEM_RESERVED          Reserved
> + * OPTEE_MSG_PROTMEM_SECURE_VIDEO_PLAY Secure Video Playback
> + * OPTEE_MSG_PROTMEM_TRUSTED_UI                Trused UI
> + * OPTEE_MSG_PROTMEM_SECURE_VIDEO_RECORD       Secure Video Recording
> + */
> +#define OPTEE_MSG_PROTMEM_RESERVED             0
> +#define OPTEE_MSG_PROTMEM_SECURE_VIDEO_PLAY    1
> +#define OPTEE_MSG_PROTMEM_TRUSTED_UI           2
> +#define OPTEE_MSG_PROTMEM_SECURE_VIDEO_RECORD  3
> +
>  /*
>   * Do a secure call with struct optee_msg_arg as argument
>   * The OPTEE_MSG_CMD_* below defines what goes in struct optee_msg_arg::cmd
> @@ -337,15 +349,62 @@ struct optee_msg_arg {
>   * OPTEE_MSG_CMD_STOP_ASYNC_NOTIF informs secure world that from now is
>   * normal world unable to process asynchronous notifications. Typically
>   * used when the driver is shut down.
> + *
> + * OPTEE_MSG_CMD_LEND_PROTMEM lends protected memory. The passed normal
> + * physical memory is protected from normal world access. The memory
> + * should be unmapped prior to this call since it becomes inaccessible
> + * during the request.
> + * Parameters are passed as:
> + * [in] param[0].attr                  OPTEE_MSG_ATTR_TYPE_VALUE_INPUT
> + * [in] param[0].u.value.a             OPTEE_MSG_PROTMEM_* defined above
> + * [in] param[1].attr                  OPTEE_MSG_ATTR_TYPE_TMEM_INPUT
> + * [in] param[1].u.tmem.buf_ptr                physical address
> + * [in] param[1].u.tmem.size           size
> + * [in] param[1].u.tmem.shm_ref                holds protected memory reference
> + *
> + * OPTEE_MSG_CMD_RECLAIM_PROTMEM reclaims a previously lent protected
> + * memory reference. The physical memory is accessible by the normal world
> + * after this function has return and can be mapped again. The information
> + * is passed as:
> + * [in] param[0].attr                  OPTEE_MSG_ATTR_TYPE_VALUE_INPUT
> + * [in] param[0].u.value.a             holds protected memory cookie
> + *
> + * OPTEE_MSG_CMD_GET_PROTMEM_CONFIG get configuration for a specific
> + * protected memory use case. Parameters are passed as:
> + * [in] param[0].attr                  OPTEE_MSG_ATTR_TYPE_VALUE_INOUT
> + * [in] param[0].value.a               OPTEE_MSG_PROTMEM_*
> + * [in] param[1].attr                  OPTEE_MSG_ATTR_TYPE_{R,F}MEM_OUTPUT
> + * [in] param[1].u.{r,f}mem            Buffer or NULL
> + * [in] param[1].u.{r,f}mem.size       Provided size of buffer or 0 for query
> + * output for the protected use case:
> + * [out] param[0].value.a              Minimal size of protected memory
> + * [out] param[0].value.b              Required alignment of size and start of
> + *                                     protected memory
> + * [out] param[1].{r,f}mem.size                Size of output data
> + * [out] param[1].{r,f}mem             If non-NULL, contains an array of
> + *                                     uint16_t holding endpoints that
> + *                                     must be included when lending
> + *                                     memory for this use case
> + *
> + * OPTEE_MSG_CMD_ASSIGN_PROTMEM assigns use-case to protected memory
> + * previously lent using the FFA_LEND framework ABI. Parameters are passed
> + * as:
> + * [in] param[0].attr                  OPTEE_MSG_ATTR_TYPE_VALUE_INPUT
> + * [in] param[0].u.value.a             holds protected memory cookie
> + * [in] param[0].u.value.b             OPTEE_MSG_PROTMEM_* defined above
>   */
> -#define OPTEE_MSG_CMD_OPEN_SESSION     0
> -#define OPTEE_MSG_CMD_INVOKE_COMMAND   1
> -#define OPTEE_MSG_CMD_CLOSE_SESSION    2
> -#define OPTEE_MSG_CMD_CANCEL           3
> -#define OPTEE_MSG_CMD_REGISTER_SHM     4
> -#define OPTEE_MSG_CMD_UNREGISTER_SHM   5
> -#define OPTEE_MSG_CMD_DO_BOTTOM_HALF   6
> -#define OPTEE_MSG_CMD_STOP_ASYNC_NOTIF 7
> -#define OPTEE_MSG_FUNCID_CALL_WITH_ARG 0x0004
> +#define OPTEE_MSG_CMD_OPEN_SESSION             0
> +#define OPTEE_MSG_CMD_INVOKE_COMMAND           1
> +#define OPTEE_MSG_CMD_CLOSE_SESSION            2
> +#define OPTEE_MSG_CMD_CANCEL                   3
> +#define OPTEE_MSG_CMD_REGISTER_SHM             4
> +#define OPTEE_MSG_CMD_UNREGISTER_SHM           5
> +#define OPTEE_MSG_CMD_DO_BOTTOM_HALF           6
> +#define OPTEE_MSG_CMD_STOP_ASYNC_NOTIF         7
> +#define OPTEE_MSG_CMD_LEND_PROTMEM             8
> +#define OPTEE_MSG_CMD_RECLAIM_PROTMEM          9
> +#define OPTEE_MSG_CMD_GET_PROTMEM_CONFIG       10
> +#define OPTEE_MSG_CMD_ASSIGN_PROTMEM           11
> +#define OPTEE_MSG_FUNCID_CALL_WITH_ARG         0x0004
>
>  #endif /* _OPTEE_MSG_H */
> diff --git a/drivers/tee/optee/optee_smc.h b/drivers/tee/optee/optee_smc.h
> index 879426300821..b17e81f464a3 100644
> --- a/drivers/tee/optee/optee_smc.h
> +++ b/drivers/tee/optee/optee_smc.h
> @@ -264,7 +264,6 @@ struct optee_smc_get_shm_config_result {
>  #define OPTEE_SMC_SEC_CAP_HAVE_RESERVED_SHM    BIT(0)
>  /* Secure world can communicate via previously unregistered shared memory */
>  #define OPTEE_SMC_SEC_CAP_UNREGISTERED_SHM     BIT(1)
> -
>  /*
>   * Secure world supports commands "register/unregister shared memory",
>   * secure world accepts command buffers located in any parts of non-secure RAM
> @@ -280,6 +279,10 @@ struct optee_smc_get_shm_config_result {
>  #define OPTEE_SMC_SEC_CAP_RPC_ARG              BIT(6)
>  /* Secure world supports probing for RPMB device if needed */
>  #define OPTEE_SMC_SEC_CAP_RPMB_PROBE           BIT(7)
> +/* Secure world supports protected memory */
> +#define OPTEE_SMC_SEC_CAP_PROTMEM              BIT(8)
> +/* Secure world supports dynamic protected memory */
> +#define OPTEE_SMC_SEC_CAP_DYNAMIC_PROTMEM      BIT(9)
>
>  #define OPTEE_SMC_FUNCID_EXCHANGE_CAPABILITIES 9
>  #define OPTEE_SMC_EXCHANGE_CAPABILITIES \
> @@ -451,6 +454,72 @@ struct optee_smc_disable_shm_cache_result {
>
>  /* See OPTEE_SMC_CALL_WITH_REGD_ARG above */
>  #define OPTEE_SMC_FUNCID_CALL_WITH_REGD_ARG    19
> +/*
> + * Get protected memory config
> + *
> + * Returns the protected memory config.
> + *
> + * Call register usage:
> + * a0   SMC Function ID, OPTEE_SMC_GET_PROTMEM_CONFIG
> + * a2-6        Not used, must be zero
> + * a7  Hypervisor Client ID register
> + *
> + * Have config return register usage:
> + * a0  OPTEE_SMC_RETURN_OK
> + * a1  Physical address of start of protected memory
> + * a2  Size of protected memory
> + * a3  Not used
> + * a4-7        Preserved
> + *
> + * Not available register usage:
> + * a0  OPTEE_SMC_RETURN_ENOTAVAIL
> + * a1-3 Not used
> + * a4-7        Preserved
> + */
> +#define OPTEE_SMC_FUNCID_GET_PROTMEM_CONFIG            20
> +#define OPTEE_SMC_GET_PROTMEM_CONFIG \
> +       OPTEE_SMC_FAST_CALL_VAL(OPTEE_SMC_FUNCID_GET_PROTMEM_CONFIG)
> +
> +struct optee_smc_get_protmem_config_result {
> +       unsigned long status;
> +       unsigned long start;
> +       unsigned long size;
> +       unsigned long flags;

The ABI comment does not document a flags return argument, either
this can be removed or the ABI comment needs to be fixed.
Same for
> +};
> +
> +/*
> + * Get dynamic protected memory config
> + *
> + * Returns the dynamic protected memory config.
> + *
> + * Call register usage:
> + * a0  SMC Function ID, OPTEE_SMC_GET_DYN_SHM_CONFIG

should be OPTEE_SMC_GET_DYN_PROTMEM_CONFIG

> + * a2-6        Not used, must be zero
> + * a7  Hypervisor Client ID register
> + *
> + * Have config return register usage:
> + * a0  OPTEE_SMC_RETURN_OK
> + * a1  Minamal size of protected memory

Nit: Typo, should be "Minimal"

> + * a2  Required alignment of size and start of registered protected memory
> + * a3  Not used
> + * a4-7        Preserved
> + *
> + * Not available register usage:
> + * a0  OPTEE_SMC_RETURN_ENOTAVAIL
> + * a1-3 Not used
> + * a4-7        Preserved
> + */
> +
> +#define OPTEE_SMC_FUNCID_GET_DYN_PROTMEM_CONFIG        21
> +#define OPTEE_SMC_GET_DYN_PROTMEM_CONFIG \
> +       OPTEE_SMC_FAST_CALL_VAL(OPTEE_SMC_FUNCID_GET_DYN_PROTMEM_CONFIG)
> +
> +struct optee_smc_get_dyn_protmem_config_result {
> +       unsigned long status;
> +       unsigned long size;
> +       unsigned long align;
> +       unsigned long flags;
> +};
>
>  /*
>   * Resume from RPC (for example after processing a foreign interrupt)
> --
> 2.43.0

- Rouven
