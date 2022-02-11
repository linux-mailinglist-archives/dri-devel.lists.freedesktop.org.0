Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C49A74B2079
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 09:46:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D1E010EA24;
	Fri, 11 Feb 2022 08:46:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B84B710EA24
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 08:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644569162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NIGJSGdDR+e/0lqDusmjI7J0UIItqFB5EseqZJ+/itg=;
 b=iG/QeERaNs9Sr0kOvajlHT4Cdcd87A8jmtccJKoGpzlUC8YlJl1S6LZ65rtjXW6JmdFPwv
 V/mmnpQlokDkZyGws5CNluJthiekVZuFrzMDpCy13ySHDwMt3prKEav2J3dzvtNgxldHvu
 j2kZpMreGqFzfX5ErhqMoD/an4vY1Cw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-sDg08VwzNBqNFEHm7lDo7Q-1; Fri, 11 Feb 2022 03:46:00 -0500
X-MC-Unique: sDg08VwzNBqNFEHm7lDo7Q-1
Received: by mail-ed1-f70.google.com with SMTP id
 w3-20020a50c443000000b0040696821132so4911842edf.22
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 00:46:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NIGJSGdDR+e/0lqDusmjI7J0UIItqFB5EseqZJ+/itg=;
 b=6Q8mdJz7yXTjvGwMI3HlAxRsJtWIQodwDvIMRYta9sJqwH6K8SJ+2eksQS5Ij/JTtg
 YIDUxeTR7aC1h1ZvgDw4UD86PD2Ec1pkxQRifw5T9lMmVuAaQL/cBCyl06J6sXgBCGit
 aREORk1sLUrKxb4uiAGiW7p6Za+ChqnYK4qJLsR9QWFwokzMMbcQJmTJXkCJ4sw/5NrG
 wwpK+LvwLdYCmzVirC5gr66C3WsdcKSTa2tijtDAv9ru1Q63W4XI2jlGcWb5rDAiUd0g
 FvX3s+K4OJdaSkLSGZBxR3H6zcY3SgNBIhQWTmJ2QFz0U06rzsxdl367nCb60hnFm5/d
 EzMg==
X-Gm-Message-State: AOAM530Vn72AF4wNNdKLMbjvCNbBRmmXwZBPaeU1f1eEYasozLrGy/8S
 Y1M1A/nyAi4hNIbCr1OVzfnk92K3QN2sf4RuXMS8X2odh2JU1Gzo30m7gL7f04+u684Npvppv8k
 oY0Bi/4jw56cZAm3l0GPj4GCiyG3P
X-Received: by 2002:a17:907:168a:: with SMTP id
 hc10mr466716ejc.283.1644569159083; 
 Fri, 11 Feb 2022 00:45:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwQtGaHy5U9JGMvxdUhyHS51vk9smJiabHDR4QMkXJw//KX0Gh6ttUq7C+QmDdzvWmB7pzNDQ==
X-Received: by 2002:a17:907:168a:: with SMTP id
 hc10mr466695ejc.283.1644569158862; 
 Fri, 11 Feb 2022 00:45:58 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1?
 (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
 by smtp.gmail.com with ESMTPSA id v5sm10859303edb.15.2022.02.11.00.45.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Feb 2022 00:45:58 -0800 (PST)
Message-ID: <d8c31b9a-49fd-e10b-34ef-751fe1262513@redhat.com>
Date: Fri, 11 Feb 2022 09:45:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 8/9] platform/x86: amd-gmux: drop the use of
 `pci_is_thunderbolt_attached`
To: Mario Limonciello <mario.limonciello@amd.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Andreas Noever <andreas.noever@gmail.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>,
 "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>
References: <20220210224329.2793-1-mario.limonciello@amd.com>
 <20220210224329.2793-9-mario.limonciello@amd.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220210224329.2793-9-mario.limonciello@amd.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
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
Cc: Michael Jamet <michael.jamet@intel.com>,
 Yehezkel Bernat <YehezkelShB@gmail.com>, Alexander.Deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2/10/22 23:43, Mario Limonciello wrote:
> Currently `pci_is_thunderbolt_attached` is used to indicate a device
> is connected externally.
> 
> The PCI core now marks such devices as removable and downstream drivers
> can use this instead.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Thanks, this looks good to me. I assume that this whole series
will be merged in one go through another tree (e.g. the PCI tree),
so here is my ack for merging this patch through another tree:

Acked-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

> ---
>  drivers/platform/x86/apple-gmux.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
> index 04232fbc7d56..ffac15b9befd 100644
> --- a/drivers/platform/x86/apple-gmux.c
> +++ b/drivers/platform/x86/apple-gmux.c
> @@ -596,7 +596,7 @@ static int gmux_resume(struct device *dev)
>  
>  static int is_thunderbolt(struct device *dev, void *data)
>  {
> -	return pci_is_thunderbolt_attached(to_pci_dev(dev));
> +	return dev_is_removable(dev);
>  }
>  
>  static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
> 

