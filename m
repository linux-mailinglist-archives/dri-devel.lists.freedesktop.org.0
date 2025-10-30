Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C60C21999
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 18:57:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F4AF10E089;
	Thu, 30 Oct 2025 17:57:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SZFgv9BW";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G1UK0atC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF50E10E0ED
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 17:57:51 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59U9N1323116645
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 17:57:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=NXUbL/o2sn1wUE5NQyCh4jie
 IT23KtAPiSUqZFn5Wbo=; b=SZFgv9BW01+Hn166INLJytfk9Tc0qrOHMe6Tyjcq
 qw9gpkmTzNDXcgF6jt7V5uEBuxuPa+EpW4Xc+SYUBoXbwRwLKgY4nhGDPgD9EZ6v
 H+VnVuxWrh2TxX1U7ibeqK0/zqvFsPB4oEOMITYkDXKI1j5mzuKEMEY5T+zufsDa
 e1C/nFc7Rq7Z7PGajnE8QoLg038ZxrQ4R0fsazMcOPLjLH5K413XuxJpsm9Rakty
 hk9cabnqq9fwSgMnp0o6HFC6ELn0+Y45mbguGoAeMCg5S+TmwpZokpCwHKRq/Lr0
 y0lmBUPOH/jpu5au6x5iDzEUD/QmP5PALxCV7RcmzM4mUg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a45b41fyn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 17:57:50 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4eba90c163cso23401911cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 10:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761847070; x=1762451870;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NXUbL/o2sn1wUE5NQyCh4jieIT23KtAPiSUqZFn5Wbo=;
 b=G1UK0atC+RnQi4m46XZGKP3EcVqMF766Nm/4nVd6n2Whb1Kazffzo1YMFbFgjt3Jh/
 Hq7ztd3bosbmOdNbA9fwr2ZWL1zzhanccw7SvW19cR6U34aQJiXifTufF0NK5LoQjjEO
 PidVT6L0Yfx8ewwPD+tsnfPIrgazQHoXmk4gRYp/MZDxF+rt1Og6V24jLcUzO8coJnUQ
 rnJ5Rh6PGbul1kGRlxtgiJ5sY3pWgDpVPpxwjwPCveNLQ49Bu4ustgAKirGEK9vsFKzP
 NgECfusgOJ9c0U+3I8i8gHf8oMWoIT+kWUtnG+zoIj2L6cIOunc83u9JIiwvRdIjryrM
 ItuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761847070; x=1762451870;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NXUbL/o2sn1wUE5NQyCh4jieIT23KtAPiSUqZFn5Wbo=;
 b=YsuW27mZrsfaO6kHx6k/EpCv8FNeix9gsEYD8OQ+2K5aXE1jmaSz/jdwZUFs6ZUWug
 BOW/AmhpD8pGA5zAftStP0UrndIMuqfnz6pciGRxa7YF/SC9+IbuwveB1wziQ8VvDZRc
 Yaa/MWbgNe3i8jDLYbQK5wPoOH5wfxm5uGd/Ujn2IWSmX1SFszM2wBjNOc98z1OmG/0c
 qXLJIwfkoFtQlNafb5icatQmUZl0hIwP0O5HtUkKg0vU4Gv6aR0kZizG6Z/ZT2pd4vRS
 Pc0SLqh9jWvKzeiBeroJIFURSx9WYNBdaCGEG/ASb4vwWOzKopRGU+dsR/tmo0D5L7c0
 7a9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW17GpSc5dv1d20ly1b16tvju4HFiFtuYcWx6vZTk18or5sp87isRJ4MB7iSECstMD9GjFaqWDRtRw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyilYRLXfoQ7c27hltV736DjeuiX8MX8Vv1jU28+F3Q9JE38F/t
 0F0rDTxwEp7P6tgyBbf/1DdaXLrgwuUxK/tXf9DoLPS6TEGqYH39gf/3/hM2LkUiyE7siYiBPh/
 H0wlnyAU5kV392t69c3jRbFxqdmgm08aS1bQqJiSsXULZTOZLIOl9wW/cRMPRgzkJTZFPVz01vX
 XPws0=
