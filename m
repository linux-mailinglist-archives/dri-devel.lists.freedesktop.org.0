Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D564989B7F
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 09:32:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC56A10E3A9;
	Mon, 30 Sep 2024 07:32:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Oz0MJoD/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED1C510E10C;
 Mon, 30 Sep 2024 07:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1727681531;
 bh=M3ZGR3m5dE/OcpAuJgNW07sMzVd9xcG6hbRIN3GQi5s=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Oz0MJoD/WjoceXAqgBvUNpAstd9dV0jBR191CXDs3DaHEQv8fB6tEEkb3khrgiisE
 nh7tdsJ05/IcW/muYpcMYD2UbZ59bvLNKjDb7A7RsthSIIYy9ISk7EtNcjZZJJ/j4b
 46HY0ZSLujeCZ2Euue+8cxgFYaU/00AGdTSqrFGu+tvTdK4XrGCbrxAmA25H//DWD1
 gnBnOgQkZjyB3Rxtdykg0mDYBmcB8VRkDHDSZOdUCxlY8BYcGNoed0Ur7HnpY3zSJe
 +ONzA6kcS7zMAeoKr1mZ7/oMykf0KM1jTOBErKvVlvh8ykoNrOxERefW/OQ7/gJea/
 VGMkeeuORJQXg==
Received: from [192.168.50.250] (unknown [171.76.80.165])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9E73717E1047;
 Mon, 30 Sep 2024 09:32:07 +0200 (CEST)
Message-ID: <5fd48673-571a-4750-9704-e172f7ea372f@collabora.com>
Date: Mon, 30 Sep 2024 13:01:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] docs/gpu: ci: update flake tests requirements
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
 helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, deborah.brouwer@collabora.com,
 dmitry.baryshkov@linaro.org, mripard@kernel.org, quic_abhinavk@quicinc.com,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240927052416.1833889-1-vignesh.raman@collabora.com>
 <ZvbCzqvyeTI_j2cD@intel.com>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <ZvbCzqvyeTI_j2cD@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi Rodrigo,

On 27/09/24 20:05, Rodrigo Vivi wrote:
> On Fri, Sep 27, 2024 at 10:54:14AM +0530, Vignesh Raman wrote:
>> Update the documentation to specify linking to a relevant GitLab
>> issue or email report for each new flake entry. Added specific
>> GitLab issue urls for i915, msm and amdgpu driver.
>>
>> Acked-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # msm
>> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # msm
>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>> ---
>>
>> v2:
>> - Add gitlab issue link for msm driver.
>>
>> v3:
>> - Update docs to specify we use email reporting or GitLab issues for flake entries.
>>
>> ---
>>   Documentation/gpu/automated_testing.rst | 13 +++++++++----
>>   1 file changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/gpu/automated_testing.rst b/Documentation/gpu/automated_testing.rst
>> index 2d5a28866afe..03769b4a17cf 100644
>> --- a/Documentation/gpu/automated_testing.rst
>> +++ b/Documentation/gpu/automated_testing.rst
>> @@ -68,19 +68,24 @@ known to behave unreliably. These tests won't cause a job to fail regardless of
>>   the result. They will still be run.
>>   
>>   Each new flake entry must be associated with a link to the email reporting the
>> -bug to the author of the affected driver, the board name or Device Tree name of
>> -the board, the first kernel version affected, the IGT version used for tests,
>> -and an approximation of the failure rate.
>> +bug to the author of the affected driver or the relevant GitLab issue. The entry
>> +must also include the board name or Device Tree name, the first kernel version
>> +affected, the IGT version used for tests, and an approximation of the failure rate.
>>   
>>   They should be provided under the following format::
>>   
>> -  # Bug Report: $LORE_OR_PATCHWORK_URL
>> +  # Bug Report: $LORE_URL_OR_GITLAB_ISSUE
>>     # Board Name: broken-board.dtb
>>     # Linux Version: 6.6-rc1
>>     # IGT Version: 1.28-gd2af13d9f
>>     # Failure Rate: 100
>>     flaky-test
>>   
>> +Use the appropriate link below to create a GitLab issue:
>> +amdgpu driver: https://gitlab.freedesktop.org/drm/amd/-/issues
>> +i915 driver: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues
> 
> Probably good to add:
> 
> xe driver: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues

Sure, will add it.

> 
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Thanks.

> 
>> +msm driver: https://gitlab.freedesktop.org/drm/msm/-/issues
>> +
>>   drivers/gpu/drm/ci/${DRIVER_NAME}-${HW_REVISION}-skips.txt
>>   -----------------------------------------------------------
>>   
>> -- 
>> 2.43.0
>>

Regards,
Vignesh
