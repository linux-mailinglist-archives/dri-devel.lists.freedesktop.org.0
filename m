Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F20C54764E5
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 22:50:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0475510FAE3;
	Wed, 15 Dec 2021 21:50:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25E1410FAE3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 21:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639605045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wGR9lVOCYBcFzYHb4uDLfPBm6adD4t2ujSbcqbcS7Vg=;
 b=Ed5+6tp3ds7P8OvgVWxlqSicxCSiueGSWsnUb2m3WBCDAMOSXVxBkVhsULz3bJGujCVfRm
 k2jUHPx4aAY5GMY9pC+rLgkQWkmsN+Rqswc84TmAti2N1H83ROWiE1FMFTkYO84y3ytTXX
 SZIiXjel78a18j95Yf9Qrh6+4+l0X5U=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-119-U4CERPtpNHyqD0t8ZTC70Q-1; Wed, 15 Dec 2021 16:50:43 -0500
X-MC-Unique: U4CERPtpNHyqD0t8ZTC70Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 f13-20020adfe90d000000b001a15c110077so1429864wrm.8
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 13:50:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wGR9lVOCYBcFzYHb4uDLfPBm6adD4t2ujSbcqbcS7Vg=;
 b=vxGXA3cc5+6h9fyxN+8BIBV21c3rvwXqvV8hzL/ekIXP+sQWWGMCET1QkSIxxUWUcR
 wxv1cSxRFL12XGHsNNwg/FwWgq/0hajPB9hI1HwLq7qWAT/P350NP4Nfm+7smrYori/n
 JFI/l+w73cdI1cTdiSwVyiun81HLQ5PBMwD9LyXBcZD2jSgmQ4ZNMBxkjW2tN9/nbGbr
 GOrE+pVcG02kZvuzugXaTOCDOjvbMkv3tZOEZJWdJAB2dfdqg0Dfu7NR3+CGKAn3YBh4
 asQZ1SrZvWRhsWJ3EJvgvRUQTe6xEUHXkVwfjN3dhLMDk++3D8Ou9NUXr69fqHNOnlex
 J1UA==
X-Gm-Message-State: AOAM532HlCOpd7EMM4H8ZCEwh0bpXqo7TLmTI8TlouLeFOAmrEfKqIf4
 PBkgvPQYbn4ljrhuAYSqCPwLE+QfUoIX4gPeKY2pTBlovKUkTlmlII1X+fx7KiG0buEV36ozN/f
 2gxmKpspafLHgAoZspNmepDoRxX9A
X-Received: by 2002:adf:ee0c:: with SMTP id y12mr6450768wrn.82.1639605041880; 
 Wed, 15 Dec 2021 13:50:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJztn757VovvfR4KWm4Z3CccDgWA1jc8DERSH/B4nyn/TmIpahQdg4Sb1c3A9FuWw9em2KDNzA==
X-Received: by 2002:adf:ee0c:: with SMTP id y12mr6450754wrn.82.1639605041636; 
 Wed, 15 Dec 2021 13:50:41 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id c12sm3557301wrr.108.2021.12.15.13.50.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 13:50:41 -0800 (PST)
Message-ID: <55881b86-6130-7737-b6f8-44e1853e419a@redhat.com>
Date: Wed, 15 Dec 2021 22:50:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 11/60] drm/gud: Add support for the nomodeset kernel
 parameter
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20211215010008.2545520-1-javierm@redhat.com>
 <20211215010008.2545520-12-javierm@redhat.com>
 <5b1d9578-1f74-a808-c4d4-6e8c38dd57fc@tronnes.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <5b1d9578-1f74-a808-c4d4-6e8c38dd57fc@tronnes.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hello Noralf,

On 12/15/21 22:37, Noralf Trønnes wrote:
> 
> 
> Den 15.12.2021 01.59, skrev Javier Martinez Canillas:
>> According to disable Documentation/admin-guide/kernel-parameters.txt, this
>> parameter can be used to disable kernel modesetting.
>>
>> DRM drivers will not perform display-mode changes or accelerated rendering
>> and only the systewm system framebuffer will be available if it was set-up.
>>
>> But only a few DRM drivers currently check for nomodeset, make this driver
>> to also support the command line parameter.
>>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>> ---
>>
> 
> I don't understand why this is applicable to USB drivers, there's no way
> the firmware can setup a framebuffer and continue pushing pixels over
> USB when Linux has been given control over the USB bus?
> 
> The same argument goes for the SPI drivers in drm/tiny/ as well.
> 

That's a very good point. I included these mostly for consistency but if it's
OK for the KMS drivers to just ignore the "nomodeset" parameter, I could drop
all that are not for devices in the PCI or platform buses.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

