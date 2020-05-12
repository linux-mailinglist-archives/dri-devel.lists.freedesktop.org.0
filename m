Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8CA1CEE61
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 09:43:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0856F891D1;
	Tue, 12 May 2020 07:43:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C4CE891D1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 07:43:35 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id e1so132033wrt.5
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 00:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=gVnM/EQ8o19sAm00YeWDExyQ15AhvZ/CP0yugqf/m2I=;
 b=fEy6ye88lG5c0HbDzTYLs2pZIQXpJDnfEzFdf8V89rJT+m32XDjPARvLY578SyBSZS
 O3Mv3oKt6vxxg99mAVESi3xy4eipB2bDcvt8Z1wCkbLEJUtEkrEPddNZ8EDg70cBnr/J
 /RUczdimV2yY1aVpgP0VBG+GEWHKfqAokYtKf6d1M/AajC0hh4B3d/OO0tbiFjVBemfc
 jrYg0qUmek7g2J9lZ+DYrgkBML6fI2qkPUfBjosgmoAiI82u4MOHL2hTW7rxJ46U5o6O
 98SsJurKOM16XcYuY3elWJH2eZ0yro9JDcl/RF3bl8uX0WY+OKSHQXkoEf8+LtcrYS+J
 4scA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=gVnM/EQ8o19sAm00YeWDExyQ15AhvZ/CP0yugqf/m2I=;
 b=dwH1bZc/ZyfsjwGtP6xww7tJld0pUUKWbEvqwvc1LtDSzPTVfHF/6hYURmwsr2c0qs
 ECfPvJT+MTdYcGyygd3uVToHdCMnqGfxpuNFLHk3TivLb4mpDo7uO2g6i5A89MyGxvWv
 NfFFXX6auqQNHwYxpSXq5XuTeZ2MIOI3yLsaXpKE0pbepH1Tzktl+YyKA3SD9suSc2lT
 VnfCibBnXgzt+ZblZMdgc9+o/UO9eQhnSzUuEUECQ0/cOz+Iw4JJ1YWVTYFKqBCcAp1z
 Ob3bGkz1q31Qi+oiPJ6v6Fz1Y5Fe3e7Mcp7j/JTwksnA6rvuhTnqG2+akgZuHzcGSMxk
 d4Lw==
X-Gm-Message-State: AGi0PuaUx8ndxV9msQLho5/2J/LrFTs4zIM46FR4T4RvxPPVBH5Y+eUe
 lkR3EqPnpPdc0CycoEwmsU0cpy+d
X-Google-Smtp-Source: APiQypLIZEn8yMCT+Z6ZXNC4FHZcjIg+rSC6ElsrPs7oqsfSysKsHsFAdgc1G7EE9/+sUD5epunxTg==
X-Received: by 2002:adf:d849:: with SMTP id k9mr23561024wrl.304.1589269413774; 
 Tue, 12 May 2020 00:43:33 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id v11sm21814017wrv.53.2020.05.12.00.43.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 May 2020 00:43:33 -0700 (PDT)
Subject: Re: [RFC] Remove AGP support from Radeon/Nouveau/TTM
To: Alex Deucher <alexdeucher@gmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
References: <d249c339-fa3f-4440-bbc8-c9cf08338174@physik.fu-berlin.de>
 <CADnq5_NkD4+AMbNJceOJVSeBbJNQ3KDJq-kb7aHyF2jW8Y6dOA@mail.gmail.com>
 <21a0d2ba-c27d-6b12-678e-89c04dc64a82@physik.fu-berlin.de>
 <CADnq5_MQWJF5MB-1JyVeXCU8EAK2P-g+P13dR7eRKLkP8YmFqA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <eae15db3-1817-2a1d-fc5a-87b45c376bae@gmail.com>
Date: Tue, 12 May 2020 09:43:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CADnq5_MQWJF5MB-1JyVeXCU8EAK2P-g+P13dR7eRKLkP8YmFqA@mail.gmail.com>
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
Reply-To: christian.koenig@amd.com
Cc: "debian-powerpc@lists.debian.org" <debian-powerpc@lists.debian.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 11.05.20 um 22:46 schrieb Alex Deucher:
> On Mon, May 11, 2020 at 4:41 PM John Paul Adrian Glaubitz
> <glaubitz@physik.fu-berlin.de> wrote:
>> On 5/11/20 10:05 PM, Alex Deucher wrote:
>>>>> For Nouveau I'm not 100% sure, but from the code it of hand looks like we can do it similar to Radeon.
>>>>>
>>>>> Please comment what you think about this.
>>>> I would be against such a move as AGP graphics is still used by people running the powerpc
>>>> and ppc64 Debian ports on their vintage hardware [1].
>>>>
>>>> I have also CC'ed the debian-powerpc mailing list so that other users can voice their
>>>> opinion.
>>> Note there is no loss of functionality here, at least on radeon
>>> hardware.  It just comes down to which MMU gets used for access to
>>> system memory, the AGP MMU on the chipset or the MMU built into the
>>> GPU.  On powerpc hardware, AGP has been particularly unstable, and
>>> IIRC, AGP has been disabled by default on radeon on powerpc for a
>>> while.
>> Do you have a code reference at hand for this bit of information (AGP
>> being disabled on Macs)?
> It was disabled 2 years ago:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=037d1a66ae640ca2723f47c0115ffa9e603699b3

To be honest from the hacks we have in there to get this working I'm 
even surprised that this ever worked at all on PowerPC.

Going to extend this patch for now and add a config option to not 
compile in AGP GART support for TTM any more instead of removing it.

Christian.

>
> Alex
>
>> Thanks,
>> Adrian
>>
>> --
>>   .''`.  John Paul Adrian Glaubitz
>> : :' :  Debian Developer - glaubitz@debian.org
>> `. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
>>    `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
