Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 226F7845ED5
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 18:46:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E72C610EC3D;
	Thu,  1 Feb 2024 17:46:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="IT+5QloK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA70C10EC3D
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Feb 2024 17:46:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 72D8CFF80B;
 Thu,  1 Feb 2024 17:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1706809600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yJtHDJMAIjYne+Wpy9ELnPjDgsMPZsdJCj8jeRX7IKg=;
 b=IT+5QloK6fRzRQzJ7Awhi5KYa2C9GPYm90MnqIe+7bFDpi0c2iyVZceRq3+RstzDdI57ad
 gJcmAcqRyq0Hzwh7XwomXLmj/yaVfcxllmitLR7N8jiL7KxRDZOeBK+z6kqpAqFn2WaJi6
 spadqeijE59+618+ToghWPZwzD7v4KZY5IXjifRY9YBpb8Ll4JXjA7u6ZSAZBXaEz3t0hN
 Ze/wS8Y15xfY3HNgrp+3uOAkoTCgMSVdf5jewuQmX11E4GLtbCPpt9G4Mm5G1jZpqDqq6N
 7e7dkMVPVU0cmM2OW67iQj7Hc4uMLFBUZ7l/yP7HjdDfbjOlKkw8ZLSveDRbOg==
Date: Thu, 1 Feb 2024 18:46:37 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Arthur Grillo <arthurgrillo@riseup.net>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Harry Wentland <harry.wentland@amd.com>, Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Melissa Wen <melissa.srw@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 6/7] drm/vkms: Drop YUV formats TODO
Message-ID: <ZbvY_bqvpLFXVXKF@localhost.localdomain>
Mail-Followup-To: Arthur Grillo <arthurgrillo@riseup.net>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Melissa Wen <melissa.srw@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
References: <20240110-vkms-yuv-v2-0-952fcaa5a193@riseup.net>
 <20240110-vkms-yuv-v2-6-952fcaa5a193@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240110-vkms-yuv-v2-6-952fcaa5a193@riseup.net>
X-GND-Sasl: louis.chauvet@bootlin.com
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

Le 10/01/24 - 14:44, Arthur Grillo a écrit :
> VKMS has support for YUV formats now. Remove the task from the TODO
> list.
> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> ---
>  Documentation/gpu/vkms.rst | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index ba04ac7c2167..13b866c3617c 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -122,8 +122,7 @@ There's lots of plane features we could add support for:
>  
>  - Scaling.
>  
> -- Additional buffer formats, especially YUV formats for video like NV12.
> -  Low/high bpp RGB formats would also be interesting.
> +- Additional buffer formats. Low/high bpp RGB formats would be interesting.
>  
>  - Async updates (currently only possible on cursor plane using the legacy
>    cursor api).
> 
> -- 
> 2.43.0
> 

(Sorry Arthur for the double mail, I miss the reply-all in the previous 
mail)

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
