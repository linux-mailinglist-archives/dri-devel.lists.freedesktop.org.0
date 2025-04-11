Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A61A856A6
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 10:35:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EB2910EB38;
	Fri, 11 Apr 2025 08:35:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ocZhzBPb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37CBA10EB38
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 08:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744360548;
 bh=+9AbACK5K6GlC+ll7IX0NZn7vGxKN9QF2fW0BIOEzKI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ocZhzBPbK1nk7t+xQ27xK7ppksn+DK2uKAxqV98S1qXuZstwXZrsZZIzXrPUnxIhD
 ykJADh+etnfRyNnwtFdbrjl/h8fuBN3yTZWwXh9PXZGVmksEArM4KV4In8WhbAL9Pf
 0QpiVfmb+11WcJPnea9GStdZdc74GdBH481069e9Fl7ldNjdhxt2NekSXKWFGJOfn/
 ZYIdURYSydTcVHv8S8LWGgKSN5SYNVyTtAMtYZqarBIL+EDEcLx3poc/ChvMeVc7i6
 57w9sMvpuV1cAkkH5TuLf+/rFIORzRL4bGK5h32/wJllz/tY8C4CUT9ow7UTSvezf3
 kCHakW8OA5QbQ==
Received: from [192.168.50.250] (unknown [171.76.80.238])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E1C4B17E0EB8;
 Fri, 11 Apr 2025 10:35:44 +0200 (CEST)
Message-ID: <cd1329ef-05ad-4598-804e-7801ddb1025d@collabora.com>
Date: Fri, 11 Apr 2025 14:05:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] drm/ci: Add devicetree validation and KUnit tests
To: Helen Koike <koike@igalia.com>, dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, daniel@fooishbar.org, helen.fornazier@gmail.com,
 airlied@gmail.com, simona.vetter@ffwll.ch, robdclark@gmail.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 valentine.burley@collabora.com, lumag@kernel.org, quic_abhinavk@quicinc.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org
References: <20250409061543.311184-1-vignesh.raman@collabora.com>
 <ef5b7030-c38a-44b9-b0bd-28ea6adb17c2@igalia.com>
 <a16c70e0-9078-4a21-9fa1-ca9d33823ff2@collabora.com>
 <2266002e-372d-434c-a2f5-282166e28c70@igalia.com>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <2266002e-372d-434c-a2f5-282166e28c70@igalia.com>
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

Hi Helen,

On 10/04/25 20:10, Helen Koike wrote:
> 
> 
> On 10/04/2025 05:07, Vignesh Raman wrote:
>> Hi Helen,
>>
>> On 09/04/25 23:53, Helen Koike wrote:
>>> Hi Vignesh,
>>>
>>> Thank you for your patch.
>>>
>>> On 09/04/2025 03:15, Vignesh Raman wrote:
>>>> Add jobs to validate devicetrees and run KUnit tests.
>>>>
>>>> Pipeline link,
>>>> https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1400550
>>>
>>> I see the checks are in the same stage as build, does it make sense 
>>> to create another stage? Similar to what was proposed on kci-gitlab?
>>>
>>> Also, I don't think it make sense for kunit to be in the build stage. 
>>> Maybe in software-driver? Since kunit runs on a qemu.
>>
>> We can add a `test` stage for kunit and a `static-checks` stage for 
>> devicetree validation and check patch. What do you think?
> 
> Ack on static-checks stage.

I will update it.

> 
> `test` stage confuses me, because all the other stages with driver names 
> are also tests, this is why I suggested to move to `software-driver`.
> 
> Or maybe we could just have a kunit stage for now.

Yes, we can add kunit stage. Let the `software-driver` have only vkms 
and virtio-gpu tests.

Regards,
Vignesh

> 
> Helen
> 
>>
>> Regards,
>> Vignesh
>>
>>>
>>> Helen
>>>
>>>>
>>>> Link to v1,
>>>> https://lore.kernel.org/all/20250327160117.945165-1- 
>>>> vignesh.raman@collabora.com/
>>>>
>>>> Vignesh Raman (2):
>>>>    drm/ci: Add jobs to validate devicetrees
>>>>    drm/ci: Add jobs to run KUnit tests
>>>>
>>>>   drivers/gpu/drm/ci/check-devicetrees.yml | 43 ++++++++++++++++++++ 
>>>> ++++
>>>>   drivers/gpu/drm/ci/dt-binding-check.sh   | 16 +++++++++
>>>>   drivers/gpu/drm/ci/dtbs-check.sh         | 19 +++++++++++
>>>>   drivers/gpu/drm/ci/gitlab-ci.yml         |  2 ++
>>>>   drivers/gpu/drm/ci/kunit.sh              | 11 ++++++
>>>>   drivers/gpu/drm/ci/kunit.yml             | 32 ++++++++++++++++++
>>>>   6 files changed, 123 insertions(+)
>>>>   create mode 100644 drivers/gpu/drm/ci/check-devicetrees.yml
>>>>   create mode 100755 drivers/gpu/drm/ci/dt-binding-check.sh
>>>>   create mode 100755 drivers/gpu/drm/ci/dtbs-check.sh
>>>>   create mode 100755 drivers/gpu/drm/ci/kunit.sh
>>>>   create mode 100644 drivers/gpu/drm/ci/kunit.yml
>>>>
>>>
>>
> 