X-Gm-Gg: ASbGnctPibbi9c0sO4hWpLMcsZUe5glm4PHI6hNuRGLiewV1rrB0IhzxyiTHcv+qHYB
 YLvgi88Y0vfAZ8adbvwdLK4B5jqYezChH2n98u3DQ6aWxzbZtdq44XKoteVtXTt5IoWHvPDlOAh
 5HapHBQcc3eDyfgbbbaWLtugq+2FggpcpihWGco/s7OUia5gR4tXqehu1zMQhPFuTxvLsayq42q
 mvQXrjtyaron/yyun3vc/73t7Aw36CrNBsKpCjrj6LEttICE/azxkUTDfOooAJhaxe5e3LuJYPM
 TCpBNn//4wlyCzNp0mEwEPCS2Bdt+ksxRFTdCGfpiqIoEYdBJ2iQxH0kR4/7csOImrWgQWP44lB
 beEcrO/bmvJkP/zA5bsehkUZ4Rhs6ONhjzN8XdgTMmjKWhLqyRu8cG52TU3g7fEA/LDGa4qQ0Ph
 JZzfErdp/o/Cql
X-Received: by 2002:a05:622a:4819:b0:4ec:462e:242b with SMTP id
 d75a77b69052e-4ed30dd5e9amr7059461cf.20.1761847069919; 
 Thu, 30 Oct 2025 10:57:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSejMKE1hkVv4Ot3up0lwT6Xym/gfPMX4mG8HNuzC+q9tmdfU3kR7miFO7Jd4zjFh1tmuVPw==
X-Received: by 2002:a05:622a:4819:b0:4ec:462e:242b with SMTP id
 d75a77b69052e-4ed30dd5e9amr7059051cf.20.1761847069338; 
 Thu, 30 Oct 2025 10:57:49 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59301f730acsm4806939e87.84.2025.10.30.10.57.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 10:57:48 -0700 (PDT)
Date: Thu, 30 Oct 2025 19:57:46 +0200
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
Message-ID: <r3sbg5r5pesrfrave7l6nx4ws62eogfn7m4f5c3ur2a6xkhsss@f5vfre2hd2cr>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-2-yuanjie.yang@oss.qualcomm.com>
 <zxofh6bwee3vjjlntlfqy7yg2iu2mipjvl7s5bcm6gbh233cjq@nuicjojawd2d>
 <aPsWEhM7i+gDjXE0@yuanjiey.ap.qualcomm.com>
 <4bnvh2ydtrmejknzpsxoalxoyjpq5g5cjbrico5ezbek24r52s@u5zy6ekh6lps>
 <aQF0zzUpLeUu4lrC@yuanjiey.ap.qualcomm.com>
 <5hftxsuqz745mxxk2hjpwfxwrm73p2l3dxn2mb2uqb2c44fd2w@l5xvadj7gvvg>
 <aQLInjBCbeNJVanK@yuanjiey.ap.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQLInjBCbeNJVanK@yuanjiey.ap.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDE0OCBTYWx0ZWRfX2IJb8+MoAF1z
 Oraq58VMaJnlqHvODkjJWoieWfig2BGcjK53bowes4QcC8LhoxkkE65IHSTe1pKq6qXqdEfoSu7
 l8leYGN6EpskH/aGmCe/PaDHu1ykyLSrysQFpqdB4NUnX1VHRaVLFbdbIGNcqNgtBR7G7HQYEZT
 3rljlv4B4EZc+dKcuGxGJECrYZFZI9XS2X1TMMbs5dcw9Mtnotj1tQ6rnhaEEtAxltwW6i5OTce
 cehnFyUKF43FrwSZ4Hp1gdH10mYofoYdp9Wo/KefAIeZAWl30hacDtl/WYOMORJLn7792njE67P
 OA5sGCjerIF4q8L+V4c/+OMUBMr+S8emL2nW6RkaLOSx9tyMnIlzo+OHGpmD9XrehaX1B9stoQU
 qoWpS/io2bvtY8Zdz9ttvs6bWYuDJw==
