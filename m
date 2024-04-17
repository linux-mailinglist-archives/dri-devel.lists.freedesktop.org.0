Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3BF8A8F9C
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 01:44:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 683A0113218;
	Wed, 17 Apr 2024 23:44:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hqXJgpZ1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E809510F959
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 23:44:05 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-516f2e0edb7so278634e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 16:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713397444; x=1714002244; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4dYJ1ClH4O5pb9/mVyQ9/1Y0nfz72c0FqGgqO6+NBFs=;
 b=hqXJgpZ107Rn3X7ZkqBRjVpuVMOTfiWSEFAsCpEFIiCDXD7d2kStOEXn53UOQ/qnOL
 wg6F2pVLiyaiO3hx2EtOJFVrCiBLuh7QBcuaQ56uovbh9keZZmkRgOyapu3wnyJmDp1s
 wusRQ+iFLtSnPj/vCnYy7KRlSe3gsu2Uioo/OIYhgTV2TtzBuWjoxhGo77WAi8wIlXaq
 Gb2GSCsefOH70+2VYiuNJJBP5bHE14k6+hayiUq70RS/K13JzFlTG7Gz3+ZdrQdoIjtM
 4sq088YC8BNsrVECV8tGViNWxnUCGmpFWsTnSVGblBK5MRKRlE4jFeDD/jHgZs0W2y9q
 JGxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713397444; x=1714002244;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4dYJ1ClH4O5pb9/mVyQ9/1Y0nfz72c0FqGgqO6+NBFs=;
 b=FiQ9TldAUSGEqkMCgo8yrpxkX32x+jobd2Smy9DtNq4SehFizcp3rCt4dO2hCp374C
 orX2EmGm4AI6aTmTvXGShy2XV0NktMl/a7AAUFmhxqpWBoxQti5MvlVGqW7/sR0d0cW/
 3lFte1NqsyrBWN/HECLFlcHK3LsIqsLmVqXS9SH5hs0a9znxnrDnY9kKquUTpq9JqWYT
 2rK/vyjKAZjJdayKvzH0enU/27UMaz6pCnZ+9CUj6r3d7xh+7qmQy3BSsKChonyzwBqV
 Ed74OgyaDpHBmUbiQP5zyTtwgZnrudDC09FVNng+oj+SRQqxkMwhjko0KqLkz7ndM7Vr
 JDkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXA0GBkX8r+PhrqoHa00qyDMjK553543UJwW6l29Kku35fRQ7z4xylEauoQBaaW8/aWwK3N5hIEIXpVrMdSoIzh1O5moC0q18YrLgABcQzT
X-Gm-Message-State: AOJu0Ywa+ecT43RBkfC0Qlqh201+kc24COaLiTrkX7gS2pJD+xDc0+qs
 MySO53qflwphpKLyoNtiJkjzkndrW9m+OZaME0pYHr3bcNeD2rQ5FEFRh67T/NQ=
X-Google-Smtp-Source: AGHT+IE5TTewc1NQU6pjDvIINRLdTRyEr93ooSR0k+a7QtvsqWnNHglfNzFwEISYjtKIqilM46tyXw==
X-Received: by 2002:ac2:5605:0:b0:515:cc50:9376 with SMTP id
 v5-20020ac25605000000b00515cc509376mr350592lfd.22.1713397443931; 
 Wed, 17 Apr 2024 16:44:03 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 b27-20020a056512025b00b00516dc765e00sm37612lfo.7.2024.04.17.16.44.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Apr 2024 16:44:03 -0700 (PDT)
Date: Thu, 18 Apr 2024 02:44:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 4/7] drm/msm/adreno: Add speedbin data for SM8550 / A740
Message-ID: <wuxp2yusymxlbmiktheulgw42aexmp3pro2ookzjppn6pxwz3h@ohj6jlnq6g35>
References: <20240404-topic-smem_speedbin-v2-0-c84f820b7e5b@linaro.org>
 <20240404-topic-smem_speedbin-v2-4-c84f820b7e5b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240404-topic-smem_speedbin-v2-4-c84f820b7e5b@linaro.org>
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

On Wed, Apr 17, 2024 at 10:02:56PM +0200, Konrad Dybcio wrote:
> Add speebin data for A740, as found on SM8550 and derivative SoCs.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
