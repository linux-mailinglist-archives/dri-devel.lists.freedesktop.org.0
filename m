Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E768AD511
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 21:44:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43897112D1D;
	Mon, 22 Apr 2024 19:44:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vqWg573b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2266112D20
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 19:44:47 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-51acc258075so3805068e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 12:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713815086; x=1714419886; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=O5xyyivQsMTHQ7dLcNsluj0Jp99yRb62wMbu9zf5p5s=;
 b=vqWg573bjFvkbJvyNgAyj/SLqfjjjJ3uA/uEZNbNxAP8/vR/szxLhrKdlX8nauqh3H
 6Bw1fy9Zlzm/6GYtlTVRj+xmYrkOUss7wQu5Q1cPA/QfiWX62uiqRiN9XGFPyH7ErS99
 hmbWztF/wTjy4GWS/dWPRs/qgr7sFGY6LIrZEd/3/+0L5BYQ7LKosrFEbYgLt4PCBEnm
 y8s05Y/Qx26d+e4t4u/jjtXsNJQpFLPiiDn29sMAnCpTPnDv3vHRf5pv0DMuzU3DGRZ2
 TjQcdlyje1dDYYHGj8xY3T006Dxstx9gmAdgXhTgDHhP3rWb0nWEMpSosVp9GXyiF3S5
 XoQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713815086; x=1714419886;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O5xyyivQsMTHQ7dLcNsluj0Jp99yRb62wMbu9zf5p5s=;
 b=YslF0tY+Yrfk4ExXR4vWyjfuE0teoLDgxy6GAZtInCst2BNi/ZOBS/J56HLplkMuSH
 eEPDsOj0V8+2I//YCIswOXgX9xJ9PmZ44qn8yUamJqBV+Sp2DXVFWxWxuN4itFi356Sh
 R53UrpIdcz3G/yGaZi5TQsp39daLFKkFqL/i0ERHViA9N8AZmRZ8rxnppEC6lHvBdZHJ
 zreEo0BaURTLiAgnSkuz/OiQc9rD5Dgj9Tif8TaegV5ngCGDkKnRXr2IZ6COt5piuNUn
 Yp6iP2kDRfSGIlowtnPA23M2FwBtoM6x+4Nqo7sWg22AmyY6VZQXxHhZLQKJzkhGonTe
 Sc9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYV81ilpBcU3v33c1ThdvZ1HIF3douxxdqhW3KPjUkfaeWuCKWA3y9lS8m8EkzgYRqTgfNdIAcRey/zOhzBAeWF0IxRsut408F15zsVZx8
X-Gm-Message-State: AOJu0YymDKPaPUuFOLD09Rm8HsXC2/e9f+5euEps6hNGNhzPaZaz8XTP
 FeKWekphR3mHlBZmOX4eIEzJ+Svg16bCVWkjO1g4yLyvknvO7oBf0PUmxtiwUbQ=
X-Google-Smtp-Source: AGHT+IFB1Kv7g4uVpDs46ZAzOEBDJZtGjxsU0UGxK762fiEgaJ1n/WHkpnV0MuYvu79JTdl4W3x0SQ==
X-Received: by 2002:a05:6512:3af:b0:51a:d7c7:769f with SMTP id
 v15-20020a05651203af00b0051ad7c7769fmr4830577lfp.65.1713815085997; 
 Mon, 22 Apr 2024 12:44:45 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
 by smtp.gmail.com with ESMTPSA id
 r1-20020ac25a41000000b00516c1fa74e3sm1824681lfn.207.2024.04.22.12.44.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 12:44:45 -0700 (PDT)
Date: Mon, 22 Apr 2024 22:44:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] drm/msm: don't clean up priv->kms prematurely
Message-ID: <ohzwt5llvvogo46757iemkrnqwdzwqldi3bhbgvk4pxsp3wpuo@enc4bzir3uur>
References: <20240420-mdp4-fixes-v1-0-96a70f64fa85@linaro.org>
 <20240420-mdp4-fixes-v1-1-96a70f64fa85@linaro.org>
 <67fbd629-3e80-b706-83a3-7baff3efd6c1@quicinc.com>
 <n7eet54g72usmuh4hdz6yce3i4ieweu4orgd7gewu7y53ejucc@dzmq2a2wdxkc>
 <456bb6f6-03cc-aae1-b7d5-9d97300ba383@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <456bb6f6-03cc-aae1-b7d5-9d97300ba383@quicinc.com>
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

On Mon, Apr 22, 2024 at 09:12:20AM -0700, Abhinav Kumar wrote:
> 
> 
> On 4/21/2024 3:35 PM, Dmitry Baryshkov wrote:
> > On Sat, Apr 20, 2024 at 04:02:00PM -0700, Abhinav Kumar wrote:
> > > 
> > > 
> > > On 4/19/2024 7:33 PM, Dmitry Baryshkov wrote:
> > > > MSM display drivers provide kms structure allocated during probe().
> > > > Don't clean up priv->kms field in case of an error. Otherwise probe
> > > > functions might fail after KMS probe deferral.
> > > > 
> > > 
> > > So just to understand this more, this will happen when master component
> > > probe (dpu) succeeded but other sub-component probe (dsi) deferred?
> > > 
> > > Because if master component probe itself deferred it will allocate priv->kms
> > > again isnt it and we will not even hit here.
> > 
> > Master probing succeeds (so priv->kms is set), then kms_init fails at
> > runtime, during binding of the master device. This results in probe
> > deferral from the last component's component_add() function and reprobe
> > attempt when possible (once the next device is added or probed). However
> > as priv->kms is NULL, probe crashes.
> > 
> 
> Got it, a better commit text would have helped here. Either way,

I'll update the commit text with the text above.

> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

-- 
With best wishes
Dmitry
