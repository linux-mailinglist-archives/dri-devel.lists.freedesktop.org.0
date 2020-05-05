Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D191C515F
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 10:53:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 640096E573;
	Tue,  5 May 2020 08:53:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88F786E573
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 08:53:42 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id y3so1758351wrt.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 May 2020 01:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=UIkHUMV4Yj2RIV6apr0KJ2z5YGB71epGaZH3k3V8bYQ=;
 b=ZSEr8Mpmoom7F7RXc/Y5zmw0c0i3MuyYkXQC/UzWUCCXl6UX+Ksr9BHwtuw9zJahLa
 /BTPRdD92tB4uRge+uhjWUwcQofkniwrzZkR984LusrWo09+HAwXgRGzHmSzXikpBMbt
 hvMqiyUq6gzVh7iKvZAjO6roQ8sN3ijx/akQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=UIkHUMV4Yj2RIV6apr0KJ2z5YGB71epGaZH3k3V8bYQ=;
 b=RDsf8hdUQ4R/oFXJaMMzrOs6Re2GwYO9Op75HcMP6/B4eXFmUGl0wHdtj6zY097Zcy
 8ht2oaN5cuDkWWbBE6MC5cGgDZPnUiEdxX88zUFewClfvbbgJGx/GlLp1JGnXBZNz7S8
 VhIWUGbPOyj2eMAFUMspBnwYMxo3+s5ilZAmpsY79zzern2Xv29VB1p0A5O245foZPxH
 OGnqoPHFHPxsAAW97KM9fwG1bRFjJXideUrpe1FaHIMHTuZrPK+gPb63jPrxj4kGk5sV
 VTS68nJmffrt+oQqlsXxeT7rFHscXzr1Od6eSAs7GdBa2yi3JsNzyZKQGRpV6Sr8uV/u
 mGfQ==
X-Gm-Message-State: AGi0PubAE+9331FVbWDxiGCzZUW+DGcKWOeLOklpUCVnteN7ddW59JTb
 9xKwEJF2qbIH+lBKflkWuRS7RQ==
X-Google-Smtp-Source: APiQypJ5zgqxnnWESW6G9BiTsXSFSG3XRX0PywO7qVilO6UtSHrC7c4wnsb3n7avewawjNE5ClYY+Q==
X-Received: by 2002:a5d:4d0b:: with SMTP id z11mr2715734wrt.81.1588668821301; 
 Tue, 05 May 2020 01:53:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a24sm2623053wmb.24.2020.05.05.01.53.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 01:53:40 -0700 (PDT)
Date: Tue, 5 May 2020 10:53:38 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Emmanuel Vadot <manu@FreeBSD.org>
Subject: Re: [PATCH v2 1/2] drm/client: Dual licence the header in GPL-2 and
 MIT
Message-ID: <20200505085338.GP10381@phenom.ffwll.local>
Mail-Followup-To: Emmanuel Vadot <manu@FreeBSD.org>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, matthew.d.roper@intel.com,
 noralf@tronnes.org, kraxel@redhat.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20200430153347.85323-1-manu@FreeBSD.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200430153347.85323-1-manu@FreeBSD.org>
X-Operating-System: Linux phenom 5.4.0-4-amd64 
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
Cc: tzimmermann@suse.de, airlied@linux.ie,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kraxel@redhat.com, tglx@linutronix.de
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 30, 2020 at 05:33:46PM +0200, Emmanuel Vadot wrote:
> Source file was dual licenced but the header was omitted, fix that.
> Contributors for this file are:
> Daniel Vetter <daniel.vetter@ffwll.ch>
> Matt Roper <matthew.d.roper@intel.com>
> Maxime Ripard <mripard@kernel.org>
> Noralf Tr=F8nnes <noralf@tronnes.org>
> Thomas Zimmermann <tzimmermann@suse.de>
> =

> Acked-by: Noralf Tr=F8nnes <noralf@tronnes.org>
> Acked-by: Matt Roper <matthew.d.roper@intel.com>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Emmanuel Vadot <manu@FreeBSD.org>

Looks like we have them all, applied.
-Daniel


> ---
>  include/drm/drm_client.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
> index 7402f852d3c4..eb259c2547af 100644
> --- a/include/drm/drm_client.h
> +++ b/include/drm/drm_client.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0 or MIT */
>  =

>  #ifndef _DRM_CLIENT_H_
>  #define _DRM_CLIENT_H_
> -- =

> 2.25.1
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
