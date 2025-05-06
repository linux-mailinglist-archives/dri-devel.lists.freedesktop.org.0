Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CD0AAC3F4
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 14:28:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3376210E677;
	Tue,  6 May 2025 12:28:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="h9GjvRVV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1105310E677
 for <dri-devel@lists.freedesktop.org>; Tue,  6 May 2025 12:28:21 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54689MGP016421
 for <dri-devel@lists.freedesktop.org>; Tue, 6 May 2025 12:28:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=pMr0pQfkZDzwyRYDfelKCIMW
 JikVyJ1ChOSk0SMsQ3g=; b=h9GjvRVVU3uo5NAzoCkH1M4/efx7Le5pKqoBAWlk
 KHjiHTu62y0vboD821I/hC6aTrCPPvBR53r38EklDXJxsYmfH6k7WI97CXM2Uk4n
 tNPKARH6t5lRAR6WR4LBMMfe37auRuXRMbzDL0xq3l+W0fWW1/h+FLfWIVs8c9kg
 hmuegPyawh6/XZQ2VG6tWpMByv8cjzRevFOkCkfTQdhIq6FeGmZOyMvFbuPS6krR
 eq8wdEoyJQ9F0xf70/HBpQ3qezI6DNksuxvP07GJXUXKCweCD5AKpM8SEhVW6f9q
 MlA+fn2Z0NiJHl1tBwqrghWal8q9ilBgFOoifs+Zu3uhSA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46e0xsx34d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 06 May 2025 12:28:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4767816a48cso99158501cf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 06 May 2025 05:28:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746534500; x=1747139300;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pMr0pQfkZDzwyRYDfelKCIMWJikVyJ1ChOSk0SMsQ3g=;
 b=vzMGlvovWHcJp+vDHYAa/hLEGBESntb/iGo3uEbM+NCb+Ns0gR5MzVWfM8624nW8++
 hJXfvkq4s/Hy9t/CUgijht5UwRBRFAzlSTmNE6zFz5odOirYBeoWdWFjpp6SbydksciG
 6acme+ic2k+akz2Cmi362n52V5d2++7O7C0i7ye+I3RH4wopMPaZG0h+3SwxcnJezYYt
 Y6BkNDA4lYjZG37f8Oh8rWANkqOeKQcANZiErpBkicU4JfL2GyIuEnrnwbcfmDVlLsNp
 BcARLqVc7WvLdeEi/GrOmN9d0AEKNWATMP+zO1pSNte5wsH3gleeqHIC2mfKE9Dwf/Xo
 dv+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWG8lU87abAJa4EXJskwEbO951RaRSmtXdI1/CDV9CU5e3G1pK9XyqMTir1+9QWcEsEVnkJHaAFj78=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxykMdRPb9uMpfR1vSK67wqwGowe37dRNScqszsRlSfjCcdlG7a
 egseH6fyQQUW3cRZ6Om5vOV2wL0yR2jY7mgujbeGk4DN8jAVtO2KEzHdxc9tMTbxXvsX/QPpk1y
 fKKbpzfEj9IJBdxk7m8NkjYxvJXg7NWCZwpYQUuj2lekweD1dJ6GrfF7cC/7vIzjC2VY=
X-Gm-Gg: ASbGncsj0qqP85e0BY6g3dA+MIO5+EnG3c0UQ+Psakrd2aQsQSZQqanj3wdSSyWjpIn
 OdOyQEo1cuJbvIDev+dx8c4JSZE57R6dgOdm0rhDW7wu0RvPxA6tHl9Ja9YIvdwfw3cRu2GzIY9
 siYFu6CrfObPnCAFR47obFurWs7di+trG8HDocm0X/XZ5vD8SAQtV/fXS3NeVjsXkD3StdN0zB0
 1ZDAvEaPhWYY0IsJp4+/qt3su/jUpvGCpMwQXtwStcXCchAjUSxnTaHTTxl4fo6pU5Gzr3RlbVv
 meDLBQirI54zV4BhIXSuWryGcOR1hYpgK6ILl045K9PVtfm4AZUM4ZF8tLogTQ7KSpGvLDbg374
 =
X-Received: by 2002:a05:622a:2d5:b0:48c:51f9:5dff with SMTP id
 d75a77b69052e-48dfeff471fmr207623701cf.4.1746534500243; 
 Tue, 06 May 2025 05:28:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVRzpe5kZ/C7fSbCX4k6D/yogiK3rg+EtVHsuYgNUWoJdLKfUJJzjORpHHDyQ+IzfzB/DYpg==
X-Received: by 2002:a05:622a:2d5:b0:48c:51f9:5dff with SMTP id
 d75a77b69052e-48dfeff471fmr207623051cf.4.1746534499730; 
 Tue, 06 May 2025 05:28:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94edff7sm2006256e87.137.2025.05.06.05.28.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 05:28:18 -0700 (PDT)
Date: Tue, 6 May 2025 15:28:17 +0300
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
Message-ID: <ip2phi56u4yof376t5a5mqhvo3x4oo4blcnirwc6w7eancpm7i@ofcgyfcxdmre>
References: <20250505094245.2660750-1-quic_amakhija@quicinc.com>
 <20250505094245.2660750-3-quic_amakhija@quicinc.com>
 <grwlmrgi5cfv3jtuki57ug7gsqykpwdf2to2l7di6glfxtb7vz@6id6cpfkrbuh>
 <88b139c4-0a35-4c9e-9993-573fede29b71@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88b139c4-0a35-4c9e-9993-573fede29b71@quicinc.com>
