Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E28564A5FAA
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 16:10:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5E7210E254;
	Tue,  1 Feb 2022 15:10:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 036E110E683
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 15:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643728253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xahi6KlHV6F4VQ/xZVlvC1YTaLt1tqgz8laoIFbavo4=;
 b=KnJs+m9WmWD2cDEpzquJb6QH4bop2cYJVnN632+2P9VWFq9NWNzZ5Op+rPk6E0y9R3F2U2
 x2WnzoW28rSIMkN2VssIXC/x40w0osyTmXQJZrZQnVcQc1Og8BysD4zTcqg3HQmHorh5B3
 gq4vmj+YWHKe1hhIKWJUo9f+sTBtj5c=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-128-ITpSONVuOyCdPadcJ9Ec4A-1; Tue, 01 Feb 2022 10:10:51 -0500
X-MC-Unique: ITpSONVuOyCdPadcJ9Ec4A-1
Received: by mail-wr1-f69.google.com with SMTP id
 x4-20020adfbb44000000b001d83e815683so6088936wrg.8
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Feb 2022 07:10:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Xahi6KlHV6F4VQ/xZVlvC1YTaLt1tqgz8laoIFbavo4=;
 b=15aDkBNNcHgwD1+RezyLQ6JIhSgf+BAf0RRIsQRp2PILgOYoiLQ3QKhcjZLx/cbx4M
 4D7HWVZ/suAwE3oArTtxeOJ4W1gpD4Vi93MyaUnUvPQay1wURxEpBA5tuxDg3O1hjm/d
 njdeN3BbtQSuACaJlAiOYf/fMwzf11kZGcoXgcEKmUscQgmDXrTGWsnrG3C2DFs6prnM
 V6fjhf13tywRTesSTOFOA22x+PFHHZNXUQQjgsQiFJxJEK0iVNW9esr/LcH6qqsBGwVT
 nuDucTGvIGtqEDt/KDqlrgk4grCPHhlH1adc5Jd0VR0hcwMurEBPp/Eftf+Pf3BhyMQ2
 sEXQ==
X-Gm-Message-State: AOAM531eEotJcvPux1HKk5/wKxqa9XDXsgkr4NU8E2KX7LTvg8TW0WUN
 h4j0GaW8J+aMMFxC+c6t/+CYm6ZbQDKF6KWztFtjp/bI0EGNamMMRqq+ivOHDS+pDaKC0EKtP12
 ciAiEhFK/jCFjQgbx2jshoTmfOaw5
X-Received: by 2002:a05:6000:1a8c:: with SMTP id
 f12mr11663238wry.153.1643728250668; 
 Tue, 01 Feb 2022 07:10:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxdwGp2Pak+qnkxqFSHlJ5WHAuF3l8gqYjbIl9n8aNA5CLl+rlgxDBFzggA+hPhyEXVYtJztA==
X-Received: by 2002:a05:6000:1a8c:: with SMTP id
 f12mr11663221wry.153.1643728250430; 
 Tue, 01 Feb 2022 07:10:50 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id x4sm15296308wrp.13.2022.02.01.07.10.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 07:10:50 -0800 (PST)
Message-ID: <b4fe0d36-c4ef-6f7e-e47d-f98f6055ea92@redhat.com>
Date: Tue, 1 Feb 2022 16:10:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/4] drm/tiny: Add driver for Solomon SSD1307 OLED displays
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20220131202916.2374502-1-javierm@redhat.com>
 <YfhVBtv1UIA7bJja@ravnborg.org>
 <3aac291a-b30e-2775-336f-66dd08d634e2@redhat.com>
 <YfkA4ER/52I2v1JP@smile.fi.intel.com>
 <9ddd8a8c-4aa9-bc4a-5637-66197a7342d1@redhat.com>
 <Yfk9fuazUSgI6C9n@smile.fi.intel.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <Yfk9fuazUSgI6C9n@smile.fi.intel.com>
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/1/22 15:02, Andy Shevchenko wrote:
> On Tue, Feb 01, 2022 at 12:45:53PM +0100, Javier Martinez Canillas wrote:
>> On 2/1/22 10:44, Andy Shevchenko wrote:
>>> On Tue, Feb 01, 2022 at 01:14:22AM +0100, Javier Martinez Canillas wrote:
> 
> ...
> 
>>> The problem with no backward compatibility means that removal of old driver
>>> makes users unhappy since DT is kinda ABI and we do not break it.
>>>
>>
>> I think that's the crux of the issue. Do we want people to update their
>> kernel but using their existing Device Tree and be able to switch to the
>> DRM driver ?
>>
>> My take is that we should and that's why I kept the backward compatibility.
>>
>> Maybe we could do that in the meantime and at some point introduce new DT
>> bindings (with a different compatible string) that would use the latest
>> and greatest conventions in DT ? That seems to be a good compromise.
> 
> I have over-read in this discussion that current binding is not fully
> correct from hw perspective. If it's indeed the case (and I believe it's),
> then probably we should come with brand new driver with ssd130x name and
> incompatible bindingas (*).
>
> Otherwise in this driver we continue to be incorrect in them.
>

See the comment from Geert. I believe we should use the existing binding.
 
> *) But even though I think it would be good if you take the old one under your
>    maintainership.
>

Sure, now that I got familiar with the ssd130x devices, I'll be happy to
help with the ssd1307fb driver maintainership.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

