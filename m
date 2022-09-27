Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4908A5EC195
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 13:37:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EAE910E8F9;
	Tue, 27 Sep 2022 11:37:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 918E810E904
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 11:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664278610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EoQe3mHnQYoYlajKMGO7Dx2ZrN3SElKzFqBGu4p1Rsc=;
 b=Dh8p/QR6dw1GSxpJIxpYx0VRh4HPFVFaBS54uW1L5E7XAI1yKM5TLmL3TuEmDP0oCZlSOn
 PDGj/tujYSyGw1jAN8thAtXJz6UvP08MmAZtXf4xwyNvZsDxyh9PI7MrSURX0N6FcASfBn
 PH4U4eE2sjKDWVtlLOvqOy3n1BddQm4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-457-rpeN7GKxMCeJLFqzyO4f9w-1; Tue, 27 Sep 2022 07:36:49 -0400
X-MC-Unique: rpeN7GKxMCeJLFqzyO4f9w-1
Received: by mail-wr1-f72.google.com with SMTP id
 l5-20020adfa385000000b0022a482f8285so2049692wrb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 04:36:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=EoQe3mHnQYoYlajKMGO7Dx2ZrN3SElKzFqBGu4p1Rsc=;
 b=XG/7EbK7f8PYe7K2pumjGa/PCfpeeNWJ6kyDjJKcNsMZKHlFNhGBdk0ugRiFzSCw+d
 zkWM7nbtH3GOP7edfyu7dVqVgk280FcZbZj1W2Ewpm5qFz1mgQwvISDWP6MWXQXFunvF
 GLf9rDTkeWo2RzaI8zpDg71Gk5QacSveabjHMEVpCR3W/ctN6WOZdjklVqwTs4xrsaLb
 xvzVl+ZRNEltekZh8wqdAGF+TLz5tUfTJ88etntZ167XGNc+ki4AqJx2VKI1UmZRWBCi
 JI0kJa6pfZL6POAmhebiFJoMER0aKNqhwKdLsYtagws2tudwF7nk3MZf1f11vuW86Zl8
 MhOg==
X-Gm-Message-State: ACrzQf3FyxfFUrXBvMPyFJNeP+AzubcuJ1fXao/Oux6URsiH2+EmwKAj
 bmyVvJVjv5wqN1E1NJCnH8+cLzsUX41F4+gmCxzK7Pf/g7Yq+av59B7B/FfnX8RgQlZdc9rMtEr
 6Vqr8CqT+mtLxFIGdrGd1w0/Py7V9
X-Received: by 2002:a05:6000:178e:b0:22b:451:9f63 with SMTP id
 e14-20020a056000178e00b0022b04519f63mr15895500wrg.521.1664278608349; 
 Tue, 27 Sep 2022 04:36:48 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5aRKpUsAhOykOk2Jxp+/Ojmr91lbVAF3k9VyYwNBaAklCp5COwFMiCEfMmUrrqWwr8i/YAZA==
X-Received: by 2002:a05:6000:178e:b0:22b:451:9f63 with SMTP id
 e14-20020a056000178e00b0022b04519f63mr15895488wrg.521.1664278608138; 
 Tue, 27 Sep 2022 04:36:48 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 y1-20020a056000108100b002250c35826dsm1491711wrw.104.2022.09.27.04.36.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Sep 2022 04:36:47 -0700 (PDT)
Message-ID: <21ce0011-4ffa-d229-404f-58f98aba5860@redhat.com>
Date: Tue, 27 Sep 2022 13:36:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] drm/ssd130x: Synchronize access to dma-buf imported GEM
 BOs
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20220927095249.1919385-1-javierm@redhat.com>
 <bd64206e-4d67-6932-30c2-740237a05bd0@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <bd64206e-4d67-6932-30c2-740237a05bd0@suse.de>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/27/22 13:18, Thomas Zimmermann wrote:
> Hi
> 
> Am 27.09.22 um 11:52 schrieb Javier Martinez Canillas:
>> Synchronize CPU access to GEM BOs with other drivers when updating the
>> screen buffer. Imported DMA buffers might otherwise contain stale data.
>>
>> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> 

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

