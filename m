Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0D5AAE552
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 17:49:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFF3C10E848;
	Wed,  7 May 2025 15:49:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EPkq35zO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5307710E849
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 15:49:04 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 547E3S96014175
 for <dri-devel@lists.freedesktop.org>; Wed, 7 May 2025 15:48:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=sCssKQwqlkZybFzzJZnS5cDS
 IKfik9hOyKrvkleK4eY=; b=EPkq35zO6ueuQcbFY7Px3KxAZJumYb2SgJYVMIQG
 QOioTsVercQ9Au6rONc5DUjOCZRprRLhxNKz3eMeLFu2GH2boF1onBY7bAz9MkiG
 Y2DGVLDXvhDEPOCOGzZB+lpfNFOkRvIE5/xsJ4tyCuOvp380xcEbaPii4Z6NoGze
 pXm+AeCpkNvWQ+sU0J1HHA/NFSQi10WWQAekdRujOu96+FDISDMgYl0v1MY+v1kl
 e9sn9SIYmj9YESZxEhnWUkSrBXXkaG5BxQGNS16Zt4bG2IWfmjnjXfXR/tFdutke
 d3jCuxNW0I4J+t4Yl1W2cCBOpv+rmQr315g08EoCtE8Mcg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46g0kh1wdb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 15:48:59 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6e916df0d5dso853526d6.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 08:48:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746632938; x=1747237738;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sCssKQwqlkZybFzzJZnS5cDSIKfik9hOyKrvkleK4eY=;
 b=CIQ22khLONVudToXpto9YQzLzpevqPo+pYd7zcdehFOS8ee2TKCVtOArzhDpNt62gd
 OQvyH/CR7cm7lH+zGkZqk27NooNhy6aSvtrZMg3B8IFIrTI89KS7C1jXQf5/1wLUFGrx
 7LyU8YCS6PIoX64JkXKdHb/5gMJ+mO0AEClCozAIBw3o1i2oRGn0p7MnRlyj+cIIBNNy
 m2JtD32BUcoxISwb/qyZlkZnTr9g97GII0Fgm/2dU3MIfAP95D6xFHqr8sxeQrl22bAX
 jevqFPuzK+kbI2M9kZlib/56GIlqVlB+i8YEzKB0jn4lMZQWQY8/4krFtuXBLLboW52i
 TadA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKxqeC64/cdSjXgG9K4MggrP6puVboGBiamq43syiqexiQXPSjHa0kiwLen7N3akF8AKbJrwfhV7k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzTQdHIJsfwEsCcXQ1VjJUYe0yBodsWFnsJPNr6BVPmr2xPyXAC
 KAsGlb3T6zKWAwZ2kLfx+QzDVFFeUn3hSXaZmhEoDOuXglZkD1ImDVapPNU9Ro8vs1Swr2yaDEn
 ra4k0kZm2bVAPgBxJlBgyDG9plRb/JZ+ZlUki0b4oTBlwG3zHg5jHaNX5uZv9AVVNDvs=
X-Gm-Gg: ASbGnctPurJ6r8tlqpHZDa9tG9vfejBZQ5Ur5XFWEm9ANma1TYj4yGgLn7YobQGBaqp
 hnVdOCu5vmuxMKzM41vAl4QzAKyc+kT5HEQi3/mm07MruLtGqwgtqpcmYuLlD4/Osw2ckhTeKuC
 XX/Lxvza3qg56VAstobCNJqMs0tmIJjMsxgl8z3Tik7djCOHvFG2kAGjwBqpy8vUAaLNWGa9Xf+
 rTtZTxPBizu43Texc3tkI8jyr8xWvYywzyowzIvbAIUZ9UnnQaMdmoM/3+5mBGwtkx9vXQfh5Il
 OAHIiCQrs7GDnMldbIEGSnivPy8/ABcIk1RIhAbf2JlECN9MM3HcXvo3iE68hF6fb8h6uG0gui0
 =
X-Received: by 2002:ad4:574c:0:b0:6f4:f1aa:bdc9 with SMTP id
 6a1803df08f44-6f542a22256mr63115276d6.7.1746632938300; 
 Wed, 07 May 2025 08:48:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpqKBqvVCtmEDGnqQSDIg99DPZFwCrSN2UhDVL/02dWzadQzFLThTPNaoR0pTeP+O9HpyfqQ==
