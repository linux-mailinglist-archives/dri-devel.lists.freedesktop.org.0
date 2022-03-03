Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FF64CB6E9
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 07:24:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E615110ED61;
	Thu,  3 Mar 2022 06:24:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60A2610ED61
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 06:24:04 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 l25-20020a9d7a99000000b005af173a2875so3760049otn.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Mar 2022 22:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=RTAaJqVx+g0L5JChfp/fev9G6j9NqJ9mgoa/6NPnewI=;
 b=JsAr0un9vpUk/FOo92FA4yZQMG3qwq2KxW6PjSNvQCxdyJoEweD1jZQAJoie/fcSdy
 l0Dapen9U2y5Ffmgn3hxRwFADdbGDXqAALpJeCTu3t1zAFXQnoN06Zv89C1HVSMlGRIW
 gf+Cbe+baFZHUWRwBo/28Ysdt16NlkJjS6CbhfARKOrOzpwDUmkQ9O2r31uL/Uma/XIf
 fgzLuHOrL2+8qEd6UHtA9BsOZvlhOw5r9mOEsJfcUcm6Nn4n3x18ZzmQtSDROXP2Sb8g
 ilVkpB+3I7DKeqel63k1NMQWHIBaF0UBiofy+DEPPAuSi79HUP2LmHQD114bclPQks9b
 Y15Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=RTAaJqVx+g0L5JChfp/fev9G6j9NqJ9mgoa/6NPnewI=;
 b=oBk2ca0B2WgcdurvjkEYH+UtnFueXhNU1rfEn4OOknWlaNbW/1jeFV9GZ/q+e3HjWI
 6a/Rc2dhPbMTiX/ni5Nqfwaj8nNX6pdACCAHRM3/ruJR7pAoYDPBxnwLjtURZarYnM1w
 6AMjUK3pIueRYSLJK6fCvhf2xAyNh8FK+YgWOKza91nL7D/oHOrRRBpPKfHIpI3y29Hm
 dBEvo7MTWGrU+LBiBc95rIlKZmOOmxVS0KanhX5yxumAvv0WsnuG6O849/zjWI8oyCQ3
 fn600hcmIeVjAkeRuSIymNKv34kuqxBNNDOxGw5y8vaxfatN0qQ/BMOVE4cArUy9ZjQu
 ANdQ==
X-Gm-Message-State: AOAM530uKUG8oUVFkg+IEHX+GEWS+/SzhYJhgqpWnMRMSjHvvEbIPAez
 RbhNS/9/OkJX91M1qb25xv4=
X-Google-Smtp-Source: ABdhPJxeF/aDCtUEPgc69fQDujQNI0Rt769/bO40LhlXDfdb/2ZAhxnoW+eMykPKVv83EnGiBypqQw==
X-Received: by 2002:a05:6830:9c4:b0:5af:2866:2884 with SMTP id
 y4-20020a05683009c400b005af28662884mr17603949ott.258.1646288643544; 
 Wed, 02 Mar 2022 22:24:03 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a4a2c06000000b0031c0514194fsm515777ooo.31.2022.03.02.22.24.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 22:24:02 -0800 (PST)
Date: Wed, 2 Mar 2022 22:24:01 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Aashish Sharma <shraash@google.com>
Subject: Re: [PATCH] drm: Fix no previous prototype error in drm_nomodeset.c
Message-ID: <20220303062401.GA3284490@roeck-us.net>
References: <20220302170902.752687-1-shraash@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220302170902.752687-1-shraash@google.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 groeck@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 02, 2022 at 10:39:02PM +0530, Aashish Sharma wrote:
> Fix this kernel test robot error:
> 
> drivers/gpu/drm/drm_nomodeset.c:8:6: error:
> no previous prototype for 'drm_firmware_drivers_only'
> 
> Including drm_drv.h in drm_nomodeset.c which contains
> drm_firmware_drivers_only's declaration.
> 
> Signed-off-by: Aashish Sharma <shraash@google.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/gpu/drm/drm_nomodeset.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/drm_nomodeset.c b/drivers/gpu/drm/drm_nomodeset.c
> index f3978d5bd3a1..9402deb4985f 100644
> --- a/drivers/gpu/drm/drm_nomodeset.c
> +++ b/drivers/gpu/drm/drm_nomodeset.c
> @@ -2,6 +2,7 @@
>  
>  #include <linux/module.h>
>  #include <linux/types.h>
> +#include <drm/drm_drv.h>
>  
>  static bool drm_nomodeset;
>  
> -- 
> 2.35.1.574.g5d30c73bfb-goog
> 
