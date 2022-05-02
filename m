Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D95517772
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 21:28:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4446310EAA9;
	Mon,  2 May 2022 19:28:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73FF610E1E2
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 19:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651519730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ybrD/7h5J3fSITXfW6xwvBBTYoCzdyhOVw3+IuZ9Mdo=;
 b=iQxTKB0OQasHTRRbuLgl2BEVWPvl8cs0yxcZ5mWCzJ+2pqc3MyGZw9teNrvSBRD0rfTcfs
 zj0N7Orsym+2mwFw5JrSoVmydeResL7QFyNqlt/+fWndvJQ9uVnFipDCSFHEqSCeEK5A5V
 pqbQ5/LNm7I86IfXAHIedn9Iw2z5YXM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-241-J6au19XUNxaQNzNBVgyh4w-1; Mon, 02 May 2022 15:28:49 -0400
X-MC-Unique: J6au19XUNxaQNzNBVgyh4w-1
Received: by mail-wm1-f71.google.com with SMTP id
 bh7-20020a05600c3d0700b003940829b48dso131375wmb.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 May 2022 12:28:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ybrD/7h5J3fSITXfW6xwvBBTYoCzdyhOVw3+IuZ9Mdo=;
 b=4c6wGYvhEVzy8qjvZ79/zBw2H7SljyVuIkCvMakW+lpL8Hj4xJtRjATFziSBugfXrX
 VJSwyKzcCMw+6ObL2iFDv6olNAxyoKN8acmHZ1P9RmeanWYZhJGOQU5/5UvlQjgf1jQm
 h5CgQ92I5dv9WNrLUuFGwqRwpzRzbojn7CbmwvwOFAgPyh5wjnlz58pWvQmBGfUSzj3U
 F25nwTv2a57gEIl0t/1uaalG6326zM5f6y0yoTLAtS3idmFH+e5Wiinf8nS3+oPLvHuo
 1s8vH6cU8i3p241hlnTmHmT21yG7GfWOhQYD7HUX82xTh1c0cVxXpiuVyTRwjY8C7XGm
 /8nw==
X-Gm-Message-State: AOAM531m6MbKtLjKviY+JRl+egzIcbnWpI3T+wr3Dk8NzQzZOHWEni2o
 QmbdYDFwlwxkcV5BIhKL77rujD7xc+69H7Lp6xRUlt9SgTuojRHj4uQ9tga0/AUUWPHdmD0AmSW
 W4VwSugTnnLWfdttEjIWcsC4aTe6Y
X-Received: by 2002:a1c:2185:0:b0:38f:f4ed:f964 with SMTP id
 h127-20020a1c2185000000b0038ff4edf964mr455160wmh.115.1651519728173; 
 Mon, 02 May 2022 12:28:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6PH/40SaNl+msWDc9MMOxGWhQ4paAp4y0QHAm2sPRM41zGPMEJK26hBMq+1sXlgAvBf3d/A==
X-Received: by 2002:a1c:2185:0:b0:38f:f4ed:f964 with SMTP id
 h127-20020a1c2185000000b0038ff4edf964mr455146wmh.115.1651519727953; 
 Mon, 02 May 2022 12:28:47 -0700 (PDT)
Received: from [192.168.1.129] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a1ced01000000b003942a244f4fsm54753wmh.40.2022.05.02.12.28.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 12:28:47 -0700 (PDT)
Message-ID: <21db3772-b85a-59ff-df17-9056b3099977@redhat.com>
Date: Mon, 2 May 2022 21:28:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 1/3] drm: Remove superfluous arg when calling to
 drm_fbdev_generic_setup()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20220502153900.408522-1-javierm@redhat.com>
 <20220502153900.408522-2-javierm@redhat.com>
 <YnABjdpGC166yIY7@pendragon.ideasonboard.com>
 <5dd80287-1b09-d02c-9f67-5a0bb0a4566c@redhat.com>
 <bc6b6598-0e09-1a43-4086-e4164ab42a20@redhat.com>
 <YnAkwRL7b++a0omG@pendragon.ideasonboard.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YnAkwRL7b++a0omG@pendragon.ideasonboard.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/2/22 20:36, Laurent Pinchart wrote:
> On Mon, May 02, 2022 at 07:15:16PM +0200, Javier Martinez Canillas wrote:
>> On 5/2/22 18:55, Javier Martinez Canillas wrote:
>>
>> [snip]
>>
>>>> drop the depth option to drm_fbdev_generic_setup() ? There's a FIXME
>>>> comment in drm_fbdev_generic_setup() that could be related.
>>>
>>> A FIXME makes sense, I'll add that to when posting a v3.
>>
>> There's actually a FIXME already in drm_fbdev_generic_setup(), so it's
>> a documented issue [0]:
> 
> That's what I meant by "there's a FIXME" :-) It doesn't have to be
> addressed by this series, but it would be good to fix it.
>

doh, I misread your original email. Yes, it's the same issue as you
said and something that I plan to look at some point as a follow-up.
 
I hope that we could just replace fbcon with a kms/systemd-consoled/foo
user-space implementation before fixing all the stuff in the DRM fbdev
emulation layer :)

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

