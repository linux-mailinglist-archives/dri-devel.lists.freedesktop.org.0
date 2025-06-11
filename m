Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D37EAAD48E6
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 04:31:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E23F310E036;
	Wed, 11 Jun 2025 02:31:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="gkOjWuSP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C640510E140;
 Wed, 11 Jun 2025 02:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=uvt9EeGWy3wqr+k+UjVs97XuH58Op+Tg12f52xG4chE=; b=gkOjWuSP0yTsD/8ydglyIlHDP3
 ZwmImnWA85s/I5MTDyxlweenVksfg+Duh1eVUar0eEgl2jKzqiUQEGJmD/+OsbgOyNlfq85kMzlSK
 9uxZ3d86l34pcv9eGo8SzrBX4yq7nXiNiLb6xAabD5EgLNRcwOP7CWhG6J2tG9pLonFDuEdXBtsXM
 d/0FF9ljqLk3WH5R6rXaTAqtBnmsR0/1PJbRz21lvr1P+KT+FwtxS7apEvIpxVTprAKn8RB3ps//W
 vtJHoyaHNn9pmiecRZ2gDtd3QdWoLT3boc+msPJ9zyheR+k9gqJ7wrQ3QE8JuA3AxmwmAvlncPguL
 QF3Whctw==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
 by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1uPBFO-000000024qV-1ClW; Wed, 11 Jun 2025 02:31:26 +0000
Message-ID: <8c8d82db-b8a1-481e-81c2-eeaa1ea0830d@infradead.org>
Date: Tue, 10 Jun 2025 19:31:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Documentation: nouveau: Update GSP message queue
 kernel-doc reference
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Nouveau <nouveau@lists.freedesktop.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, Dave Airlie <airlied@redhat.com>,
 Ben Skeggs <bskeggs@nvidia.com>, Timur Tabi <ttabi@nvidia.com>
References: <20250611020805.22418-2-bagasdotme@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250611020805.22418-2-bagasdotme@gmail.com>
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



On 6/10/25 7:08 PM, Bagas Sanjaya wrote:
> GSP message queue docs has been moved following RPC handling split in
> 8a8b1ec5261f20 ("drm/nouveau/gsp: split rpc handling out on its own"),
> before GSP-RM implementation is versioned in c472d828348caf
> ("drm/nouveau/gsp: move subdev/engine impls to subdev/gsp/rm/r535/").
> However, the kernel-doc reference in nouveau docs is left behind, which
> triggers htmldocs warnings:
> 
> ERROR: Cannot find file ./drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> WARNING: No kernel-doc for file ./drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> 
> Update the reference.
> 
> Fixes: c472d828348c ("drm/nouveau/gsp: move subdev/engine impls to subdev/gsp/rm/r535/")
> Fixes: 8a8b1ec5261f ("drm/nouveau/gsp: split rpc handling out on its own")
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
> Changes since v1 [1]:
> 
>   - Correct GSP kernel-doc reference file (Randy)
> 
> [1]: https://lore.kernel.org/linux-doc/20250610065258.41467-1-bagasdotme@gmail.com/
> 
>  Documentation/gpu/nouveau.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/gpu/nouveau.rst b/Documentation/gpu/nouveau.rst
> index b8c801e0068cb0..cab2e81013bc5f 100644
> --- a/Documentation/gpu/nouveau.rst
> +++ b/Documentation/gpu/nouveau.rst
> @@ -25,7 +25,7 @@ providing a consistent API to upper layers of the driver stack.
>  GSP Support
>  ------------------------
>  
> -.. kernel-doc:: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> +.. kernel-doc:: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c
>     :doc: GSP message queue element
>  
>  .. kernel-doc:: drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> 
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494

-- 
~Randy
