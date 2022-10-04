Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7E05F4C37
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 00:51:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AA4A10E2B6;
	Tue,  4 Oct 2022 22:51:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B760810E2B6
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Oct 2022 22:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664923864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EzVjx1NwiuxLWCgvnGSS4vzuPBUQj4nAd/iu07HAdWw=;
 b=EyS6nC1WLENrBeuo/9Gz0xDzUcPJAPgWnn6PNJOXxUt4uaMarsMCuiVn3GN8bR3YFfB9au
 GSUKfazNyqnOs6Djj5nSCxDIG3gEA0o/PxADmwJoVk6803Zdi7KhPcoakO5PX9Fvl2jLdN
 0sxUgNVNzDsj9Yf3xmBAF+WA/EsN8ag=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-445-EGybcltqNyO7Fsn4ARI28w-1; Tue, 04 Oct 2022 18:51:03 -0400
X-MC-Unique: EGybcltqNyO7Fsn4ARI28w-1
Received: by mail-il1-f199.google.com with SMTP id
 s2-20020a056e02216200b002f9de38e484so5289817ilv.8
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Oct 2022 15:51:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=EzVjx1NwiuxLWCgvnGSS4vzuPBUQj4nAd/iu07HAdWw=;
 b=sss0NQl/xsaMZWw+0N+oCMZYRctpaYEy0xMuVhPe8mTJtSDUEaJD5wg9rIO59sVuBP
 Ox+P1HPv5Rc17eYaNceiM/jUR3mdlITk+DWZsVWn1O2JRM4LZfmGYo49h/l5B4OIgqtM
 l+QTtlR2Uy7rnC2elvWRrXBvNRtRC28bSrghHkIFm5Dr0MhuVh2i2YPW7ZlI8fYzp7Gc
 sFrdpGC8tn6KLSx7k93XdY2VnlJqIEWVjNcjxw/zT3pwg5+Z3+eCNzdcAFC7q5LhMHbb
 k1siemyFmrBNuS1edX7on7nZ20J97fm2EG4ht1RdVuijkD1G3Y7i8bZ488bsW3Z22vIX
 YSJw==
X-Gm-Message-State: ACrzQf3PZUzhqFa4SM0IzB7zZXxfUrCXW7ot46ZgBMURFofl4cyjECGK
 b7h0IZK+ri48Moi7s+UpJYcdwOkGS1gXRK1tctcmFJH3nRr/hC+5/CTTYfBsuX5yegju97jiR5n
 QBs4aBlwkBVjmQFNTgZotP1duJrQI
X-Received: by 2002:a05:6638:379e:b0:35a:6503:453c with SMTP id
 w30-20020a056638379e00b0035a6503453cmr14167753jal.118.1664923863256; 
 Tue, 04 Oct 2022 15:51:03 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6YPpyFtVD1TLCVbSxTnLeR2aOvyrxNozXPEr7fYJuwU7xd4dky3LqyJVDGvOGNwYz3kyoDJA==
X-Received: by 2002:a05:6638:379e:b0:35a:6503:453c with SMTP id
 w30-20020a056638379e00b0035a6503453cmr14167746jal.118.1664923863044; 
 Tue, 04 Oct 2022 15:51:03 -0700 (PDT)
Received: from [10.56.18.1] ([140.209.96.0]) by smtp.gmail.com with ESMTPSA id
 b2-20020a92a042000000b002f584a19a79sm231868ilm.34.2022.10.04.15.51.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Oct 2022 15:51:02 -0700 (PDT)
Message-ID: <90ccdd61-42b7-372b-6196-e4c65c4ee38d@redhat.com>
Date: Wed, 5 Oct 2022 00:51:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 13/16] drm/udl: Add register constants for color depth
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 sean@poorly.run, daniel@ffwll.ch
References: <20220919130408.21486-1-tzimmermann@suse.de>
 <20220919130408.21486-14-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220919130408.21486-14-tzimmermann@suse.de>
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

On 9/19/22 15:04, Thomas Zimmermann wrote:
> Add the register constants for setting the color depth. The driver
> only uses 16bpp. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

