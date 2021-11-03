Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E893044470E
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 18:28:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A73A773CC4;
	Wed,  3 Nov 2021 17:28:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D28773CCA
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Nov 2021 17:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635960499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/3vUfVtNAp+NHc0VZGMqWaMG2ICg6HEbKSf06yppkuM=;
 b=cDmR6QrKUIiNVQZLkADjV2DEu3GPIeSi9rHzBtLVeP9dJtuLB7AadhXoI9247kGrwTdhWx
 Tk0Ir8pFgZCLU9bUQtCGOw0U3EfFIBtnyDqexU+JgfELjFA0mpIj8sYremRlu7bs35HUG1
 KIgTCGxgVCRPxVG58eFsD1L2DHhns6M=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-Hrilf01AP5iR4OX__dta9Q-1; Wed, 03 Nov 2021 13:28:17 -0400
X-MC-Unique: Hrilf01AP5iR4OX__dta9Q-1
Received: by mail-ed1-f70.google.com with SMTP id
 v9-20020a50d849000000b003dcb31eabaaso3191323edj.13
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Nov 2021 10:28:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/3vUfVtNAp+NHc0VZGMqWaMG2ICg6HEbKSf06yppkuM=;
 b=XYsULR8dIM1z5U44b26bLF+50DcOOJi+O9uW4K9z5qk/1Cd2Y1wFvReexAOoctrL26
 vUh/CIppI8IqH5SE/z2IrYxxUKGZOJglFj4etWzr8uF4uzKCLyFbDJ7Tj9y9ueEkKOjI
 85WifUtEB2wOivO8R3W35M/dPqlXACbaNL5GR4T+2HXxcy75DTGEV8jrvxbDB01ygpXl
 ZilP++cBaK7i8Pk0q1mLbP3mG0gxOzy6oBmHTK2S9O7a3ZA/sqGxkBchAlmLbrG10qeH
 XhpJnsrlJke5XAMId/9XAHUvHAfXwA3SxEJpp55iQs9me/9+9pkeIGRl/Dzzt1V96uEo
 3Bog==
X-Gm-Message-State: AOAM533QTyGkFnotC6z5EAVlCP7Z1xUIostD7+lDKubDWRpYyMA3w8DC
 DNQvRQcVnvOeYjMuT93WvIFFpTsghArhsDVBhlIqMnaY/M47tvsTAuqjkHkNpR9DKbOEejCMon2
 9DGMkINrtaDSHs5XuzVqvQgFrPRo9
X-Received: by 2002:aa7:c053:: with SMTP id k19mr60902709edo.293.1635960496654; 
 Wed, 03 Nov 2021 10:28:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNRnaHb5jF+zfe4fkL84C73Vq/hpN9b4BZRfrqQi6jeIgKg0x54vAQgmUcJMDLIby7rEUY9g==
X-Received: by 2002:aa7:c053:: with SMTP id k19mr60902675edo.293.1635960496469; 
 Wed, 03 Nov 2021 10:28:16 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214?
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id bm1sm1464617ejb.38.2021.11.03.10.28.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Nov 2021 10:28:16 -0700 (PDT)
Message-ID: <5d431db5-30dc-b51c-7abb-ab57a3de2f8f@redhat.com>
Date: Wed, 3 Nov 2021 18:28:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 3/3] backlight: lp855x: Add support ACPI enumeration
To: Daniel Thompson <daniel.thompson@linaro.org>
References: <20211102225504.18920-1-hdegoede@redhat.com>
 <20211102225504.18920-3-hdegoede@redhat.com>
 <20211103171756.wxthncse2f4syeiz@maple.lan>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211103171756.wxthncse2f4syeiz@maple.lan>
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
Cc: Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Tsuchiya Yuto <kitakar@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 11/3/21 18:17, Daniel Thompson wrote:
> On Tue, Nov 02, 2021 at 11:55:04PM +0100, Hans de Goede wrote:
>> The Xiaomi Mi Pad 2 tablet uses an ACPI enumerated LP8556 backlight
>> controller for its LCD-panel, with a Xiaomi specific ACPI HID of
>> "XMCC0001", add support for this.
>>
>> Note the new "if (id)" check also fixes a NULL pointer deref when a user
>> tries to manually bind the driver from sysfs.
>>
>> When CONFIG_ACPI is disabled acpi_match_device() will always return NULL,
>> so the lp855x_parse_acpi() call will get optimized away.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

Thank you.

So what is the process for upstreaming backlight patches,
do these go through drm-misc-next (in that case I can push
the series myself), or will you pick these up ?

Regards,

Hans

