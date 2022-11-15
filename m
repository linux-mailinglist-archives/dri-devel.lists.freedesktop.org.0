Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1124362939C
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 09:51:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D11210E381;
	Tue, 15 Nov 2022 08:51:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E60C010E381
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 08:51:37 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id t10so16654599ljj.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 00:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=FxL8J75HpHty4V7fqtseZkROCWMx3ps3edXo3k/fTDs=;
 b=aHSqQKmAj9JVZI1lIoPVIEiNkrQFmt0U3Ax7cV0Te2JpYnQkbyTYuzD5p0qPRFYrRV
 qk9C6wK3j2N7AltISC1LLHrXYnBzWGfq/0zYt9zfye4alD2gT9Yd/JoonzmiEa37Ifh8
 2+P6fJj6QM2VnTUuIwNHVZiUApNTTl6S0J33Yd662uOELtpXWXA7AfRDEfDXd8aJEAno
 Qf0ep2622WZqRdDiBq41wuvupDJ8wFCiMnwSDrl2Ro/tEop8qc7ei8NsLo3LnmVQPfuM
 aF5ubY3Dl0aswzQYXt11NehLAyRvPpJPa/OYBuj6sYTjAaaBMGkAudc4oRb5y33o9zIc
 vBqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FxL8J75HpHty4V7fqtseZkROCWMx3ps3edXo3k/fTDs=;
 b=bLGLn3hk77fHvoxsvIum9vPBtwJd4MRxD+fG4hfYk2u2+rKNMwVKINlV+o/pobM2xG
 QBBTyPspsxg+8P5fRgHfTQNaYi9QvkLvpcetgQQxSd4SQtBpPDDh4HkXR1pY63peTIxY
 +6dzCjr8cLcGhIYoASfgHYUCDnBOprzoUik6qpWO/PYy1QlisQ8cxlBcjL5bM6zVZ6ml
 oRKf/Q3znQztdJmpClrG5+SJiZhiRGIcfsrj5QRBxV3CfWNhNCxwUbFhorxHtRQyzev0
 JTHvPERx8JwuLxhYm+TemNvulq8eOmx1Ct66V3NEMB9en93JZem7Vy3eEj/yNJkOPQ5C
 4jug==
X-Gm-Message-State: ANoB5pkaHm/B6Q92Gv4YHGYGQ3Mq+J6wYC+iIhS/Rh3bWWYP0KyH9ot4
 UMhqT9OQmI6kNLL0GY17x7c=
X-Google-Smtp-Source: AA0mqf4KQL/FGkpgBc05BSDFeODS8JvNsvuuLvYH5kFrgMFDx7zE8sDGF9a86HR9mKamds1/RkFK7w==
X-Received: by 2002:a2e:9998:0:b0:277:3609:bd2b with SMTP id
 w24-20020a2e9998000000b002773609bd2bmr5042565lji.340.1668502295754; 
 Tue, 15 Nov 2022 00:51:35 -0800 (PST)
Received: from gmail.com (host-95-193-110-185.mobileonline.telia.com.
 [95.193.110.185]) by smtp.gmail.com with ESMTPSA id
 i25-20020a2e8099000000b0026bca725cd0sm2412753ljg.39.2022.11.15.00.51.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 00:51:35 -0800 (PST)
Date: Tue, 15 Nov 2022 09:51:33 +0100
From: Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 1/2] Revert "drm: hide unregistered connectors from
 GETCONNECTOR IOCTL"
Message-ID: <Y3NTFY9Dz7eB9Uho@gmail.com>
References: <20221017153150.60675-1-contact@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221017153150.60675-1-contact@emersion.fr>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@redhat.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Can you update the commit message so at least the first patch can land
for 6.1 so we can avoid regressions? E.g. something like

````
It caused logically active but disconnected MST display port connectors to
disappear from the drmModeGetResources() list, meaning userspace is made to
believe the connector is already disabled. This conflicts with the intended
behavior of userspace, which is to detect the connector got disconnected
and then disabling it.

When userspace later attempts post a new mode set commit, if that commit
uses the same CRTC used to previously drive the disconnected connector,
it will fail as that CRTC is logically still tied to the disconnected
connector.

This was discovered by a bisecting docking station hot plugging
regression using mutter.
```

(feel free to edit in any way you want).


Jonas

On Mon, Oct 17, 2022 at 03:31:57PM +0000, Simon Ser wrote:
> This reverts commit 981f09295687f856d5345e19c7084aca481c1395.
> 
> It turns out this breaks Mutter.
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Jonas Ådahl <jadahl@redhat.com>
> ---
>  drivers/gpu/drm/drm_mode_config.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> index 939d621c9ad4..688c8afe0bf1 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c
> @@ -151,9 +151,6 @@ int drm_mode_getresources(struct drm_device *dev, void *data,
>  	count = 0;
>  	connector_id = u64_to_user_ptr(card_res->connector_id_ptr);
>  	drm_for_each_connector_iter(connector, &conn_iter) {
> -		if (connector->registration_state != DRM_CONNECTOR_REGISTERED)
> -			continue;
> -
>  		/* only expose writeback connectors if userspace understands them */
>  		if (!file_priv->writeback_connectors &&
>  		    (connector->connector_type == DRM_MODE_CONNECTOR_WRITEBACK))
> -- 
> 2.38.0
> 
> 
