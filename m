Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5C8A13E5B
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 16:55:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7778010E9BA;
	Thu, 16 Jan 2025 15:55:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="S8qYSDnt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E59210E9BA
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 15:55:04 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-436249df846so7194335e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 07:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737042902; x=1737647702; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=go0LBPnlfpqosNhb/KeEQRE2AJw7BPzMUNlEkycpQJI=;
 b=S8qYSDntTVlG7K6oy0SEGXlQVAZa7nALahicbbuqCzQ4w6h/+zcwknHYEo7kq0SGTX
 UY84GogSri2n6woGnk4ICYkaL5L5OBvsnJtkfTYVOkth76tZuvVLC4Xcop3waZGNydq3
 /NfN0aRu/0bTF/RywT1l8pOkc+lJfiSDyEw/rruS4WRGfg+2yMH1kwRnokmr3uRa0i7I
 F1Tu51fJltUHBTW5B7OUZFqO5LKEAwV40sWhyzKUDN06o/MhAygWVwPfPZLRMMclv9gn
 CYL5xQtmpA778rCtvQftCwOQnh6SYvFPHF2RwHp/h/cEF840+EYmZyyl5LNyEsNpfSva
 CbQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737042902; x=1737647702;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=go0LBPnlfpqosNhb/KeEQRE2AJw7BPzMUNlEkycpQJI=;
 b=Rn3tXXmoNNYIVna4ka7KVTFzjmiixD+IiNWwqZaH5OeB+bN2d6tPjjZwMFUTO/8rIU
 oqUaTxjEZ31THhlC4i93nz5/rhN5EPl69/MGHxOFlMKM3fCU0LIdxK8jhZs9tAQkQnTg
 jFkht8dPbEWvAOS4Q6pVmlCl3EkBoIjeZ6q55TPMQ2qnVc14gDkE8P06A7IxIgm5VxKw
 quQEdWUrTJiVzZur6TtutqfmjNI8GOaEgDKSg1oyAEz/lofhfyYae45rF5C0Khc9ruGD
 XQgMd1yPrnxdiA1Kx0XOq5rjfjKJB6Bu3D5YQ1SayPghDfkrTzbEjRNrO4FOTMGmL8x7
 NMvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMVgIiQ1yNqVXZou9Ou+mtDQHqM8mSmn30PodA5Y9JbFgn1tI7IqVrB+o8Sno7lnOIcTm67o+0Pqk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAiGvm3G/xexxqGB5xOvFuLEdYYcLRW+5eLG3R8bFH2BtGKBs8
 HUnePUxMn0Pjmuf50QzhzC9lV17Vw2xx043P50aeoxXtLMipbpBu
X-Gm-Gg: ASbGnctaoR90nJkZwhRbfpvnKfu8Ak0OjikJZJ+OaGknzmN7yMqRg9YMBSMLJHXpnjN
 4a/4AYMa/RV8aK5NaNCg7UOnrh3veYxtmtcvhOB//w8MVvUh3aMcRBuy1+pZqSUpPhrX4hNHGUf
 1OkA9+dKFdE4TjHVlPj8C7bS0WewXnSrqT2jt21ItOkNt72KCDS2ex289TNZr0dq2IvUo8N2iSH
 f7BemKreB3/zt+jQcL17Ci4L0+U9y4IPLq7KRB+tDc1w0lPHrDmz3dqPA==
X-Google-Smtp-Source: AGHT+IG4x0x+jpkzgsLRk2inzjjZnEaxEEdBjSLHzEIi633/jTZFWPwb0Y29bfsMYA251Rse8xB6gg==
X-Received: by 2002:a05:600c:354e:b0:431:5aea:95f with SMTP id
 5b1f17b1804b1-436e26a175cmr366834405e9.16.1737042902571; 
 Thu, 16 Jan 2025 07:55:02 -0800 (PST)
Received: from fedora.. ([94.73.34.116]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4389040854bsm3441185e9.7.2025.01.16.07.55.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 07:55:02 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: airlied@gmail.com, arthurgrillo@riseup.net,
 dri-devel@lists.freedesktop.org, hamohammed.sa@gmail.com,
 jeremie.dautheribes@bootlin.com, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mairacanal@riseup.net,
 mcanal@igalia.com, melissa.srw@gmail.com, miquel.raynal@bootlin.com,
 mripard@kernel.org, nicolejadeyee@google.com,
 rodrigosiqueiramelo@gmail.com, seanpaul@google.com, simona.vetter@ffwll.ch,
 simona@ffwll.ch, thomas.petazzoni@bootlin.com, tzimmermann@suse.de,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v8 2/8] drm/vkms: Switch to managed for encoder
Date: Thu, 16 Jan 2025 16:54:59 +0100
Message-ID: <20250116155500.3476-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250114-google-vkms-managed-v8-2-da4254aa3dd5@bootlin.com>
References: <20250114-google-vkms-managed-v8-2-da4254aa3dd5@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

> The current VKMS driver uses non-managed function to create encoders. It
> is not an issue yet, but in order to support multiple devices easily,
> convert this code to use drm and device managed helpers.
> 
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Reviewed-by: Maíra Canal <mcanal@igalia.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Reviewed-by: José Expósito <jose.exposito89@gmail.com>

Thanks!

> ---
>  drivers/gpu/drm/vkms/vkms_output.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index 570823ecb28f589e6323036590ec05a2f633bc9b..ab9affa75b66ce9f00fe025052439405206144ec 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -13,10 +13,6 @@ static const struct drm_connector_funcs vkms_connector_funcs = {
>  	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>  };
>  
> -static const struct drm_encoder_funcs vkms_encoder_funcs = {
> -	.destroy = drm_encoder_cleanup,
> -};
> -
>  static int vkms_conn_get_modes(struct drm_connector *connector)
>  {
>  	int count;
> @@ -84,8 +80,8 @@ int vkms_output_init(struct vkms_device *vkmsdev)
>  
>  	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
>  
> -	ret = drm_encoder_init(dev, encoder, &vkms_encoder_funcs,
> -			       DRM_MODE_ENCODER_VIRTUAL, NULL);
> +	ret = drmm_encoder_init(dev, encoder, NULL,
> +				DRM_MODE_ENCODER_VIRTUAL, NULL);
>  	if (ret) {
>  		DRM_ERROR("Failed to init encoder\n");
>  		return ret;
> @@ -95,7 +91,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
>  	ret = drm_connector_attach_encoder(connector, encoder);
>  	if (ret) {
>  		DRM_ERROR("Failed to attach connector to encoder\n");
> -		goto err_attach;
> +		return ret;
>  	}
>  
>  	if (vkmsdev->config->writeback) {
> @@ -108,7 +104,5 @@ int vkms_output_init(struct vkms_device *vkmsdev)
>  
>  	return 0;
>  
> -err_attach:
> -	drm_encoder_cleanup(encoder);
>  	return ret;
>  }
> 
