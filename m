Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6565402A4
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 17:41:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B81D10E25F;
	Tue,  7 Jun 2022 15:41:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC1BF10E25F
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 15:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654616472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MW20m0fXB97Kzh8xHfouXeuYHpNJecVj214SM0USpwc=;
 b=DaMEaMySa+Uo4j2su3GtpTgiBvPDwbMkwZniZAqwFq/m5meBpVybnMYi9DXNGg/H3mKLQ+
 4afqERb5rjUQxY/0remtNYd7jkBZFP0XHHglqS7iuC7SPM7i0102d/jyxaf04k2lglDqag
 mnqKFVeKiWb3Ei/Sq5kHCMmYAA0Uac0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-198-wC_mZip9Or-h3-zp33mSQg-1; Tue, 07 Jun 2022 11:41:11 -0400
X-MC-Unique: wC_mZip9Or-h3-zp33mSQg-1
Received: by mail-wr1-f69.google.com with SMTP id
 bw25-20020a0560001f9900b002175d64fd29so2156999wrb.9
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jun 2022 08:41:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MW20m0fXB97Kzh8xHfouXeuYHpNJecVj214SM0USpwc=;
 b=NngplE7mQwTXV17hy52kS048eY3wSLj1FFHf4P90ek4W6bNM4daMr14A9JCao7jnPf
 LAh1E40FsjcdZ6fCKmCxahyw7edhifo5ehmftvsYgWAfr/dft6LxqpAcU7bjT+mBHmf1
 9i2+WF+HGozxcwvcOzAasIm/qLSFuaVxvcMJwzleeHWmanT/sf4+NxDmEmBWW+DqhNaU
 Snh8oqGk45ELRApJvjXawVdblrOWmCltcJIoCopeoq1s73n0t9Xesz8wV48SXVZFGTug
 4i80Uoa3B2RjWK6VBOfCAM608IV3lzudVkh2uh4Oc8k5P9cTgJossguQToibbfxUhnHr
 CMhA==
X-Gm-Message-State: AOAM532EyLxEoLONll5LmJxAaBwa/jCJoe56FlZpU/3VsoaipKLA1g1M
 ykmCc6CYIjfaI7TM8HSAB3t95Z7Owx2r5B6/4F3DXGTInix2Qdw5ZlP2kZ1/PEDc7nMSXhuyRE7
 PGEuKGyxHM7z8GfaDrgaplyG0tOoD
X-Received: by 2002:adf:cf04:0:b0:215:e763:518a with SMTP id
 o4-20020adfcf04000000b00215e763518amr19598095wrj.290.1654616470534; 
 Tue, 07 Jun 2022 08:41:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygbbgbOiyD2ek2GV5QdQZM8m7ti0m92eFR0rbReFw2iOXdMVBWmQ6imP5ap57dHC1mi4EPfg==
X-Received: by 2002:adf:cf04:0:b0:215:e763:518a with SMTP id
 o4-20020adfcf04000000b00215e763518amr19598068wrj.290.1654616470203; 
 Tue, 07 Jun 2022 08:41:10 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 r21-20020a05600c425500b0039c41686421sm13105215wmm.17.2022.06.07.08.41.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jun 2022 08:41:09 -0700 (PDT)
Message-ID: <da991c8e-bd19-d243-5433-82b9621df4aa@redhat.com>
Date: Tue, 7 Jun 2022 17:41:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v5 5/7] fbdev: Disable sysfb device registration when
 removing conflicting FBs
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20220511112438.1251024-1-javierm@redhat.com>
 <20220511113144.1252729-1-javierm@redhat.com>
 <Yp9oLJ/HD2rHxO3z@phenom.ffwll.local>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <Yp9oLJ/HD2rHxO3z@phenom.ffwll.local>
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

On 6/7/22 17:01, Daniel Vetter wrote:

[snip]

>>
>>  drivers/video/fbdev/core/fbmem.c | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
>> index 9b035ef4d552..265efa189bcc 100644
>> --- a/drivers/video/fbdev/core/fbmem.c
>> +++ b/drivers/video/fbdev/core/fbmem.c
>> @@ -1789,6 +1789,17 @@ int remove_conflicting_framebuffers(struct apertures_struct *a,
>>  	if (do_free)
>>  		kfree(a);
>>  
>> +	/*
>> +	 * If a driver asked to unregister a platform device registered by
>> +	 * sysfb, then can be assumed that this is a driver for a display
>> +	 * that is set up by the system firmware and has a generic driver.
>> +	 *
>> +	 * Drivers for devices that don't have a generic driver will never
>> +	 * ask for this, so let's assume that a real driver for the display
>> +	 * was already probed and prevent sysfb to register devices later.
>> +	 */
>> +	sysfb_disable();
> 
> So the og version had (or should have had at least) the sysfb_disable()
> call before we go through the loop and try to unregister stuff. I think
> this needs to be done before we call do_remove_conflicting_framebuffer()
> instead. With that:
>

Yes, the original version did that but also the original version didn't
attempt to remove the devices registered by sysfb on sysfb_disable().

I was going to answer that this has to be done after the loop because
that way fbmem could first ask sysfb to remove the devices, but then I
realized that you are correct That this wouldn't be needed if sysfb does
the disable (and unregistration) before the loop.

So by doing it before the loop, we should be able to drop [PATCH v5 4/7]
fbdev: Make sysfb to unregister its own registered devices:

https://lists.freedesktop.org/archives/dri-devel/2022-May/355201.html

Since by the time the loop is executed, no registered_fb associated with
a device that was registered by sysfb should be present in that array.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

