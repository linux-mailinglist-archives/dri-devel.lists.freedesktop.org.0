Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C24E485AD3E
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 21:33:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 306ED10E2C3;
	Mon, 19 Feb 2024 20:33:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="m3/JpcsH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 844AD10E252;
 Mon, 19 Feb 2024 20:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1708374829;
 bh=K6Ytl/lqMVYg6fJc17OpXmjO3ywU54h38AH2unjhRTg=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=m3/JpcsH8XjuXIte54zpm5HGEme+qIbQS8RZQ9EURDO5V808RmCC02iQpiroElPlr
 bByGoc6iJaiAQJFRHmc6ieCrGRt6dcCi6r1WSupmqB2GhSmSQoYGpH0f8JlJtV/m49
 9vIjlojQPt26XT28KM7ahDPyYtO+BsmNf5xSmDfE6MfICPwl2BmJxiP5s53vt/WqxE
 a88vJi3PXc6PkUciZuXgJGtzZ2MmTK5pVdW3XYzElU8TXR025KudqrJ40/4ieTZYEZ
 ijjRTvSuvY3FZ70ERuf8R8MrbFp305pyNRRiVZnn9U7o8O/wfCbqtPViUYxfDdn0bp
 rDXaPmK5wklzQ==
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 868193782085;
 Mon, 19 Feb 2024 20:33:45 +0000 (UTC)
Message-ID: <f0a7267d-1271-4925-a13c-ef40ed233e76@collabora.com>
Date: Mon, 19 Feb 2024 17:33:43 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/ci: update msm-apq8096-fails list
Content-Language: en-US
From: Helen Koike <helen.koike@collabora.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20240218041204.2522828-1-dmitry.baryshkov@linaro.org>
 <20240218041204.2522828-2-dmitry.baryshkov@linaro.org>
 <d62d3507-20ee-4230-ba2e-c530ea5a9a60@collabora.com>
In-Reply-To: <d62d3507-20ee-4230-ba2e-c530ea5a9a60@collabora.com>
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



On 19/02/2024 17:26, Helen Koike wrote:
> 
> 
> On 18/02/2024 01:12, Dmitry Baryshkov wrote:
>> Mark two tests as passing on the APQ8096 / db820c platform.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Acked-by: Helen Koike <helen.koike@collabora.com>


Applied to drm-misc/drm-misc-next

Thanks
Helen

> 
>> ---
>>   drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt 
>> b/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
>> index 2cd49e8ee47f..88a1fc0a3b0d 100644
>> --- a/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
>> +++ b/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
>> @@ -1,4 +1,2 @@
>>   kms_3d,Fail
>>   kms_addfb_basic@addfb25-bad-modifier,Fail
>> -kms_force_connector_basic@force-edid,Fail
>> -kms_hdmi_inject@inject-4k,Fail
