Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE89500F64
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 15:25:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B03A210E55D;
	Thu, 14 Apr 2022 13:25:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27DFD10FC29;
 Thu, 14 Apr 2022 13:25:05 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id w4so6871851wrg.12;
 Thu, 14 Apr 2022 06:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=KJqJhWGOMqZ4pmms8DHGR1diJCvFCwFCrMUiblspX9U=;
 b=jycWNgYK4wWa5DufLbzmKMlBCZBUBcRIcWfHyq859Xh3PSxS1PPGWkRdQHzbShA904
 DKfUkZu9w/oe0qbpLld0ZAaqsywN2odTQLaG/KebC8YYPl+lTa5TIN+FO6tU42jyspGa
 nRcHPSZYkiBjOFXkjtLqkeDiEWuA5xPJHQVSwR+AlmQVlTcyH9C/wZ7LwzlZC5MmIInh
 F0CZpYh4pXRAHaM67A2Btzi/8e6TlU7TzM0Pf9gzXzndVyt5gc7CTyvYMlW0QEsJduie
 o7Zp8eLruyw2lJakQMsWS5mT6uM8Hueh4zO0Hx4gXLRg0VbvBQ34QTCvC2lCW/rc3cRo
 Xa6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KJqJhWGOMqZ4pmms8DHGR1diJCvFCwFCrMUiblspX9U=;
 b=IJUW8thQUjxYCeFFg32Y+Pf9t3oEF4aYzC5rT54/OQoAb44xNqv7Y8PKtNOFn1IMyL
 eGOE3jFnp44IqSBc1F2REFOolbsnbpxp5Yt4QyZC2cZVfjv690SWwXmBV0ElkZzdRf5F
 5IKMrCE/K12cxSwm8Gb1cuW54Pc2Sg51a3O8kdMXkUT2iDDU5tT65aZ8I7eeOgB+sj3W
 kfspkqQ3rBbyHS0+efW2YYqYIwZdwamPuTQKZIOlduNIG9s2O8vuruBSSsWSqgOCMyxn
 zTGIk9rGRKT9FcXqIbLkqOTQLKNOC5MFAd+5bvrnDDXjibqD16vT2JzhfL/WPYnGtiir
 qeIg==
X-Gm-Message-State: AOAM531diVXX4IhhEezVK8U0iJwteXXUhf2UKH6jhG1flx/GRHBpgROY
 INnw5wJYRHROT0UMGHhsOqI=
X-Google-Smtp-Source: ABdhPJwAEBmsX6MkgbXjFKSKNrf/YKhqCKWGBSYsSqxPgnXEqa8sNQwK4zqHkT/UOloxrikq5pRIsQ==
X-Received: by 2002:adf:dfc1:0:b0:207:a5b9:9307 with SMTP id
 q1-20020adfdfc1000000b00207a5b99307mr2009238wrn.575.1649942703353; 
 Thu, 14 Apr 2022 06:25:03 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:be69:3200:82e8:2cff:fe51:d2c8?
 ([2a02:a03f:be69:3200:82e8:2cff:fe51:d2c8])
 by smtp.gmail.com with ESMTPSA id
 c186-20020a1c35c3000000b0038e6c6fc860sm2066836wma.37.2022.04.14.06.25.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 06:25:02 -0700 (PDT)
Message-ID: <cb017f97-bf6a-191b-d12b-14bcf91c84dd@gmail.com>
Date: Thu, 14 Apr 2022 15:25:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [Intel-gfx] commit 15512021eb3975a8c2366e3883337e252bb0eee5
 causes white spots in console screens
Content-Language: fr-moderne
To: "Saarinen, Jani" <jani.saarinen@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
References: <0da21aec-d299-1834-99f3-9a598e4649f7@gmail.com>
 <87v8vcgb63.fsf@intel.com> <20220414063139.GA31013@intel.com>
 <9d497fb9-4504-9e64-1d7f-9353cf96624c@gmail.com>
 <20220414080312.GA31389@intel.com>
 <1bcb195c-8c84-3641-7784-e7b7578bb40f@gmail.com> <87h76wf4lz.fsf@intel.com>
 <DM8PR11MB56557E53CB85DD86A4F21A21E0EF9@DM8PR11MB5655.namprd11.prod.outlook.com>
