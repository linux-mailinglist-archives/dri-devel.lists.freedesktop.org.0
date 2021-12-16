Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 497BA4766F3
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 01:38:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E7BF10E4A0;
	Thu, 16 Dec 2021 00:38:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA5F010E4A0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 00:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639615125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A1YMOdn1C6MZPJahwV7t8pHFMry4Mv4FHAgGI/HFscM=;
 b=duC7JOwvyWDD0Psv7Fy1GOPmjAk8Pqn1u5bvJOr6Vxv9TqVLbkQtXNMHxo2m/JyyAWE4aX
 KV4QNh/UyQU/1+ql9cUYXohmSjkL2L0iVw4LB2bt2kbDls6BRgdzZdr7XXHBHHqiDfEZKH
 +fZHqP2JbWlVl1UG8QKfyjImsws5MUM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-489-PR76BaedM_OhzAFkbj7fDQ-1; Wed, 15 Dec 2021 19:38:44 -0500
X-MC-Unique: PR76BaedM_OhzAFkbj7fDQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 p17-20020adff211000000b0017b902a7701so6353563wro.19
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 16:38:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=A1YMOdn1C6MZPJahwV7t8pHFMry4Mv4FHAgGI/HFscM=;
 b=32YnQv3WF8zdH3nu7+YpeRBYNjJwFCVolZ1f9NZnUbNTAAjw89WfoyUUO60Gj0EvZX
 0Cl7tZ81mbQReIBpVyxiPO8FdzvJBi++NLiaU0QzSb0QBZohbctyL4HDPHyt3WC4tXpK
 kcHzYxb1CMMbjzHVoiEtZtnEsdVckA66Ue4VfhRPrrxtDU9HEA2dj4xkc0DWN634mIjj
 PkPS0xDPrDqoHoHLmsVvVTQnjTZrS4mFGkYZTm4aU2uzmuYuiXwU9sTPliJu/bQ/oCMI
 eydwbfityYQjNdmXLDtKf0olI0a3TypY4VQkvAQIrDm/EMBNfZB9bPRej8kfzwClW5cn
 ml7g==
X-Gm-Message-State: AOAM531ZqJ6aDiZSSPPou+z98r/F/WLKyxOzRCZ/S94dYX63kVk8pUWs
 2owsWig48rlzR5lBd9hC+/2GqAW/m6QSqM7dJJ5omgqgCjVw7cRTDgGUW7dXQeaQmf53csnOjQ5
 HZ4CEHYPEBQCCN+u9J2aGaw/jojCh
X-Received: by 2002:a05:600c:2dc1:: with SMTP id
 e1mr2571348wmh.170.1639615123079; 
 Wed, 15 Dec 2021 16:38:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyVEcx+ygTN18OiwOcRwaHX/vCxS1ywQrqGl2wbTZaQv+hJ4/etV0jJmZID1eJfR6DK11ZEWg==
X-Received: by 2002:a05:600c:2dc1:: with SMTP id
 e1mr2571294wmh.170.1639615122784; 
 Wed, 15 Dec 2021 16:38:42 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id y11sm4270129wry.70.2021.12.15.16.38.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 16:38:42 -0800 (PST)
Message-ID: <98702737-2104-6139-8bd3-2e926260263b@redhat.com>
Date: Thu, 16 Dec 2021 01:38:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 00/60] drm: Make all drivers to honour the nomodeset
 parameter
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20211215010008.2545520-1-javierm@redhat.com>
 <Ybp7qDs1p3x5GzNJ@pendragon.ideasonboard.com>
 <91c6b455-62cd-cec7-8445-e93c99230a03@redhat.com>
 <YbqHQAFtwvTvYddZ@pendragon.ideasonboard.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YbqHQAFtwvTvYddZ@pendragon.ideasonboard.com>
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

On 12/16/21 01:24, Laurent Pinchart wrote:
> Hi Javier,
> 
> On Thu, Dec 16, 2021 at 01:13:56AM +0100, Javier Martinez Canillas wrote:
>> Hello Laurent,
>>
>> On 12/16/21 00:35, Laurent Pinchart wrote:
>>
>> [snip]
>>
>>>>
>>>> I've built tested with 'make allmodconfig && make M=drivers/gpu/drm/', but
>>>> only booted in a few devices with and without nomodeset in the cmdline. So
>>>> testing and reviewing for all the drivers would be highly appreciated.
>>>
>>> The fact that the series is so big makes me think it would be better to
>>> handle this in the DRM core. Is there any way we could do so ? Otherwise
>>> we'll chase this issue forever in new drivers, and will be plagued with
>>> cargo cult problems.
>>>
>>
>> Yes, what Thomas suggested is to add a set of drm_module_{pci,platform}_driver()
>> macros in include/drm/drm_drv.h, that will just check whether the driver should
>> be registered or not and call the {pci,platform}_register_driver() functions.
>>
>> That way the change in the drivers would just be something like the following:
>>
>> -module_platform_driver(malidp_platform_driver);
>> +drm_module_platform_driver(malidp_platform_driver);
>>
>> There are some drivers that still need a custom module init functions for various
>> reasons (e.g: register a set of devices/drivers, need to be a late init call, etc)
>> but at least for most drivers this should be handled transparently as long as they
>> use these drm_*_register_driver() macros.
> 
> Another option could be to return an error from drm_dev_alloc(). That
> may avoid changes in the drivers.
>

That was actually the first approach I proposed but was told that it wouldn't work
for two reasons:

1) Usually that's called in the driver's probe function and the goal was to make it
   fail as early as possible if nomodeset is present, so that means it is desirable
   for this to be in the module init function (and is how most drivers implement).

2) Not all KMS drivers should fail if nomodeset is used. For example the simpledrm
   driver still needs to be registered and probed since is what users would want
   as a fallback / troubleshooting option if their native driver doesn't work.
 
Solving (2) is easy since we could just add a new .driver_features flag to indicate
that the driver should not fail if nomodeset is present. That way only the drivers
that are the exception would need to be modified.

But (1) is more tricky since this may be  DRM driver maintainers preference.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

