Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15814189D57
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 14:50:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96D3F6E8F5;
	Wed, 18 Mar 2020 13:50:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91ED56E8F5
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 13:50:28 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id s5so30564958wrg.3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 06:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=XccCPctkAdV/8ABAxnQ5VwYEjRgb5OJA1jC/yCtBVYI=;
 b=I1ljf0adRaW/V1KC7utnbIQYNKvRQb1ZxU01eNnezjuv6EmUivN+cWO5CNflsS0hfT
 jEdCgSSpd2PjWSGulDFhZdEd5eMe927eZpiD8EAxAhIZW9sHj/TFlO+3WfH1U8fj4ecb
 QMQkS+2Y3qzE0h9pV5V5sro3G19mLqWB/pfac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=XccCPctkAdV/8ABAxnQ5VwYEjRgb5OJA1jC/yCtBVYI=;
 b=gFK88CtlQmJ29t/hnjsujAEoYsbpEhLf8D1bOMxQ6rzdrTVu14MbjsMVuI0yMrR76a
 Amy+V+Fc23/aCIhwe0TWLnAUtlmXcc9X3xOZE9oHdU1CEASNtS1/1aLhin9jxC9MJ8HR
 vLPhC3Mdxsx00UAJVG5672h4TDpjACBrw75kWKW/Pk6KwlgdYOAGca3TB+65U3ZbifzB
 +jWQvL+oshsdChvbDGv6aqkkfv26howg7AHkeB6fPQyw1IgyJDVK4wugb3jW+rvtKRjr
 9AEmWLdTRslxLBL4Gr32sQP2PDnBhxcjQyUptHcD4OzwEX0BjAHeu8saNoufGvVL8/LM
 IkFQ==
X-Gm-Message-State: ANhLgQ03Q7JxyuvP0srroi1kELZLTGJtuj0XRZtv3lqk8NCZ/DECXFoI
 9EqFeq1GtLrDfSxhta+cY31ArDAzLdFpqPyZ
X-Google-Smtp-Source: ADFU+vuDk7wnQRImLnOiwAYtmQ9nntEm5AfmJm2mHPI5WuMxgr+Um1lVXT09iRpAmPaIlMWncT25VA==
X-Received: by 2002:a5d:414f:: with SMTP id c15mr6321028wrq.60.1584539427182; 
 Wed, 18 Mar 2020 06:50:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w19sm3880374wmi.0.2020.03.18.06.50.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2020 06:50:26 -0700 (PDT)
Date: Wed, 18 Mar 2020 14:50:24 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
Subject: Re: [PATCH v2] drm: Correct a typo in a function comment
Message-ID: <20200318135024.GX2363188@phenom.ffwll.local>
Mail-Followup-To: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 sean@poorly.run, airlied@linux.ie, sumit.semwal@linaro.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rodrigo.Siqueira@amd.com, rodrigosiqueiramelo@gmail.com,
 andrealmeid@collabora.com
References: <20200317210339.2669-1-igormtorrente@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200317210339.2669-1-igormtorrente@gmail.com>
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
Cc: rodrigosiqueiramelo@gmail.com, airlied@linux.ie, Rodrigo.Siqueira@amd.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 andrealmeid@collabora.com, sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 17, 2020 at 06:03:39PM -0300, Igor Matheus Andrade Torrente wrote:
> Replace "pionter" with "pointer" in the drm_gem_handle_create description.
> 
> Changes in v2:
> - Change subject text
> 
> Signed-off-by: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>

Thanks for your patch, queued for 5.8 in drm-misc-next.
-Daniel

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
>   * Create a handle for this object. This adds a handle reference to the object,
>   * which includes a regular reference count. Callers will likely want to
> -- 
> 2.20.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
