Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 368B1A582FA
	for <lists+dri-devel@lfdr.de>; Sun,  9 Mar 2025 11:19:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 263F010E30C;
	Sun,  9 Mar 2025 10:19:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kDIz1gex";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A60610E30B
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Mar 2025 10:19:46 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-30bf3f3539dso22914301fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Mar 2025 03:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741515585; x=1742120385; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6s2IN28UcJK9AIeEgePs+AKeLtN5DfXNmrIRckMBKOk=;
 b=kDIz1gexGFKxiItHtZ4yN6bEwSOd0vGkDkvZpz+rs2628BvUkcYN42r6BDwFP42KpJ
 h+Wx9ZeedNUPCFbeFpuFuUKg/ZY86ZSHL7ncGaxJ+0uPiy5tQE+nde3N6dBF/bSH55eh
 3TZ/Gi6SG91x0reXplP9WRGp9GT14fXOddnyLEbLA3YA6Ih4e5NEv6NzI8k1jvm1zwBZ
 I7X9EQkQq0g5s6LKBoKAWNBpsXUY1ezw6KmT3oVoQsT+ODvJACAnx7Jbkl4XLgzM9hEA
 JZ9AQYbMZfP+VcMosZkDAnwLSsSb2W2qXR/FXFeSVlQr5M8E6sJ+mFSP85UXBgfA/UVk
 Os5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741515585; x=1742120385;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6s2IN28UcJK9AIeEgePs+AKeLtN5DfXNmrIRckMBKOk=;
 b=Uj7UxQmCmc1aEQx/Wn84b07A68G/MaU+pRM2rPfzW2iR8YplEo8YcPUkEtA2D5Ih2j
 ZOVC7HJeL7Lx4JCgJhbwQCkgBAexJz3HKtz4ymt808cBVX+RDZM5Wb8BIbbK0eNaTVDI
 NpcP7t+bzKhGpfku9hDC1Ij+KAxSFE4QCCqwacHwORNt1b5dzM4LuJvgcHleic3kOmSY
 Cl9cRZ6jrI58lULDiQe9+GYIM4ImoVKQzlnIj389ORB4yynbR0Kvo2EVjw2cVqpyUYEe
 wifsDITfAkoIh5gqboLvFmraIGaHABynowjZiCOjKl78glrU92O49x9SMyDSJ0y4ksHj
 qfzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyTMadBKy3nYcJ0YmHLPGEOM113lgSJT8lBQ0B41zrUl8MbDEhOzhyuLSa1E/56g21dQ5YJ13fv6Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZ/LMY9dvYwvGAjiXm0wcrhV34GA4FlEgzr5hi+k1V7sQoTxVM
 688LicdQbAeYHhqdX5uwujoHYfQOVCvH0yf+8I5V4wzcwQbONNc1D4UwzJOqbmA=
X-Gm-Gg: ASbGnctG6kySG/+sg4OVadjprxcsiWXmxgObndipyaxUZCaJruueyoW7MubIxonWtUG
 /h7PK7PAUTey4xr/CPUqADK7h84fvFUDh3KsueGI1AiHL/lf07Gw8w8VpXMwI4LTyNmsMSai1UH
 +FjFyKtc/eH2kI9zWCsRioITcv1TF4JaXM/OuxtRyyiogy4gJ1OiZkzdjcd+2sO9m2Kh/qkNaMS
 pcfpC/OyWaFp1rQPFCnjyWKFwC0x2lrBw2W1Evn6bNw1s6tv75rlZfKWH11PoXHk1XNi8VzVMUP
 UX0ij160oPBOk4nVLya68QF3LeLUCNP7MvhMvShPmTjDa197Oc51G+Cf7IT6UjXb1Du4X6mYcy5
 9/psViuBuUtna3u9v0lGuQgYPGHUakg4kM1g=
X-Google-Smtp-Source: AGHT+IHlBdJ1qjhe/o7S4dso2ZCEpH6o3JPt/ko/A+fRZieBU37zQ/ClCK+PPXWZo0QJwKYGgx8DEw==
X-Received: by 2002:a2e:a985:0:b0:30b:c36c:ba96 with SMTP id
 38308e7fff4ca-30bfe3eeeafmr15772901fa.1.1741515584802; 
 Sun, 09 Mar 2025 03:19:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30bee0c8565sm11460361fa.53.2025.03.09.03.19.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Mar 2025 03:19:43 -0700 (PDT)
Date: Sun, 9 Mar 2025 12:19:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Qasim Ijaz <qasdev00@gmail.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 quic_jesszhan@quicinc.com, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: reorder pointer operations after sanity
 checks to avoid NULL deref
Message-ID: <s3zlxsj6gsmoz3rc5fqopi7etfibaurkz5oo5wgvurebx2z3zt@t3h73v5lcmhi>
References: <20250309095525.7738-1-qasdev00@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309095525.7738-1-qasdev00@gmail.com>
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

On Sun, Mar 09, 2025 at 09:55:25AM +0000, Qasim Ijaz wrote:
> _dpu_encoder_trigger_start dereferences "struct dpu_encoder_phys *phys"
> before the sanity checks which can lead to a NULL pointer dereference if
> phys is NULL.
>  
> Fix this by reordering the dereference after the sanity checks.
>  
> Fixes: 8144d17a81d9 ("drm/msm/dpu: Skip trigger flush and start for CWB")
> Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
> ---
> v2:
> - Moved Signed-off tag below Fixes tag
> - Moved dpu_enc declaration to the top and initialisation below sanity checks
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-- 
With best wishes
Dmitry
