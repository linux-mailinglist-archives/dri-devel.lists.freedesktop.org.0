Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CABAB2E507
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 20:32:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 592A610E7C8;
	Wed, 20 Aug 2025 18:32:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="q/FjGWgG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6124810E7C8;
 Wed, 20 Aug 2025 18:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=/IcasXGt5PbdoVVXgghzry42yNZ+BKaeuG0k8SwqEiE=; b=q/FjGWgGcZoyCpEvqzRf8l3Zr/
 JIlfqELevVDHITw5RFmNo9AMXsyBB/1XndCSGlTd09RzWkrSjxKUJIjufaLYz8yxfwKpy8ND60NJs
 76hOsgpGJ+w0JikLmP6MoRsLeA1o9dfAEBPJvORLXkuEWebNamwm+TiBY4A3uaZ+rhmjKxj4UFaBg
 hZKIUQcipMHbmvUS2rvgor0hab0mUAzjR3Y34FzVMejhHia/4mMiFgK2cGU7j54FxNt8M8wez2KoO
 vyvtac4XHa1fdJm5170GVZz3r2HJ+QfgDdX+AwW+PcRxDvPmBvIDOlXXXC4jpx5TO5d5arqEghy9q
 ZHy/YFwA==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1uonbe-0000000EgzN-1F8t; Wed, 20 Aug 2025 18:32:18 +0000
Message-ID: <1fc93d62-eb77-46a6-964f-c0bc7348d482@infradead.org>
Date: Wed, 20 Aug 2025 11:32:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: gpu: Fix spelling mistakes
To: Rakuram Eswaran <rakuram.e96@gmail.com>, linux-doc@vger.kernel.org,
 alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 corbet@lwn.net
Cc: tzimmermann@suse.de, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, simona@ffwll.ch, siqueira@igalia.com,
 harry.wentland@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org
References: <20250820182259.11227-1-rakuram.e96@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250820182259.11227-1-rakuram.e96@gmail.com>
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

On 8/20/25 11:22 AM, Rakuram Eswaran wrote:
> Fixed following typos reported by Codespell
> 
> 1. filp ==> flip
> In Documentation/gpu/drm-mm.rst
> 

No, that's a "struct file pointer". filp is correct.
See include/drm/drm_gem.h

The others look good.

One more comment below.

> 
> Signed-off-by: Rakuram Eswaran <rakuram.e96@gmail.com>
> ---
>  Documentation/gpu/amdgpu/debugfs.rst                       | 4 ++--
>  Documentation/gpu/amdgpu/display/programming-model-dcn.rst | 2 +-
>  Documentation/gpu/amdgpu/process-isolation.rst             | 2 +-
>  Documentation/gpu/drm-mm.rst                               | 2 +-
>  Documentation/gpu/drm-uapi.rst                             | 2 +-
>  Documentation/gpu/todo.rst                                 | 4 ++--
>  6 files changed, 8 insertions(+), 8 deletions(-)
> 

> diff --git a/Documentation/gpu/amdgpu/process-isolation.rst b/Documentation/gpu/amdgpu/process-isolation.rst
> index 6b6d70e357a7..c1297a9e4d09 100644
> --- a/Documentation/gpu/amdgpu/process-isolation.rst
> +++ b/Documentation/gpu/amdgpu/process-isolation.rst
> @@ -26,7 +26,7 @@ Example of enabling enforce isolation on a GPU with multiple partitions:
>      $ cat /sys/class/drm/card0/device/enforce_isolation
>      1 0 1 0
>  
> -The output indicates that enforce isolation is enabled on zeroth and second parition and disabled on first and fourth parition.
> +The output indicates that enforce isolation is enabled on zeroth and second partition and disabled on first and fourth partition.
It looks like "fourth" should be "third" here.

-- 
~Randy

