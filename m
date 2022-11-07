Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C935461FED5
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 20:43:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D9E10E3D9;
	Mon,  7 Nov 2022 19:43:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCC4B10E3D9
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 19:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667850219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5AnQkkxeXV0W5i5BhTk5A0lEhldRduibOLeYJDu0I1c=;
 b=QF6XU33vyoXNVcKWrIfuUB8Od5/thKpBA+L7cMxzqM9UwxRtp1eLTCt9H4uxOCXqnI0g20
 Xar2s9gGimt/eQRA53CHZp3L3xJDu3+fQdui5wg3Akxm/+Pl+6YziCW+JFr2GTJOl4zLax
 ag3WiYdt/j330BA++Hwif0gPdYlTRqc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-421-1TDvozp3Mna_EQeafdVSnw-1; Mon, 07 Nov 2022 14:43:37 -0500
X-MC-Unique: 1TDvozp3Mna_EQeafdVSnw-1
Received: by mail-ed1-f72.google.com with SMTP id
 dz9-20020a0564021d4900b0045d9a3aded4so9161641edb.22
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Nov 2022 11:43:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5AnQkkxeXV0W5i5BhTk5A0lEhldRduibOLeYJDu0I1c=;
 b=Csxrlz/DbhuNRy0+FkdsfyG6skFkSyM87NyzW55GL8YzRjPA4tGlHmKcJ7DsDQ6lc1
 to0X59kIHUJwRWvTt9S8PedYPZ++IDuHbzaIPmLzXEuSoDIwci0onwvSgn4FyyQpnGFC
 KA+jLmKs0/d0AANBkeB3+CS/AQazLjxP5Q7f7N5qSA32WlS0a/9l+Zj+fT7tO1LNXwfl
 iHoB0srcfHeS7pWf0hXg8josgBYAyrwmpBwjPDnJrKN8dZTGUpkiM3BmV2Gtvs4OOr/b
 f/JDU9zVQbb9LCCghkKFaH82bIDsQ8bkeS37sOdyhYUE6QD67FZKOkSdRFVNE01wXu5a
 sAtQ==
X-Gm-Message-State: ACrzQf2b8e2Qr/9Sl+TNtJOGryK8HJ5KenYlVeHzX3voZff22tI2OtdI
 VURnn5ZroPBQjpFGg02kpvJ6Z3zjzvi+nhxWgygFAiSTLWOWEQ/bT/dWx2Uv70mbTGi+Pe3kV6Y
 Qh1F3vIHdOBRo9AA85nX/kCjcam7F
X-Received: by 2002:a17:907:5cb:b0:791:96ec:f436 with SMTP id
 wg11-20020a17090705cb00b0079196ecf436mr51337754ejb.100.1667850216728; 
 Mon, 07 Nov 2022 11:43:36 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5RNrhsn5Af//r93f7uPW0HNWc61mhMfbgCMrZaZgjDVlmL3t7weeTQSsc7gXvpt9u7R88CyQ==
X-Received: by 2002:a17:907:5cb:b0:791:96ec:f436 with SMTP id
 wg11-20020a17090705cb00b0079196ecf436mr51337737ejb.100.1667850216558; 
 Mon, 07 Nov 2022 11:43:36 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 pj27-20020a170906d79b00b007ad96726c42sm3794816ejb.91.2022.11.07.11.43.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Nov 2022 11:43:36 -0800 (PST)
Message-ID: <00889f1f-d9e5-9607-6932-f72417953ea7@redhat.com>
Date: Mon, 7 Nov 2022 20:43:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 24/26] drm: gm12u320: Remove #ifdef guards for PM related
 functions
To: Paul Cercueil <paul@crapouillou.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20221107175106.360578-1-paul@crapouillou.net>
 <20221107175510.361051-1-paul@crapouillou.net>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221107175510.361051-1-paul@crapouillou.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 11/7/22 18:55, Paul Cercueil wrote:
> Use the pm_ptr() macro to handle the .suspend / .resume / .reset_resume
> callbacks.
> 
> This macro allows the suspend and resume functions to be automatically
> dropped by the compiler when CONFIG_PM is disabled, without having
> to use #ifdef guards.
> 
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch. It also allows to drop the
> __maybe_unused tags.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
> Cc: Hans de Goede <hdegoede@redhat.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/gpu/drm/tiny/gm12u320.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
> index 7441d992a5d7..0a901201142e 100644
> --- a/drivers/gpu/drm/tiny/gm12u320.c
> +++ b/drivers/gpu/drm/tiny/gm12u320.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <linux/module.h>
> +#include <linux/pm.h>
>  #include <linux/usb.h>
>  
>  #include <drm/drm_atomic_helper.h>
> @@ -718,15 +719,15 @@ static void gm12u320_usb_disconnect(struct usb_interface *interface)
>  	drm_atomic_helper_shutdown(dev);
>  }
>  
> -static __maybe_unused int gm12u320_suspend(struct usb_interface *interface,
> -					   pm_message_t message)
> +static int gm12u320_suspend(struct usb_interface *interface,
> +			    pm_message_t message)
>  {
>  	struct drm_device *dev = usb_get_intfdata(interface);
>  
>  	return drm_mode_config_helper_suspend(dev);
>  }
>  
> -static __maybe_unused int gm12u320_resume(struct usb_interface *interface)
> +static int gm12u320_resume(struct usb_interface *interface)
>  {
>  	struct drm_device *dev = usb_get_intfdata(interface);
>  	struct gm12u320_device *gm12u320 = to_gm12u320(dev);
> @@ -747,11 +748,9 @@ static struct usb_driver gm12u320_usb_driver = {
>  	.probe = gm12u320_usb_probe,
>  	.disconnect = gm12u320_usb_disconnect,
>  	.id_table = id_table,
> -#ifdef CONFIG_PM
> -	.suspend = gm12u320_suspend,
> -	.resume = gm12u320_resume,
> -	.reset_resume = gm12u320_resume,
> -#endif
> +	.suspend = pm_ptr(gm12u320_suspend),
> +	.resume = pm_ptr(gm12u320_resume),
> +	.reset_resume = pm_ptr(gm12u320_resume),
>  };
>  
>  module_usb_driver(gm12u320_usb_driver);

