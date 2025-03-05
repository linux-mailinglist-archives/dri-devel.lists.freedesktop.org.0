Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B11A4FC6B
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 11:42:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E30689128;
	Wed,  5 Mar 2025 10:42:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B109B89128
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 10:42:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C1E57FEC;
 Wed,  5 Mar 2025 02:42:23 -0800 (PST)
Received: from [10.57.67.16] (unknown [10.57.67.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 215303F673;
 Wed,  5 Mar 2025 02:42:07 -0800 (PST)
Message-ID: <a5ba7aed-a7ab-4471-8c46-42baf056b8c0@arm.com>
Date: Wed, 5 Mar 2025 10:42:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/panthor: Update CS_STATUS_ defines to correct
 values
To: Ashley Smith <ashley.smith@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250303180444.3768993-1-ashley.smith@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250303180444.3768993-1-ashley.smith@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/03/2025 18:04, Ashley Smith wrote:
> Values for SC_STATUS_BLOCKED_REASON_ are documented in the G610 "Odin"
> GPU specification (CS_STATUS_BLOCKED_REASON register).
> 
> This change updates the defines to the correct values.
> 
> Fixes: 2718d91816ee ("drm/panthor: Add the FW logical block")
> Signed-off-by: Ashley Smith <ashley.smith@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

I'll push this to drm-misc-next.

Steve

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

