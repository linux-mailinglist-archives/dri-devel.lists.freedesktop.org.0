Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B81871449
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 04:30:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A6BF10EAB0;
	Tue,  5 Mar 2024 03:30:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="wTMaOrkX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 500DB10EAB0
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 03:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=QZ3W4z58IooHaAxA8YZpZxc7aOB5iVQu5qY45wja7mY=; b=wTMaOrkXj2P9HGABDzqJSFQ+uJ
 bMKQC/V5qTAwsuy5ogvT86+l1P+vT4kWzwSSXQv++yLRcuc6CCk4Df+dumNmdO7jiYBHUsk4Qh/g+
 CFnDBiQdTEA/UMVACn1l8uFq2cGvH1hrHR2X3EVxZIm2/lDYBvs3KmFJ/XKGPtVOHbqiWpTAcwlKX
 D4SMox0VZccZWUIDlAgUz+M3QwP/DJ38rSfTA3cUZTpWTsVeN9i3Z0d8YGx9I+59zFgF5TV51q39+
 eyfJe98Kvh2E4FPPuTLLm/ZX1IUALnGIVB2ETV+UaFvgXytctPZFqmlnhMRmAe4YbMSUzqvU6WUn3
 qk3ePa/Q==;
Received: from [50.53.50.0] (helo=[192.168.254.15])
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1rhLVL-0000000BhjS-2FQP; Tue, 05 Mar 2024 03:30:11 +0000
Message-ID: <65928197-1a97-4606-bc68-867e8590c6f5@infradead.org>
Date: Mon, 4 Mar 2024 19:30:08 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Removed funcs field description for kernel doc warning.
Content-Language: en-US
To: R SUNDAR <prosunofficial@gmail.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240305024857.12783-1-prosunofficial@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240305024857.12783-1-prosunofficial@gmail.com>
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

Hi--

On 3/4/24 18:48, R SUNDAR wrote:
> /include/drm/drm_gem_vram_helper.h:185: warning: Excess struct member 'funcs' description in 'drm_vram_mm'
> 
> Signed-off-by: R SUNDAR <prosunofficial@gmail.com>

or
https://lore.kernel.org/lkml/20240204145348.56924-1-agarwala.kartik@gmail.com/
or
https://lore.kernel.org/lkml/20240106032957.1195-1-rdunlap@infradead.org/


but in any case I would like to see any one of these patches
merged. Thanks.

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>


> ---
>  include/drm/drm_gem_vram_helper.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
> index e18429f09e53..c89c9bafeb44 100644
> --- a/include/drm/drm_gem_vram_helper.h
> +++ b/include/drm/drm_gem_vram_helper.h
> @@ -170,7 +170,6 @@ void drm_gem_vram_simple_display_pipe_cleanup_fb(
>   * @vram_base:	Base address of the managed video memory
>   * @vram_size:	Size of the managed video memory in bytes
>   * @bdev:	The TTM BO device.
> - * @funcs:	TTM BO functions
>   *
>   * The fields &struct drm_vram_mm.vram_base and
>   * &struct drm_vram_mm.vrm_size are managed by VRAM MM, but are

-- 
#Randy
