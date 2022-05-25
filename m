Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C690E534080
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 17:41:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBC4B10E22A;
	Wed, 25 May 2022 15:41:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDFDC10E22A
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 15:41:03 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id y24so4962013wmq.5
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 08:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=WgZHeljHeDsIF0Q3Bp5cCUArAU6gv2HjuQpnboZhtms=;
 b=FZxSw6EUC50GSdfF8YKhwN0iLGcFSgv9ZtvcDdwg1vaj71hTOWyyigRwCDQiF08hrH
 KueH9cpCjuOrYgMtX6oOpGllt2tNR2SXpVOwdezZXwMl4p1MQDEn8fEwQwJQAC3vWhYh
 uoAUCV9LnKvcBv4qMo5vozP96azAoeI+En8iE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=WgZHeljHeDsIF0Q3Bp5cCUArAU6gv2HjuQpnboZhtms=;
 b=JpzDorGCFC4H40YIC4GhDPNGUqn9o/yj7nLKlAEuJWsUjbxsYpMXbHirNH/dgyzGfw
 riXkvtxrk5pMJZeXKSBZoGnBQXYPNR/JPGMnDusx9kylg05tZTIt6q2AOS5ZJwCthul/
 5v3XvYksPiwRET1y65INF+ENMEcLBu3JjmdWA5dp3cDsC/GDa71enkeFvr0mvx3tY7gU
 dYjaGfDnqtDczbi3VukI/1ERtnSe1G5jaeoIyC1AU8pj40+ugXPJCbEwAXNQ4PLhEmdy
 C43I0PEB8lacPN7nHl/n/gh4yzUsC7q1R/7yYqRzMyLnop04QyUF88OqJFIX3RGqukY1
 4NNA==
X-Gm-Message-State: AOAM532pNE1LInblcIXOe/S/lzy5czIOYLeyRZbf3IWsJExc2A7nAT59
 oI2F7INilisy5w+BnOk+65ijGw==
X-Google-Smtp-Source: ABdhPJznB9B6uq7kgaMh4CeHqv5J1w05ZI7o5D0/HWElvBoPxhMB16R41PdTrfoUYPOtW8wxhZcVWg==
X-Received: by 2002:a05:600c:510b:b0:397:46c2:37 with SMTP id
 o11-20020a05600c510b00b0039746c20037mr8708410wms.107.1653493262502; 
 Wed, 25 May 2022 08:41:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 w1-20020a5d6081000000b0020c5253d8e0sm2428682wrt.44.2022.05.25.08.41.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 May 2022 08:41:02 -0700 (PDT)
Date: Wed, 25 May 2022 17:41:00 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Subject: Re: [PATCH] drm/vkms: Update vkms_composer_worker documentation
Message-ID: <Yo5ODIGuMI7GcoYZ@phenom.ffwll.local>
Mail-Followup-To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com
References: <20220521191342.23520-1-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220521191342.23520-1-andrealmeid@igalia.com>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>, kernel-dev@igalia.com,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Melissa Wen <melissa.srw@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, May 21, 2022 at 04:13:42PM -0300, André Almeida wrote:
> Since commit ba420afab565 ("drm/vkms: Bugfix racing hrtimer vblank
> handle") the work is scheduled at vkms_vblank_simulate() and since
> commit 5ef8100a3919 ("drm/vkms: flush crc workers earlier in commit
> flow") the work is flushed at vkms_atomic_commit_tail(). Update function
> commment to reflect that.
> 
> Signed-off-by: André Almeida <andrealmeid@igalia.com>

Applied to drm-misc-next, thanks.
-Daniel

> ---
>  drivers/gpu/drm/vkms/vkms_composer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index c6a1036bf2ea..914c0ac7dc8b 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -213,7 +213,7 @@ static int compose_active_planes(void **vaddr_out,
>   *
>   * Work handler for composing and computing CRCs. work_struct scheduled in
>   * an ordered workqueue that's periodically scheduled to run by
> - * _vblank_handle() and flushed at vkms_atomic_crtc_destroy_state().
> + * vkms_vblank_simulate() and flushed at vkms_atomic_commit_tail().
>   */
>  void vkms_composer_worker(struct work_struct *work)
>  {
> -- 
> 2.36.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