X-Received: by 2002:ad4:574c:0:b0:6f4:f1aa:bdc9 with SMTP id
 6a1803df08f44-6f542a22256mr63114676d6.7.1746632937860; 
 Wed, 07 May 2025 08:48:57 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32029306984sm22747811fa.58.2025.05.07.08.48.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 08:48:56 -0700 (PDT)
Date: Wed, 7 May 2025 18:48:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robdclark@gmail.com, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 07/11] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI
 to DP bridge nodes
Message-ID: <m6qrmvku6anw6ajg2qdbusodjxesfusi7w2pogvvz5lj5vfyx2@mcit7fy5w6ij>
References: <20250505094245.2660750-1-quic_amakhija@quicinc.com>
 <20250505094245.2660750-3-quic_amakhija@quicinc.com>
 <grwlmrgi5cfv3jtuki57ug7gsqykpwdf2to2l7di6glfxtb7vz@6id6cpfkrbuh>
 <88b139c4-0a35-4c9e-9993-573fede29b71@quicinc.com>
 <ip2phi56u4yof376t5a5mqhvo3x4oo4blcnirwc6w7eancpm7i@ofcgyfcxdmre>
 <bd136800-8ef5-4597-b918-41b9f97db14f@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd136800-8ef5-4597-b918-41b9f97db14f@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDE0OCBTYWx0ZWRfXycVcY33x0kEV
 mQ2qXroS/ZlsQxstrHVjLJDIOiVxRrTUMtQSEy7MkOk4duRi8aPIojKVXHWozGuJmiOovFpoFhZ
 RLvrTRReGINEJ3Rm7PbY8x3p/9+HSUsawX8jspPxxyaHQvSeoWPm6ehjANgbzwZKNYxXhssE1Wa
 IeirJoeqg0nOWthIMomUBvvQokhQPQT5LnhIQC7psve82xEQ1JvNciJtxh3OCReNNnUU+0O4Vlp
 2RGuyI0D4U4/YPbwvj3wdLwfN/jGuRzlnm3by+k422k0IHV9QbsKfDXNHDo3WMY22Yu2WAl6wpo
 ujayoQ9r8NSg5g4cpTfsMCphRFz16XGU9CYndPP9gPyc3qEY5r2Ya4WyPHYVukfE3fjigXVeuQM
 tHKCz7ku2tllqdaCgoOKNP2p5jS7io4bftk3PorqwgD8g5EuM8nfXNAmTl/oR8+/wQ37pOBK
X-Authority-Analysis: v=2.4 cv=PNUP+eqC c=1 sm=1 tr=0 ts=681b80eb cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=hnXmAr2WX_wFmnp3NVMA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: F7NJBHQRcknFoDwGvLMxcBerK-iOuSLL
X-Proofpoint-GUID: F7NJBHQRcknFoDwGvLMxcBerK-iOuSLL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_05,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 mlxlogscore=999 malwarescore=0 spamscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505070148
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

