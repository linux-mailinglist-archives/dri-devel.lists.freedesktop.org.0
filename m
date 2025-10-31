Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8023BC22F9F
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 03:22:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9538E10E975;
	Fri, 31 Oct 2025 02:22:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MTKCRy3C";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ifTYqeZM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE62810E154
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 02:22:08 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59V1mlDh1571629
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 02:22:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=3c1obq8ZZLIS5GwXPjQ6YRMj
 wgPZ1GO2NkBLtaKSH38=; b=MTKCRy3C00PEmbbajCqM9XMRIvF2EC05LSoBw22u
 eBnXU0FrabPR3cpF6hGOD6gYTkAwQbQVRIRA6vDvQseAOEqQuepSKlej9SmCLIWq
 e2NEU7cTHtO9Q1fTh7ttZfb9Fr0+nZFQAGnMg7PaGSB1VdO1iN+t6iQKJlSe+R94
 VSVsxtVahIg6dFuwWyYJGPhBbt1hEkkAVkLluopHS+5Up4/vmjaFPxTaBDGcnz8G
 nqe0iX16qBTXFM6298vQqSNWwAfaIx0u4tgbi6k/FhbIh+/VXiEWoaTvtIJQHbaZ
 yKkQDWtjrB9O+FKhanWMBct4H+tbv2+pjILWPSVoFDgW8Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4ksc02e6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 02:22:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4e8a387d01bso61853051cf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 19:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761877327; x=1762482127;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3c1obq8ZZLIS5GwXPjQ6YRMjwgPZ1GO2NkBLtaKSH38=;
 b=ifTYqeZMyVHfsP3L3VWE0Fg0CuVHDjhuotp6pM9SCTVw0cCDy63nZ/z2bHShpe7dPN
 xpjmPmAekAn+U0cNiSpk0FkPAM9e0QUUxqsOsV76JZ+/sXUvQFcKQDx2UcPCA8hLDVpT
 BzQYCEyQMZSowYAzCSbGBAj68pQEl/kfM7U2oTyGSiuXhsd/1uPQGBDaBKZqdKyvK7ll
 5KoiPk0HVLtOnSx9Zbr29kWdJ14S06HlK3RnFQh4qyftRvpaHASKVGs5fBrgIeWUbYq0
 kpGWoLQJWkFKcvxih+GyACJqTvYDlFdl6RVrLn9XH0VLsXNjQFDJ+nbk8n1YcICvkKh7
 kWRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761877327; x=1762482127;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3c1obq8ZZLIS5GwXPjQ6YRMjwgPZ1GO2NkBLtaKSH38=;
 b=sQfJgehtbnprdEXN0JdmVBR20LO3Ralj0ykcAMgRr/Qsfp4+KdO1S0RHOf94qQEGB5
 27fetN66bwQFqvCF86u9AbHxTA8CGv+Z7L/2QqZu1OqrsvRx2banYXT7hRuEnvoa7MiY
 XbFYosjUCavYUj3H/QWfOrlZtrioBii57U8sMoFgzxAQXVI/NuG7UpD1tkSOspxKclTF
 5iPp+exNNZPwF2Ij4BmhCZLFo7dsxtLgm+GwH9ZRy2b2BgpE4j/TxWift7ROkDQpKkie
 D8hUG6iA3v/9VFQOv//puuO/EeAgcQnb7tmXNROJ1TbnvyyfgFHAWhJtwqSDCxDO9hTs
 2K4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIfNHYvHlfNNCEV6mk7WdDcrCJTjveo0gtplEW8sct8vuYdQYXsi8Qh5fbvLpFFGlGFye8scfCJsU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtCAoOrlP2fbtxUDv5DO7u7J5NeZeOCg01oI85bL0BrOCsyf7O
 kiWhYaxy8lJyNEaMzSGCEbG7yY4QbhwzDgtXT+V/gzhDuF2gZnSssB8bu12HxyEJdJD2bO3q99Z
 hpkn2umXLaIrPk1ViqJd7wy9WlOTpLdoqN1WOzVxO0VGCkcN0Tc3Qn41DJz0UJlqjtZkYH+Y=
