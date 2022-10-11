Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B1C5FB1DB
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 13:55:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A76310E0E0;
	Tue, 11 Oct 2022 11:55:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 855B010E0E0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 11:55:05 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id a26so30810002ejc.4
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 04:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ane0WxnU8zMDKafeRcdzayHfFv1c4aKVr3R2/sD6VN4=;
 b=LI7r/hyDr6N66B6EJnIlEpfjLkmEMUNHV7SpprLkm3M0VE+WldgDCxIZXTkS5nmc83
 mipdEC1kSX0TluiuuQT8dRXT2LShAgERakv5KqlLkXvGOe/CTijULJz0sH3fsmdfI8Zw
 Ki/og21yNPlztYTs9JsNMNiI0g8KFcKQtGh9e3QPnuGcE+Z8eWUbG78mvwLnlTfvnFI5
 H8oDTY+dA+BE8hkNmty05hN//e2OgMFd/bDG0HM6mi4uok+lNOj3yt1G+LH+m7oAqNmG
 JMKR4d8ASMMgmi2LL24+vsOT0K5Ndo51Nrp4isWf6BK6UzGb1BdG3tGBMoGtGKCWmOmz
 pF5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ane0WxnU8zMDKafeRcdzayHfFv1c4aKVr3R2/sD6VN4=;
 b=YKaAzeR4yUD3jmD/5ombmbRxzkZFWSNhIzBLEIj/T+mWqx3ucOxbiRSCsd1m11ROJE
 /LH29pN9cQNHtD3jzHLLCMYjUoDhKpcwTk7b16FjoRIleiF0/xtplxn8KvNPRqxy1zSR
 7q0ZeKA979KqT2KSaTHaE/q32fXSEzNBY5UXAKM6EhfQlVAcFvsDg9v9zlpPmuohzBic
 ycYrzpsQk5mBGnQ5Eu2VpW9d4mkMZVyCxiU+FpO6h6i8bLM7w9rfOneQCbGxEym7lDq5
 ZftXHIcaGpXPPANf4CpIAuwZ3TgXHklXsEeEgjwRN8xmqW9vOIWLh+V79MtuKY+1e27e
 28Lg==
X-Gm-Message-State: ACrzQf032broTIV5GfzuY3vRNoqCavgiSxjULu2nrE36s1rz78D6AMTa
 9nQXYgChMmCZAFkVRTWBQ9trakkbfEI=
X-Google-Smtp-Source: AMsMyM7gCv1zjeI2/5RGwaW9IB1p1GFrb+JPtWy3dfSbUZBw7jdOWmrKs2coRodUu8jEv0Ml+nx/Nw==
X-Received: by 2002:a17:907:7f93:b0:787:7fbc:8081 with SMTP id
 qk19-20020a1709077f9300b007877fbc8081mr18935242ejc.543.1665489303809; 
 Tue, 11 Oct 2022 04:55:03 -0700 (PDT)
Received: from [192.168.178.21] (p5b0eacfe.dip0.t-ipconnect.de.
 [91.14.172.254]) by smtp.gmail.com with ESMTPSA id
 i17-20020aa7c711000000b004575085bf18sm9043850edq.74.2022.10.11.04.55.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Oct 2022 04:55:03 -0700 (PDT)
Message-ID: <2701312e-975b-bfca-0cb5-fcef24f32e2c@gmail.com>
Date: Tue, 11 Oct 2022 13:55:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] drm: remove DRM_MINOR_CONTROL
Content-Language: en-US
To: Simon Ser <contact@emersion.fr>
References: <20221011110437.15258-1-christian.koenig@amd.com>
 <20221011110437.15258-2-christian.koenig@amd.com>
 <nrRxPQtWoC6aCzSuZn5fl7wccdhP9fOpc86YTIJUlck9LK2NtPTNb5QeZa_Gsl0PYpkTn5FiCcEAzsm_C-ypBEUP4jz4avyuUwJ2P6jmX3w=@emersion.fr>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <nrRxPQtWoC6aCzSuZn5fl7wccdhP9fOpc86YTIJUlck9LK2NtPTNb5QeZa_Gsl0PYpkTn5FiCcEAzsm_C-ypBEUP4jz4avyuUwJ2P6jmX3w=@emersion.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 11.10.22 um 13:39 schrieb Simon Ser:
> On Tuesday, October 11th, 2022 at 13:04, Christian König <ckoenig.leichtzumerken@gmail.com> wrote:
>
>> --- a/include/drm/drm_file.h
>> +++ b/include/drm/drm_file.h
>> @@ -54,7 +54,6 @@ struct file;
>>    */
>>   enum drm_minor_type {
>>   	DRM_MINOR_PRIMARY,
>> -	DRM_MINOR_CONTROL,
>>   	DRM_MINOR_RENDER,
>>   };
> This makes me uncomfortable: this enum no longer matches DRM_NODE_* in
> libdrm.

Ah! There it was! I was remembering in the back of my head that we had 
somehow used this in libdrm as well, but couldn't really get where exactly.

But I don't really see a problem here. The control nodes are identified 
by name and we don't expose them for quite some time now without any 
negative impact.

Even the minor number distribution stays the same. So what bad can come 
from this?

Thanks,
Christian.
