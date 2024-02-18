Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8755485970C
	for <lists+dri-devel@lfdr.de>; Sun, 18 Feb 2024 14:07:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D823D10E0E7;
	Sun, 18 Feb 2024 13:06:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZaUXZMs6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1B9910E0ED
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Feb 2024 13:06:57 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-60837b7a8ddso613667b3.3
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Feb 2024 05:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708261616; x=1708866416; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YBVRcSBBuxFaTxHHxCFDbpb9aYFi0NsXjnHpoTC9kRk=;
 b=ZaUXZMs6OrmEXaNW0qlNtp5XhjrBixfHeFeQMu4S0EzF4WbkpEtNAdgrp62b7odS7j
 oW3CB0uyondGrP/UbZhMuJ13U55jUvKLpE1w8L/2FE1VsikbZyPllEkDFo0hGP099EPt
 ueqZ+YKBLxg+ozVVzPwqE7sHaF7oCNOMRvzBt3DFp9dEzQqE1J7dTzfDvQdyDPJ8bpHa
 cMAciKqwwF2kGHeADuBDDGHZ7yAabVHy3nm1XKWoUZ92gsd9OljZE6F9pMhCcd/bZbeM
 j/CRKeczlKVlkGW8QA1rSaKhQI16wHqfsVVYJjl1F2Ik2yeZMUIzifqfEmKxNscy8vWD
 Q6Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708261616; x=1708866416;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YBVRcSBBuxFaTxHHxCFDbpb9aYFi0NsXjnHpoTC9kRk=;
 b=k5F/uQLwVYosV1A54+Yij/ZS9YYfZvZsFCgiCLcWXXVcpSXF9kZ6/hueNuPgn0r8QL
 9FNO+acl10iDIZvqVWvKhipObM1KfSCYgxMVgY+V2Yz2eues37t0RTH678oivesx3GIT
 qGTManNOsLTmEyRdH4h+6rYijJDb9zZUB4riscpspKQQebMwLCA3SsCGbsc9yH/9YtJk
 fcH/egmBxXeyVBidfi2EVfbasF1cLZaj3cyuLarwaIQSDI/YDXVOpIMSaEjl3EfAzvB4
 GY0hDEvTQ+bGisUBGTPBMmjgHYgJOVWxOABmfNwxNQ+SwX8CpljaHg09sG7sG7swYz8I
 jSpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/wi5wfHd3FVUt1mX+u/Fc5TRDXvYoOhBCr+EovONoACvebiSI1qQFTIfqZXJGxD5aTD+WTQyQTJw6sEzAZF6wGqJQ1+oTYL0B0Rydk+ff
X-Gm-Message-State: AOJu0YxQA6rnHuyD7PTuV9eeHRLH9LoIRq48cOMJoHw6fv8vUOdQejGr
 6S/YSG+Cfk80vQLbPwwpawFS96FxiPfqlps0bMXGaiWJKdyJUB4YnpN1aZGVY7Y+shqUhSOEC/9
 HGNEcoApoWlEkTzkmF58PPX4EoB7GYKltz/vOmg==
X-Google-Smtp-Source: AGHT+IFwAgLxBZXblOBulsbnsc4LQ+Pe2xER0SSlfwoxqWLXlBGUgn+4tkOT1j2KFCAC8mjhS4ohhc82TcyeI7dNm+U=
X-Received: by 2002:a0d:e2d6:0:b0:607:8c84:d474 with SMTP id
 l205-20020a0de2d6000000b006078c84d474mr9844866ywe.31.1708261616529; Sun, 18
 Feb 2024 05:06:56 -0800 (PST)
MIME-Version: 1.0
References: <20240216-x1e80100-display-v3-0-28b1c33ac8c0@linaro.org>
 <20240216-x1e80100-display-v3-2-28b1c33ac8c0@linaro.org>
 <170810832158.3497594.1997532394027797497.robh@kernel.org>
 <ZdCbAjnga8HCMdYf@linaro.org>
In-Reply-To: <ZdCbAjnga8HCMdYf@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 18 Feb 2024 15:06:45 +0200
Message-ID: <CAA8EJpqCKWih1OeMsynMHkS6CAoDTsgRXcv5YAPZNvLT3MfA8g@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: display/msm: Document MDSS on X1E80100
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Sean Paul <sean@poorly.run>,
 Maxime Ripard <mripard@kernel.org>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark <robdclark@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <neil.armstrong@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 17 Feb 2024 at 13:39, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> On 24-02-16 12:32:02, Rob Herring wrote:
> >
> > On Fri, 16 Feb 2024 19:01:06 +0200, Abel Vesa wrote:
> > > Document the MDSS hardware found on the Qualcomm X1E80100 platform.
> > >
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > ---
> > >  .../bindings/display/msm/qcom,x1e80100-mdss.yaml   | 253 +++++++++++++++++++++
> > >  1 file changed, 253 insertions(+)
> > >
> >
> > My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> >
> > yamllint warnings/errors:
> >
> > dtschema/dtc warnings/errors:
> > Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.example.dts:24:18: fatal error: dt-bindings/clock/qcom,x1e80100-dispcc.h: No such file or directory
> >    24 |         #include <dt-bindings/clock/qcom,x1e80100-dispcc.h>
> >       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > compilation terminated.
> > make[2]: *** [scripts/Makefile.lib:419: Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.example.dtb] Error 1
> > make[2]: *** Waiting for unfinished jobs....
> > make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1428: dt_binding_check] Error 2
> > make: *** [Makefile:240: __sub-make] Error 2
> >
>
> These bindings headers are already in -next.

However they are not a part of the drm/msm branch. We can probably
merge the rest of the patches from the series (once patch 1, DPU
bindings, gets reviewed) and merge this one in the next cycle. Does
that sound suitable?

-- 
With best wishes
Dmitry
