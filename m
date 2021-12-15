Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F46B475497
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 09:50:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5327410EE70;
	Wed, 15 Dec 2021 08:50:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFDC710EDCB
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 08:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639558242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mlFmq0lWb+QEzLX+6e0PsTY43Gj00mSLJ9F7c04n+vM=;
 b=VpX/c09xcHEY3Z5DoHlJA3RmJpeIq0N/pFNjK8AqGqBBZDWOcr6WHGjoINkd88BPy9YdGp
 C8Y1qMA8zfMyV/JDEe3QQJNHtqwk1YroYyoAwHsxRBxXuCfGjlL9uVTpglsRG9DO2jW5vc
 QGK3Oko5GeRZ8KlssI2x1N+smegzfNM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-245-K1vT4xbEM4eMPo1BO5Kgkw-1; Wed, 15 Dec 2021 03:50:39 -0500
X-MC-Unique: K1vT4xbEM4eMPo1BO5Kgkw-1
Received: by mail-wr1-f69.google.com with SMTP id
 m12-20020adff38c000000b001a0cb286eacso1431844wro.9
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 00:50:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mlFmq0lWb+QEzLX+6e0PsTY43Gj00mSLJ9F7c04n+vM=;
 b=1ueAhyFWsctY4pRB9rAoEXHRYVxRh6bUMJwB3Y9vxm14t2FhcnmQr0yHseh3bINy2V
 vVp2cTSbEXgFemuuA9CDBMePTyV1U60N0G4dp18wcJ+C8ZjJLCNm3pu+9JDp6JC1JcKa
 8Ky+w6baKBNhPc6JZSO2fSR+5r7xaBBbaRW/y6p1tVUEHMa3DdjLhBwsePcG4uXbMfyy
 cs/Vbgpb+G4XQYzoTbFdEKmZpwgud5loKsNYaZ1ej3GiCj/h1T8Xpcet4FKP/m4fkhXQ
 fGqwWMb4IQxPXxLN7iWOYZyvibDiIkMINNEr9TMbN0eQ7K06EPA3UpGpicbtbAIcDQQJ
 Lxxg==
X-Gm-Message-State: AOAM530kF4fcesGboxkGRHn0/zszlLBtbjh7FraCw2HL5WxW6DfzTXUL
 GU1j4ZVycJYUYsXMzARfXk2JuVXAvzt81zDNoSduCTYthvM4uoU+G1PV3QtqIq8IY0VSoU+UHZw
 MI9pmyQ3mQLkjHLsSrWCablM90vJH
X-Received: by 2002:a05:600c:1d89:: with SMTP id
 p9mr1640368wms.66.1639558238142; 
 Wed, 15 Dec 2021 00:50:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwz185jzSF9LFh9vHyZZeDFt7zAt+IajPb1sNvr1OFvur6Y5tN1PcPTxCNgP0SRmhsVAe9I1Q==
X-Received: by 2002:a05:600c:1d89:: with SMTP id
 p9mr1640329wms.66.1639558237854; 
 Wed, 15 Dec 2021 00:50:37 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id r17sm4708773wmq.5.2021.12.15.00.50.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 00:50:37 -0800 (PST)
Message-ID: <1c1aeb13-6e90-ed2b-08db-11ceaa8d0de0@redhat.com>
Date: Wed, 15 Dec 2021 09:50:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 00/60] drm: Make all drivers to honour the nomodeset
 parameter
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20211215010008.2545520-1-javierm@redhat.com>
 <58d00cac-dbf1-9704-3c0b-16fd837a5b6b@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <58d00cac-dbf1-9704-3c0b-16fd837a5b6b@suse.de>
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
Cc: Emma Anholt <emma@anholt.net>, Neil Armstrong <narmstrong@baylibre.com>,
 Xinliang Liu <xinliang.liu@linaro.org>, Edmund Dea <edmund.j.dea@intel.com>,
 Paul Cercueil <paul@crapouillou.net>, Tomi Valkeinen <tomba@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Marek Vasut <marex@denx.de>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Russell King <linux@armlinux.org.uk>,
 Deepak Rawat <drawat.floss@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>, Joel Stanley <joel@jms.id.au>,
 Russell King <linux+etnaviv@armlinux.org.uk>, Qiang Yu <yuq825@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Lechner <david@lechnology.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Alison Wang <alison.wang@nxp.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>, Sean Paul <sean@poorly.run>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Philippe Cornu <philippe.cornu@foss.st.com>, Tian Tao <tiantao6@hisilicon.com>,
 Jyri Sarha <jyri.sarha@iki.fi>, Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 12/15/21 09:31, Thomas Zimmermann wrote:
> Hi Javier,
> 
> nothing wrong with your patches, but I'd like to propose slightly 
> differnt solution.
> 
> For many USB drivers, you put the drm_firmware_drivers_only() call into 
> the probe function. For registering, these drivers use 
> module_usb_driver(), which expands to generic device-register functions.
> 
> I'd like to propose a similar macro for DRM drivers that includes the 
> test for drm_firmware_drivers_only().
> 
> In drm_drv.h :
> 
>    #if defined(USB)
>    static int drm_usb_register(struct usb_driver *usb)
>    {
> 	if (drm_firmware_drivers_only())
> 		return -ENODEV;
> 	return usb_register_driver(usb);
>    }
>    #define drm_module_usb_driver(__usb)
> 	module_driver(drm_usb_register, usb_deregister)
>    #endif
> 
> In each of the USB-based DRM drivers, replace module_usb_driver with 
> drm_module_usb_driver.
> 
> And then there's PCI [3] and platform drivers, [4] which can be handled 
> similarly. Many PCI drivers open-code the module init and device 

Thanks for the suggestion. I actually thought about this approach as well,
since seems unnecessary to have all that duplicated logic in every driver.

But at the end decided to just do the less intrusive change, because can't
do any testing for most of the drivers.

> registering with the driver-specific enable parameter. Maybe adding a 
> driver-specific register function would make sense.
>

If I understood you correctly, suggested something similar in #dri-devel but
danvet's suggestion [0] was to keep it simple:

16:32 javierm: danvet: yes, I don't think we would be able to do it at this point. I'll add a function pointer
                       param to the check function so drivers can also define their own check besides nomodeset
16:33 danvet: javierm, uh that sounds a bit like overkill? just keep that part of the check in drivers?
16:33 javierm: danvet: Ok. Wanted to get rid of the duplicated code but I'm indeed over engineering this :)

[0]: https://people.freedesktop.org/~cbrill/dri-log/?channel=dri-devel&date=2021-11-02

> Best regards
> Thomas
> 
Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

