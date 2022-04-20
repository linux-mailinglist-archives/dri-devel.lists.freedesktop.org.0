Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 565A050824A
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 09:35:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5900910EF6C;
	Wed, 20 Apr 2022 07:35:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EBC710EF6C
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 07:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650440151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EDRif+t8FPfoSOxs98NyECVWbLIHSIo6HCNUFdi+s6k=;
 b=VQbj/asWrbowHWNoBILt0Z+94Wbg6F3P13GmyBBeOm0gbBuYLKZYCl31RHey9ZgdP6psd0
 DgXHxR7vYMjCcfY4PDqnsu6iO4CR/xRiWnYgwN1l6pb+v5LWrwhIffnqu2qiVIuND3TbK3
 T4hW0LHTHAS58ZZEJzfdGdLp1S55QHQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-340-FLi-YphQNDC0Z71OxfLZCQ-1; Wed, 20 Apr 2022 03:35:50 -0400
X-MC-Unique: FLi-YphQNDC0Z71OxfLZCQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 k66-20020a1ca145000000b003928959f8efso1588981wme.1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 00:35:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EDRif+t8FPfoSOxs98NyECVWbLIHSIo6HCNUFdi+s6k=;
 b=K6SozSD7AA1IJatp3JKuVnV3WvdZ/ksbGTAIYNE7LZLqmB/IgOnwZoIbkYnCCanONT
 huZT/erJJfQaoMiltaL/M7mQ3px9cL5XyJnbrVOIZUs4Vutz/EFuk/1ZNx+S8MRskM2x
 cJcJTEqU47IDmg8/O+uKP+Y/U10Z4ASXnqhKxlDSSZ1hsdAk6eVSmfXdgf43xG/R5R3M
 ebFqr1RYWhvK5k7W6JDMtQwS2PfcEFu42eumNQKHxxXeEjoYGq84e9QJfxhPeAA36iDd
 7E84TwErb52hfKvalb+/VcFZ7zrl/q34kEdMAzlyOhTBHqblQzG6rno9WFQGCJegnu3B
 I5QQ==
X-Gm-Message-State: AOAM532EB7pLjR7x960x8IGs8CoRkoRqN6mWNFcBVYepbKFgcf08rWR1
 MaeyU+adRMI2oD+PvxXKyDL0PEmnKbe2mSGkGg7jiiJABYJK7dNi8I+yQobQIBSGDvEQWE0KxzR
 +L8/gWX0mUmNbqKrVjt9zEKmLOVuc
X-Received: by 2002:adf:e3c1:0:b0:20a:aba9:9b38 with SMTP id
 k1-20020adfe3c1000000b0020aaba99b38mr2900233wrm.673.1650440149339; 
 Wed, 20 Apr 2022 00:35:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6sgyKJ2RuJP3SIGSvgHxw4lhTuGdu8X/eI4ANvHsCXwV93n7yUdOaGB6Ll1aJVD0L1RwOfA==
X-Received: by 2002:adf:e3c1:0:b0:20a:aba9:9b38 with SMTP id
 k1-20020adfe3c1000000b0020aaba99b38mr2900217wrm.673.1650440149133; 
 Wed, 20 Apr 2022 00:35:49 -0700 (PDT)
Received: from [192.168.1.129] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 g8-20020a05600c4ec800b0039290a5b827sm10994151wmq.24.2022.04.20.00.35.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 00:35:48 -0700 (PDT)
Message-ID: <621dcf6a-c23d-24cd-951e-26227f465ab0@redhat.com>
Date: Wed, 20 Apr 2022 09:35:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 2/2] fbdev: Warn in hot-unplug workaround for
 framebuffers without device
To: Thomas Zimmermann <tzimmermann@suse.de>, robh+dt@kernel.org,
 frowand.list@gmail.com, daniel@ffwll.ch, deller@gmx.de, sam@ravnborg.org,
 linux@roeck-us.net, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org
References: <20220419100405.12600-1-tzimmermann@suse.de>
 <20220419100405.12600-3-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220419100405.12600-3-tzimmermann@suse.de>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

Thanks a lot for re-spinning your series.

On 4/19/22 12:04, Thomas Zimmermann wrote:
> A workaround makes fbdev hot-unplugging work for framebuffers without
> device. The only user for this feature was offb. As each OF framebuffer
> now has an associated platform device, the workaround hould no longer
> be triggered. Update it with a warning and rewrite the comment. Fbdev
> drivers that trigger the hot-unplug workaround really need to be fixed.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Suggested-by: Javier Martinez Canillas <javierm@redhat.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

