Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F9CA4D5DD
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 09:11:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D7AC10E511;
	Tue,  4 Mar 2025 08:11:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Xo5APdBg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B03F10E511
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 08:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1741075907;
 bh=PTleApijGcXJCM0OtIk1SVoikxBFpczb9jEcak3wAW8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Xo5APdBgPTTiQPYDNI9JFlnKyOz4H8I6/FyvtRONXY2zZx56J30trt0lt25bZaXBG
 L7ZoJHs5iB/XDDBMZm4P0gM2PdsDDdCkKSwM2d+01G2TLf8GVXWhiPpizy9LcOBFTA
 TplDCLRRxzTwhWaxqqf9OUmLFf0btdrUK9CFubIS0fXHYUnu71zhVdoXlH6P3I0Akz
 0mL5j+33n+3FOPpKJLbvLMBYhYOK30CMVjVUlHwChA5W/T7fqTdWWhBcBI/1YDJaFG
 RBDtVm+sYAdNVvaQ1KaBmuAAc+oLobuR7iwzsWH6lZ9dUaZ5vHUsMUh7PedLLUu8Ip
 6v5ljFY90ajgQ==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 948BD17E061D;
 Tue,  4 Mar 2025 09:11:46 +0100 (CET)
Date: Tue, 4 Mar 2025 09:11:41 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Ashley Smith <ashley.smith@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Heiko Stuebner
 <heiko@sntech.de>, kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/panthor: Update CS_STATUS_ defines to correct
 values
Message-ID: <20250304091141.50f21736@collabora.com>
In-Reply-To: <20250303180444.3768993-1-ashley.smith@collabora.com>
References: <20250303180444.3768993-1-ashley.smith@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Mon,  3 Mar 2025 18:04:32 +0000
Ashley Smith <ashley.smith@collabora.com> wrote:

> Values for SC_STATUS_BLOCKED_REASON_ are documented in the G610 "Odin"
> GPU specification (CS_STATUS_BLOCKED_REASON register).
> 
> This change updates the defines to the correct values.
> 
> Fixes: 2718d91816ee ("drm/panthor: Add the FW logical block")
> Signed-off-by: Ashley Smith <ashley.smith@collabora.com>

Adding my

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

back, so whoever ends up applying this patch doesn't have to add it
manually.

> ---
> Changes in v2:
>   - Rename _RES to _RESOURCE
> ---
>  drivers/gpu/drm/panthor/panthor_fw.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.h b/drivers/gpu/drm/panthor/panthor_fw.h
> index 22448abde992..6598d96c6d2a 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.h
> +++ b/drivers/gpu/drm/panthor/panthor_fw.h
> @@ -102,9 +102,9 @@ struct panthor_fw_cs_output_iface {
>  #define CS_STATUS_BLOCKED_REASON_SB_WAIT	1
>  #define CS_STATUS_BLOCKED_REASON_PROGRESS_WAIT	2
>  #define CS_STATUS_BLOCKED_REASON_SYNC_WAIT	3
> -#define CS_STATUS_BLOCKED_REASON_DEFERRED	5
> -#define CS_STATUS_BLOCKED_REASON_RES		6
> -#define CS_STATUS_BLOCKED_REASON_FLUSH		7
> +#define CS_STATUS_BLOCKED_REASON_DEFERRED	4
> +#define CS_STATUS_BLOCKED_REASON_RESOURCE	5
> +#define CS_STATUS_BLOCKED_REASON_FLUSH		6
>  #define CS_STATUS_BLOCKED_REASON_MASK		GENMASK(3, 0)
>  	u32 status_blocked_reason;
>  	u32 status_wait_sync_value_hi;
> 
> base-commit: 16e57a72780931c3c70dbc928aeee4a0518075de

