Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25481CA8697
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 17:41:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21A8F10EB5F;
	Fri,  5 Dec 2025 16:41:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XzNWyle7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EC0110EB5F
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 16:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764952897; x=1796488897;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Ypp0okvDVTaWZXUTzuSgHDhEjVEjQxq9/GS/Qn+AYMQ=;
 b=XzNWyle7E8l3H6/olb2+pxHSOKA0nWDjiex9G0SIsiu4IeoJxpzTrFBO
 JfHio0KVYHtVylmSC5Z/QUv9vLCIuyz0qzuT1QJOu1XGDqAMIZKQFuRI/
 AiPqBVQgb0Fig4jawujo7TaktF5EOa2YnaeLH/RGbq81y4IdoVrm0u/ZY
 oWKgaVVO/CJhFPbw0HBL/KflCQvsvPI1BgvaAXJHaokWn8V4/f2S4h12Z
 G+BzmtJcYM6PhLbJU3/9cBzx2pBk7p8ld6N7ZgkAcuvoX1edTJJ+mOgOE
 GVvaHxtU8SlkKHmar2ohc+ZejdUB64mrbeoYo9ZKrExg3vCey0GaLK6kG Q==;
X-CSE-ConnectionGUID: P8bGQFCnTbev2VDZI5m/Yg==
X-CSE-MsgGUID: bypELz8QQ1qUV6SanS6ipQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="67064862"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="67064862"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 08:41:37 -0800
X-CSE-ConnectionGUID: MnG2fNR6RWiyW4pA3fHRhw==
X-CSE-MsgGUID: MPsC99/nR2mAx5GZVfBSkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="194633337"
Received: from mfalkows-mobl.ger.corp.intel.com (HELO [10.246.17.246])
 ([10.246.17.246])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 08:41:35 -0800
Message-ID: <c16fb0e0-1f30-422e-9785-78ac0b8c4783@linux.intel.com>
Date: Fri, 5 Dec 2025 17:41:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] accel/amdxdna: Fix tail-pointer polling in
 mailbox_get_msg()
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com,
 mario.limonciello@amd.com
References: <20251204181603.793824-1-lizhi.hou@amd.com>
Content-Language: en-US
From: "Falkowski, Maciej" <maciej.falkowski@linux.intel.com>
In-Reply-To: <20251204181603.793824-1-lizhi.hou@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>

On 12/4/2025 7:16 PM, Lizhi Hou wrote:
> In mailbox_get_msg(), mailbox_reg_read_non_zero() is called to poll for a
> non-zero tail pointer. This assumed that a zero value indicates an error.
> However, certain corner cases legitimately produce a zero tail pointer.
> To handle these cases, remove mailbox_reg_read_non_zero(). The zero tail
> pointer will be treated as a valid rewind event.
>
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
>   drivers/accel/amdxdna/amdxdna_mailbox.c | 19 +------------------
>   1 file changed, 1 insertion(+), 18 deletions(-)
>
> diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c b/drivers/accel/amdxdna/amdxdna_mailbox.c
> index 858df97cd3fb..a60a85ce564c 100644
> --- a/drivers/accel/amdxdna/amdxdna_mailbox.c
> +++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
> @@ -112,22 +112,6 @@ static u32 mailbox_reg_read(struct mailbox_channel *mb_chann, u32 mbox_reg)
>   	return readl(ringbuf_addr);
>   }
>   
> -static int mailbox_reg_read_non_zero(struct mailbox_channel *mb_chann, u32 mbox_reg, u32 *val)
> -{
> -	struct xdna_mailbox_res *mb_res = &mb_chann->mb->res;
> -	void __iomem *ringbuf_addr = mb_res->mbox_base + mbox_reg;
> -	int ret, value;
> -
> -	/* Poll till value is not zero */
> -	ret = readx_poll_timeout(readl, ringbuf_addr, value,
> -				 value, 1 /* us */, 100);
> -	if (ret < 0)
> -		return ret;
> -
> -	*val = value;
> -	return 0;
> -}
> -
>   static inline void
>   mailbox_set_headptr(struct mailbox_channel *mb_chann, u32 headptr_val)
>   {
> @@ -286,8 +270,7 @@ static int mailbox_get_msg(struct mailbox_channel *mb_chann)
>   	u32 start_addr;
>   	int ret;
>   
> -	if (mailbox_reg_read_non_zero(mb_chann, mb_chann->res[CHAN_RES_I2X].mb_tail_ptr_reg, &tail))
> -		return -EINVAL;
> +	tail = mailbox_get_tailptr(mb_chann, CHAN_RES_I2X);
>   	head = mb_chann->i2x_head;
>   	ringbuf_size = mailbox_get_ringbuf_size(mb_chann, CHAN_RES_I2X);
>   	start_addr = mb_chann->res[CHAN_RES_I2X].rb_start_addr;
