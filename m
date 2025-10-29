Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F18E3C17F55
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 02:58:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 953B710E6CE;
	Wed, 29 Oct 2025 01:58:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gk1piDNa";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K91QwgBe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72F6E10E6CE
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 01:58:53 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59SJlKWP2622270
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 01:58:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=9IavgnA3wJTsxViY9YsmCRsi
 9l8lOQx14IrwVBYaXOw=; b=gk1piDNaqjcYc7khLjvcbaS3hQHEM6gNLW0sgkjQ
 pasEx8zmvJnuk6HqMuOaPVxkCCwvLT3nAHjchhn6d7OeZFmC+4c/nzPUZH/V//PY
 3s0R5jL/IFziOEw/YsxMufZ53+fGOzFfLLrhDlB73vXfW+sKa7+JGCoN6+mvB3tj
 SorUxQqWLkAng9r1RpqT1hhUHgghoDIsKO+4dLnHpaze3FkRzYjswAPRH700LHFv
 uNgotEe2RW/iBh/zWt2yKNJYhNoYJwtE8PFu4wl12UzlDfwdGX1fKuvGmheu0aiy
 4loV4QLCExmB0qnma6zbGv2NqFU+ZD3QCId4xa0dC5lQpg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a10tck-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 01:58:52 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-880047f8636so26856356d6.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 18:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761703131; x=1762307931;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9IavgnA3wJTsxViY9YsmCRsi9l8lOQx14IrwVBYaXOw=;
 b=K91QwgBeKbj0v49sugemn1EYLFOrNQdR/1pj8t9JNT14UeU8mm4FSYeQT9f4RnpTBL
 bOndkmteHrD9goL4mbM1fvlOdJRog5Ch9TX4YiUA7JlWgpjVgApVejVvxEXb7hC1MvH9
 Cor1YusmpIm8xYIbajYGKUg2zi88mppGTZ9xjufCXoV5KV2VIZH7exUNV02RRLHPuLko
 mV+gua6Mjjs3NAKTF8/YXcfDrM06OWWijAX1FWe1wUFRXYxbO/kVUx47jabvn/Sy4GG5
 Xb1wS1nKRavvoHvlOH22nwPn1ze/DQ/DQtC2Z4HVvtHfAvAVZv+dTx+tbiNXWcPW9jqw
 /1CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761703131; x=1762307931;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9IavgnA3wJTsxViY9YsmCRsi9l8lOQx14IrwVBYaXOw=;
 b=Eqc0gmASqjs3XmSwNPwfpamu84GLKzRolhUU9TcZlvkBFrf4j5mOGbrvY3w1Z3ZZJF
 5jCGURwp74IpXCUr9Mi0dYRbmvB/ovmj5/HfCrbB0O9OLkvszm08iEgCyl3YswCk+5+t
 hrZeuVeRIBHAl8Awtl2/ANfs+FlpFV1dDjDxVFgDADP3iNWpwIuGNkrD5yFEKq580inl
 CNcfb9STRT1vLYXSJ4x3YRV4x1il76/r+YieKKcQWhBG4Pim1V7nWGYh5zwMX2i/wwx5
 qAd2JWmD2nRtndb6wZRDrm4v8qAgbCcqp+kj5LxnoICT9VgClk5b4W6ckh6QtXpGkTmq
 wywA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgu3W0wHiE4/N+BREJZIXX1cM4GAxCJOYM4qyVbypcFReipUD+oah++JqtStwwdkV1Bu2pnhen+NU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyeOuiMLLbhDf9yudqG3KnrrkPmscly5RCIoGZwZo4rW+cV4cCf
 5q4zkGQLgDZsN8+MSHRuAN4HQ0/3QqJQOtoGVtvu1v17pqOBUKmArFSn0ctyxR7AiTekQGUKV+w
 TRV8+H3DAz0C1vXEeDjmjmKMqU9Sdzsu2db4rJ7lw6mwzhAtNRVFwByEeRbj8bVuvAL6Qyco=
X-Gm-Gg: ASbGnct/iUHSJkJ2IGLSWQBRZdXmH4w59imCcvTdz5naA6xS1dIDPQxyeXWuvmjYW04
 lSuO4HumLRKqrTObQb6esB4lwKqKKL/OewTsmMyh6ChQsbCFDD79wZSKCcrIIIV9QsLXxRQIrJM
 5oq7Y9A2G76Y1bBhsLfDkgiRwr+S1MvMKyBwPpEvHY+BBkKTr0wZI8489IaW1IYdVQPpp80GpJs
 wTKlx4hgo1PM+dw3319pu3k97UCopQMdANdv3Dc9ufnYy8O4dn5VCOubzQF/uOG6etPqQbl5ip7
 nyjC1DHI6pdFr3E3PsHSEg1sLSTfxLqr0hxTuBN6o6yS+3JcUlngj8ABE3vcAzGsnaJsIlsbyFb
 PEtH+YomG4Qb/XhmqOO+t9UUNAe6XNfkXZzVfpFfAICjq9tJ2vN88ucVOdIh8mtJU
X-Received: by 2002:a05:6214:242f:b0:87d:f2e9:488 with SMTP id
 6a1803df08f44-88009acdd94mr15033566d6.11.1761703131469; 
 Tue, 28 Oct 2025 18:58:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDHmfG0LUjzp2Ek/MezF+lDC26fFhbmOLWFp413US458OqwG2FWmdGE+xxaaQJ07XpmM3Yzg==
