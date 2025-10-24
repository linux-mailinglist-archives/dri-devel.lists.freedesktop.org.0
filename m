Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7059DC08553
	for <lists+dri-devel@lfdr.de>; Sat, 25 Oct 2025 01:40:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01CA210E060;
	Fri, 24 Oct 2025 23:40:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TapAQnrx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A196810E060
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 23:40:35 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-29470bc80ceso28933505ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 16:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761349235; x=1761954035; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qqP5SuAkGaJ6RG6hOh0SZayfv/af2QObYCkolbIehz8=;
 b=TapAQnrxd2sobPN7DkYhre2QM0FPkINubEvmjzT+hNNAKA7VHw9WMP73j/QhhVi+U7
 UuJbjrMgMWYsHMbrWw+TDF18JzG68AXEFySgMHxqRE9ScLDe5waJAs5my0Aj6sNxwX47
 UXpB+Vs01J5UxFbtprbqRdMYndXxrj3JphAuJmD66b24Pkt21JYgyzCwh4NQygORS0pM
 n53Jylx8f7PR9IAL1BNqJ2ACUjlrhoqZzKWM1GXUp3g3BkIisGU0iOwhf6VbjpzCaCMj
 u7EIyEeLVCPo+R6vTsSlas0kZ80s2Qa4dawLr33JOQFHjbdmWZvlrG1RocUbpejO55RR
 Itvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761349235; x=1761954035;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qqP5SuAkGaJ6RG6hOh0SZayfv/af2QObYCkolbIehz8=;
 b=R3Mf2PfJem1ONg1RnNbyYTNjJpA7SQozc6t1abbc85RiXXzJdB6LDnaQg2tLvdY/1p
 enPCznvXCTPI+rcCHc+cWhd6CnxnX5+yuwx3IMvDzOxBoCywVMfU29GomZrbwaqdKGuD
 m8sCqJ2E98z3lllprCAnfgtIIC+C2aQ6RtvVk2RqXJaFQDnt3a3bpLj2pVICRlncw95+
 sTvN1rzGqoAIv0UM82g7+R7cfRLMNxBcoo54inKUBHfAMFT870BHXVkpdjkrE8F+Xf4f
 hZr5cyxmZZOBlFkWDmwt+vLQyMu6Gcoiyyk7zSWjWRavCA4sN6rrjUydK5v+IUr0Yxxm
 SxnQ==
X-Gm-Message-State: AOJu0Ywm9+uUsVA1qnHbTId+Aul+IcFTYsxMfoTgmmbUiiveGXPzil8l
 XgoODkvnJrQvODb82x2v5HmjZnyIwQC8W5tVYNQaMn2zyef46hGHVM/t
X-Gm-Gg: ASbGnct2O9GiA8qMVH4q/J8nD+AuMxGtSdXF/sgrQRpFbo00PdsRe8S7YDEnAGH56MS
 /tefS+vZaYnQcyyhXEs9J5BZiRaVVmUtZi/jhGukZNfZhcsyAJNuxlJmCwkrfELDybfeu5Gtljk
 Tos4tyEoSbV2wruyCPY3qH5fp6Ey2Apw5lYWJoLeDwTx9oSxRX+je5G3OyKqasLVXRM2BfzMVyx
 5FzwtXagiS6g3BoSDYHhVjoc9G41fOE+bqURrWdJFAvz8O87lmcsNCXavzL3Ds4mqmSRmZXP3Vu
 cQbU8g99RIVig11704vfsuG3y4PEF6cj/bBSw4DSRNOCHRSB5xiL1uRdYBigai2oH3dnL4g25ou
 lGF/dvaepVMUZ5yMw3o9TIKPN29Sqjw+yhxVTEGjR7ZqjsdGTpQI+s2tbd6oZkEWqFYkFSDSwNT
 0O9DOUcyU8WL3IZHQuJFfRD2LWSXTubzWMg3sJJbvz68JSMi+oLIngjOCz9zA+
