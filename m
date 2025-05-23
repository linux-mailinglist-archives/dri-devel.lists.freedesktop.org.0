Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D98AC2245
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 13:59:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C90C10E29C;
	Fri, 23 May 2025 11:59:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lwn.net header.i=@lwn.net header.b="kTt9lQ7L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B82A10E2A2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 11:58:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A58D541F38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1748001536; bh=KM1++pXYBhtAAWDBUXHsFQxXUKcJo+l383CqjWyzFB4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=kTt9lQ7LSaDD7BiJKFvhYYZRRpEvRZazu2hL7x2RCXVkLcGKaqVTjO3WiSMFrZA/x
 nFl5a+EzSImMHqYsyh1EZKuGCt+z2BBqi+hlcD8ZneXeAMhrs4s1YSmOw7qRimIW3m
 CK/o2XYOqhKT7Luv8LFh5INAjv18I8/PkJAtsM+T2GIt0g/33ttLr1EBaujPY03tNf
 Pw1A4v5igQCUXr9WWbcS1pwMAoQtub9dUdV+OdrgPy4jFsdZCgV1l1fpN73/4AkLVF
 2HY03S/8dZkSjwpJtqaZ+PELUO/NDrJ70hSXx/RgJuOmNufo7UVX5ecWfovESKYLzp
 292Vb+7I7YSHg==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id A58D541F38;
 Fri, 23 May 2025 11:58:56 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Abdulrasaq Lawani
 <abdulrasaqolawani@gmail.com>
Subject: Re: [PATCH] drm: add overview diagram for drm stack
In-Reply-To: <20250522-drm-doc-updates-v1-1-d1efd54740bd@gmail.com>
References: <20250522-drm-doc-updates-v1-1-d1efd54740bd@gmail.com>
Date: Fri, 23 May 2025 05:58:55 -0600
Message-ID: <87ecwfczcw.fsf@trenco.lwn.net>
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

Abdulrasaq Lawani <abdulrasaqolawani@gmail.com> writes:

> Add an overview diagram of Linux DRM architecture for
> graphics and compute to introduction.rst
>
> ---
> Signed-off-by: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
> ---
>  Documentation/gpu/introduction.rst | 38 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 37 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/gpu/introduction.rst b/Documentation/gpu/introduction.rst
> index 3cd0c8860b949408ed570d3f9384edd5f03df002..91bb0efc96d69921a122c5265b1431fa18110a7a 100644
> --- a/Documentation/gpu/introduction.rst
> +++ b/Documentation/gpu/introduction.rst
> @@ -14,7 +14,43 @@ including the TTM memory manager, output configuration and mode setting,
>  and the new vblank internals, in addition to all the regular features
>  found in current kernels.
>  
> -[Insert diagram of typical DRM stack here]
> +Overview of the Linux DRM Architecture
> +-----------------------------------------------
> ++-----------------------------+
> +|     User-space Apps         |
> +| (Games, Browsers, ML, etc.) |
> ++-----------------------------+

[...]

Please actually build the docs after a change like this and look at the
results; they will not be what you expect here.  You need to put that
diagram into a literal block.

Thanks,

jon
