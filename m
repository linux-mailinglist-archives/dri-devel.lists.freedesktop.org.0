Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A656D992153
	for <lists+dri-devel@lfdr.de>; Sun,  6 Oct 2024 22:46:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F66F10E2E6;
	Sun,  6 Oct 2024 20:46:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="w5Wzwgih";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4779410E2E4
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Oct 2024 20:46:16 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-53993c115cfso4681530e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Oct 2024 13:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728247574; x=1728852374; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Gfpi17CXoqt5LeLUSOl+vd1IydRfRUPSwqBPfSh42vg=;
 b=w5WzwgihR0DeFRfwM9yO1IvXrHtx13brbuluZz+Ij1INIpdCH5HslcY3+howDeafp5
 StaAeL7yqm5cVBCu1tXlHHqY5YSjEolDwvrFjGwfHBLTNd2VZ21KL8ENwGc7q5UNBdD7
 de+RFTDPpkDbySFhlHA5TqEMN4iEURO6/LWlQNONrkR8Jcpj8ZlqTp4ME3i4yoGydNJY
 4ztYFzpA2omm3KCCTFZbKWZWjltoCWohbapG0MYOHUrR2ymdmhsIvzJ1u9RFBt8WR5S9
 q9eMyAppgn1gVncj009FXFLcAQCcFuMl20Ze+7qhmbtlUv56yyJuvPPYE7LJVEj+hGYM
 0iUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728247574; x=1728852374;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gfpi17CXoqt5LeLUSOl+vd1IydRfRUPSwqBPfSh42vg=;
 b=DVzWSofGslwMTpEytdSKAc1YwDPCKeN61BG30cIcKZTuV5qrK4n3I6SccFY6eQ2WTW
 MVUWw/rVYHTrS4pefY/5asGr5d4btjY2YMDDtJdEb1FZ5zCLbgn8N8yOPo1mm9qep45d
 3XZCecIdfB2RqJlHWOQl4yJ3maWzRBpkYGfppeO2t1v27yIW+AGSBTaecS3P2+xrK2wg
 2fcbXCFfERXh+G92b4V7gUBeV6p56gggXAtmcPxbvoS28Dge8/0tTSCxhOUSeI1AxEt4
 L7oSGnGSJ9le9KygSYFdXRRsbp7AU7cfI6AG+aUh3330A0czTXwNQo5rlwBJ/j30Q92m
 1bGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZ6mxRDtODo4yI7yCRMag5tUzEKD2iXFNxfj/WeWOS2DFSAWde8FxtIJ3V90AYzJaZBraNQB7GnjY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwsFrdPSfUSLQzW/cKYdzgMnqPhDKQ8OUlJjP9VYE4FhssZ33ik
 FviMrDJKyMnD4P6bPrCPZhqFpHp5OkR25ztpj8VcgqMLX5rYVDgNtEzAoI0swaw=
X-Google-Smtp-Source: AGHT+IF63jKWBQMnrsLsFl0I1WEyeaM3LAui0TYjFiBDSl68P+gQT8sUN39DvLjWBCsLHqaFXuiO8g==
X-Received: by 2002:a05:6512:4026:b0:539:8b49:893e with SMTP id
 2adb3069b0e04-539ab9de307mr4230682e87.38.1728247574283; 
 Sun, 06 Oct 2024 13:46:14 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539afec1010sm618750e87.9.2024.10.06.13.46.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Oct 2024 13:46:13 -0700 (PDT)
Date: Sun, 6 Oct 2024 23:46:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: quic_mahap@quicinc.com
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Kalyan Thota <quic_kalyant@quicinc.com>,
 Jayaprakash Madisetty <quic_jmadiset@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/5] drm/msm/dpu: Add SA8775P support
Message-ID: <w2bzbobcee5ulbgvopfhklruhykn5qdc77su4csbr556urwepk@ukchc4getvja>
References: <20241001-patchv3_1-v3-0-d23284f45977@quicinc.com>
 <20241001-patchv3_1-v3-4-d23284f45977@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241001-patchv3_1-v3-4-d23284f45977@quicinc.com>
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

On Tue, Oct 01, 2024 at 12:11:39PM GMT, Mahadevan via B4 Relay wrote:
> From: Mahadevan <quic_mahap@quicinc.com>
> 
> Add definitions for the display hardware used on the
> Qualcomm SA8775P platform.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Mahadevan <quic_mahap@quicinc.com>
> ---
>  .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    | 485 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  4 files changed, 488 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
