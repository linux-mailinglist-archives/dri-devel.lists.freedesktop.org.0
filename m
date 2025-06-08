Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FADAD152F
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 00:20:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E10A110E3E5;
	Sun,  8 Jun 2025 22:20:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GaWPNtPY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 121B510E3E5
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jun 2025 22:20:12 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558JjuZJ025309
 for <dri-devel@lists.freedesktop.org>; Sun, 8 Jun 2025 22:20:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 otRYK5DhPTOrJ6DwnOhZEoLtC/uLkxnrwdiO2++9uBs=; b=GaWPNtPYreiJXhJr
 F14/sJJ+4jOrTiuZFE2ltYhaiVeFuucJiL4Qq9mYpj4gTJYzrsdYuEm8rD9grlGB
 3W1gTGUVO2F6zstBsp0qJrIZy4WnSnTI8ryUWZCe/TKsf02vKVFuqFD7EGxbO5aR
 lsje9y2aZdTch5rYZITzH9jNOLdYn8mTQ/hk96JRv3baDNzBm6siOp6tuDCw0JfU
 vLllMFDkf4mzbmoUPHvs8jMlSqVnyx+lN1FxB//ZBu/LjIiqEe3IacBq3thhzgkJ
 vW4MMuc9URd1NGEx0cvb29ciKw27nMiiDayB7quWdtiQD6XhQ9/wWmCEuphZVWLg
 IR5eOw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ce9m8dp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jun 2025 22:20:11 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b2c36d3f884so2246999a12.2
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jun 2025 15:20:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749421210; x=1750026010;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=otRYK5DhPTOrJ6DwnOhZEoLtC/uLkxnrwdiO2++9uBs=;
 b=keTkBi4wHfj3FJ4mmyuPNAy5H2wE04NdcQVWtDQLeBR126cCz0JVA5SFFW6cPQICUH
 wiBzUN9r7f8zc21cKh6Dw2ObfhFQiP5Xg2u2AHGZsj7hTA8+FmlZzrtUHgnOT/KafU+f
 1x5F24EFIV27X7RZDPrUhBRsKsJLFwEmA17X0mSP4xyxO+P5gCGNc7wKNG92vqZuB9IG
 zvHGVZCSs+A7ieSq9uTLqgitamKlpkm0+gdt3DG15vAVsvHDl/Mcn6u/DqgS+q/V2ZM2
 vE4jMADc4eR9qMl3HDh8reo7aQgH2CK0TUcCOjoCApikXYDcZ9HUOvNxaRQ1cqf8DCYK
 jwoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXUVpRdBD9nc7bYdJbNdpENFGiVrq3bKoURRyrQfIywCKe7er+jcRpHezAp53epjokOPgD04KcjBU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQ6MQlprmvgDSzVSp4jtRxdkCm9Gz4NTkCfDBq5ra4cyB3Kppb
 9oSXKqTmOAiKwGgp7XnAfs/z8SGwLES9TNh/AYZdTiU2p2al9eu+uumiII19+N2iU6dwqAJ9iIi
 wJ+i1O0R/FZYsLksdBkj4K6JcC9JlMsK+brXqgbuMN7vZwcxqpfbpMd7x35tkgsuJ+4CiWVdpnW
 3Lc9wuJBJYbb+DjcJR/9P5c7IbknPA6H2Qwx60vBFRp/YO8w==
X-Gm-Gg: ASbGncvhguq0MkMCvAyJ9VkvMC9YoHSBuxWnFI7CyZw8HzU68S0+VLSZN+/F9PFKxkd
 IxDFCtjvFHONi71dup7NoooHH0SanGTXyd8TJUOhinqWkQyrw6PR+YGqceT21blmhZy81c1C5CC
 s8GUNMGOvFtzVy2CySvA==
