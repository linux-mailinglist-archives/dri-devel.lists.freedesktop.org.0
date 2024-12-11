Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD9F9ECD11
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 14:19:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA80910E1CB;
	Wed, 11 Dec 2024 13:19:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="OrpjuXHA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3E2910E1CB
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 13:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H3E+fEnwe+yZfrSNoDLiWBMqm1YTdyVztdEulWBq1eQ=; b=OrpjuXHASZqxvEkCbaUp3K2LZr
 xs9lVV+r2uzqk3Xv6WYT/QVT3T606UWNZRxjkdT2+rjWPaeWHJT/QbBK0CgS9zo+Qfb9QDZO2L+S2
 qs7FBg6ZAdqldiV/speClZp3cp/aBaAfImde/m+RYhcSI1XqUzhFIoF1rSBdTJ0ydBQElp16PBcxt
 vHWW1+kZeokh6pGr5uqN7QUxkJJYScpBS9q+giX5uLn3T00wvDQwwdJhqw+77U75eR6AvcY0OVZb0
 Izj+t88WNoSCmJ1OZ4RLuYiiKY6nk0Qcy/6xMfbW6R9w8yYZLzk4VTHP/cTuHa/kAOWh+r2lFl2w6
 eQKhJ5Sg==;
Received: from [187.36.213.55] (helo=[192.168.1.103])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tLMcd-001xKy-MB; Wed, 11 Dec 2024 14:19:23 +0100
Message-ID: <d2a0fed1-22c0-4035-9b9d-feb78c9e3ac5@igalia.com>
Date: Wed, 11 Dec 2024 10:19:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/vc4: plane: Remove WARN on state being set in
 plane_reset
To: Stefan Wahren <wahrenst@gmx.net>, Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, kernel-list@raspberrypi.com,
 dri-devel@lists.freedesktop.org
References: <20241202120343.33726-1-wahrenst@gmx.net>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20241202120343.33726-1-wahrenst@gmx.net>
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

Hi Stefan,

On 02/12/24 09:03, Stefan Wahren wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> It is permitted on situations such as system resume for plane->state
> to be non-NULL, and that should be handled by freeing it. Do so.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Was this patch applied? Let me know if you would like it to be applied
to drm-misc-next.

Best Regards,
- Maíra

> ---
>   drivers/gpu/drm/vc4/vc4_plane.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
> index ba6e86d62a77..1aaa4938824b 100644
> --- a/drivers/gpu/drm/vc4/vc4_plane.c
> +++ b/drivers/gpu/drm/vc4/vc4_plane.c
> @@ -330,7 +330,10 @@ static void vc4_plane_reset(struct drm_plane *plane)
>   {
>   	struct vc4_plane_state *vc4_state;
> 
> -	WARN_ON(plane->state);
> +	if (plane->state)
> +		__drm_atomic_helper_plane_destroy_state(plane->state);
> +
> +	kfree(plane->state);
> 
>   	vc4_state = kzalloc(sizeof(*vc4_state), GFP_KERNEL);
>   	if (!vc4_state)
> --
> 2.34.1
> 

