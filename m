Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8ED79D632
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 18:24:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C4D510E05E;
	Tue, 12 Sep 2023 16:23:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C4DF10E438
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 16:23:54 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id
 d75a77b69052e-412b073a82bso81cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 09:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1694535833; x=1695140633;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=N+ugFgOb5iS2vOO7DahZWqOi4I/gSUmJb5jnpjTlaDk=;
 b=y21+ISD5E8S2Zt4n2j+6mj70AStUK7xw+G81J5pd30Xyx8M5GFWjfHvohrmOzqkJs0
 0LSgr8qMd6qih8h1k4AOGna5+mJtyevN69yKJCz8yQt6F3ANobncigtF1m40Z+tQAxut
 TF/s40jaoorBcGn0UDQO/MZeTqNmpufd6b6AMdyDcoMo6hFI1MRXIIfGJGnCVMHM0TW5
 7Pzcvh29gbP3MgP0PsOguNaqBoAulwP9CGuT4rjT77fnBnFmnpVPehrWaTEP6Cd/vXXQ
 9OkdLL7X44X8cUUQpY93/rWqgLE4IAnJOLslSFBF+E0OykjJTq49DFX+JdvAO0qiQ8Vv
 i/Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694535833; x=1695140633;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N+ugFgOb5iS2vOO7DahZWqOi4I/gSUmJb5jnpjTlaDk=;
 b=Z+KZLSqvoPmObg3TeleKHz1Nw4Hq35UxlLZtG8BkpuKnrF8IFL6cmsYxGyDyllkd3C
 xoF4egFIuhF7gr7fOsPXzhBD/jgQ4xxOf4NLcGjH+o6VtkmKAXB819Yz1jvKF6jQ0ZpG
 PnhHM0aKu4BNttYBUU+qgUB1/DJUFi+JwajjISp9HTuGB5mH+in3ThbYPclNDVLzCbtU
 qn0bhvN2Sa3836FYdS9Pyne9PUtqZb3bNABCf1OEAH+DSNl6RgloA49pxFbQxc1+OurC
 Wpy8dL+dB4zznzeS2feeUJthOeeVl9V3OIBfxgb481k9WZG9hLEUlw7dbBwZLFR4w+Vk
 VS1w==
X-Gm-Message-State: AOJu0YzRudlp/mFTrHPifjpnJ3jjkbnw6M8oAFddCm/3bMi2YIOtOmxr
 Qp11b9bHHzvhMKNM3/rqaDzhutzk/ffdN9la83fg
X-Google-Smtp-Source: AGHT+IGZKq1neVdPa5doNGKg4ZeW48OcCeQNtBQcguqv/oZA7QzGQDO5RyH2blcv1AqWSyJKVDQlyqsbKQeiYJ53mNw=
X-Received: by 2002:ac8:6b04:0:b0:405:4662:d1b6 with SMTP id
 w4-20020ac86b04000000b004054662d1b6mr729qts.0.1694535832436; Tue, 12 Sep 2023
 09:23:52 -0700 (PDT)
MIME-Version: 1.0
From: Joshua Pius <joshuapius@google.com>
Date: Tue, 12 Sep 2023 12:23:14 -0400
Message-ID: <CAFs7P=hZVfUnTKYgOUwfwT6S9TO72iuJMBPbBG0i+U-4Au=O=Q@mail.gmail.com>
Subject: Re: [v3] drm/i915/display/lspcon: Increase LSPCON mode settle timeout
To: Ankit K Nautiyal <ankit.k.nautiyal@intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Niko Tsirakis <ntsirakis@google.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Pablo Ceballos <pceballos@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Yes, we've proposed this change before. The reasoning is still the
same. Added below to include in this thread as well. Is there a reason
the below explanation and test is not sufficient?

