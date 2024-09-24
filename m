Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8869840E0
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 10:45:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A146810E163;
	Tue, 24 Sep 2024 08:45:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iJTOvAD7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA1B610E163
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 08:45:35 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-6ddceaaa9ddso44683677b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 01:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727167534; x=1727772334; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vLbfRp1GyKsHq9/4yxpkhCrQ4dJsOb/iBgUBX9AZBi4=;
 b=iJTOvAD7Ij/6GmwvM0210L98KHs6djrZXUZeJWw6YHoswuaQYxRIcx3EY7ldVuN/RX
 weumTID1F8aTr5eQwA1LDdAp9g2S731TGIr6lJRExmh1k0DCnGUW8MyO+PsU64GIOeiI
 +cRXn3d6CaPcw1brQakgKv/vM0QQNxhNBTEJzsj9GFXRbliYyT3wYgo7aIdCR6R9OiNT
 JOcblyENpQK3hxX2NZM35RwRJ21zq97omjhGm9f4EsctQnA2HFPQVcTLH2izXKIakske
 dH3AIvSIbANp/Gsp1w/PIHmqLJIKO2jQd12AXz0WJ/jJSiztpNoeidOrAyEu1KXVrZID
 zfDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727167534; x=1727772334;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vLbfRp1GyKsHq9/4yxpkhCrQ4dJsOb/iBgUBX9AZBi4=;
 b=dNftoCuAfgUH6A/MJsaAUA4jMOU7fuzZ7KyRH9TOqJJGP5iig0rJjbflXiJOqd3qkL
 Nn2S5i/IWYWswMHd4F8lKkzfqaTqkUDNPimyhiQbfcbvmd+ucf8zvI1Tr9GyIvIwroZX
 db0d45w6Fb8V4Qj4Y9deAay8F+shjsrSrqUl7DyTFQQo5hxH1yD2dEY4MHg2RD1dUQHH
 KTVgo0XhUNaPGb8fPaIci3hIjxaA3/LaugE/pB4lu78inWAUkDTXvcN+aV30JIh4YZFS
 PS8GF0eCM8aehhO0POpKdvZt/xRXd2jNaz+K7wYcLQIcaWHTQ44WIRXTdj9GdRgWie9X
 IF8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWU4GlD6elUJkmCE0jQ8eKmeKRLG5PKlNB0WiC3AhZzvSNyp85vBlRfpGs+EDyfmwkdfAydb9aBsO4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyeVtKTmdNNruLnSz393frNmSN1QcfcAp7WM9E3NN7zDpeO0Jw6
 +LjBP0Mzf260CXUEIaTQtGjgY/OJUZGrYfhoTEC/X0cSos+56yI1IlOYA52LUOuK6nXshBSHQAl
 9n6psKHjoxH/rpmkw7e4XWfMnYWzNo9mCfZNmYw==
X-Google-Smtp-Source: AGHT+IGe9j0q8Q9cKjNhdaZZKSjTbUKB7QpzrQxyjIHHRXX/F/YDICTnOwTO73wcqvDaKSh0zF8icqhvgh5hpB8zmqc=
X-Received: by 2002:a05:690c:b8e:b0:6d3:4c37:d652 with SMTP id
 00721157ae682-6dfeed618admr131284717b3.24.1727167534556; Tue, 24 Sep 2024
 01:45:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240912071437.1708969-1-quic_mahap@quicinc.com>
 <20240912071437.1708969-6-quic_mahap@quicinc.com>
 <kxxcjrqndc2qzmexn4mm4vmfugfo23y63aa6oyia3uiwpe3arr@sbvdni2f2hq2>
 <a09e0bb8-5de9-4633-ab0f-161ec5800346@quicinc.com>
In-Reply-To: <a09e0bb8-5de9-4633-ab0f-161ec5800346@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Sep 2024 10:45:23 +0200
Message-ID: <CAA8EJpqt=jeZtEeCBfr8kOgaOD+WchphbzsAQkbnWJsWQZfj-A@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: qcom: sa8775p: add display dt nodes
To: Mahadevan P <quic_mahap@quicinc.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
 marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, swboyd@chromium.org, 
 konrad.dybcio@linaro.org, danila@jiaxyga.com, bigfoot@classfun.cn, 
 neil.armstrong@linaro.org, mailingradian@gmail.com, quic_jesszhan@quicinc.com, 
 andersson@kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 quic_kalyant@quicinc.com, quic_jmadiset@quicinc.com, 
 quic_vpolimer@quicinc.com
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

On Tue, 24 Sept 2024 at 09:36, Mahadevan P <quic_mahap@quicinc.com> wrote:
>
>
> On 9/12/2024 1:30 PM, Dmitry Baryshkov wrote:
> > On Thu, Sep 12, 2024 at 12:44:37PM GMT, Mahadevan wrote:
> >> Add mdss and mdp DT nodes for SA8775P.
> >>
> >> Signed-off-by: Mahadevan <quic_mahap@quicinc.com>
> >> ---
> >>   arch/arm64/boot/dts/qcom/sa8775p.dtsi | 85 +++++++++++++++++++++++++++
> >>   1 file changed, 85 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> >> index 67ba124d20f8..d5d8e02fdb29 100644
> >> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> >> @@ -6,6 +6,7 @@
> >>   #include <dt-bindings/interconnect/qcom,icc.h>
> >>   #include <dt-bindings/interrupt-controller/arm-gic.h>
> >>   #include <dt-bindings/clock/qcom,rpmh.h>
> >> +#include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
> >>   #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
> >>   #include <dt-bindings/clock/qcom,sa8775p-gpucc.h>
> >>   #include <dt-bindings/interconnect/qcom,sa8775p-rpmh.h>
> >> @@ -2937,6 +2938,90 @@ camcc: clock-controller@ade0000 {
> >>                      #power-domain-cells = <1>;
> >>              };
> >>
> >> +            mdss0: display-subsystem@ae00000 {
> > Is there going to be mdss1?
>
>
> Currently we don't have plan to enable mdss1. Do we need to rename label
> to just "mdss" in that case?

No, please keep mdss0. Just explain what you are doing in the commit message.

-- 
With best wishes
Dmitry
