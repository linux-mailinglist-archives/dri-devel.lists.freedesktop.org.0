Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5E1B2EBA5
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 05:06:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BE2810E374;
	Thu, 21 Aug 2025 03:06:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="d7HeN6U1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFD6210E374;
 Thu, 21 Aug 2025 03:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=hyX8lYPAronULWeVXJ+quZoKMwRITcvWkFrMcTYt3L4=; b=d7HeN6U1qx7JRmLdDoHfTDeEQL
 ozU0H8deFujGarIRqlpaRlA3847cObTumeb/HMHK+k8/3P5fcjDJsMp9wu9n64nfbIcJuiAbkP9ZY
 Hk7toPD+Z11Ss5F/wQ02z12RaXemmkuW6qg4DhvdUb6x+nkNdaN/7K2WmqtYsxjN+Sn2MV/EvS+cI
 fBwkEjVZDl3ivJmXvUHrGJIjH09JbzehGu8bW6m9vVdaNGqddEjVz7cppfLo1aSltyXoK2uFGWFZG
 FeA7T2B4wJHkCzqEPnYCUsYXMpS+z7qHtU8KAIyGj6KEIwyo8VrTqlfIEH4RyJnq7eAiw2X+OHiSS
 LxY5lnLw==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1uovd9-0000000Fayb-3xBh; Thu, 21 Aug 2025 03:06:23 +0000
Message-ID: <0254008f-1cdf-480f-ad6f-8f002b35d754@infradead.org>
Date: Wed, 20 Aug 2025 20:06:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] docs: gpu: amdgpu: Fix spelling in amdgpu
 documentation
To: Rakuram Eswaran <rakuram.e96@gmail.com>, linux-doc@vger.kernel.org,
 alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 corbet@lwn.net
Cc: tzimmermann@suse.de, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, simona@ffwll.ch, siqueira@igalia.com,
 harry.wentland@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org
References: <20250821025957.22546-1-rakuram.e96@gmail.com>
 <20250821025957.22546-2-rakuram.e96@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250821025957.22546-2-rakuram.e96@gmail.com>
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



On 8/20/25 7:59 PM, Rakuram Eswaran wrote:
> Fixed following typos reported by Codespell
> 
> 1. propogated ==> propagated
>    aperatures ==> apertures
> In Documentation/gpu/amdgpu/debugfs.rst
> 
> 2. parition ==> partition
> In Documentation/gpu/amdgpu/process-isolation.rst
> 
> 3. conections ==> connections
> In Documentation/gpu/amdgpu/display/programming-model-dcn.rst
> 
> In addition to above,
> Fixed wrong bit-partition naming in gpu/amdgpu/process-isolation.rst
> from "fourth" partition to "third" partition.
> 
> Suggested-by: Randy Dunlap <rdunlap@infradead.org>
> Suggested-by: Alexander Deucher <Alexander.Deucher@amd.com>
> Signed-off-by: Rakuram Eswaran <rakuram.e96@gmail.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  Documentation/gpu/amdgpu/debugfs.rst                       | 4 ++--
>  Documentation/gpu/amdgpu/display/programming-model-dcn.rst | 2 +-
>  Documentation/gpu/amdgpu/process-isolation.rst             | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)


-- 
~Randy
