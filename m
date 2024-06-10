Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1555890240A
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 16:28:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1BF110E179;
	Mon, 10 Jun 2024 14:28:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=w_armin@gmx.de header.b="BwY5lMQ1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D56A210E179;
 Mon, 10 Jun 2024 14:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1718029698; x=1718634498; i=w_armin@gmx.de;
 bh=P2dDVobPGm5/WzgyMOLT0I+ObxSNn8sZsi6grfiClNs=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=BwY5lMQ1HzprY0cD2thKxo+ufAL0mBlHVzJ2Nj8QaDWWwyug0d3YpL1LAJchIfHo
 OAWXobhj4tQ3ZTewxHi4rWYWshhTu3sTNRHYPl1iQU8q2UpR57oDO7memmGSwCW58
 mdpEVq9dsi+YBfPLdXw4cqlZrvT9TZnBWwlBIgjbIp3K0lLs2IM9iWBimF5KTPpxh
 lnqnyz5uuP6AHkqN+nJyu9jLsoBAHid3hV0Q+QrBz9W0TAqZloBAGArGmBzEMo+n/
 XcXCQFTQcLFOWOFfMJHCl9fUXgcpqeIZnSNlT4gRsWU1rrbAKV5MHQx5hkGhSmUcI
 D5Js7+4HGF0Yx6Ez+A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MHoN2-1sAg0S0ugg-00DQjC; Mon, 10
 Jun 2024 16:28:18 +0200
Message-ID: <fe03d95a-a8dd-4f4c-8588-02a544e638e7@gmx.de>
Date: Mon, 10 Jun 2024 16:28:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "drm/amdgpu: init iommu after amdkfd device init"
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "sashal@kernel.org" <sashal@kernel.org>
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "bkauler@gmail.com" <bkauler@gmail.com>, "Zhang, Yifan"
 <Yifan1.Zhang@amd.com>, "Liang, Prike" <Prike.Liang@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20240523173031.4212-1-W_Armin@gmx.de>
 <663b8003-3970-4293-930e-e19dce054e01@gmx.de>
 <33295481-6977-415f-abff-472bc6f24b9b@amd.com>
 <BL1PR12MB51446E6BADBA8D24D385DC46F7F82@BL1PR12MB5144.namprd12.prod.outlook.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <BL1PR12MB51446E6BADBA8D24D385DC46F7F82@BL1PR12MB5144.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:WGt7uYcLjosgIxS9oyDEFaVFeidKsw13pAkja8fLmnOSHkXBan9
 XcjV9o56cc+i62nHFrkDw7XvmghZL9UWfk4DnYf1aRw5upVFeBFBaAAFSpvF4rLSjUP8N25
 jgR316FiVOoZzcl6DgAFh09TFg0YvenXPhzswKY9RWDWAFJKKoizr8ibR3rMRfB4OlT/iiw
 XcSoA5+HReP1R0j9neJ8Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8G6odJ7JMWU=;ggoHekzPtWZir92BWzJGroAHglN
 nYrCw/42nbQQrDWZ9lwyYW714J5w8oPiucyOzmcvIaHgF3xjFDIJqkD7ykm4g5bhXxDXxGN90
 XFDwE90Hy5InEwA+AtOBzv97uU0bpt1cuwWaRitZttKGVOfStTw6SDtfZNYeUqnGX1vy2VMAQ
 2BczmvIJq4mbVeFD9gL6o6aNUjNQrPgIDLcaRCtPNTdeoqENB6PaTDc8Fd3KkmEAP6om83g/H
 ZvKRXI990gomRcvzjlVx5WoBWCTKOuV84GO4OWU1vzSLE5zXNLrnu/oFSh9S7sMKsZ8Bmfa5T
 EuOrii9UlXNqHqKfb3e6T7wanMOgyt/FXzNVs1MMmmzBClGCWLBBLGK7EDOSAV9Q/SbOmHHrY
 u6XLrp72ZFEaHVi0x27xXYsFC3H+owIXT2ewHEG4qcyjB4+lx60xrGqDcJzkDma0I4OLHpI7e
 Q7MVheZ01FYMm9LD3FWmfPGt5m4KMcVjMuRaETqHVWueYFTLIxYg02iwptwIHDSfli1FqFTPK
 I1/NfFSi7FAl5ccp4ehDKF1UF1bce3b8xEj29jruBiQV+j2KhIIg6nVA7lUzZ1DE6bJ3wRo/c
 ZosEtjvlp7G8zcUuEPccXt/wY3V0czHWaWyEceZ+9PrjekW/t/RfOUmta4DaGVBcvk8NxhHa0
 mCnP7fY3+M1gbeCbTIZk8rvHShaybVZU922CwFqsNR4dmU/aF2tdKk2BzlpP7J/AO+UflmyTh
 iBowJglwx7/KadKbv4qYqixGOCYU5b89gSTtmyJt7otP6JHbrI03bW95sTFKztwLYHDQtDzeh
 DDm0RZAGZpQp5b5wbOvLGKk/LkCgmJ7EYXV7ysLMoD0Q4=
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

