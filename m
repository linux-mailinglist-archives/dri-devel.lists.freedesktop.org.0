Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 510C960C44F
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 08:55:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 259BF10E170;
	Tue, 25 Oct 2022 06:54:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E370E10E822
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 15:08:00 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id h14so8321177pjv.4
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 08:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2V4dbYtLJOdrMkKDGWD6KitwsjwW003TmDHahg6j47c=;
 b=ST/EXpXnGMVhqPz5639aoNMs/MJCJzl8dYjBtKZ3GcsF9hRU11tFH8h+hAVwsuz7Ya
 ou3g2rW+Plt9PF+abw04hYxFyJSm9TK3Zc5f0f5VVZO5g8/1EqtsdnIw40CUpYiKDPyc
 l1nM/cpbycbAYsrdPD8mjm3HQb1Jjx51O7y7NbyI+fwUdrsdHeybDUy91e+NsIa25apE
 kIA2H2uRZuRl/NG+Em85SNDo7WgqTEz31CBkJFxFXVC0joUug26g3b4ejfutAY4sXqzL
 Tnm9LZFmrc7FvMcHA93IL6vnTjpxZOjIIzqrZ/swDntvQeFcv7Ywd2Tvsz2itKp7iCTq
 YX4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2V4dbYtLJOdrMkKDGWD6KitwsjwW003TmDHahg6j47c=;
 b=xHLCQo6xsBm/nk/DpJ7yHPG6vZ4c+h7j4tHu6BHZFAklGAqwXdFDk9BatzZeySAISN
 lrdaPM2Fg+AA5zraLMVMtjr3aETliatLPjI/DDaXQXUcn0j76M08O+pOVu9kG3EX+d9g
 bq745BB2y+/8biuVYdT7uXA10Oo17r+EHWbttJzuHrNS0xH1/h89fGlbWdjgNqcihcOL
 Clf3oRuE3lOm61l7SUJbUEai1T202dqXdLuhDlXHletIEmzhVTL/UsyGLPXwLAsw29YA
 ZvDT48aktIOjnE8yia4MQKKc5uMg/Vko32Y1x3SOoQgJofD7CM41kVZ5mRgAvJI0pOoi
 WvmA==
X-Gm-Message-State: ACrzQf0MW4g3ZoGQdxpWCKJJAaYHdbWSnmY/Gp+TkrdV6SKk31k7qH8X
 DPrLiS+OmT73IRIRf10e6WW7sw==
X-Google-Smtp-Source: AMsMyM69Ej5bscL4lukV/JMHX/W7kwNTTtbhzo5sbn6Z9pio8hw4ynMWZVObyRThBWw+9SwsG1ORmA==
X-Received: by 2002:a17:90b:3e81:b0:20d:bbe5:f332 with SMTP id
 rj1-20020a17090b3e8100b0020dbbe5f332mr63515067pjb.112.1666624080464; 
 Mon, 24 Oct 2022 08:08:00 -0700 (PDT)
Received: from ?IPV6:2400:4050:c360:8200:8ae8:3c4:c0da:7419?
 ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a170902da8a00b0017f64ab80e5sm19732220plx.179.2022.10.24.08.07.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 08:07:59 -0700 (PDT)
Message-ID: <3fe42888-30a1-9a94-1b78-b04d1ee4410a@daynix.com>
Date: Tue, 25 Oct 2022 00:07:56 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2] ACPI: video: Fix missing native backlight on
 Chromebooks
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Sean Paul <seanpaul@chromium.org>
References: <20221024141210.67784-1-dmitry.osipenko@collabora.com>
 <37ec64ac-9e08-dd41-4b20-8701bf9413fb@daynix.com>
 <a75c2439-415c-a132-754c-7676029f792b@redhat.com>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <a75c2439-415c-a132-754c-7676029f792b@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 25 Oct 2022 06:54:02 +0000
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
Cc: linux-acpi@vger.kernel.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022/10/24 23:59, Hans de Goede wrote:
> Hi,
> 
> On 10/24/22 16:52, Akihiko Odaki wrote:
>> On 2022/10/24 23:12, Dmitry Osipenko wrote:
>>> Chromebooks don't have backlight in ACPI table, they suppose to use
>>> native backlight in this case. Check presence of the CrOS embedded
>>> controller ACPI device and prefer the native backlight if EC found.
>>>
>>> Suggested-by: Hans de Goede <hdegoede@redhat.com>
>>> Fixes: 2600bfa3df99 ("ACPI: video: Add acpi_video_backlight_use_native() helper")
>>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>> ---
>>>
>>> Changelog:
>>>
>>> v2: - Added explanatory comment to the code and added check for the
>>>         native backlight presence, like was requested by Hans de Goede.
>>>
>>>    drivers/acpi/video_detect.c | 12 ++++++++++++
>>>    1 file changed, 12 insertions(+)
>>>
>>> diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
>>> index 0d9064a9804c..9cd8797d12bb 100644
>>> --- a/drivers/acpi/video_detect.c
>>> +++ b/drivers/acpi/video_detect.c
>>> @@ -668,6 +668,11 @@ static const struct dmi_system_id video_detect_dmi_table[] = {
>>>        { },
>>>    };
>>>    +static bool google_cros_ec_present(void)
>>> +{
>>> +    return acpi_dev_found("GOOG0004");
>>> +}
>>> +
>>>    /*
>>>     * Determine which type of backlight interface to use on this system,
>>>     * First check cmdline, then dmi quirks, then do autodetect.
>>> @@ -730,6 +735,13 @@ static enum acpi_backlight_type __acpi_video_get_backlight_type(bool native)
>>>                return acpi_backlight_video;
>>>        }
>>>    +    /*
>>> +     * Chromebooks that don't have backlight handle in ACPI table
>>> +     * are supposed to use native backlight if it's available.
>>> +     */
>>> +    if (google_cros_ec_present() && native_available)
>>> +        return acpi_backlight_native;
>>> +
>>>        /* No ACPI video (old hw), use vendor specific fw methods. */
>>>        return acpi_backlight_vendor;
>>>    }
>>
>> Hi,
>>
>> The native_available check does not prevent duplicate registration if vendor backlight registers first. It was enough for the combination of ACPI video and native because ACPI video delays its registration, but it is not the case for vendor/native combination.
> 
> There are no drivers providing acpi_backlight_vendor functionality on chromebooks.
> 
> All the drivers providing acpi_backlight_vendor functionality use vendor (Dell, Acer, Asus, etc.)
> specific firmware (smbios, EC bitbanging or ACPI) backlight control method which are not available
> on CoreBoot based ChromeBooks.

Hi,

Isn't the "native_available" check is for the case when 
acpi_backlight_vendor functionality gets implemented on Chromebooks? If 
it is, you don't want it to get broken when it actually happens. If you 
can ignore the case, native_available check is simply unnecessary.

> 
> Also notice that the theoretical problem of a vendor driver loading first was already present
> before the backlight refactor which landed in 6.1 and this has never been an issue.

The situation is even a bit better than it was before the refactor since 
duplication happened even when vendor driver loads later if I understand 
it correctly.

Regards,
Akihiko Odaki

> 
> Regards,
> 
> Hans
> 
