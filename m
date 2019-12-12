Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A790311CFED
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 15:34:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C28DE6E1AA;
	Thu, 12 Dec 2019 14:34:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8D136E1BD
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 14:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576161279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8L0wh57USWeg4kwDbaH2LaCzisTmsJPLc/9WAOqxji8=;
 b=OguXM/3J8LGWIicHGD40uEHW5+9RlEj7anvHDGN5dszY5qvpRfCTf4DVdyWZ6JLmG4maxY
 s50+p22i/xY/WilnnIePcY+kiEpfMA7dRKTrSP4AAmwlNwz5OwHiQdiFYNmYYuneT90qPg
 BLwyjtAOrCrTHOmQ3R5tFDh7cuRmyQM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-dWLE1DQWPrqJHIEixIBjxg-1; Thu, 12 Dec 2019 09:34:38 -0500
Received: by mail-wr1-f69.google.com with SMTP id h30so1105732wrh.5
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 06:34:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8L0wh57USWeg4kwDbaH2LaCzisTmsJPLc/9WAOqxji8=;
 b=CNp5W4qDcN1BqUB2hbxyQyV/FmqPTqKLD2rMV+RENltQd9mOvRcMHPdpz4xwdxbwBr
 9QDNh4jT2ZUYWN/jfA6czInUlTs6wiEWbZCHqLO0fyG52JwvF3w68cfRmCjEV+IBzAMU
 E5XH+FTYcT61kJVavi4xzLNy3lgSQi31UrhQihl8n9jX5HhwejP+u8NH7X7DbW9UI7qe
 3TvZw7h6HsbOXHA3qGeQggiWbIx1+kcrwmMYby6LrOWr1ViIK2FWjZFv1reIgKVDnT8m
 PbXxEsK/OwyBlauqbrPGHFOqfl/uhNbWjJ+PeiIi0Mx0+qy9GTT9xfY6LoUTIlFPsogC
 AP/w==
X-Gm-Message-State: APjAAAXcUpggd84GIC8RoBsmeFz4IwmyjTDdth0Z9L+7RGOP02xLpcBl
 qdBWd86P3cPsCqcpfJn0e3bUHBsDUxj9GkJ/P+SjlasDqY8/mwSHnv3O4VkMJv2CfM97MR9xCYK
 bAdgIO7kXnMfTAqlTV9QDW1lBCJRV
X-Received: by 2002:a1c:a9c6:: with SMTP id s189mr7132895wme.151.1576161276514; 
 Thu, 12 Dec 2019 06:34:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqwkMCbj3Al3W02aKWsSaIJItyyUbz24oMkL+40mFm8mAw2FfNeYRrpFtQxw5vg9q9Dyq+2PYg==
X-Received: by 2002:a1c:a9c6:: with SMTP id s189mr7132870wme.151.1576161276268; 
 Thu, 12 Dec 2019 06:34:36 -0800 (PST)
Received: from shalem.localdomain
 (2001-1c00-0c0c-fe00-7e79-4dac-39d0-9c14.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:7e79:4dac:39d0:9c14])
 by smtp.gmail.com with ESMTPSA id y20sm6009145wmi.25.2019.12.12.06.34.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Dec 2019 06:34:35 -0800 (PST)
Subject: Re: [PATCH 2/3] mfd: intel_soc_pmic: Rename pwm_backlight pwm-lookup
 to pwm_pmic_backlight
To: Lee Jones <lee.jones@linaro.org>
References: <20191119151818.67531-1-hdegoede@redhat.com>
 <20191119151818.67531-3-hdegoede@redhat.com> <20191210085111.GQ3468@dell>
 <a05e5a2b-568e-2b0d-0293-aa937c590a74@redhat.com>
 <20191212084546.GA3468@dell>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <d22e9a04-da09-0f41-a78e-ac17a947650a@redhat.com>
Date: Thu, 12 Dec 2019 15:34:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191212084546.GA3468@dell>
Content-Language: en-US
X-MC-Unique: dWLE1DQWPrqJHIEixIBjxg-1
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
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Len Brown <lenb@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 12-12-2019 09:45, Lee Jones wrote:
> On Wed, 11 Dec 2019, Hans de Goede wrote:
> 
>> Hi Lee,
>>
>> On 10-12-2019 09:51, Lee Jones wrote:
>>> On Tue, 19 Nov 2019, Hans de Goede wrote:
>>>
>>>> At least Bay Trail (BYT) and Cherry Trail (CHT) devices can use 1 of 2
>>>> different PWM controllers for controlling the LCD's backlight brightness.
>>>>
>>>> Either the one integrated into the PMIC or the one integrated into the
>>>> SoC (the 1st LPSS PWM controller).
>>>>
>>>> So far in the LPSS code on BYT we have skipped registering the LPSS PWM
>>>> controller "pwm_backlight" lookup entry when a Crystal Cove PMIC is
>>>> present, assuming that in this case the PMIC PWM controller will be used.
>>>>
>>>> On CHT we have been relying on only 1 of the 2 PWM controllers being
>>>> enabled in the DSDT at the same time; and always registered the lookup.
>>>>
>>>> So far this has been working, but the correct way to determine which PWM
>>>> controller needs to be used is by checking a bit in the VBT table and
>>>> recently I've learned about 2 different BYT devices:
>>>> Point of View MOBII TAB-P800W
>>>> Acer Switch 10 SW5-012
>>>>
>>>> Which use a Crystal Cove PMIC, yet the LCD is connected to the SoC/LPSS
>>>> PWM controller (and the VBT correctly indicates this), so here our old
>>>> heuristics fail.
>>>>
>>>> Since only the i915 driver has access to the VBT, this commit renames
>>>> the "pwm_backlight" lookup entries for the Crystal Cove PMIC's PWM
>>>> controller to "pwm_pmic_backlight" so that the i915 driver can do a
>>>> pwm_get() for the right controller depending on the VBT bit, instead of
>>>> the i915 driver relying on a "pwm_backlight" lookup getting registered
>>>> which magically points to the right controller.
>>>>
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>> ---
>>>>    drivers/mfd/intel_soc_pmic_core.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> For my own reference:
>>>     Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
>>
>> As mentioned in the cover-letter, to avoid breaking bi-sectability
>> as well as to avoid breaking the intel-gfx CI we need to merge this series
>> in one go through one tree. Specifically through the drm-intel tree.
>> Is that ok with you ?
>>
>> If this is ok with you, then you do not have to do anything, I will just push
>> the entire series to drm-intel. drivers/mfd/intel_soc_pmic_core.c
>> does not see much changes so I do not expect this to lead to any conflicts.
> 
> It's fine, so long as a minimal immutable pull-request is provided.
> Whether it's pulled or not will depend on a number of factors, but it
> needs to be an option.

The way the drm subsys works that is not really a readily available
option. The struct definition which this patch changes a single line in
has not been touched since 2015-06-26 so I really doubt we will get a
conflict from this.

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
