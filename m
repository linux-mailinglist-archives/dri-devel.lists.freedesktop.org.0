Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B446F4AEFD8
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 12:13:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FA2410E39F;
	Wed,  9 Feb 2022 11:13:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02F4810E39F
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 11:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644405220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2JEVs6dJDaci483+WWuPdcx6lEGE5ej3RH7W42QbFwI=;
 b=ak7Yt2FixpL1Emna3sGWkPrwQxrgdF13yxM+8jCEVJ4rxv58OAGjjcgkjXibPbwrDIPoJP
 yJIzEuU1h8LT44vkdG9mPeCiU82qdK3Ra5RGSkdJbnuPD30k69oXWrPYTrRcV29f5D3Xaj
 KXuCcYfAGl6RsxwxNdJmyZLk7gSkAxM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-34-XJVAIMzVPYqTbgNEsrrynw-1; Wed, 09 Feb 2022 06:13:39 -0500
X-MC-Unique: XJVAIMzVPYqTbgNEsrrynw-1
Received: by mail-wm1-f71.google.com with SMTP id
 v185-20020a1cacc2000000b0034906580813so2506732wme.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 03:13:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2JEVs6dJDaci483+WWuPdcx6lEGE5ej3RH7W42QbFwI=;
 b=W1ljuBGT530Wmh4TzVLNnBPB4v/C3HqaZ8OdKQNmxSu+xdBbSUcsdexre+xDkgfvuL
 ri/ZotmaHGsHW7Kij9Z3sR9bIzrq5gNz9Jef8zuocIk6xNHtq7XUfGeRzt70rQo9y0sa
 EC+yE3BMzfjcz3IifdcENlRIdR6HEc2BGAW0WG+UFfX7kfrsh9isaFnWFOR+5T/N2yJZ
 14G8wn0JYdu/kjEu9jg12YSqD//pRVXG6M3cxvzqMIGtXk5R8cQjHTtx6j4KiQByr/2c
 VfK/rxxPzFAuVGq4BUS339E8IIrorO+GjJRZcr4do3UH3gamNxNkl7njgdDXjazJhsBw
 33UQ==
X-Gm-Message-State: AOAM533Hl3G1yeVbmtIl/xTXiusMa8ZEfrW1nUd8jpflABRee4GugIHl
 MI+kmNBIpdbkhS6l5cUTaTYkb2KH+CEf8bvWE1xWlC0vL2JMeAJUGKPMDdi2a9AcEifg32BiMSk
 TJK0QmX2wuN2sEiSA0qHINDNcrv7g
X-Received: by 2002:a05:600c:889:: with SMTP id
 l9mr1582771wmp.79.1644405217826; 
 Wed, 09 Feb 2022 03:13:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzBsaCXKduaHd1wSIkI44KcqodHTTHaP0IJw/CqG7+l/vRMXJsgmEfEtd82elX5UKU8E0n8cQ==
X-Received: by 2002:a05:600c:889:: with SMTP id
 l9mr1582757wmp.79.1644405217608; 
 Wed, 09 Feb 2022 03:13:37 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id t18sm16260451wri.34.2022.02.09.03.13.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 03:13:37 -0800 (PST)
Message-ID: <00a6c4bd-4166-1432-ead0-51efc9af9f6a@redhat.com>
Date: Wed, 9 Feb 2022 12:13:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 5/5] drm/fb-helper: Clip damage area horizontally
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 sam@ravnborg.org, noralf@tronnes.org
References: <20220206192935.24645-1-tzimmermann@suse.de>
 <20220206192935.24645-6-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220206192935.24645-6-tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/6/22 20:29, Thomas Zimmermann wrote:
> Clip the damage area horizontally if only a single scanline has been
> changed. This is helpful to reduce the memcpy overhead for small writes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

