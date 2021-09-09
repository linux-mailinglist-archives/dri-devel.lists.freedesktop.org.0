Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 259D0405ADB
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 18:25:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7DC76E8B4;
	Thu,  9 Sep 2021 16:25:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E30466E8B6
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 16:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631204728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E6wKHp/FDfbgujJsPNYIBFn/TpNOL6dUqYymlvkFijk=;
 b=RqxFcO0H2jUFW+b1vSzCC3UCfJ1Fay8PxHeu7K+I7vCciKWf8awh8rRokqBhtpEM+n80qn
 5AIbq2XrimhW826Cc4+F6yVz3opCpGefi0lEEG5KpczAYd95CmC6nOXK3avxDu8++detLc
 SugMGq+hQ8QD3o552OVmlBH04hS7I5E=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-oueFynaQOoORAem0lr2awg-1; Thu, 09 Sep 2021 12:25:26 -0400
X-MC-Unique: oueFynaQOoORAem0lr2awg-1
Received: by mail-ej1-f69.google.com with SMTP id
 s11-20020a170906060b00b005be824f15daso1092780ejb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Sep 2021 09:25:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=E6wKHp/FDfbgujJsPNYIBFn/TpNOL6dUqYymlvkFijk=;
 b=FrDxf8g71p/16Av7U6B7uMDTO8t5kga8mpNowNOTvyQ39io4cZnfH9U0x3NO1qQmkZ
 YDDke3kzZxowzw/HMKH0FBB4pxRD+q5sQNX+ytQscYHZU8Af3ciICSQJCkuxDGB0R7bp
 SYSd+ImjBwMfVALHfaiE78INNsd6GjgJ8Se2NSsa1GO3ZCaNP3+lN4l8MU83yuhT1HSM
 a5VfkGLJSg6RUkMTRjugizucbu6CTAOVs5DFyIaZaKeVB5UlbkkZ2UWdpgRvoN3O3TBJ
 MJ28IpvG9EbVLuCwd2XxYWuQDlTssv/j/6FtUi7JJm2d4csYJPM6GgYbVNQS7cINYHeb
 DKJg==
X-Gm-Message-State: AOAM533B/pmDjK0O/2Y1UTyN0uY5KtVGVHkCL7IgWjgVcnURGxTFH689
 GIlXiBXxeRxxW2vZpaCh9F4JQCFPUIB/jR4enxIawrDmPx2y5YGuvme1R51WP7QNa2l4olwV2lo
 zbzCcai/EMRuEQL7waF2b+lvRMFp+GwBxIWV2s71wANXxwYLqRVYW0ocrPJBRNRoR97GeKRo3dD
 NNTDKY
X-Received: by 2002:a17:906:a18f:: with SMTP id
 s15mr4439486ejy.269.1631204724811; 
 Thu, 09 Sep 2021 09:25:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwz3Re9hnijniqt1mgPhUiBLgiPx2Lh0Kgm+7PJ8IvDE4yZcIhVw4iDq6EgedhiZ76lxiuTJA==
X-Received: by 2002:a17:906:a18f:: with SMTP id
 s15mr4439450ejy.269.1631204724565; 
 Thu, 09 Sep 2021 09:25:24 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id t12sm1152445ejc.63.2021.09.09.09.25.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Sep 2021 09:25:24 -0700 (PDT)
Subject: Re: [PATCH] drm: panel-orientation-quirks: Add quirk for the Chuwi
 HiBook
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
References: <20210905130501.32980-1-hdegoede@redhat.com>
 <YTotMyMq/dfv9Jaa@orome.fritz.box>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <27988e73-fca9-48e3-35d6-9b3dd395536a@redhat.com>
Date: Thu, 9 Sep 2021 18:25:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YTotMyMq/dfv9Jaa@orome.fritz.box>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 9/9/21 5:50 PM, Thierry Reding wrote:
> On Sun, Sep 05, 2021 at 03:05:01PM +0200, Hans de Goede wrote:
>> The Chuwi HiBook uses a panel which has been mounted
>> 90 degrees rotated. Add a quirk for this.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/gpu/drm/drm_panel_orientation_quirks.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
> 
> I'm not very familiar with these quirks, but this looks correct and
> inline with other entries in this table.
> 
>> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
>> index 4e965b0f5502..7e0f581a360e 100644
>> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
>> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
>> @@ -140,6 +140,14 @@ static const struct dmi_system_id orientation_data[] = {
>>  		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "T103HAF"),
>>  		},
>>  		.driver_data = (void *)&lcd800x1280_rightside_up,
>> +	}, {	/* Chuwi HiBook (CWI514) */
>> +		.matches = {
>> +			DMI_MATCH(DMI_BOARD_VENDOR, "Hampoo"),
>> +			DMI_MATCH(DMI_BOARD_NAME, "Cherry Trail CR"),
>> +			/* Above matches are too generic, add bios-date match */
>> +			DMI_MATCH(DMI_BIOS_DATE, "05/07/2016"),
>> +		},
>> +		.driver_data = (void *)&lcd1200x1920_rightside_up,
>>  	}, {	/* Chuwi Hi10 Pro (CWI529) */
>>  		.matches = {
>>  		  DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "Hampoo"),
> 
> One thing I noticed is that there doesn't seem to be an entry for Chuwi
> Hi10 anywhere in linux-next. Perhaps that's from a different patch in
> your local tree, or it's based on some other tree that already has that.

It is based on drm-misc-next, which has a recent patch adding the Hi 10 Pro:

https://cgit.freedesktop.org/drm-misc/commit/?id=072e70d52372c44df90b44fb4cd949a709bb5bef

I guess this is not in linux-next yet because of the merge-window.

> In any case, I trust that this can be resolved when applying, so this
> seems okay:
> 
> Reviewed-by: Thierry Reding <treding@nvidia.com>

Thank you.

Regards,

Hans