X-Received: by 2002:a17:90b:554d:b0:311:c5d9:2c79 with SMTP id
 98e67ed59e1d1-31346c50561mr13829935a91.21.1749421209849; 
 Sun, 08 Jun 2025 15:20:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPaBHGagiPXUXVNnIDh9yqYM2ox50KJABQkfzbYsQuROfydBSrCGaYwKv/0lBGz9hykJwQ8JGCSB+8fVGYsq0=
X-Received: by 2002:a17:90b:554d:b0:311:c5d9:2c79 with SMTP id
 98e67ed59e1d1-31346c50561mr13829913a91.21.1749421209437; Sun, 08 Jun 2025
 15:20:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
 <20250607-x1p-adreno-v1-3-a8ea80f3b18b@oss.qualcomm.com>
 <wayrour74vlli27xrtxi2ff2v7q7ye2yknmk2mjpur5ry5gruv@hhh2mdb6lw2i>
 <CACSVV03X5EyAb5yCPDn1ot8vOFV_dKG7f6+yO5t9srr31AiUKw@mail.gmail.com>
 <rwjc7zkitubi6cdre5a7owmo76nopavkgifvvn6yq2mv2hrth4@bhwbodchd2gx>
 <CACSVV03mNkELWDB_uxdjEa5GeWZUY=42O8QG4qTrg6zquT1Bgw@mail.gmail.com>
 <42a69fa4-48ac-4a2f-a2ff-b4e1fe3a228a@oss.qualcomm.com>
 <dbbcc6b5-0d7d-440e-97e6-07b430d4f657@quicinc.com>
In-Reply-To: <dbbcc6b5-0d7d-440e-97e6-07b430d4f657@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 9 Jun 2025 01:19:58 +0300
X-Gm-Features: AX0GCFsSqVwr2GlCWKHyocv8W7CX1h3HA_b64ptWgi1iY9nS-_m-38QpEi89xUQ
Message-ID: <CAO9ioeXu5D6iG-Y4vJyrckj1DaZvjO7pMJTY4J16M-fW_p6rrg@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add GPU support to X1P42100 SoC
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: rob.clark@oss.qualcomm.com, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
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
X-Proofpoint-GUID: jHs2dRuKadxqEymzWlJUXiOHV9rzftA9
X-Authority-Analysis: v=2.4 cv=drjbC0g4 c=1 sm=1 tr=0 ts=68460c9b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=uWswUMS8ohN5UvJPIxQA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: jHs2dRuKadxqEymzWlJUXiOHV9rzftA9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDE4MiBTYWx0ZWRfX2ntunYDBy0WM
 5ycMolrrAhPoPYqVozfNb0hzsipfO0HeO4WPYYhAMZXH4KEj7f2sWsezYaajUEGRB4uipGELB3L
 eqgH0uaVIwBADrKaiG7rlIbX9UDmoOx2Li1oflHYO1IGbpRFlzcJEy9UM6+i1dyKgWsK0NBr+ZN
 fIZ2J0P3fIi3v8gTxQUNdmoI33bPjOPkmqbqqqllUWELMPX8BNhSsavDh05ye82r/Hv8weU3mRM
 ploBOWfe7+vYp3wlYmhHm/Odv7KMHNAisK6Gx0uJtYTSGf7wcQyzFW94i3mtaZsmtO5kLATEikS
 Yz+yGMr++kf6cgCvXmipV7KUoHDVfMMgiT9tXJeO3FbunYeNKIUWGxGitYOEpsNyXeylWspqlun
 MYdm4AqcsGFxkwA1efF1XzOsDVVI8xvF4vS14frJ2MJM0F92W35uLPmYTzEw2YHSMZIY2sbV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506080182
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

