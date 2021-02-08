Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DEE3313B31
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 18:43:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 353666E973;
	Mon,  8 Feb 2021 17:43:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA2C56E973
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 17:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612806222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KmWdLoH8dLHKGmSG8cSCigg6WgPpJSGD+1fgfci8yTc=;
 b=RO+tF9tMpM4RGpd2JREjEEyM6y5k7PFuZrDpaG9kNVqpsPFqmDvr+ekTl/3zddG75efzZk
 xjAH2o0gIUu7dBwFm5hMoKqrRN4577swPJadYtYPbr4UVhz6HtfpTietWxCFVUEJmd0pjx
 ftHUf5Cx3AtKfPdcR1uo5R2c33aVdWI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-WGF-GXybPcaK3O3p9RUPYQ-1; Mon, 08 Feb 2021 12:43:41 -0500
X-MC-Unique: WGF-GXybPcaK3O3p9RUPYQ-1
Received: by mail-ed1-f69.google.com with SMTP id t9so14214782edd.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Feb 2021 09:43:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KmWdLoH8dLHKGmSG8cSCigg6WgPpJSGD+1fgfci8yTc=;
 b=nc9v4WVuuTM5NHhBnQJABoK7lEbu4ckbUKnTYfunW3FkZD8hqUYpzTxsPM/7109z/y
 d7WfaZaNUVtTBUpTXX8ZiowRPbL3Gbr/PUH8nP416rMJ/DcyI1sp9n66W+roA7yQeYUt
 ZnQjpl0AYheexz446+NyIerCulHedDJqNMD/BULzFMUcmkhlOAWZavNLgxR1g1Jf6UwF
 m4EkaL+L/YCqxX5UhPPUpkaS2Yk9o8/ytTqjOnu6G5i+PSOwB499/1/tUbr6qRjqx6fQ
 VxEscpWz1QWTa1nazopoc9l8QSePkO7YN9ZePemMzCZMgzWgFMMQU9VPkqZO29koiyFa
 BjAw==
X-Gm-Message-State: AOAM533iVzz1XM9K/E+bSESqcAjApGCR/XOGohMvHZw67oxIOqPhD18/
 vfOOxR080e7r4DVhY+szmZ99IVn6QvtqrKWTjbFGAaSvb3BbamWMGwMVHQK+PgIX/vsXPRyx/kz
 DS2dRXklgMByn44+81LDI4UNGAIcUeRieHNgVk+Eh4nQGvvTpXZtvfEVoSWh5OOvG4/LhlR9SIO
 BQLa8J
X-Received: by 2002:a17:906:7006:: with SMTP id
 n6mr17648836ejj.35.1612806219825; 
 Mon, 08 Feb 2021 09:43:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz5O8mlXwlWgloZ+M+bLQDMvcmTTw8Et7gV92dHa9W+uBjLDRCDbKOGM9r3I6YMvs79Um5ogw==
X-Received: by 2002:a17:906:7006:: with SMTP id
 n6mr17648819ejj.35.1612806219607; 
 Mon, 08 Feb 2021 09:43:39 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id ga5sm1474577ejb.114.2021.02.08.09.43.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 09:43:39 -0800 (PST)
Subject: Re: [PATCH v2 0/2] drm/vboxvideo: Use struct drm_shadow_plane_state
 for cursor plane
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com
References: <20210208135044.27827-1-tzimmermann@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <441f2dbe-d7b1-5f2f-e6c3-2cc0fb45c296@redhat.com>
Date: Mon, 8 Feb 2021 18:43:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210208135044.27827-1-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2/8/21 2:50 PM, Thomas Zimmermann wrote:
> (was: drm/vboxvideo: Vmap/vunmap cursor BO in prepare_fb and cleanup_fb)
> 
> Functions in the atomic commit tail are not allowed to acquire the
> dmabuf's reservation lock. So we cannot legally call the GEM object's
> vmap functionality in atomic_update.
> 
> But, much better, we can use drm_shadow_plane_state to do all the mapping
> for us. Patch 1 exports the helpers for shadow-buffered planes from the
> DRM KMS helper library and adds documentation on how to use them. Patch 2
> replaces the vmap code in vbox' cursor update code with a the helpers for
> shadow-buffered planes.
> 
> Thomas Zimmermann (2):
>   drm/gem: Export helpers for shadow-buffered planes
>   drm/vboxvideo: Implement cursor plane with struct
>     drm_shadow_plane_state

I've given this a test spin in a virtualbox vm using VboxSVGA graphics
and I've not found any problems:

Tested-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> 
>  drivers/gpu/drm/drm_gem_atomic_helper.c | 148 +++++++++++++++++++++++-
>  drivers/gpu/drm/vboxvideo/vbox_mode.c   |  28 ++---
>  include/drm/drm_gem_atomic_helper.h     |  32 +++++
>  3 files changed, 181 insertions(+), 27 deletions(-)
> 
> --
> 2.30.0
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