Am 04.06.24 um 20:28 schrieb Deucher, Alexander:

> [AMD Official Use Only - AMD Internal Distribution Only]
>
>> -----Original Message-----
>> From: Kuehling, Felix <Felix.Kuehling@amd.com>
>> Sent: Tuesday, June 4, 2024 2:25 PM
>> To: Armin Wolf <W_Armin@gmx.de>; Deucher, Alexander
>> <Alexander.Deucher@amd.com>; Koenig, Christian
>> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>;
>> gregkh@linuxfoundation.org; sashal@kernel.org
>> Cc: stable@vger.kernel.org; bkauler@gmail.com; Zhang, Yifan
>> <Yifan1.Zhang@amd.com>; Liang, Prike <Prike.Liang@amd.com>; dri-
>> devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
>> Subject: Re: [PATCH] Revert "drm/amdgpu: init iommu after amdkfd device
>> init"
>>
>>
>> On 2024-06-03 18:19, Armin Wolf wrote:
>>> Am 23.05.24 um 19:30 schrieb Armin Wolf:
>>>
>>>> This reverts commit 56b522f4668167096a50c39446d6263c96219f5f.
>>>>
>>>> A user reported that this commit breaks the integrated gpu of his
>>>> notebook, causing a black screen. He was able to bisect the
>>>> problematic commit and verified that by reverting it the notebook wor=
ks
>> again.
>>>> He also confirmed that kernel 6.8.1 also works on his device, so the
>>>> upstream commit itself seems to be ok.
>>>>
>>>> An amdgpu developer (Alex Deucher) confirmed that this patch should
>>>> have never been ported to 5.15 in the first place, so revert this
>>>> commit from the 5.15 stable series.
>>> Hi,
>>>
>>> what is the status of this?
>> Which branch is this for? This patch won't apply to anything after Linu=
x 6.5.
> It's applicable to 5.15 stable only.  The original patch caused a regres=
sion on 5.15 so probably should not have been applied there.
>
> Alex
>
Correct, and i would be very grateful if this regression could be resolved=
 in the near future.
The user already wrote a blog post about the whole issue, see here:

https://bkhome.org/news/202405/kernel-amd-gpu-disaster-fixed.html

Thanks,
Armin Wolf

>> Support for IOMMUv2 was removed from amdgpu in Linux 6.6 by:
>>
>> commit c99a2e7ae291e5b19b60443eb6397320ef9e8571
>> Author: Alex Deucher <alexander.deucher@amd.com>
>> Date:   Fri Jul 28 12:20:12 2023 -0400
>>
>>       drm/amdkfd: drop IOMMUv2 support
>>
>>       Now that we use the dGPU path for all APUs, drop the
>>       IOMMUv2 support.
>>
>>       v2: drop the now unused queue manager functions for gfx7/8 APUs
>>
>>       Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
>>       Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>>       Tested-by: Mike Lothian <mike@fireburn.co.uk>
>>       Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>>
>> Regards,
>>     Felix
>>
>>
>>> Armin Wolf
>>>
>>>> Reported-by: Barry Kauler <bkauler@gmail.com>
>>>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>>>> ---
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 8 ++++----
>>>>    1 file changed, 4 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> index 222a1d9ecf16..5f6c32ec674d 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> @@ -2487,6 +2487,10 @@ static int amdgpu_device_ip_init(struct
>>>> amdgpu_device *adev)
>>>>        if (r)
>>>>            goto init_failed;
>>>>
>>>> +    r =3D amdgpu_amdkfd_resume_iommu(adev);
>>>> +    if (r)
>>>> +        goto init_failed;
>>>> +
>>>>        r =3D amdgpu_device_ip_hw_init_phase1(adev);
>>>>        if (r)
>>>>            goto init_failed;
>>>> @@ -2525,10 +2529,6 @@ static int amdgpu_device_ip_init(struct
>>>> amdgpu_device *adev)
>>>>        if (!adev->gmc.xgmi.pending_reset)
>>>>            amdgpu_amdkfd_device_init(adev);
>>>>
>>>> -    r =3D amdgpu_amdkfd_resume_iommu(adev);
>>>> -    if (r)
>>>> -        goto init_failed;
>>>> -
>>>>        amdgpu_fru_get_product_info(adev);
>>>>
>>>>    init_failed:
>>>> --
>>>> 2.39.2
>>>>
>>>>
