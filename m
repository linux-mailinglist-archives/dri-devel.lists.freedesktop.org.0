Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A948188B86
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 18:04:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4388C6E5BE;
	Tue, 17 Mar 2020 17:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F2AA6E5BE
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 17:04:35 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 25so80842wmk.3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 10:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=ObAO8lewPX3AflqGqqsEgIOkagJMImeMxzpRcMylRvI=;
 b=iFlBHxIsRE10dkGC+K9sL69iB57t/esmERm5mei+203ZMMUaT0x21Tb1gP3p+TCaPo
 EHJht2XolZ1tgKPe42Nw4MVY+eXyWrrD2CjYd7x8Kp7ZzwN1uDhRny127AA96XozMu8l
 hRzgTitP+mBlas/H9SEq4t9G+7j8ELkFyoiYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=ObAO8lewPX3AflqGqqsEgIOkagJMImeMxzpRcMylRvI=;
 b=AGvFfIlAYSS0+e9w3LLIgIkD2llJKjxA3nf0D2t3r2GhlslPYsB7+FwSJmlgPyyCJW
 at/P7x9vxZlC7AGD3Dio6o2Yan+W9ecv9FCJAUMADaG8ZNSFXr/LwwMnqRjK2Jy0zuTS
 cBbiZJxEXWL9UVz+b8xM/uvPe+3mK4iHbhwFGsu/kngFEEDcGxFpjtVFxZm75vnTW0qj
 lIJjOInsDCDIXWrOosO8Y/LaRpl085Ge0buy6s7FTiDWY5MbU+px8DQfKGf9R0XSAIaV
 t7+fOZWjrrsgzpXltEQwtEot9lotEtx0n6AmZ/Xj8+uAg+6NgJeLMjUzZGzjaUO3yIhv
 40sQ==
X-Gm-Message-State: ANhLgQ2xrc8qir2IiMc28Hs1uq7IrX0f/WnQAjyulMP05ee20vddoiSy
 kLB7ZpaspMVJPEHkTkLpuAR+DQ==
X-Google-Smtp-Source: ADFU+vtf8dj2MkY7sbusKtJmdk4v9PDgTuJO25WhkTpjF7YXhCbnK1FtHZvjdup433Kfub3tQ9x/yA==
X-Received: by 2002:a1c:f707:: with SMTP id v7mr231550wmh.121.1584464673859;
 Tue, 17 Mar 2020 10:04:33 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r9sm28323wma.47.2020.03.17.10.04.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2020 10:04:33 -0700 (PDT)
Date: Tue, 17 Mar 2020 18:04:31 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Igor Torrente <igormtorrente@gmail.com>
Subject: Re: Fwd: [PATCH] Staging: drm_gem: Fix a typo in a function comment
Message-ID: <20200317170431.GS2363188@phenom.ffwll.local>
Mail-Followup-To: Igor Torrente <igormtorrente@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20200316210413.2321-1-igormtorrente@gmail.com>
 <CAOA8r4HieupER-gW4BU9U8YYC+6eLkSzoS2z-KRrbq4XZb40Ww@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOA8r4HieupER-gW4BU9U8YYC+6eLkSzoS2z-KRrbq4XZb40Ww@mail.gmail.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 16, 2020 at 06:08:30PM -0300, Igor Torrente wrote:
> Ccing dri-devel and linux-kernel.

git apply-mbox chokes on this, can you pls resubmit?

Thanks, Daniel

> 
> ---------- Forwarded message ---------
> From: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
> Date: Mon, Mar 16, 2020 at 6:04 PM
> Subject: [PATCH] Staging: drm_gem: Fix a typo in a function comment
> To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
> <sean@poorly.run>, <airlied@linux.ie>, <daniel@ffwll.ch>, <
> sumit.semwal@linaro.org>
> Cc: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>, <
> Rodrigo.Siqueira@amd.com>, <rodrigosiqueiramelo@gmail.com>, <
> andrealmeid@collabora.com>
> 
> 
> Replace "pionter" with "pointer" in the
> drm_gem_handle_create description.
> 
> Signed-off-by: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
> ---
>  drivers/gpu/drm/drm_gem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 6e960d57371e..c356379f5e97 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -432,7 +432,7 @@ drm_gem_handle_create_tail(struct drm_file *file_priv,
>   * drm_gem_handle_create - create a gem handle for an object
>   * @file_priv: drm file-private structure to register the handle for
>   * @obj: object to register
> - * @handlep: pionter to return the created handle to the caller
> + * @handlep: pointer to return the created handle to the caller
>   *
>   * Create a handle for this object. This adds a handle reference to the
> object,
>   * which includes a regular reference count. Callers will likely want to
> -- 
> 2.20.1

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
