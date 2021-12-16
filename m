Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A334766DA
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 01:14:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E302E10E279;
	Thu, 16 Dec 2021 00:14:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDE4210E279
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 00:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639613642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7W3D6aipQ7MmiTWUNGcz4ziDpKJUEwSYTscXbSv+wq0=;
 b=DD04rvZe7U3wHykwQqa2P8NWhzX5WajhVcarMhDlLh8QiJigwc5RKGiwZEljSBYdzEmBfh
 JhexM94FQEXPIiRzJwfdL3bWGCB8QBbZiFapPNzHwJvAsny9M4Cqp1BtgZ1gdBO5sbqdMY
 cZsdr/WAZh/SRhE9hS360UjRa8pazs0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-227-sy-OaWcmP1um1vxELmK9uQ-1; Wed, 15 Dec 2021 19:14:01 -0500
X-MC-Unique: sy-OaWcmP1um1vxELmK9uQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 v18-20020a5d5912000000b001815910d2c0so6344321wrd.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 16:14:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7W3D6aipQ7MmiTWUNGcz4ziDpKJUEwSYTscXbSv+wq0=;
 b=DhA4UuoBNVHUCXQebuyCIZAzRMKOi13QKuvAm/g4VHdfaUk9/YQQg8WGvIfeFn/i5x
 Bgi5qoLfiZxyauqcrwm9hn9/chqreEO1ryRXKa4f+7Uu+MlERO5d9EMjl59oZCXouBov
 6t/7+GqZNhZ7hwYUl7spE6obPS2PF0MyzJXCfR8kk5WINRbrlGZB15tabcBVZBi1F+LY
 PRRcwEsb2X+lHiDXNT80CZoKTeUJna1upwERBdChOW+FvX5wOulQKejCNISVikYH8Kyl
 mLzNFy6/DRmIg7TLkUvD/OLXnigBFd/H2hysUoG0C4NTHcBVhQHe91a5l+if7dkq8gFe
 L9KA==
X-Gm-Message-State: AOAM532SMXf7HEWvgNb/6mK4AF1ne625cGhp0v/tdHELmxcoLq6OJwQf
 eIRDz5sISHXiPJHsQPXaXA2HjeAL9OeFI3B2B3xd9qSY0ISFxDfgHyi9TLbqee4/hc3ALJRqVdX
 ogwox84FZwT4G+WlbQhSI9e/rtOql
X-Received: by 2002:a5d:6988:: with SMTP id g8mr1098773wru.280.1639613640358; 
 Wed, 15 Dec 2021 16:14:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwtFiQlo1OWJszH9sLjS9VrT9U/5Ah9t5B3NSP9Pp5WGOewg/23R8Cbq/5aTDTBp3WEMBppdA==
X-Received: by 2002:a5d:6988:: with SMTP id g8mr1098754wru.280.1639613640157; 
 Wed, 15 Dec 2021 16:14:00 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id b10sm3464915wrg.19.2021.12.15.16.13.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 16:13:59 -0800 (PST)
Message-ID: <91c6b455-62cd-cec7-8445-e93c99230a03@redhat.com>
Date: Thu, 16 Dec 2021 01:13:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 00/60] drm: Make all drivers to honour the nomodeset
 parameter
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20211215010008.2545520-1-javierm@redhat.com>
 <Ybp7qDs1p3x5GzNJ@pendragon.ideasonboard.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <Ybp7qDs1p3x5GzNJ@pendragon.ideasonboard.com>
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
 dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>,
 Paul Cercueil <paul@crapouillou.net>, Tomi Valkeinen <tomba@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
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
 Thomas Zimmermann <tzimmermann@suse.de>,
 Yannick Fertre <yannick.fertre@foss.st.com>, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Philippe Cornu <philippe.cornu@foss.st.com>, Tian Tao <tiantao6@hisilicon.com>,
 Jyri Sarha <jyri.sarha@iki.fi>, Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Laurent,

On 12/16/21 00:35, Laurent Pinchart wrote:

[snip]

>>
>> I've built tested with 'make allmodconfig && make M=drivers/gpu/drm/', but
>> only booted in a few devices with and without nomodeset in the cmdline. So
>> testing and reviewing for all the drivers would be highly appreciated.
> 
> The fact that the series is so big makes me think it would be better to
> handle this in the DRM core. Is there any way we could do so ? Otherwise
> we'll chase this issue forever in new drivers, and will be plagued with
> cargo cult problems.
> 

Yes, what Thomas suggested is to add a set of drm_module_{pci,platform}_driver()
macros in include/drm/drm_drv.h, that will just check whether the driver should
be registered or not and call the {pci,platform}_register_driver() functions.

That way the change in the drivers would just be something like the following:

-module_platform_driver(malidp_platform_driver);
+drm_module_platform_driver(malidp_platform_driver);

There are some drivers that still need a custom module init functions for various
reasons (e.g: register a set of devices/drivers, need to be a late init call, etc)
but at least for most drivers this should be handled transparently as long as they
use these drm_*_register_driver() macros.

So just ignore this series and I'll post a v2 soon.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

