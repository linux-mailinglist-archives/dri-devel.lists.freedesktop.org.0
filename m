Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF372DD116
	for <lists+dri-devel@lfdr.de>; Thu, 17 Dec 2020 13:07:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DADF89AA2;
	Thu, 17 Dec 2020 12:07:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD54A89AA2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 12:07:37 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id i9so26359019wrc.4
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 04:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5rVqR8X3zCmJ1TfHqm2l3WE/hslvMB4X38QQFCM07CE=;
 b=F+/Ztg5as31iTbcBJG7GWDxQUvfLLAsUjmBBXqgjZbohZbILJhXxoq/5Y0qZmifm2x
 +6CeSuDnaiUbeKPlIXc2a1TpJpLwld8xJkZ9SVMpnuS7yFfKRNBI4vnf+e3U98YPt+Pj
 2+OtElELiqMD5qHnFT8F2IHUQniv8hoU5JOyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5rVqR8X3zCmJ1TfHqm2l3WE/hslvMB4X38QQFCM07CE=;
 b=P/hVzx/VbV2Ybj3jj3neB0mBc5ZI55NdkGaJpckROewYop/astEExrwp67eeb40G01
 9J0Wqfq95zq/RuYpt06tmdDqqoYtElGzcJi4J8VrKHmRUFNiDqA0s3ckgFduMoxt0dyt
 uJAvm8zq9jJQVMiN4TnXvgE3Ghr2R4ITAwrrDvNsLaamRRoS0kBjvBN4myRgEpcvFNjk
 Z/sAkMdvTxzPnZYCVkAzcw987x7p5DneQzSgldhhuB2K0nIzsTU0aVSlPIAC3Np6no/5
 BiVVYvXBJx9K5RqBo/c0hCbffkiopWyt3FU8awl5YGSnrBdDSpZW6mkIGftYjhkXs6sH
 fEoA==
X-Gm-Message-State: AOAM5306gP+vTEjD1j7vtvj7nKMRRw5v8kG6NN+dTIgZA20Ym/RJLrxb
 lmJWNgK/ZBCxpCsUZSWnwpY4cw==
X-Google-Smtp-Source: ABdhPJwcUCcTee9Hta5qB24Lwq+X9YAbW+AZFJM2s4u16XgMxAjKFe+u1fTRql+bnUQAwMeQCUcXqg==
X-Received: by 2002:a5d:470d:: with SMTP id y13mr37411149wrq.309.1608206856600; 
 Thu, 17 Dec 2020 04:07:36 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d187sm7242590wmd.8.2020.12.17.04.07.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 04:07:35 -0800 (PST)
Date: Thu, 17 Dec 2020 13:07:34 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2 7/9] drm/doc: remove drm.h file comment
Message-ID: <X9tKBhRxID7kjsCP@phenom.ffwll.local>
References: <20201217113220.102271-1-contact@emersion.fr>
 <20201217113220.102271-8-contact@emersion.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201217113220.102271-8-contact@emersion.fr>
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

On Thu, Dec 17, 2020 at 12:32:18PM +0100, Simon Ser wrote:
> Our documentation build system chokes on \file comments. This comment
> seems mostly historical and doesn't provide any useful information.
> 
>     ./include/uapi/drm/drm.h:2: warning: Cannot understand  * \file drm.h
>      on line 2 - I thought it was a doc line
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>

I think just removing the formatting and leaving the historical author
info here (this long predates git) is better. For that version:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  include/uapi/drm/drm.h | 10 ----------
>  1 file changed, 10 deletions(-)
> 
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 5c31aea1f342..783f666152a1 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -1,13 +1,3 @@
> -/**
> - * \file drm.h
> - * Header for the Direct Rendering Manager
> - *
> - * \author Rickard E. (Rik) Faith <faith@valinux.com>
> - *
> - * \par Acknowledgments:
> - * Dec 1999, Richard Henderson <rth@twiddle.net>, move to generic \c cmpxchg.
> - */
> -
>  /*
>   * Copyright 1999 Precision Insight, Inc., Cedar Park, Texas.
>   * Copyright 2000 VA Linux Systems, Inc., Sunnyvale, California.
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
