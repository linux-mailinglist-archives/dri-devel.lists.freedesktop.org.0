Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F29AE78F0A4
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 17:54:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9390910E0BB;
	Thu, 31 Aug 2023 15:54:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4162410E0BB;
 Thu, 31 Aug 2023 15:54:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BFD42C15;
 Thu, 31 Aug 2023 08:54:47 -0700 (PDT)
Received: from [10.1.26.48] (e122027.cambridge.arm.com [10.1.26.48])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A14353F64C;
 Thu, 31 Aug 2023 08:54:04 -0700 (PDT)
Message-ID: <1588defa-d196-5c3e-5d5b-4d6aaa0a60d5@arm.com>
Date: Thu, 31 Aug 2023 16:54:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/6] drm/panfrost: Add cycle count GPU register
 definitions
Content-Language: en-GB
To: =?UTF-8?Q?Adri=c3=a1n_Larumbe?= <adrian.larumbe@collabora.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, robh@kernel.org
References: <20230824013604.466224-1-adrian.larumbe@collabora.com>
 <20230824013604.466224-2-adrian.larumbe@collabora.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20230824013604.466224-2-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, healych@amazon.com, kernel@collabora.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/08/2023 02:34, Adrián Larumbe wrote:
> These GPU registers will be used when programming the cycle counter, which
> we need for providing accurate fdinfo drm-cycles values to user space.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_regs.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_regs.h b/drivers/gpu/drm/panfrost/panfrost_regs.h
> index 919f44ac853d..55ec807550b3 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_regs.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_regs.h
> @@ -46,6 +46,8 @@
>  #define   GPU_CMD_SOFT_RESET		0x01
>  #define   GPU_CMD_PERFCNT_CLEAR		0x03
>  #define   GPU_CMD_PERFCNT_SAMPLE	0x04
> +#define   GPU_CMD_CYCLE_COUNT_START	0x05
> +#define   GPU_CMD_CYCLE_COUNT_STOP	0x06
>  #define   GPU_CMD_CLEAN_CACHES		0x07
>  #define   GPU_CMD_CLEAN_INV_CACHES	0x08
>  #define GPU_STATUS			0x34
> @@ -73,6 +75,9 @@
>  #define GPU_PRFCNT_TILER_EN		0x74
>  #define GPU_PRFCNT_MMU_L2_EN		0x7c
>  
> +#define GPU_CYCLE_COUNT_LO		0x90
> +#define GPU_CYCLE_COUNT_HI		0x94
> +
>  #define GPU_THREAD_MAX_THREADS		0x0A0	/* (RO) Maximum number of threads per core */
>  #define GPU_THREAD_MAX_WORKGROUP_SIZE	0x0A4	/* (RO) Maximum workgroup size */
>  #define GPU_THREAD_MAX_BARRIER_SIZE	0x0A8	/* (RO) Maximum threads waiting at a barrier */

