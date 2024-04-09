Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D610A89E25C
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 20:15:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 599D9112EB1;
	Tue,  9 Apr 2024 18:15:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="P9DaOesi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ED1D112EAB
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 18:15:04 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-516dc51bb72so4184227e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 11:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712686503; x=1713291303; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ewKuaTnqHSwqnUjo+3mcr8T+Gr8KjmBfRFfdV1X9/cs=;
 b=P9DaOesiyGY/4+JW2mmzIiWDYf2LUUDZhC589ejT7F3003JwzNAaSiYPHZHT0Mwplr
 41+upPQmIOI9+eURFiE7c+5sWZjkQEDk6G/zjoF6xzGjAKk0n9eK/Mm+OEGYCERelT5K
 w3aoS6cJbRtE1BJBItppzeCuJjbZVA6y1NXA5a3Kd+saxdGznmHCrxbnArJajvITMIfa
 ga+0QgEAzRFSySt3/ihq3yZNpDyQWX4BV/IME93zKKsH5O8B3LTo8zitKJv+9TaaSnK1
 HIud8b8f9q6eEMf9mQuACPEBrkXu1QHQQvZD7ZwxsMocJk+gqJ/8zlf9uyYiAQMQpEwA
 d7KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712686503; x=1713291303;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ewKuaTnqHSwqnUjo+3mcr8T+Gr8KjmBfRFfdV1X9/cs=;
 b=SLSj/A7vr1cUQOTH8oM/5rICZgo622gTjljZsd0Q3C8WRcb7CS7pZqgHfQoInURWle
 KJCJLqM6arb/ggcslF+MQOXpmotUy7LMPwe968rz1d9rX6NbwuMQcMkQ5Cpb7xxaMK2y
 gLO8or5RiRqgCpic2/9U3/DOaP8MV2DJpH3uq0L0jNwkI4Yyn1l2fvjz0mJJYZpx0i9c
 lGV7fLpXRuC+nDOQdLRkc1xNywaw/cXsRba1jwRk5hd8Gx3t8T5sl38vWglxkHgfss9F
 +VGqswAfWIiszGWZdO1AORNrAnPf/ctbYjx+e6hQIQyr72KO4emZ1RxvJZxEU+dVt5lu
 Az1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpaRQMgwiqnDwtUMQOJCx/PdA7mA0YnLcCLQrD8YtQ+rAiHsVg9+EvZYvEk/F3EJUSCJOfWuX2eTEkHlFF59up82hcHz3MDx3GlulStFd9
X-Gm-Message-State: AOJu0YxF4FhPB4YAz815+RMRz/Xj0qiPo8pclnTgrUufDaudDvZf8huX
 g6YdDbg1QAtqPOIyICppHN3plT8nI6HWWXRCc4GWLB/cf8u8FpgodQ6uz412fm8=
X-Google-Smtp-Source: AGHT+IHOKBwRqaPV0hoQ1y6C/IX+BnMAettrHDxj6xlDe+g9x3LGTn5SnxAhCQ1SAG+5VeqE77F9qw==
X-Received: by 2002:ac2:494b:0:b0:515:9783:938d with SMTP id
 o11-20020ac2494b000000b005159783938dmr126302lfi.63.1712686502552; 
 Tue, 09 Apr 2024 11:15:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzyjmhyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a00e:a300::227])
 by smtp.gmail.com with ESMTPSA id
 b22-20020ac25636000000b00516d30a8d61sm1584192lff.67.2024.04.09.11.15.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Apr 2024 11:15:02 -0700 (PDT)
Date: Tue, 9 Apr 2024 21:15:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/6] drm/msm/adreno: Allow specifying default speedbin
 value
Message-ID: <x4sgmdodoacsu6culbjjsw52ucaylpqj2ll6tkeppllzhfqiqn@lysclxogvcfq>
References: <20240405-topic-smem_speedbin-v1-0-ce2b864251b1@linaro.org>
 <20240405-topic-smem_speedbin-v1-3-ce2b864251b1@linaro.org>
 <pncr7ecf4eir36skul3iwt2nf5bpuwd5zjfzzfwwnxjwe4hoes@6z2xe54crijp>
 <d8a2ef87-f29e-4bdb-a9b8-591b8bd5d2b2@linaro.org>
 <tkcbl2iwcy3feoggbk737gx32qsxe5p4ad6lfrujy2pazccrhm@kif3guuzay6h>
 <CAF6AEGsg2xCCC27t_Gqu=MMQ6tckVw=Zj90p4x7EuOm+VKA=ig@mail.gmail.com>
 <quil2y6tbilihgont2xekay4joxgnsanu3khgo77omtwkolslp@ozuaajpv5uon>
 <b77a3161-9a18-4523-8528-31c2f2f4f476@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b77a3161-9a18-4523-8528-31c2f2f4f476@linaro.org>
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

On Tue, Apr 09, 2024 at 08:07:56PM +0200, Konrad Dybcio wrote:
> 
> 
> On 4/9/24 20:04, Dmitry Baryshkov wrote:
> > On Tue, Apr 09, 2024 at 10:12:00AM -0700, Rob Clark wrote:
> > > On Tue, Apr 9, 2024 at 8:23 AM Dmitry Baryshkov
> > > <dmitry.baryshkov@linaro.org> wrote:
> > > > 
> > > > On Tue, Apr 09, 2024 at 05:12:46PM +0200, Konrad Dybcio wrote:
> > > > > 
> > > > > 
> > > > > On 4/6/24 04:56, Dmitry Baryshkov wrote:
> > > > > > On Fri, Apr 05, 2024 at 10:41:31AM +0200, Konrad Dybcio wrote:
> > > > > > > From: Neil Armstrong <neil.armstrong@linaro.org>
> > > > > > > 
> > > > > > > Usually, speedbin 0 is the "super SKU", a.k.a the one which can clock
> > > > > > > the highest. Falling back to it when things go wrong is largely
> > > > > > > suboptimal, as more often than not, the top frequencies are not
> > > > > > > supposed to work on other bins.
> > > > > > 
> > > > > > Isn't it better to just return an error here instead of trying to guess
> > > > > > which speedbin to use?
> > > > > 
> > > > > Not sure. I'd rather better compatibility for e.g. booting up a new
> > > > > laptop with just dt.
> > > > 
> > > > New speedbin can have lower max speed, so by attempting to run it at
> > > > higher freq you might be breaking it.
> > > 
> > > Usually there are some OPPs in common to all speedbins, so picking a
> > > freq from that set would seem like the safe thing to do
> > 
> > Well, the issue is about an uknown speed bin. So in theory we know
> > nothing about the set of speeds itsupports. My point is that we should
> > simplfy fail in such case.
> 
> Or we could allow e.g. the lowest frequency (or 2) which if often shared
> across the board to work, giving a compromise between OOBE and sanity

That's also an option. But we should not be using existing speed table for
the unknown bin.

-- 
With best wishes
Dmitry
