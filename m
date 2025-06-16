Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4461ADA6A8
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 05:05:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E76C10E036;
	Mon, 16 Jun 2025 03:05:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="JGgWzD73";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D61F410E036
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 03:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=r39SR+iYOnU6Tptcpr3GxcMEhIdvdrMkRtTp26UKitU=; b=JGgWzD73KSGpQXt23KGBF6q05e
 JTM2DsY2r5Dy65wbPP69S5cW7pDc3DnU4qzOAjp6rErRjhrMvLj/k5Uz8Xk1pY5PnbfD8uvbdD8MG
 TN0Lc1nTibAv04NAfHPM5/H/tmOASQ4c1OoNWsTFmphmp5fSLJSmHafFXXceUuohQRAwKRckWyNIp
 nc3k7T1/reqWlk+IYnMGuvNn/nfxQM8MidZwPqMVOfehR/V7oAfBQU9i6H4no02FkkG1WLShdJISJ
 RQEpM5YnyJbtxg6j9jDZQITiOfYfe9JbzgwDxoPnDnKL6QXRPKMhUs5OSj8ozS4TOve44UTgzoTIN
 ubdsa7lA==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
 by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1uR09b-0000000FUVX-1sBg; Mon, 16 Jun 2025 03:04:59 +0000
Message-ID: <217e3774-8a28-4adc-b2df-a31b6ba5a382@infradead.org>
Date: Sun, 15 Jun 2025 20:04:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: nouveau: remove invalid kernel-doc reference to
 r535.c
To: HyeonSu Jeon <dev.hyeonsu.jeon@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, corbet@lwn.net
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250616021742.8304-1-dev.hyeonsu.jeon@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250616021742.8304-1-dev.hyeonsu.jeon@gmail.com>
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

Hi,

On 6/15/25 7:17 PM, HyeonSu Jeon wrote:
> The file drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c does not exist
> in the tree, but is referenced in gsp.rst via a kernel-doc directive.
> This causes an error during the documentation build
> 
> Removing this refernce resolves the error
> 
> Signed-off-by: HyeonSu Jeon <dev.hyeonsu.jeon@gmail.com>

Thanks for your patch.
A previous patch has already been applied to drm-misc-fixes:

https://lore.kernel.org/linux-doc/20250611020805.22418-2-bagasdotme@gmail.com/

> ---
>  Documentation/gpu/nouveau.rst | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/Documentation/gpu/nouveau.rst b/Documentation/gpu/nouveau.rst
> index b8c801e0068c..cab4a8eda850 100644
> --- a/Documentation/gpu/nouveau.rst
> +++ b/Documentation/gpu/nouveau.rst
> @@ -25,8 +25,5 @@ providing a consistent API to upper layers of the driver stack.
>  GSP Support
>  ------------------------
>  
> -.. kernel-doc:: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> -   :doc: GSP message queue element
> -
>  .. kernel-doc:: drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
>     :doc: GSP message handling policy

-- 
~Randy

