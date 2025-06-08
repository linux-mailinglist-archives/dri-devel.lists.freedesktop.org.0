Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5556EAD12EC
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jun 2025 17:21:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EF8510E013;
	Sun,  8 Jun 2025 15:21:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ur/e/rz0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A7BC10E077
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jun 2025 15:21:09 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558EMekM025262
 for <dri-devel@lists.freedesktop.org>; Sun, 8 Jun 2025 15:21:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=ARly3iWlpNIqzAYd9MtCXivRpJr86X7fc2ZmLtLZOsw=; b=Ur
 /e/rz0w8/a+19M7/Kz3Piy5m7bWjXlSvICahqVak+RcLKDz3ZnP2IGvijVEcq4p7
 65Zm0vghVCXgr9wk06eCFHKlHwNer3o/dE1ITtM0k3t7POKGl4JaAdUTA6YQe5BP
 g/L6H0mIkijZaY8zWnem/WSL4qIB1ozC0k6eZxvblzvjVIVM/D/sL243WvqSC55w
 oSvJyRhBsP/wzw9cnkKKP7zvZfGukBDhgTRs5Pnklxs6VQpJWDGdJ05CkfPl5i1+
 Xl6laJrNvrIK7UbF1NM+/eBAGGEFolQ3erTj8cZmCVjcYyhWJKhdFNY6KGp0bFRZ
 Y+yQ4olSlZWH/qbAMPsQ==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474crkucnr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jun 2025 15:21:05 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id
 586e51a60fabf-2d50f1673ddso3417425fac.3
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jun 2025 08:21:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749396064; x=1750000864;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ARly3iWlpNIqzAYd9MtCXivRpJr86X7fc2ZmLtLZOsw=;
 b=bQgwu3FMggZI14yRfKDmke+FGLS3MkB9ai3O9HlCPDlZeRtMBKOznXq5Y8D5d/nJ3F
 m40UqKzAfqoDzyl1Yv5Wotvq7s/89/8F8sjLWH8H387JngHSK3tNzOFdRS7aoQOWMdwe
 VI+ke5Nye01haI1QeMO4kS6qtj996gydn3vqo4FoH/ICqnLbjvlNPvmMzGpWoBXQFMbe
 HD2K9gfaT2Cq1HAxAQNXpMC0pu88+OaSEMGzz3B6c3Yhj4sP1napAQRCtrT3250U+nqI
 oUibGHT70vlN8/LfGAhJOsvD0rsX0LdoRObuY2WJNoBIq+I3B3wb2nnvKtY6mqsDeKZY
 yaSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWR0fA8tfyzyvhLdsXQXUpHZeGXl945jg3tfH5ri7IZ0eQGvKBYTyhe9MyntjHt9Og0jRYGZwR/1A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyyRjTBtPM8ceprxUjhF0XUe3K7yrqwX38LpF/CVSDtXVJ6904K
 NFvGhKiduQchRmvl+OSs6l/chdqWIFIDS7naUB4umWgc4K7xoo6Xalv6yhFD9wup1pMU8vFvh+r
 FuUiiOIdGc9QIpY69goY/0Ha3+80+wYXpfBRo7DpSbI3JVaxcqQZ5ItKy1SymgphHocbrZW3VDx
 x/mPHme7RrIHZtSAX5CKbllj9ZcFivr0rUU7K/YIk3NWY85Q==
X-Gm-Gg: ASbGncti1/fZlEcFjditlO/5Lo4tK4lzH6/yTfx3VOcEua5CoJjTBxbA7INppViWS5q
 drf7MfckoicIZhJmyA+6NyjrCQ1hMfTwp13O2+EzaqqKe/5X0SH9MuXJ2oUIE5wRjvF4drHU9OH
 K6+L3D7HtjQcvvTosMb4Wh0CDB
X-Received: by 2002:a05:6870:ac12:b0:29e:69a9:8311 with SMTP id
 586e51a60fabf-2ea0144ba3amr6816659fac.36.1749396064516; 
 Sun, 08 Jun 2025 08:21:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAWAH6Ab4oqavVO0cSzKqIIFsz6MUMfKz1wXxlfdQzbbi1QowXCZXvQkHllVm94d8QKx6h4kmPkpPskODmpfE=
