Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B58AB52716
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 05:35:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D12B910E9FE;
	Thu, 11 Sep 2025 03:35:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="UxEqJs+m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 189CE10E09C
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 03:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=32AG34pAnZG3Yar61We5Dkbx6Ha1F8P9HswwXyA8pBA=; b=UxEqJs+maHdtoHkwgXTqEI0NHm
 /jACiHe6KLBV2tfShbg8Dbw0N/wllh8X59TgIFomtGlbENLPYYE1h56XdizjQt69x46wrWJyPI/7T
 ej5ACmgjiWOWuigLnhim08kzu5HQoz2ceLkC5sAKf3X4uM0fm9S0odBBv2iWF51brocJqaLEJnaPn
 xq7vq1FGv8K7XeXOs2Jmm561skLwDD54dxbPOElwGuGGoVkDdCu8SeKu/MRVtGFuCcCOQH2ijqVHo
 cX6Bf0lkPa433YwL0VNTuNgNCN20kRNBM6iQauYpfGeUZEPWDyEsFEb3lDDY0nPIvk4zz1/zq0WlH
 8nQJ5Vhg==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1uwY5h-00000000cXj-2TMx; Thu, 11 Sep 2025 03:35:21 +0000
Message-ID: <f2236555-9529-4586-a834-bb254513bd0b@infradead.org>
Date: Wed, 10 Sep 2025 20:35:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Documentation: fbcon: formatting cleanup and
 improvements
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux Framebuffer <linux-fbdev@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>
Cc: Helge Deller <deller@gmx.de>, Jonathan Corbet <corbet@lwn.net>
References: <20250909063744.30053-1-bagasdotme@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250909063744.30053-1-bagasdotme@gmail.com>
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



On 9/8/25 11:37 PM, Bagas Sanjaya wrote:
> Hi,
> 
> Here are reST formatting cleanup and improvements for fbcon documentation.
> The shortlog below should be self-explanatory.
> 
> This series is based on docs-next tree.
> 
> Enjoy!
> 
> Bagas Sanjaya (3):
>   Documentation: fbcon: Add boot options and attach/detach/unload
>     section headings
>   Documentation: fbcon: Reindent 8th step of attach/detach/unload
>   Documentation: fbcon: Use admonition directives
> 
>  Documentation/fb/fbcon.rst | 42 ++++++++++++++++++++++----------------
>  1 file changed, 24 insertions(+), 18 deletions(-)
> 
> 
> base-commit: 7e5a0fe4e8ae2eb341f8ebbee2b24231a58fc28b

For all 3 patches:

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

-- 
~Randy
