Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B76B5946DE8
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2024 11:24:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A215810E0A5;
	Sun,  4 Aug 2024 09:24:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="rSvMfWuQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CF9B10E0A5;
 Sun,  4 Aug 2024 09:24:26 +0000 (UTC)
Received: from localhost (docker-mailserver-web-1.docker-mailserver_default
 [172.22.0.5])
 by mail.mainlining.org (Postfix) with ESMTPSA id 8180FE450D;
 Sun,  4 Aug 2024 09:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
 s=psm; t=1722763464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JHrUfDJ8wOPMyYjj64os5C3jTH7IZahgW6h7gmn5AHg=;
 b=rSvMfWuQrV+Eh9PLNkIh0X6tMnh3DQ0gbYumXjuBD98e9JMoJO1Zt9CY11e+SQ1Kt60TpQ
 92gila1c6Q+dO2mdpfLPjiRWtehkex36K8jUKh0CLs2U5S4I5bur9gsMoz76Rskx26E6S5
 p264V9FHgMMuLr/wfO81DiwtgUmwwzDnVInG0frpJAyNhAbhRfMIht3I8wUh0PeGShjCPu
 Ah51N2qBEqkjNC1g/BmopVWRXNY+T45ROmsFit1N71uSm/eowSj4VJfgYUTQPngaaCfxZ+
 yk1bI5gB2rQ6/YgZtLo3ycP9iWqb2v2Bpp4T4kusqqqOD4ukQkasNON3uSTCCQ==
MIME-Version: 1.0
Date: Sun, 04 Aug 2024 11:24:24 +0200
From: barnabas.czeman@mainlining.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: [PATCH 0/2] Add MSM8996/MSM8953 dpu catalog
In-Reply-To: <zeek3j7skstysho5bduxn23xipz3fpqsfwggue66dlyozhepnn@4wnnd7q6xf22>
References: <20240628-dpu-msm8953-msm8996-v1-0-a31c77248db7@mainlining.org>
 <zeek3j7skstysho5bduxn23xipz3fpqsfwggue66dlyozhepnn@4wnnd7q6xf22>
Message-ID: <202f4237b0019fda0cf860bf55e534e1@mainlining.org>
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
> Which LMs have you tested?
> 
It was tested in usage on multiple msm8953 (sdm450, msm8953, sdm632) 
devices like
- Samsung A6+ LTE (sdm450, cmd panel)
- Xiaomi Redmi 7 (sdm632, video panel)
- Xiaomi Redmi 5 (sdm450, video panel)
- Xiaomi Redmi 5 Plus (msm8953, video panel)
- Xiaomi Redmi Note 4 (msm8953, video panel)
- Xiaomi Mi A1 (msm8953, video panel)
- Xiaomi Mi A2 Lite/Redmi 6 Pro (msm8953, video panel)
- Xiaomi Redmi S2 (msm8953, video panel)
- Motorola G5 Plus (msm8953, video panel)
and couple of msm8996 devices like
- Xiaomi Mi Note 2 (video panel)
- Xiaomi Mi5s (cmd panel)
It was tested with glmark2 and with mobile shells like plasma-mobile 
(dpu fixes night light) and phosh.
If you can help how can I test specific features i will do it.
How can I find out which LM is in use?

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
