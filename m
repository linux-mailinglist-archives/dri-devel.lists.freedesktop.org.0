Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E2AA19063
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 12:12:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C977810E228;
	Wed, 22 Jan 2025 11:12:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="HosQSPx7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2A6810E228
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 11:12:56 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-436202dd7f6so77651575e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 03:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1737544315; x=1738149115; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=sE7J5TBXjk0JCEFcwJGmFWB2lLhLqat8jTo050BxWe8=;
 b=HosQSPx75hbQYrs5nY5XZt28rbcIjJBe46UII5pgbfbN+7DHLaiXqB9HhmlOSqusXK
 eScPnUBzbdVq5F9Stv2v91dEHWcitjen8vH2fuWrJvtm9XnlbTfu71ZbEAsNJ5aCDG83
 Slw5TEaWO7KOau0+5SaKOrqn7gI/hql03I5hs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737544315; x=1738149115;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sE7J5TBXjk0JCEFcwJGmFWB2lLhLqat8jTo050BxWe8=;
 b=XU6oRQuUWb+I9Ebn/ChHn4eWhY9YzdKVtVNlpNsomKcrwXHGHdkQT/r4fVT6BhZzOH
 PkKYUi0fV8T43O7onlpOh/ySEmPq3fUSYae4pIt1bzO/+33A3Q5wQU8Ena56I3b3DTsH
 hoi/NgmlhHI0Ww/oBS+r+Po+Ee9lZZCfkPmyRSKMls4W68Js1ca8RaKdJBBHKUB/yCfp
 1wOPXikqDgTrz3llBaWiItgzocMx8CKXzjNEyk4ou0ohwjBc0dB6RuLL55ISGpVnQk3N
 IYR/t59esSefGDUf7VfHnM8njEJA5NPDtS6RFYJnOxDDylrvFGNTDVDBQj6hIabsmFBS
 cUAw==
X-Gm-Message-State: AOJu0YxBBU6rGMIzfvl7z9BQasQBXSWIGlfFNSpgaP/D83tbWbDNlrGw
 9ctLtptkyZtn5S5hnY+Ol6jryRmAX8ycLRAtO5dLWO7iqygW7gFAWj6n56bCe4q5f/WpU/1Ly9g
 /
X-Gm-Gg: ASbGncv0o86Hj9pG9IYQeQKT9DTgcq4h8wUYtKD55JX7Wm0hOI38nRvdgTCZlO1LUQJ
 Q5w7e4NgBiccbCDPc6nDsvYbz2G9uyzn0XBIzh0YSXQI9TNRUbNE1OXsc8exJ/zWKR8I8fjUnNo
 JkIPIk+5G/fJy0Gi35x6crDE9psTpF3LzRELGPeuxwnyEL9fbehQlTOoRsf5EgakeP6C6camnhd
 b1nmolCjKIdghMxvXaZqxc1Qbw2LBd0SfQlfdBzflnU4Ft0KUY6rr5h722HpfgO+aVCpO+7UzPk
 xl3QbA==
X-Google-Smtp-Source: AGHT+IEYtsLayDW+s9TzDAqOsst5UkleHsJ8pGl45i7vDcFLkscNLYT6KWSaOMK2RFNbsdruGXpBag==
X-Received: by 2002:a5d:47c2:0:b0:385:e8ce:7483 with SMTP id
 ffacd0b85a97d-38bf56555admr15551791f8f.4.1737544315305; 
 Wed, 22 Jan 2025 03:11:55 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf3221db2sm15707913f8f.29.2025.01.22.03.11.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2025 03:11:54 -0800 (PST)
Date: Wed, 22 Jan 2025 12:11:53 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/print: Include drm_device.h
Message-ID: <Z5DSeQjrUKym5Dzb@phenom.ffwll.local>
References: <20250121210935.84357-1-gustavo.sousa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250121210935.84357-1-gustavo.sousa@intel.com>
X-Operating-System: Linux phenom 6.12.3-amd64 
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

On Tue, Jan 21, 2025 at 06:09:25PM -0300, Gustavo Sousa wrote:
> The header drm_print.h uses members of struct drm_device pointers, as
> such, it should include drm_device.h to let the compiler know the full
> type definition.
> 
> Without such include, users of drm_print.h that don't explicitly need
> drm_device.h would bump into build errors and be forced to include the
> latter.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  include/drm/drm_print.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index f77fe1531cf8..9732f514566d 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -32,6 +32,7 @@
>  #include <linux/dynamic_debug.h>
>  
>  #include <drm/drm.h>
> +#include <drm/drm_device.h>

We much prefer just a struct device forward decl to avoid monster headers.
Is that not doable here? Worst case I'd convert the drm_info_printer()
static inline to a macro, not sure about the exact rules here if you
never deref a pointer.
-Sima

>  
>  struct debugfs_regset32;
>  struct drm_device;
> -- 
> 2.48.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
