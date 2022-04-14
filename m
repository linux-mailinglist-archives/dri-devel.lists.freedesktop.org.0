Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F70500626
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 08:33:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E20510FC64;
	Thu, 14 Apr 2022 06:33:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77ADD10FB7D;
 Thu, 14 Apr 2022 06:33:38 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id p189so2406723wmp.3;
 Wed, 13 Apr 2022 23:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=P6NSa06ic1ji0UcmZ1yHukODcPriVD98h31wR7n6AnA=;
 b=ZpxlOBKGanA1l/Il6QXoyxMCCnrOMiozvRqVrD+FV4n7IbsKsZbpQUufLoN+mTJL+L
 zMWqmHIJRKFDQCBYfz1cbwlqQT5KQvL49BOZZ6DQIRm5g6JTUmBs3QRNDJFsrHfdj39j
 sHibCoB5N5KHXka7jOhalatRPEz6BY21WYJu3iC3yZ04K/XLDUaEgR66ntz8nhiCV/1B
 uSB1W3k0Gy6gbDCloL5XJ1BqKVA03keqH3sZREzla2w5qj+KyDfjozsA68tyb1EB7k8Z
 YqTaZL0Hvj6LewuhC0FGp+hq/CVH5Z9CKieelEChxdMOqGk4UySotmajswT/o0aDdatX
 QOiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=P6NSa06ic1ji0UcmZ1yHukODcPriVD98h31wR7n6AnA=;
 b=Zf23fFowfJ7JEtIDStz+MbZBBzKNB7ofhrz1Avyx4jK5T5Jw2NKw+oo+0dOxnwneuS
 xXR3OeCkFhT7A4pbswk7dbvvyiPoj6ClmnUoistPRm15K3inMj3KoEVfZr+h5DZQc7bn
 VUPDJr6rdApnYU2crwc4gGaAr/n44xWYIsZhT19uIHiv27EiWXUJfGnrCrMGiFgi9H7J
 S7AbpJIs6UR75/631I4Xz4bwCylYrPuJRpa3mMn4C6hA++ccLWfz8a+eAS+VGU6fN06+
 tjZ9Sqhumppos9+y1lXdw7QdAUCqdNmvzW0gUM6VGnnO4cnCTI5hq3xfSJKDh6zzmw6d
 Imxw==
X-Gm-Message-State: AOAM532OEgv9qsyFHyP1B+6m8ZQHmykkzo8iqxve+VPxLRLKInfff6EK
 ClyceAh2wR+NNwmmpzFY2ko=
X-Google-Smtp-Source: ABdhPJyLxEgEjbyFvprQGHVQE5vSxRc2tZt6gudEw0oRiDwi2YAB6zAa8j3Bzz2C399evdu1uxdokQ==
X-Received: by 2002:a7b:c14d:0:b0:38e:b9ad:52fa with SMTP id
 z13-20020a7bc14d000000b0038eb9ad52famr1604834wmi.19.1649918016865; 
 Wed, 13 Apr 2022 23:33:36 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:be69:3200:82e8:2cff:fe51:d2c8?
 ([2a02:a03f:be69:3200:82e8:2cff:fe51:d2c8])
 by smtp.gmail.com with ESMTPSA id
 i4-20020a05600c354400b0038e9c5924d6sm4701514wmq.29.2022.04.13.23.33.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Apr 2022 23:33:36 -0700 (PDT)
Message-ID: <9d497fb9-4504-9e64-1d7f-9353cf96624c@gmail.com>
Date: Thu, 14 Apr 2022 08:33:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: commit 15512021eb3975a8c2366e3883337e252bb0eee5 causes white
 spots in console screens
Content-Language: fr-moderne
To: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
References: <0da21aec-d299-1834-99f3-9a598e4649f7@gmail.com>
 <87v8vcgb63.fsf@intel.com> <20220414063139.GA31013@intel.com>
From: =?UTF-8?Q?Fran=c3=a7ois_Valenduc?= <francoisvalenduc@gmail.com>
In-Reply-To: <20220414063139.GA31013@intel.com>
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

Le 14/04/22 à 08:31, Lisovskiy, Stanislav a écrit :
> On Wed, Apr 13, 2022 at 08:12:20PM +0300, Jani Nikula wrote:
>> On Wed, 13 Apr 2022, François Valenduc <francoisvalenduc@gmail.com> wrote:
>>> Commit 15512021eb3975a8c2366e3883337e252bb0eee5
>>> (15512021eb3975a8c2366e3883337e252bb0eee5) causes a lof of white spots
>>> to appears on the right upper corner of all console screens (see
>>> https://drive.google.com/file/d/13GabEvOIKSAj5yox6ybAZEDu3Ixncw5Q/view).
>>> git-bisect shows that this is the offending commit and if I revert it,
>>> the problem goes away. The problem still occurs with kernel 5.18-rc2 and
>>> to all stable trees where it was applied.
>>> Can somebody explains what happens ?
>>>
>>> The video card is the following: VGA compatible controller: Intel
>>> Corporation WhiskeyLake-U GT2 [UHD Graphics 620] (rev 02) (prog-if 00
>>> [VGA controller])
>>>
>>> Please tell me if you need more info.
>> That's commit 15512021eb39 ("drm/i915: Workaround broken BIOS DBUF
>> configuration on TGL/RKL"), adding Cc's.
>>
>> Please file a report at fdo gitlab [1] and attach dmesg etc. there.
> That commit looks like it is just disabling all the planes, if wrong
> dbuf/wm configuration is detected.
> However it should do that only once during boot as I understand.
>
> Are you sure that is exactly this commit which is causing this?
> Does the issue appear always?
>
> Ville Syrjälä, thoughts?
>
> Stan
>
>> Thanks,
>> Jani.
>>
>>
>> [1] https://gitlab.freedesktop.org/drm/intel/wikis/How-to-file-i915-bugs
>>
>>
>> -- 
>> Jani Nikula, Intel Open Source Graphics Center

As I said, git-bisect shows it's the offending commit and if I revert 
it, the problem doesn't happens. Otherwise, it always occurs.

François

