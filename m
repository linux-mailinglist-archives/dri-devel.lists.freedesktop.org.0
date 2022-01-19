Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B8B493732
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 10:25:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2294110EA30;
	Wed, 19 Jan 2022 09:25:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8245610EA28
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 09:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642584349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=onoWIjTPTN46PWsgw6fkR2WxYzX1l4S+V/0pSERXJd0=;
 b=W3sAq6vtVsxvoKFfJAyuygZGUJgCO4wNKM6+IpjVlO5oA0FqfyDRuxXhJxC5uKdH0rC/8X
 kJoAi4s8drKgHVwqRSgZqsop7lXuYIwXYxsOcjh2hDK/T84lPX0d76V1MR6NUbCwf2zCHN
 Ivtj//yDj0dgO2R8r8q4mQonOCTciow=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-346-uRnuidiHPz2vRw1tKirROw-1; Wed, 19 Jan 2022 04:25:46 -0500
X-MC-Unique: uRnuidiHPz2vRw1tKirROw-1
Received: by mail-wm1-f70.google.com with SMTP id
 c62-20020a1c9a41000000b0034da9d62199so720067wme.7
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 01:25:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=onoWIjTPTN46PWsgw6fkR2WxYzX1l4S+V/0pSERXJd0=;
 b=46tLkKja14fgVbLQAUlyc0GwJp9Oif4xFo6/RN426qkNlCPkGnz+RU6isvFn7OKPJX
 cELkMJ/HXB/vtdSHXSl/OxJJpO35moojaEx4Ou5nT7TKFm50kGFg2pqVGvXG+FvXXivG
 R2gh54RV2/vN0v6H3gHAfqC/fJtq4/sH3kAVXuOAHb+X6NrvEfEKSeVeGLZDHGW8hVmU
 YbbEVGLBIZGlCTyNSj1Ek/df1uKXXaetFEd9/nKWKp4EDgilGP20TJUiE+ZVxzvelC7Y
 1SqeT/9GV9Y+FzClGcme7IaVmL+1pEaawlgpsaHX/OQ6G6b5mLZOx+sETqH8n5mxKQAQ
 pl1w==
X-Gm-Message-State: AOAM531+4iCfxl6dwfyAMOovBon3Ng38Hn5XwQ1swE5WMW0onuKnfzsd
 vtVbWoVJL4fklaoSQjLJT8SWyLDZQVh2ZeExUrTa6gm1Ei6NqbqXKrwtotQrBBlPUEl27O3gOPn
 uz/vHKT6bgSXnnUKL2I7OOSNoELhl
X-Received: by 2002:adf:d08f:: with SMTP id y15mr27419412wrh.27.1642584345130; 
 Wed, 19 Jan 2022 01:25:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJywt84w/a7N4iEEZw8KvzFkbykZ82lJvMOknThgrBMcks/B9MkBs0sRxGmhW85BX35wSXmKsg==
X-Received: by 2002:adf:d08f:: with SMTP id y15mr27419398wrh.27.1642584344967; 
 Wed, 19 Jan 2022 01:25:44 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id 9sm18115603wrb.77.2022.01.19.01.25.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 01:25:44 -0800 (PST)
Message-ID: <088cef98-6a1b-cdd0-ad59-e0e8d6c153a8@redhat.com>
Date: Wed, 19 Jan 2022 10:25:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] drm/msm: Fix include statements for DisplayPort
To: Thomas Zimmermann <tzimmermann@suse.de>, lyude@redhat.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org
References: <20220118154450.25947-1-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220118154450.25947-1-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: kernel test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/18/22 16:44, Thomas Zimmermann wrote:
> Update the include statements for DisplayPort helpers. The header
> files are in the dp/ subdirectory.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 5b529e8d9c38 ("drm/dp: Move public DisplayPort headers into dp/")
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/msm/edp/edp.h      | 2 +-
>  drivers/gpu/drm/msm/edp/edp_ctrl.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 

This patch looks good to me as well.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