X-Proofpoint-GUID: ILOjjjn0Cwkxztuxr0alXnC5cqV9sZrB
X-Proofpoint-ORIG-GUID: ILOjjjn0Cwkxztuxr0alXnC5cqV9sZrB
X-Authority-Analysis: v=2.4 cv=bdprUPPB c=1 sm=1 tr=0 ts=681a0065 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=mgRI5fNFQDWczPtYMtsA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDEyMCBTYWx0ZWRfX6p6oNNzF+XCB
 TbnKBWJYRihbaj4IPZOiB0TK/rkZdfiV5zGPLHlUP047RAnbJbx7KEYpq9DmB+dubMlIjD0/zZh
 /FHbM+dUUiEKE+jdG7eTFuJX8aQi0RqPJ1oOsakslfvaZM1YPqQtvLceMeYuapiRInzGJP+yp4f
 FD3Hc69gT5GjbZ8VvwLl+eCIpncXKkhPfFijj5VMSMjwRKpqmdrAAJyJhOgbL+Cj0JSozPxqg5U
 EPaMJ+dseCkXBHwnTKaUXiHOQ6qRdd66J9YW1E6Yogh1RWc30+uykNmzIdirM+2Jpfn+IRHX5f5
 m7B1O89mX48SIdsvLdxca2F/9Zwn1yexKc6PF8RTVbVNvl6DgA8+j+s2morfYcWWOs9w6oljh8k
 lFSw/d8NpLUmMEBGHqnWsudU0Jj0BSy+/R65QcP2E5P+iCglEE7B01yMA9xorASkzSeW/Z8K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_05,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 impostorscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505060120
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

On Tue, May 06, 2025 at 05:42:50PM +0530, Ayushi Makhija wrote:
> Hi Dmitry,
> 
> On 5/5/2025 3:32 PM, Dmitry Baryshkov wrote:
> > On Mon, May 05, 2025 at 03:12:41PM +0530, Ayushi Makhija wrote:
> >> Add anx7625 DSI to DP bridge device nodes.
> >>
> >> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> >> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 183 +++++++++++++++++++++
> >>  1 file changed, 183 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> >> index 175f8b1e3b2d..de14f3ea8835 100644
> >> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> >> @@ -28,6 +28,15 @@ chosen {
> >>  		stdout-path = "serial0:115200n8";
> >>  	};
> >>  
> >> +	vph_pwr: vph-pwr-regulator {
> >> +		compatible = "regulator-fixed";
> >> +		regulator-name = "vph_pwr";
> >> +		regulator-min-microvolt = <12000000>;
> >> +		regulator-max-microvolt = <12000000>;
> > 
> > 12 V, if my eyes don't deceive me.
> 
> Yes, it's 12V. According to the chipset's power grid, the VPH rail is rated at 12 volts.
> That's significantly higher than what we typically see on mobile platforms. I guess,
> this is due to the SA8775P Ride SX being designed for automotive applications, where higher voltage levels are required.
> 
> > 
> >> +		regulator-always-on;
> >> +		regulator-boot-on;
> >> +	};
> >> +
> > 
> > [...]
> > 
> >> +
> >> +			bridge@58 {
> >> +				compatible = "analogix,anx7625";
> >> +				reg = <0x58>;
> >> +				interrupts-extended = <&io_expander 2 IRQ_TYPE_EDGE_FALLING>;
> >> +				enable-gpios = <&io_expander 1 GPIO_ACTIVE_HIGH>;
> >> +				reset-gpios = <&io_expander 0 GPIO_ACTIVE_HIGH>;
> >> +				vdd10-supply = <&vph_pwr>;
> >> +				vdd18-supply = <&vph_pwr>;
> >> +				vdd33-supply = <&vph_pwr>;
> > 
> > Here you are saying that 1.0V, 1.8V and 3.3V pins are powered on by 12V
> > supply. I wonder how the board doesn't trigger all fire alarms in the
> > building.
> > 
> 
> Let me try to explain the connections from the schematics.
> 
> In the SA8775P RIDE SX platform, the ANX bridge supplies are connected from the below sources:
> 
> 1) AVDD1P8 is sourced from the `VREG_1P8` of the backplane card.
> 2) AVDD3P0 is sourced from the `VREG_3P0` of the backplane card.
> 3) AVDD1P0 is sourced from the TPS74801 LDO voltage regulator that has `VREG_1P8` connected to
>    VIN & EN lines, and `VREG_3P0` connected to BIAS line.
>  
> The `VREG_1P8` is sourced from a buck converter TPS54618CQRTERQ1 that is using 
> `VREG_5P0` as VIN and EN_VR1P8_M3P3 as EN signal. 
> Where the `EN_VR1P8_M3P3` is an output signal from SAK-TC397XX-256F300S BD micro-controller.
>  
> Similarly, the `VREG_1P3` and `VREG_5P0` are sourced from another buck converter LM5143QRWGRQ1
> that is using `VREG_12P0` as VIN and `EN_VR5P0_M3P3` as EN signal.
> Where the EN_VR5P0_M3P3 is an output from the same micro-controller.
>  
> Combining above details, all three ANX bridge supplies are getting enabled by `VREG_12P0` supply,
> `EN_VR1P8_M3P3` and `EN_VR5P0_M3P3` signals once the SOC is out of reset.
>  
> The `VREG_12P0` is directly sourced from `VBATT_IN`.
>  
> Since, there is no SW control for ANX bridge supplies and they are getting enabled
> once the SOC is out of reset, I have used vph-pwr-regulator dummy regulator.
> I am not sure if it's the right way to handle above scenario. Please let me know if there is other way to do the same.

Add these regulators as fixed ones, describing the power grid. Consult
other board files if you are unsure. RB3, RB5, HDKs - all these boards
have fixed-regulators for the grid.

-- 
With best wishes
Dmitry
