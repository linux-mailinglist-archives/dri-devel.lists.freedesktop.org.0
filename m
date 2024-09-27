Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C6C98886D
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 17:39:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F29510ECE4;
	Fri, 27 Sep 2024 15:39:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="Y1uuoFRw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6999C10ECE4;
 Fri, 27 Sep 2024 15:39:31 +0000 (UTC)
Received: from localhost (docker-mailserver-web-1.docker-mailserver_default
 [172.22.0.5])
 by mail.mainlining.org (Postfix) with ESMTPSA id 66C4EE450F;
 Fri, 27 Sep 2024 15:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
 s=psm; t=1727451568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BdEq1nmyBirZ1u+r5vJIwC5w86C2EE9Wgg+eN+ipB2s=;
 b=Y1uuoFRwBOqnkdhWjVSK5/UV7QyTzidAYK2+MGlh7qMDqkNf94HbC4xeMmbXCpMkVxocHZ
 j9e5D5yDHN8h0/5qV1bwQlGdF17/0dWfi1+08kyU2HLDLxF2U8qz5fiAb4oR9AHzyXyZEg
 UlwvRnb65/Gsx2bvGrveK0GZv+cqpN1D50bxcP0Te0hl35yMv6E/CJ123prx0t9Ma5e2SM
 k7tDpCdb3EpC34vrVkRmhWgPtJf+mV6nQ8kuEUmGH/evqofwOSdDHlrviE5ylHD5nLzMf9
 bJtA6TqrLJZOJTaNyVMjtW3/s04ZOvfiAQQcysLH4SaJKV/X2vs294e2oQM7ZA==
MIME-Version: 1.0
Date: Fri, 27 Sep 2024 17:39:28 +0200
From: barnabas.czeman@mainlining.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Konrad Dybcio
 <konrad.dybcio@somainline.org>
Subject: Re: [PATCH 0/2] Add MSM8996/MSM8953 dpu catalog
In-Reply-To: <zeek3j7skstysho5bduxn23xipz3fpqsfwggue66dlyozhepnn@4wnnd7q6xf22>
References: <20240628-dpu-msm8953-msm8996-v1-0-a31c77248db7@mainlining.org>
 <zeek3j7skstysho5bduxn23xipz3fpqsfwggue66dlyozhepnn@4wnnd7q6xf22>
Message-ID: <05c1f93940c38087e8d245d2b6bf90e0@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
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

On 2024-08-01 21:25, Dmitry Baryshkov wrote:
> On Fri, Jun 28, 2024 at 04:39:38PM GMT, Barnabás Czémán wrote:
>> This patch series add dpu support for MSM8996/MSM8953 devices.
>> 
>> Note, by default these platforms are still handled by the MDP5 driver
>> unless the `msm.prefer_mdp5=false' parameter is provided.
> 
> Could you please provide a summary of features actually tested with the
> DPU driver? Have you tested YUV output? Have you tested RGB planes?
I have checked all planes they are working fine.

> Which LMs have you tested?
I have done some more testing and msm8953 LMs are fine but i have found 
out
on msmm8996 LM_3 and LM_4 is not working as i see in downstream sde code
they are not exists.
This kind of messages i got for LM_3 and LM_4
[   34.751091] [drm:_dpu_rm_make_reservation] [dpu error]unable to find 
appropriate mixers
[   34.751112] [drm:dpu_rm_reserve] [dpu error]failed to reserve hw 
resources: -119

> 
>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>> ---
>> Dmitry Baryshkov (1):
>>       drm/msm/dpu: add support for MSM8953
>> 
>> Konrad Dybcio (1):
>>       drm/msm/dpu: Add MSM8996 support
>> 
>>  .../drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h   | 218 
>> +++++++++++++
>>  .../drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h    | 348 
>> +++++++++++++++++++++
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     | 106 +++++++
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   2 +
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   2 +
>>  drivers/gpu/drm/msm/msm_drv.c                      |   2 +
>>  6 files changed, 678 insertions(+)
>> ---
>> base-commit: df9574a57d02b265322e77fb8628d4d33641dda9
>> change-id: 20240528-dpu-msm8953-msm8996-5d0fb7e387b8
>> 
>> Best regards,
>> --
>> Barnabás Czémán <barnabas.czeman@mainlining.org>
>> 
