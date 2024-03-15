Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3395687CCFD
	for <lists+dri-devel@lfdr.de>; Fri, 15 Mar 2024 13:01:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51A411121FE;
	Fri, 15 Mar 2024 12:01:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="1jxPqcrx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC3471121FE
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 12:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1710504059;
 bh=wo5KaJTO7g4XTsjvDT5W1hhUtD1zGfjPtDK9XkU/fsw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=1jxPqcrx/ox/m1AOEkf/cnIgOag7fS4EFgxhaRQR6tv37YpNkhmjwMdziiVEDa5Ii
 RNa47ceM168TpFQcoHUTRQsLKpALlajcmXvRzc3Aw6eyITrsBKbWXLiIS7XmVwchyD
 h5lL1gNiFConcL3rmgtDIyYiVK6Hc82QbbabKl1p1QQnWDyh/PcK2+4k9dGRIziPs/
 rhPXT6O2yWCSelSqW+RmWE/S9PbgExcDvLe0LyzkQ2OUNEKrRDltU0nCcQ724VDc9W
 hnpyxuJitqatKY1oiW2YO9yXCgvwSlEH269TMeWB26+lPF9wKOwdYMIzVLOQ1YhbCX
 vi5pfjpYCvEEA==
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id D3E8A378105A;
 Fri, 15 Mar 2024 12:00:53 +0000 (UTC)
Message-ID: <00b4af3b-bbb6-4057-969f-5882220858a3@collabora.com>
Date: Fri, 15 Mar 2024 09:00:50 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/11] drm/ci: uprev IGT and update testlist
To: Vignesh Raman <vignesh.raman@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 emma@anholt.net, robdclark@gmail.com, david.heidelberg@collabora.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, mairacanal@riseup.net, mcanal@igalia.com,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240306030649.60269-1-vignesh.raman@collabora.com>
 <20240306030649.60269-4-vignesh.raman@collabora.com>
 <4f927c99-9ea2-424e-85a7-bd05d0817dab@collabora.com>
 <af5b6e38-306d-ae79-42af-88e6e9a32cff@collabora.com>
Content-Language: en-US
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <af5b6e38-306d-ae79-42af-88e6e9a32cff@collabora.com>
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



On 15/03/2024 08:12, Vignesh Raman wrote:
> Hi Helen,
> 
> On 07/03/24 19:05, Helen Koike wrote:
>>
>>
>> On 06/03/2024 00:06, Vignesh Raman wrote:
>>> Uprev IGT and add amd, v3d, vc4 and vgem specific
>>> tests to testlist. Have testlist.txt per driver
>>> and include a base testlist so that the driver
>>> specific tests will run only on those hardware.
>>> Also add testlists to the MAINTAINERS file.
>>>
>>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>>> ---
>>>
>>> v3:
>>>    - New patch in series to uprev IGT and update testlist.
>>>
>>> v4:
>>>    - Add testlists to the MAINTAINERS file and remove amdgpu xfails 
>>> changes.
>>>
>>> ---
>>>   MAINTAINERS                              |  11 ++
>>>   drivers/gpu/drm/ci/gitlab-ci.yml         |   2 +-
>>>   drivers/gpu/drm/ci/igt_runner.sh         |  12 +-
>>>   drivers/gpu/drm/ci/testlist-amdgpu.txt   | 151 +++++++++++++++++++++++
>>>   drivers/gpu/drm/ci/testlist-msm.txt      |  50 ++++++++
>>>   drivers/gpu/drm/ci/testlist-panfrost.txt |  17 +++
>>>   drivers/gpu/drm/ci/testlist-v3d.txt      |  73 +++++++++++
>>>   drivers/gpu/drm/ci/testlist-vc4.txt      |  49 ++++++++
>>>   drivers/gpu/drm/ci/testlist.txt          |  84 ++++++-------
>>>   9 files changed, 398 insertions(+), 51 deletions(-)
>>>   create mode 100644 drivers/gpu/drm/ci/testlist-amdgpu.txt
>>>   create mode 100644 drivers/gpu/drm/ci/testlist-msm.txt
>>>   create mode 100644 drivers/gpu/drm/ci/testlist-panfrost.txt
>>>   create mode 100644 drivers/gpu/drm/ci/testlist-v3d.txt
>>>   create mode 100644 drivers/gpu/drm/ci/testlist-vc4.txt
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 3bc7e122a094..4da66ca92f1a 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -1665,6 +1665,8 @@ L:    dri-devel@lists.freedesktop.org
>>>   S:    Supported
>>>   T:    git git://anongit.freedesktop.org/drm/drm-misc
>>>   F:    Documentation/gpu/panfrost.rst
>>> +F:    drivers/gpu/drm/ci/testlist-panfrost.txt
>>> +F:    drivers/gpu/drm/ci/testlist.txt
>>
>> I wonder if we should have both here, since the second is not used right?
> 
> Yes, we need to use both here. testlist-panfrost.txt includes 
> testlist.txt. So we have moved the driver specific tests to
> testlist-panfrost.txt and have a base testlist.txt.
> 
> 
>>> diff --git a/drivers/gpu/drm/ci/igt_runner.sh 
>>> b/drivers/gpu/drm/ci/igt_runner.sh
>>> index f1a08b9b146f..77cd81fe6d1a 100755
>>> --- a/drivers/gpu/drm/ci/igt_runner.sh
>>> +++ b/drivers/gpu/drm/ci/igt_runner.sh
>>> @@ -74,10 +74,20 @@ if ! grep -q "core_getversion" 
>>> /install/testlist.txt; then
>>>   fi
>>>   set +e
>>> +if [ "$DRIVER_NAME" = "amdgpu" ]; then
>>> +    TEST_LIST="/install/testlist-amdgpu.txt"
>>> +elif [ "$DRIVER_NAME" = "msm" ]; then
>>> +    TEST_LIST="/install/testlist-msm.txt"
>>> +elif [ "$DRIVER_NAME" = "panfrost" ]; then
>>> +    TEST_LIST="/install/testlist-panfrost.txt"
>>> +else
>>> +    TEST_LIST="/install/testlist.txt"
>>> +fi
>>
>> Maybe simplify this with:
>>
>> TEST_LIST="/install/testlist-$DRIVER_NAME.txt"
>>
>> if [ ! -f "$TEST_LIST" ]; then
>>      TEST_LIST="/install/testlist.txt"
>> fi
> 
> Yes, this is much better. Thanks.
> 
>>
>> Another question I have: shouldn't testlist-$DRIVER_NAME.txt and 
>> testlist.txt be merged? Or they are really mutually exclusive?
> 
> We have testlist-$DRIVER_NAME.txt per driver and it includes a base 
> testlist.txt

I'm confused, it seems that from the code or it uses 
testlist-$DRIVER_NAME.txt or it uses testlist.txt, you don't merge them 
by code, which means that drivers don't need to follow changes to 
testlist.txt.

If testlist-$DRIVER_NAME.txt already includes tests in testlist.txt, 
than testlist.txt doesn't need to be added in the MAINTEINERS file in 
all drivers.

Helen

> 
> Regards,
> Vignesh
