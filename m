Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDB244D5AE
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 12:18:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E3926EB19;
	Thu, 11 Nov 2021 11:18:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3893F6EB34
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 11:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636629493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cm+DUi8ko4XSbRJD2kBqXRStf4XmBaQnXCvcSQsugM4=;
 b=O7OOvBcQuZjmXK/lX+1egIUxRrTeKwPtodZyIMhTfFHcsn9cA92ffIcZkPD7RKqBIDFEew
 HO3WfzDe7EgOF+bpnp+6GwuGjWxdrg2xugHZ+z98o4gZkk0rH/HpB+yOjImFtfsg5aVBPh
 wsfEWTfLlwJ0xB1/NTQJMEHdssLkEC4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-xMk-tg5GMkOiLySbLwph-g-1; Thu, 11 Nov 2021 06:18:12 -0500
X-MC-Unique: xMk-tg5GMkOiLySbLwph-g-1
Received: by mail-wm1-f69.google.com with SMTP id
 145-20020a1c0197000000b0032efc3eb9bcso4660364wmb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 03:18:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Cm+DUi8ko4XSbRJD2kBqXRStf4XmBaQnXCvcSQsugM4=;
 b=Qe5naB2KY3iu9Ftl/WewYe1x94pWDmLXUHtVLpjyVFctXug4gRAwVRFVEXL0nDOCi4
 IatN42k8zwMruHo23t9LvUfaXgW76CZ0CSTJCgKGAvj2Z5Z+1r2mff5/pyqcfZUBk+YS
 lWaP5ZyWeDO++zFRH1wt862LL7yKrSI0VphnTlq86Sv2MQzxmET1Y2ELu44NT8caxw2N
 Gc+j6ZUDByh1dTsJzN1doGS7mlXRwnu9kgXDEM3C5emoZTslgjAsVmvx6Kio+FA33xFz
 PAdxuCIQtEBlLIs9RisBYLZPkCZU8JimfHb9AcyNH47zzSnDm1sBdgQs44yyylIN9xpS
 xy3g==
X-Gm-Message-State: AOAM530Ehx4TPJ37v48iZRXu0sZPC5ts+cdJoDyZCV9kfkRIM23zyx5a
 vrcM6NhPZGuXMF51yU0TKX31xJoTKgd5AaUufPoRxsH6uP7FHem6bCw9hQFL86Q2+5KDTYbZRSW
 z8uI+keOmmFbiAZKfzM5TDeMBZ99j
X-Received: by 2002:a7b:c7d5:: with SMTP id z21mr24715983wmk.40.1636629490890; 
 Thu, 11 Nov 2021 03:18:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw4QxzjI3CdpXCnsWkA7eOREXt8H1mIwhs9QLzOlluAuSBhSe0vmw+5iQBIRwQe7D8C02d50Q==
X-Received: by 2002:a7b:c7d5:: with SMTP id z21mr24715959wmk.40.1636629490719; 
 Thu, 11 Nov 2021 03:18:10 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id o2sm2797562wrg.1.2021.11.11.03.18.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 03:18:10 -0800 (PST)
Message-ID: <62258612-be91-d195-58e4-057819e7b29e@redhat.com>
Date: Thu, 11 Nov 2021 12:18:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] fbdev: Prevent probing generic drivers if a FB is already
 registered
To: linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Ilya Trukhanov <lahvuun@gmail.com>
References: <20211111092053.1328304-1-javierm@redhat.com>
 <YYzoWTMBkC64a4Cn@phenom.ffwll.local>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YYzoWTMBkC64a4Cn@phenom.ffwll.local>
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

Hello Daniel,

On 11/11/21 10:54, Daniel Vetter wrote:
> On Thu, Nov 11, 2021 at 10:20:53AM +0100, Javier Martinez Canillas wrote:
>> The efifb and simplefb drivers just render to a pre-allocated frame buffer
>> and rely on the display hardware being initialized before the kernel boots.
>>
>> But if another driver already probed correctly and registered a fbdev, the
>> generic drivers shouldn't be probed since an actual driver for the display
>> hardware is already present.
>>
>> Reported-by: Ilya Trukhanov <lahvuun@gmail.com>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>

Thanks for your review.
 
> Also Cc: stable@vger.kernel.org?
> 
> btw time to organize drm-misc commit rights so you can push stuff like
> this?

Yes, I'll start the process today to request that.

> -Daniel
> 

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

