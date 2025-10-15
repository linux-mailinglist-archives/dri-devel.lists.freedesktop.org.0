Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2497BE0C69
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 23:16:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C23010E8FA;
	Wed, 15 Oct 2025 21:15:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="RnkZIvLL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F04510E8FA
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 21:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=OsIzzSgIyHHVfEtzgbmUMNVpppKlYHA6ALdxJJpPxbY=; b=RnkZIvLLV4lmf3DXRCNoXIhmjP
 a+VRgIg4zXKorvo7Li9rE3AVOS5LFIroAKhqNo1zTZKIcy0gBfXC2qGHsf8QPgTi23EbPWzqCmbim
 zxbvgmYhjHkYtKz5EIWJpHf9HrdhTSIF8Fh4nw1EaNkW3rYNDnYZFsA75kfNvdqN+yB+XK//X6Qy/
 ZkZ7y67qSa99p4mBf3CFAXJAP2HxA4f0I+axsl7azxkzJWbl3xVIMn0DpXYtnfCa1BFdKD5dZS1L9
 9NZhipo7ZVdvyf8ClkucidLNjbW78l295FdmRpwO8J/cSZlLefBlLkMhyZSnXsw4TNKHR8wWnxyJK
 KGgurUqA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1v98qg-00000002vdI-3oTQ; Wed, 15 Oct 2025 21:15:54 +0000
Message-ID: <0389eec6-a2f3-44f2-9101-c4794c898f96@infradead.org>
Date: Wed, 15 Oct 2025 14:15:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] htmldocs: userspace-api/dma-buf-heaps.rst: fix block
 quote warning
To: Kriish Sharma <kriish.sharma2006@gmail.com>, sumit.semwal@linaro.org,
 benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com,
 tjmercier@google.com, corbet@lwn.net
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251015183402.1649988-1-kriish.sharma2006@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251015183402.1649988-1-kriish.sharma2006@gmail.com>
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



On 10/15/25 11:34 AM, Kriish Sharma wrote:
> Fix the following warning encountered when running `make htmldocs`:
> 
>   Documentation/userspace-api/dma-buf-heaps.rst:29: WARNING: Block quote ends without a blank line; unexpected unindent
> 
> Added a blank line before the "Naming Convention" heading to comply with reST
> 
> Fixes: 1fdbb3ff1233 ("Add linux-next specific files for 20251015")
> Signed-off-by: Kriish Sharma <kriish.sharma2006@gmail.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  Documentation/userspace-api/dma-buf-heaps.rst | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentation/userspace-api/dma-buf-heaps.rst
> index a0979440d2a4..c0035dc257e0 100644
> --- a/Documentation/userspace-api/dma-buf-heaps.rst
> +++ b/Documentation/userspace-api/dma-buf-heaps.rst
> @@ -26,6 +26,7 @@ following heaps:
>     ``DMABUF_HEAPS_CMA_LEGACY`` Kconfig option is set, a duplicate node is
>     created following legacy naming conventions; the legacy name might be
>     ``reserved``, ``linux,cma``, or ``default-pool``.
> +
>  Naming Convention
>  =================
>  

-- 
~Randy
