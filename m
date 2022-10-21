Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9AC607F63
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 22:00:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BC5410E66E;
	Fri, 21 Oct 2022 20:00:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA96410E32F
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 20:00:32 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 7A87C5C0129;
 Fri, 21 Oct 2022 16:00:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 21 Oct 2022 16:00:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1666382430; x=
 1666468830; bh=lDfUawaCaaGEJXI7s4Dhkg4jAVxly276wGHiHUdHbkQ=; b=a
 u8F3413GnMcEWNYoH87dJwhThTHjMklSMYfGpmVGoIxSUsy0jSYEt9EmQZG7oSIO
 vA8OsZ55ypLfSlGrDZBN2/LAIhCw9JKqi2BjoE/vRUS1dW1cwoPlqYIHB7N3C+F5
 nQ34WiSak2OCUvuFpy2k4NT0AH3sPe/eVdot4tIOQDUQd7xBtg5hXoYCvMkVXpDb
 1bOKe6KLipKW16ugpxEiLEvYp+OUeD9UaKBfHRebJbyoBQU9j9KZtCk/1rwls/y7
 PIW3Tpp7ogImWB+mXkP6IXVH3aZ4uzpPd2D1dsFGbQSs86jsFhWSIWop+R7D/e4w
 EcwiAsVj5KHq/fiRhecaA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666382430; x=
 1666468830; bh=lDfUawaCaaGEJXI7s4Dhkg4jAVxly276wGHiHUdHbkQ=; b=K
 xCMbNSUjDa/f1NSh83iU45haF3OMj+ijeixYhqdpQ0RPP6hQXR4rI63r9/zG+prV
 vlgjbRVs4QVvg8IDDHHwXzRS5UYpMI/UeFOqWQmhdqDOoDm2fxjfRFW2mEtSw5Ii
 2sSx3pAPHekUv7wpp31Y+RXX9CBX99mP45hlhXi6JJVBjmXSSFP86z+jIYRZb/HR
 SylLbgYaM3vOXkq/m+OoZSbgMue73k8z7pyFQHVFEfdomrUzMpwVWRr9Qp08+PJY
 XKZM8L2CfQVl/lhOw6HDIYZbQ2Mz+n6oTGkviPPxjovCoMYVsIsDergSxyWnKBbt
 lJ6PcmVIvy47vPNSu3j3A==
X-ME-Sender: <xms:XvpSY-AiZBWDA0ThSvY8NSrwdBMAqXX4GLFlOKt4aQ6bt7XIm_9paQ>
 <xme:XvpSY4g1bsFkzwwDv3JUdifXwSg7VuoMO3v-E1Dq0iqkpTaWOIwWDpkhKsc9k428z
 IojiWKyOKbiO_kBB9Y>
X-ME-Received: <xmr:XvpSYxlTxaAKVFKpSoKeNfjamTnH06rHjEMTmYqBqGQ_-dpvfepXrITSEr9hTw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeelkedgudegudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttdefjeenucfhrhhomhepfdgm
 fdforggriicuofhomhgsrghsrgifrghlrgculdggofifrghrvgdmfdcuoehmrggriihmse
 hfrghsthhmrghilhdrtghomheqnecuggftrfgrthhtvghrnhepteffhfegvddvgfeutdet
 heffjeelhffgudefudeujedvveehveeuhfethfdtjeffnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrgiimhesfhgrshhtmhgrihhlrdgt
 ohhm
X-ME-Proxy: <xmx:XvpSY8xDnEpYtQSlRjP7AjQty9GN532Rx3pAGGAy_R5Lx4HNICFPmw>
 <xmx:XvpSYzTqxc1gAdM85qhVqIod6QNk41ao8GcCJ-38OJl0OlBRJTaeYw>
 <xmx:XvpSY3YMhu5U1c9__e_Mv0hsbQVAS7wzrn2M_hgH1gdezTh_pvhxAg>
 <xmx:XvpSY9dKu_1lVF-ohfA11IwrODHVPELRNfBl7aYm2BvnrDydWapN8Q>
Feedback-ID: i1b1946fb:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 21 Oct 2022 16:00:29 -0400 (EDT)
Message-ID: <290dad79-0b72-1124-74ff-c71e632bfa63@fastmail.com>
Date: Fri, 21 Oct 2022 13:00:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v3 17/17] drm/vmwgfx: Fix a sparse warning in kernel docs
Content-Language: en-US
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
References: <20221021034400.542909-1-zack@kde.org>
 <20221021034400.542909-18-zack@kde.org>
From: "\"Maaz Mombasawala (VMware)" <maazm@fastmail.com>
In-Reply-To: <20221021034400.542909-18-zack@kde.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: krastevm@vmware.com, mombasawalam@vmware.com, banackm@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/20/22 20:44, Zack Rusin wrote:
> From: Zack Rusin <zackr@vmware.com>
> 
> Fixes a warning about extra docs about a function argument that has been
> removed a while back:
> drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c:3888: warning: Excess function
> parameter 'sync_file' description in 'vmw_execbuf_copy_fence_user'
> 
> Fixes: a0f90c881570 ("drm/vmwgfx: Fix stale file descriptors on failed usercopy")
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> index c943ab801ca7..f16fc489d725 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> @@ -3869,7 +3869,6 @@ int vmw_execbuf_fence_commands(struct drm_file *file_priv,
>   * @fence: Pointer to the fenc object.
>   * @fence_handle: User-space fence handle.
>   * @out_fence_fd: exported file descriptor for the fence.  -1 if not used
> - * @sync_file:  Only used to clean up in case of an error in this function.
>   *
>   * This function copies fence information to user-space. If copying fails, the
>   * user-space struct drm_vmw_fence_rep::error member is hopefully left

-- 

Looks good.

Reviewed-by: Maaz Mombasawala <mombasawalam@vmware.com>

Maaz Mombasawala (VMware) <maazm@fastmail.com>

