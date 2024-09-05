Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D1896E423
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 22:33:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E66E10E94D;
	Thu,  5 Sep 2024 20:33:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lwn.net header.i=@lwn.net header.b="P7oN37b3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A37110E94D
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 20:33:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3287E42B25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1725568397; bh=JuyDqlVA1do2mubnFAhREgX39ZXWLY4Qa+TRYZIPESM=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=P7oN37b3ddBaO1YpgGdkHEvev6o1O5rIHRrRfj0THLWdllwWN3B+NmZ0ssPa24yaX
 6rTbDv116PjMg3oO8DF1goFohdRbRu7EpvYGlvyL/hHH4WUPg7tw4y8WouAT8HyTwx
 pJPwlTTXe0WHsIRlOWIDK18ZYkAjZta+Sf1wQO1WH7/bxfCoEbSbJgCa4xJYPxy50y
 3Px/b8HHkw4IP8rRyRoC6l8BevEPGYhqM+JT8UHR6klMUoOK8AXsq0scHmzyeGI2Z/
 fTIUbu2NWejmLjf1V1JowHDGefLoUr44m2Gb7ZsUrgJOOOSh0JCWMpdlBRERMIqdDg
 StTeHevN9aIkg==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 3287E42B25;
 Thu,  5 Sep 2024 20:33:17 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Aryabhatta Dey <aryabhattadey35@gmail.com>, liviu.dudau@arm.com,
 airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation/gpu: Fix typo in
 Documentation/gpu/komeda-kms.rst
In-Reply-To: <l5wzytcamcc43eadaquqbrfqilq6ajfnnseh37c77eceamtw35@hhtdipi4h22c>
References: <l5wzytcamcc43eadaquqbrfqilq6ajfnnseh37c77eceamtw35@hhtdipi4h22c>
Date: Thu, 05 Sep 2024 14:33:16 -0600
Message-ID: <87y145g7sj.fsf@trenco.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
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

Aryabhatta Dey <aryabhattadey35@gmail.com> writes:

> Change 'indenpendently' to 'independently'.
>
> Signed-off-by: Aryabhatta Dey <aryabhattadey35@gmail.com>
> ---
>  Documentation/gpu/komeda-kms.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/gpu/komeda-kms.rst b/Documentation/gpu/komeda-kms.rst
> index 633a016563ae..eaea40eb725b 100644
> --- a/Documentation/gpu/komeda-kms.rst
> +++ b/Documentation/gpu/komeda-kms.rst
> @@ -86,7 +86,7 @@ types of working mode:
>  -   Single display mode
>      Two pipelines work together to drive only one display output.
>  
> -    On this mode, pipeline_B doesn't work indenpendently, but outputs its
> +    On this mode, pipeline_B doesn't work independently, but outputs its
>      composition result into pipeline_A, and its pixel timing also derived from

Applied, thanks.

jon
