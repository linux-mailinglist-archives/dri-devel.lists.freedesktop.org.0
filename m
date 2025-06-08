Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74062AD12E0
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jun 2025 17:09:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FF9310E041;
	Sun,  8 Jun 2025 15:09:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QiCoVzmt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4041010E041
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jun 2025 15:09:32 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558CbR65005726
 for <dri-devel@lists.freedesktop.org>; Sun, 8 Jun 2025 15:09:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 uZg6uov4M3COUU/cAjeod0ONVmFRFP7In1KT2LtVH5c=; b=QiCoVzmtOQGUjWRl
 KvbzAgMg4OkzYlkppjTxMBmsoTwcFjEqOxxluJY9kzVfEFAcS4/XbtlQn2wnzEdX
 2FPbyv4k4aOhQrqm7Xhu4rVVxpkXYrFHSGEhhPYTTOA2p8Gh11AVC0g7gwa9u7Ey
 jGDD/efgrW63QJA75+mFclI+gGIO0lJGPqbU0FyHEzSHmQxGxrPT0gObyfyMEkT8
 Ny0ORRN4suBnqVna6TaKiIua24aPLUBNyFa+gs2S2UzyMz7/Fz182/YDV+xVPYlz
 J0IkxAJF2qrT0J4ity+mIEetpb8RhyVsKLjBVqoNBoDNy+Pyi66IX2xs8OuRZI3R
 VhzrEQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474eqcaxvx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jun 2025 15:09:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c760637fe5so706594485a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jun 2025 08:09:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749395370; x=1750000170;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uZg6uov4M3COUU/cAjeod0ONVmFRFP7In1KT2LtVH5c=;
 b=eUcjXQkguCINRdhgXQrAGEqRH6umUjoRcz/n3+iBuHab5XMT6BvUv/xU/ECg6anrVZ
 00YYkX8iGEermaa4uaMEd3eZk72c2pvWkgBB/ZDRXa/T5YBo8RKZBmVT22+lg1sLxJaT
 R5auXxPUb2s/A2g7haTbG58JVhUAqKi69oRBtkY3SBxfnNVwKR/6taplU2nhM8/TcXit
 DJ/oI5OT9e81KU6rgMEWBYBO6icsyNAL5DaGL20f75AvJw3CZmiaSRseuSy4xDSSGrO4
 OmYnRRX7d3Q+v10laLL58VfF6rAp0wRQR2gW0o5YhQ2uqypKNyTaekk/lMrT4ONUDDD1
 V2Cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKb2FyfTGZxPQYrsTWWX75UVqZa5+t2KEBKg7JCupI/zERalwCaivN6DpufL8+Sn+WOtF7N3/dQoc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQl8disyL+5r9MH6o6iaPrQe0CgO32pzgG9RtLJc7Ddhryc0UE
 Nb657bWEoOhbU3QtANbYhu1W2TmldLw+Py41yCA/oe6ivRXryB04sihV7RXuZb/0fELoFn0v592
 +/0jRZT5Vl0Xnwiv6QBPZC28omovg+jK1r5WltqDzSAAKLONcTTE4uN2hLZ1+DbTnXBva4Eo=
X-Gm-Gg: ASbGncsXq429bUGwAnIUFpnS6vfxR24e711nBDnihfcSRkpUd8ct0i6OO73A2MIRE1u
 XRVr4CqNIIYlK+I2EVUUHLM+U2NnCwTQ29jv0JqDMLEljphBolw9la9IzqTnDkqsZO/lyv8ou2e
 iFBv3mT837sekZ6m2mQbBl4+kQ1GMUapfOTM+A1zKDBeAB+GoXPNGU5R/wnpxV1HUysCZKoJAZ1
 xrZarZDnEzVzSEvn2w487/LGUC8W69TEh00ivX+ce0+StQprvJlh0SCVfULunsSngrJZyruav1B
 SW9PZYgMUVzDE7C8eKh4PbFZ2o7ku6wm7XORhs/tYbPl/pOCzJck3HUkvnX1T0FaGeQLzhmEfj0
 =
X-Received: by 2002:a05:620a:454a:b0:7ce:b9ed:24dc with SMTP id
 af79cd13be357-7d22986ec74mr1503743585a.23.1749395369652; 
 Sun, 08 Jun 2025 08:09:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWojoQQKm6zmBmTfsN6DQaVIzipmhF3tAmQHC4y9/wG04I+Q+kLtPPteL2vns5BpTi9vfIOw==
X-Received: by 2002:a05:620a:454a:b0:7ce:b9ed:24dc with SMTP id
 af79cd13be357-7d22986ec74mr1503737685a.23.1749395369172; 
 Sun, 08 Jun 2025 08:09:29 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55367722289sm792024e87.117.2025.06.08.08.09.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jun 2025 08:09:28 -0700 (PDT)
