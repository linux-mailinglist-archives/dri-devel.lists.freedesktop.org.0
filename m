Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D913BC2A17E
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 06:52:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20A7410E157;
	Mon,  3 Nov 2025 05:52:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="khSwx0qi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8560C10E157
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 05:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=npUn9EeL2QuLeu5AifQOdRVkKhKoYbwmtWuoTt9mCZE=; b=khSwx0qioRXSn5hfOK+VfF+WP/
 Ez0PnWbSnLKFEhRo+tuCc4asdVSvfPuzSSpoGViOsUZ2fcKa6HoiUJo2iTX+4V8+MFk8PsGyWR8F0
 7xkU5Ot6U7/3nmFzC13guhuJtnYh4NNtmOXxalmpI0kzP+U4v4lQ9R7XWUYu9AR+Nl1eOhYKB3c4d
 dA62guw+V6t+Azk1/LVmqjKedqBs/BNcfzza0NWF8s6ulq2BGjhH8cpnkmGdw0dJa7Bu0J5Eul04O
 G3YLpyMWxFcNQP4PpfIAuhKhIyHNlFOxmIWY67Y61o4BT4pEqmHV0YHPWXAKBNZa72VmC0u0zeYNy
 gRcVrlbQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vFnU3-00000009FWt-2M7x; Mon, 03 Nov 2025 05:52:03 +0000
Message-ID: <4ee26086-50d5-4417-b8c2-17bf24c0d1f4@infradead.org>
Date: Sun, 2 Nov 2025 21:52:02 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: gpu: Limit toctree depth
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>
References: <20251031023521.12391-1-bagasdotme@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251031023521.12391-1-bagasdotme@gmail.com>
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



On 10/30/25 7:35 PM, Bagas Sanjaya wrote:
> Currently, gpu docs toctree lists all headings across the documentation.
> Don't spoil these details by limiting the toctree depth to 2.
> 
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  Documentation/gpu/index.rst | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/gpu/index.rst b/Documentation/gpu/index.rst
> index 7dcb15850afdb2..e6207b31f8dbd9 100644
> --- a/Documentation/gpu/index.rst
> +++ b/Documentation/gpu/index.rst
> @@ -3,6 +3,7 @@ GPU Driver Developer's Guide
>  ============================
>  
>  .. toctree::
> +   :maxdepth: 2
>  
>     introduction
>     drm-internals
> 
> base-commit: 6fb7f298883246e21f60f971065adcb789ae6eba

-- 
~Randy
