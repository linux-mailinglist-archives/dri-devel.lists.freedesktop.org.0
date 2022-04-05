Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F6D4F2313
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 08:26:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20E3610E5D2;
	Tue,  5 Apr 2022 06:26:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7A1F710E5D2
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 06:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649139973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AE2Pe04XTmbBiYI9wrcy3xSc5sIgoO9BvOisCf2iy44=;
 b=A+mGd5pWF4zAI2fhRErEBc1ZET6Am+FpJM2zopRtY3Gy7D0J7qPSBQfiq7daLzdnxsb+RG
 0QrVaKyeGWotDL46G+IDje/89oPZxmhi/d+tQmX4mWMVqEydD/auTfgh+7DCoA/CJ/XDhh
 81MQbszRvjqn8ygOQVn2CE/Mgq1UVKw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-466-EbCiRRu6N7SGLayDfOBQGA-1; Tue, 05 Apr 2022 02:26:12 -0400
X-MC-Unique: EbCiRRu6N7SGLayDfOBQGA-1
Received: by mail-wr1-f69.google.com with SMTP id
 g4-20020adfa484000000b002061151874eso1032929wrb.21
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Apr 2022 23:26:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AE2Pe04XTmbBiYI9wrcy3xSc5sIgoO9BvOisCf2iy44=;
 b=6BmO+S6F4YK3RiS60CWBpGliRPjlx72P25w7LGgjd/yGi3QzEDaw5rGS/0wzP4/Rdn
 cZFJHR212AMoabjmzNOtmCWjdbeKISeXpid20yWmAQ/zDAi03z+AciyDae5QtdOXJAA5
 5cKNK359xS3ZfUIxIz2H0F8PRZ0KpF6M+9KCCyKjrgBc9gc5jSgK+0Bz3GjEACGZtMcx
 BkY4bGq1j9JhOI8fOop7EhbLSzowT1mfaG/mVH5a/Yi0S0JaUSKVFdx2HENJVw1OYrzu
 j1PXWDqCALQGWWmwD7Jr0pv3ja2crIbnuZz0C8tsfG4Gqvmq1ArV0ThvKsKWqBf2kb2R
 LyOg==
X-Gm-Message-State: AOAM533FtkLJY9mxBnXz4WDl/mEYyYKYdIEm5OdQ+UDYs/jP3jvTObMT
 F758jZ8C7KDq/aUh+UjzrYN1s51l+WPtMVodO5kpH4PXCEj1PoTHie90NIe3tJHaJGxE6Y6toif
 iDRS74etYMXpibmmp5V1xHDaUPVv/
X-Received: by 2002:adf:df81:0:b0:206:dad:ba4a with SMTP id
 z1-20020adfdf81000000b002060dadba4amr1375343wrl.657.1649139970783; 
 Mon, 04 Apr 2022 23:26:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZNy87DTcb72PGeUnTLvzvxDdPs4QCBTYzMtRQXpA1MSINXdRjrE3uLBHDKgSUriARYu/V3g==
X-Received: by 2002:adf:df81:0:b0:206:dad:ba4a with SMTP id
 z1-20020adfdf81000000b002060dadba4amr1375331wrl.657.1649139970570; 
 Mon, 04 Apr 2022 23:26:10 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 n22-20020a05600c4f9600b0038c6ec42c38sm1165101wmq.6.2022.04.04.23.26.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 23:26:10 -0700 (PDT)
Message-ID: <fda186f7-2cf4-a69a-d68e-58073d35cbea@redhat.com>
Date: Tue, 5 Apr 2022 08:26:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/format_helper: fix a kernel-doc typo
To: Simon Ser <contact@emersion.fr>, Randy Dunlap <rdunlap@infradead.org>
References: <20220403232902.1753-1-rdunlap@infradead.org>
 <ttcrpLw9HkdhAH5SkXylXDBi9SBf7LWgOeW09ZvTF4U4_zKJAOXBQZlFxfw6NKY0Hip6dXBFape6zkX09cstuOno72c-c00wmZ_VbNDg6xs=@emersion.fr>
 <b20bbd22-895c-9e74-e579-d2f3561a2fe1@infradead.org>
 <BzpH4s8ZYn84kTlJQ3BHVMQzZlESb2Fk6v-uO5KBaaeBNMvRvC98lpuBLUNLE3a5bdoYTb5JRvo6EU__5AGJ79LUirSppO39I1t1xlwx-fI=@emersion.fr>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <BzpH4s8ZYn84kTlJQ3BHVMQzZlESb2Fk6v-uO5KBaaeBNMvRvC98lpuBLUNLE3a5bdoYTb5JRvo6EU__5AGJ79LUirSppO39I1t1xlwx-fI=@emersion.fr>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/5/22 08:12, Simon Ser wrote:
> On Monday, April 4th, 2022 at 23:35, Randy Dunlap <rdunlap@infradead.org> wrote:
> 
>> On 4/4/22 09:04, Simon Ser wrote:
>>
>>> Both doc patches pushed, thanks. I had to manually edit them because they
>>> wouldn't apply cleanly. Next time, please use git-send-email (see
>>> https://git-send-email.io/ for setup instructions).
>>
>> That's odd. I did use 'git send-email' and I don't usually have any
>> problems (AFAIK). I'll check those setup instructions.
> 
> Hm, maybe the issue isn't git-send-email, but the way the patch was
> generated? I had to manually edit these lines for the first patch to work:
> 
>     --- linux-next-20211217.orig/include/drm/drm_file.h
>     +++ linux-next-20211217/include/drm/drm_file.h
> 
> I changed these to:
> 
>     --- a/include/drm/drm_file.h
>     +++ b/include/drm/drm_file.h
> 
> This wasn't enough for the second patch, I had to re-do the changes by hand
> from scratch.
>

Yes, I believe the suggestion should be to use git-format-patch instead.

To make sure that was is posted can be consumed by the git-am command.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

