Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EAB2C0D7B3
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 13:22:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D427610E465;
	Mon, 27 Oct 2025 12:22:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mBs6Fgk9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C9A610E464
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 12:22:10 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59R8gUSs1052123
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 12:22:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Psg+67BfDLKR1waGwn5a3FoQ
 zpaxCzLH0+T9U8DBvbg=; b=mBs6Fgk95ffbn4ieruXYrS9Ov7pW4DuApfupuktD
 bX+M9/sG7KIZXUhn+qqhj100+ee+Iv5KD2GbjThnS4Yhp53XXfxDuex4rPALtaIj
 Fcpz1NKhX3QA1O75SAhUAC1YG399L0jTTLEXYrBLQ4XQGFwktwrkPkKVQrsF6vkA
 gzXRTmfqrUQvFbCLXpbqm5K//BKz0vLluu/2Srtx/T1Bin3VOpkZGJRg+5u1Mgv2
 hXcpprUqVZT4lrMiXbNwjpCWqxOHJwO6pS5wDPUIYgF7a2A/lQq/U4jFsGqEUitM
 oAte68UO9chMnRCUZy5W/CTreeeuHk3HxAiuT5CutnrrGQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a1ud1swqr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 12:22:09 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4e8a89c9750so141751501cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 05:22:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761567729; x=1762172529;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Psg+67BfDLKR1waGwn5a3FoQzpaxCzLH0+T9U8DBvbg=;
 b=p7EuUYusqo+ai7fJkfkq5Lu4v04nl9Vxjr/gnCqWpT3wBK4sZviN1lsDCebcIxr4wI
 IleoCGlsjPx/EAQNto1ThI4iZQRkaeZo/9LZg9SHRhvJjOm+phZJLlp2oS+aMDX6esNF
 MKXXbVtlGL79kjTeN3WzL0wfw1yjMIxaNDHiN49qoeNevXF0/VOs03hmruMDQEfW2Vvw
 /+kF0Urnsb8EfsNom9Aw3rv+7fGDLxUG2k07N9YuQcrS37jX6506+w4pU4W6qWZ1xY1U
 LKf0r6gKWbEYaQR+wghe5KsXiMGJKsGFu2psbPLeX0BJEAoyUImoC7+ZoyHTWTOS4yqY
 DOAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOWJZrhdOWoKU7XckY8uL179YvWspnqGRgs925Wd6UurAZpq+YwEB5xzG/R1X5PQ+3dlb+IlK3sd0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMl2V0UbDQD6qbbM4KPYOoiAnL4JEC0pDBDShxYwyTm2Ct4C41
 8Bmb/bsJlZK8gJs4Rj3qsM11RCVdypf9AKth+LpfLfTH++FYaLuVZeSFgIwFr+Tu5h39t2E2n9U
 B1ovD6qmsrGDvy5qgK3/2p2/NSj13yvX4XiZaTccOLDECvnOrus8EvgBTXSTdFfKpZCEhZI8=
X-Gm-Gg: ASbGncsUZjr0NdeOiQyNdYipH4e8O0nog54ol2kls4ympkSvuhVTH1vCHMSSbvPNJoo
 4HBK7789TjK/IZPjwDThLlplasGhzgW4SG5sa5JQVMkBlpHIQGRN860o0T65gawiHutOw9uwJ3o
 Sb4GnPMegnfVVyN1qieSUurD8fAY53TG0nf7FoPUBNcrBhEYUvmBl8eDo3DvHP7DxwE1xVWraDB
 1KJn1P6yjZ/fLI6S/XN2HqzpVoDwa0B4E0uCk56nxcGWvtgQfR5e0cuH/t5KNiLcmCx6UkA8Td0
 0wLoOw8qzThbYebhCPj6hD9cv+Miw8z/Pq/sA0GTLTZbNvzqUvpL/BlgApGc/jEWBUBS7CCfo2S
 JUqlc63XVshP91zRqXCt9PM4q/oLRd1LGdbgHRbJ3hBQ9gqLny+jT071aCP9Vn6arP8nVnPAH/K
 eUL2sE2Qr82Rm/
X-Received: by 2002:a05:622a:2291:b0:4ec:f017:9e2c with SMTP id
 d75a77b69052e-4ecf017a075mr61636211cf.35.1761567728681; 
 Mon, 27 Oct 2025 05:22:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGYgD/La2Tib5FQl2fihboVZ7Zt1I5VSs9oXv2jbhiaDS8YaEpcF2SppZieSQXcjQmVktSMA==
