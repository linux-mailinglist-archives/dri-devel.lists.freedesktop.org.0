Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2F02DD10B
	for <lists+dri-devel@lfdr.de>; Thu, 17 Dec 2020 13:04:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7021E89836;
	Thu, 17 Dec 2020 12:03:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 873A689836
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 12:03:56 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id 190so5335710wmz.0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 04:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=vKHp2uS+Xvi7ulROLpSZH6z0aZeCBYmKMGlDqgLvIrc=;
 b=fTFkE/635caZduIHNPYObhfwe1UlqEz5gqXvVd/UG5h0qzgPdgBtkNoFSxaH2t49Sq
 K/LpHHgGPU+TSbqVuVLbtjKAapZhz8q3sxNqQjaBNHFPFWvp2il+JKG8amARHWigXBQl
 +hNUhJD/9dWMvrMo6S/TeELF81P8T90s5Uwog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vKHp2uS+Xvi7ulROLpSZH6z0aZeCBYmKMGlDqgLvIrc=;
 b=pjydqtCnwB4V3BYzt/bITLJmkH/Nl7nre876kKMPb/l14rGJ3GtldBui9vuL7AcLs0
 t4QpjmIEiQwSbVirPLBeSlGvA2vyDvlz7AaREjGmY9iiOnq2dBcg3RX1eQmXjiOdhQuB
 b5AUf7+z3Oypr0d6uizKq776kYsVJxLuKvS3KrNkkDHX27oT0dwDSUaqV4l6Rn2yKffL
 Jmf0SU8HvSjTvv3adHCipZYWm+hbknXcuoGE0Az77uA79gAdvDZLldMeE9ZY8PLbtJdL
 FqXUmkvUPTvO+YFTYU1R6NL5Ze9UPDBAe4MWJMz8uIenJYuWKark5v8vw8aZUsbeyjTF
 82kw==
X-Gm-Message-State: AOAM533mT5/NVV3Rtex5isk1eChom1xoVhTELPzKZhn7nRbD/sYDwLc1
 CxpDRMiBXBsTkQRQHtYOJkLSfw==
X-Google-Smtp-Source: ABdhPJzK8ONNQReI8wkXN6rO0vCtbxGEzub/7tLn2a5PmaMsN6LatMfQAcziRzALQmAUe2aXnltiFA==
X-Received: by 2002:a05:600c:2255:: with SMTP id
 a21mr8373832wmm.122.1608206634996; 
 Thu, 17 Dec 2020 04:03:54 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h13sm8373168wrm.28.2020.12.17.04.03.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 04:03:54 -0800 (PST)
Date: Thu, 17 Dec 2020 13:03:52 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2 1/9] drm/doc: the KMS properties section is for
 user-space devs
Message-ID: <X9tJKDGbkgvaZq7E@phenom.ffwll.local>
References: <20201217113220.102271-1-contact@emersion.fr>
 <20201217113220.102271-2-contact@emersion.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201217113220.102271-2-contact@emersion.fr>
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

On Thu, Dec 17, 2020 at 12:32:12PM +0100, Simon Ser wrote:
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
> index 2f3efb63e5ba..7a05601f1067 100644
> --- a/Documentation/gpu/drm-kms.rst
> +++ b/Documentation/gpu/drm-kms.rst
> @@ -460,6 +460,9 @@ KMS Locking
>  KMS Properties
>  ==============
>  
> +This section of the documentation is primarily aimed at user-space developers.
> +For the driver APIs, see the other sections.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

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
