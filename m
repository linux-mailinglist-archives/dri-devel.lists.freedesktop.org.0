Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 282578D55A6
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 00:45:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E22C10E514;
	Thu, 30 May 2024 22:45:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="cgv/Q7eC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 937EA10E514
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 22:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=e3NB/mDwRctn3iwAMjuc5/uFGUFjegxDUG7u7jpVJ+s=; b=cgv/Q7eC94kt5eEfPb5w5slwyv
 RTKpG43piRHMly9hzg+YvIAsIVZI03XQ79HeT3acLdWu8BGSwE3GPOvNHhUw0hG++yfArv0aVVJfr
 /ji7WJKmORZ0p9dNNwelSs2k4U9+LbZJbH3iQxTrHzPTX1JAS+t+wZm+ck++NOAWCmivP7PTLwCvn
 5VkBq7r6mxrdOaxy0BM8kOx9dEIL+wxp8TV6yO5QbOsXi23inDrq/1lSo8KS9JgCspxWeTCZzeOOg
 XMy6YPcjotgXy31GclMpcKiHeu5o+3/1/DGr9czv5/Of9674/JfkLINloooBQYADQTTjYKa7RdvN1
 Tl3kC3pg==;
Received: from [50.53.4.147] (helo=[192.168.254.15])
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1sCoVu-00000008b9H-1B8a; Thu, 30 May 2024 22:44:50 +0000
Message-ID: <4951656c-2d15-49f6-89d8-aa7b5c333ec7@infradead.org>
Date: Thu, 30 May 2024 15:44:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 07/11] Documentation: core-api: Add math.h macros and
 functions
To: Devarsh Thakkar <devarsht@ti.com>, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, benjamin.gaignard@collabora.com,
 sebastian.fricke@collabora.com, akpm@linux-foundation.org,
 gregkh@linuxfoundation.org, andriy.shevchenko@linux.intel.com,
 adobriyan@gmail.com, jani.nikula@intel.com, p.zabel@pengutronix.de,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 corbet@lwn.net, broonie@kernel.org, linux-doc@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com, praneeth@ti.com, nm@ti.com,
 vigneshr@ti.com, a-bhatia1@ti.com, j-luthra@ti.com, b-brnich@ti.com,
 detheridge@ti.com, p-mantena@ti.com, vijayp@ti.com, andrzej.p@collabora.com,
 nicolas@ndufresne.ca, davidgow@google.com, dlatypov@google.com
References: <20240530165925.2715837-1-devarsht@ti.com>
 <20240530171740.2763221-1-devarsht@ti.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240530171740.2763221-1-devarsht@ti.com>
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



On 5/30/24 10:17 AM, Devarsh Thakkar wrote:
> Add documentation for rounding, scaling, absolute value and difference,
> 32-bit division related macros and functions exported by math.h header
> file.
> 
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> ---
> V1->V9 (No change)
> V10: Patch introduced
> ---
>  Documentation/core-api/kernel-api.rst | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/core-api/kernel-api.rst b/Documentation/core-api/kernel-api.rst
> index ae92a2571388..fb467783d491 100644
> --- a/Documentation/core-api/kernel-api.rst
> +++ b/Documentation/core-api/kernel-api.rst
> @@ -185,6 +185,12 @@ Division Functions
>  .. kernel-doc:: lib/math/gcd.c
>     :export:
>  
> +Rounding, absolute value, scaling and 32bit division functions

                                         32-bit
please.

> +--------------------------------------------------------------
> +
> +.. kernel-doc:: include/linux/math.h
> +   :internal:
> +
>  UUID/GUID
>  ---------
>  

-- 
#Randy
https://people.kernel.org/tglx/notes-about-netiquette
https://subspace.kernel.org/etiquette.html
