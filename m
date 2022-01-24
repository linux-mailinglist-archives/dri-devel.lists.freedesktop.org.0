Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C3949826F
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 15:31:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41EE810EB43;
	Mon, 24 Jan 2022 14:31:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 305AA10EB43
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 14:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643034679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zxE7EvkvbZeBgieiSQDMIGsZ0T4S1HBB7kM1x7CeSqM=;
 b=R37L8Uf4fthiUWU/wLd9SEcMttPKEjOmhIyQr2iZixWHghEdspZP4sh37Nuu0pSI37JFr7
 CkOD1zLok4upZuuc34p9C9qqmiBRiq64KzqhsubhtcJ3Es4Nk8LFVhhoZ1XHtc9BZRG5KC
 d/FqxgRVJsBoHDtZXT3RZEv4SQxqK1s=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-ImokGXywOYCf6PGbVQNbNw-1; Mon, 24 Jan 2022 09:31:16 -0500
X-MC-Unique: ImokGXywOYCf6PGbVQNbNw-1
Received: by mail-wr1-f70.google.com with SMTP id
 a6-20020adfbc46000000b001d7370ace6eso1954349wrh.9
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 06:31:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zxE7EvkvbZeBgieiSQDMIGsZ0T4S1HBB7kM1x7CeSqM=;
 b=XTmw7IqIvOP0nTIzqiDdyJ0AsB+hE/a4nNsfqmdlbccvYt9SYdVqLUg9FK3z+oCWsY
 OzrsZAI1fdBH2d+tArUruvUjpSw3kMOGRPDJZuEAeJJxsD97qAS4T8iujotlYo8oJyMs
 Fwz0htPnXGkd6st4oZ/8L4cMGASNjGpNUv99fHukehBmHq+HaVAiOHjHlYIomf2qUZRH
 aIdVoXV1CIKdeEvsUy9zkAGYYcImIcrAl0TmSycpZ00ictIUelGmZ4jkCWLHuOg8pYA4
 n3fZNWEt4ARI/i0UbjkCRKuXR1Jlm/41UtBNVr9GMVqufbaQf0yzJ/LFfD0aZmgqLK1R
 j0ww==
X-Gm-Message-State: AOAM530Y1wfxVQ5gs//C1UhDl3FG6r6TNgDO7+JJ+9n9mgbPein2+RlM
 g1g0s62GQ9ZU+HVhrT0wg3kkYh0NjnqMX73CO2koo4QT66zZO+Sa97zzwqT73alyXW+PJz1VDMl
 mDDSu5A56CoKk2Zm42MBe+4gYfqqL
X-Received: by 2002:a05:600c:220f:: with SMTP id
 z15mr2034797wml.145.1643034675432; 
 Mon, 24 Jan 2022 06:31:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyNP4ZAtPsdcV8SnRzGwBs1899+aHYQ2TZybxbvsvLRSnQQQ+MXblK00rIvHsobSdQm9xgCoQ==
X-Received: by 2002:a05:600c:220f:: with SMTP id
 z15mr2034772wml.145.1643034675247; 
 Mon, 24 Jan 2022 06:31:15 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id m17sm19337448wmq.35.2022.01.24.06.31.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 06:31:14 -0800 (PST)
Message-ID: <410efcd1-c104-313b-aee8-950c4f499405@redhat.com>
Date: Mon, 24 Jan 2022 15:31:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 1/5] fbdev: Hot-unplug firmware fb devices on forced
 removal
To: Thomas Zimmermann <tzimmermann@suse.de>, zackr@vmware.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, deller@gmx.de, hdegoede@redhat.com
References: <20220124123659.4692-1-tzimmermann@suse.de>
 <20220124123659.4692-2-tzimmermann@suse.de>
 <508e6735-d5f0-610c-d4ca-b1abc093f63c@redhat.com>
 <77e52472-4af7-c03f-f6e4-45ec820f2778@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <77e52472-4af7-c03f-f6e4-45ec820f2778@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/24/22 15:19, Thomas Zimmermann wrote:

[snip]

>>> +			if (dev_is_platform(dev)) {
>>
>> In do_register_framebuffer() creating the fb%d is not a fatal error. It would
>> be safer to do if (!IS_ERR_OR_NULL(dev) && dev_is_platform(dev)) instead here.
>>
>> https://elixir.bootlin.com/linux/latest/source/drivers/video/fbdev/core/fbmem.c#L1605
> 
> 'dev' here refers to 'fb_info->device', which is the underlying device 
> created by the sysfb code.  fb_info->dev is something different.
>

oh, indeed. I conflated the two.

Maybe the local variable could be renamed to 'device' just to avoid confusion ?

[snip]

>> I'm not sure to follow the logic here. The forced_out bool is set when the
>> platform device is unregistered in do_remove_conflicting_framebuffers(),
>> but shouldn't the struct platform_driver .remove callback be executed even
>> in this case ?
>>
>> That is, the platform_device_unregister() will trigger the call to the
>> .remove callback that in turn will call unregister_framebuffer().
>>
>> Shouldn't we always hold the mutex when calling do_unregister_framebuffer() ?
> 
> Doing the hot-unplug will end up in unregister_framebuffer(), but we 
> already hold the lock from the do_remove_conflicting_framebuffer() code.
>

Yes, I realized that just after sending the first email. Sorry for the noise.
 
Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

