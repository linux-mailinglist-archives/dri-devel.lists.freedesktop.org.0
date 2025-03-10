Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF48A59413
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 13:19:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B308810E417;
	Mon, 10 Mar 2025 12:19:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="TZ+MqTOP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2DE810E416
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 12:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1741609171;
 bh=PoOj+vZroaEYQzcVfLHjjBM/oMbNxPsFZdXJ2HsjyBU=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=TZ+MqTOPq3ASPEY5z5UfJ5INMJ655YshSCVf2ImRwnnlSfaJcHmisEbSdtnxj9bTx
 2DoNJ9W7jSoSBHOid9VXeoua7W2+wDOqeMbu9c0EHS6IHgWU/dTaLOBPzbN5xKQgNN
 fpDezVtdlUSQQX+kcBL8744G2++DG2oKvwDGc0QG7bTshjSmrxI/WQ72sv2nf0D0r5
 5HwkN3YwGGa6jKscyVLk40X/1vvBJlfZm9dMnL6SiDNnDOGErEqCKK143cuXu5jhak
 012G6pmB3o1fXeGA5jZoljFWlRZceHDK3dB7ScJvwv9TIz1/4MJ+OrnZV4Zu4205Pb
 PsJAiFfYDMX+Q==
Received: from [192.168.50.250] (unknown [171.76.87.92])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 771DF17E0E8D;
 Mon, 10 Mar 2025 13:19:29 +0100 (CET)
Message-ID: <b6e09b4d-0718-4318-b666-0be405a77b86@collabora.com>
Date: Mon, 10 Mar 2025 17:49:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] MAINTAINERS: Update drm/ci maintainers
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, helen.koike@collabora.com, airlied@gmail.com,
 simona.vetter@ffwll.ch, robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, valentine.burley@collabora.com,
 jani.nikula@linux.intel.com, dmitry.baryshkov@linaro.org,
 mripard@kernel.org, linux-kernel@vger.kernel.org
References: <20250205134811.2002718-1-vignesh.raman@collabora.com>
Content-Language: en-US
In-Reply-To: <20250205134811.2002718-1-vignesh.raman@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 05/02/25 19:17, Vignesh Raman wrote:
> Update drm/ci maintainer entries:
> 
> * Add myself as drm/ci maintainer.
> * Update Helen's email address.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
>   MAINTAINERS | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b256bb4f6d3f..2b4e08c7e119 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7940,7 +7940,8 @@ F:	drivers/gpu/drm/ttm/
>   F:	include/drm/ttm/
>   
>   DRM AUTOMATED TESTING
> -M:	Helen Koike <helen.koike@collabora.com>
> +M:	Helen Koike <helen.fornazier@gmail.com>
> +M:	Vignesh Raman <vignesh.raman@collabora.com>
>   L:	dri-devel@lists.freedesktop.org
>   S:	Maintained
>   T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git

applied to drm-misc-next

Regards,
Vignesh

