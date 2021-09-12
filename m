Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0C4407DAC
	for <lists+dri-devel@lfdr.de>; Sun, 12 Sep 2021 15:37:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDAF56EC7F;
	Sun, 12 Sep 2021 13:37:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 342EB6EC7F
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Sep 2021 13:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631453861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pkJkIkGJtf31tWZZSmYmJsQrjXAcT0aWUD0y9SU2YkI=;
 b=QBJL9gxqOaD6vf98Usa7pnxzbgz0bdWoe/M0wjNjcTnpMhUBjUrQ+oIMayrirXdJKisYxZ
 RF1Bhs1z1FIghMLbFkJckc3h9YaHGwQWzbWbDCLYXG+bl+ndt7FPzgd/uVgVqeaqWVhhzp
 rhurdp+1VFNkC2p2oBdz3LDuhomCLbE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-bVQwuCQnNOKjgGV4r-gT7Q-1; Sun, 12 Sep 2021 09:37:40 -0400
X-MC-Unique: bVQwuCQnNOKjgGV4r-gT7Q-1
Received: by mail-ed1-f70.google.com with SMTP id
 a23-20020aa7cf17000000b003caffcef4beso3489232edy.5
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Sep 2021 06:37:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pkJkIkGJtf31tWZZSmYmJsQrjXAcT0aWUD0y9SU2YkI=;
 b=JkaHySYT+QVk1BqloXRasgW7N2ly6KJGg7ODRDIaGYzYeBfOSeOzhT1hkk4TmR4R8y
 2DSLnc6M0erbgiNIXyoth/oEIjLdSK+LrneZi+XcsbcFJqZcwq03lkv1f1eJCqrIt154
 338MpGZYePOf2+BZWJwwHAgGcfvoXT9uhqgMZvW+W7RKIG42ch8bu2FNCxuM1zQBDHJB
 6hraYkbuwXS5XC6y4dJzmgOMyTbZsYAE8+Ho6ZZCxw4J3W4WHowwVuWAabPYlE8JsvY1
 Z71AlWJq3i2x+RYPvCQvimTyM90Mw6YWZRM/SabGNa7BuQfw3G6nl3M/P4SOSwzUxYEc
 KP4Q==
X-Gm-Message-State: AOAM530gxdsk59mqi+ut+/Weg/2OJjd2gxixwK3tY2bxy0I9EFPkQ9W3
 O0GfZKSaZUjn9E0buLUxoyQpZXhMAWdwQpdGz/vLd8zahDBteOJBACID9nBAKHBLT3a/slL+p+o
 pSeJwY35VX4YsJlBZSFqcTkq54jDGNyWhgZE55vnvFMTTxlVcvJ23xeNoHvbLWX7YGJuwFyu7pn
 vJxr08
X-Received: by 2002:aa7:db82:: with SMTP id u2mr7958072edt.299.1631453859166; 
 Sun, 12 Sep 2021 06:37:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4SRsO7wGdt+naOI4xgmBaf7ztD6XRBdiftBDskZtlx0swQ+AmoPplZn8NB6a5+yJ+Hbp21Q==
X-Received: by 2002:aa7:db82:: with SMTP id u2mr7958058edt.299.1631453858933; 
 Sun, 12 Sep 2021 06:37:38 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id eg14sm2398816edb.64.2021.09.12.06.37.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Sep 2021 06:37:38 -0700 (PDT)
Subject: Re: [PATCH] drm: panel-orientation-quirks: Add quirk for the Chuwi
 HiBook
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
References: <20210905130501.32980-1-hdegoede@redhat.com>
 <YTotMyMq/dfv9Jaa@orome.fritz.box>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <6c355dfe-5926-db49-02fe-0980c93ab3b5@redhat.com>
Date: Sun, 12 Sep 2021 15:37:37 +0200
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
> In any case, I trust that this can be resolved when applying, so this
> seems okay:
> 
> Reviewed-by: Thierry Reding <treding@nvidia.com>

Thank you, I've pushed this to drm-misc-next now.

Regards,

Hans