X-Received: by 2002:a05:6214:242f:b0:87d:f2e9:488 with SMTP id
 6a1803df08f44-88009acdd94mr15033436d6.11.1761703131057; 
 Tue, 28 Oct 2025 18:58:51 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-87fc4944a84sm91522446d6.36.2025.10.28.18.58.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 18:58:50 -0700 (PDT)
Date: Wed, 29 Oct 2025 09:58:39 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
Message-ID: <aQF0zzUpLeUu4lrC@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-2-yuanjie.yang@oss.qualcomm.com>
 <zxofh6bwee3vjjlntlfqy7yg2iu2mipjvl7s5bcm6gbh233cjq@nuicjojawd2d>
 <aPsWEhM7i+gDjXE0@yuanjiey.ap.qualcomm.com>
 <4bnvh2ydtrmejknzpsxoalxoyjpq5g5cjbrico5ezbek24r52s@u5zy6ekh6lps>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4bnvh2ydtrmejknzpsxoalxoyjpq5g5cjbrico5ezbek24r52s@u5zy6ekh6lps>
X-Proofpoint-GUID: 2q6pDYjU-hj1DsmPjSTqikvDpk-JOGOE
X-Proofpoint-ORIG-GUID: 2q6pDYjU-hj1DsmPjSTqikvDpk-JOGOE
X-Authority-Analysis: v=2.4 cv=A5dh/qWG c=1 sm=1 tr=0 ts=690174dc cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=RHm5ZmmhJtTlhXRmaf0A:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDAxMyBTYWx0ZWRfXy654v3VxeAc7
 RivBVWvxiuhfv1K3km4NwHlK6JXSN5dPT9uwgeQCQLSgFj5R8bzlV2ql9d3B4wHW2o5uii8IxBa
 qCRHSRtIpjWGXZ34pq+MU06qKN2EG2P2f5E6UbO2vQWaE37rLM++DkZMYrEJfisLFsjXXWcmE2X
 4oN0UYAE2eD1EYlscDmWaXn6/IZrJgpcyl2o/hS+onDt1PU6zznq01c/WhoPO7f+mFXhr31IAVn
 39vu7jB/3B1eGZmupBPXi7lVxVCtlP77aosBJpHiYM7txNvwhU7nbCF4VcAxfQKGaM5Lw1bF6Ql
 kSArICo5vH7li9nWou35HGL/N24VAFCsyb7i6QyMFBdW62Dj5o/aSQZG8Ww0N8RzNL+8C4m8xxA
 O5aelibYodwdJtiL9V6KvypcNnkEQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290013
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

On Mon, Oct 27, 2025 at 02:22:04PM +0200, Dmitry Baryshkov wrote:
> On Fri, Oct 24, 2025 at 02:00:50PM +0800, yuanjiey wrote:
> > On Thu, Oct 23, 2025 at 03:14:38PM +0300, Dmitry Baryshkov wrote:
> > > On Thu, Oct 23, 2025 at 04:06:04PM +0800, yuanjie yang wrote:
> > > > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > > 
> > > > The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
> > > > VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.
> > > > 
> > > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > > ---
> > > >  drivers/gpu/drm/panel/panel-novatek-nt37801.c | 5 +++++
> > > >  1 file changed, 5 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/panel/panel-novatek-nt37801.c b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> > > > index d6a37d7e0cc6..7eda16e0c1f9 100644
> > > > --- a/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> > > > +++ b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> > > > @@ -267,6 +267,11 @@ static int novatek_nt37801_probe(struct mipi_dsi_device *dsi)
> > > >  	if (ret < 0)
> > > >  		return ret;
> > > >  
> > > > +	ret = regulator_set_voltage(ctx->supplies[0].consumer,
> > > > +				    1650000, 1950000);
> > > 
> > > This should be done in the DT. Limit the voltage per the user.
> > Two reason:
> > 1.
> > I see https://patchwork.freedesktop.org/patch/354612/
> > 
> > panel panel-novatek-nt35510.c also use regulator_set_voltage set right voltage,
> > so I do the same work.
> 
> Please look for the majority rather than the exceptions. Out of all
> panel drivers only two set the voltage directly.
> 
> > 
> > 2.     Kaanapali vddio regulator:
> > 
> > 		vreg_l12b_1p8: ldo12 {
> > 			regulator-name = "vreg_l12b_1p8";
> > 			regulator-min-microvolt = <1200000>;
> > 			regulator-max-microvolt = <1800000>;
> > 
> > 	Voltage is from 1.2~.1.8 V , So I can not set it 1.65~1.95 V from DT(1.95V is beyond the allowed range).
> > 	So I use regulator_set_voltage to set voltage, and regulator_set_voltage will choose the appropriate voltage.
> 
> DT has to list the voltage values that work for the devices on that
> particular platform. So, ldo12 should be listing 1.64 - 1.8 V.
get it. I check downstream DT,
  dosnstream DT:
   regulator-min-microvolt = <1800000>;
   regulator-max-microvolt = <1800000>;

  I test 1.8V works, So I will add 1.8V in next patch, do you think it is ok?

Thanks,
Yuanjie
 
> > 
> > 
> > Thanks,
> > Yuanjie
> > 
> > > > +	if (ret < 0)
> > > > +		return ret;
> > > > +
> > > >  	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> > > >  	if (IS_ERR(ctx->reset_gpio))
> > > >  		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
> > > > -- 
> > > > 2.34.1
> > > > 
> > > 
> > > -- 
> > > With best wishes
> > > Dmitry
> 
> -- 
> With best wishes
> Dmitry
