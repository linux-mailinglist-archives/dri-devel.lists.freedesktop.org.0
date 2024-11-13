Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1F19C716C
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2024 14:52:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E9C010E701;
	Wed, 13 Nov 2024 13:52:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C4A0D10E701
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2024 13:52:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F7001655;
 Wed, 13 Nov 2024 05:53:12 -0800 (PST)
Received: from [10.1.27.47] (e122027.cambridge.arm.com [10.1.27.47])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BCDDD3F6A8;
 Wed, 13 Nov 2024 05:52:40 -0800 (PST)
Message-ID: <ff468880-2435-4674-9f06-91bd0cdfe856@arm.com>
Date: Wed, 13 Nov 2024 13:52:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panfrost: Add GPU ID for MT8188 Mali-G57 MC3
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 boris.brezillon@collabora.com
Cc: robh@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
References: <20241113112622.123044-1-angelogioacchino.delregno@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20241113112622.123044-1-angelogioacchino.delregno@collabora.com>
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

On 13/11/2024 11:26, AngeloGioacchino Del Regno wrote:
> The MediaTek MT8188 SoC has a Mali-G57 MC3 GPU and, similarly to
> MT8192, it has yet another special GPU ID.
> 
> Add the GPU ID to the list and treat it as a standard Mali-G57.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Looks reasonable to me - I wonder how many different MediaTek specials
there are out there ;)

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_gpu.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> index f5abde3866fb..174e190ba40f 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> @@ -236,6 +236,10 @@ static const struct panfrost_model gpu_models[] = {
>  	 */
>  	GPU_MODEL(g57, 0x9003,
>  		GPU_REV(g57, 0, 0)),
> +
> +	/* MediaTek MT8188 Mali-G57 MC3 */
> +	GPU_MODEL(g57, 0x9093,
> +		GPU_REV(g57, 0, 0)),
>  };
>  
>  static void panfrost_gpu_init_features(struct panfrost_device *pfdev)

