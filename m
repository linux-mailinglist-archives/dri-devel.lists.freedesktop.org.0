Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42674905392
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 15:21:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3534A10E830;
	Wed, 12 Jun 2024 13:21:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="L8A+bNpb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 980C310E830
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 13:21:49 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-dfe41f7852cso853304276.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 06:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718198508; x=1718803308; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QaE3/IVsQgFpAVoWWAOoQa4iD4hM/AcKPalY+VYsWQM=;
 b=L8A+bNpb9R8+Y/hvtN5C4tdMljpS4duiT24FhccHQNwZ57sCG0iuhDd+cthlcz0N4W
 xXXNtis0ACTLmgCVUfee2oPU3k19eXuBYQQOxWmT8ZAKu22NFh9ahMU2ucIAvv3pEClG
 767+s+aLR+0QzWShrBy/HSr8z8bo32nJUAdF/FhY+xXUm3q+hNlu74emHVLtsp6QeeE4
 7Poa4P+j2anlc8wpd9jpaJOZKSSmNzqstt9Cp+t0guAFVBIoWjRdme7bEQCgSTMqabsK
 I/cdtUdUTXmzHpzSyWT3Q9GkOqCxBK2S+1qdGDAF3CGsbDzxtd8B5sjw/Wi4tnewRHEK
 k3tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718198508; x=1718803308;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QaE3/IVsQgFpAVoWWAOoQa4iD4hM/AcKPalY+VYsWQM=;
 b=ojXVZn2WHWYBTeh5kOIefrGCEqf0K+yCQVWANtf/VcqhKE7+ftgBCKgZn6afJVp+jy
 rDBuL5lLzsixwIiUd4N6yd9bEUhqIJ1uoVAzeiY9oU/OnPwKvQ5w9fAp+OWvfM1mlC2T
 cc6+Nxcr5qBgJNu5XPqjB+rMFBV05eLaUWzAVts7S/4hwJgqdGLcvK3cAoQ1QW1NFG8b
 CirrqZNd58fJj3o5FIp0uLaQB93L/J7vLypL0w9DPKzCgnVfAJFwXj+D1b0hTYCpRLde
 chb4d5jlg6aNp/WM2M4kkEKbi5uk+w1CaXAa0qjzyUS+b6atq2IF8p3hNqaUTcoEDuiE
 uldA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBDhh0cacbNZelAlYO/ZixEHHgRbij/wbg2iZjxnz9EzaAcEuYF8JWCVHl15zEUtoxOd+E3walSWOBOsI9nM5oz8Iof7siJInZqnGPG8fc
X-Gm-Message-State: AOJu0YxAlvF9aBeLUPQE5yb826tVXw8s5nPnGDJjUQ2Z0LvVZ2azjjXO
 k02DQevwuzctD5OQj4lcCj3dmAYfynAcBSx1bkuhps+jPNpOAsEOKZOedaHVDVEsKFPiCSNmPGg
 +s86sfjPCO0szMCv5Vdofj+Ox3/SuSmlhZ78jBw==
X-Google-Smtp-Source: AGHT+IED4NrVMojf2ugvymFvDTDHoVkUFaTrUqR0EYBjIykxoqNrlFfWmhnWwfv2v2hj4msHRjXm9A9casCYvrHGKeI=
X-Received: by 2002:a25:d8d3:0:b0:dfa:fed0:caee with SMTP id
 3f1490d57ef6-dfe67758c1amr2053151276.39.1718198508029; Wed, 12 Jun 2024
 06:21:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240611223743.113223-1-danila@jiaxyga.com>
 <20240611223743.113223-2-danila@jiaxyga.com>
 <171815244421.3448243.12009673117592867975.robh@kernel.org>
 <727417e8-781c-435c-8abd-f3dfe6b0e5bb@jiaxyga.com>
 <20240612132003.GA1934293-robh@kernel.org>
In-Reply-To: <20240612132003.GA1934293-robh@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 12 Jun 2024 16:21:36 +0300
Message-ID: <CAA8EJpqre9bNH_vk=YH2-a6a5g4r=+o=X=ocL9oo+di8Wf9mUQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: display/msm: Add SM7150 MDSS
To: Rob Herring <robh@kernel.org>
Cc: Danila Tikhonov <danila@jiaxyga.com>, jonathan@marek.ca, krzk+dt@kernel.org,
 quic_khsieh@quicinc.com, linux-arm-msm@vger.kernel.org, 
 quic_rmccann@quicinc.com, sean@poorly.run, tzimmermann@suse.de, 
 mripard@kernel.org, linux-kernel@vger.kernel.org, konrad.dybcio@linaro.org, 
 dri-devel@lists.freedesktop.org, maarten.lankhorst@linux.intel.com, 
 daniel@ffwll.ch, freedreno@lists.freedesktop.org, 
 marijn.suijten@somainline.org, robdclark@gmail.com, conor+dt@kernel.org, 
 swboyd@chromium.org, quic_abhinavk@quicinc.com, devicetree@vger.kernel.org, 
 airlied@gmail.com, quic_jesszhan@quicinc.com, neil.armstrong@linaro.org
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

On Wed, 12 Jun 2024 at 16:20, Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Jun 12, 2024 at 09:19:35AM +0300, Danila Tikhonov wrote:
> > On 6/12/24 03:34, Rob Herring (Arm) wrote:
> > > On Wed, 12 Jun 2024 01:37:40 +0300, Danila Tikhonov wrote:
> > > > Document the MDSS hardware found on the Qualcomm SM7150 platform.
> > > >
> > > > Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> > > > ---
> > > >   .../display/msm/qcom,sm7150-mdss.yaml         | 460 ++++++++++++++++++
> > > >   1 file changed, 460 insertions(+)
> > > >   create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
> > > >
> > > My bot found errors running 'make dt_binding_check' on your patch:
> > >
> > > yamllint warnings/errors:
> > >
> > > dtschema/dtc warnings/errors:
> > > Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.example.dts:25:18: fatal error: dt-bindings/clock/qcom,sm7150-dispcc.h: No such file or directory
> > >     25 |         #include <dt-bindings/clock/qcom,sm7150-dispcc.h>
> > >        |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > compilation terminated.
> > > make[2]: *** [scripts/Makefile.lib:427: Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.example.dtb] Error 1
> > > make[2]: *** Waiting for unfinished jobs....
> > > make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1430: dt_binding_check] Error 2
> > > make: *** [Makefile:240: __sub-make] Error 2
> > >
> > > doc reference errors (make refcheckdocs):
> > >
> > > See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240611223743.113223-2-danila@jiaxyga.com
> > >
> > > The base for the series is generally the latest rc1. A different dependency
> > > should be noted in *this* patch.
> > >
> > > If you already ran 'make dt_binding_check' and didn't see the above
> > > error(s), then make sure 'yamllint' is installed and dt-schema is up to
> > > date:
> > >
> > > pip3 install dtschema --upgrade
> > >
> > > Please check and re-submit after running the above command yourself. Note
> > > that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> > > your schema. However, it must be unset to test all examples with your schema.
> > >
> >
> > Yes, this happened because I forgot to add note (same for both dtbindings):
> > Depends on commit ca3a91063acc (dt-bindings: clock: qcom: Add SM7150 DISPCC
> > clocks)
>
> So then this can't be merged as I imagine that is in a different tree.
> Maybe you want to not use the header for the example.

Danila, please resend using invented clocks like
<&dispcc_whatever_ahb_mdss_clk> instead. I don't want for it to be
delayed further.

-- 
With best wishes
Dmitry
