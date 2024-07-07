Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58464929975
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jul 2024 21:15:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CA6410E0D0;
	Sun,  7 Jul 2024 19:15:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="b5jTJ3lT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1A0610E0D0
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jul 2024 19:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K+ysL2Mn2FVQqH0WhbxxJThx/wtL6dihXjVtsTevpNU=; b=b5jTJ3lTuUoQoJbSKmBBHA+I70
 9vQ556AHW2iR4IggvxM5eX/TPQwJPsXPEfTUsRMkfNc26xdYuK2FBR9+MXPeAztXznPhCCFSaNYyL
 93wMmi4uuIHHcKoSKfXJ4NOJnFmk1iS8fIX2blxNjA/7chyl0G+vFUceOn4qy1aMCr5ptIhvhfRqV
 HW5or+2hh0YU4nBAWa9UYE2XpZpbueMujPbLC0YgODFj/eopoUBhvk4LRtU6t/sofDp9pOj0jXyd1
 tNxHTQrUinqUqIXRN7TRMdcW0OKTIqq9qGSiyQwJ0Bqh3WvGQPCvJ9NkT7oQyFTwQ+Z769OH2cuv9
 PtWsReTQ==;
Received: from [187.36.213.55] (helo=[192.168.1.212])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1sQXMM-00CD8O-9d; Sun, 07 Jul 2024 21:15:42 +0200
Message-ID: <ddf0ea21-64ac-4f1b-9df6-83f4b4d552b0@igalia.com>
Date: Sun, 7 Jul 2024 16:15:34 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/vkms: Remove event from vkms_output
To: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, open list <linux-kernel@vger.kernel.org>
References: <20240703160458.1303872-1-lyude@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Autocrypt: addr=mcanal@igalia.com; keydata=
 xjMEZIsaeRYJKwYBBAHaRw8BAQdAGU6aY8oojw61KS5rGGMrlcilFqR6p6ID45IZ6ovX0h3N
 H01haXJhIENhbmFsIDxtY2FuYWxAaWdhbGlhLmNvbT7CjwQTFggANxYhBDMCqFtIvFKVRJZQ
 hDSPnHLaGFVuBQJkixp5BQkFo5qAAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQNI+cctoYVW5u
 GAEAwpaC5rI3wD8zqETKwGVoXd6+AbmGfZuVD40xepy7z/8BAM5w95/oyPsHUqOsg/xUTlNp
 rlbhA+WWoaOXA3XgR+wCzjgEZIsaeRIKKwYBBAGXVQEFAQEHQGoOK0jgh0IorMAacx6WUUWb
 s3RLiJYWUU6iNrk5wWUbAwEIB8J+BBgWCAAmFiEEMwKoW0i8UpVEllCENI+cctoYVW4FAmSL
 GnkFCQWjmoACGwwACgkQNI+cctoYVW6cqwD/Q9R98msvkhgRvi18fzUPFDwwogn+F+gQJJ6o
 pwpgFkAA/R2zOfla3IT6G3SBoV5ucdpdCpnIXFpQLbmfHK7dXsAC
In-Reply-To: <20240703160458.1303872-1-lyude@redhat.com>
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

On 7/3/24 13:04, Lyude Paul wrote:
> While working on rvkms, I noticed that there's no code that actually uses
> the drm_pending_vblank_event that's embedded in vkms_output. So, just drop
> the member from the struct.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Applied to drm-misc/drm-misc-next!

Best Regards,
- Maíra

> ---
>   drivers/gpu/drm/vkms/vkms_drv.h | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 8f5710debb1eb..5e46ea5b96dcc 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -103,7 +103,6 @@ struct vkms_output {
>   	struct drm_writeback_connector wb_connector;
>   	struct hrtimer vblank_hrtimer;
>   	ktime_t period_ns;
> -	struct drm_pending_vblank_event *event;
>   	/* ordered wq for composer_work */
>   	struct workqueue_struct *composer_workq;
>   	/* protects concurrent access to composer */
