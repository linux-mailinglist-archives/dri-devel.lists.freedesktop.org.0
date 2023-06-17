Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F84734019
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jun 2023 12:25:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6134010E0B5;
	Sat, 17 Jun 2023 10:25:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2769110E0B5
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jun 2023 10:25:09 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f8d0d68530so15641205e9.0
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jun 2023 03:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686997507; x=1689589507;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uoCk/Pyl+IYYisKSpgeNToSpEEo9v08ZKHLTLWplCcA=;
 b=nTMNnl/Bil2SCceiKGNg+jVRr3yFMnIc1GYR7b7RVFnbpynNZamHGigKPLUnBGatk0
 2QUQiuJcBWNkQQiaL+u8Y9Qx/dPQ1mM0kKgj1uRhQW9PXkn+pESyS6y8uWS8TZvJvXAH
 g6kwBCZT+Cws6UqRN5/WcnBV+6X/joO3v/sdbXTyi+3kLAf/BxNEN1qxRTRr91YAxCZ8
 TUy+CmNUsZqy1PJem2jXbS+afGSF963ys++GltsncBRcCbSKTfrlfx3VIgjRHIggugXT
 GBc4fMdmRgXcHuIkbWCYicE7xn84jiCgiiE5xljNElGIoZbg2SUdsueA9afEVvnbGDFx
 PUOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686997507; x=1689589507;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uoCk/Pyl+IYYisKSpgeNToSpEEo9v08ZKHLTLWplCcA=;
 b=cpD8y6iQLK/z+VdKDuZIKRD8eYiY6j5v7jxa8YxNSw5ZRV9cKI0AWSvobn7kjAfrHl
 v11a9q9aWGzrxYjseWtvoUCsL4y70SOssvXeX18EI/FeN2N1MNdFTGsKs3ilLDzfkgNh
 ONDTVrUDFJPpmvg1FBmg0yHUrp0bCXPkMpOy+buhMBSAHeowNcFdwt29vxQdeJ4ArqVf
 PmbsiJY5var3ZrE23f93UjAo81S88/IhFbrBpSIA0KkZJpRKbsyvrwvxbT/tAAfV84go
 3+YeheSD8Gqyy2RYCpLn8MUrFtAySVdjudPhRjydDIn3vWJuivgnA1CTM4gF9JExTiIH
 p1Cg==
X-Gm-Message-State: AC+VfDyrSo3wUvtvzNW4++hTQevfGeTjHW/KLfUCFXn45M+cwiHE4wtM
 XXzJlPCWnhPJHP2ZIwcktH+ygsZ9rDU=
X-Google-Smtp-Source: ACHHUZ64iWuTBksnMHk1QqXYVTKxuQu2gQ9YuqPt7ez4ob0VJ7T0VfvIPItJv+SGe7mBvclaXUciYA==
X-Received: by 2002:a7b:c7c9:0:b0:3f7:f90c:4978 with SMTP id
 z9-20020a7bc7c9000000b003f7f90c4978mr4203602wmk.21.1686997507217; 
 Sat, 17 Jun 2023 03:25:07 -0700 (PDT)
Received: from [192.168.2.181] (62-73-122-174.ip.btc-net.bg. [62.73.122.174])
 by smtp.gmail.com with ESMTPSA id
 v5-20020a05600c214500b003f7f87ba116sm1843771wml.19.2023.06.17.03.25.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Jun 2023 03:25:06 -0700 (PDT)
Message-ID: <51c40394-9b5c-7643-b973-b54ae5e642e0@gmail.com>
Date: Sat, 17 Jun 2023 13:25:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] drm/vmwgfx: Fix shader stage validation
To: dri-devel@lists.freedesktop.org
References: <20230616190934.54828-1-zack@kde.org>
Content-Language: en-US
From: "Martin Krastev (VMware)" <martinkrastev768@gmail.com>
In-Reply-To: <20230616190934.54828-1-zack@kde.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

From: Martin Krastev <krastevm@vmware.com>


Looks good!


Reviewed-by: Martin Krastev <krastevm@vmware.com>


Regards,

Martin