X-Received: by 2002:a05:622a:2291:b0:4ec:f017:9e2c with SMTP id
 d75a77b69052e-4ecf017a075mr61634961cf.35.1761567727214; 
 Mon, 27 Oct 2025 05:22:07 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-378ee0c342csm19672521fa.26.2025.10.27.05.22.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 05:22:06 -0700 (PDT)
Date: Mon, 27 Oct 2025 14:22:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjiey <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 07/12] drm/panel: Set sufficient voltage for panel nt37801
Message-ID: <4bnvh2ydtrmejknzpsxoalxoyjpq5g5cjbrico5ezbek24r52s@u5zy6ekh6lps>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-2-yuanjie.yang@oss.qualcomm.com>
 <zxofh6bwee3vjjlntlfqy7yg2iu2mipjvl7s5bcm6gbh233cjq@nuicjojawd2d>
 <aPsWEhM7i+gDjXE0@yuanjiey.ap.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPsWEhM7i+gDjXE0@yuanjiey.ap.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDExNSBTYWx0ZWRfXzPy69SSkBDXS
 NQe0beL/WZ5jAATJBVh5/9aWEXJjFZEG+OCCMiM8vf9OnneYmTwnPGs9M4v1DXerQrYZrher59b
 x5RPXsyR5futMFSM61TByApFgUdRaxQF2U0jCOkwfcqhboV5D/aR+B0D/LJD4qoKGwquUR239x7
 vkc7ZxsUF8CJTNnCCytkM1ZPtiL4ob2M8qSRBPuQXIWaheG4VlmfebfNpEDxzZLSYggNMRjO0O7
 HrWniDIC5/kJUnmrG17fKF94W8RhtB1+0i/f0RyE3exXxafr+qbVj1N43KNG6werkuCFejKXL9e
 pE2C2vs6kJoQnuTyqruPGKnSW6GgPmMlL2P1YY1Wt7oUYO4K4r5qAYGsNqx4HZ3PZHlJIySjKZE
 0V6hLj6kV/af/Idprr8Wm0AKEgV2Og==
X-Proofpoint-GUID: gAeS-ehbCY0x9bq6ojKwaD4gKA0gAB3N
X-Proofpoint-ORIG-GUID: gAeS-ehbCY0x9bq6ojKwaD4gKA0gAB3N
X-Authority-Analysis: v=2.4 cv=UqNu9uwB c=1 sm=1 tr=0 ts=68ff63f1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=UzKOEE2XrYQWi1Oh8k0A:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510270115
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

On Fri, Oct 24, 2025 at 02:00:50PM +0800, yuanjiey wrote:
> On Thu, Oct 23, 2025 at 03:14:38PM +0300, Dmitry Baryshkov wrote:
> > On Thu, Oct 23, 2025 at 04:06:04PM +0800, yuanjie yang wrote:
> > > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > 
> > > The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
> > > VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.
> > > 
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > ---
> > >  drivers/gpu/drm/panel/panel-novatek-nt37801.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/panel/panel-novatek-nt37801.c b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> > > index d6a37d7e0cc6..7eda16e0c1f9 100644
> > > --- a/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> > > +++ b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> > > @@ -267,6 +267,11 @@ static int novatek_nt37801_probe(struct mipi_dsi_device *dsi)
> > >  	if (ret < 0)
> > >  		return ret;
> > >  
> > > +	ret = regulator_set_voltage(ctx->supplies[0].consumer,
> > > +				    1650000, 1950000);
> > 
> > This should be done in the DT. Limit the voltage per the user.
> Two reason:
> 1.
> I see https://patchwork.freedesktop.org/patch/354612/
> 
> panel panel-novatek-nt35510.c also use regulator_set_voltage set right voltage,
> so I do the same work.

Please look for the majority rather than the exceptions. Out of all
panel drivers only two set the voltage directly.

> 
> 2.     Kaanapali vddio regulator:
> 
> 		vreg_l12b_1p8: ldo12 {
> 			regulator-name = "vreg_l12b_1p8";
> 			regulator-min-microvolt = <1200000>;
> 			regulator-max-microvolt = <1800000>;
> 
> 	Voltage is from 1.2~.1.8 V , So I can not set it 1.65~1.95 V from DT(1.95V is beyond the allowed range).
> 	So I use regulator_set_voltage to set voltage, and regulator_set_voltage will choose the appropriate voltage.

DT has to list the voltage values that work for the devices on that
particular platform. So, ldo12 should be listing 1.64 - 1.8 V.

> 
> 
> Thanks,
> Yuanjie
> 
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > >  	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> > >  	if (IS_ERR(ctx->reset_gpio))
> > >  		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
> > > -- 
> > > 2.34.1
> > > 
> > 
> > -- 
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