Date: Sun, 8 Jun 2025 18:09:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
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
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add GPU support to X1P42100 SoC
Message-ID: <rwjc7zkitubi6cdre5a7owmo76nopavkgifvvn6yq2mv2hrth4@bhwbodchd2gx>
References: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
 <20250607-x1p-adreno-v1-3-a8ea80f3b18b@oss.qualcomm.com>
 <wayrour74vlli27xrtxi2ff2v7q7ye2yknmk2mjpur5ry5gruv@hhh2mdb6lw2i>
 <CACSVV03X5EyAb5yCPDn1ot8vOFV_dKG7f6+yO5t9srr31AiUKw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV03X5EyAb5yCPDn1ot8vOFV_dKG7f6+yO5t9srr31AiUKw@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDEyMSBTYWx0ZWRfX4mqeyZUdw20X
 9BXcyYqOwjiBaPP2hmlfd2Atrb2dLn3N+tRtl9g6lt0rYyemZjQcui8V/aVH6WSOjcfKOGslxWE
 6Bh1M9REFSqazO4he6ZBz1biUJUYZVyco8x+T81Vjw7GLng3hleenYx0t1rTsKcMqaw8J6WQ4xW
 7mEcYaqLJmXMagP7H7XwAXKDhJyI7pJF2aLnVVZl/3nWjN73+vNN8772iuFFeHhRDunQfwNP+3+
 aFvNUOyHMv1xRaQ7yEicacVLaWROYN/Kims2j4MboAUU/w4n9LVoV0yyou79jYHbG+O3r0ksgHD
 9iwrv4OTGDoeGQaLo2GnV0k7UCEnKXC6NcoungPuuZtdHQnOQvP0Kx+IA1AHgkSF7rJ7cfIinVM
 uAZ2AUuJVEVOlVUkSUSTNkKvQeYgyyN8h666e4faiDD3DZYU6GeuzhchPEVjemq0K4Fwryeu
X-Authority-Analysis: v=2.4 cv=Q7TS452a c=1 sm=1 tr=0 ts=6845a7ab cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=NEwny6fml6yhTjldVekA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 5D4w3Pgyfs-R2IHabGPROFTnHlSUIXKd
X-Proofpoint-ORIG-GUID: 5D4w3Pgyfs-R2IHabGPROFTnHlSUIXKd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_02,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506080121
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