X-Authority-Analysis: v=2.4 cv=KePfcAYD c=1 sm=1 tr=0 ts=6903a71e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=cUaFMJGz6fvP16gA3dcA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: AOr3MMw0uoJz7ZozSZtun4f4b8LHH7t7
X-Proofpoint-GUID: AOr3MMw0uoJz7ZozSZtun4f4b8LHH7t7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_06,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300148
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

On Thu, Oct 30, 2025 at 10:08:30AM +0800, yuanjiey wrote:
> On Wed, Oct 29, 2025 at 02:20:13PM +0200, Dmitry Baryshkov wrote:
> > On Wed, Oct 29, 2025 at 09:58:39AM +0800, yuanjiey wrote:
> > > On Mon, Oct 27, 2025 at 02:22:04PM +0200, Dmitry Baryshkov wrote:
> > > > On Fri, Oct 24, 2025 at 02:00:50PM +0800, yuanjiey wrote:
> > > > > On Thu, Oct 23, 2025 at 03:14:38PM +0300, Dmitry Baryshkov wrote:
> > > > > > On Thu, Oct 23, 2025 at 04:06:04PM +0800, yuanjie yang wrote:
> > > > > > > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > > > > > 
> > > > > > > The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
> > > > > > > VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.
> > > > > > > 
> > > > > > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > > > > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > > > > > ---
> > > > > > >  drivers/gpu/drm/panel/panel-novatek-nt37801.c | 5 +++++
> > > > > > >  1 file changed, 5 insertions(+)
> > > > > > > 
> > > > > > > diff --git a/drivers/gpu/drm/panel/panel-novatek-nt37801.c b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> > > > > > > index d6a37d7e0cc6..7eda16e0c1f9 100644
> > > > > > > --- a/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> > > > > > > +++ b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> > > > > > > @@ -267,6 +267,11 @@ static int novatek_nt37801_probe(struct mipi_dsi_device *dsi)
> > > > > > >  	if (ret < 0)
> > > > > > >  		return ret;
> > > > > > >  
> > > > > > > +	ret = regulator_set_voltage(ctx->supplies[0].consumer,
> > > > > > > +				    1650000, 1950000);
> > > > > > 
> > > > > > This should be done in the DT. Limit the voltage per the user.
> > > > > Two reason:
> > > > > 1.
> > > > > I see https://patchwork.freedesktop.org/patch/354612/
> > > > > 
> > > > > panel panel-novatek-nt35510.c also use regulator_set_voltage set right voltage,
> > > > > so I do the same work.
> > > > 
> > > > Please look for the majority rather than the exceptions. Out of all
> > > > panel drivers only two set the voltage directly.
> > > > 
> > > > > 
> > > > > 2.     Kaanapali vddio regulator:
> > > > > 
> > > > > 		vreg_l12b_1p8: ldo12 {
> > > > > 			regulator-name = "vreg_l12b_1p8";
> > > > > 			regulator-min-microvolt = <1200000>;
> > > > > 			regulator-max-microvolt = <1800000>;
> > > > > 
> > > > > 	Voltage is from 1.2~.1.8 V , So I can not set it 1.65~1.95 V from DT(1.95V is beyond the allowed range).
> > > > > 	So I use regulator_set_voltage to set voltage, and regulator_set_voltage will choose the appropriate voltage.
> > > > 
> > > > DT has to list the voltage values that work for the devices on that
> > > > particular platform. So, ldo12 should be listing 1.64 - 1.8 V.
> > > get it. I check downstream DT,
> > >   dosnstream DT:
> > >    regulator-min-microvolt = <1800000>;
> > >    regulator-max-microvolt = <1800000>;
> > > 
> > >   I test 1.8V works, So I will add 1.8V in next patch, do you think it is ok?
> > 
> > What does panel's datasheet say?
> 
> The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states 
> VDDI=1.65V~1.95V.
> 
> So I should follow datasheet to set DT ldo12: 1.64 - 1.8V ?

If the panel declares minimum voltage to 1.65 V, why are you declaring
1.64 V as the mimimal voltage for the rail?

> 
> if you think it is ture, I will fix it in next patch.
-- 
With best wishes
Dmitry
