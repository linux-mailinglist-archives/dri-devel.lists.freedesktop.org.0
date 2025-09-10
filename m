Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFE5B5188F
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 15:59:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2B3D10E926;
	Wed, 10 Sep 2025 13:59:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4D3BF10E926
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 13:59:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93C7116F8;
 Wed, 10 Sep 2025 06:59:06 -0700 (PDT)
Received: from [10.1.25.55] (e122027.cambridge.arm.com [10.1.25.55])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C10343F694;
 Wed, 10 Sep 2025 06:59:09 -0700 (PDT)
Message-ID: <3da64b80-ecdc-4b86-a4ca-3b4a9d75d9c4@arm.com>
Date: Wed, 10 Sep 2025 14:59:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 07/10] drm/panthor: move panthor_devfreq struct to
 header
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Jassi Brar <jassisinghbrar@gmail.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20250905-mt8196-gpufreq-v1-0-7b6c2d6be221@collabora.com>
 <20250905-mt8196-gpufreq-v1-7-7b6c2d6be221@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250905-mt8196-gpufreq-v1-7-7b6c2d6be221@collabora.com>
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

On 05/09/2025 11:23, Nicolas Frattaroli wrote:
> In order to make files other than panthor_devfreq.c be able to touch the
> members of a panthor_devfreq instance, it needs to live somewhere other
> than the .c file.
> 
> Move it into the panthor_devfreq.h header, so that the upcoming MediaTek
> MFG devfreq can use it as well.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_devfreq.c | 32 ---------------------------
>  drivers/gpu/drm/panthor/panthor_devfreq.h | 36 ++++++++++++++++++++++++++++++-
>  2 files changed, 35 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/panthor/panthor_devfreq.c
> index 8903f60c0a3f06313ac2008791c210ff32b6bd52..02eb3ca15d1874e1cbafc6b614b196c5cc75b6a1 100644
> --- a/drivers/gpu/drm/panthor/panthor_devfreq.c
> +++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
> @@ -12,38 +12,6 @@
>  #include "panthor_devfreq.h"
>  #include "panthor_device.h"
>  
> -/**
> - * struct panthor_devfreq - Device frequency management
> - */
> -struct panthor_devfreq {
> -	/** @devfreq: devfreq device. */
> -	struct devfreq *devfreq;
> -
> -	/** @gov_data: Governor data. */
> -	struct devfreq_simple_ondemand_data gov_data;
> -
> -	/** @busy_time: Busy time. */
> -	ktime_t busy_time;
> -
> -	/** @idle_time: Idle time. */
> -	ktime_t idle_time;
> -
> -	/** @time_last_update: Last update time. */
> -	ktime_t time_last_update;
> -
> -	/** @last_busy_state: True if the GPU was busy last time we updated the state. */
> -	bool last_busy_state;
> -
> -	/**
> -	 * @lock: Lock used to protect busy_time, idle_time, time_last_update and
> -	 * last_busy_state.
> -	 *
> -	 * These fields can be accessed concurrently by panthor_devfreq_get_dev_status()
> -	 * and panthor_devfreq_record_{busy,idle}().
> -	 */
> -	spinlock_t lock;
> -};
> -
>  static void panthor_devfreq_update_utilization(struct panthor_devfreq *pdevfreq)
>  {
>  	ktime_t now, last;
> diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.h b/drivers/gpu/drm/panthor/panthor_devfreq.h
> index f8e29e02f66cb3281ed4bb4c75cda9bd4df82b92..e8b5ccddd45c52ee3215e9c84c6ebd9109640282 100644
> --- a/drivers/gpu/drm/panthor/panthor_devfreq.h
> +++ b/drivers/gpu/drm/panthor/panthor_devfreq.h
> @@ -4,11 +4,45 @@
>  #ifndef __PANTHOR_DEVFREQ_H__
>  #define __PANTHOR_DEVFREQ_H__
>  
> +#include <linux/devfreq.h>
> +
>  struct devfreq;
>  struct thermal_cooling_device;
>  
>  struct panthor_device;
> -struct panthor_devfreq;
> +
> +/**
> + * struct panthor_devfreq - Device frequency management
> + */
> +struct panthor_devfreq {
> +	/** @devfreq: devfreq device. */
> +	struct devfreq *devfreq;
> +
> +	/** @gov_data: Governor data. */
> +	struct devfreq_simple_ondemand_data gov_data;
> +
> +	/** @busy_time: Busy time. */
> +	ktime_t busy_time;
> +
> +	/** @idle_time: Idle time. */
> +	ktime_t idle_time;
> +
> +	/** @time_last_update: Last update time. */
> +	ktime_t time_last_update;
> +
> +	/** @last_busy_state: True if the GPU was busy last time we updated the state. */
> +	bool last_busy_state;
> +
> +	/**
> +	 * @lock: Lock used to protect busy_time, idle_time, time_last_update and
> +	 * last_busy_state.
> +	 *
> +	 * These fields can be accessed concurrently by panthor_devfreq_get_dev_status()
> +	 * and panthor_devfreq_record_{busy,idle}().
> +	 */
> +	spinlock_t lock;
> +};
> +
>  
>  int panthor_devfreq_init(struct panthor_device *ptdev);
>  
> 

