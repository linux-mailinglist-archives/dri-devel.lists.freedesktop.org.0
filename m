Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE0BC046F9
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 08:01:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C73CA10E9CE;
	Fri, 24 Oct 2025 06:01:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="m6Z4oR+8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1988B10E15D
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 06:01:04 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O3FPcZ003425
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 06:01:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=JljS+79BkkayuCyE/UdcZ4I9
 cPPqvjjS+0ZvczbI6Tc=; b=m6Z4oR+8QNq+CUaHPQE2B6M926yCzAT5l3NMhh70
 I6QLqJBv0LJUmpq5DPaWWOAp+TPo1W7yId5+/aINIMEw+fsRA/7JomF0Oq8r0q0N
 AbmUghygkhsrndWQsXX0YgD7BcmhS0oUqQEH9MfDJJQWDOkByngWC3HKPOyawZI5
 laIKe4Tdrlzx7SBfVDPDRcCipDN0Wl+3UPlx1hccFiHTElD2oaFovo+HrnLkJZS6
 vrWGyvAxnNtXo7PyM7w9UELHxo72D3NnI/IhVBvHUrT9SiArdRC9QCwTSqpCq1s5
 8fQ90Z8B2T/OWnI5STfi3lwFNU7FJ4xOtyDqxlBvRUVm1g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27jav17-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 06:01:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8904a9e94ebso409253585a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 23:01:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761285662; x=1761890462;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JljS+79BkkayuCyE/UdcZ4I9cPPqvjjS+0ZvczbI6Tc=;
 b=nOf+J79EgYkzOa9Wgbs7+2xTxxqnq802uI6wTbcladaw4wBlrclBndpHOI0oCY8W+n
 6lJWozUarng8ZWBv1F5uPAEx1+AM5mkUwqFOTvtlW4Tox2tsUnXBHLe7433HY1slqYoN
 3px5hyt/Rw80JMNfRzkeww2B3IY1PbDtaizkhltpO4X8KK9KNm2k35vdsoTPLUVuGMBh
 jGzjN0czdDqb8nTbLKvQfk4ebizF+mGmw9lVUDQD2EHxfryCfWm+ZOtT8GfqRglwY/vh
 1J7dMuGx0+uUvjtQ/hPv/IqEgYDvczVHI2GMd0KOs21dxbzIIQB5iaijR3x+4bF7Ch71
 vL+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGwIz6UxxfFIqMaCKri3y0248m8HzD812gUZ8mvF0XbQErwLxb77+5jPP5kqKlig23j+Vy8bsBOSM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyysXaJK3IwPmj/UbYHQmUmnI+HcpuB/4nZjk4diIfUf7iBWdeS
 fuJlq+7ulMp2wPhj/r0oQLJMPKsfznLZB52LAA14fZQ48hChgmoSlwi9RBOmRIRWLAnYUcYVQhM
 hEYTxdFWmmtuYtDtgXe5xnsNAG55wWv7fmwpBiHMHA7IAVAUItMLO0ucOXcGncXmD6C+52zE=
X-Gm-Gg: ASbGncvFBgSVmyaZOf0rmpGyFMA3F2pq/vrsL1IdmJIoyCzYZ5XXYSlKYjtNG4XUxCY
 iPmI+mvcmWmwn0AaMIzIXfTZUw00gYw6DIPJnTUXTQxTtEMWk+0hW2bHmMxeubMNzsRyFsr/ukc
 mTRY/kSlN9XRn9w66t4IHUN1WB+pQ0O2NZisLcbUg/bh9NN/4LAWU1Y2hkZkZJkKKZhcA6021FQ
 uB72CW4KfKJY8eFgUlCwUw8tKOCr32AR6NR2euX25xRFEa4eFGN77uJMqxyvHDdJQ5qMa1XnUYA
 q9mGPPRBhfrsylAT9lV635faTXrm3hrUcFzy4xtgZTR9zVieG4vWXlXGvYM+573c3YoW35f057N
 swnD8CyJNWXxjbM4TOvjN5f1AQ4w8cyubnAtdq161hBvk6G+nMPdcMGNpVjFv
