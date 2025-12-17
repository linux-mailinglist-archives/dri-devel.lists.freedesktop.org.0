Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0419CC5AD3
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 02:11:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B13010E9BC;
	Wed, 17 Dec 2025 01:11:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IW+u+3nc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 063A210E9BA
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 01:11:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C348143ECF
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 01:11:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1B75C113D0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 01:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765933892;
 bh=MXgPKG8iRfkTFawV2oSImacMVNXGvhEiH8MGNITDwA4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=IW+u+3nczVZaINBAQ1QjfaazCCUDmQRutEBGGT3pC9Y5yFOA0Z9H4psC4Cw7O4cVG
 srPzV8kw9hqx3UyBALMfmh4NBXsx7zbqI1bdqb4FpWFXa6bgQjW+7sY+WO6YrThJda
 2gl8xSYEarTxDICvrn9yhXq39U/VIuXZUcJCieh8B2T4PP0UoPn8IjxL0jRPmek4HF
 iI6WrQSK5qGkth+cAhD14U8jfPH89eaSXdjLysWq67vp/iMBJm9LxfDzeb4H3ol4yL
 sT1pKzcFUGwvVX9ZdHBuYT41C77jkyRBojSK8PkhS9c9IbaIoQ5AUev/7ukbK5RBIR
 BC0s5rXJrX6jQ==
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-b7cee045187so17817666b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 17:11:32 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVsBR62XB2JphtTR1Zyeca77KpOoLVUdmV4PKS8gR9vnYC4tTN0uKN7h/wDZvu96QkSTcdoOvssz2M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/gaDTRHdBz3n8H+wlFPzxNB1qehTUSaNm8htso3AHXTB0fWL1
 D9c/wzpSt8w8AVqLUGPI/oO/R+IdTZqgO4EUWmas7SBpcpY6crA1HU0iivAFoCN0UWTCrneuuR1
 MIZ4hDhF3tpFxXZLU2Frz1c5/RPAdzA==
X-Google-Smtp-Source: AGHT+IH09y1FeXff7WBmHOEaH+Zc84L3PQbeNaF4MwmrKwymOAKuz5AT1JAJzHLecGEAbQVqo5eyKty7glWQNifAwAE=
X-Received: by 2002:a17:907:7ba6:b0:b70:4f7d:24f8 with SMTP id
 a640c23a62f3a-b7d2184b2c0mr1888659466b.22.1765933891233; Tue, 16 Dec 2025
 17:11:31 -0800 (PST)
MIME-Version: 1.0
References: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
 <20251215083854.577-5-yuanjie.yang@oss.qualcomm.com>
 <176579137354.1486530.823295322686100207.robh@kernel.org>
 <aUEG3TL34CM2V5Z+@yuanjiey.ap.qualcomm.com>
In-Reply-To: <aUEG3TL34CM2V5Z+@yuanjiey.ap.qualcomm.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 16 Dec 2025 19:11:19 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLR8e4FND5LfAVB+cJDMiFpgBTKZtpEDDQiuQfGJu2LKg@mail.gmail.com>
X-Gm-Features: AQt7F2qrp-LAixPGVqyvJ3BRA4shV026jLgADH15ncdaEmvmHwSZG96LHZNTP68
Message-ID: <CAL_JsqLR8e4FND5LfAVB+cJDMiFpgBTKZtpEDDQiuQfGJu2LKg@mail.gmail.com>
Subject: Re: [PATCH v3 04/11] dt-bindings: display/msm: qcom,kaanapali-mdss:
 Add Kaanapali
To: yuanjiey <yuanjie.yang@oss.qualcomm.com>
Cc: yongxing.mou@oss.qualcomm.com, robin.clark@oss.qualcomm.com, 
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org, conor+dt@kernel.org, 
 devicetree@vger.kernel.org, konrad.dybcio@oss.qualcomm.com, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 krzk+dt@kernel.org, neil.armstrong@linaro.org, jesszhan0024@gmail.com, 
 airlied@gmail.com, maarten.lankhorst@linux.intel.com, 
 linux-arm-msm@vger.kernel.org, lumag@kernel.org, simona@ffwll.ch, 
 tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com, sean@poorly.run, 
 marijn.suijten@somainline.org, abhinav.kumar@linux.dev, mripard@kernel.org
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

On Tue, Dec 16, 2025 at 1:14=E2=80=AFAM yuanjiey <yuanjie.yang@oss.qualcomm=
.com> wrote:
>
> On Mon, Dec 15, 2025 at 03:36:13AM -0600, Rob Herring (Arm) wrote:
> >
> > On Mon, 15 Dec 2025 16:38:47 +0800, yuanjie yang wrote:
> > > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > >
> > > Kaanapali introduces DPU 13.0.0 and DSI 2.10. Compared to SM8750,
> > > Kaanapali has significant register changes, making it incompatible
> > > with SM8750. So add MDSS/MDP display subsystem for Qualcomm Kaanapali=
.
> > >
> > > Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > ---
> > >  .../display/msm/qcom,kaanapali-mdss.yaml      | 297 ++++++++++++++++=
++
> > >  1 file changed, 297 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/display/msm/qco=
m,kaanapali-mdss.yaml
> > >
> >
> > My bot found errors running 'make dt_binding_check' on your patch:
> >
> > yamllint warnings/errors:
> >
> > dtschema/dtc warnings/errors:
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings=
/display/msm/qcom,kaanapali-mdss.example.dtb: phy@9ac1000 (qcom,kaanapali-d=
si-phy-3nm): reg: [[0, 162271232], [0, 460], [0, 162271744], [0, 128], [0, =
162272512], [0, 1024]] is too long
> >       from schema $id: http://devicetree.org/schemas/display/msm/dsi-ph=
y-7nm.yaml
> >
> > doc reference errors (make refcheckdocs):
> >
> > See https://patchwork.kernel.org/project/devicetree/patch/2025121508385=
4.577-5-yuanjie.yang@oss.qualcomm.com
> >
> > The base for the series is generally the latest rc1. A different depend=
ency
> > should be noted in *this* patch.
> >
> > If you already ran 'make dt_binding_check' and didn't see the above
> > error(s), then make sure 'yamllint' is installed and dt-schema is up to
> > date:
> >
> > pip3 install dtschema --upgrade
>
> pip3 install dtschema --upgrade
>
> After update package,
> and use=EF=BC=9A  make dt_binding_check   I see the same issue.
>
> but use single check:
> make dt_binding_check DT_SCHEMA_FILES=3DDocumentation/devicetree/bindings=
/display/msm/qcom,kaanapali-mdss.yaml
> I don't see any error/warning.

Because DT_SCHEMA_FILES excludes display/msm/dsi-phy-7nm.yaml. Soon
(in the next linux-next tree), you can do:

make display/msm/qcom,kaanapali-mdss.yaml

Which will test the example in the specified schema against all schemas.

Rob