From: =?UTF-8?Q?Fran=c3=a7ois_Valenduc?= <francoisvalenduc@gmail.com>
In-Reply-To: <DM8PR11MB56557E53CB85DD86A4F21A21E0EF9@DM8PR11MB5655.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le 14/04/22 à 11:51, Saarinen, Jani a écrit :
>
>> -----Original Message-----
>> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Jani
>> Nikula
>> Sent: torstai 14. huhtikuuta 2022 11.32
>> To: François Valenduc <francoisvalenduc@gmail.com>; Lisovskiy, Stanislav
>> <stanislav.lisovskiy@intel.com>
>> Cc: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
>> Subject: Re: [Intel-gfx] commit 15512021eb3975a8c2366e3883337e252bb0eee5
>> causes white spots in console screens
>>
>> On Thu, 14 Apr 2022, François Valenduc <francoisvalenduc@gmail.com> wrote:
>>> Le 14/04/22 à 10:03, Lisovskiy, Stanislav a écrit :
>>>> On Thu, Apr 14, 2022 at 08:33:35AM +0200, François Valenduc wrote:
>>>>> Le 14/04/22 à 08:31, Lisovskiy, Stanislav a écrit :
>>>>>> On Wed, Apr 13, 2022 at 08:12:20PM +0300, Jani Nikula wrote:
>>>>>>> On Wed, 13 Apr 2022, François Valenduc <francoisvalenduc@gmail.com>
>> wrote:
>>>>>>>> Commit 15512021eb3975a8c2366e3883337e252bb0eee5
>>>>>>>> (15512021eb3975a8c2366e3883337e252bb0eee5) causes a lof of white
>>>>>>>> spots to appears on the right upper corner of all console screens
>>>>>>>> (see
>> https://drive.google.com/file/d/13GabEvOIKSAj5yox6ybAZEDu3Ixncw5Q/view).
>>>>>>>> git-bisect shows that this is the offending commit and if I
>>>>>>>> revert it, the problem goes away. The problem still occurs with
>>>>>>>> kernel 5.18-rc2 and to all stable trees where it was applied.
>>>>>>>> Can somebody explains what happens ?
>>>>>>>>
>>>>>>>> The video card is the following: VGA compatible controller: Intel
>>>>>>>> Corporation WhiskeyLake-U GT2 [UHD Graphics 620] (rev 02)
>>>>>>>> (prog-if 00 [VGA controller])
>>>>>>>>
>>>>>>>> Please tell me if you need more info.
>>>>>>> That's commit 15512021eb39 ("drm/i915: Workaround broken BIOS DBUF
>>>>>>> configuration on TGL/RKL"), adding Cc's.
>>>>>>>
>>>>>>> Please file a report at fdo gitlab [1] and attach dmesg etc. there.
>>>>>> That commit looks like it is just disabling all the planes, if
>>>>>> wrong dbuf/wm configuration is detected.
>>>>>> However it should do that only once during boot as I understand.
>>>>>>
>>>>>> Are you sure that is exactly this commit which is causing this?
>>>>>> Does the issue appear always?
>>>>>>
>>>>>> Ville Syrjälä, thoughts?
>>>>>>
>>>>>> Stan
>>>>>>
>>>>>>> Thanks,
>>>>>>> Jani.
>>>>>>>
>>>>>>>
>>>>>>> [1]
>>>>>>> https://gitlab.freedesktop.org/drm/intel/wikis/How-to-file-i915-bu
>>>>>>> gs
>>>>>>>
>>>>>>>
>>>>>>> --
>>>>>>> Jani Nikula, Intel Open Source Graphics Center
>>>>> As I said, git-bisect shows it's the offending commit and if I
>>>>> revert it, the problem doesn't happens. Otherwise, it always occurs.
>>>>>
>>>>> François
>>>>>
>>>> Does it just happen all the time or some steps/certain circumstances
>>>> needed for it to happen?
>>>>
>>>> Only suspicion after looking briefly is that once suspend/resume is
>>>> done it might be messing something up. Just a quick guess..
>>>>
>>>> Stan
>>> It occurs permantently as soon as I boot my computer.
>> I'd appreciate that bug being filed, and the discussion moved there, so all the
>> details and history are in one place.
> Agree.
>
>> Thanks,
>> Jani.
>>
>>
>> --
>> Jani Nikula, Intel Open Source Graphics Center
As requested, I filled a bug on freedesktop 
(https://gitlab.freedesktop.org/drm/intel/-/issues/5711)
