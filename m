Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2210F89A8AC
	for <lists+dri-devel@lfdr.de>; Sat,  6 Apr 2024 05:28:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18DEF10EE13;
	Sat,  6 Apr 2024 03:28:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bRc9qtn/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C2EF10EE13
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Apr 2024 03:28:19 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2d52e65d4a8so42660041fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Apr 2024 20:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712374097; x=1712978897; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jfuelYCmVaPnXJqTFgO1Iq+D/XgR90NTWOrZt+9baK0=;
 b=bRc9qtn/OJlS5mglF6AA1h+XquZSC9kPIvxGlHyY2vgoBLE8c6UQdsJq/j3jAqQ8x3
 +8D87LxIr52ut9G22qussYm9L79dojSCnYKVljsf616NocmsuooSwNesuI6VAArNDLzd
 JRmy9Kc9KngHzJ5iIKw6UnpCpncjY+XZMgmqh0eo7+tPVUEBDCqHJhEAwDRQJuKdS+nt
 Vkk5TfMx7rC+lyArnP411P3o8GOZi5lt5dJYgiiM4L6DCwd9D9rK3sD3cKNXuWnABghg
 t926thUOWWOsARfRYsg2aCpiNcNHEFbJTihbDbHZZcC9HRi4SH8rdd9X/jHutFBZr0aC
 fgjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712374097; x=1712978897;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jfuelYCmVaPnXJqTFgO1Iq+D/XgR90NTWOrZt+9baK0=;
 b=WmJ3mPW0K+Y3qtVC7fG2pA/KxcfzJ95s7yGL4cCIu5ucKokFoc/x9N7C/8pcxXI/q+
 JknrLvhhuZWyKG+/PGBmFYc/6JQvIus9vUchMhYLjA85mN2YHjNr5oOAHLhlv0tkycfR
 CIPzQ0XFbOiTL3vLTVi1CIMtg0HiIe1hR131Il9bKumd2wl88yT3qeaaiDncHhlfZiQa
 ioUL1a8o+CEwD7ByZnIOX9pjNVejpC6eOkTr/D4EOX63nAGAn2a6r+MvsHaJICx7A++q
 JZi9dK4jOrCc1EhjjzLhJj+B3VbCCstt1IiX6hN8Aet8JTEo6ItDEcHpY2ZskBMg1wnc
 mATQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHNrBwzYF6j2Po2liwBmlHir05GdQd9eC9ADkNa8sXBU9GOAz6Gkkaxcm475TY8sPjLEIqW/iy3lL/IDEU1ST0wm+lJ3VwdNNUIhhXeI5R
X-Gm-Message-State: AOJu0Yxgrr4mIuPu+A4O8vePDrUT28X6w2QlPiqStBSDDdn75DDYlvpw
 tQtb4GFmvJEHVPmZPBmqBZhFT3yguPCx8Vk4o/e8EGElDTYkDVAe+WzDqqFNIqUbwdxV5Ks7EPR
 B
X-Google-Smtp-Source: AGHT+IF3i8+vhLbIjnsL8VphQV1PmaT5a3qc5xWE3KaLEQtmXPGg+H4Zi7mDhaos0rILE6f8KYcCbg==
X-Received: by 2002:a2e:8704:0:b0:2d4:1fa4:9eb8 with SMTP id
 m4-20020a2e8704000000b002d41fa49eb8mr1830431lji.40.1712374097096; 
 Fri, 05 Apr 2024 20:28:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzyjmhyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a00e:a300::227])
 by smtp.gmail.com with ESMTPSA id
 n6-20020a2eb786000000b002d0acb57c89sm333260ljo.64.2024.04.05.20.28.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Apr 2024 20:28:16 -0700 (PDT)
Date: Sat, 6 Apr 2024 06:28:15 +0300
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
Subject: Re: [PATCH 0/6] Add SMEM-based speedbin matching
Message-ID: <wrvndv7ybn5dcnd6n7d62luwbogmjjsvqh6i3ow5exc3emqexk@n6b4bkydy5n7>
References: <20240405-topic-smem_speedbin-v1-0-ce2b864251b1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240405-topic-smem_speedbin-v1-0-ce2b864251b1@linaro.org>
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

On Fri, Apr 05, 2024 at 10:41:28AM +0200, Konrad Dybcio wrote:
> Newer (SM8550+) SoCs don't seem to have a nice speedbin fuse anymore,
> but instead rely on a set of combinations of "feature code" (FC) and
> "product code" (PC) identifiers to match the bins. This series adds
> support for that.
> 
> I suppose a qcom/for-soc immutable branch would be in order if we want
> to land this in the upcoming cycle.
> 
> FWIW I preferred the fuses myself..
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
> Konrad Dybcio (5):
>       soc: qcom: Move some socinfo defines to the header, expand them
>       soc: qcom: smem: Add pcode/fcode getters
>       drm/msm/adreno: Implement SMEM-based speed bin
>       drm/msm/adreno: Add speedbin data for SM8550 / A740
>       arm64: dts: qcom: sm8550: Wire up GPU speed bin & more OPPs
> 
> Neil Armstrong (1):
>       drm/msm/adreno: Allow specifying default speedbin value

Generic comment: as you are reworking speed bins implementaiton, could
you please take a broader look. A5xx just reads nvmem manually. A6xx
uses adreno_read_speedbin(). And then we call adreno_read_speedbin
second time from from adreno_gpu_init(). Can we get to the point where
the function is called only once for all the platforms which implements
speed binning?

-- 
With best wishes
Dmitry