On Sun, 8 Jun 2025 at 23:18, Akhil P Oommen <quic_akhilpo@quicinc.com> wrot=
e:
>
> On 6/8/2025 8:52 PM, Dmitry Baryshkov wrote:
> > On 08/06/2025 18:20, Rob Clark wrote:
> >> On Sun, Jun 8, 2025 at 8:09=E2=80=AFAM Dmitry Baryshkov
> >> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >>>
> >>> On Sun, Jun 08, 2025 at 07:10:11AM -0700, Rob Clark wrote:
> >>>> On Sat, Jun 7, 2025 at 1:17=E2=80=AFPM Dmitry Baryshkov
> >>>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >>>>>
> >>>>> On Sat, Jun 07, 2025 at 07:45:01PM +0530, Akhil P Oommen wrote:
> >>>>>> X1P42100 SoC has a new GPU called Adreno X1-45 which is a smaller
> >>>>>> version of Adreno X1-85 GPU. Describe this new GPU and also add
> >>>>>> the secure gpu firmware path that should used for X1P42100 CRD.
> >>>>>>
> >>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >>>>>> ---
> >>>>>>   arch/arm64/boot/dts/qcom/x1e80100.dtsi    |   7 ++
> >>>>>>   arch/arm64/boot/dts/qcom/x1p42100-crd.dts |   4 +
> >>>>>>   arch/arm64/boot/dts/qcom/x1p42100.dtsi    | 121 ++++++++++++++++
> >>>>>> +++++++++++++-
> >>>>>>   3 files changed, 131 insertions(+), 1 deletion(-)
> >>>>>>
> >>>>>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/
> >>>>>> boot/dts/qcom/x1e80100.dtsi
> >>>>>> index
> >>>>>> a8eb4c5fe99fe6dd49af200a738b6476d87279b2..558d7d387d7710770244fcc9=
01f461384dd9b0d4 100644
> >>>>>> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> >>>>>> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> >>>>>> @@ -8245,6 +8245,13 @@ sbsa_watchdog: watchdog@1c840000 {
> >>>>>>                        interrupts =3D <GIC_SPI 0 IRQ_TYPE_LEVEL_HI=
GH>;
> >>>>>>                };
> >>>>>>
> >>>>>> +             qfprom: efuse@221c8000 {
> >>>>>> +                     compatible =3D "qcom,x1e80100-qfprom",
> >>>>>> "qcom,qfprom";
> >>>>>> +                     reg =3D <0 0x221c8000 0 0x1000>;
> >>>>>> +                     #address-cells =3D <1>;
> >>>>>> +                     #size-cells =3D <1>;
> >>>>>> +             };
> >>>>>> +
> >>>>>>                pmu@24091000 {
> >>>>>>                        compatible =3D "qcom,x1e80100-llcc-bwmon",
> >>>>>> "qcom,sc7280-llcc-bwmon";
> >>>>>>                        reg =3D <0 0x24091000 0 0x1000>;
> >>>>>> diff --git a/arch/arm64/boot/dts/qcom/x1p42100-crd.dts b/arch/
> >>>>>> arm64/boot/dts/qcom/x1p42100-crd.dts
> >>>>>> index
> >>>>>> cf07860a63e97c388909fb5721ae7b9729b6c586..cf999c2cf8d4e0af83078253=
fd39ece3a0c26a49 100644
> >>>>>> --- a/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
> >>>>>> +++ b/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
> >>>>>> @@ -15,3 +15,7 @@ / {
> >>>>>>        model =3D "Qualcomm Technologies, Inc. X1P42100 CRD";
> >>>>>>        compatible =3D "qcom,x1p42100-crd", "qcom,x1p42100";
> >>>>>>   };
> >>>>>> +
> >>>>>> +&gpu_zap_shader {
> >>>>>> +     firmware-name =3D "qcom/x1p42100/gen71500_zap.mbn";
> >>>>>> +};
> >>>>>> diff --git a/arch/arm64/boot/dts/qcom/x1p42100.dtsi b/arch/arm64/
> >>>>>> boot/dts/qcom/x1p42100.dtsi
> >>>>>> index
> >>>>>> 27f479010bc330eb6445269a1c46bf78ec6f1bd4..5ed461ed5cca271d43647888=
aa6eacac3de2ac9d 100644
> >>>>>> --- a/arch/arm64/boot/dts/qcom/x1p42100.dtsi
> >>>>>> +++ b/arch/arm64/boot/dts/qcom/x1p42100.dtsi
> >>>>>> @@ -17,15 +17,134 @@
> >>>>>>   /delete-node/ &cpu_pd9;
> >>>>>>   /delete-node/ &cpu_pd10;
> >>>>>>   /delete-node/ &cpu_pd11;
> >>>>>> +/delete-node/ &gpu_opp_table;
> >>>>>>   /delete-node/ &pcie3_phy;
> >>>>>>
> >>>>>>   &gcc {
> >>>>>>        compatible =3D "qcom,x1p42100-gcc", "qcom,x1e80100-gcc";
> >>>>>>   };
> >>>>>>
> >>>>>> -/* The GPU is physically different and will be brought up later *=
/
> >>>>>> +&gmu {
> >>>>>> +     /delete-property/ compatible;
> >>>>>> +     compatible =3D "qcom,adreno-gmu-x145.0", "qcom,adreno-gmu";
> >>>>>> +};
> >>>>>> +
> >>>>>> +&qfprom {
> >>>>>> +     gpu_speed_bin: gpu_speed_bin@119 {
> >>>>>> +             reg =3D <0x119 0x2>;
> >>>>>> +             bits =3D <7 9>;
> >>>>>> +     };
> >>>>>> +};
> >>>>>> +
> >>>>>>   &gpu {
> >>>>>>        /delete-property/ compatible;
> >>>>>
> >>>>> I think, you can drop this line.
>
> I wasn't sure about this and I thought it was harmless to delete it.
> Anyway, I will remove the "delete" from both GPU and GMU nodes.

You can always run fdtdump on the compiled file and check the contents.

>
> >>>>>
> >>>>>> +
> >>>>>> +     compatible =3D "qcom,adreno-43030c00", "qcom,adreno";
> >>>>>> +
> >>>>>> +     nvmem-cells =3D <&gpu_speed_bin>;
> >>>>>> +     nvmem-cell-names =3D "speed_bin";
> >>>>>> +
> >>>>>> +     gpu_opp_table: opp-table {
> >>>>>> +             compatible =3D "operating-points-v2-adreno",
> >>>>>> "operating-points-v2";
> >>>>>> +
> >>>>>> +             opp-1400000000 {
> >>>>>> +                     opp-hz =3D /bits/ 64 <1400000000>;
> >>>>>> +                     opp-level =3D <RPMH_REGULATOR_LEVEL_TURBO_L4=
>;
> >>>>>> +                     opp-peak-kBps =3D <16500000>;
> >>>>>> +                     qcom,opp-acd-level =3D <0xa8295ffd>;
> >>>>>> +                     opp-supported-hw =3D <0x3>;
> >>>>>> +             };
> >>>>>> +
> >>>>>> +             opp-1250000000 {
> >>>>>> +                     opp-hz =3D /bits/ 64 <1250000000>;
> >>>>>> +                     opp-level =3D <RPMH_REGULATOR_LEVEL_TURBO_L3=
>;
> >>>>>> +                     opp-peak-kBps =3D <16500000>;
> >>>>>> +                     qcom,opp-acd-level =3D <0x882a5ffd>;
> >>>>>> +                     opp-supported-hw =3D <0x7>;
> >>>>>> +             };
> >>>>>> +
> >>>>>> +             opp-1107000000 {
> >>>>>> +                     opp-hz =3D /bits/ 64 <1107000000>;
> >>>>>> +                     opp-level =3D <RPMH_REGULATOR_LEVEL_TURBO_L1=
>;
> >>>>>> +                     opp-peak-kBps =3D <16500000>;
> >>>>>> +                     qcom,opp-acd-level =3D <0x882a5ffd>;
> >>>>>> +                     opp-supported-hw =3D <0xf>;
> >>>>>> +             };
> >>>>>> +
> >>>>>> +             opp-1014000000 {
> >>>>>> +                     opp-hz =3D /bits/ 64 <1014000000>;
> >>>>>> +                     opp-level =3D <RPMH_REGULATOR_LEVEL_TURBO>;
> >>>>>> +                     opp-peak-kBps =3D <14398438>;
> >>>>>> +                     qcom,opp-acd-level =3D <0xa82a5ffd>;
> >>>>>> +                     opp-supported-hw =3D <0xf>;
> >>>>>> +             };
> >>>>>> +
> >>>>>> +             opp-940000000 {
> >>>>>> +                     opp-hz =3D /bits/ 64 <940000000>;
> >>>>>> +                     opp-level =3D <RPMH_REGULATOR_LEVEL_NOM_L1>;
> >>>>>> +                     opp-peak-kBps =3D <14398438>;
> >>>>>> +                     qcom,opp-acd-level =3D <0xa82a5ffd>;
> >>>>>> +                     opp-supported-hw =3D <0xf>;
> >>>>>> +             };
> >>>>>> +
> >>>>>> +             opp-825000000 {
> >>>>>> +                     opp-hz =3D /bits/ 64 <825000000>;
> >>>>>> +                     opp-level =3D <RPMH_REGULATOR_LEVEL_NOM>;
> >>>>>> +                     opp-peak-kBps =3D <12449219>;
> >>>>>> +                     qcom,opp-acd-level =3D <0x882b5ffd>;
> >>>>>> +                     opp-supported-hw =3D <0xf>;
> >>>>>> +             };
> >>>>>> +
> >>>>>> +             opp-720000000 {
> >>>>>> +                     opp-hz =3D /bits/ 64 <720000000>;
> >>>>>> +                     opp-level =3D <RPMH_REGULATOR_LEVEL_SVS_L2>;
> >>>>>> +                     opp-peak-kBps =3D <10687500>;
> >>>>>> +                     qcom,opp-acd-level =3D <0xa82c5ffd>;
> >>>>>> +                     opp-supported-hw =3D <0xf>;
> >>>>>> +             };
> >>>>>> +
> >>>>>> +             opp-666000000-0 {
> >>>>>> +                     opp-hz =3D /bits/ 64 <666000000>;
> >>>>>> +                     opp-level =3D <RPMH_REGULATOR_LEVEL_SVS_L1>;
> >>>>>> +                     opp-peak-kBps =3D <8171875>;
> >>>>>> +                     qcom,opp-acd-level =3D <0xa82d5ffd>;
> >>>>>> +                     opp-supported-hw =3D <0xf>;
> >>>>>> +             };
> >>>>>> +
> >>>>>> +             /* Only applicable for SKUs which has 666Mhz as Fmax=
 */
> >>>>>> +             opp-666000000-1 {
> >>>>>> +                     opp-hz =3D /bits/ 64 <666000000>;
> >>>>>> +                     opp-level =3D <RPMH_REGULATOR_LEVEL_SVS_L1>;
> >>>>>> +                     opp-peak-kBps =3D <16500000>;
> >>>>>
> >>>>> This looks odd, why is it so high?
> >>>>
> >>>> You want max bandwidth on max opp
> >>>
> >>> Yes, but can it actually sustain / provide this BW?
> >>>
> >>
> >> I'd have to trust Akhil on that one, but I have no reason to believe
> >> otherwise.  Just pointing out we've done analogous things elsewhere
> >> (for ex, cpu bw for sc7180-lite.dtsi)
>
> Window's GPU KMD seems to vote Max bandwidth for this SKU, so I think
> this is fine. Our GPUs from last few generations can easily saturate DDR
> with the right usecase.


Ack


--=20
With best wishes
Dmitry
