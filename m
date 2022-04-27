Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAD55118A7
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 16:12:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF0810F4AF;
	Wed, 27 Apr 2022 14:12:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EC6110F4AF
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 14:12:16 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id z99so2098471ede.5
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 07:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=11Ehteq4IMxQiJPEAvQ0GJFJcB0Vx+nhzT9rMTdF62k=;
 b=QF3G9fLMgv8G/oXNKkd4GDP5NWz2waO7sDY4PO/cTtUGRGllF8p1t7kpMLLgNJ0CX9
 enKU60/wL6m3m7mzlczohGqKtJelB7GCuJDfaaVraG8mh/xhS+Tyk6xdD/0q8JLCl2sv
 9KwpunEOeZpfBI8oAZD5LrHQgfAYqMCxOpNQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=11Ehteq4IMxQiJPEAvQ0GJFJcB0Vx+nhzT9rMTdF62k=;
 b=WtmFjUZGRR1YcHOJrcAU3UakD6zVd7uA0YP9VbNugj/vhuKPoMknCdabJF6rft4cJR
 Gmqao+72RELSG8vk8TMVZzyR0phjctYuAVKrtGy7at15oTQDMDRKKqziaGMr3DuRCkh6
 TDUL2bYXSGjeuQUwvrbAR63/ARlC6iskQW+NjvCHjHd6TMgQZuCoFc67DiISpVcyDhTI
 yHk0LVAvib01HmIARxewHydoUvipj8nSZVw7uYZuTTrgTOzUr4s00ZF1y9dVfax+t5fs
 8bNqsoe2B/qWxt7Lba60Mrqu4H4VMuF+c26jknH84PgT4JSMrY4YnVipNtCicaUJ/zGT
 BRKg==
X-Gm-Message-State: AOAM530TwP7cGnlhaYtyx0RK8IVUWDimh+JxThQFwM1TqF3KESJNs7Uq
 1/QBdQivabRS07laBlIljoncKoz1rELGI8rn
X-Google-Smtp-Source: ABdhPJzCb4UFfXZb/lSePgQFoouOvEjD5kyOPL/2slbGY02bkLk0DvoToYrQuRAByxQFD7v/Eu6zXg==
X-Received: by 2002:a05:6402:17c7:b0:425:d52c:8907 with SMTP id
 s7-20020a05640217c700b00425d52c8907mr22237794edy.15.1651068734818; 
 Wed, 27 Apr 2022 07:12:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 n10-20020a170906700a00b006efdb748e8dsm6842956ejj.88.2022.04.27.07.12.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 07:12:14 -0700 (PDT)
Date: Wed, 27 Apr 2022 16:12:12 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH] drm/bochs: Explicitly include linux/module.h
Message-ID: <YmlPPM93q04uNnlU@phenom.ffwll.local>
References: <20220413161259.1854270-1-michel@daenzer.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220413161259.1854270-1-michel@daenzer.net>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 13, 2022 at 06:12:59PM +0200, Michel Dänzer wrote:
> From: Michel Dänzer <mdaenzer@redhat.com>
> 
> Instead of relying on it getting pulled in indirectly.
> 
> Signed-off-by: Michel Dänzer <mdaenzer@redhat.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/tiny/bochs.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
> index ed971c8bb446..4f8bf86633df 100644
> --- a/drivers/gpu/drm/tiny/bochs.c
> +++ b/drivers/gpu/drm/tiny/bochs.c
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
>  
> +#include <linux/module.h>
>  #include <linux/pci.h>
>  
>  #include <drm/drm_aperture.h>
> -- 
> 2.35.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
