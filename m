Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 438D4A5EBC3
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 07:31:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6021A10E0F5;
	Thu, 13 Mar 2025 06:31:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="AE/Wt8a4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00AA410E02B;
 Thu, 13 Mar 2025 06:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1741847495;
 bh=r9wOzZAb7lh74joaS/3Q8N4jgKKEEgxKxSDaj1n8jHs=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=AE/Wt8a4kPLLiHdH/OKdrQl3Hum7kZPqP6rP6CikppGajHzQaRyqWJge8hO6LRKIf
 9Xrf1WBtlp7RZxOV1kRcMg/X1/D9zZk/AL85JkkRGUz2m2xQERI/KjX72eDw7UjEvr
 S+/JQ/bfgQ0V2dN9wj7e6NFur3MAbCuy7/sHgj0ToexfqtvjL1GGreKz5IRsUkyI4X
 SvYramnoCq2kBkcyjMLWN0GqvyTQdYc3HfQY43zJPFp1iOrgzB5Rac5D3VWXZ1D1g2
 MRYJqm3cOuQ6VIGvRqPylgP+hNojpMc5lr/ukPavLPEUyOP7oAGjJONk9krMjfSvwF
 p1H1x0ukgql3g==
Received: from [192.168.50.250] (unknown [171.76.87.92])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0584117E1521;
 Thu, 13 Mar 2025 07:31:31 +0100 (CET)
Message-ID: <f716925c-d8f8-4713-9f02-a373297ab5a3@collabora.com>
Date: Thu, 13 Mar 2025 12:01:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/ci: add kms_cursor_legacy@torture-bo to apq8016
 flakes
From: Vignesh Raman <vignesh.raman@collabora.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 Helen Koike <helen.koike@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 lumag@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20241204-cursor_tor_skip-v2-1-f03bcbc4b455@quicinc.com>
 <cc9501d1-c779-4728-a609-ce83a73f46f6@collabora.com>
Content-Language: en-US
In-Reply-To: <cc9501d1-c779-4728-a609-ce83a73f46f6@collabora.com>
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

Hi Abhinav,

On 13/03/25 07:40, Vignesh Raman wrote:
> Hi Abhinav,
> 
> On 05/12/24 01:29, Abhinav Kumar wrote:
>>  From the jobs [1] and [2] of pipeline [3], its clear that
>> kms_cursor_legacy@torture-bo is most certainly a flake and
>> not a fail for apq8016. Mark the test accordingly to match the results.
>>
>> [1] : https://gitlab.freedesktop.org/drm/msm/-/jobs/67676481
>> [2] : https://gitlab.freedesktop.org/drm/msm/-/jobs/67677430
>> [3]: https://gitlab.freedesktop.org/drm/msm/-/pipelines/1322770
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>> Changes in v2:
>> - Fix the failure rate from 100 to 33 as thats the accurate one
>> - Link to v1: https://lore.kernel.org/r/20241204-cursor_tor_skip-v1-1- 
>> f5f0bba5df7b@quicinc.com
>> ---
>>   drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt b/ 
>> drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt
>> new file mode 100644
>> index 000000000000..2fb192c92559
>> --- /dev/null
>> +++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt
>> @@ -0,0 +1,5 @@
>> +# Board Name: msm-apq8016-db410c

Board name should the dtb name. In this case, apq8016-sbc-usb-host

# Bug Report: https://gitlab.freedesktop.org/drm/msm/-/issues/72

Please add the bug report link as well for flake test. I have created an 
issue in msm.

With this fixed,
Reviewed-by: Vignesh Raman <vignesh.raman@collabora.com>

Regards,
Vignesh


>> +# Failure Rate: 33
>> +# IGT Version: 1.28-ga73311079
>> +# Linux Version: 6.12.0-rc2
>> +kms_cursor_legacy@torture-bo
> 
> Reviewed-by: Vignesh Raman <vignesh.raman@collabora.com>
> 
> Regards,
> Vignesh
> 
>>
>> ---
>> base-commit: 798bb342e0416d846cf67f4725a3428f39bfb96b
>> change-id: 20241204-cursor_tor_skip-9d128dd62c4f
>>
>> Best regards,
> 

