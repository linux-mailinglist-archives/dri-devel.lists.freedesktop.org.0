Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF975160F02
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 10:43:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AB3389FBC;
	Mon, 17 Feb 2020 09:43:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AEC689FBC
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2020 09:43:07 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id g3so18786086wrs.12
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2020 01:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=4HRMqXrnhTw51+krRMY4GRcOb2Xcm/MVZou76P68cNQ=;
 b=OWrBcsQOalLeeqsBWbJl564E7MUnk/IeMWhMP3t+SzQR5+guwBIfGaNRWMHdUFRxC4
 892TfiJDARdWqbfOwVDAHho2XIb7tJ5sF5To41PC6J5nIDywqJrhTmTz9lF8dm3MNBpm
 dq9zwD09qRWkPiRYFXVfI6TJyvmVaFItIp9AU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4HRMqXrnhTw51+krRMY4GRcOb2Xcm/MVZou76P68cNQ=;
 b=S6QLGdTzLNfuHmexJ5Lzfsd3SWNsQeeCaJS+urr5Gs9QyJgEukNPTzH8aNKWuMFwQ9
 T7RzcxHxYA/egHZl9y8ez/hwm369VsLZc6pJ6mYeut0ZCAd+8kGZdzT1RFq/OEMA0hZt
 8xZhR5Kn73BHxnI9HVlTN7ntMQgAHmGejhrMYNbA2ZeKxGkMyFjXB1W6KlXkPb1490Q7
 avDXZ9ST2Yt6YqL9JvLM7DazlO32B4Gdd9MT6jgC25HBSwnAWvDoJg2FPtMhplYMTpm8
 vhHiQ1TFy0aAMXmrexDZqm7J7xzkin6XemD4MXw9yWpAiZP8ICBAip8hbyPzs3FTML68
 KLyQ==
X-Gm-Message-State: APjAAAU8ffYyd74RjvoIkMbJGtakGWDp01AnWUfXV8e+SJ/I/fYf1r2x
 bIlp+SVHlfvHc9exX4J9Fr51cw==
X-Google-Smtp-Source: APXvYqxAS1jodbjqC7IWqRAbG2FHOCvs5MeWRQq+xZ5QL4qvTa/f5nIyNKjNAOM3PBTz7zuPbDKVzQ==
X-Received: by 2002:adf:f586:: with SMTP id f6mr20276028wro.46.1581932586093; 
 Mon, 17 Feb 2020 01:43:06 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q3sm18556551wmj.38.2020.02.17.01.43.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2020 01:43:05 -0800 (PST)
Date: Mon, 17 Feb 2020 10:43:03 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v6 02/51] drm/connector: Add helper to get a connector
 type name
Message-ID: <20200217094303.GJ2363188@phenom.ffwll.local>
References: <20200216210308.17312-1-laurent.pinchart@ideasonboard.com>
 <20200216210308.17312-3-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200216210308.17312-3-laurent.pinchart@ideasonboard.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Sam Ravnborg <sam@ravnborg.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Feb 16, 2020 at 11:02:19PM +0200, Laurent Pinchart wrote:
> drm_connector.c contains a map of connector types (DRM_MODE_CONNECTOR_*)
> to name strings, but doesn't expose it. This leads to drivers having to
> store a similar map.

Maybe also a todo if there's many of these?
-Daniel

> 
> Add a new drm_get_connector_type_name() helper function that return a
> name string for a connector type.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/drm_connector.c | 15 +++++++++++++++
>  include/drm/drm_connector.h     |  1 +
>  2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index f632ca05960e..644f0ad10671 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -111,6 +111,21 @@ void drm_connector_ida_destroy(void)
>  		ida_destroy(&drm_connector_enum_list[i].ida);
>  }
>  
> +/**
> + * drm_get_connector_type_name - return a string for connector type
> + * @type: The connector type (DRM_MODE_CONNECTOR_*)
> + *
> + * Returns: the name of the connector type, or NULL if the type is not valid.
> + */
> +const char *drm_get_connector_type_name(unsigned int type)
> +{
> +	if (type < ARRAY_SIZE(drm_connector_enum_list))
> +		return drm_connector_enum_list[type].name;
> +
> +	return NULL;
> +}
> +EXPORT_SYMBOL(drm_get_connector_type_name);
> +
>  /**
>   * drm_connector_get_cmdline_mode - reads the user's cmdline mode
>   * @connector: connector to quwery
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index b3815371c271..c3bd5262db9c 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1518,6 +1518,7 @@ drm_connector_is_unregistered(struct drm_connector *connector)
>  		DRM_CONNECTOR_UNREGISTERED;
>  }
>  
> +const char *drm_get_connector_type_name(unsigned int connector_type);
>  const char *drm_get_connector_status_name(enum drm_connector_status status);
>  const char *drm_get_subpixel_order_name(enum subpixel_order order);
>  const char *drm_get_dpms_name(int val);
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
