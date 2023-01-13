Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D6A66A52D
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 22:34:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1495110E24A;
	Fri, 13 Jan 2023 21:34:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9340110E246;
 Fri, 13 Jan 2023 21:34:43 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id i9so32991820edj.4;
 Fri, 13 Jan 2023 13:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qCdwGMTA5hWt76IHvq9wLJvkL5pfwxgtHI4xlA6p9uY=;
 b=M/CqyQc4pXY7XmIPKjddQNB23Ymnykff6YJlPCRgig2FzZM2dUhOT1CWaHLuYaUTwx
 NKAZqAA0PEKHwbQ8FhG3TJuf8MbBfZ7jnc9aJsPVkKpB2D1wXWV4QjWMQIgrr4M7w5PP
 r03W4E1NUUYlH6zPWCW064jmZ0834b8SU/2ayefFvHRDtxFNDtMciJhzOpCK2SVl25/p
 a55mdYypiJROG9aVTIhMI4ZdsHVa2Z9IfljMZOc0rAbdzvJQcHOKT04Vm94NbxjzrfUH
 4KulVZQ+3NvzyYqKLCeyOk/LfbgZKUGFbXVzkhMg2LszuRs28psYQB1RiHK4oc/Vq1z3
 rCUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qCdwGMTA5hWt76IHvq9wLJvkL5pfwxgtHI4xlA6p9uY=;
 b=thDUr4mSI1o/tYS1YUflN0KPf1+vSVeuX9dueAgp7sAseXtBcHjPOoMp5doAAZ2DLM
 TQaK2/NrKIDqpq/44UOEZfye7/4V3fSAcAUyVXjBtLSvkhRQZ/VgPrre5vivTHZ8CHY8
 GXfQex5EKVoMNHzOj000gG3B+qfX6sbNC58iOI1sYjVUE6qGxW2jOVCuVxy6HqDKFE2F
 AScR8LjQu/OGrd9Ma4iRjWLAj6fWQMKNy87u0PfmmG05e87Snv8A1D813Kduh8DYkUAH
 pj9o9LN/C5fI66nMDaBA+Mz7l2EfQTfZM/zgGx3zEfmCfnSSDW+nYT6wBNan3pgrIwEK
 99LQ==
X-Gm-Message-State: AFqh2kpZFM1CxUBi02RGC23Ci8i7Q8ks5wtnOpLIQEGvr2+DD9QtOvra
 WHAH3LKfAOByHNVN0V019mPZf8HOcvjYgsr265WbgtsYdlA=
X-Google-Smtp-Source: AMrXdXvlZd2FOTLqxdMOBBVqfPcrN6niWajfnCu7ycA77luyrMnV5VLOW4sU0WRUEdX1UkvnN5FEhTGNMEaQ3Y7gC80=
X-Received: by 2002:aa7:c985:0:b0:498:dec8:f426 with SMTP id
 c5-20020aa7c985000000b00498dec8f426mr1911545edt.392.1673645681926; Fri, 13
 Jan 2023 13:34:41 -0800 (PST)
MIME-Version: 1.0
References: <20230110231447.1939101-1-robdclark@gmail.com>
In-Reply-To: <20230110231447.1939101-1-robdclark@gmail.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Fri, 13 Jan 2023 13:34:30 -0800
Message-ID: <CAPaKu7Sqr7dpub3d-XhO4NkfZ3U6h332s==rF9AzbCmtMGq0NQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] drm/msm/gpu: Devfreq fixes+tuning
To: Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Rob Clark <robdclark@chromium.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Series is

Reviewed-by: Chia-I Wu <olvaffe@gmail.com>


On Tue, Jan 10, 2023 at 3:14 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Rob Clark (3):
>   drm/msm/gpu: Add devfreq tuning debugfs
>   drm/msm/gpu: Bypass PM QoS constraint for idle clamp
>   drm/msm/gpu: Add default devfreq thresholds
>
>  drivers/gpu/drm/msm/Kconfig           |   1 +
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c |   2 +-
>  drivers/gpu/drm/msm/msm_debugfs.c     |  12 +++
>  drivers/gpu/drm/msm/msm_drv.h         |   9 ++
>  drivers/gpu/drm/msm/msm_gpu.h         |  15 ++-
>  drivers/gpu/drm/msm/msm_gpu_devfreq.c | 148 ++++++++++++--------------
>  6 files changed, 100 insertions(+), 87 deletions(-)
>
> --
> 2.38.1
>
