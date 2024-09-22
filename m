Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F34DA97E108
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2024 13:12:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D972310E066;
	Sun, 22 Sep 2024 11:11:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="TBxR202s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E16510E066
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 11:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1727003517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g3ZBnZpol239OQHpIN/pJOeGZb3vp6k4LhbA2BN3D44=;
 b=TBxR202sDrFDDh/kXjcytoL4vYWVQtoGPER72gOQHIs23cfUJt2xDmaX4ED+tjPMG1BDLU
 1e/csAXFLGwQoxkzAht/1vL5kYkz8DhdqdCdITyFjPj/D1px1P9UvitUGUCv4lpxsHE5G8
 XQYA0IAqmNZwj1lRF8eQ8BppH6GwKLE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-423-Z_QNDP-DP2mTOXd951_jug-1; Sun, 22 Sep 2024 07:11:52 -0400
X-MC-Unique: Z_QNDP-DP2mTOXd951_jug-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-5c250f3b18aso2629994a12.2
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 04:11:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727003512; x=1727608312;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g3ZBnZpol239OQHpIN/pJOeGZb3vp6k4LhbA2BN3D44=;
 b=ZmSGevIbMqqtx9gpR3ugfUx1XdenyUoq11heM7h4HgBa1Aq1zxrcI9F8WUiGG4lz7+
 p23vRlanNmeniI3/Vf8a7EBZ7XBsoUKlrOuk1pHjaeCn4S/Xm/R+psRMWMuKM96hqdLI
 roLNWzphb8hI7dK+6/CMAZN4d+MiJTCPdJlipwlIG1ZOGZ6dYaSqGXfgGpkT+ugR6awE
 Z6h20xdwAgaaq7tS0g9oRJRVi0YGFCoGrDCzE5qwcqIFviJTxE/je/jWKOby1ikhfGxK
 KlqqLE5CwKNvFpVhjTmeM5UkY/7nIvDwN6YuBOWFZAuezpIDbdW7YzuWg608bIk7zv5t
 1RSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOgdtQOGsQO8hhf3jS/OUM0FRVNhUXS7ExJ4tw7+QlDV6jTeqTP0P0EKjHHI6DMyEv4aTLrB1n75o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxoF/jqzcULvQ4hTt9Kc9b/zGm/EqzmtUL+vZsYmlZmCHGd0jwD
 ImuxLgvNutWeYix4radJq5KFdnYZ1Ch97Uv+We0WXzBG/grv3zQaUV1+6KF53hG7JeH9Yv9KtH3
 dmQXuJ4s1N7svYJXxCz3RPEuoMaGJP8jqOpon3qY6ODqHvNFCWBYVVP11JF4iFKpsEg==
X-Received: by 2002:a05:6402:3483:b0:5b9:df62:15cd with SMTP id
 4fb4d7f45d1cf-5c464a7cb46mr6531227a12.32.1727003511755; 
 Sun, 22 Sep 2024 04:11:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5M48FaOWEpZJt4RV/5sAmb77W7F27nxy3AkRbG2aRvqpsuzvbNrDF+cJStQAyjxOd/XY6uA==
X-Received: by 2002:a05:6402:3483:b0:5b9:df62:15cd with SMTP id
 4fb4d7f45d1cf-5c464a7cb46mr6531202a12.32.1727003511353; 
 Sun, 22 Sep 2024 04:11:51 -0700 (PDT)
Received: from [10.101.3.85] (ip-185-104-138-99.ptr.icomera.net.
 [185.104.138.99]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c42bb94a01sm9020655a12.91.2024.09.22.04.11.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Sep 2024 04:11:50 -0700 (PDT)
Message-ID: <a90d08d5-265a-4ba2-99f9-68fa18960b27@redhat.com>
Date: Sun, 22 Sep 2024 13:11:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm: panel-orientation-quirks: Add quirk for AYA NEO
 2 model
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 tjakobi@math.uni-bielefeld.de
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>,
 Denis Benato <benato.denis96@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <cover.1726492131.git.tjakobi@math.uni-bielefeld.de>
 <2b35545b77a9fd8c9699b751ca282226dcecb1dd.1726492131.git.tjakobi@math.uni-bielefeld.de>
 <gnllphvuffajfbh3aczda5z7t3ytjexf5a6wuuzsz6pla6e2kz@m564uc2ogn4q>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <gnllphvuffajfbh3aczda5z7t3ytjexf5a6wuuzsz6pla6e2kz@m564uc2ogn4q>
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

Hi,

On 21-Sep-24 10:02 PM, Dmitry Baryshkov wrote:
> On Mon, Sep 16, 2024 at 03:18:51PM GMT, tjakobi@math.uni-bielefeld.de wrote:
>> From: Joaquín Ignacio Aramendía <samsagax@gmail.com>
>>
>> Add quirk orientation for AYA NEO 2. The name appears without spaces in
>> DMI strings. That made it difficult to reuse the 2021 match. Also the
>> display is larger in resolution.
>>
>> Tested by the JELOS team that has been patching their own kernel for a
>> while now and confirmed by users in the AYA NEO and ChimeraOS discord
>> servers.
>>
>> Signed-off-by: Joaquín Ignacio Aramendía <samsagax@gmail.com>
>> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
>> ---
>>  drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
>> index 2166208a961d..3044927c0c5c 100644
>> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
>> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
>> @@ -184,6 +184,12 @@ static const struct dmi_system_id orientation_data[] = {
>>  		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "T103HAF"),
>>  		},
>>  		.driver_data = (void *)&lcd800x1280_rightside_up,
>> +	}, {	/* AYA NEO AYANEO 2 */
>> +		.matches = {
>> +		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AYANEO"),
>> +		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "AYANEO 2"),
>> +		},
>> +		.driver_data = (void *)&lcd1200x1920_rightside_up,
> 
> I thought that AYANEO should come after AYADEVICE, but the array doesn't
> seem really sorted

It is sorted but it is sorted by the Vendor - Model in the comments,
not by the DMI strings since sometimes those are e.g. "SYS_VENDOR",
"Default String" and stuff like that.

The entire series looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

for the series.

> Thus:
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> If I hear no objections and if noone beats me, I'll apply the series
> within few days.

I'm currently travelling so if you can apply this series
to drm-misc-fixes that would be great.

Regards,

Hans


> 
> 
>>  	}, {	/* AYA NEO 2021 */
>>  		.matches = {
>>  		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AYADEVICE"),
>> -- 
>> 2.44.2
>>
> 

