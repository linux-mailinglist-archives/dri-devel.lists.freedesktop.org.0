Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FB8911342
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 22:32:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98BD510E2E0;
	Thu, 20 Jun 2024 20:32:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Z2hKFZ5W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B18CE10E181
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 20:32:52 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2ec17eb4493so19452601fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 13:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718915571; x=1719520371; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Yq0nWUsKxD4rK/v2NoFPmPbkAY476HU9+6IpUl30jWE=;
 b=Z2hKFZ5W4V5CHDRuHDpYLL5QM5TnYkeMzPZB21eFCkObOqRZYG5bIVtnE9DsITBFzI
 zvp8cO09dOFtJAw9K8b6q+8J55Dr0p/1ViXYpMcw1f0Fst+PF0DZ9wgrSUNIRzIvbq4P
 9UJB10o+zXUgLeEvs1g/KDIVANArSfKBNuX2IF7y8nVE68T2pZ1ovM8EiRv4v+uZA6is
 sJDbOvSK/QOwY4KdUs8ylhxyQyLFklhu7XwrLQ4lXLC6hEHUvT/RhLCsldCkNnsvVYLE
 fN5pT8uw2HhhqEBQpsyZ1qJ4tMVAV3oCDg9aeHn9GgdJtaqkIyrZf3vjg0bwrRhyMgAN
 Ie6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718915571; x=1719520371;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yq0nWUsKxD4rK/v2NoFPmPbkAY476HU9+6IpUl30jWE=;
 b=ch0Jke9xYGF6gDWbSNSDOzgjUyb6xgSEC2V7iJ4Kk6FDGFDfKFFDzN50VyM/qKs3Z+
 cm6x9+QOsn+IO1sKCmFvo/5DlYDvYkJBN5X7XR8eLMS+JPuoBrmsVDHERZcUzlcA0MW0
 gjV7qTxrkxDlsNCko0Pmljx3OmF2wMwWxD31drzA4s35SoVIJnWw2Fofx66xbr5O3wF7
 /jDL9i8lyUGolDFRod+zrMiktUMU01RI4Ry2uK0SAl66Y0dR1R7LNvCny5wVMS8x9vFp
 4tfUQ1Hrcht85gZjb8lrR189++0KAtDiL++paUqaXBCRsQAdfIDAyLONTScOm0+nqYyI
 qBiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWojW6YALVNccSBgvfWGWvHQS0EeyQ51e8DcPuo6EdD/a0u4I6saKL18OQYGZ3Qrnyfm5x6Tnt1922RLacIITG1CL+NBjH1BCDP37Qy5gda
X-Gm-Message-State: AOJu0YxmgPRB2TTCI68X4lV6B2eXNz7ozDWcGIKQSB1yDi7f1oKQKTFk
 1LEdHb1fCwTpzaNxNjL2QyTwJCsvOsTxK3hZ80yMyrHkMe9E6Qdxpj0HwN8o6ns=
X-Google-Smtp-Source: AGHT+IHMpcwkT02hJ8steyoLT0MHFupFKcYGAIgPIehNeuT8A2kH+0oB8/Gv4eoKPRkoRs+Es9bF5Q==
X-Received: by 2002:ac2:4568:0:b0:52c:c9e4:3291 with SMTP id
 2adb3069b0e04-52ccaa5958bmr4931076e87.60.1718915570794; 
 Thu, 20 Jun 2024 13:32:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca287b245sm2162968e87.205.2024.06.20.13.32.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 13:32:50 -0700 (PDT)
Date: Thu, 20 Jun 2024 23:32:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/9] drm/msm/hdmi: turn mode_set into atomic_enable
Message-ID: <xymopystyfjj3hpqes3uiw2g3dqynxzvz23snrbfzf2judgxnt@j4nmpcbuy7a4>
References: <20240607-bridge-hdmi-connector-v5-0-ab384e6021af@linaro.org>
 <20240607-bridge-hdmi-connector-v5-5-ab384e6021af@linaro.org>
 <f34c4210-fd59-9d27-0987-3345631c9e35@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f34c4210-fd59-9d27-0987-3345631c9e35@quicinc.com>
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

On Thu, Jun 20, 2024 at 01:27:15PM GMT, Abhinav Kumar wrote:
> 
> 
> On 6/7/2024 6:23 AM, Dmitry Baryshkov wrote:
> > The mode_set callback is deprecated, it doesn't get the
> > drm_bridge_state, just mode-related argumetns. Turn it into the
> > atomic_enable callback as suggested by the documentation.
> > 
> 
> mode_set is deprecated but atomic_mode_set is not.

There is no atomic_mode_set() in drm_bridge_funcs. Also:

* This is deprecated, do not use!
* New drivers shall set their mode in the
* &drm_bridge_funcs.atomic_enable operation.

> 
> I would rather use atomic_mode_set because moving to atomic_enable() would
> be incorrect.
> 
> That would be called after encoder's enable and hence changes the sequence.
> That was not the intention of this patch.
> 
> NAK.
> 
> > Acked-by: Maxime Ripard <mripard@kernel.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 33 ++++++++++++++++++++++++++-------
> >   1 file changed, 26 insertions(+), 7 deletions(-)


-- 
With best wishes
Dmitry
