Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C4EB47841
	for <lists+dri-devel@lfdr.de>; Sun,  7 Sep 2025 01:03:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 407CB10E42E;
	Sat,  6 Sep 2025 23:03:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CthncvNW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0B2710E176
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Sep 2025 23:02:58 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 586LsUpU001188
 for <dri-devel@lists.freedesktop.org>; Sat, 6 Sep 2025 23:02:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=7tSKwHt+Ek7jPABcGiy8/Q+CLwEcgRigyVjo1Zw5A58=; b=Ct
 hncvNWlMgzrXgTeBlvJleX/TQnEv0gWDzpbuHTLcAP1F5iF8ered8rp+ZJNQgp+F
 Wg8u1JXm2yYwCSiRygdMJWhVbHaOyQs6c3kq3nnKdxg4CdDx3b1uDk+tkzyjepdu
 fYTk1kvJLA59Ndsb00fb2wiVn1yGPnNzZ5tsTw+/VXoE50Sp8TSBg/ca7g/J6tcw
 HSyiYXWFfPyCCow+9xpdSEiQjeL+Gj+nyZ8YquEZf5NkQgUjNeYtU/iJ8U83ft3E
 Ptolv2skC1Bx0R2eMs/+vKQlcKTYsZiYGvG9UhcpYhuGV8c8CyBa98fxiSS/xzyp
 NntjyvLbZ6d96tmaxeUw==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490by8scn1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Sep 2025 23:02:57 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-30cceb0a741so4926071fac.2
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Sep 2025 16:02:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757199777; x=1757804577;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7tSKwHt+Ek7jPABcGiy8/Q+CLwEcgRigyVjo1Zw5A58=;
 b=gvVamsm+gxyMcjSR0NuegJP2qgLCrFcJjCemimx4zyy6u5LhBXatAuAQ1A+/p6Gkq+
 2wYjsFB+b8sy/5v9d94bzOSNZqHf/YPm4sUQjZQIIRzJzLK4l31ov0VUo69dHuz71+Eg
 3vWp7jHPbaQdqGa+pWOqeg/PdmhFa1JLqwj/ISbNQdI92tYJv7l+ayhv/n8pB1ul/LKJ
 Beat2GcdmUEuqdt+4vjYgndKVjUcI9b6aEP+mqj3aSdsvSnHnMJabugev/ibyzgBucLR
 Q4YyOU4/wb7t3q6HnrJ8n/JE2mlZ8a9uxuOU7GMg2soYKUj/HEZvDTAfWjNRjJosO6oy
 6Ntw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMqz3W/uankXeJuLG0t2PSYegOITjq/icouIWi+TqDrpe6MV08Fnp/ATTjmSDjpD42wAN8apT7/CY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZo6C2zTTJWVzTLgjY3+iPayKRFGckygIo1D35/oA2l3cTdnbt
 eQ7aEfsTZL/Ydo9X5HcAnGfoje1s7kOcZOt5pMl4GOCO7pe764Av1jSLDfLIjmA771Z9XScEsTS
 DAWSOoNlpf3iH9O59Yza+Fz3Im151XgiOk+/YNz2zyKVxeECAItwq8ZgZ6FafmO3T0R8GLXeo3k
 5Vm1QXsGS4ezm8dS4EfE/WDyqi6cEXiZXXcb2hXE6jcQxRpg==
X-Gm-Gg: ASbGncsB7kTi9DRzSUsdNQWU5oZX/6wZPkuq78ngng+PAfaZ6m6wzjzc/eW4aMmh2sa
 dXlx/2LlsyC5MN0UBk/HyP3Ii0yVkrPTele3MRxZ4gLg6DiiMaTyyA9nytO6jc/SHFdHrn4igML
 yTgYMFlLgIZu6MdWHMz3RE93IcUMuSSBj8wwF4XryWuw/mVn6KM8OY
X-Received: by 2002:a05:6871:e7c3:b0:315:b768:bd1d with SMTP id
 586e51a60fabf-322627465d3mr1588926fac.6.1757199776936; 
 Sat, 06 Sep 2025 16:02:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGNyPtWK7XLr6Z6Y8/0D04LJKsr8cN92FCpDHkSHR8k+zYD6ZV/6YLC5AI8gQTcKpJUSvoMi6UIajR6FAY6mg=
X-Received: by 2002:a05:6871:e7c3:b0:315:b768:bd1d with SMTP id
 586e51a60fabf-322627465d3mr1588917fac.6.1757199776584; Sat, 06 Sep 2025
 16:02:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com>
 <20250822-a663-gpu-support-v4-3-97d26bb2144e@oss.qualcomm.com>
 <f11b778d-eba1-4712-81c7-b83f2cb38b46@oss.qualcomm.com>
 <exkrgx6rdotfrrsnklsd7zk4ydehsk5vaoevibpqisyq2dwbd4@sa4kgnuexlna>
 <f169be5a-faa5-4824-861e-27bd2083b9cf@oss.qualcomm.com>
 <t5pxum74q3fwf6wgcbaeaginjvtjfn357pkfswvafsggtmvxfv@jl5qjfhpmmow>
 <c3de911c-e80a-429d-8a5c-c693546d4abf@oss.qualcomm.com>
 <14b5db9f-8b31-4baa-a03d-12112425fbbe@oss.qualcomm.com>
