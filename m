Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D11C2DC82D
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 22:14:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5706B89468;
	Wed, 16 Dec 2020 21:14:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9759E89468
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 21:14:47 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id y17so24509293wrr.10
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 13:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Eawa+80AgHDxU7p40eFdeOQAs+s2y8tiMqNm2nP5gDU=;
 b=GGtdXn/jAuGnQhzgK07oD9j8NGnKZOULeTF6PzTeb4HaJb552sJSobr+Djc2vyL2BW
 rE96EPg0viOYFJBV8xGmkOfuaVu+1TNoxXdCU7L341vmffJv9gSfPvNBasTZwQegeuda
 PL9tH73fGLdVUiIlyHWE8VArQK040HACJt5EQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Eawa+80AgHDxU7p40eFdeOQAs+s2y8tiMqNm2nP5gDU=;
 b=jwAfIBtdhfHlh2I/tVZ/VPl7b77SgLcXMLsut/jsZX8NWDZwV4ZeFbikGXrNMSbipw
 s7+hPUJYK/KS1XdBTCJbAomkHa3pePcKEmvKuK5bZna0hcQYqx7Ll1a4S90hfGkEWFqo
 IZTA4GfByaLc+rbX94QPx7FbDg6wUYycxUIyjGPZ4sUAVKgdhoLtrUmIX1TSqEmz8+CA
 Dcu6WPWf93OgYTCLBFwoNlYgbyKTO8tQJw8a2Cguc9JLTW0ID92SizHplu1kl+x5zhxj
 Hyg4qTgWjzjfqg3XEhXMZRCzLsJav85Hr+zQ3Kp3oSW1FFy18evx9BAapcb9Ff5inl34
 Y7Ow==
X-Gm-Message-State: AOAM532lwV920W9EgySjUQBnBD7TIXGxRayG3eH4lswmfcHAJeZZngAe
 K+JxU9mhYa1Y3qxZ2HzE7tYp/Q==
X-Google-Smtp-Source: ABdhPJzGOggoyBmBjWwcXPgF3w3Trs+UmAOPOS7s0rTc6zb2Qr2vlKbRbu15x2+exqrFN7AA85340A==
X-Received: by 2002:adf:8185:: with SMTP id 5mr8674047wra.44.1608153286329;
 Wed, 16 Dec 2020 13:14:46 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h20sm5138215wrb.21.2020.12.16.13.14.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 13:14:45 -0800 (PST)
Date: Wed, 16 Dec 2020 22:14:43 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 5/8] drm/doc: the KMS properties section is for
 user-space devs
Message-ID: <X9p4w7neZqcKsAnH@phenom.ffwll.local>
References: <20201216202222.48146-1-contact@emersion.fr>
 <20201216202222.48146-6-contact@emersion.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201216202222.48146-6-contact@emersion.fr>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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

On Wed, Dec 16, 2020 at 09:22:19PM +0100, Simon Ser wrote:
> State that the "KMS Properties" section is mainly for user-space
> developers.
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> ---
>  Documentation/gpu/drm-kms.rst | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
> index 2f3efb63e5ba..fcd4e15379b0 100644
> --- a/Documentation/gpu/drm-kms.rst
> +++ b/Documentation/gpu/drm-kms.rst
> @@ -460,6 +460,9 @@ KMS Locking
>  KMS Properties
>  ==============
>  
> +This section of the documentation is primarily aimed at user-space developers.
> +For the driver APIs, so the other sections.

s/so/consult/ ? 2nd sentence doesn't parse here.
-Daniel

> +
>  Property Types and Blob Property Support
>  ----------------------------------------
>  
> -- 
> 2.29.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
