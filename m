Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E71B25C182
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 15:09:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9234A6E9EE;
	Thu,  3 Sep 2020 13:09:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C8C16E9EF
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 13:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599138584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oOKwAmzdX19wFLaLs6FnpWqrSpxl3eshTWS+wqlIdDI=;
 b=JARYBLiDsGJmJXe7uX/fXc1UNIMY69m75Jub1om9r7DY0I6yPbohVO0g4Qq89gmYrPRbMK
 1g8bdGFSoU7n/jJfg/JDsuoxQY6yAzXP6TI4Q+K2lLmzrTyPwjJ+lvyDyigrnhfdYG+huz
 snQbmxqpMtiEFDEQRYLvDkEF4NB7+N8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-wNUkquDpNx63xazPFUHCIQ-1; Thu, 03 Sep 2020 09:09:42 -0400
X-MC-Unique: wNUkquDpNx63xazPFUHCIQ-1
Received: by mail-ej1-f72.google.com with SMTP id jz22so1206808ejb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Sep 2020 06:09:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oOKwAmzdX19wFLaLs6FnpWqrSpxl3eshTWS+wqlIdDI=;
 b=MpmuSWETnm7mptveN7jZc7GYCDMWWxQUFK7xEPRGFHPa3THgAF57FCeMLKs6Lr6axZ
 bbhpILS6/xCdCFJE2OrMjihWP5PrMeXFgcpTsPKbwE6+LrxD775qmBAB9TWLJc+RzXC+
 N5uSgYF7EDTia3/DvDnNixSXnsxAc8SSmpc+OBa5mUatbHVjnXyo1Ab4QwfxQADDcY3r
 q5Et/eGwY4g8H2QGRleR88yiOJeSWzwoVxfcHuHaFK4oXYFLH7zTBlcKfbaOJsQqkwWt
 bmrrv7vaA0cz4LPlu/iJUd+rWXv6Hoggckzf47ufk4fqjYE0Q4iAfkGtiU8Mf3SyeZ9n
 mN1g==
X-Gm-Message-State: AOAM530tfctz+sGRkTD8QzXSB9GBcxkzRzda0i0PQcqpAI3aUd2RryGY
 G90K64W95fQUB0f7bR2R+NEz640OOKO259b5STBbSm43PjUbbnMHBVC/USsXLmvp6gu2pJIfZVO
 XkJ6CGdNO+mKvYwn2VMZ3kBupVk4W
X-Received: by 2002:a17:906:d282:: with SMTP id
 ay2mr1910846ejb.265.1599138581377; 
 Thu, 03 Sep 2020 06:09:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4WbCzGSIX11Eb7tLYhakyrPDa74ODNUuKAajKTh1x+4i7BJ6ADpqdzqIF9xQvFCK8/v6JPQ==
X-Received: by 2002:a17:906:d282:: with SMTP id
 ay2mr1910818ejb.265.1599138581124; 
 Thu, 03 Sep 2020 06:09:41 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id v7sm3391177edd.48.2020.09.03.06.09.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2020 06:09:40 -0700 (PDT)
Subject: Re: [PATCH v10 07/17] pwm: lpss: Remove suspend/resume handlers
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20200903112337.4113-1-hdegoede@redhat.com>
 <20200903112337.4113-8-hdegoede@redhat.com>
 <20200903124816.GA1891694@smile.fi.intel.com>
 <20200903125620.GB1891694@smile.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <63bf5fd7-148e-262a-4076-66d2ffb58557@redhat.com>
Date: Thu, 3 Sep 2020 15:09:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200903125620.GB1891694@smile.fi.intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0.002
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
Cc: linux-pwm@vger.kernel.org, intel-gfx <intel-gfx@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-acpi@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, Len Brown <lenb@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 9/3/20 2:56 PM, Andy Shevchenko wrote:
> On Thu, Sep 03, 2020 at 03:48:16PM +0300, Andy Shevchenko wrote:
>> On Thu, Sep 03, 2020 at 01:23:27PM +0200, Hans de Goede wrote:
> 
>> the question is do we need to have similar in acpi_lpss.c?
>> For example,
>> 	static const struct lpss_device_desc byt_pwm_dev_desc = {
>> 		.flags = LPSS_SAVE_CTX,
>> 		^^^^^^^^^^^^^^
>> 		.prv_offset = 0x800,
>> 		.setup = byt_pwm_setup,
>> 	};
>>
>> 	static const struct lpss_device_desc bsw_pwm_dev_desc = {
>> 		.flags = LPSS_SAVE_CTX | LPSS_NO_D3_DELAY,
>> 		^^^^^^^^^^^^^^
>> 		.prv_offset = 0x800,
>> 		.setup = bsw_pwm_setup,
>> 	};
> 
> Okay, it's a private space which has clock and reset gating, so means we still
> need to handle it.

Right I was about to say the same.

As always, thank you for your reviews.

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
