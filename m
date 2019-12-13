Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5270F11E3B1
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 13:40:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 919896E56D;
	Fri, 13 Dec 2019 12:40:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75A826E55E
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 12:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576240843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DUragvfk5FVu6qjRne2AQU3xFq5etQTYcUAxceDIICQ=;
 b=MRD3aRNITRGFAuYSs7es6fHQKxOK3zfTxBiOqGdijSw66K9Sm1m5rO2idf8DYIv9IFPn1b
 z51QvsSPgMK3XnXwMOZQ5ora76Mh3KS4A56Sib1lL87gRPAF3rpjdyKBnz6EbqgSVMHcIY
 iCj87g09SMYlCkmSGlmS13eFWQLf54U=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-79-FABAyfW-Oau5Sl09SnUt6w-1; Fri, 13 Dec 2019 07:40:40 -0500
Received: by mail-wm1-f70.google.com with SMTP id s12so2297259wmc.6
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 04:40:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DUragvfk5FVu6qjRne2AQU3xFq5etQTYcUAxceDIICQ=;
 b=LqoaHRGp6KiPElMt5aAapgo1jPuku7UCgzeGzus6jAdwgXDccCI6sMKZKm7ZjFYW+B
 lADyTXmktaXqpvKWovfnI8XDRlv0GbXxcrFSnQzhT7skpdo7+MoL0cYXvg5Oj1etaDmr
 M0l1nmlo5asVVHl4iSxFUpQv0K3QQG+iIAeph78/KW3SxeGuHhm5yt0eSqpC14Xxg1/4
 67XcageHy94QkS/Azg8xuL9MRNtKJQDw0VyGpzmwVhCWvVFbhqt4w7n3ZvA/8zmbIy1F
 HiYWOGCvvxXdQpa6wyW0fHBATCW/dKnivitAKQ33ONATowZoq/+7TXNYIYNET2B6E8b5
 jBrA==
X-Gm-Message-State: APjAAAVTcoydaypOOrP+3KSjJoRPDK82nyOdFZZf0xB4qzQGIFrWcJQu
 poeGVeZUHdScMCqX0oIcyMkjIdQp8vntpJ9n0EQj7ZdPl3oj5fw4F2HqDMlCNo1jWjUbb7kGOnV
 Q+xj2KVDdXWgX7KnSnL6vxj1IJUIg
X-Received: by 2002:a7b:cf01:: with SMTP id l1mr12587146wmg.86.1576240839204; 
 Fri, 13 Dec 2019 04:40:39 -0800 (PST)
X-Google-Smtp-Source: APXvYqzbRIcHY9orrZ4lf2zeld4ZX7W4hZ9ME2FvdqX7ky1NhoyqbFSoXWz8BRoTm7hDdHzOuVqAiA==
X-Received: by 2002:a7b:cf01:: with SMTP id l1mr12587108wmg.86.1576240838906; 
 Fri, 13 Dec 2019 04:40:38 -0800 (PST)
Received: from shalem.localdomain
 (2001-1c00-0c0c-fe00-7e79-4dac-39d0-9c14.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:7e79:4dac:39d0:9c14])
 by smtp.gmail.com with ESMTPSA id t81sm10032474wmg.6.2019.12.13.04.40.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Dec 2019 04:40:38 -0800 (PST)
Subject: Re: [PATCH 2/3] mfd: intel_soc_pmic: Rename pwm_backlight pwm-lookup
 to pwm_pmic_backlight
To: Lee Jones <lee.jones@linaro.org>
References: <20191119151818.67531-1-hdegoede@redhat.com>
 <20191119151818.67531-3-hdegoede@redhat.com> <20191210085111.GQ3468@dell>
 <a05e5a2b-568e-2b0d-0293-aa937c590a74@redhat.com>
 <20191212084546.GA3468@dell>
 <d22e9a04-da09-0f41-a78e-ac17a947650a@redhat.com>
 <20191212155209.GC3468@dell>
 <4d07445d-98b1-f23c-0aac-07709b45df78@redhat.com>
 <20191213082734.GE3468@dell>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <d648794d-4c76-cfa1-dcbd-16c34d409c51@redhat.com>
Date: Fri, 13 Dec 2019 13:40:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191213082734.GE3468@dell>
Content-Language: en-US
X-MC-Unique: FABAyfW-Oau5Sl09SnUt6w-1
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

