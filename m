Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5105B1A08EA
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 10:09:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD5C389DBA;
	Tue,  7 Apr 2020 08:08:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F04989DBA
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 08:08:55 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id x25so792697wmc.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Apr 2020 01:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=d7KRz0KTDg48oLgZa5d1A3RRcl9za7nLkIf7O00lbPw=;
 b=hO5xZOkOTEa17FQaz2R19IJTNHYAptlTxncXvUWzU7UVA1mWMdevbGJqPM6VxiIrrY
 8UTrE5tNJmYU0ej6EVbAHmCymU2kykCpUdlheWE10ZznXl/vXMAd8mBZP1Qo3mfmA6wS
 EC11Q+Zj1A9Lf8MLfrX7tPNdKmBTj2Y9SVxuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=d7KRz0KTDg48oLgZa5d1A3RRcl9za7nLkIf7O00lbPw=;
 b=H7J+udtDyYz3uV1j5NHobZP+5HcqbrL6pWH+H5pRQI5B9zZL9Ql0eu+oVK+a8xsRAn
 usUkMk5fHqwEZzynVc1uwUwK51iU7MH8LJ2NroPahTiDHCsHSXcisRegUzHn0w0SpQcm
 nw33gQYWkkfnumvpZJ7sQ61/5u6GqW/Ttob0A4UFOd+XeJmlcryl5l8pMoPacRctOwRS
 Uv2N1SUNpedmVVKyX4vqFWlQ18kyd9SZDmm3J4nZ41QgRALW9TxRltJV88PKmL0/ndj+
 b6l4aQrgnlNMxN97XItNKi1X4dwdFr4JCjkXPqg8/DLZPHo2qKIJOw/eDhyUQRDxa2vO
 roVg==
X-Gm-Message-State: AGi0PuZaU8gmpXS+Q7iPnwUyYB8rh6hNxhwpTgvgFW7vTbI4MY0W0XZZ
 YEKCFo8RE+Q9JA4SxFOyUqGHQg==
X-Google-Smtp-Source: APiQypKpWSewGwKB9P4+a3hN3b/I0Y31w8oPvUUGWjyj4PEzvrPNnoQtvydMRYP+d9riRle7FTL15A==
X-Received: by 2002:a1c:f315:: with SMTP id q21mr1080557wmq.169.1586246933988; 
 Tue, 07 Apr 2020 01:08:53 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 9sm1278026wmm.6.2020.04.07.01.08.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2020 01:08:53 -0700 (PDT)
Date: Tue, 7 Apr 2020 10:08:51 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 3/3] drm/writeback: wire drm_writeback.h to kernel-doc
Message-ID: <20200407080851.GH3456981@phenom.ffwll.local>
References: <20200406194746.26433-1-sam@ravnborg.org>
 <20200406194746.26433-4-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200406194746.26433-4-sam@ravnborg.org>
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 06, 2020 at 09:47:46PM +0200, Sam Ravnborg wrote:
> drm_writeback.h included a lot of nice kernel-doc comments.
> Wire it up so the header file is included in the kernel-doc
> generated documentation.
> 
> Added a few simple comments to the two structs so they
> get picked up by kernel-doc.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Brian Starkey <brian.starkey@arm.com>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  Documentation/gpu/drm-kms.rst | 3 +++
>  include/drm/drm_writeback.h   | 9 +++++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
> index e1f685015807..397314d08f77 100644
> --- a/Documentation/gpu/drm-kms.rst
> +++ b/Documentation/gpu/drm-kms.rst
> @@ -397,6 +397,9 @@ Connector Functions Reference
>  Writeback Connectors
>  --------------------
>  
> +.. kernel-doc:: include/drm/drm_writeback.h
> +  :internal:
> +
>  .. kernel-doc:: drivers/gpu/drm/drm_writeback.c
>    :doc: overview
>  
> diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
> index 777c14c847f0..9697d2714d2a 100644
> --- a/include/drm/drm_writeback.h
> +++ b/include/drm/drm_writeback.h
> @@ -15,7 +15,13 @@
>  #include <drm/drm_encoder.h>
>  #include <linux/workqueue.h>
>  
> +/**
> + * struct drm_writeback_connector - DRM writeback connector
> + */
>  struct drm_writeback_connector {
> +	/**
> +	 * @base: base drm_connector object
> +	 */
>  	struct drm_connector base;
>  
>  	/**
> @@ -78,6 +84,9 @@ struct drm_writeback_connector {
>  	char timeline_name[32];
>  };
>  
> +/**
> + * struct drm_writeback_job - DRM writeback job
> + */
>  struct drm_writeback_job {
>  	/**
>  	 * @connector:
> -- 
> 2.20.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