On 16.06.23 г. 22:09 ч., Zack Rusin wrote:
> From: Zack Rusin <zackr@vmware.com>
>
> For multiple commands the driver was not correctly validating the shader
> stages resulting in possible kernel oopses. The validation code was only.
> if ever, checking the upper bound on the shader stages but never a lower
> bound (valid shader stages start at 1 not 0).
>
> Fixes kernel oopses ending up in vmw_binding_add, e.g.:
> Oops: 0000 [#1] PREEMPT SMP PTI
> CPU: 1 PID: 2443 Comm: testcase Not tainted 6.3.0-rc4-vmwgfx #1
> Hardware name: VMware, Inc. VMware Virtual Platform/440BX Desktop Reference Platform, BIOS 6.00 11/12/2020
> RIP: 0010:vmw_binding_add+0x4c/0x140 [vmwgfx]
> Code: 7e 30 49 83 ff 0e 0f 87 ea 00 00 00 4b 8d 04 7f 89 d2 89 cb 48 c1 e0 03 4c 8b b0 40 3d 93 c0 48 8b 80 48 3d 93 c0 49 0f af de <48> 03 1c d0 4c 01 e3 49 8>
> RSP: 0018:ffffb8014416b968 EFLAGS: 00010206
> RAX: ffffffffc0933ec0 RBX: 0000000000000000 RCX: 0000000000000000
> RDX: 00000000ffffffff RSI: ffffb8014416b9c0 RDI: ffffb8014316f000
> RBP: ffffb8014416b998 R08: 0000000000000003 R09: 746f6c735f726564
> R10: ffffffffaaf2bda0 R11: 732e676e69646e69 R12: ffffb8014316f000
> R13: ffffb8014416b9c0 R14: 0000000000000040 R15: 0000000000000006
> FS:  00007fba8c0af740(0000) GS:ffff8a1277c80000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00000007c0933eb8 CR3: 0000000118244001 CR4: 00000000003706e0
> Call Trace:
>   <TASK>
>   vmw_view_bindings_add+0xf5/0x1b0 [vmwgfx]
>   ? ___drm_dbg+0x8a/0xb0 [drm]
>   vmw_cmd_dx_set_shader_res+0x8f/0xc0 [vmwgfx]
>   vmw_execbuf_process+0x590/0x1360 [vmwgfx]
>   vmw_execbuf_ioctl+0x173/0x370 [vmwgfx]
>   ? __drm_dev_dbg+0xb4/0xe0 [drm]
>   ? __pfx_vmw_execbuf_ioctl+0x10/0x10 [vmwgfx]
>   drm_ioctl_kernel+0xbc/0x160 [drm]
>   drm_ioctl+0x2d2/0x580 [drm]
>   ? __pfx_vmw_execbuf_ioctl+0x10/0x10 [vmwgfx]
>   ? do_fault+0x1a6/0x420
>   vmw_generic_ioctl+0xbd/0x180 [vmwgfx]
>   vmw_unlocked_ioctl+0x19/0x20 [vmwgfx]
>   __x64_sys_ioctl+0x96/0xd0
>   do_syscall_64+0x5d/0x90
>   ? handle_mm_fault+0xe4/0x2f0
>   ? debug_smp_processor_id+0x1b/0x30
>   ? fpregs_assert_state_consistent+0x2e/0x50
>   ? exit_to_user_mode_prepare+0x40/0x180
>   ? irqentry_exit_to_user_mode+0xd/0x20
>   ? irqentry_exit+0x3f/0x50
>   ? exc_page_fault+0x8b/0x180
>   entry_SYSCALL_64_after_hwframe+0x72/0xdc
>
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> Cc: security@openanolis.org
> Reported-by: Ziming Zhang <ezrakiez@gmail.com>
> Testcase-found-by: Niels De Graef <ndegraef@redhat.com>
> Fixes: d80efd5cb3de ("drm/vmwgfx: Initial DX support")
> Cc: <stable@vger.kernel.org> # v4.3+
> ---
>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h     | 12 ++++++++++
>   drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 29 ++++++++++---------------
>   2 files changed, 23 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> index 3810a9984a7f..58bfdf203eca 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> @@ -1513,4 +1513,16 @@ static inline bool vmw_has_fences(struct vmw_private *vmw)
>   	return (vmw_fifo_caps(vmw) & SVGA_FIFO_CAP_FENCE) != 0;
>   }
>   
> +static inline bool vmw_shadertype_is_valid(enum vmw_sm_type shader_model,
> +					   u32 shader_type)
> +{
> +	SVGA3dShaderType max_allowed = SVGA3D_SHADERTYPE_PREDX_MAX;
> +
> +	if (shader_model >= VMW_SM_5)
> +		max_allowed = SVGA3D_SHADERTYPE_MAX;
> +	else if (shader_model >= VMW_SM_4)
> +		max_allowed = SVGA3D_SHADERTYPE_DX10_MAX;
> +	return shader_type >= SVGA3D_SHADERTYPE_MIN && shader_type < max_allowed;
> +}
> +
>   #endif
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> index 6b9aa2b4ef54..d30c0e3d3ab7 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> @@ -1992,7 +1992,7 @@ static int vmw_cmd_set_shader(struct vmw_private *dev_priv,
>   
>   	cmd = container_of(header, typeof(*cmd), header);
>   
> -	if (cmd->body.type >= SVGA3D_SHADERTYPE_PREDX_MAX) {
> +	if (!vmw_shadertype_is_valid(VMW_SM_LEGACY, cmd->body.type)) {
>   		VMW_DEBUG_USER("Illegal shader type %u.\n",
>   			       (unsigned int) cmd->body.type);
>   		return -EINVAL;
> @@ -2115,8 +2115,6 @@ vmw_cmd_dx_set_single_constant_buffer(struct vmw_private *dev_priv,
>   				      SVGA3dCmdHeader *header)
>   {
>   	VMW_DECLARE_CMD_VAR(*cmd, SVGA3dCmdDXSetSingleConstantBuffer);
> -	SVGA3dShaderType max_shader_num = has_sm5_context(dev_priv) ?
> -		SVGA3D_NUM_SHADERTYPE : SVGA3D_NUM_SHADERTYPE_DX10;
>   
>   	struct vmw_resource *res = NULL;
>   	struct vmw_ctx_validation_info *ctx_node = VMW_GET_CTX_NODE(sw_context);
> @@ -2133,6 +2131,14 @@ vmw_cmd_dx_set_single_constant_buffer(struct vmw_private *dev_priv,
>   	if (unlikely(ret != 0))
>   		return ret;
>   
> +	if (!vmw_shadertype_is_valid(dev_priv->sm_type, cmd->body.type) ||
> +	    cmd->body.slot >= SVGA3D_DX_MAX_CONSTBUFFERS) {
> +		VMW_DEBUG_USER("Illegal const buffer shader %u slot %u.\n",
> +			       (unsigned int) cmd->body.type,
> +			       (unsigned int) cmd->body.slot);
> +		return -EINVAL;
> +	}
> +
>   	binding.bi.ctx = ctx_node->ctx;
>   	binding.bi.res = res;
>   	binding.bi.bt = vmw_ctx_binding_cb;
> @@ -2141,14 +2147,6 @@ vmw_cmd_dx_set_single_constant_buffer(struct vmw_private *dev_priv,
>   	binding.size = cmd->body.sizeInBytes;
>   	binding.slot = cmd->body.slot;
>   
> -	if (binding.shader_slot >= max_shader_num ||
> -	    binding.slot >= SVGA3D_DX_MAX_CONSTBUFFERS) {
> -		VMW_DEBUG_USER("Illegal const buffer shader %u slot %u.\n",
> -			       (unsigned int) cmd->body.type,
> -			       (unsigned int) binding.slot);
> -		return -EINVAL;
> -	}
> -
>   	vmw_binding_add(ctx_node->staged, &binding.bi, binding.shader_slot,
>   			binding.slot);
>   
> @@ -2207,15 +2205,13 @@ static int vmw_cmd_dx_set_shader_res(struct vmw_private *dev_priv,
>   {
>   	VMW_DECLARE_CMD_VAR(*cmd, SVGA3dCmdDXSetShaderResources) =
>   		container_of(header, typeof(*cmd), header);
> -	SVGA3dShaderType max_allowed = has_sm5_context(dev_priv) ?
> -		SVGA3D_SHADERTYPE_MAX : SVGA3D_SHADERTYPE_DX10_MAX;
>   
>   	u32 num_sr_view = (cmd->header.size - sizeof(cmd->body)) /
>   		sizeof(SVGA3dShaderResourceViewId);
>   
>   	if ((u64) cmd->body.startView + (u64) num_sr_view >
>   	    (u64) SVGA3D_DX_MAX_SRVIEWS ||
> -	    cmd->body.type >= max_allowed) {
> +	    !vmw_shadertype_is_valid(dev_priv->sm_type, cmd->body.type)) {
>   		VMW_DEBUG_USER("Invalid shader binding.\n");
>   		return -EINVAL;
>   	}
> @@ -2239,8 +2235,6 @@ static int vmw_cmd_dx_set_shader(struct vmw_private *dev_priv,
>   				 SVGA3dCmdHeader *header)
>   {
>   	VMW_DECLARE_CMD_VAR(*cmd, SVGA3dCmdDXSetShader);
> -	SVGA3dShaderType max_allowed = has_sm5_context(dev_priv) ?
> -		SVGA3D_SHADERTYPE_MAX : SVGA3D_SHADERTYPE_DX10_MAX;
>   	struct vmw_resource *res = NULL;
>   	struct vmw_ctx_validation_info *ctx_node = VMW_GET_CTX_NODE(sw_context);
>   	struct vmw_ctx_bindinfo_shader binding;
> @@ -2251,8 +2245,7 @@ static int vmw_cmd_dx_set_shader(struct vmw_private *dev_priv,
>   
>   	cmd = container_of(header, typeof(*cmd), header);
>   
> -	if (cmd->body.type >= max_allowed ||
> -	    cmd->body.type < SVGA3D_SHADERTYPE_MIN) {
> +	if (!vmw_shadertype_is_valid(dev_priv->sm_type, cmd->body.type)) {
>   		VMW_DEBUG_USER("Illegal shader type %u.\n",
>   			       (unsigned int) cmd->body.type);
>   		return -EINVAL;
