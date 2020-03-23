Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC0E18F252
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 11:02:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D37B389E69;
	Mon, 23 Mar 2020 10:02:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8FC589E7B
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 10:02:02 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id b12so886891wmj.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 03:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=c/G3djmQ9L0s/XsuKOJMNgPp2LxlAoZHW8O26I1non0=;
 b=eEY3uZnhGEDCgL9uvcc+LVLbAOe814GpFFht2gcuhkkWurLKI7o/UlKGmkUdVtuEWs
 f5WO6hDGOofOCnnKSop6fczJf2pKeWBaCxp9XBwoTO1IFcePhT44oN6SzIfCgo58Yr+G
 +xDOJYD1d8IAF8r83fkECDl7N430d8Wf2hagE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=c/G3djmQ9L0s/XsuKOJMNgPp2LxlAoZHW8O26I1non0=;
 b=iDI+3SACOi6YCLuwfRPRJZaFh8ME7DZWXpdRP1a1K+eDf6meIUk1UysODnIzle1iSM
 xUpEPY7slcpJBX7b3GH5xPXiJBuf7azv4ElSUyr2UNRU8p/dsLSLANzUQqBF2ShVbyqM
 aAurL8o47tf+Cktb9HtkOXpsKE9rvF2g+6azN5VH3EOQDs+PYMJ2NZ2//AvcS4znuxx5
 U9zE2fQotFzHuOI5NBK4xkBIB0phzz/6hCfnX3bUIuo+wEx6f4QQrpMM6KvDoX8omjbV
 GNxanKtenMWfjEux/UNuXefbYxZ0rDsYDX2oNnD6fuxWAdvATk7+3hCEIkOrZw86kGxK
 aOAA==
X-Gm-Message-State: ANhLgQ0UW4wWP0TW1Fdf3jfV+UME9d7WwI6SNQSlaZ1hm73tgNROEG84
 0IGv+wSe6y0TkQIPWdRG+DUPUA==
X-Google-Smtp-Source: ADFU+vsk7vFUSdGnPkqggTjZX5hkr49MPDRR/bYWeclQuUjn3zcUH6a9NaMeOd4uYXwUkAsjJGuHmQ==
X-Received: by 2002:a1c:9a8d:: with SMTP id
 c135mr26810585wme.183.1584957721327; 
 Mon, 23 Mar 2020 03:02:01 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id i8sm22081696wrw.55.2020.03.23.03.01.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 03:02:00 -0700 (PDT)
Date: Mon, 23 Mar 2020 11:01:58 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Emmanuel Vadot <manu@FreeBSD.org>
Subject: Re: [PATCH 1/2] drm/client: Dual licence the header in GPL-2 and MIT
Message-ID: <20200323100158.GG2363188@phenom.ffwll.local>
Mail-Followup-To: Emmanuel Vadot <manu@FreeBSD.org>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, matthew.d.roper@intel.com,
 noralf@tronnes.org, kraxel@redhat.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20200320022114.2234-1-manu@FreeBSD.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200320022114.2234-1-manu@FreeBSD.org>
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
Cc: tzimmermann@suse.de, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kraxel@redhat.com, tglx@linutronix.de
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 20, 2020 at 03:21:13AM +0100, Emmanuel Vadot wrote:
> Source file was dual licenced but the header was omitted, fix that.
> Contributors for this file are:
> Daniel Vetter <daniel.vetter@ffwll.ch>
> Matt Roper <matthew.d.roper@intel.com>
> Maxime Ripard <mripard@kernel.org>
> Noralf Tr=F8nnes <noralf@tronnes.org>
> Thomas Zimmermann <tzimmermann@suse.de>
> =

> Signed-off-by: Emmanuel Vadot <manu@FreeBSD.org>

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  include/drm/drm_client.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
> index 3ed5dee899fd..94c9c72c206d 100644
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