On 13-12-2019 09:27, Lee Jones wrote:
> On Thu, 12 Dec 2019, Hans de Goede wrote:
> 
>> Hi,
>>
>> On 12-12-2019 16:52, Lee Jones wrote:
>>> On Thu, 12 Dec 2019, Hans de Goede wrote:
>>>
>>>> Hi,
>>>>
>>>> On 12-12-2019 09:45, Lee Jones wrote:
>>>>> On Wed, 11 Dec 2019, Hans de Goede wrote:
>>>>>
>>>>>> Hi Lee,
>>>>>>
>>>>>> On 10-12-2019 09:51, Lee Jones wrote:
>>>>>>> On Tue, 19 Nov 2019, Hans de Goede wrote:
>>>>>>>
>>>>>>>> At least Bay Trail (BYT) and Cherry Trail (CHT) devices can use 1 of 2
>>>>>>>> different PWM controllers for controlling the LCD's backlight brightness.
>>>>>>>>
>>>>>>>> Either the one integrated into the PMIC or the one integrated into the
>>>>>>>> SoC (the 1st LPSS PWM controller).
>>>>>>>>
>>>>>>>> So far in the LPSS code on BYT we have skipped registering the LPSS PWM
>>>>>>>> controller "pwm_backlight" lookup entry when a Crystal Cove PMIC is
>>>>>>>> present, assuming that in this case the PMIC PWM controller will be used.
>>>>>>>>
>>>>>>>> On CHT we have been relying on only 1 of the 2 PWM controllers being
>>>>>>>> enabled in the DSDT at the same time; and always registered the lookup.
>>>>>>>>
>>>>>>>> So far this has been working, but the correct way to determine which PWM
>>>>>>>> controller needs to be used is by checking a bit in the VBT table and
>>>>>>>> recently I've learned about 2 different BYT devices:
>>>>>>>> Point of View MOBII TAB-P800W
>>>>>>>> Acer Switch 10 SW5-012
>>>>>>>>
>>>>>>>> Which use a Crystal Cove PMIC, yet the LCD is connected to the SoC/LPSS
>>>>>>>> PWM controller (and the VBT correctly indicates this), so here our old
>>>>>>>> heuristics fail.
>>>>>>>>
>>>>>>>> Since only the i915 driver has access to the VBT, this commit renames
>>>>>>>> the "pwm_backlight" lookup entries for the Crystal Cove PMIC's PWM
>>>>>>>> controller to "pwm_pmic_backlight" so that the i915 driver can do a
>>>>>>>> pwm_get() for the right controller depending on the VBT bit, instead of
>>>>>>>> the i915 driver relying on a "pwm_backlight" lookup getting registered
>>>>>>>> which magically points to the right controller.
>>>>>>>>
>>>>>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>>>>>> ---
>>>>>>>>      drivers/mfd/intel_soc_pmic_core.c | 2 +-
>>>>>>>>      1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>>
>>>>>>> For my own reference:
>>>>>>>       Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
>>>>>>
>>>>>> As mentioned in the cover-letter, to avoid breaking bi-sectability
>>>>>> as well as to avoid breaking the intel-gfx CI we need to merge this series
>>>>>> in one go through one tree. Specifically through the drm-intel tree.
>>>>>> Is that ok with you ?
>>>>>>
>>>>>> If this is ok with you, then you do not have to do anything, I will just push
>>>>>> the entire series to drm-intel. drivers/mfd/intel_soc_pmic_core.c
>>>>>> does not see much changes so I do not expect this to lead to any conflicts.
>>>>>
>>>>> It's fine, so long as a minimal immutable pull-request is provided.
>>>>> Whether it's pulled or not will depend on a number of factors, but it
>>>>> needs to be an option.
>>>>
>>>> The way the drm subsys works that is not really a readily available
>>>> option. The struct definition which this patch changes a single line in
>>>> has not been touched since 2015-06-26 so I really doubt we will get a
>>>> conflict from this.
>>>
>>> Always with the exceptions ...
>>>
>>> OOI, why does this *have* to go through the DRM tree?
>>
>> This patch renames the name used to lookup the pwm controller from
>> "pwm_backlight" to "pwm_pmic_backlight" because there are 2 possible
>> pwm controllers which may be used, one in the SoC itself and one
>> in the PMIC. Which controller should be used is described in a table
>> in the Video BIOS, so another part of this series adds this code to
>> the i915 driver:
>>
>> -	panel->backlight.pwm = pwm_get(dev->dev, "pwm_backlight");
>> +	/* Get the right PWM chip for DSI backlight according to VBT */
>> +	if (dev_priv->vbt.dsi.config->pwm_blc == PPS_BLC_PMIC) {
>> +		panel->backlight.pwm = pwm_get(dev->dev, "pwm_pmic_backlight");
>> +		desc = "PMIC";
>> +	} else {
>> +		panel->backlight.pwm = pwm_get(dev->dev, "pwm_soc_backlight");
>> +		desc = "SoC";
>> +	}
>>
>> So both not to break bisectability, but also so as to not break the extensive
>> CI system which is used to test the i915 driver we need the MFD change doing
>> the rename to go upstrream through the same tree as the i915 change.
>>
>> I have even considered just squashing the 2 commits together as having only 1
>> present, but not the other breaks stuff left and right.
> 
> That doesn't answer the question.
> 
> Why do they all *have* to go in via the DRM tree specifically?

1. As explained these chanegs need to stay together
2. This change is primarily a drm/i915 change. Also the i915 code sees lots
of changes every cycle, where as the change to the mfd code touches a block
of code which has not been touched since 2015-06-26, so the chance of conflicts
is much bigger if this goes on through another tree.

I honestly do not see the problem here? Let me reverse the question why should this
NOT go in through the drm tree?

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
