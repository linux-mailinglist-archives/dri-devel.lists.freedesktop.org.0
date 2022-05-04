Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6167F51A4F9
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 18:09:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EFC210E57C;
	Wed,  4 May 2022 16:09:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B74D310E57C
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 16:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651680557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u6oAsUMcR0FkYY71L6VDbcvkKMMVPeHjkH1KerqYz80=;
 b=QWJp7j7HX7xtTHZNtf+uc86TqlJFlnQuKPaBYGexM2A7GniBYP3SYhrpvkIjvRBYQPkUeZ
 rDdgEm3bXwmrG2d2ZT6ktomAbKJ5YR+tzPCSbJT6mLOnKTGkJYVaCtOjVTlBGx1Ow6UIK2
 rifUI2R/YSAQDK1I4zfm/vWfug4UM0o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-245-UN8jD1MnM1KWqsaBUv7Fcw-1; Wed, 04 May 2022 12:09:11 -0400
X-MC-Unique: UN8jD1MnM1KWqsaBUv7Fcw-1
Received: by mail-wm1-f69.google.com with SMTP id
 v184-20020a1cacc1000000b00393e492a398so3204890wme.5
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 09:09:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=u6oAsUMcR0FkYY71L6VDbcvkKMMVPeHjkH1KerqYz80=;
 b=A191Jt5qUFJXHDVklJ+is2vaTlsPQDE+0aBElrA/TpTj+I9vhkQQgs07GwOy+EaRTu
 4ESzhOM67A4hXGvSXXiO7mqQUH8HxUyhuV8fECJylvOK0lBKdWZCuRjvOgJYrmC6iAYY
 p9tynSeRAzuB2YYZSegA9fCBWi7SY0PUrffDk5yZ5CVSVWQEJvOu4i3ddLauNNMlGAFv
 uIipcL0atT/rZjWEFmH0wI5ApZoDIGvzTjjbQLIQKD9TA2E8PYc1bP8FeH5yaM6J1VFM
 IDhSg19j1x/wpj+MC6Tm6OOHoDkdfENrRNWwdUfCJPzTHwV6Kpjicp+SdM7np6HOngFE
 ikpA==
X-Gm-Message-State: AOAM533L2ss3f37XGmF0WPcDFDT4U8BNOUe8+3t4Y/gFSR3jQe+bulQ9
 wVKUkZIovlTTD9QBGWAWAWEhHL4NUaMJ+5aKnQGxOH0oA4bXGVaymKuUMuHEJyQ/c3LDpKGvO/G
 XVeYfeJRBHm7C7aTJPDkXybVILXoc
X-Received: by 2002:a1c:721a:0:b0:394:7a5:a1f3 with SMTP id
 n26-20020a1c721a000000b0039407a5a1f3mr143690wmc.104.1651680550293; 
 Wed, 04 May 2022 09:09:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIx/bSDjLZUz2+wMLiU6UbK8uvupILRSAzIkG+h2yKLB+VlSgGQcUiW0RU4Ob8siSPn6THPQ==
X-Received: by 2002:a1c:721a:0:b0:394:7a5:a1f3 with SMTP id
 n26-20020a1c721a000000b0039407a5a1f3mr143675wmc.104.1651680550041; 
 Wed, 04 May 2022 09:09:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:a765:79fb:b5ef:c480?
 ([2a01:e0a:d5:a000:a765:79fb:b5ef:c480])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a05600c000900b003942a244ec8sm4068510wmc.13.2022.05.04.09.09.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 09:09:09 -0700 (PDT)
Message-ID: <c0ff75b7-7500-1c84-90fb-2092622357b4@redhat.com>
Date: Wed, 4 May 2022 18:09:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 0/3] mgag200: Improve damage handling
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 lyude@redhat.com
References: <20220504134026.283417-1-jfalempe@redhat.com>
 <c54fe066-27df-f317-0613-a7f20168508f@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <c54fe066-27df-f317-0613-a7f20168508f@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jfalempe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: michel@daenzer.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/05/2022 16:59, Thomas Zimmermann wrote:
> Hi Jocelyn,
> 
> with my comment on 3/3 considered, you can add
> 
> Reviewed-by: Thomas Zimemrmann <tzimemrmann@suse.de>
> 
> to this patchset.
> 
> You should get commit access for drm-misc, so that you can land the 
> patchset on your own. Please see
> 
>    https://drm.pages.freedesktop.org/maintainer-tools/commit-access.html
> 
> for how to do that.

Thanks for your reviews.
I created the issue to get commit access :
https://gitlab.freedesktop.org/freedesktop/freedesktop/-/issues/433

Best regards,

-- 

Jocelyn
> 
> Best regards
> Thomas
> 
> Am 04.05.22 um 15:40 schrieb Jocelyn Falempe:
>> mgag200: Improve damage handling
>>
>> This series improves the damage handling on Matrox gpu, and allows
>> Gnome/Wayland to run much better.
>> Also include some driver cleanup.
>>
>> Tested on a Dell T310 with Matrox MGA G200eW WPCM450 (rev 0a)
>>
>> v2:
>>   Drop remove mgag200_probe_vram()
>>   Rewrote the patch to warn if startaddr is not 0, and hw doesn't
>>    support it. (instead of removing the unused flag).
>>
>> Thanks,
>>
> 

