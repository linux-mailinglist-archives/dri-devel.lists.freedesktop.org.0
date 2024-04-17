Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 131AA8A8FA1
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 01:44:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 492EA10F989;
	Wed, 17 Apr 2024 23:44:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xXIazPOb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B50110F959
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 23:44:26 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5194cebd6caso274522e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 16:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713397464; x=1714002264; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MgjvMPd11QKFNd88E1N26rp+tffDbeQ3uZCnSiUqKR0=;
 b=xXIazPObqISZBFaLQT5FpfXp2YEGY3YsbufiffHvVa/dEvwBPZ2XjSi/vffFBRRJcO
 AzISQSkgescokHrPkCCYufG1jTaYBvYYXiAxnF9YtAHde06CBCZgzP4UnVfSCea3jNje
 RRZgSixd7pGf6rVZe4OzxrY1WDtLv7OAmTAdJvmZcqYFn2+U79nFtGYiPqsyOwREAFhd
 t0C0HMYuHAnBf2xdS/tzCWU7nchNxBu8EkKe4Uui2weYvCsvnxnxTTcQcMFennZ9pu2P
 A9hv7upvX+HBTVLJPTqka7qG9HwLWgZPl4Muq1ahJdvA9gAt8iNNsWDyUpo+zHK2VSuG
 RNpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713397464; x=1714002264;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MgjvMPd11QKFNd88E1N26rp+tffDbeQ3uZCnSiUqKR0=;
 b=s/F4vLF2lmS8nA1uiIzSH1p6BE3VsRR52gQZUgtPiab4bes1b8yi1iCKAnOjdEiJa6
 0qAJ47yUqzS80sI7UKPmEqjEstBBsVLUzsadDFyb0hwhx7FmSyOBGxE3dse+l6vKM7aF
 u8m7m6pcmGGtKpsVJQcAsiKp3Kte+zv1/mSdQvmMKJTRsnJ1DdSItVyfzZKa2FnzM6uQ
 8IvkOKDgjiCI0/6mcB31RQ6INsQxZvEIePDog4iS3Sn8JSfWCkXlVY+9nAA0Oe/er0xg
 cBZcXlrq6bDnjYOA9CVZuhEUUENSn4w+bMw+esnehkBQ8KC2ILpVCWQ0jhu1OzD5SPDt
 CQug==
X-Forwarded-Encrypted: i=1;
 AJvYcCWb1UqqlZmHOZw7sYnG/Q+Catp6g5et+g79Pv0rlSidDRpOLexRSRVmc7TC4zDjLb63XLCbjivAragLBN/aup79E/RMPj/rcZgTwBig1MH8
X-Gm-Message-State: AOJu0YxXPNLgJJ6jHlLDIZ8JsiODdiM70JVJRRuc6Sk0l4Ul6rAAILgh
 utpUwjEVOWOr6hbfpzBBOPsWYqE1R+9/ufDX7481XDu+fvTl2OU6FiHvKMt/XGs=
X-Google-Smtp-Source: AGHT+IE8QqXZo1zRChGmPJCaEjk6MKC6Yazzz1JhVm+k0MzRJJYbY0hPM0PvHSQBF3FoHVjciaXnXw==
X-Received: by 2002:ac2:5395:0:b0:518:9da1:7afd with SMTP id
 g21-20020ac25395000000b005189da17afdmr386771lfh.4.1713397464535; 
 Wed, 17 Apr 2024 16:44:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 z5-20020ac25de5000000b005192a02c638sm36366lfq.132.2024.04.17.16.44.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Apr 2024 16:44:24 -0700 (PDT)
Date: Thu, 18 Apr 2024 02:44:22 +0300
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
Subject: Re: [PATCH v2 5/7] drm/msm/adreno: Define A530 speed bins explicitly
Message-ID: <4m53lev4flu5x7tmw3ygmyvfx6ls5zzmadrzuncbjcnvadoays@b3es63of6ujs>
References: <20240404-topic-smem_speedbin-v2-0-c84f820b7e5b@linaro.org>
 <20240404-topic-smem_speedbin-v2-5-c84f820b7e5b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240404-topic-smem_speedbin-v2-5-c84f820b7e5b@linaro.org>
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

On Wed, Apr 17, 2024 at 10:02:57PM +0200, Konrad Dybcio wrote:
> In preparation for commonizing the speedbin handling code.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
