Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA8660C456
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 08:55:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC1E010E117;
	Tue, 25 Oct 2022 06:55:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D82D610E3F2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 11:56:21 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id 192so1599098pfx.5
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 04:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5+lNDU/7OVWZdRTzaQ0NNoHLmGlotseKeYdhpqFhZHk=;
 b=ELM7yD3oiyJMNZjuq6+6Ex/rHcrMTY9mQ5tNeBwzHLydPg0gZHlF7XsvW1qorqNXit
 +1clr9lF9YGe2kf2wSGlmcErC4WdUV2mJclhDusQXllPYQIVafBWeC2hY7DTDFJEA/gy
 DHTUn82tj8FzO+vABFXg6YciJQBhFtT4OT6DVBod8WTp9mMJhhSI6vwxWE2MV7uVC1M9
 CWg6mZN5LUXqiYcB5E6m33jGN8tYNt1DVe63+GyxUqJbAScwDkeBxMOxAxBg8Z/D9LBC
 /rqOoSynJrCwt1BDkHRnNol0Ycqz9wssry5CJatx+rOA9oWm9IQ5GyMCZ7LZm+IMtk07
 j8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5+lNDU/7OVWZdRTzaQ0NNoHLmGlotseKeYdhpqFhZHk=;
 b=CGH7OF8zVzeWwepYEgGMXGI9SDmZqrKV4TgUQTtqB8ZtiElyYl6i/Eith7Jslm7AVj
 9313ACUFVojwo4WpOUxGJlMuPc8Cs7A9g9xt66u8g7bNaDF0B9JH/oCdUZYuvZdBE9Eg
 4GjxJjhAjlgOcg22UBmtHN3U3OsWznPwFDbI/ILWbKrM4QuKdBf4PQJzWk+Lr9jJLDD+
 gxWKiyltn1xWaQKyjuI/Pyuu2HsazdqIRPLomEVR/LwJ41RsXfRFlaBoejdK3qP88/7X
 pJpGpsZHeqP9dckA6s3Js8NqyfVKq8bGuPwflNSqVeouoFf3a0tLczpd4uhyKDSGhFdk
 4Aew==
X-Gm-Message-State: ACrzQf3Gr6FKmUMsYh2VpGVpbnt1SttC+T3TEKzhNM8cFSYX+aZBnYCC
 zx4yOabVCUWWrpfLJh5IvCekgQ==
X-Google-Smtp-Source: AMsMyM52yf+fvqYPvZeS1DKLnZf/VX+KNJmRf5dcZ02xlrYFrlYIJNW33UZRrKUu0oE/cElVDg23zg==
X-Received: by 2002:aa7:8011:0:b0:567:70cc:5b78 with SMTP id
 j17-20020aa78011000000b0056770cc5b78mr29115949pfi.29.1666612581441; 
 Mon, 24 Oct 2022 04:56:21 -0700 (PDT)
Received: from ?IPV6:2400:4050:c360:8200:8ae8:3c4:c0da:7419?
 ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 on16-20020a17090b1d1000b0020b21019086sm18524378pjb.3.2022.10.24.04.56.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 04:56:20 -0700 (PDT)
Message-ID: <18478739-625b-0c16-cd5a-e05c5372a74a@daynix.com>
Date: Mon, 24 Oct 2022 20:56:11 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 00/22] Fallback to native backlight
To: Jani Nikula <jani.nikula@linux.intel.com>
References: <20221024113513.5205-1-akihiko.odaki@daynix.com>
 <87tu3te92n.fsf@intel.com>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <87tu3te92n.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linux-fbdev@vger.kernel.org, Ike Panhc <ike.pan@canonical.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, dri-devel@lists.freedesktop.org,
 Azael Avalos <coproscefalo@gmail.com>, Mattia Dongili <malattia@linux.it>,
 Daniel Dadap <ddadap@nvidia.com>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jonathan Woithe <jwoithe@just42.net>, Jonathan Corbet <corbet@lwn.net>, "Lee,
 Chun-Yi" <jlee@suse.com>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, Robert Moore <robert.moore@intel.com>,
 linux-acpi@vger.kernel.org, Cezary Jackiewicz <cezary.jackiewicz@gmail.com>,
 Len Brown <lenb@kernel.org>, Matthew Garrett <mjg59@srcf.ucam.org>,
 Kenneth Chan <kenneth.t.chan@gmail.com>,
 Corentin Chary <corentin.chary@gmail.com>, intel-gfx@lists.freedesktop.org,
 acpi4asus-user@lists.sourceforge.net, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 platform-driver-x86@vger.kernel.org, devel@acpica.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 ibm-acpi-devel@lists.sourceforge.net, Jingoo Han <jingoohan1@gmail.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022/10/24 20:48, Jani Nikula wrote:
