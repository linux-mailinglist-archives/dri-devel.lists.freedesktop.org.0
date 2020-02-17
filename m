Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80465160E72
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 10:27:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 104A66E8DA;
	Mon, 17 Feb 2020 09:27:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 718A56E8DA
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2020 09:27:09 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id r11so18695955wrq.10
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2020 01:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=QvErWIb5S/uA6PFWOeMDnc2AE5YEYZNhLlZmfOWNVCk=;
 b=d7j3oGOWhVJU1EeHCkuhfd5rV6btv2OpWWlWXsT1vDJfBvN4GyLzhjc4d3PnB6X85v
 q90kZdGApPBVFOsTRC9hhGh7zTY582Ke7R+uwKWLMFXPJL9FUmFie67e/1tXPMYUXUo0
 /gxnXxXqG4i5Ma75+snordE2m4kIFFW+eb13Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=QvErWIb5S/uA6PFWOeMDnc2AE5YEYZNhLlZmfOWNVCk=;
 b=mcmk49QC+P0pghSSqm917DQrxsfJFhWWAHoh8JGC0WopYcHCKKzm/Gu2BePx8fCv1P
 8VdDQY+lQjrTNzxtIaSLe4ft2oCkbV+dP23SvXmCERH/7r5Kpe+AKuLeNGr+rLupXach
 uESYcF8zbVC9btifca1OvahG4mTCGUf02iDJmmNvHjnFwb6BpZPxc9ahqB/502cwAqM4
 x+m9idCcL9CcrdbyzeiuG4mchbxRBEuqnBQ9XVqXGu9Q5sbgGKZZV2zZ40Q+2dxRty3C
 3Iguo5F3g0XgCVPKVmMFvFhSL0T6BEoLLc8Fvr4huOifYvrrxmZchZQXUH/9/I9Fe0K5
 1eGA==
X-Gm-Message-State: APjAAAV6019OD2rrgOC7dgBbUD8027w2m8tHiBeKcLyOFEKX7/q7G9x8
 ZLe/ih/IOd2tXc1KtVz+shWWOw==
X-Google-Smtp-Source: APXvYqyEofBTojDI8GHGTPMb6Dq3HZCbMdNUJ6xlC4vWUe1Co3YZ5fHSHg2v5biis04RgN+hS3xOvg==
X-Received: by 2002:a5d:6692:: with SMTP id l18mr20370782wru.382.1581931628031; 
 Mon, 17 Feb 2020 01:27:08 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x11sm19658953wmg.46.2020.02.17.01.27.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2020 01:27:07 -0800 (PST)
Date: Mon, 17 Feb 2020 10:27:05 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Emmanuel Vadot <manu@FreeBSD.org>
Subject: Re: [PATCH v2 2/2] drm/format_helper: Dual licence the file in GPL 2
 and MIT
Message-ID: <20200217092705.GE2363188@phenom.ffwll.local>
Mail-Followup-To: Emmanuel Vadot <manu@FreeBSD.org>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@linux.ie, jani.nikula@intel.com, efremov@linux.com,
 tzimmermann@suse.de, noralf@tronnes.org, sam@ravnborg.org,
 chris@chris-wilson.co.uk, kraxel@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20200215180911.18299-1-manu@FreeBSD.org>
 <20200215180911.18299-3-manu@FreeBSD.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200215180911.18299-3-manu@FreeBSD.org>
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
 linux-kernel@vger.kernel.org, efremov@linux.com, jani.nikula@intel.com,
 sam@ravnborg.org, kraxel@redhat.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Feb 15, 2020 at 07:09:11PM +0100, Emmanuel Vadot wrote:
> From: Emmanuel Vadot <manu@FreeBSD.Org>
> =

> Contributors for this file are :
> Gerd Hoffmann <kraxel@redhat.com>
> Maxime Ripard <mripard@kernel.org>
> Noralf Tr=F8nnes <noralf@tronnes.org>
> =

> Signed-off-by: Emmanuel Vadot <manu@FreeBSD.org>

Patch applied since we have all the acks we need. I think for the first
one we still need a few more.
-Daniel

> ---
>  drivers/gpu/drm/drm_format_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_fo=
rmat_helper.c
> index 0897cb9aeaff..3b818f2b2392 100644
> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +// SPDX-License-Identifier: GPL-2.0 or MIT
>  /*
>   * Copyright (C) 2016 Noralf Tr=F8nnes
>   *
> -- =

> 2.25.0
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