X-Gm-Gg: ASbGncvgDceHMm2XVMGd7839FFCjuefy5dTxW01g8yQ0YD7WPyCe5YaRuZhgwSM1/xU
 VNYbweLjhoVUp8vEN6DwBslIsimT3eVEBRs1/wNhj4kBYUpCgSdS8Hp4Eg+6CHgmKliCJLquNoY
 bZOG12u5iD+Ad8F4ohPH+Nh4psTCK1bS0SfcVaypeNe9J8ywH55hW+DIUlHzqaQghG+UlTQyvmn
 17RkXx6zHKWmQsC52Dgf8bn2n4Je7J4YuUfvoZ99Ih1sKWkJMBtIt5AU/eJ7PlQ6dlCs4WgHE+I
 GddTdgrY3TApwgaTwwA3+QdUATJnRXk0S98E7MGef8lrnAXuCiZvR+glqecTYtm2Hzu94a4xc+b
 qcJn6sIyNTPWg+8mQ3Y5Ie+WPVm0QOefM+xYu2IOyZiFjPu5rLoaUFAWTSjnN
X-Received: by 2002:a05:622a:44c:b0:4ed:2715:611d with SMTP id
 d75a77b69052e-4ed31076fc4mr20775771cf.65.1761877327131; 
 Thu, 30 Oct 2025 19:22:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGarE31FcqziYFgtP5AQeoEmQTIs0pBD7iyBHmNixxePHSIEujlFrVA2g4rLiwQlMH6ljRAYw==
X-Received: by 2002:a05:622a:44c:b0:4ed:2715:611d with SMTP id
 d75a77b69052e-4ed31076fc4mr20775461cf.65.1761877326654; 
 Thu, 30 Oct 2025 19:22:06 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8ac03a75453sm23545385a.51.2025.10.30.19.21.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 19:22:06 -0700 (PDT)
Date: Fri, 31 Oct 2025 10:21:54 +0800
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
Message-ID: <aQQdQoCLeKhYtY7W@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-2-yuanjie.yang@oss.qualcomm.com>
 <zxofh6bwee3vjjlntlfqy7yg2iu2mipjvl7s5bcm6gbh233cjq@nuicjojawd2d>
 <aPsWEhM7i+gDjXE0@yuanjiey.ap.qualcomm.com>
 <4bnvh2ydtrmejknzpsxoalxoyjpq5g5cjbrico5ezbek24r52s@u5zy6ekh6lps>
 <aQF0zzUpLeUu4lrC@yuanjiey.ap.qualcomm.com>
 <5hftxsuqz745mxxk2hjpwfxwrm73p2l3dxn2mb2uqb2c44fd2w@l5xvadj7gvvg>
 <aQLInjBCbeNJVanK@yuanjiey.ap.qualcomm.com>
 <r3sbg5r5pesrfrave7l6nx4ws62eogfn7m4f5c3ur2a6xkhsss@f5vfre2hd2cr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <r3sbg5r5pesrfrave7l6nx4ws62eogfn7m4f5c3ur2a6xkhsss@f5vfre2hd2cr>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDAxOSBTYWx0ZWRfX+Q46RcBWjJHb
 kSQGAsqkxLleByvudEB/zjTiUagWpRogP15oiYybNuVDTq7RE8HAdClF3atZZF/vChq/SaIjvxQ
 RXBA0aSO9s6O9EMSQ73/D2TeoQ5jOg9lQbka9YMZpWLz8YLJD7Yfm2CcEYwRLsPfj/pfMhs9Mwq
 bzl00t8rR35GwuHKbCaQ/eID1oM9A72+JshpihhUnh69cMRCMrzBtRVkLvp3NdL4WsuB/tN0NaF
 tMwzijknY3487Mg0S+h+Tc6//T2emHzLBVKKXH0ctQlybkFZrd+GT6pGIBu9QQcPfuMZk0PZnTj
 gnNd5ej10vEgh5GPQeTyI3DGy0KHmnDuvX3UTSYu6fkYRDnlgcFmrn6y3FUOkwZPJgDBY5a3+KL
 GGhZTJRAKANyzlx7wxOc+I3MTlegVw==
X-Authority-Analysis: v=2.4 cv=Q8PfIo2a c=1 sm=1 tr=0 ts=69041d4f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=hV_kQwtX5ugguncQdNAA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: RJXtrgLktorsQBJCJSZWFhwGQDwT5lso
X-Proofpoint-GUID: RJXtrgLktorsQBJCJSZWFhwGQDwT5lso
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310019
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

