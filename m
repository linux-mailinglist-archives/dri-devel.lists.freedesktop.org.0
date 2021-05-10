Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8324378C51
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 14:36:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9FEC89F89;
	Mon, 10 May 2021 12:36:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7CB1389F89;
 Mon, 10 May 2021 12:36:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 89F4715BE;
 Mon, 10 May 2021 05:36:21 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 69A1E3F73B;
 Mon, 10 May 2021 05:36:21 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 29145683931; Mon, 10 May 2021 13:36:20 +0100 (BST)
Date: Mon, 10 May 2021 13:36:20 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH 44/53] docs: gpu: avoid using UTF-8 chars
Message-ID: <YJkoxKE2+hG5BsPI@e110455-lin.cambridge.arm.com>
References: <cover.1620641727.git.mchehab+huawei@kernel.org>
 <36bc1118467da645a57515743c9f6c1cd86abe8c.1620641727.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <36bc1118467da645a57515743c9f6c1cd86abe8c.1620641727.git.mchehab+huawei@kernel.org>
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
Cc: Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mali DP Maintainers <malidp@foss.arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 10, 2021 at 12:26:56PM +0200, Mauro Carvalho Chehab wrote:
> While UTF-8 characters can be used at the Linux documentation,
> the best is to use them only when ASCII doesn't offer a good replacement.
> So, replace the occurences of the following UTF-8 characters:
> 
> 	- U+2019 ('’'): RIGHT SINGLE QUOTATION MARK
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/gpu/i915.rst       | 2 +-
>  Documentation/gpu/komeda-kms.rst | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
> index 486c720f3890..2cbf54460b48 100644
> --- a/Documentation/gpu/i915.rst
> +++ b/Documentation/gpu/i915.rst
> @@ -361,7 +361,7 @@ Locking Guidelines
>  	  real bad.
>  
>  #. Do not nest different lru/memory manager locks within each other.
> -   Take them in turn to update memory allocations, relying on the object’s
> +   Take them in turn to update memory allocations, relying on the object's
>     dma_resv ww_mutex to serialize against other operations.
>  
>  #. The suggestion for lru/memory managers locks is that they are small
> diff --git a/Documentation/gpu/komeda-kms.rst b/Documentation/gpu/komeda-kms.rst
> index eb693c857e2d..c2067678e92c 100644
> --- a/Documentation/gpu/komeda-kms.rst
> +++ b/Documentation/gpu/komeda-kms.rst
> @@ -324,7 +324,7 @@ the control-abilites of device.
>  
>  We have &komeda_dev, &komeda_pipeline, &komeda_component. Now fill devices with
>  pipelines. Since komeda is not for D71 only but also intended for later products,
> -of course we’d better share as much as possible between different products. To
> +of course we'd better share as much as possible between different products. To
>  achieve this, split the komeda device into two layers: CORE and CHIP.
>  
>  -   CORE: for common features and capabilities handling.

Acked-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> -- 
> 2.30.2
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
