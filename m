Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D3C945105
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 18:45:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 780E610E8F0;
	Thu,  1 Aug 2024 16:45:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="Dg6A5Ykc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D4A710E8F0;
 Thu,  1 Aug 2024 16:45:08 +0000 (UTC)
Received: from [127.0.0.1] (254C2FDD.nat.pool.telekom.hu [37.76.47.221])
 by mail.mainlining.org (Postfix) with ESMTPSA id DEA75E4504;
 Thu,  1 Aug 2024 16:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
 s=psm; t=1722530706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v5l+UJOnTuIA2VF3IVpxLITj1fy8BGXTZgAAao9FeIc=;
 b=Dg6A5YkcSa+bOJBu/209DtaFqEZs9XbCrbL1TMnnfdQqyMaoZX3JOS4cJltrVAISiyWllX
 zI/QmqpZRKZInbCcxiuJr/1sZlrheR0Pacan5bI45PjmYbFjjzCCP8Q5vm5f3CH9NplQ+S
 KLhIiaeOGhmeAHndl8Ax4MIWS62MmSUrxdqV50eM/quiZCR/LrSXQu7HfuBRtdtQmy/wcd
 6Itxv9kNyIgVp8JrlK/r72cK6PlUfL/PFhVKiKQiZMuUKgheGdxz44xEQCHS6todGMrL2Q
 39nnuD3L2wF3w3+PRZA4qbS7eJS62iALEti28VaG35ZmrpscfXHa7pUfjbg2Xg==
Date: Thu, 01 Aug 2024 18:45:03 +0200
From: =?ISO-8859-1?Q?Barnab=E1s_Cz=E9m=E1n?= <barnabas.czeman@mainlining.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: [PATCH 0/2] Add MSM8996/MSM8953 dpu catalog
User-Agent: K-9 Mail for Android
In-Reply-To: <20240628-dpu-msm8953-msm8996-v1-0-a31c77248db7@mainlining.org>
References: <20240628-dpu-msm8953-msm8996-v1-0-a31c77248db7@mainlining.org>
Message-ID: <874E8EE9-6BE5-4801-AB2E-536B6A160AF8@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Should i resend this patch set?

On June 28, 2024 4:39:38 PM GMT+02:00, "Barnab=C3=A1s Cz=C3=A9m=C3=A1n" <b=
arnabas=2Eczeman@mainlining=2Eorg> wrote:
>This patch series add dpu support for MSM8996/MSM8953 devices=2E
>
>Note, by default these platforms are still handled by the MDP5 driver
>unless the `msm=2Eprefer_mdp5=3Dfalse' parameter is provided=2E
>
>Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas=2Eczeman@mainlini=
ng=2Eorg>
>---
>Dmitry Baryshkov (1):
>      drm/msm/dpu: add support for MSM8953
>
>Konrad Dybcio (1):
>      drm/msm/dpu: Add MSM8996 support
>
> =2E=2E=2E/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953=2Eh   | 218 +++++++=
++++++
> =2E=2E=2E/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996=2Eh    | 348 +++++++=
++++++++++++++
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog=2Ec     | 106 +++++++
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog=2Eh     |   2 +
> drivers/gpu/drm/msm/disp/dpu1/dpu_kms=2Ec            |   2 +
> drivers/gpu/drm/msm/msm_drv=2Ec                      |   2 +
> 6 files changed, 678 insertions(+)
>---
>base-commit: df9574a57d02b265322e77fb8628d4d33641dda9
>change-id: 20240528-dpu-msm8953-msm8996-5d0fb7e387b8
>
>Best regards,
