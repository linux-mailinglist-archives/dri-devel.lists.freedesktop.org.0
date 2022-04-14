Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F2C5007EA
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 10:04:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B53310E287;
	Thu, 14 Apr 2022 08:04:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D35A010E287;
 Thu, 14 Apr 2022 08:04:41 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id p18so4967205wru.5;
 Thu, 14 Apr 2022 01:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2+GUwQFWQVz+FoO085UrDoEMf+chgpjpjyV/JrIb7Ao=;
 b=HfZXRNuodyWoeuKjI+Mc1RLcX2b1VMSXlNhIBN6Y4pfbcDkla45bwnya2Gibcn7AqH
 rzkrKua95RVVf3+4QRzn1YWn8K5rNKn4mrVNE0EzXZIRU4W4PNJD2FySsm0RMaK+8TlY
 btOR+h3umo66QJlEsbIug+V+E6Ar7Nx+nvv1iZPxpWsni9cSj0D35Bt2M8wGe5aY9bX3
 4FnxLQNvF5I8Me9I7skz8DjZrHuNaI/38otknjbRm2irmjJXnT7jTkbISucnlzkBVPEw
 oDopbC0IVqIamokwHucvV307qwA1nRs9VuhLfAgqbaO01FuWcGcmakM4U+s7xinY6Xar
 AtyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2+GUwQFWQVz+FoO085UrDoEMf+chgpjpjyV/JrIb7Ao=;
 b=hSKPkLvQ29MytPmWbg2xlNpM7PAyick68+EFC0z2Y63avwB7tY5tBZ84GMxt/PQgZr
 zEfwv366ICgm4KYFK9g+ecVPuJRghv8dxTdYcyZ6AX71wEDIc3QN2Zosoube75ZfVr4c
 hffDZtoS4t7fonYS56Spu3P1yAH8Ou7ls9NEnLHwpmeaMEYAv4ZBDwR7Y4oUILNn3xZa
 yslUM2n6bqKgdkOchI21MUeeIsjRrzC3F7zeA3nZ2lSxE90NlhLS3tgmpgxC+xKqliXp
 aUkFivCnl4+ND7z7H3ATrUMfHsrsMX9cPtlTGFP48Un1X4/rL5vYpMeI1ZLZh4DIQYWs
 RBgw==
X-Gm-Message-State: AOAM533pJIY4BLYfeR0UUKoWsfTWUBQM4IwztKMNScz/gA1yt9uia8j+
 mrkXt9no8BH4VCiGXkxUOrf1fQ2FO7lPVHbU7VA=
X-Google-Smtp-Source: ABdhPJxXAAvwLMFpOKpNtbM5+OY+DSZNWXGQEd1Y8OMhkLmnVW8ynTE8zuSlw/P4gmIScXaAnih5wQ==
X-Received: by 2002:a5d:47cf:0:b0:207:ac31:4175 with SMTP id
 o15-20020a5d47cf000000b00207ac314175mr1131077wrc.228.1649923480235; 
 Thu, 14 Apr 2022 01:04:40 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:be69:3200:82e8:2cff:fe51:d2c8?
 ([2a02:a03f:be69:3200:82e8:2cff:fe51:d2c8])
 by smtp.gmail.com with ESMTPSA id
 v8-20020a05600c214800b0038ec51d544csm1383043wml.27.2022.04.14.01.04.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 01:04:39 -0700 (PDT)
Message-ID: <1bcb195c-8c84-3641-7784-e7b7578bb40f@gmail.com>
Date: Thu, 14 Apr 2022 10:04:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: commit 15512021eb3975a8c2366e3883337e252bb0eee5 causes white
 spots in console screens
Content-Language: fr-moderne
To: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
References: <0da21aec-d299-1834-99f3-9a598e4649f7@gmail.com>
 <87v8vcgb63.fsf@intel.com> <20220414063139.GA31013@intel.com>
 <9d497fb9-4504-9e64-1d7f-9353cf96624c@gmail.com>
 <20220414080312.GA31389@intel.com>
From: =?UTF-8?Q?Fran=c3=a7ois_Valenduc?= <francoisvalenduc@gmail.com>
In-Reply-To: <20220414080312.GA31389@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Le 14/04/22 à 10:03, Lisovskiy, Stanislav a écrit :
> On Thu, Apr 14, 2022 at 08:33:35AM +0200, François Valenduc wrote:
>> Le 14/04/22 à 08:31, Lisovskiy, Stanislav a écrit :
>>> On Wed, Apr 13, 2022 at 08:12:20PM +0300, Jani Nikula wrote:
>>>> On Wed, 13 Apr 2022, François Valenduc <francoisvalenduc@gmail.com> wrote:
>>>>> Commit 15512021eb3975a8c2366e3883337e252bb0eee5
>>>>> (15512021eb3975a8c2366e3883337e252bb0eee5) causes a lof of white spots
>>>>> to appears on the right upper corner of all console screens (see
>>>>> https://drive.google.com/file/d/13GabEvOIKSAj5yox6ybAZEDu3Ixncw5Q/view).
>>>>> git-bisect shows that this is the offending commit and if I revert it,
>>>>> the problem goes away. The problem still occurs with kernel 5.18-rc2 and
>>>>> to all stable trees where it was applied.
>>>>> Can somebody explains what happens ?
>>>>>
>>>>> The video card is the following: VGA compatible controller: Intel
>>>>> Corporation WhiskeyLake-U GT2 [UHD Graphics 620] (rev 02) (prog-if 00
>>>>> [VGA controller])
>>>>>
>>>>> Please tell me if you need more info.
>>>> That's commit 15512021eb39 ("drm/i915: Workaround broken BIOS DBUF
>>>> configuration on TGL/RKL"), adding Cc's.
>>>>
>>>> Please file a report at fdo gitlab [1] and attach dmesg etc. there.
>>> That commit looks like it is just disabling all the planes, if wrong
>>> dbuf/wm configuration is detected.
>>> However it should do that only once during boot as I understand.
>>>
>>> Are you sure that is exactly this commit which is causing this?
>>> Does the issue appear always?
>>>
>>> Ville Syrjälä, thoughts?
>>>
>>> Stan
>>>
>>>> Thanks,
>>>> Jani.
>>>>
>>>>
>>>> [1] https://gitlab.freedesktop.org/drm/intel/wikis/How-to-file-i915-bugs
>>>>
>>>>
>>>> -- 
>>>> Jani Nikula, Intel Open Source Graphics Center
>> As I said, git-bisect shows it's the offending commit and if I revert it,
>> the problem doesn't happens. Otherwise, it always occurs.
>>
>> François
>>
> Does it just happen all the time or some steps/certain circumstances needed
> for it to happen?
>
> Only suspicion after looking briefly is that once suspend/resume is done
> it might be messing something up. Just a quick guess..
>
> Stan

It occurs permantently as soon as I boot my computer.