In-Reply-To: <14b5db9f-8b31-4baa-a03d-12112425fbbe@oss.qualcomm.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 6 Sep 2025 16:02:45 -0700
X-Gm-Features: Ac12FXyzTpMUMaTsNWSW0MM7Xxq1e9X2ZKWgxsNm2xNI9hIOPJ9JgBv0CoKpoCY
Message-ID: <CACSVV02h8AUX8WtEuu5w-g2XnfBkfozHQQ15zGK6+LVX_w=d1g@mail.gmail.com>
Subject: Re: [PATCH v4 3/6] arm64: dts: qcom: sa8775p: Add gpu and gmu nodes
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Connor Abbott <cwabbott0@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Yv8PR5YX c=1 sm=1 tr=0 ts=68bcbda1 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=M6CliHif6jTRLK_rbtEA:9
 a=QEXdDO2ut3YA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22 a=TjNXssC_j7lpFel5tvFf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: u7DBfK3MUMa-dieZbWhovP_fjrzpGw32
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX16X4Viop96oC
 FG5i9B1F7gvnQjFrWMcn1N2QUlW/Kj6yEn+SAh6LQSqiT2jz5omx2xHuz51h1S8IDIIoL1JhjAP
 4MRUjY3iisqBwNj3Tfzydm/GRMNv9BrdBcgmgwlLTdBsPT76MeGPh2yQ6dV1gpVHSJ6QGeUzEJs
 mc2DyBaBolDYzw7cf6ZY3xSa6XcMFQ92+MuY0HVwGPswjvLx4q6JC8+ikZAdlbqJdq+y4FQhFbc
 jbm/mwqjw68bM4K1l6pqoDf+BoVziz9EQ13+GB2jpSY1yGCmoyRJ2GKaMR3yIvxUIshdJl9ydJx
 7VSGrd6QtFfChTsuKx4rbB/QSc5Ty7pZwS49uKjo32fiTmj+f3mU5nNGQlFfOhNlZXoR6PUH5ZG
 1ON0Jdmh
X-Proofpoint-ORIG-GUID: u7DBfK3MUMa-dieZbWhovP_fjrzpGw32
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-06_08,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018
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

On Sat, Sep 6, 2025 at 1:56=E2=80=AFPM Akhil P Oommen <akhilpo@oss.qualcomm=
.com> wrote:
>
> On 9/3/2025 8:44 PM, Konrad Dybcio wrote:
> > On 9/3/25 4:00 PM, Dmitry Baryshkov wrote:
> >> On Wed, Sep 03, 2025 at 03:36:34PM +0200, Konrad Dybcio wrote:
> >>> On 9/3/25 2:39 PM, Dmitry Baryshkov wrote:
> >>>> On Wed, Sep 03, 2025 at 02:26:30PM +0200, Konrad Dybcio wrote:
> >>>>> On 8/21/25 8:55 PM, Akhil P Oommen wrote:
> >>>>>> From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> >>>>>>
> >>>>>> Add gpu and gmu nodes for sa8775p chipset. As of now all
> >>>>>> SKUs have the same GPU fmax, so there is no requirement of
> >>>>>> speed bin support.
> >>>>>>
> >>>>>> Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> >>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>>>> ---
> >>>>>>  arch/arm64/boot/dts/qcom/lemans.dtsi | 116 ++++++++++++++++++++++=
+++++++++++++
> >>>>>>  1 file changed, 116 insertions(+)
> >>>>>>
> >>>>>> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boo=
t/dts/qcom/lemans.dtsi
> >>>>>> index 8ceb59742a9fc6562b2c38731ddabe3a549f7f35..8eac8d4719db923010=
5ad93ac22287850b6b007c 100644
> >>>>>> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> >>>>>> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> >>>>>> @@ -1097,6 +1097,18 @@ ipcc: mailbox@408000 {
> >>>>>>                          #mbox-cells =3D <2>;
> >>>>>>                  };
> >>>>>>
> >>>>>> +                qfprom: efuse@784000 {
> >>>>>> +                        compatible =3D "qcom,sa8775p-qfprom", "qc=
om,qfprom";
> >>>>>> +                        reg =3D <0x0 0x00784000 0x0 0x2410>;
> >>>>>
> >>>>> len =3D 0x3000
> >>>>>
> >>>>> [...]
> >>>>>
> >>>>>> +                gmu: gmu@3d6a000 {
> >>>>>> +                        compatible =3D "qcom,adreno-gmu-663.0", "=
qcom,adreno-gmu";
> >>>>>> +                        reg =3D <0x0 0x03d6a000 0x0 0x34000>,
> >>>>>
> >>>>> This bleeds into GPU_CC, len should be 0x26000
> >>>>
> >>>> gpucc is in the middle of GMU, see other platforms.
> >>>
> >>> This is not the case here
> >>
> >> Why? I think GPU CC is a part of the GMU by design: GMU accesses GPU C=
C
> >> registers directly from the firmware.
> >
> > Correct, however this is only a similarly sounding argument - the DT
> > describes the hardware from the main Arm cluster POV. The GMU Cortex-M
> > core has its own address map etc.

but the firmware is part of how the hardware appears to the main arm cluste=
r

> We have been keeping GPUCC region in the GMU's reg range in all chipsets
> for the purpose of coredump.
>
> Can we leave this as is until we have a mechanism to dump these into gpu
> coredump (via gpucc driver??)? I recall you proposed something similar
> sometime back.

IMO we should keep this in the GMU range.. if in the future we have
some other mechanism to dump gpucc state, then for future platforms we
can start using that (ie. new dt but old kernel should be a thing we
at least pretend to try to keep working), but for current/past
platforms we should stick with keeping this in the GMU's range

BR,
-R

> -Akhil
>
> >
> > Konrad
>