> On Mon, 24 Oct 2022, Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>> Commit 2600bfa3df99 ("ACPI: video: Add acpi_video_backlight_use_native()
>> helper") and following commits made native backlight unavailable if
>> CONFIG_ACPI_VIDEO is set and the backlight feature of ACPI video is
>> unavailable, which broke the backlight functionality on Lenovo ThinkPad
>> C13 Yoga Chromebook. Allow to fall back to native backlight in such
>> cases.
> 
> Where's the bug report with relevant logs, kconfigs, etc?

I haven't filed one. Should I? Please tell me where to report and what 
information you would need (to bugzilla.kernel.org with things mentioned 
in Documentation/admin-guide/reporting-issues.rst?)

Regards,
Akihiko Odaki

> 
> BR,
> Jani.
> 
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>>
>> Akihiko Odaki (22):
>>    drm/i915/opregion: Improve backlight request condition
>>    ACPI: video: Introduce acpi_video_get_backlight_types()
>>    LoongArch: Use acpi_video_get_backlight_types()
>>    platform/x86: acer-wmi: Use acpi_video_get_backlight_types()
>>    platform/x86: asus-laptop: Use acpi_video_get_backlight_types()
>>    platform/x86: asus-wmi: Use acpi_video_get_backlight_types()
>>    platform/x86: compal-laptop: Use acpi_video_get_backlight_types()
>>    platform/x86: eeepc-laptop: Use acpi_video_get_backlight_types()
>>    platform/x86: fujitsu-laptop: Use acpi_video_get_backlight_types()
>>    platform/x86: ideapad-laptop: Use acpi_video_get_backlight_types()
>>    platform/x86: msi-laptop: Use acpi_video_get_backlight_types()
>>    platform/x86: msi-wmi: Use acpi_video_get_backlight_types()
>>    platform/x86: nvidia-wmi-ec-backlight: Use
>>      acpi_video_get_backlight_types()
>>    platform/x86: panasonic-laptop: Use acpi_video_get_backlight_types()
>>    platform/x86: samsung-laptop: Use acpi_video_get_backlight_types()
>>    platform/x86: sony-laptop: Use acpi_video_get_backlight_types()
>>    platform/x86: thinkpad_acpi: Use acpi_video_get_backlight_types()
>>    platform/x86: toshiba_acpi: Use acpi_video_get_backlight_types()
>>    platform/x86: dell-laptop: Use acpi_video_get_backlight_types()
>>    platform/x86: intel_oaktrail: Use acpi_video_get_backlight_types()
>>    ACPI: video: Remove acpi_video_get_backlight_type()
>>    ACPI: video: Fallback to native backlight
>>
>>   Documentation/gpu/todo.rst                    |  8 +--
>>   drivers/acpi/acpi_video.c                     |  2 +-
>>   drivers/acpi/video_detect.c                   | 54 ++++++++++---------
>>   drivers/gpu/drm/i915/display/intel_opregion.c |  3 +-
>>   drivers/platform/loongarch/loongson-laptop.c  |  4 +-
>>   drivers/platform/x86/acer-wmi.c               |  2 +-
>>   drivers/platform/x86/asus-laptop.c            |  2 +-
>>   drivers/platform/x86/asus-wmi.c               |  4 +-
>>   drivers/platform/x86/compal-laptop.c          |  2 +-
>>   drivers/platform/x86/dell/dell-laptop.c       |  2 +-
>>   drivers/platform/x86/eeepc-laptop.c           |  2 +-
>>   drivers/platform/x86/fujitsu-laptop.c         |  4 +-
>>   drivers/platform/x86/ideapad-laptop.c         |  2 +-
>>   drivers/platform/x86/intel/oaktrail.c         |  2 +-
>>   drivers/platform/x86/msi-laptop.c             |  2 +-
>>   drivers/platform/x86/msi-wmi.c                |  2 +-
>>   .../platform/x86/nvidia-wmi-ec-backlight.c    |  2 +-
>>   drivers/platform/x86/panasonic-laptop.c       |  2 +-
>>   drivers/platform/x86/samsung-laptop.c         |  2 +-
>>   drivers/platform/x86/sony-laptop.c            |  2 +-
>>   drivers/platform/x86/thinkpad_acpi.c          |  4 +-
>>   drivers/platform/x86/toshiba_acpi.c           |  2 +-
>>   drivers/video/backlight/backlight.c           | 18 +++++++
>>   include/acpi/video.h                          | 21 ++++----
>>   include/linux/backlight.h                     |  1 +
>>   25 files changed, 85 insertions(+), 66 deletions(-)
> 
