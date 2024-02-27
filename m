Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B205C868F49
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 12:40:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E581510E8F5;
	Tue, 27 Feb 2024 11:40:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="aTKh9OLE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B10D10E8F5
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 11:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709034024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3mw01XXpryJKRKAORiZ7cEnFjgIHdaozOVRjQNVNt4A=;
 b=aTKh9OLEzm90DgFGS0OX0d/X8hNHF1PEtfhNF4RhVIZCsHd8nhW38IYS0GDI7u3C6eMWH3
 n/TiZd8omrYjuj+YdJfUaIVXo04tXnERpz04JTGCZGnwW1cbyy4Mby4RX+MuRxe7rowIr2
 TuUjTL44VYo+mnTljUwNBlqK6g9/Ql8=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-580-IUEobBMaPa-g0dGaOeue-Q-1; Tue, 27 Feb 2024 06:40:20 -0500
X-MC-Unique: IUEobBMaPa-g0dGaOeue-Q-1
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-513149e133cso93813e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 03:40:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709034019; x=1709638819;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3mw01XXpryJKRKAORiZ7cEnFjgIHdaozOVRjQNVNt4A=;
 b=IB8VnWz6Ai6ztJMCyVDQeESkvBQWLy0MmR/KO9T38W4KqSWHAonvFa2MWybPAIo7LX
 qGYgPm0o3rUv9muWHaYJ/y9WG0bCHQthh1802JF0PYrDMh26WLAcqZ6kLmckVYB1qC7y
 jiX3g1zUF7+d1G/RL8/hIHw484zNTwwjhLftRW/Hs7lKwSy1SP3EDOz+J0+dowVOQtZx
 yUa0EQTPtaF4eYE4iPLwDvkBg0BGgTDYLOH9XEPPHH1mnPbzEjfapL0+mi9Gxbjo2YCT
 mNPP9VWep5vAd79HlZqKOEvD4tdfTmIzy80mDIVsrizw7+npwHG6xEeG4sVfATyqemNZ
 qlQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyt1rsQv9HrLDB/5DzN2StgAPrcoVC/NmKrs6S87pa4xOtrUmOSE8Ho68OvcUfx6eRWPcTN86YoNnQJeLk5U5XxjCn+fUPP1qUWnwZforK
X-Gm-Message-State: AOJu0YxHwmBSTbVI7kjRupuGfhGPtqrj2aFR4p+vLfg9RYNhXyaWTvse
 dCsaAznxc+AysaoxhKEv/hVQKttLXdvLIvUwNF9rUdhsCghw/GCZ3YsoaKot+4g/cmVzQpExG/w
 lsF0yGm8B/l9jPdyY+U4YMz2ZCBdKC0g6NSSkfnGLWofgB4decIE/ppWCtL1jdREGJw==
X-Received: by 2002:ac2:46e8:0:b0:512:a9a4:d933 with SMTP id
 q8-20020ac246e8000000b00512a9a4d933mr5300865lfo.69.1709034018912; 
 Tue, 27 Feb 2024 03:40:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBw1Ufu0N6OMJCScexgMEis14r2PvFD91GAV1n+pyDTqUegH7T8+rIGmGhy7XM3ak47JIm6w==
X-Received: by 2002:ac2:46e8:0:b0:512:a9a4:d933 with SMTP id
 q8-20020ac246e8000000b00512a9a4d933mr5300858lfo.69.1709034018567; 
 Tue, 27 Feb 2024 03:40:18 -0800 (PST)
Received: from localhost ([90.167.87.87]) by smtp.gmail.com with ESMTPSA id
 j3-20020a5d4523000000b0033cfa00e497sm11083463wra.64.2024.02.27.03.40.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Feb 2024 03:40:18 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm: Remove drm_num_crtcs() helper
In-Reply-To: <20240227112038.411846-1-thierry.reding@gmail.com>
References: <20240227112038.411846-1-thierry.reding@gmail.com>
Date: Tue, 27 Feb 2024 12:40:17 +0100
Message-ID: <87a5nmrv8e.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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

Thierry Reding <thierry.reding@gmail.com> writes:

Hello Thierry,

> From: Thierry Reding <treding@nvidia.com>
>
> The drm_num_crtcs() helper determines the number of CRTCs by iterating
> over the list of CRTCs that have been registered with the mode config.
> However, we already keep track of that number in the mode config's
> num_crtcs field, so we can simply retrieve the value from that and
> remove the extra helper function.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpu/drm/drm_crtc.c | 15 +--------------
>  1 file changed, 1 insertion(+), 14 deletions(-)
>

Indeed. I don't see why this helper would be needed.
Your patch makes sense to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