On Sun, Jun 08, 2025 at 07:10:11AM -0700, Rob Clark wrote:
> On Sat, Jun 7, 2025 at 1:17 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Sat, Jun 07, 2025 at 07:45:01PM +0530, Akhil P Oommen wrote:
> > > X1P42100 SoC has a new GPU called Adreno X1-45 which is a smaller
> > > version of Adreno X1-85 GPU. Describe this new GPU and also add
> > > the secure gpu firmware path that should used for X1P42100 CRD.
> > >
> > > Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > > ---
> > >  arch/arm64/boot/dts/qcom/x1e80100.dtsi    |   7 ++
> > >  arch/arm64/boot/dts/qcom/x1p42100-crd.dts |   4 +
> > >  arch/arm64/boot/dts/qcom/x1p42100.dtsi    | 121 +++++++++++++++++++++++++++++-
> > >  3 files changed, 131 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > > index a8eb4c5fe99fe6dd49af200a738b6476d87279b2..558d7d387d7710770244fcc901f461384dd9b0d4 100644
> > > --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > > @@ -8245,6 +8245,13 @@ sbsa_watchdog: watchdog@1c840000 {
> > >                       interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
> > >               };
> > >
> > > +             qfprom: efuse@221c8000 {
> > > +                     compatible = "qcom,x1e80100-qfprom", "qcom,qfprom";
> > > +                     reg = <0 0x221c8000 0 0x1000>;
> > > +                     #address-cells = <1>;
> > > +                     #size-cells = <1>;
> > > +             };
> > > +
> > >               pmu@24091000 {
> > >                       compatible = "qcom,x1e80100-llcc-bwmon", "qcom,sc7280-llcc-bwmon";
> > >                       reg = <0 0x24091000 0 0x1000>;
> > > diff --git a/arch/arm64/boot/dts/qcom/x1p42100-crd.dts b/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
> > > index cf07860a63e97c388909fb5721ae7b9729b6c586..cf999c2cf8d4e0af83078253fd39ece3a0c26a49 100644
> > > --- a/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
> > > +++ b/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
> > > @@ -15,3 +15,7 @@ / {
> > >       model = "Qualcomm Technologies, Inc. X1P42100 CRD";
> > >       compatible = "qcom,x1p42100-crd", "qcom,x1p42100";
> > >  };
> > > +
> > > +&gpu_zap_shader {
> > > +     firmware-name = "qcom/x1p42100/gen71500_zap.mbn";
> > > +};
> > > diff --git a/arch/arm64/boot/dts/qcom/x1p42100.dtsi b/arch/arm64/boot/dts/qcom/x1p42100.dtsi
> > > index 27f479010bc330eb6445269a1c46bf78ec6f1bd4..5ed461ed5cca271d43647888aa6eacac3de2ac9d 100644
> > > --- a/arch/arm64/boot/dts/qcom/x1p42100.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/x1p42100.dtsi
> > > @@ -17,15 +17,134 @@
> > >  /delete-node/ &cpu_pd9;
> > >  /delete-node/ &cpu_pd10;
> > >  /delete-node/ &cpu_pd11;
> > > +/delete-node/ &gpu_opp_table;
> > >  /delete-node/ &pcie3_phy;
> > >
> > >  &gcc {
> > >       compatible = "qcom,x1p42100-gcc", "qcom,x1e80100-gcc";
> > >  };
> > >
> > > -/* The GPU is physically different and will be brought up later */
> > > +&gmu {
> > > +     /delete-property/ compatible;
> > > +     compatible = "qcom,adreno-gmu-x145.0", "qcom,adreno-gmu";
> > > +};
> > > +
> > > +&qfprom {
> > > +     gpu_speed_bin: gpu_speed_bin@119 {
> > > +             reg = <0x119 0x2>;
> > > +             bits = <7 9>;
> > > +     };
> > > +};
> > > +
> > >  &gpu {
> > >       /delete-property/ compatible;
> >
> > I think, you can drop this line.
> >
> > > +
> > > +     compatible = "qcom,adreno-43030c00", "qcom,adreno";
> > > +
> > > +     nvmem-cells = <&gpu_speed_bin>;
> > > +     nvmem-cell-names = "speed_bin";
> > > +
> > > +     gpu_opp_table: opp-table {
> > > +             compatible = "operating-points-v2-adreno", "operating-points-v2";
> > > +
> > > +             opp-1400000000 {
> > > +                     opp-hz = /bits/ 64 <1400000000>;
> > > +                     opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L4>;
> > > +                     opp-peak-kBps = <16500000>;
> > > +                     qcom,opp-acd-level = <0xa8295ffd>;
> > > +                     opp-supported-hw = <0x3>;
> > > +             };
> > > +
> > > +             opp-1250000000 {
> > > +                     opp-hz = /bits/ 64 <1250000000>;
> > > +                     opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L3>;
> > > +                     opp-peak-kBps = <16500000>;
> > > +                     qcom,opp-acd-level = <0x882a5ffd>;
> > > +                     opp-supported-hw = <0x7>;
> > > +             };
> > > +
> > > +             opp-1107000000 {
> > > +                     opp-hz = /bits/ 64 <1107000000>;
> > > +                     opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
> > > +                     opp-peak-kBps = <16500000>;
> > > +                     qcom,opp-acd-level = <0x882a5ffd>;
> > > +                     opp-supported-hw = <0xf>;
> > > +             };
> > > +
> > > +             opp-1014000000 {
> > > +                     opp-hz = /bits/ 64 <1014000000>;
> > > +                     opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
> > > +                     opp-peak-kBps = <14398438>;
> > > +                     qcom,opp-acd-level = <0xa82a5ffd>;
> > > +                     opp-supported-hw = <0xf>;
> > > +             };
> > > +
> > > +             opp-940000000 {
> > > +                     opp-hz = /bits/ 64 <940000000>;
> > > +                     opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
> > > +                     opp-peak-kBps = <14398438>;
> > > +                     qcom,opp-acd-level = <0xa82a5ffd>;
> > > +                     opp-supported-hw = <0xf>;
> > > +             };
> > > +
> > > +             opp-825000000 {
> > > +                     opp-hz = /bits/ 64 <825000000>;
> > > +                     opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
> > > +                     opp-peak-kBps = <12449219>;
> > > +                     qcom,opp-acd-level = <0x882b5ffd>;
> > > +                     opp-supported-hw = <0xf>;
> > > +             };
> > > +
> > > +             opp-720000000 {
> > > +                     opp-hz = /bits/ 64 <720000000>;
> > > +                     opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
> > > +                     opp-peak-kBps = <10687500>;
> > > +                     qcom,opp-acd-level = <0xa82c5ffd>;
> > > +                     opp-supported-hw = <0xf>;
> > > +             };
> > > +
> > > +             opp-666000000-0 {
> > > +                     opp-hz = /bits/ 64 <666000000>;
> > > +                     opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
> > > +                     opp-peak-kBps = <8171875>;
> > > +                     qcom,opp-acd-level = <0xa82d5ffd>;
> > > +                     opp-supported-hw = <0xf>;
> > > +             };
> > > +
> > > +             /* Only applicable for SKUs which has 666Mhz as Fmax */
> > > +             opp-666000000-1 {
> > > +                     opp-hz = /bits/ 64 <666000000>;
> > > +                     opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
> > > +                     opp-peak-kBps = <16500000>;
> >
> > This looks odd, why is it so high?
> 
> You want max bandwidth on max opp

Yes, but can it actually sustain / provide this BW?

-- 
With best wishes
Dmitry
