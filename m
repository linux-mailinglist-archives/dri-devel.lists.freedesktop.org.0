Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 312EC4E75D6
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 16:07:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1FC510E9CB;
	Fri, 25 Mar 2022 15:07:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AA2010E9CC
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 15:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648220835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8C3MkWAIOt+nb2HXl8BVM6Y2AP5WNxWu9qYFfoepwgU=;
 b=Q7/FyQXwlhSj30gFIFbZinDr5Emr1o2HC99RO/JJ9CNsSBabmK5w7aA2COjkfvczDVK9VK
 R1Z5i/ujmR0+sW5SZvqi0A+9jfGynNm9zzTC4mZuDAru1hGg52ECeHDmPPpXatu/SmWHNq
 0OsheRfkmMOXGFuz3iAmS4vxspvCpoA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-644-1LG0Z1WlN6WzuXPSMoeI-Q-1; Fri, 25 Mar 2022 11:07:13 -0400
X-MC-Unique: 1LG0Z1WlN6WzuXPSMoeI-Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 a5-20020adfc445000000b00203dcb13954so2776957wrg.23
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 08:07:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8C3MkWAIOt+nb2HXl8BVM6Y2AP5WNxWu9qYFfoepwgU=;
 b=hSQHDepgdPXBkDlkWRTY1RVJouNPY0sD75HQKF4x3JrYAbouJ8sEwR/7pLV848So+g
 6zYvVsAguJEmKeIZ9oLio5dRNSO3QLFJPuzBLpteEnKxS1Di9NJvu25PTlbLygOy5PIz
 6una/rWCRQTCs29dwuBpQUAGf29ULDQfnIODFGGP36Is0we8Dc74riNhyWTMWZaF5CFy
 PEMnW5EaA1f0zJAqBU/zoghuy07Dzfh7NeBIOFxdw+vz70Mnd2J4FUzhLofa1ZzSTuL2
 SmFRhzXjBLmpfLwo8LZC4MskTt/5+EAAG0tKz9UVvovwBgsTasEEgnFsQ5qb2FBb+SJi
 8J3w==
X-Gm-Message-State: AOAM530b5RHdxVadU2X+RQZpj1POX6Y9FDC8tXQ+OB6oIoGgaiSM1yYa
 PsluS65aA7DxJxxqMrgD9fYKXtyMV9s84HAj+WXMcF0vBp8+oIv3uHui2Y4Mm3e6KAtQD6D3BsL
 gwajY3AlA5dQ2K2PP+zNX/8ndWaVg
X-Received: by 2002:adf:f102:0:b0:205:7d05:d250 with SMTP id
 r2-20020adff102000000b002057d05d250mr9629590wro.350.1648220828293; 
 Fri, 25 Mar 2022 08:07:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmpSY39HOnY0yRQ7SJfToqP+hhlnRAAeJjczVkq7pff5kqwriJm9BJXPNqKevzxtK983yU6w==
X-Received: by 2002:adf:f102:0:b0:205:7d05:d250 with SMTP id
 r2-20020adff102000000b002057d05d250mr9629562wro.350.1648220828022; 
 Fri, 25 Mar 2022 08:07:08 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 i1-20020a05600c400100b0038cf3371208sm7588wmm.22.2022.03.25.08.07.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Mar 2022 08:07:07 -0700 (PDT)
Message-ID: <566bec92-7463-5b2c-d62c-f07eee029cbc@redhat.com>
Date: Fri, 25 Mar 2022 16:07:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/vmwgfx: Propagate error on failed ioctl
To: Philipp Sieweck <psi@informatik.uni-kiel.de>,
 linux-graphics-maintainer@vmware.com, zackr@vmware.com,
 dri-devel@lists.freedesktop.org
References: <20220313050655.52199-1-psi@informatik.uni-kiel.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220313050655.52199-1-psi@informatik.uni-kiel.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Philipp,

On 3/13/22 06:06, Philipp Sieweck wrote:
> The cases of vmw_user_bo_synccpu_grab failing with -ERESTARTSYS or -EBUSY
> are handled in vmw_user_bo_synccpu_ioctl by not printing an error message.
> However, the error value gets discarded, indicating success. This leads
> to rendering glitches and a reported drm error on the next ioctl call to
> release the handle.
> 
> This patch propagates the error value from vmw_user_synccpu_grab.
> 
> Signed-off-by: Philipp Sieweck <psi@informatik.uni-kiel.de>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.c | 2 ++
>  1 file changed, 2 insertions(+)
>

Patch looks good to me.
 
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