On Wed, May 07, 2025 at 06:27:54PM +0530, Ayushi Makhija wrote:
> On 5/6/2025 5:58 PM, Dmitry Baryshkov wrote:
> > On Tue, May 06, 2025 at 05:42:50PM +0530, Ayushi Makhija wrote:
> >> Hi Dmitry,
> >>
> >> On 5/5/2025 3:32 PM, Dmitry Baryshkov wrote:
> >>> On Mon, May 05, 2025 at 03:12:41PM +0530, Ayushi Makhija wrote:
> >>>> Add anx7625 DSI to DP bridge device nodes.
> >>>>
> >>>> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> >>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>> ---
> >>>>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 183 +++++++++++++++++++++
> >>>>  1 file changed, 183 insertions(+)
> >>>>
> >>>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> >>>> index 175f8b1e3b2d..de14f3ea8835 100644
> >>>> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> >>>> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> >>>> @@ -28,6 +28,15 @@ chosen {
> >>>>  		stdout-path = "serial0:115200n8";
> >>>>  	};
> >>>>  
> >>>> +	vph_pwr: vph-pwr-regulator {
> >>>> +		compatible = "regulator-fixed";
> >>>> +		regulator-name = "vph_pwr";
> >>>> +		regulator-min-microvolt = <12000000>;
> >>>> +		regulator-max-microvolt = <12000000>;
> >>>
> >>> 12 V, if my eyes don't deceive me.
> >>
> >> Yes, it's 12V. According to the chipset's power grid, the VPH rail is rated at 12 volts.
> >> That's significantly higher than what we typically see on mobile platforms. I guess,
> >> this is due to the SA8775P Ride SX being designed for automotive applications, where higher voltage levels are required.
> >>
> >>>
> >>>> +		regulator-always-on;
> >>>> +		regulator-boot-on;
> >>>> +	};
> >>>> +
> >>>
> >>> [...]
> >>>
> >>>> +
> >>>> +			bridge@58 {
> >>>> +				compatible = "analogix,anx7625";
> >>>> +				reg = <0x58>;
> >>>> +				interrupts-extended = <&io_expander 2 IRQ_TYPE_EDGE_FALLING>;
> >>>> +				enable-gpios = <&io_expander 1 GPIO_ACTIVE_HIGH>;
> >>>> +				reset-gpios = <&io_expander 0 GPIO_ACTIVE_HIGH>;
> >>>> +				vdd10-supply = <&vph_pwr>;
> >>>> +				vdd18-supply = <&vph_pwr>;
> >>>> +				vdd33-supply = <&vph_pwr>;
> >>>
> >>> Here you are saying that 1.0V, 1.8V and 3.3V pins are powered on by 12V
> >>> supply. I wonder how the board doesn't trigger all fire alarms in the
> >>> building.
> >>>
> >>
> >> Let me try to explain the connections from the schematics.
> >>
> >> In the SA8775P RIDE SX platform, the ANX bridge supplies are connected from the below sources:
> >>
> >> 1) AVDD1P8 is sourced from the `VREG_1P8` of the backplane card.
> >> 2) AVDD3P0 is sourced from the `VREG_3P0` of the backplane card.
> >> 3) AVDD1P0 is sourced from the TPS74801 LDO voltage regulator that has `VREG_1P8` connected to
> >>    VIN & EN lines, and `VREG_3P0` connected to BIAS line.
> >>  
> >> The `VREG_1P8` is sourced from a buck converter TPS54618CQRTERQ1 that is using 
> >> `VREG_5P0` as VIN and EN_VR1P8_M3P3 as EN signal. 
> >> Where the `EN_VR1P8_M3P3` is an output signal from SAK-TC397XX-256F300S BD micro-controller.
> >>  
> >> Similarly, the `VREG_1P3` and `VREG_5P0` are sourced from another buck converter LM5143QRWGRQ1
> >> that is using `VREG_12P0` as VIN and `EN_VR5P0_M3P3` as EN signal.
> >> Where the EN_VR5P0_M3P3 is an output from the same micro-controller.
> >>  
> >> Combining above details, all three ANX bridge supplies are getting enabled by `VREG_12P0` supply,
> >> `EN_VR1P8_M3P3` and `EN_VR5P0_M3P3` signals once the SOC is out of reset.
> >>  
> >> The `VREG_12P0` is directly sourced from `VBATT_IN`.
> >>  
> >> Since, there is no SW control for ANX bridge supplies and they are getting enabled
> >> once the SOC is out of reset, I have used vph-pwr-regulator dummy regulator.
> >> I am not sure if it's the right way to handle above scenario. Please let me know if there is other way to do the same.
> > 
> > Add these regulators as fixed ones, describing the power grid. Consult
> > other board files if you are unsure. RB3, RB5, HDKs - all these boards
> > have fixed-regulators for the grid.
> > 
> 
> Hi Dmirty,
> 
> After referring the RB3, RB5, HDKs boards example for fixed regulator.
> 

[...]

> 
> Let me know, Which way we need to define the our anx7625 bridge supplies.

Please describe the power grid. As accurate as seems logical for you. I
won't give you a single 'this is correct' here, but generally I'd prefer
having all vin-supply properly set. Please use grid names from the
schematics in order to describe the regulators (instead of inventing
them).

Hope this helps. Anyway, it's easier to discuss the code once you post
something, so I'm looking forward to seeing the patch.

-- 
With best wishes
Dmitry
