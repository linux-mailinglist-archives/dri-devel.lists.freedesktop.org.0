Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB87407D81
	for <lists+dri-devel@lfdr.de>; Sun, 12 Sep 2021 15:13:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AD926EC7E;
	Sun, 12 Sep 2021 13:13:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E59F6EC7E
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Sep 2021 13:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631452387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=doZHLAsyhrDkE7I3M+0fBgPCuQQlUPe+yjEQEnSt8wQ=;
 b=eJQ1RtVyz2uJapurar5LCX87t4QZM9zT4TB4kOpGw6WYgCwaB58k/Q0sDh2re9Nw4RzWUz
 lca5ZvrryqLeU6an+sJyytpTbOsd3nE1TVvgCib7aF2qdhSE/jfx/SWnw+Kn8fe3cmwQku
 z6GnHG3lhQCtF+91LTPcD5A245GNJVI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-Qcys9sy2NWqmlfqnZGLF0A-1; Sun, 12 Sep 2021 09:13:06 -0400
X-MC-Unique: Qcys9sy2NWqmlfqnZGLF0A-1
Received: by mail-ed1-f71.google.com with SMTP id
 r7-20020aa7c147000000b003d1f18329dcso52819edp.13
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Sep 2021 06:13:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=doZHLAsyhrDkE7I3M+0fBgPCuQQlUPe+yjEQEnSt8wQ=;
 b=Q5TSpyC5NDUo12GZANu/ErXOvZ1+KZmVnBkNav0Mo/lwhG3Gk6kdJBsCAIn00as1hW
 iSPQyGHHm8/SQB3EhjYXd6JHmdvUsWh5X60F0tamI4bq+JGGp24Oe8cKbLymNaZdOKVM
 0xdASkMhueYVpjMzkVDURYXpnvFNdcPFk0QlS1M+pL740PhMA+rZIUAxUUBcBBPGicxY
 pYPDQqos3jJRZ3NudiNrq6Ee6FgRrLPuE3VdLGPkjPfdCM8mBJdqeRJGM4QJ1ulHmpQs
 OKv+5zyl2JQ5TY2K1AdU0Q1vb2+TitZn9iie3Rz0UwxB9gRG7FS/LKMvcrJvWT60HoUO
 f+kQ==
X-Gm-Message-State: AOAM5333PijLvE0PxslZid7tbCywD0fQTC/4LKva6uTe/PEKiiBMgE9A
 0tYuMRbQMuZJPbeXf9o3qoO1OsiPRxeOAKFYZYpB2/Iui6rPCzzF1qMkXPWKFuWunQtSO3/vPuZ
 9vxYEi5Ya6rruMibVq7RNOYRT/wpK
X-Received: by 2002:aa7:c806:: with SMTP id a6mr7906285edt.354.1631452384901; 
 Sun, 12 Sep 2021 06:13:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJwDthLHKTXQEhokwBeY5jY9Bb+fxMAcYbC5Bp5NN0y1kML3utl+H3PzfwPhrVILD04MiylQ==
X-Received: by 2002:aa7:c806:: with SMTP id a6mr7906269edt.354.1631452384700; 
 Sun, 12 Sep 2021 06:13:04 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id e7sm2432296edk.3.2021.09.12.06.13.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Sep 2021 06:13:04 -0700 (PDT)
Subject: Re: [PATCH] drm/panel-orientation-quirks: add Valve Steam Deck
To: Sam Ravnborg <sam@ravnborg.org>, Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, Jared Baldridge <jrb@expunge.us>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20210911102430.253986-1-contact@emersion.fr>
 <YTz7gKnpXxIbhPGF@ravnborg.org>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <7b70f7c8-51bf-8e52-4f34-bc0294a918ec@redhat.com>
Date: Sun, 12 Sep 2021 15:13:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YTz7gKnpXxIbhPGF@ravnborg.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
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

On 9/11/21 8:54 PM, Sam Ravnborg wrote:
> Hi Simon,
> On Sat, Sep 11, 2021 at 10:24:40AM +0000, Simon Ser wrote:
>> Valve's Steam Deck has a 800x1280 LCD screen.
>>
>> Signed-off-by: Simon Ser <contact@emersion.fr>
>> Cc: Jared Baldridge <jrb@expunge.us>
>> Cc: Emil Velikov <emil.l.velikov@gmail.com>
>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Cc: Hans de Goede <hdegoede@redhat.com>
> 
> 
> The sorting is off - "Valve Steam Deck" comes before "VIOS LTH17"
> 
> With the sorting fixed:
> 
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> 
> (Not that I know this code, but I wanted to avoid this patch meeting the
> same fate as the patch from Hans that was left with no feedback for a
> long time).

Sam thank you for Ack-ing this, I also notices the ordering
issue and I've fixed this up while applying this.

I'm doing a test-build now and then I will push out the fixed-up
version to drm-misc-next.

Regards,

Hans



 
>> ---
>>  drivers/gpu/drm/drm_panel_orientation_quirks.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
>> index f6bdec7fa925..3018d1dcd271 100644
>> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
>> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
>> @@ -231,6 +231,13 @@ static const struct dmi_system_id orientation_data[] = {
>>  		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "LTH17"),
>>  		},
>>  		.driver_data = (void *)&lcd800x1280_rightside_up,
>> +	}, {	/* Valve Steam Deck */
>> +		.matches = {
>> +		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Valve"),
>> +		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Jupiter"),
>> +		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "1"),
>> +		},
>> +		.driver_data = (void *)&lcd800x1280_rightside_up,
>>  	},
>>  	{}
>>  };
>> -- 
>> 2.33.0
>>
> 

