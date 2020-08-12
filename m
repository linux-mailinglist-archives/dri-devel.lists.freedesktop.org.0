Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C7E242332
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 02:19:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BDDC6E87C;
	Wed, 12 Aug 2020 00:19:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AC126E87C
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 00:19:21 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f33351e0000>; Tue, 11 Aug 2020 17:17:34 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 11 Aug 2020 17:19:20 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 11 Aug 2020 17:19:20 -0700
Received: from [172.20.40.57] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 12 Aug
 2020 00:19:20 +0000
Subject: Re: [git pull] drm for 5.8-rc1
To: Karol Herbst <kherbst@redhat.com>
References: <CAPM=9txGww+omvateOTizZRV9_wLdAbq6uAz3DRa_S6bn1jQuQ@mail.gmail.com>
 <20200630230808.wj2xlt44vrszqfzx@box>
 <ef7816b4-72ee-9e0e-8cac-4d80d8343f9f@nvidia.com>
 <20200701075719.p7h5zypdtlhqxtgv@box> <20200701075902.hhmaskxtjsm4bcx7@box>
 <77e744b9-b5e2-9e9b-44c1-98584d2ae2f3@nvidia.com>
 <CAPj87rOrUHBZZR3cw+iqUMtZL1ZQyjd=RoM2yHt5oUeRO5uDTA@mail.gmail.com>
 <5ffa32db-4383-80f6-c0cf-a9bb12e729aa@nvidia.com>
 <a3d331e9-d17e-9135-68c7-8e3e10df184d@nvidia.com>
 <CAKMK7uG8x4dHrRnzK9FFrJbtWsdLk+TTObK9r-nSncKowHVe3A@mail.gmail.com>
 <CAPM=9twK34VyR2kwiR1jzxqys1Bng2Vt8FY6aQTvCe2GL0Zopg@mail.gmail.com>
 <261cd7c9-6853-3d5f-3a3e-86b65c9dba71@nvidia.com>
 <CACO55ttJwjh2HZsygwqA7HUeF5UMuP0=Y9RyZU=UJsf-gWGagA@mail.gmail.com>
X-Nvconfidentiality: public
From: James Jones <jajones@nvidia.com>
Message-ID: <ad64c242-95f3-d346-87f3-a9ac149dc3a2@nvidia.com>
Date: Tue, 11 Aug 2020 17:19:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CACO55ttJwjh2HZsygwqA7HUeF5UMuP0=Y9RyZU=UJsf-gWGagA@mail.gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1597191454; bh=WvdRZfIHNLNlRVBtYqMHKwdn+Ak/7SJQSEe0s1QirdA=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=anlkuBOc3WUazGl9dis8FTJItZHsykqZEfmkEab9pl/R2NUaWZLsBe3uYEF9Lyw+O
 Vpf4o87sYrsvCKqYYQJyRfbim90eZRWqhyJ4U50mhkJUXmekocaU4QIjtcgrDEs5eG
 wh16ysaVfm46plQudTcRnUOmIaOPpOnmECTQvPLtU43qOOJwVe/TyCSNQwtv6C97ik
 Ahtvk9OQub4KkCwjB9+9EsvZ/R37njDKAdZJ/k77YPMjaYVpxcu1I+uFMzzI1RSUpK
 6cgJdyo6CW/nOb/fsN1sVT9cfdpcNh3WlhUCZFdYDgmHMBvPnxhMbvcCxHX/WPKqbQ
 NNn94KqomePBA==
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sorry for the slow reply here as well.  I've been in the process of 
rebasing and reworking the userspace patches.  I'm not clear my changes 
will address the Jetson Nano issue, but if you'd like to try them, the 
latest userspace changes are available here:

   https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/3724

And the tegra-drm kernel patches are here:

 
https://patchwork.ozlabs.org/project/linux-tegra/patch/20191217005205.2573-1-jajones@nvidia.com/

Those + the kernel changes addressed in this thread are everything I had 
outstanding.

Thanks,
-James

On 8/4/20 1:58 AM, Karol Herbst wrote:
> Hi James,
> 
> I don't know if you knew, but on the Jetson nano we had the issue for
> quite some time, that GLX/EGL through mesa on X was broken due to some
> fix in mesa related to modifiers.
> 
> And I was wondering if the overall state just caused the issue we saw
> here and wanted to know what branches/patches I needed for the various
> projects to see if the work you have been doing since the last
> upstream nouveau regression would be of any help here?
> 
> Mind pointing me towards everything I'd need to check that?
> 
> I'd really like to fix this, but didn't have the time to investigate
> what the core problem here was, but I think it's very likely that a
> fixed/improved modifier support could actually fix it as well.
> Alternately I'd like to move to kmsro in mesa as this fixes it as
> well, but that could just be by coincidence and would break other
> devices..
> 
> Thanks
> 
> On Tue, Jul 14, 2020 at 4:32 PM James Jones <jajones@nvidia.com> wrote:
>>
>> Still testing.  I'll get a Sign-off version out this week unless I find
>> a problem.
>>
>> Thanks,
>> -James
>>
>> On 7/12/20 6:37 PM, Dave Airlie wrote:
>>> How are we going with a fix for this regression I can commit?
>>>
>>> Dave.
>>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
