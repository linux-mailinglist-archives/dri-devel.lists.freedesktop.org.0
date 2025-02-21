Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A998A3F60F
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 14:33:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F344B10E34D;
	Fri, 21 Feb 2025 13:33:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kgIf248A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 507DE10E214
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 13:33:52 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-54298ec925bso3099149e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 05:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740144830; x=1740749630; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ieh7CBVPmu3X5DHV02AR8XvoaNx/S0Yj7VuoRST8SJM=;
 b=kgIf248A8oagC6FRMSJoFOAl2ZhctXQCmd+yAvtgWp6U1ZWy0WhY34rktXmky/f2Of
 zeVBA2d0wp/61Kog0rM9Jno/NTfi7AMXg+gjBDNLU80kKNP5tFT8XwhqyIx1Lcdsrd60
 6k9u/BiCI6RcXyGFywx74B8qtC/mFmcp5saLoZZTeEcr6uyhZFF5mGxDPIHCCMk9bSO8
 TecgA3Aqwh6UtiDCAvwUD3QHBw9muIMdlHsIQyukKNoo8rp+N00tcZtaC5i5OoTIjmb6
 EkTm6ac3Krm0Es7m5gBNhPlB/j0uFqss9AzHdPK/4rrFkpnQz/56qj9MGfE199aC7SPI
 nlFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740144830; x=1740749630;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ieh7CBVPmu3X5DHV02AR8XvoaNx/S0Yj7VuoRST8SJM=;
 b=FyKw+7VSzY42knMbta1+TKUIXyKmfnPQTfkbVwDLtmcW7mdmTAtnVC8xJTE9VsYvyY
 5K1YmRaCuI9HOCzjEVdtmPjNuYklqHDVFCwSrx8mFNlgU9F4ieF0he5Pc2Hy+aBqJjsu
 zG7fmgw5NGmDfUKHCWw5NjyRqoFQC9UO+x7zg4kbl1b2SpFpD41Se8Y8N6/AhJIUPPyE
 c+rHkafHEfO7rydIc7G7eNTctwNZ/rtOBHXaAjZTDvv0mpV6GpI0QdROtelP/D0cr3+d
 Dtbu7NdyV7LMNzZK8uLZFRvw9WRhBhQHphiTIimk5aS/auoyR7BZo2YHqWZwnSeFw/8c
 ZVoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEiBPrNv5R+5v6V/AdlQUbuvlZLEU13HRxAvDxi/qAOGUyk3Eah4NjSH4lgJCbG10tDiVI0/tMoZM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxITtzeww3y+6iWgmdLm2Mh3Cuq9j+tlIgWoFTTyjuLTtAjgLv9
 lSuMvIPSQv2eMN3MCsh2mirzrtMZYKXTL0mKTvC+p2duGr/vS0tckA04dDwlGXU=
X-Gm-Gg: ASbGnct0BeNXNArC3tQil5vdPSWPCYG/bKM0JlL3mVEzi/Qy1M6e8yBem6mwDqDeI1d
 umjUPc1WOn6GSg7OW36Q0EIFgRQJdCzu8BLemZSq8QUyflirgEY1k6Q2Q/mrBUlecv+ugHZiHX3
 5LACzIJ1UmEdJr4hDXuNPOBCBiSBkG39mfND3/OKbrV0u3YhVny5IjE7gnH+t9/xfNhgtnfc9nr
 CX40Ew/KiUeo3jERdPH+gcaOlrD6iimcKFmPLIXhCtr/IWsjIOCWZMJkHyylRNLYRxXbPT7yh7E
 vAjuJm4BKsO3MQrtGkqjkcdzzD4HFBhGSY1t1EWVDF7vdQgCSFlUHidXfbkZrm+RKNdwg3lLMNP
 4O4nYKA==
X-Google-Smtp-Source: AGHT+IHiz5c3L+HbXFi2J+BpEhRbGbpZKCFTjF5dKolaGhW+97N+o7e5V/9KYwQhome4h/soVI0ylQ==
X-Received: by 2002:a05:6512:3b0a:b0:545:ab8:2be4 with SMTP id
 2adb3069b0e04-54838ef5a15mr1252449e87.27.1740144830527; 
 Fri, 21 Feb 2025 05:33:50 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5452e4b08dasm2235004e87.87.2025.02.21.05.33.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 05:33:49 -0800 (PST)
Date: Fri, 21 Feb 2025 15:33:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 15/16] drm/msm/dpu: Implement new v12.0 DPU differences
Message-ID: <nls3qurambg6ioecf2y7zp74sekgmshlu4nskpelulvfad36lv@4tpangvp7m4a>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
 <20250217-b4-sm8750-display-v2-15-d201dcdda6a4@linaro.org>
 <qlotuliwnm5spneolztca7avmh2a46pz2xqlxzqbw5kwa53m6q@oyhnzz7fhay3>
 <4b2426d2-a7bb-4c19-9ebe-77f6a90caf5e@linaro.org>
 <CAA8EJpquBhQeac0E66NqeagkxP-qY0whmah2ND0xziUQdxc_7g@mail.gmail.com>
 <883fed07-1d21-4ab1-8c72-9a1750ec1606@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <883fed07-1d21-4ab1-8c72-9a1750ec1606@linaro.org>
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

On Fri, Feb 21, 2025 at 01:36:51PM +0100, Krzysztof Kozlowski wrote:
> On 19/02/2025 18:24, Dmitry Baryshkov wrote:
> > On Wed, 19 Feb 2025 at 19:04, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 17/02/2025 20:18, Dmitry Baryshkov wrote:
> >>> On Mon, Feb 17, 2025 at 05:41:36PM +0100, Krzysztof Kozlowski wrote:
> >>>> Implement new features and differences coming in v12.0 of DPU present on
> >>>> Qualcomm SM8750 SoC:
> >>>> 1. 10-bit color alpha.
> >>>> 2. New CTL_PIPE_ACTIVE and CTL_LAYER_ACTIVE registers for pipes and
> >>>>    layer mixers.
> >>>> 2. Several differences in LM registers (also changed offsets) for LM
> >>>>    crossbar hardware changes.
> >>>
> >>> I'd really prefer for this patch to be split into a logical chunks
> >>> rather than "everything for 12.x"
> >> everything 12.x is still logical chunk. I can split more, but without
> >> guidance what is here logical chunk, will be tricky.
> >>
> >> For example 10-bit color alpha looks like separate feature. But
> >> remaining PIPE/LAYER active - not sure.
> >>
> >> I can split them but I would not call such split necessarily logical.
> > 
> > I'd say, the following items are logical chunks:
> > - ctl->ops.active_fetch_pipes in dpu_encoder_helper_reset_mixers() and
> > dpu_hw_ctl_reset_intf_cfg_v1() (with a proper Fixes tag?)
> 
> 
> Ack
> 
> > - 10-bit alpha, border color,
> 
> 
> Ack,
> 
> > - active_pipes
> > - blend stage in LM + set_active_lms
> 
> 
> Ack,  but you do understand that this is purely from new hardware, so
> new registers. Even the 10bit border color is actually for new
> registers. It makes no context outside of new hardware. same here.

Yes. However those changes are logically separate, they cover different
parts of new HW. So it makes it easier for anybody reviewing those
changes (now or later).

> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry
