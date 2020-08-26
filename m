Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1BB253E69
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 08:58:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A7096EB48;
	Thu, 27 Aug 2020 06:57:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E723A6E115
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 12:37:52 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id u18so1587030wmc.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 05:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UVKirMIQloZm771iTq462uuSZP5L4as332r/HWvG44Y=;
 b=B0bjSd+H1bctu2OqrFwNyNDVUpiZ+Dy7brhxL0C0WAwqFlccUX7jyG0X3sAp90dPTp
 qqKcwJAF2jYymxK0YspNf6LC+9LY0jBdthniu9U22NsyFXYmfScMnS5gaocDYefCCYa2
 1LXLdmb3Nmqi3UFRHXqdtsWrF0WAmCvPeKNARejVcs/kdMt5n37mcZ00EgcqN39EaNyI
 DNMCG5w5wgoxDcgAS4yTdtwjtZ+NphYMt7MyoXjON52fiuR3XnxNbCNqEqjuHvvYnY/T
 tzIedfggpH1fQDlJW0o9EwMKrfx1IYMIIlKWam+y/KTcF4/uFziYDYAXT9juhDMVU5RP
 Gqxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UVKirMIQloZm771iTq462uuSZP5L4as332r/HWvG44Y=;
 b=fx6ntSCU3Mlv7B2DJAGp8E0V6gBDvtZU7prGMHRIr1vV51rZrl3EgkdtvP/xBM/1bM
 5NbnaKRBmrSGb3huOYxbmoHR/EE0gnlwNdx0ao0FKb3kDXdWRknr4ab5Kb+7WExMstAV
 dqQUM5m+LT/PvQSa8pcBzEX+ZYjcrFsxEcsdrZCPuPZvxVCAysrfLob6AoQLzT6pcTCi
 7Lkqjz0D4AdU9gynxiI7H19AOeSlEoNcU8w5sANeYWVisv+MBgLddqUjTf98ktdVFzds
 cmxodSjUFcZ8cVqKmpA02lRmihr65b8WR+9Ihu1IQetPF/Mpoh5JD7H9OEYXQXySs5nh
 J2DQ==
X-Gm-Message-State: AOAM532gAJg1KJftLJmJg+a4Aff1YuHVf7vkYMb01Sqp+9+PJVO22uvZ
 sz6YbFxuB8Q9oYfqzG4QAFU=
X-Google-Smtp-Source: ABdhPJwb9JY5cBVtCdqrbxvVaNL9Z1AZ2EiRNW1YlXoQO2ifhrY0webfkfJn9j7Cj6TaZALKHNTMlg==
X-Received: by 2002:a1c:f704:: with SMTP id v4mr3337030wmh.4.1598445471532;
 Wed, 26 Aug 2020 05:37:51 -0700 (PDT)
Received: from a-VirtualBox ([103.120.71.253])
 by smtp.gmail.com with ESMTPSA id p2sm6714395wrf.78.2020.08.26.05.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 05:37:51 -0700 (PDT)
Date: Wed, 26 Aug 2020 17:37:46 +0500
From: Bilal Wasim <bwasim.lkml@gmail.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH v2 1/5] drm/bridge_connector: Set default status
 connected for eDP connectors
Message-ID: <20200826173746.622c2af9@a-VirtualBox>
In-Reply-To: <20200826081526.674866-2-enric.balletbo@collabora.com>
References: <20200826081526.674866-1-enric.balletbo@collabora.com>
 <20200826081526.674866-2-enric.balletbo@collabora.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 27 Aug 2020 06:57:37 +0000
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
Cc: drinkcat@chromium.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 hsinyi@chromium.org, matthias.bgg@gmail.com,
 Collabora Kernel ML <kernel@collabora.com>, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 26 Aug 2020 10:15:22 +0200
Enric Balletbo i Serra <enric.balletbo@collabora.com> wrote:

> In an eDP application, HPD is not required and on most bridge chips
> useless. If HPD is not used, we need to set initial status as
> connected, otherwise the connector created by the
> drm_bridge_connector API remains in an unknown state.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
> 
> Changes in v2:
> - Included the patch `drm/bridge_connector: Set default status
> connected for eDP connectors`
> 
>  drivers/gpu/drm/drm_bridge_connector.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/drm_bridge_connector.c
> b/drivers/gpu/drm/drm_bridge_connector.c index
> c6994fe673f3..a58cbde59c34 100644 ---
> a/drivers/gpu/drm/drm_bridge_connector.c +++
> b/drivers/gpu/drm/drm_bridge_connector.c @@ -187,6 +187,7 @@
> drm_bridge_connector_detect(struct drm_connector *connector, bool
> force) case DRM_MODE_CONNECTOR_DPI: case DRM_MODE_CONNECTOR_LVDS:
>  		case DRM_MODE_CONNECTOR_DSI:
> +		case DRM_MODE_CONNECTOR_eDP:
>  			status = connector_status_connected;
>  			break;
>  		default:

Reviewed-by: Bilal Wasim <bwasim.lkml@gmail.com>
Tested-by: Bilal Wasim <bwasim.lkml@gmail.com>

-Bilal
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
