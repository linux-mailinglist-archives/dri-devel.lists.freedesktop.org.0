Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D68120363
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 12:11:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF5AB6E4C7;
	Mon, 16 Dec 2019 11:11:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE7216E4C7
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 11:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576494701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WjOUTFpOi6Gu4d+B9mMstxxsH+1mt4QNI2pngEePaBo=;
 b=Z/zust6S3TdNEDOhy89GYUxHOVSaaUNyfQHSGMS37F/wp8/Kb/gvXArtaNZ0brHVygklJe
 eeotQhYBpzjyBpHbZLCKu/0jiHGizobH73rIvuSyw59PzNJ6HSazHe8kPSuZMbtoDIeZvV
 LFanfRrMjErn1/NRebLcOMU8iO8zmfk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-9wLPbi2LMwyCwbTyHH5A7w-1; Mon, 16 Dec 2019 06:11:34 -0500
Received: by mail-wr1-f71.google.com with SMTP id 90so3548015wrq.6
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 03:11:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WjOUTFpOi6Gu4d+B9mMstxxsH+1mt4QNI2pngEePaBo=;
 b=pToWBCuTbckLM9QtVIlMdeRBkcchBBm7bSVhCqb7DfpBlhZEt2acjVPYLUWInRFsIo
 5OnHSMtqcAzVO9DsSHISdDgeOM1Z8dh2VQTvvSVjJF7oxo5JSn0qPeVSR77U3QHmJDkk
 gejLm2mXaKH0At3zPsrUotzWJrsLIOhFYhPj/zWnZnBNoYKO0HU40R4DjvH974OJQrca
 OFP96gmUqjV3YXTL+32X8UTDRKEDaiqVahgLkapskSctI7FPUmD2pNYlkQgPDKODnFUX
 jlcLaxj3Qz+pBHXdOd5GGTfc8aGd/0oNDkuIy62oBbEVwdi5sapYqqJ65uvUT8w66098
 e6dA==
X-Gm-Message-State: APjAAAUgbHtoHerCJ7hLbdfztQrVrcpgHdeichZu8YkMlCn6te56KWYC
 0ilJlSTWyiceoemPve06XjiwUa0Z6FY9FaixBb9fPXAzmE09Xa54yQgADUPUrgdiw1ZNGujNfQ6
 zG5WDO/vCMntHpyTCNnxyQow7R4u4
X-Received: by 2002:a1c:7dc4:: with SMTP id
 y187mr28955312wmc.161.1576494693450; 
 Mon, 16 Dec 2019 03:11:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqz95JVS+9hzCpx2tUeBC+2E8wF70N/Kg5EXyntvwnCxuCB6OinaKV46tDHhavo+POTw6isKJw==
X-Received: by 2002:a1c:7dc4:: with SMTP id
 y187mr28955289wmc.161.1576494693250; 
 Mon, 16 Dec 2019 03:11:33 -0800 (PST)
Received: from shalem.localdomain
 (2001-1c00-0c0c-fe00-7e79-4dac-39d0-9c14.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:7e79:4dac:39d0:9c14])
 by smtp.gmail.com with ESMTPSA id x18sm20950368wrr.75.2019.12.16.03.11.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2019 03:11:32 -0800 (PST)
Subject: Re: [PATCH 0/5] drm/i915/dsi: Control panel and backlight enable
 GPIOs from VBT
To: Linus Walleij <linus.walleij@linaro.org>
References: <20191215163810.52356-1-hdegoede@redhat.com>
 <CACRpkdarJ5chDfgc5F=ntzG1pw7kchtzp0Upp+OH9CH6WLnvXw@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <1474a983-3e22-d59b-255a-edd3a41f0967@redhat.com>
Date: Mon, 16 Dec 2019 12:11:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CACRpkdarJ5chDfgc5F=ntzG1pw7kchtzp0Upp+OH9CH6WLnvXw@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: 9wLPbi2LMwyCwbTyHH5A7w-1
X-Mimecast-Spam-Score: 0
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Lee Jones <lee.jones@linaro.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 16-12-2019 11:26, Linus Walleij wrote:
> On Sun, Dec 15, 2019 at 5:38 PM Hans de Goede <hdegoede@redhat.com> wrote:
> 
>> Linus, this series starts with the already discussed pinctrl change to
>> export the function to unregister a pinctrl-map. We can either merge this
>> through drm-intel, or you could pick it up and then provide an immutable
>> branch with it for merging into drm-intel-next. Which option do you prefer?
> 
> I have created an immutable branch with these changes and pulled it
> to my "devel" branch for v5.6:
> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=ib-pinctrl-unreg-mappings

Ugh, taking one last look at the "pinctrl: Export pinctrl_unregister_mappings"
patch it is no good, sorry.

I just realized that if the mapping has been dupped, the if (maps_node->maps == map)
check will never be true, because maps_node->maps is the return value from kmemdup
and map is the map originally passed in while registering.

Linus, can you please drop this from your -next ?

So I see 2 options:
1) Add an orig_map member to maps_node and use that in the comparison,
this is IMHO somewhat ugly

2) Add a new pinctrl_register_mappings_no_dup helper and document in
pinctrl_unregister_mappings kdoc that it can only be used together
with the no_dup variant.

I believe that 2 is by far the best option. Linus do you agree or
do you have any other suggestions?

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
