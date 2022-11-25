Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 205F66385DB
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 10:06:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29D7A10E216;
	Fri, 25 Nov 2022 09:06:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9E1510E191
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 09:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669367203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M7QTtRRbL7+Wq11xJkPqBXcSqP3SyIaC64ZZMRaftKc=;
 b=KtB3XnCGlV29khiUMh5RghpR89U+cVZYzqvojEyAKlDrE9aolrZwKrqqYumWYGUmAjLFi4
 uQfUiNINxkIDO69wTt7fkGUN2igmBOScWk9Mf9MLJuhB66IAQ4lAKQVCMlJIuTmQaDRsTa
 y1noFcxHMrpevm0T+Qu9QLsoagxILzE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-438-wvBJKYxYMeSfI307M6-SHw-1; Fri, 25 Nov 2022 04:06:41 -0500
X-MC-Unique: wvBJKYxYMeSfI307M6-SHw-1
Received: by mail-wm1-f71.google.com with SMTP id
 j2-20020a05600c1c0200b003cf7397fc9bso2141244wms.5
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 01:06:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M7QTtRRbL7+Wq11xJkPqBXcSqP3SyIaC64ZZMRaftKc=;
 b=VpNwQUhNtce7v1wWuL8BhYFZOSMHzqyeptEgFAMB8iONywXz09cpLkMwE17tuVNXUB
 QmR+sTNWTTE5MFkKpxYiiK7gdyyIXJ+deVG36oxqniBauArKDcA4utKuNVPFnWnEksT9
 P311KmsiXoXr6tDpKDtENKXOEB9/RVykaUTE2r3oKB7hFzTwwMrHukzrleqU5UBcqCx2
 gV/mpJvjRT7vLTl3gSAy5ZSLWc2djSUvpjrbPZMEjiE43AhLAGIIU2qs/FGn/Opqbg9A
 2wDz8xkamzV1rqDy0W8jOKtC292TTebuQOF9GExN7ajPJg+1AlYXKt2Srb8a3WssyG5b
 Y15A==
X-Gm-Message-State: ANoB5pmNcGKw+/n7bzVKr9EUG4MGPYHf5h0Atf98n83a1T8GN5KX3Pag
 7JmuKMcM8KPM7IKTjoWN/SuzBUxIRgi1ukzG4X9TQta7hB3MAvODUlMYlF4YUDYuzspsHGVs/Fs
 Xd+H1bh/f3FHbo15tuduD/TTOiIRl
X-Received: by 2002:adf:e305:0:b0:236:6089:cc5e with SMTP id
 b5-20020adfe305000000b002366089cc5emr13634713wrj.118.1669367200524; 
 Fri, 25 Nov 2022 01:06:40 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5a4/3UUdnTCVdtjBQVAGdYcgL9eE9W0y2TcH3nZQvBy0bZE1SSPYRFB9nYPNcK7okvPIxpQA==
X-Received: by 2002:adf:e305:0:b0:236:6089:cc5e with SMTP id
 b5-20020adfe305000000b002366089cc5emr13634702wrj.118.1669367200332; 
 Fri, 25 Nov 2022 01:06:40 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 j8-20020adff548000000b002367ad808a9sm3235859wrp.30.2022.11.25.01.06.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Nov 2022 01:06:38 -0800 (PST)
Message-ID: <d5df9a73-c093-3584-31f4-e2f4f7bd9272@redhat.com>
Date: Fri, 25 Nov 2022 10:06:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 03/24] drm/tests: helpers: Create the device in another
 function
To: Maxime Ripard <maxime@cerno.tech>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
 <20221123-rpi-kunit-tests-v1-3-051a0bb60a16@cerno.tech>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221123-rpi-kunit-tests-v1-3-051a0bb60a16@cerno.tech>
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
Cc: David Gow <davidgow@google.com>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/23/22 16:25, Maxime Ripard wrote:
> We'll need in some tests to control when the device needs to be added
> and removed, so let's split the device creation from the DRM device
> creation function.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

[...]

> -static int dev_init(struct kunit_resource *res, void *ptr)
> +struct device *drm_kunit_helper_alloc_device(struct kunit *test)
>  {
> -	char *name = ptr;
> -	struct device *dev;
> -
> -	dev = root_device_register(name);
> -	if (IS_ERR(dev))
> -		return PTR_ERR(dev);
> -
> -	res->data = dev;
> -	return 0;
> +	return root_device_register(FAKE_DEVICE_NAME);

I was going to ask if a platform device could be used here, to prevent the
issue you mentioned the other day of root_device not having a bus set. But
I see now that you are doing that change in the next patch.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