X-Google-Smtp-Source: AGHT+IGmljlFqxKaoLUBNWWhhLXqxmD/AGAuAbaOp3NrSOLjBnaDmgbR1ag9luX/A0wo93vsh9u7Mg==
X-Received: by 2002:a17:902:f705:b0:294:9132:75d2 with SMTP id
 d9443c01a7336-294913289fcmr28727695ad.25.1761349235081; 
 Fri, 24 Oct 2025 16:40:35 -0700 (PDT)
Received: from ?IPV6:2601:1c0:5780:9200:47dc:e064:b621:fd5a?
 ([2601:1c0:5780:9200:47dc:e064:b621:fd5a])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29498d2789bsm4025335ad.62.2025.10.24.16.40.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Oct 2025 16:40:34 -0700 (PDT)
Message-ID: <f30cee98-1069-4f71-9aa9-613967f9922a@gmail.com>
Date: Fri, 24 Oct 2025 16:40:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/vblank: downgrade vblank wait timeout from WARN to
 error
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, maxime.ripard@kernel.org,
 airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 syzbot+147ba789658184f0ce04@syzkaller.appspotmail.com
References: <20251003032303.16518-1-chintanlike@gmail.com>
 <65f8a544-175a-4021-aa2a-9a9faf2f4254@suse.de>
Content-Language: en-US
From: Chintan Patel <chintanlike@gmail.com>
In-Reply-To: <65f8a544-175a-4021-aa2a-9a9faf2f4254@suse.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

Thank you Thomas for suggestions!

On 10/24/25 06:58, Thomas Zimmermann wrote:
> Hi
> 
> Am 03.10.25 um 05:23 schrieb Chintan Patel:
>> When wait_event_timeout() in drm_wait_one_vblank() times out, the
>> current WARN can cause unnecessary kernel panics in environments
>> with panic_on_warn set (e.g. CI, fuzzing). These timeouts can happen
>> under heavy scheduling pressure or in rare cases of delayed vblank
>> handling, and are not always a kernel bug.
>>
>> Replace the WARN with drm_err() messages that report the timeout
>> without crashing the system. Developers can still enable drm.debug
>> to diagnose genuine problems.
>>
>> Reported-by: syzbot+147ba789658184f0ce04@syzkaller.appspotmail.com
>> Closes: https://syzkaller.appspot.com/bug?extid=147ba789658184f0ce04
>> Tested-by: syzbot+147ba789658184f0ce04@syzkaller.appspotmail.com
>> Signed-off-by: Chintan Patel <chintanlike@gmail.com>
>>
>> v2:
>>   - Drop unnecessary in-code comment (suggested by Thomas Zimmermann)
>>   - Remove else branch, only log timeout case
>>
>> v3:
>>   - Use drm_err() instead of drm_dbg_kms() (suggested by Ville Syrjälä)
>>   - Remove unnecessary curr = drm_vblank_count() (suggested by Thomas 
>> Zimmermann)
>>   - Fix commit message wording (“invalid userspace calls” → “delayed 
>> vblank handling”)
>> ---
>>   drivers/gpu/drm/drm_vblank.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
>> index 46f59883183d..0664aea1b924 100644
>> --- a/drivers/gpu/drm/drm_vblank.c
>> +++ b/drivers/gpu/drm/drm_vblank.c
>> @@ -1305,7 +1305,8 @@ void drm_wait_one_vblank(struct drm_device *dev, 
>> unsigned int pipe)
>>                    last != drm_vblank_count(dev, pipe),
>>                    msecs_to_jiffies(100));
> 
> Instead of replacing the drm_WARN(), could you please try to increase 
> the timeout? Let's say 1000 msec to be on the safe side.
> 

I tried it locally and also tested with syzbot after increasing the 
timeout to 1000 msec. The issue no longer reproduces with this change.

I’ll send v4 shortly with the updated timeout.


