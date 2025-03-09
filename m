Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C54A5882F
	for <lists+dri-devel@lfdr.de>; Sun,  9 Mar 2025 21:30:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C493110E052;
	Sun,  9 Mar 2025 20:29:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="neZOkEP2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6556610E052
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Mar 2025 20:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CiEwnW3BQBlaW9eYp7f+XfrbZdqWq7TjAzBqepm4H+A=; b=neZOkEP20YdgIPBes3WtdpM6vu
 tpDWoqgoT6fU7i8ycIAGeS/tR1LU7KOQ2jLfn8rCrIgAN4916ger6SDuxb6ZsV4CjXXg4BIOStqPj
 xzKj7o0wjjBLc9K0NaM3tqnkj/7z4okausFcDGw2VVoG23o6n4YyOgw3yGYfWsYKfRLKEn/3DPxCe
 G9Zgb3KIvtGxtQ7PBG2w2U8WUdM+gtWjjI2R/5VieBy1wcyfhx9BR3UmASl0TkDVtISSYk+zD+0z1
 r7h6r6C10kuCjpxpRHzyjnXk6LxJwDc1UU1AcxT2EhAErInOBD5Lj+Q9FpsROF5m5QEm3MhjmK2PT
 39YGNSuA==;
Received: from [189.7.87.170] (helo=[192.168.0.224])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1trNGx-006EjL-2m; Sun, 09 Mar 2025 21:29:25 +0100
Message-ID: <f5f920ec-be44-48d3-ae4d-bd385c3a4a5b@igalia.com>
Date: Sun, 9 Mar 2025 17:29:16 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/vc4: plane: fix inconsistent indenting warning
To: Charles Han <hanchunchao@inspur.com>, mripard@kernel.org,
 dave.stevenson@raspberrypi.com, kernel-list@raspberrypi.com,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250305102107.2595-1-hanchunchao@inspur.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250305102107.2595-1-hanchunchao@inspur.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Charles,

On 05/03/25 07:21, Charles Han wrote:
> Fix below inconsistent indenting smatch warning.
> smatch warnings:
> drivers/gpu/drm/vc4/vc4_plane.c:2083 vc6_plane_mode_set() warn: inconsistent indenting
> 
> Signed-off-by: Charles Han <hanchunchao@inspur.com>

Applied to misc/kernel.git (drm-misc-next).

Best Regards,
- Maíra

> ---
>   drivers/gpu/drm/vc4/vc4_plane.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
> index c5e84d3494d2..056d344c5411 100644
> --- a/drivers/gpu/drm/vc4/vc4_plane.c
> +++ b/drivers/gpu/drm/vc4/vc4_plane.c
> @@ -2080,7 +2080,7 @@ static int vc6_plane_mode_set(struct drm_plane *plane,
>   			/* HPPF plane 1 */
>   			vc4_dlist_write(vc4_state, kernel);
>   			/* VPPF plane 1 */
> -				vc4_dlist_write(vc4_state, kernel);
> +			vc4_dlist_write(vc4_state, kernel);
>   		}
>   	}
>   