X-Received: by 2002:a05:620a:45a3:b0:891:f880:dec6 with SMTP id
 af79cd13be357-89c0fece440mr693961585a.33.1761285662219; 
 Thu, 23 Oct 2025 23:01:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHduJaSPRzsh9CpSDx/crrVPNRb7TaSEXxg5lKfzwZ0BKGlQdnu0kRcGVeK/eZaccdwzHwgHQ==
X-Received: by 2002:a05:620a:45a3:b0:891:f880:dec6 with SMTP id
 af79cd13be357-89c0fece440mr693957485a.33.1761285661726; 
 Thu, 23 Oct 2025 23:01:01 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-89c11698b74sm319154485a.30.2025.10.23.23.00.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 23:01:01 -0700 (PDT)
Date: Fri, 24 Oct 2025 14:00:50 +0800
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
Message-ID: <aPsWEhM7i+gDjXE0@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-2-yuanjie.yang@oss.qualcomm.com>
 <zxofh6bwee3vjjlntlfqy7yg2iu2mipjvl7s5bcm6gbh233cjq@nuicjojawd2d>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <zxofh6bwee3vjjlntlfqy7yg2iu2mipjvl7s5bcm6gbh233cjq@nuicjojawd2d>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX1FQKtcAm2/2s
 YOV8jSeS3f855/oDiQt/KiTPHn6qCK/4fmgOowIFqxARpH6Av9o3fL/pwziB6KoYpmllHLtYlkO
 J/ntUp7C7X9YJnxfI/rMxNeZ8XUMLwPfrP+SiQ1iawTkXDQCRt+kIgiGeYne+H2mvP3Uy4VmvRj
 2veXsDA7AWreuoq5xygV+3dPyhLsoAt2rXsebUgeT2Jwh5VzYAfuSID6g2iFvHVCETrNVX+5EST
 /O9D6f8pg8JgMtDmfhW3LoUBjpdXQ/KMrgsrpiO8jIttZoY+47F3yE4n7/Lxo87lSjwXpdquALh
 wTYq58ISrYPjfc+bK6S1XPufWp/VrFUVQLY42fceJJIE7OGiTw9rbzrcF0oajJHBZem8aFEAyus
 gdvfpE6jWYIxC2Qge5juezBTLwygzA==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68fb161f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=-aLJWpWAS0NDeqwcDiMA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: A4cz9lPFvJEZ19eZVKFr3dbFMCUjx_wD
X-Proofpoint-ORIG-GUID: A4cz9lPFvJEZ19eZVKFr3dbFMCUjx_wD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018
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

On Thu, Oct 23, 2025 at 03:14:38PM +0300, Dmitry Baryshkov wrote:
> On Thu, Oct 23, 2025 at 04:06:04PM +0800, yuanjie yang wrote:
> > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > 
> > The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
> > VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.
> > 
> > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/panel/panel-novatek-nt37801.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/panel/panel-novatek-nt37801.c b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> > index d6a37d7e0cc6..7eda16e0c1f9 100644
> > --- a/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> > +++ b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> > @@ -267,6 +267,11 @@ static int novatek_nt37801_probe(struct mipi_dsi_device *dsi)
> >  	if (ret < 0)
> >  		return ret;
> >  
> > +	ret = regulator_set_voltage(ctx->supplies[0].consumer,
> > +				    1650000, 1950000);
> 
> This should be done in the DT. Limit the voltage per the user.
Two reason:
1.
I see https://patchwork.freedesktop.org/patch/354612/

panel panel-novatek-nt35510.c also use regulator_set_voltage set right voltage,
so I do the same work.

2.     Kaanapali vddio regulator:

		vreg_l12b_1p8: ldo12 {
			regulator-name = "vreg_l12b_1p8";
			regulator-min-microvolt = <1200000>;
			regulator-max-microvolt = <1800000>;

	Voltage is from 1.2~.1.8 V , So I can not set it 1.65~1.95 V from DT(1.95V is beyond the allowed range).
	So I use regulator_set_voltage to set voltage, and regulator_set_voltage will choose the appropriate voltage.


Thanks,
Yuanjie

> > +	if (ret < 0)
> > +		return ret;
> > +
> >  	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> >  	if (IS_ERR(ctx->reset_gpio))
> >  		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
> > -- 
> > 2.34.1
> > 
> 
> -- 
> With best wishes
> Dmitry
