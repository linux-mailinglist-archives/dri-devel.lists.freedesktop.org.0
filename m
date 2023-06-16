Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA48C733A12
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 21:39:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D1A010E0C1;
	Fri, 16 Jun 2023 19:39:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEA7310E0C1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 19:39:28 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 070875C0199;
 Fri, 16 Jun 2023 15:39:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 16 Jun 2023 15:39:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
 1686944367; x=1687030767; bh=y2UAeQYbF8t/3g5H/ot1lhjysr3bev+dcwy
 cc4lZVwU=; b=oeJ6sLZnFfwipwlEVKDluMyfscqLes8xeFhsLzioEYTXzckp0CO
 xqcmCi5+z4Pw+hiSPsd5LuRMO1RCYcnAikL5UGldv0TXnfbllk5FWG2VOGqGwYEx
 FC5hqpJ5bweB7B1v8wTXbuXnt8dpAcNbIMu5vPX+kxyuI66WHJ3INbQ9ev1Sh2AP
 n7n9HYyN/BsaF+UUiyTPVQPRosJ64jwUwjn+EB/mRlhVyURvHiUfLmoljHX4Feya
 anaHwMmRDkycPNmqc6aimXcajsD0mqTuTZmRZHg9IT9viDHbDB1uiA89zNT/AQCI
 5RHaUJFuE+4qW0QBATa1wIoyjY6glGx8izA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1686944367; x=1687030767; bh=y2UAeQYbF8t/3g5H/ot1lhjysr3bev+dcwy
 cc4lZVwU=; b=FZ4eunhkk5OBY7Oq8QsY+fZ2/gjx3Bt4JwdNCv/IaAIA9stuYAC
 qlc4cDiBDxkTeFRkJMGyPbQrfXvh3a22BFd1GpJw4WN3W63xSzNgWdLFVORYnrS1
 ZPgpJSiRIHhIIduj+ibX8ijbJi8qfVmz80y5Ktw6IoA4iNOhkshRHDn8e+iPqVnt
 6x6NTEm2CqV6GneQghNH/HMPZ4+d6CBRswJ/3ITUqdApt3QN/cWbVf8NySNJQzJQ
 BqyuATDPhJZgiUH8Kbbyjm5QzBEjx8JMxgdsvtANiohdvG1xwUpvnlSbCYZlgOeH
 E5+QoDlpYXlegempAQNmkbwu1SgGOKEJ1lQ==
X-ME-Sender: <xms:brqMZCrlktpsKJJ4gH4rQCLiOoh4IZetdVecqHlZcwD3KX_---h1wg>
 <xme:brqMZAprHQHxHXgz2arm4T-kQVnc9zxB-Vc-zC79QmMgBMDj5dxe3-wb93gDdIYfA
 s56QWIfAZV81zlceqU>
X-ME-Received: <xmr:brqMZHPnSTiN4YQ7VpCjT0CdimR4YdNiBoDZ4UIgHonYBphlCN-N29epTaYron570YUgkYzF1s3t3KwYzrI9ATA15uBX8dGH9pFY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgedvgedgudegtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttdefjeenucfhrhhomhepfdfo
 rggriicuofhomhgsrghsrgifrghlrgculdggofghrghrvgdmfdcuoehmrggriihmsehfrg
 hsthhmrghilhdrtghomheqnecuggftrfgrthhtvghrnhepleejvdeugeelhfevteduueev
 fffftefhudetuedugfduffekjedugfffjeefteegnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrrgiimhesfhgrshhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:brqMZB5KULoAVsjgqqhaZklPNYHc4TIIuj2BSAImUxs9KclhFtXFSw>
 <xmx:brqMZB5HsgopLzuXKS-XsYfpkQqKN8oF6uL_6AZZ-GtfxpLXeYsTVg>
 <xmx:brqMZBjYW87QIMBLiIFRx3i4Zib0ou7OqS9RDwvtZyRC912FD-pIxQ>
 <xmx:b7qMZLuSXRZyCEW7ZbOiMwlTyAiyAI-2P9Mty3nqDoBQ83SZw6EGcw>
Feedback-ID: i1b1946fb:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 16 Jun 2023 15:39:25 -0400 (EDT)
Message-ID: <b8766079-86c6-d1b9-e4ab-020cb7a64a23@fastmail.com>
Date: Fri, 16 Jun 2023 12:38:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] drm/vmwgfx: Fix shader stage validation
Content-Language: en-US
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
References: <20230616190934.54828-1-zack@kde.org>
From: "Maaz Mombasawala (VMWare)" <maazm@fastmail.com>
In-Reply-To: <20230616190934.54828-1-zack@kde.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: security@openanolis.org, Niels De Graef <ndegraef@redhat.com>,
 stable@vger.kernel.org, mombasawalam@vmware.com, krastevm@vmware.com,
 banackm@vmware.com, iforbes@vmware.com, Ziming Zhang <ezrakiez@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

LGTM.

Reviewed-by: Maaz Mombasawala<mombasawalam@vmware.com>

Maaz Mombasawala (VMware)<maazm@fastmail.com>


On 6/16/2023 12:09 PM, Zack Rusin wrote:
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
