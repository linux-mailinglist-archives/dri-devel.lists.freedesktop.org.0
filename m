Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB82A5965B
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 14:31:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A4E010E464;
	Mon, 10 Mar 2025 13:30:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="N6gaNjDS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA38810E464;
 Mon, 10 Mar 2025 13:30:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6A844A45CF4;
 Mon, 10 Mar 2025 13:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED397C4CEF1;
 Mon, 10 Mar 2025 13:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741613455;
 bh=7DK+rBnIB6+gK5GprT7obsuYQKNEBuzPpYg+bZU61VM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=N6gaNjDSopjXklq/smuCritonxIFRZcviors5Z6GWB5x2DpMe9pO4/a1jaWMwCMRO
 XKM0+fEzSCVucV5ScvQoQ4r3iOQZWQMoaLcQwNYuCYgYOPHTldegww1SII5Cau6QnD
 Ju03QmZ8EZu0/Et5J9/gLX9NlW2ViKuUxQAbeyiJOzIgHK/EPz0Rs0AsEuTpPIuBkf
 s7vhEeKFI5S7yvD9DwzksfDuNkTyjBrUjAYlCAPqeey+zdk2sx/hHA0zHc9pJZtbEU
 VDn34iKB3dun0ff6ieYvPwjaWIEv4a1r+crojlHQkLeNctJcxqWBGH9useMMIp3X/m
 2Nxnwt4X2GZBw==
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-5e5e22e6ed2so4920124a12.3; 
 Mon, 10 Mar 2025 06:30:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVZbDGPQcau8RH4sc5hR76x5jFPw2M3TrpsCajfiQJOpYwPxQ6NpAXHYchuyq+EvCWzyfVHj0dABJZv@lists.freedesktop.org,
 AJvYcCW15J8sTY7vTuCPWgj+oQH6Wn0GCoBerb90iKkXOj3JXlKAK0TicjUOxOxLtkuwPw/hTgKMDgscE1w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+lBOvsVcpMQrG6n8JZfkYvZv4l0EchXq6ICuT7GpWnF7xa01d
 1szOf495EfF8GIcbMTWn7Znv+9ndi2m9x8RaHqwfASgzI4+m/2oD5btUTeyup0iF+M+yEfG3gRo
 dfSb3vkb0K+SdVQ0AGX0R+qnlCA==
X-Google-Smtp-Source: AGHT+IHQqQev9Mt/kBzD3p7JhI6eC5lr1d6ht0exKs8fcQ7bw7GOc5LSSjJJgeGQCo3IH1yYOPaQ4qbZnGMKJ40RyrI=
X-Received: by 2002:a05:6402:4409:b0:5e7:110a:c55 with SMTP id
 4fb4d7f45d1cf-5e7110a0c6dmr3695220a12.18.1741613453358; Mon, 10 Mar 2025
 06:30:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250308-sar2130p-display-v1-0-1d4c30f43822@linaro.org>
 <20250308-sar2130p-display-v1-5-1d4c30f43822@linaro.org>
 <174140525677.1770282.3232695979994091275.robh@kernel.org>
 <nddxntwmiyurqew75gc6yoj2dcinhjqu36cdujhruqyrz62ry5@4e2y76ghmo4h>
In-Reply-To: <nddxntwmiyurqew75gc6yoj2dcinhjqu36cdujhruqyrz62ry5@4e2y76ghmo4h>
From: Rob Herring <robh@kernel.org>
Date: Mon, 10 Mar 2025 08:30:41 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ6iYm-8BF+4QwimAX69jmivpCNqKbD_AtWkKDtAn_Wgw@mail.gmail.com>
X-Gm-Features: AQ5f1JqRkP_MsxtbTrRXJIVMatqOMN_D3NTt1ZS-seDKkCW2KxLIXoxniVXXOnU
Message-ID: <CAL_JsqJ6iYm-8BF+4QwimAX69jmivpCNqKbD_AtWkKDtAn_Wgw@mail.gmail.com>
Subject: Re: [PATCH 05/10] dt-bindings: display/msm: Add Qualcomm SAR2130P
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Conor Dooley <conor+dt@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Clark <robdclark@gmail.com>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, freedreno@lists.freedesktop.org, 
 Bjorn Andersson <andersson@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Jonathan Marek <jonathan@marek.ca>,
 Maxime Ripard <mripard@kernel.org>, 
 iommu@lists.linux.dev, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Mar 7, 2025 at 11:09=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Fri, Mar 07, 2025 at 09:40:56PM -0600, Rob Herring (Arm) wrote:
> >
> > On Sat, 08 Mar 2025 03:42:23 +0200, Dmitry Baryshkov wrote:
> > > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >
> > > Describe the Mobile Display SubSystem (MDSS) device present on the
> > > Qualcomm SAR2130P platform. It looks pretty close to SM8550 on the
> > > system level. SAR2130P features two DSI hosts and single DisplayPort
> > > controller.
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >  .../bindings/display/msm/qcom,sar2130p-mdss.yaml   | 445 +++++++++++=
++++++++++
> > >  1 file changed, 445 insertions(+)
> > >
> >
> > My bot found errors running 'make dt_binding_check' on your patch:
> >
> > yamllint warnings/errors:
> >
> > dtschema/dtc warnings/errors:
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings=
/display/msm/qcom,sar2130p-mdss.example.dtb: dsi@ae94000: compatible: 'oneO=
f' conditional failed, one must be fixed:
> >       ['qcom,sar2130p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
> >       'qcom,sar2130p-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', =
'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', =
'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', =
'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', '=
qcom,sc7280-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qco=
m,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,s=
m6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm71=
50-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-=
dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi=
-ctrl']
> >       'qcom,sar2130p-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290=
', 'qcom,mdss-dsi-ctrl']
> >       from schema $id: http://devicetree.org/schemas/display/msm/dsi-co=
ntroller-main.yaml#
>
> It looks like the patch 2 could not be applied and was skipped. Is the
> bot parsing the dependencies from the cover letter?

No, it's not that smart. I need to move it to using b4 though that has
its own quirks when no dependencies are given.

Rob