X-Received: by 2002:a05:6870:ac12:b0:29e:69a9:8311 with SMTP id
 586e51a60fabf-2ea0144ba3amr6816642fac.36.1749396064076; Sun, 08 Jun 2025
 08:21:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
 <20250607-x1p-adreno-v1-3-a8ea80f3b18b@oss.qualcomm.com>
 <wayrour74vlli27xrtxi2ff2v7q7ye2yknmk2mjpur5ry5gruv@hhh2mdb6lw2i>
 <CACSVV03X5EyAb5yCPDn1ot8vOFV_dKG7f6+yO5t9srr31AiUKw@mail.gmail.com>
 <rwjc7zkitubi6cdre5a7owmo76nopavkgifvvn6yq2mv2hrth4@bhwbodchd2gx>
In-Reply-To: <rwjc7zkitubi6cdre5a7owmo76nopavkgifvvn6yq2mv2hrth4@bhwbodchd2gx>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sun, 8 Jun 2025 08:20:53 -0700
X-Gm-Features: AX0GCFtydAmtbV6Rp4iejZxpRB2yINWVjffEi3Za62jYcssm6EGfCxtisSwuJgg
Message-ID: <CACSVV03mNkELWDB_uxdjEa5GeWZUY=42O8QG4qTrg6zquT1Bgw@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add GPU support to X1P42100 SoC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=dsLbC0g4 c=1 sm=1 tr=0 ts=6845aa61 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=JnfCEjz01w2RNyQ6EiwA:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-GUID: TBdxIv4mYJG9h_jGRmFiRBYky2BCAdKN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDEyMiBTYWx0ZWRfX90Tu+b4KJIHP
 Wp6i8xVhTcffd8dd+iUXLy4HMU8Upxb6pwfuubfw8LG6oxywps7uMw2ziuf/PoG1QFlEx9ywezz
 5PB+m4k9PRVQKIfa3jfQ0Yv5gXivhVCEAAIhMLUNkhZwjV526Rim08NZ7nBHHYa6G7OksXldxIA
 2EV7xnz7t18JF7lN1Z6fSpEfbY5RAf0vTWmbWu99vtHJx0Hm7PzbV2kFbVfXZstfiNqBESsEk8M
 q6ym/CrJ1pCsKz4FQcioM8F2UB0HM3tthMB62Uws+AkstPrJvWi61qFE2k2zew2sleWYKksmqsQ
 WCtWCx2iWUfl6qnm5gUmN77Ter76SqGHL5bQkfbaN/FGAU5ee2P9CSORlSLLe5il+vTvIZHKXKg
 1btIZUVmtFzyoIkcaz571M4qH2IIPWYhmU9t/0ihJqGiIuLNz7vHAX8fvC+0rYfd1JmlPoqc
