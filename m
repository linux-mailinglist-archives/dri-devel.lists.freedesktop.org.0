Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FB8517529
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 18:55:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C81AF10EA12;
	Mon,  2 May 2022 16:55:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E3A10EA12
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 16:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651510514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xIzcVGz7jvv3xeuZxkzYe3VCF5DB6mpSZGaw7yGILbk=;
 b=SDtSlUc13IxTk2d2uTpkbrEQb/AR1rEp0VgyNjrMKfMcEiyDlCtE+CyXywytNhHzm+klds
 MisVw+JGvj128/KoQIwEr+PMcuKp9u6W3E6Kwden5jQCyujWR7MLkLJQw9egWYhqhUpKCt
 0Ebtdxi7axwZGY4J0aXvWLAEx2TDTRE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-552-UgyHsTuUO8uF9QcrPCUnsg-1; Mon, 02 May 2022 12:55:13 -0400
X-MC-Unique: UgyHsTuUO8uF9QcrPCUnsg-1
Received: by mail-wr1-f71.google.com with SMTP id
 o11-20020adfca0b000000b0020adc114131so5478059wrh.8
 for <dri-devel@lists.freedesktop.org>; Mon, 02 May 2022 09:55:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xIzcVGz7jvv3xeuZxkzYe3VCF5DB6mpSZGaw7yGILbk=;
 b=gysNnIdfjffYGxM8Tu4YBxMUflsk/nmTZRHJK2I7D72kpnbXXuAatUuqWNTaVgr839
 Y/v6mnMvMt/18i1tidW4o+EpEo17AFGh4DF7MV5Ot+a6LJI3UM77PhxvvJYXDKOvAM/8
 qPkgBqFm+efqeW1XiP5JHMCF063Xa+lYpL/gEGc3lBuPvry7DajOWaiA6mVfpxCH+BcS
 s2wZl998pK6bD5fp7NFCWq7C/KYyzYZmO5VqYx6cVHDVIvFv7WSKh0naqQqfJ7+dYLi0
 LeXxQlhi7vzlfnpOjtTCtIqtV+DJmu0v6UgiBC6nKwDCvneP7HP3Ir6vFDnHkmPJm8cL
 tf2Q==
X-Gm-Message-State: AOAM533FDsdNwFTJqiUGOJLoJXR2lQxwNLGd3NmktLBdS5ZNJXZ8ajuP
 KT4d76RxkbH2dHfFMKZSjuYQiXjUn1g/rivWQulQ+0aWpsDuGh4DqCkQHNSppkcGOZkAo1nUg83
 plNPNo2+BSnNqi100rs1dIAXZHxq8
X-Received: by 2002:a05:600c:220e:b0:394:2695:ce9b with SMTP id
 z14-20020a05600c220e00b003942695ce9bmr63527wml.64.1651510512505; 
 Mon, 02 May 2022 09:55:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXHCdnrBQZAdylY92wBiX6hj/7UIQj39kbqjBAbaznjJ5J3GoSPQN7nxolvY6RoRBArA57Pw==
X-Received: by 2002:a05:600c:220e:b0:394:2695:ce9b with SMTP id
 z14-20020a05600c220e00b003942695ce9bmr63506wml.64.1651510512248; 
 Mon, 02 May 2022 09:55:12 -0700 (PDT)
Received: from [192.168.1.129] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 q29-20020adfb19d000000b0020c5253d8e9sm7222672wra.53.2022.05.02.09.55.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 09:55:11 -0700 (PDT)
Message-ID: <5dd80287-1b09-d02c-9f67-5a0bb0a4566c@redhat.com>
Date: Mon, 2 May 2022 18:55:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 1/3] drm: Remove superfluous arg when calling to
 drm_fbdev_generic_setup()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20220502153900.408522-1-javierm@redhat.com>
 <20220502153900.408522-2-javierm@redhat.com>
 <YnABjdpGC166yIY7@pendragon.ideasonboard.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YnABjdpGC166yIY7@pendragon.ideasonboard.com>
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

Hello Laurent,

On 5/2/22 18:06, Laurent Pinchart wrote:
> Hi Javier,
> 
> Thank you for the patch.
> 
> On Mon, May 02, 2022 at 05:38:58PM +0200, Javier Martinez Canillas wrote:
>> The drm_fbdev_generic_setup() function already sets the preferred bits per
>> pixel for the device to dev->mode_config.preferred_depth, if preferred_bpp
>> value is zero.
>>
>> Passing the same value to the function is unnecessary. Let's cleanup that
>> in the two drivers that do it.
> 
> This looks fine, so
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> but why do we have two different mechanisms to set the preferred depth ?
> Could we get all drivers to set dev->mode_config.preferred_depth and

Yes, that's the plan and the reason why when we were discussing with Thomas
about how to pass this option to the FB helper layer, we agreed on reusing
the @preferred_bpp parameter rather than adding a third parameter to
drm_fbdev_generic_setup(). Since in the future drivers shouldn't pass that
information to the FB helper and just get it from the default mode config.

But doing that would require more auditing to all drivers and it could add
regressions while patches 1/2 and 2/2 in this series shouldn't cause any
behavioral changes.

> drop the depth option to drm_fbdev_generic_setup() ? There's a FIXME
> comment in drm_fbdev_generic_setup() that could be related.
>

A FIXME makes sense, I'll add that to when posting a v3.
 Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

