Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58085919B7F
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 01:59:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F22FF10E098;
	Wed, 26 Jun 2024 23:59:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="KcRPMiBK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7734810E098
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 23:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=sgYM6lwzKouyTUa3YEQEjqMk2OfmUlxgF+rIcH1SYZM=; b=KcRPMiBKWGM78GYlWUEYrBeFrC
 R2sBZDqHBl8Uc9OjNooyz9R/DD5sFND5vFZ0FZ2cegVHmjV012zR4UQ5R8U5fAlwUgdWUtjOPeEsp
 6BdLeMq5wZmxrzzxWw0+lHOBqakZ3twyE86faPYQ4vQkrO0ZePwXDYpgJutZOogz9kRgVnv6uvq6A
 CQE/NRBBHiuVi8K9XTIE8/XA9Xyru/CcR8RRkWOlvG0haatWlWxaMHgS/Kbl2TLIeFP6FnjIEZwzx
 +eysRmr+6KSraILfaY9n1Qn+gMh2H+Ldnv2gfuahHiC0qbGMfd8qQ7IMUuD4gjjrf9Kr3o7UV1eCE
 2yxRvryg==;
Received: from [50.53.4.147] (helo=[192.168.254.15])
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1sMcXp-00000008ghU-3Zaf; Wed, 26 Jun 2024 23:59:21 +0000
Message-ID: <f7cf6002-239e-459f-a8ec-75cc0406fcc9@infradead.org>
Date: Wed, 26 Jun 2024 16:59:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 09/13] Documentation: core-api: Add math.h macros and
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
References: <20240607131900.3535250-1-devarsht@ti.com>
 <20240607133120.3556488-1-devarsht@ti.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240607133120.3556488-1-devarsht@ti.com>
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



On 6/7/24 6:31 AM, Devarsh Thakkar wrote:
> Add documentation for rounding, scaling, absolute value and 32-bit division
> related macros and functions exported by math.h header file.
> 
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
> V13: No change
> V12: Add Reviewed-by
> V11: Fix title for math function header
> V10: Patch introduced
> V1->V9 (No change)
>  Documentation/core-api/kernel-api.rst | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/core-api/kernel-api.rst b/Documentation/core-api/kernel-api.rst
> index ae92a2571388..7de494e76fa6 100644
> --- a/Documentation/core-api/kernel-api.rst
> +++ b/Documentation/core-api/kernel-api.rst
> @@ -185,6 +185,12 @@ Division Functions
>  .. kernel-doc:: lib/math/gcd.c
>     :export:
>  
> +Rounding, absolute value, division and 32-bit scaling functions
> +---------------------------------------------------------------
> +
> +.. kernel-doc:: include/linux/math.h
> +   :internal:
> +
>  UUID/GUID
>  ---------
>  

-- 
~Randy