This issue affected several different CometLake-based Chrome OS device
designs. The details of the original report are in the Google partner
issue tracker (issue # 178169843), but I believe this requires a
Google partner account to access:
https://partnerissuetracker.corp.google.com/issues/178169843

The summary is that we were seeing these "*ERROR* LSPCON mode hasn't
settled" messages in the kernel logs followed by the display not
working at all. We increased the timeout to 500ms while investigation
continued and this reduced the number of occurrences of this issue:
https://chromium.googlesource.com/chromiumos/third_party/kernel/+/7b2899fc1a6f9409e8075b3153baaf02c4d1fc75

The problem continued to occur on about 2% of devices even after
increasing the timeout to 500ms. The investigation continued in issue
# 188035814, with engineers from Parade and Intel involved.
Ultimately, the recommendation from Intel engineers was to increase
the timeout further:
https://partnerissuetracker.corp.google.com/issues/188035814

The timeout was then increased to 1000ms:
https://chromium.googlesource.com/chromiumos/third_party/kernel/+/a16cfc2062e768c8e5ad8fa09b8ca127aa1ead9a

I recently ran 100 reboot trials on one device and found that the
median time for the LSPCON mode to settle was 440ms and the max was
444ms. But we know from the original reports that even after we set
the timeout to 500ms the issue continued to happen on some small
percentage of devices. So this is why I picked the larger value of
800ms.

>> This is to eliminate all cases of "*ERROR* LSPCON mode hasn't settled",
>> followed by link training errors. Intel engineers recommended increasing
>> this timeout and that does resolve the issue.
>>
>> On some CometLake-based device designs the Parade PS175 takes more than
>> 400ms to settle in PCON mode. 100 reboot trials on one device resulted
>> in a median settle time of 440ms and a maximum of 444ms. Even after
>> increasing the timeout to 500ms, 2% of devices still had this error. So
>> this increases the timeout to 800ms.
>>
>> Signed-off-by: Pablo Ceballos <pceballos@google.com>
>
>I think we've been here before. Do you have a publicly available gitlab
>issue with the proper logs? If not, please file one at [1].
>
>BR,
>Jani.
>
>[1] https://gitlab.freedesktop.org/drm/intel/issues/new
>
>
>> ---
>>
>> V2: Added more details in the commit message
>> V3: Only apply the increased timeout if the vendor is Parade
>>
>> drivers/gpu/drm/i915/display/intel_lspcon.c | 21 ++++++++++++++++++++-
>>  1 file changed, 20 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_lspcon.c b/drivers/gpu/drm/i915/display/intel_lspcon.c
>> index bb3b5355a0d9..b07eab84cc63 100644
>> --- a/drivers/gpu/drm/i915/display/intel_lspcon.c
>> +++ b/drivers/gpu/drm/i915/display/intel_lspcon.c
>> @@ -153,6 +153,24 @@ static enum drm_lspcon_mode lspcon_get_current_mode(struct intel_lspcon *lspcon)
>>   return current_mode;
>>  }
>>
>> +static u32 lspcon_get_mode_settle_timeout(struct intel_lspcon *lspcon)
>> +{
>> + u32 timeout_ms = 400;
>> +
>> + /*
>> + * On some CometLake-based device designs the Parade PS175 takes more
>> + * than 400ms to settle in PCON mode. 100 reboot trials on one device
>> + * resulted in a median settle time of 440ms and a maximum of 444ms.
>> + * Even after increasing the timeout to 500ms, 2% of devices still had
>> + * this error. So this sets the timeout to 800ms.
>> + */
>> + if (lspcon->vendor == LSPCON_VENDOR_PARADE)
>> + timeout_ms = 800;
>> +
>> + return timeout_ms;
>> +}
>> +
>> +
>>  static enum drm_lspcon_mode lspcon_wait_mode(struct intel_lspcon *lspcon,
>>       enum drm_lspcon_mode mode)
>>  {
>> @@ -167,7 +185,8 @@ static enum drm_lspcon_mode lspcon_wait_mode(struct intel_lspcon *lspcon,
>>   drm_dbg_kms(&i915->drm, "Waiting for LSPCON mode %s to settle\n",
>>      lspcon_mode_name(mode));
>>
>> - wait_for((current_mode = lspcon_get_current_mode(lspcon)) == mode, 400);
>> + wait_for((current_mode = lspcon_get_current_mode(lspcon)) == mode,
>> + lspcon_get_mode_settle_timeout(lspcon));
>>   if (current_mode != mode)
>>   drm_err(&i915->drm, "LSPCON mode hasn't settled\n");