X-Proofpoint-ORIG-GUID: TBdxIv4mYJG9h_jGRmFiRBYky2BCAdKN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_02,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 bulkscore=0 adultscore=0 phishscore=0
 suspectscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506080122
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
Reply-To: rob.clark@oss.qualcomm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jun 8, 2025 at 8:09=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sun, Jun 08, 2025 at 07:10:11AM -0700, Rob Clark wrote:
> > On Sat, Jun 7, 2025 at 1:17=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > On Sat, Jun 07, 2025 at 07:45:01PM +0530, Akhil P Oommen wrote:
> > > > X1P42100 SoC has a new GPU called Adreno X1-45 which is a smaller
> > > > version of Adreno X1-85 GPU. Describe this new GPU and also add
> > > > the secure gpu firmware path that should used for X1P42100 CRD.
> > > >
> > > > Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > > > ---
> > > >  arch/arm64/boot/dts/qcom/x1e80100.dtsi    |   7 ++
> > > >  arch/arm64/boot/dts/qcom/x1p42100-crd.dts |   4 +
> > > >  arch/arm64/boot/dts/qcom/x1p42100.dtsi    | 121 ++++++++++++++++++=
+++++++++++-
> > > >  3 files changed, 131 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/bo=
ot/dts/qcom/x1e80100.dtsi
> > > > index a8eb4c5fe99fe6dd49af200a738b6476d87279b2..558d7d387d771077024=
4fcc901f461384dd9b0d4 100644
> > > > --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > > > +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > > > @@ -8245,6 +8245,13 @@ sbsa_watchdog: watchdog@1c840000 {
> > > >                       interrupts =3D <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH=
>;
> > > >               };
> > > >
> > > > +             qfprom: efuse@221c8000 {
> > > > +                     compatible =3D "qcom,x1e80100-qfprom", "qcom,=
qfprom";
> > > > +                     reg =3D <0 0x221c8000 0 0x1000>;
> > > > +                     #address-cells =3D <1>;
> > > > +                     #size-cells =3D <1>;
> > > > +             };
> > > > +
> > > >               pmu@24091000 {
> > > >                       compatible =3D "qcom,x1e80100-llcc-bwmon", "q=
com,sc7280-llcc-bwmon";
> > > >                       reg =3D <0 0x24091000 0 0x1000>;
> > > > diff --git a/arch/arm64/boot/dts/qcom/x1p42100-crd.dts b/arch/arm64=
/boot/dts/qcom/x1p42100-crd.dts
> > > > index cf07860a63e97c388909fb5721ae7b9729b6c586..cf999c2cf8d4e0af830=
78253fd39ece3a0c26a49 100644
> > > > --- a/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
> > > > +++ b/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
> > > > @@ -15,3 +15,7 @@ / {
> > > >       model =3D "Qualcomm Technologies, Inc. X1P42100 CRD";
> > > >       compatible =3D "qcom,x1p42100-crd", "qcom,x1p42100";
> > > >  };
> > > > +
> > > > +&gpu_zap_shader {
> > > > +     firmware-name =3D "qcom/x1p42100/gen71500_zap.mbn";
> > > > +};
> > > > diff --git a/arch/arm64/boot/dts/qcom/x1p42100.dtsi b/arch/arm64/bo=
ot/dts/qcom/x1p42100.dtsi
> > > > index 27f479010bc330eb6445269a1c46bf78ec6f1bd4..5ed461ed5cca271d436=
47888aa6eacac3de2ac9d 100644
> > > > --- a/arch/arm64/boot/dts/qcom/x1p42100.dtsi
> > > > +++ b/arch/arm64/boot/dts/qcom/x1p42100.dtsi
> > > > @@ -17,15 +17,134 @@
> > > >  /delete-node/ &cpu_pd9;
> > > >  /delete-node/ &cpu_pd10;
> > > >  /delete-node/ &cpu_pd11;
> > > > +/delete-node/ &gpu_opp_table;
> > > >  /delete-node/ &pcie3_phy;
> > > >
> > > >  &gcc {
> > > >       compatible =3D "qcom,x1p42100-gcc", "qcom,x1e80100-gcc";
> > > >  };
> > > >
> > > > -/* The GPU is physically different and will be brought up later */
> > > > +&gmu {
> > > > +     /delete-property/ compatible;
> > > > +     compatible =3D "qcom,adreno-gmu-x145.0", "qcom,adreno-gmu";
> > > > +};
> > > > +
> > > > +&qfprom {
> > > > +     gpu_speed_bin: gpu_speed_bin@119 {
> > > > +             reg =3D <0x119 0x2>;
> > > > +             bits =3D <7 9>;
> > > > +     };
> > > > +};
> > > > +
> > > >  &gpu {
> > > >       /delete-property/ compatible;
> > >
> > > I think, you can drop this line.
> > >
> > > > +
> > > > +     compatible =3D "qcom,adreno-43030c00", "qcom,adreno";
> > > > +
> > > > +     nvmem-cells =3D <&gpu_speed_bin>;
> > > > +     nvmem-cell-names =3D "speed_bin";
> > > > +
> > > > +     gpu_opp_table: opp-table {
> > > > +             compatible =3D "operating-points-v2-adreno", "operati=
ng-points-v2";
> > > > +
> > > > +             opp-1400000000 {
> > > > +                     opp-hz =3D /bits/ 64 <1400000000>;
> > > > +                     opp-level =3D <RPMH_REGULATOR_LEVEL_TURBO_L4>=
;
> > > > +                     opp-peak-kBps =3D <16500000>;
> > > > +                     qcom,opp-acd-level =3D <0xa8295ffd>;
> > > > +                     opp-supported-hw =3D <0x3>;
> > > > +             };
> > > > +
> > > > +             opp-1250000000 {
> > > > +                     opp-hz =3D /bits/ 64 <1250000000>;
> > > > +                     opp-level =3D <RPMH_REGULATOR_LEVEL_TURBO_L3>=
;
> > > > +                     opp-peak-kBps =3D <16500000>;
> > > > +                     qcom,opp-acd-level =3D <0x882a5ffd>;
> > > > +                     opp-supported-hw =3D <0x7>;
> > > > +             };
> > > > +
> > > > +             opp-1107000000 {
> > > > +                     opp-hz =3D /bits/ 64 <1107000000>;
> > > > +                     opp-level =3D <RPMH_REGULATOR_LEVEL_TURBO_L1>=
;
> > > > +                     opp-peak-kBps =3D <16500000>;
> > > > +                     qcom,opp-acd-level =3D <0x882a5ffd>;
> > > > +                     opp-supported-hw =3D <0xf>;
> > > > +             };
> > > > +
> > > > +             opp-1014000000 {
> > > > +                     opp-hz =3D /bits/ 64 <1014000000>;
> > > > +                     opp-level =3D <RPMH_REGULATOR_LEVEL_TURBO>;
> > > > +                     opp-peak-kBps =3D <14398438>;
> > > > +                     qcom,opp-acd-level =3D <0xa82a5ffd>;
> > > > +                     opp-supported-hw =3D <0xf>;
> > > > +             };
> > > > +
> > > > +             opp-940000000 {
> > > > +                     opp-hz =3D /bits/ 64 <940000000>;
> > > > +                     opp-level =3D <RPMH_REGULATOR_LEVEL_NOM_L1>;
> > > > +                     opp-peak-kBps =3D <14398438>;
> > > > +                     qcom,opp-acd-level =3D <0xa82a5ffd>;
> > > > +                     opp-supported-hw =3D <0xf>;
> > > > +             };
> > > > +
> > > > +             opp-825000000 {
> > > > +                     opp-hz =3D /bits/ 64 <825000000>;
> > > > +                     opp-level =3D <RPMH_REGULATOR_LEVEL_NOM>;
> > > > +                     opp-peak-kBps =3D <12449219>;
> > > > +                     qcom,opp-acd-level =3D <0x882b5ffd>;
> > > > +                     opp-supported-hw =3D <0xf>;
> > > > +             };
> > > > +
> > > > +             opp-720000000 {
> > > > +                     opp-hz =3D /bits/ 64 <720000000>;
> > > > +                     opp-level =3D <RPMH_REGULATOR_LEVEL_SVS_L2>;
> > > > +                     opp-peak-kBps =3D <10687500>;
> > > > +                     qcom,opp-acd-level =3D <0xa82c5ffd>;
> > > > +                     opp-supported-hw =3D <0xf>;
> > > > +             };
> > > > +
> > > > +             opp-666000000-0 {
> > > > +                     opp-hz =3D /bits/ 64 <666000000>;
> > > > +                     opp-level =3D <RPMH_REGULATOR_LEVEL_SVS_L1>;
> > > > +                     opp-peak-kBps =3D <8171875>;
> > > > +                     qcom,opp-acd-level =3D <0xa82d5ffd>;
> > > > +                     opp-supported-hw =3D <0xf>;
> > > > +             };
> > > > +
> > > > +             /* Only applicable for SKUs which has 666Mhz as Fmax =
*/
> > > > +             opp-666000000-1 {
> > > > +                     opp-hz =3D /bits/ 64 <666000000>;
> > > > +                     opp-level =3D <RPMH_REGULATOR_LEVEL_SVS_L1>;
> > > > +                     opp-peak-kBps =3D <16500000>;
> > >
> > > This looks odd, why is it so high?
> >
> > You want max bandwidth on max opp
>
> Yes, but can it actually sustain / provide this BW?
>

I'd have to trust Akhil on that one, but I have no reason to believe
otherwise.  Just pointing out we've done analogous things elsewhere
(for ex, cpu bw for sc7180-lite.dtsi)

BR,
-R
