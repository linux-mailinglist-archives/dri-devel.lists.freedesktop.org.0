Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD4E85A1EE
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 12:28:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38D7089263;
	Mon, 19 Feb 2024 11:28:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iW49KJJs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D5EF89263
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 11:28:49 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-56454c695e6so1601358a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 03:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708342127; x=1708946927; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nCyAWccqRzJ02Jr3HnjydtbclYSZbIBmeAFchAjZvoE=;
 b=iW49KJJs6DX7qebl5vturza0BLqzq/cOiBr67vpRSPSgGZhtfgDgNJf7S++YCHMwDc
 0T5xU7IQNmP0tAefpVfhjm4gV/a3CwCqRg2c0p4dLrhPaAnCSSzcHiW2j8BxjSZR5DYY
 jOY7JVFbUaTThsW7rc8AimYNdNQfHRtGrjCOw2OR0/94oQImL3W1VzDL4u0kVLshYsH0
 IbtzyApqatYt+YQYBIGNf07QLBDxu4cui3nL1Rh+suv4daN8NW8V9MAhPn0w74BBMP6K
 0hqVLWXOOVzD3qK32pUwmw8T4qY6Tm7gxTQw8LpdtASkJsNzs/z9gbSzNMtQbFRJY7LG
 Augg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708342127; x=1708946927;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nCyAWccqRzJ02Jr3HnjydtbclYSZbIBmeAFchAjZvoE=;
 b=MF8c7BsUi8mxPj9WRdgSW6JnZIaC2EcMMAXuwLjNJfPlPqjtlc2bEMHt5MhGTa9jPL
 +iFLn65MEmjACh9snbv2yteI+LGnvb8J7bv0y7TBU1H3utXvWy0ZDOhNuvD65GFWmo9a
 wIVyG94H68/FCFnznWInm1369R/dTD5PGaxS/izdeOGsHJwrM7T6WBBcT2Euu7r2wgHi
 JdQDRtYcsh0F/hcejF2wHgs36RvfjRChNHr7DH4Xwu0+UjtEkXLUJdBdPsFVTqc9qD+p
 9fiGjUCHqvihWMbGAI7hFowOh7yTIu0M8aFfgnKKHKmv4/9bSTRtbFiSiDSh/l8h5nGE
 WGlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDO0tvB7hq4A/i5SqCCDFnuNCmKDJ0RJ80JXzXx5QceGe+vkz1isEtasApdhAmo466hJdAZuGCzeyvbRx3iSafec0axIt9pdRpVRc05OSi
X-Gm-Message-State: AOJu0YzeNKkigKfkWBIM6Ubu15labsynNVgUeDh7q1itIug9jPalSOoO
 ffphX8CKh6EyBe5b/iU+PaFM2pkzrHBUVDhhBhQiKCItFlAKM7ya8XTWJuBAs3Q=
X-Google-Smtp-Source: AGHT+IE3Zoj5Kw00K+Q1Oq/u8jQF4xulPdA6ZClow24TWEYwMXrNi35dMdqJQqanNvP5Txi3Qumx2Q==
X-Received: by 2002:aa7:d304:0:b0:564:4647:947d with SMTP id
 p4-20020aa7d304000000b005644647947dmr3745838edq.3.1708342127493; 
 Mon, 19 Feb 2024 03:28:47 -0800 (PST)
Received: from linaro.org ([188.24.162.93]) by smtp.gmail.com with ESMTPSA id
 e26-20020a50d4da000000b00564024b7845sm2797505edj.38.2024.02.19.03.28.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 03:28:47 -0800 (PST)
Date: Mon, 19 Feb 2024 13:28:45 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Sean Paul <sean@poorly.run>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 2/4] dt-bindings: display/msm: Document MDSS on X1E80100
Message-ID: <ZdM7beFZPyHKJnEU@linaro.org>
References: <20240216-x1e80100-display-v3-0-28b1c33ac8c0@linaro.org>
 <20240216-x1e80100-display-v3-2-28b1c33ac8c0@linaro.org>
 <170810832158.3497594.1997532394027797497.robh@kernel.org>
 <ZdCbAjnga8HCMdYf@linaro.org>
 <CAA8EJpqCKWih1OeMsynMHkS6CAoDTsgRXcv5YAPZNvLT3MfA8g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpqCKWih1OeMsynMHkS6CAoDTsgRXcv5YAPZNvLT3MfA8g@mail.gmail.com>
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

On 24-02-18 15:06:45, Dmitry Baryshkov wrote:
> On Sat, 17 Feb 2024 at 13:39, Abel Vesa <abel.vesa@linaro.org> wrote:
> >
> > On 24-02-16 12:32:02, Rob Herring wrote:
> > >
> > > On Fri, 16 Feb 2024 19:01:06 +0200, Abel Vesa wrote:
> > > > Document the MDSS hardware found on the Qualcomm X1E80100 platform.
> > > >
> > > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > > ---
> > > >  .../bindings/display/msm/qcom,x1e80100-mdss.yaml   | 253 +++++++++++++++++++++
> > > >  1 file changed, 253 insertions(+)
> > > >
> > >
> > > My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> > > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> > >
> > > yamllint warnings/errors:
> > >
> > > dtschema/dtc warnings/errors:
> > > Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.example.dts:24:18: fatal error: dt-bindings/clock/qcom,x1e80100-dispcc.h: No such file or directory
> > >    24 |         #include <dt-bindings/clock/qcom,x1e80100-dispcc.h>
> > >       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > compilation terminated.
> > > make[2]: *** [scripts/Makefile.lib:419: Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.example.dtb] Error 1
> > > make[2]: *** Waiting for unfinished jobs....
> > > make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1428: dt_binding_check] Error 2
> > > make: *** [Makefile:240: __sub-make] Error 2
> > >
> >
> > These bindings headers are already in -next.
> 
> However they are not a part of the drm/msm branch. We can probably
> merge the rest of the patches from the series (once patch 1, DPU
> bindings, gets reviewed) and merge this one in the next cycle. Does
> that sound suitable?

Fine by me.

> 
> -- 
> With best wishes
> Dmitry
