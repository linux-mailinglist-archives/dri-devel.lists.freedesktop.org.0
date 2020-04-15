Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1461AAB46
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 17:04:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B2296EA09;
	Wed, 15 Apr 2020 15:04:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0011B6EA09
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 15:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586963088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qjoV7UUa4yRjcvmATbRtOzlGZcTOLW2L0/Is7k1YqTQ=;
 b=YmM2MCqsbs+nj/TtvuMK6qCoa+8CLZtYLKCeMyqhor+r5NgKcU9c6Fx9ov3BlP8/cNpfX9
 SRH7HdYz1pahIgL+XBhjzmLptwSHEIwDE03X2wCjbL9W+3Ba/602bps0G1N0cPgbb9RpWU
 PaMLGvBT6RULljjBY2Iwq9GSpPZCXbw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-a_0zrldJMOS5td8CVluyUA-1; Wed, 15 Apr 2020 11:04:47 -0400
X-MC-Unique: a_0zrldJMOS5td8CVluyUA-1
Received: by mail-wr1-f71.google.com with SMTP id m5so42092wru.15
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 08:04:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qjoV7UUa4yRjcvmATbRtOzlGZcTOLW2L0/Is7k1YqTQ=;
 b=MIZ7TtLpQECvf63dVo61flMGMJrP5xlOlxco2oUYiWfk1ClQ9LInk3xsLNY4cGC4Bw
 pJH08T63tznRzW9NAkZbtTzpomZw7KBTNOzF0ATn1EQol51/qzycmCJAKvMJRaZWdBN2
 bgGpUkeWhbkxkvMackLHyRqp2cPoQuozoiw5/eY2pdoza7HBdTLFXaWEbX7eaY3pelzE
 d3Bg8InPfwJYZYjVT1UwlnzWy8EgrCUYFcP8568sgDZkju5VhM2QhyAG6fU4Ondu7laY
 LrEfl20Q3vd+yoGETlnMBeDVTgZ71hbSiAwZ5l4Ld8qETxKHoBvEMQn/nflY84Z6YljV
 7RKg==
X-Gm-Message-State: AGi0Pub30TmDdOo0dLwp6rGDQ2HR4T08XRMx6exkjPNnOtF9GdNfh7fi
 R7empcaqS28yBf0F/RRRq/l8zUtHTQBZlDZmxaGDm6gDeaiGhm1QLANVGylLkyWih4R3TcBfHEQ
 cqjUivJi8qQMypR/RRMfJUGUELoim
X-Received: by 2002:a5d:694a:: with SMTP id r10mr29608654wrw.228.1586963086099; 
 Wed, 15 Apr 2020 08:04:46 -0700 (PDT)
X-Google-Smtp-Source: APiQypJyRLtqSTORCQdgg4n8rhVYMVuFz6ruZQkgZ+GE5eCFRzJcfpD0tVg1OfJRAeeKS1wcQXmz0A==
X-Received: by 2002:a5d:694a:: with SMTP id r10mr29608638wrw.228.1586963085914; 
 Wed, 15 Apr 2020 08:04:45 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id b7sm23766421wrn.67.2020.04.15.08.04.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Apr 2020 08:04:45 -0700 (PDT)
Subject: Re: [PATCH 21/59] drm/gm12u320: Use devm_drm_dev_alloc
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
 <20200415074034.175360-22-daniel.vetter@ffwll.ch>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <046dc29e-f643-b05e-a030-3b1c1ebef661@redhat.com>
Date: Wed, 15 Apr 2020 17:04:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200415074034.175360-22-daniel.vetter@ffwll.ch>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 4/15/20 9:39 AM, Daniel Vetter wrote:
> Already using devm_drm_dev_init, so very simple replacment.
> 
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Hans de Goede <hdegoede@redhat.com>

LGTM:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>   drivers/gpu/drm/tiny/gm12u320.c | 13 ++++---------
>   1 file changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
> index 6f0ea2827d62..907739a67bf6 100644
> --- a/drivers/gpu/drm/tiny/gm12u320.c
> +++ b/drivers/gpu/drm/tiny/gm12u320.c
> @@ -631,22 +631,17 @@ static int gm12u320_usb_probe(struct usb_interface *interface,
>   	if (interface->cur_altsetting->desc.bInterfaceNumber != 0)
>   		return -ENODEV;
>   
> -	gm12u320 = kzalloc(sizeof(*gm12u320), GFP_KERNEL);
> -	if (gm12u320 == NULL)
> -		return -ENOMEM;
> +	gm12u320 = devm_drm_dev_alloc(&interface->dev, &gm12u320_drm_driver,
> +				      struct gm12u320_device, dev);
> +	if (IS_ERR(gm12u320))
> +		return PTR_ERR(gm12u320);
>   
>   	gm12u320->udev = interface_to_usbdev(interface);
>   	INIT_DELAYED_WORK(&gm12u320->fb_update.work, gm12u320_fb_update_work);
>   	mutex_init(&gm12u320->fb_update.lock);
>   
>   	dev = &gm12u320->dev;
> -	ret = devm_drm_dev_init(&interface->dev, dev, &gm12u320_drm_driver);
> -	if (ret) {
> -		kfree(gm12u320);
> -		return ret;
> -	}
>   	dev->dev_private = gm12u320;
> -	drmm_add_final_kfree(dev, gm12u320);
>   
>   	ret = drmm_mode_config_init(dev);
>   	if (ret)
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
