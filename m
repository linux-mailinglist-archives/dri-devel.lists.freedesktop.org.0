Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E549F2FDC26
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jan 2021 22:58:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42B106E45C;
	Wed, 20 Jan 2021 21:58:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27B0F6E45C
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 21:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611179888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FX4CTWJmUbW10ln5re+WJjz26qwxy6PTsAGwvqXs/Zc=;
 b=E2frQgJ5rBVt86FVHl5bxcsbc428VixzOSDToo1MBPeNSht76meiVY9kg+H3Sy6pztlexo
 551jtescwY0DXyeRu6xQX7r70triuc7+08fnRVRfzmadsHYD3zbTJCfGzrfarvw9rFFs+q
 Jfgq/zPKyLhO+l5G/bmzCo26peBwUtg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-p3jz0k5-P9WxXQnFnB32hw-1; Wed, 20 Jan 2021 16:58:06 -0500
X-MC-Unique: p3jz0k5-P9WxXQnFnB32hw-1
Received: by mail-ed1-f72.google.com with SMTP id f19so34733edq.20
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 13:58:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FX4CTWJmUbW10ln5re+WJjz26qwxy6PTsAGwvqXs/Zc=;
 b=X2iRm3QNihQQh4HT9XAtSBj6OdWiTx2+byS9TpR7ExTQrWGD8zL1HFBmPjwCpf/uYW
 xExouP5u/h/4A04tclBVoWzcj6++kiSlXD8xZ6/eqLNX5TOpsxe9/sL9KsUJY10PL9vN
 VyoVH6wfK4Ksx/633iEPncYjndbb3xTkolfECSIoGI9IY349oTD6pfJl2xSpuB8Bp56Y
 u+Zo/ez/IttXICyNJsg1SU4lilnNJUPpydvwQoAg8FAASwlNBhbwokBgfcOdJRSxUBP3
 WuUQmSC/zeeRr9JvAyk2IFU0gfXOLdQhNsVD9UH2xuBoJegvbv7PJT75ECw4PWn2tO9I
 gL9A==
X-Gm-Message-State: AOAM530U+eH7Slvl2TlXm4jjMECGX3W3ZS7ZdchOY+1g+tlM4kD88I1d
 bcfmWJ5GHhZxO9U+rjO4dIpvqKBBUBC47qBbAhuLi36s1RWUo7TJ4JTL94OQ+jfagFhLGS6xGEw
 fwJbU5N0YMp310CpyD3lgDIpsPLunOq3wj78/9U+O7Zokb1EDvVSYFbHwJxVySxFEtrNsyfhrKi
 77whVe
X-Received: by 2002:a50:ccc3:: with SMTP id b3mr9305521edj.41.1611179885421;
 Wed, 20 Jan 2021 13:58:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxBLdpmMlUSbYcp6903pWIjtTG6Jf+B3Poa9s5mI8MCk6kkoElz+fPNnZNH3FL+FykOIpqQkw==
X-Received: by 2002:a50:ccc3:: with SMTP id b3mr9305504edj.41.1611179885211;
 Wed, 20 Jan 2021 13:58:05 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
 by smtp.gmail.com with ESMTPSA id r11sm1737238edt.58.2021.01.20.13.58.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jan 2021 13:58:04 -0800 (PST)
Subject: Re: [PATCH] drm: Added orientation quirk for OneGX1 Pro
From: Hans de Goede <hdegoede@redhat.com>
To: Jared Baldridge <jrb@expunge.us>
References: <41288ccb-1012-486b-81c1-a24c31850c91@www.fastmail.com>
 <4810e001-9239-5798-c48d-cb59a6802d92@redhat.com>
Message-ID: <5dd93498-65b7-05a7-46ce-fbb05b2f32c6@redhat.com>
Date: Wed, 20 Jan 2021 22:58:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <4810e001-9239-5798-c48d-cb59a6802d92@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 1/20/21 10:18 PM, Hans de Goede wrote:
> Hi,
> 
> On 1/20/21 9:56 PM, Jared Baldridge wrote:
>> The OneGX1 Pro has a fairly unique combination of generic strings,
>> but we additionally match on the BIOS date just to be safe.
>>
>> Signed-off-by: Jared Baldridge <jrb@expunge.us>
> 
> Thanks, patch looks good to me:
> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> 
> I will push this to drm-misc-next right away.

So it looks like your mail client ate all the tabs replacing them
with spaces (using tab stops every 8 chars).

I've manually fixed this up this time.

Next time please use git send-email and do NOT invoke an editor to
change e.g. the subject, instead use the command line options to set
a patch subject prefix.

Regards,

Hans




>> ---
>>  drivers/gpu/drm/drm_panel_orientation_quirks.c | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
>> index 58f5dc2f6dd5..f6bdec7fa925 100644
>> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
>> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
>> @@ -84,6 +84,13 @@ static const struct drm_dmi_panel_orientation_data itworks_tw891 = {
>>         .orientation = DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
>>  };
>>  
>> +static const struct drm_dmi_panel_orientation_data onegx1_pro = {
>> +       .width = 1200,
>> +       .height = 1920,
>> +       .bios_dates = (const char * const []){ "12/17/2020", NULL },
>> +       .orientation = DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
>> +};
>> +
>>  static const struct drm_dmi_panel_orientation_data lcd720x1280_rightside_up = {
>>         .width = 720,
>>         .height = 1280,
>> @@ -211,6 +218,13 @@ static const struct dmi_system_id orientation_data[] = {
>>                   DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad D330-10IGM"),
>>                 },
>>                 .driver_data = (void *)&lcd1200x1920_rightside_up,
>> +       }, {    /* OneGX1 Pro */
>> +               .matches = {
>> +                 DMI_EXACT_MATCH(DMI_SYS_VENDOR, "SYSTEM_MANUFACTURER"),
>> +                 DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "SYSTEM_PRODUCT_NAME"),
>> +                 DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Default string"),
>> +               },
>> +               .driver_data = (void *)&onegx1_pro,
>>         }, {    /* VIOS LTH17 */
>>                 .matches = {
>>                   DMI_EXACT_MATCH(DMI_SYS_VENDOR, "VIOS"),
>>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