On Thu, Oct 30, 2025 at 07:57:46PM +0200, Dmitry Baryshkov wrote:
> On Thu, Oct 30, 2025 at 10:08:30AM +0800, yuanjiey wrote:
> > On Wed, Oct 29, 2025 at 02:20:13PM +0200, Dmitry Baryshkov wrote:
> > > On Wed, Oct 29, 2025 at 09:58:39AM +0800, yuanjiey wrote:
> > > > On Mon, Oct 27, 2025 at 02:22:04PM +0200, Dmitry Baryshkov wrote:
> > > > > On Fri, Oct 24, 2025 at 02:00:50PM +0800, yuanjiey wrote:
> > > > > > On Thu, Oct 23, 2025 at 03:14:38PM +0300, Dmitry Baryshkov wrote:
> > > > > > > On Thu, Oct 23, 2025 at 04:06:04PM +0800, yuanjie yang wrote:
> > > > > > > > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > > > > > > 
> > > > > > > > The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
> > > > > > > > VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.
> > > > > > > > 
> > > > > > > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > > > > > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > > > > > > ---
> > > > > > > >  drivers/gpu/drm/panel/panel-novatek-nt37801.c | 5 +++++
> > > > > > > >  1 file changed, 5 insertions(+)
> > > > > > > > 
> > > > > > > > diff --git a/drivers/gpu/drm/panel/panel-novatek-nt37801.c b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> > > > > > > > index d6a37d7e0cc6..7eda16e0c1f9 100644
> > > > > > > > --- a/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> > > > > > > > +++ b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> > > > > > > > @@ -267,6 +267,11 @@ static int novatek_nt37801_probe(struct mipi_dsi_device *dsi)
> > > > > > > >  	if (ret < 0)
> > > > > > > >  		return ret;
> > > > > > > >  
> > > > > > > > +	ret = regulator_set_voltage(ctx->supplies[0].consumer,
> > > > > > > > +				    1650000, 1950000);
> > > > > > > 
> > > > > > > This should be done in the DT. Limit the voltage per the user.
> > > > > > Two reason:
> > > > > > 1.
> > > > > > I see https://patchwork.freedesktop.org/patch/354612/
> > > > > > 
> > > > > > panel panel-novatek-nt35510.c also use regulator_set_voltage set right voltage,
> > > > > > so I do the same work.
> > > > > 
> > > > > Please look for the majority rather than the exceptions. Out of all
> > > > > panel drivers only two set the voltage directly.
> > > > > 
> > > > > > 
> > > > > > 2.     Kaanapali vddio regulator:
> > > > > > 
> > > > > > 		vreg_l12b_1p8: ldo12 {
> > > > > > 			regulator-name = "vreg_l12b_1p8";
> > > > > > 			regulator-min-microvolt = <1200000>;
> > > > > > 			regulator-max-microvolt = <1800000>;
> > > > > > 
> > > > > > 	Voltage is from 1.2~.1.8 V , So I can not set it 1.65~1.95 V from DT(1.95V is beyond the allowed range).
> > > > > > 	So I use regulator_set_voltage to set voltage, and regulator_set_voltage will choose the appropriate voltage.
> > > > > 
> > > > > DT has to list the voltage values that work for the devices on that
> > > > > particular platform. So, ldo12 should be listing 1.64 - 1.8 V.
> > > > get it. I check downstream DT,
> > > >   dosnstream DT:
> > > >    regulator-min-microvolt = <1800000>;
> > > >    regulator-max-microvolt = <1800000>;
> > > > 
> > > >   I test 1.8V works, So I will add 1.8V in next patch, do you think it is ok?
> > > 
> > > What does panel's datasheet say?
> > 
> > The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states 
> > VDDI=1.65V~1.95V.
> > 
> > So I should follow datasheet to set DT ldo12: 1.64 - 1.8V ?
> 
> If the panel declares minimum voltage to 1.65 V, why are you declaring
> 1.64 V as the mimimal voltage for the rail?

Corrcet here:

DT ldo12 will be  1.65 - 1.8V

Thanks,
Yuanjie

 
> > 
> > if you think it is ture, I will fix it in next patch.
> -- 
> With best wishes
> Dmitry
