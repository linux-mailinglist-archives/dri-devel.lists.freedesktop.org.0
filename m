Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 970714A5E64
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 15:36:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFD2210E181;
	Tue,  1 Feb 2022 14:36:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43CB710E181
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 14:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643726169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c1qqBdKQoPCwA2ePd7jBkicuBscZF3IvkLQTjtTxA/c=;
 b=a7eUnWPrmga2Ef1jvyEh5tApsmsNQau8UJgN5MSkVmy1zwkTBbrBQVQvPWbL8xdY75qW1O
 VdJha6Ou0d7DIpw6JJMp/Ug627tJJPqxDM8e1gach61p//QccvK3JMTVXkLzbUg49pbvCR
 7EgVn5nb2LNVH87+dhEMaNwYn++iaIg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-428-vAtL3_yAOD-1luYin1uYpA-1; Tue, 01 Feb 2022 09:36:08 -0500
X-MC-Unique: vAtL3_yAOD-1luYin1uYpA-1
Received: by mail-wm1-f72.google.com with SMTP id
 bg16-20020a05600c3c9000b0034bea12c043so1701606wmb.7
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Feb 2022 06:36:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=c1qqBdKQoPCwA2ePd7jBkicuBscZF3IvkLQTjtTxA/c=;
 b=0yoYswNM0GrfnWcQkkTaqgUOf+AezOTBN8oKksTgCpW99HDJ7Q1fUvRfjIJNc2vLwL
 E2O5DFKOKB6kUCprcG/2n3peYvFAoP6vg5NN4a1qeIU83IzbEcjI1R0cHkWiZAojVoEo
 3BQZF3ECbK/BvY+oPo5zbvINUue3Jhqm4KbhAwH71tNgWHw1VNQTFoVeoRZGLtL4cTap
 Gfd2O4nQJ8CuM0/fLT+sKOFMwNnSKwXbMXByXp3UVOlN9P43HZsqOTu9Blbd9BD3Lq+T
 AyUpowS+YiJoGhBsLSGUIlZ0YZ+qc93rm1bgBmUFN9rZL2Eem5Pw2VRsTZ0Ze8PqeCbF
 N5sg==
X-Gm-Message-State: AOAM533sxiBh4rbLTFTGm9y16f28Eq+axiFSs19BSKe+VaXk+iW0vOf0
 WzuztHGMJCEWy9mjUW5Ym59lPQeQFa79axanIZLuZJteKr6j7hHcK9gCl8ktGKdHORjO8Sj120C
 gRKC14Dzu4KemT1jolbA0qnC1ABTm
X-Received: by 2002:a7b:c003:: with SMTP id c3mr2022316wmb.80.1643726166846;
 Tue, 01 Feb 2022 06:36:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyWEsVQ1UNLWnla5O+uQQySFc68PN6z96VL15rWk5+1TFXROa0fVwYLO5ACOVmJk7fJj5i8fA==
X-Received: by 2002:a7b:c003:: with SMTP id c3mr2022299wmb.80.1643726166675;
 Tue, 01 Feb 2022 06:36:06 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id h18sm17864523wro.9.2022.02.01.06.36.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 06:36:06 -0800 (PST)
Message-ID: <3df2add7-6034-0527-825a-74e62e76dace@redhat.com>
Date: Tue, 1 Feb 2022 15:36:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/4] drm/tiny: Add driver for Solomon SSD1307 OLED displays
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220131202916.2374502-1-javierm@redhat.com>
 <cc093cd5-fba1-5d84-5894-81a6e1d039ff@suse.de>
 <73dbc5c7-b9e2-a260-49a6-0b96f342391e@redhat.com>
 <CAMuHMdUJpoG=XChpqNotfEDrWCxFUqyhjW2JW1ckAyKcWXvAUw@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAMuHMdUJpoG=XChpqNotfEDrWCxFUqyhjW2JW1ckAyKcWXvAUw@mail.gmail.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/1/22 15:05, Geert Uytterhoeven wrote:
> Hi Javier,
> 
> On Tue, Feb 1, 2022 at 2:02 PM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>> On 2/1/22 10:33, Thomas Zimmermann wrote:
>>>> +{
>>>> +    u8 col_end = col_start + cols - 1;
>>>> +    int ret;
>>>> +
>>>> +    if (col_start == ssd1307->col_start && col_end == ssd1307->col_end)
>>>> +            return 0;
>>>> +
>>>> +    ret = ssd1307_write_cmd(ssd1307->client, SSD1307_SET_COL_RANGE);
>>>> +    if (ret < 0)
>>>> +            return ret;
>>>> +
>>>> +    ret = ssd1307_write_cmd(ssd1307->client, col_start);
>>>> +    if (ret < 0)
>>>> +            return ret;
>>>> +
>>>> +    ret = ssd1307_write_cmd(ssd1307->client, col_end);
>>>> +    if (ret < 0)
>>>> +            return ret;
>>>
>>> Can you write these cmds in one step, such as setting up an array and
>>> sending it with ssd1307_write_array?
>>
>> I don't think so because the commands are different. But I'll check the
>> ssd1306 datasheet again to confirma that's the case.
> 
> IIRC, I tried that while working on the optimizations for ssd1307fb,
> and it didn't work.
>

That's what I would had expected by reading the datasheet. Thanks a
lot for confirming my assumption.
 

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

