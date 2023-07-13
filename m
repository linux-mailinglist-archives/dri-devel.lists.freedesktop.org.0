Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8EA752AB5
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 21:05:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFD6310E76F;
	Thu, 13 Jul 2023 19:05:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C6A310E770;
 Thu, 13 Jul 2023 19:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=Tunyxm7225nRlfSTHxgTZRKdYPHBEXYuY6MWqVIZLtA=; b=v9XsH4mAkY82rUYyHnv9cyZivu
 eTM5svjbjBnJMSPXncAe6D+e21qhbDQy3561717YRHOWE6LJXq6t2Das0jW3nywXeYg2Nc0Lj4elh
 Rqz35n6SJy4/VfFnXrB+ysqGYzkGrlIKsPQMPS+jhSe7vqhbglAkHaFZ8eEdkWnGBndF9W8It/QDl
 +Z3eJvkJ71nZghLJtjS3IEtTRKpGVAwW3auJiCct/mpJbaq8O+iP2FFy1LScGhNAyUvMNv6Y9uWWD
 qT4qor6+G4MkeIAe1TasFzBO7DPHFLCflul6ixFPPxOu6YQgkDWXcBc4BvhmFMbdwNDYFVfAvtoNV
 002c3+rw==;
Received: from [2601:1c2:980:9ec0::2764]
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qK1cW-004Chy-22; Thu, 13 Jul 2023 19:04:56 +0000
Message-ID: <07f0c6ac-f195-e598-4649-e88ad5e76005@infradead.org>
Date: Thu, 13 Jul 2023 12:04:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 20/21] config TEST_DYNAMIC_DEBUG default m
Content-Language: en-US
To: Jim Cromie <jim.cromie@gmail.com>, jbaron@akamai.com,
 daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20230713163626.31338-1-jim.cromie@gmail.com>
 <20230713163626.31338-21-jim.cromie@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230713163626.31338-21-jim.cromie@gmail.com>
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
Cc: jani.nikula@intel.com, gregkh@linuxfoundation.org, seanpaul@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jim,

On 7/13/23 09:36, Jim Cromie wrote:
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> ---
>  lib/Kconfig.debug | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index d4fbbcc395d2..82d11ac63758 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -2696,13 +2696,14 @@ config TEST_STATIC_KEYS
>  
>  config TEST_DYNAMIC_DEBUG
>  	tristate "Build test-dynamic-debug module"
> +	default m

You need to justify such a change, and since it's not required
for running the system, I don't think it should be 'm'.

>  	depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
>  	help
>  	  This module works/demo's the dyndbg's classmap API, by
>  	  creating 2 classes: a DISJOINT classmap (like DRM.debug)
>  	  and a LEVELS/VERBOSE classmap (where 2>1).
>  
> -	  If unsure, say N.
> +	  If unsure, say N.  If bored/curious, say M
>  
>  config TEST_KMOD
>  	tristate "kmod stress tester"

-- 
~Randy
