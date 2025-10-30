Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9EEC1E180
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 03:08:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8058910E87B;
	Thu, 30 Oct 2025 02:08:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="e/aiOE48";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K3QKVkRN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE83410E87B
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 02:08:44 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59TG0LVc4135496
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 02:08:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=O/baTxXJPCHgYea9og1wAW8N
 5bDqCLQ1vuQ5vgT1fIE=; b=e/aiOE48Z02ig1rIP7e4M6lp3d/MqYESQvmoQSI9
 QaJY8pHe1TiXXHq5VR0Hg3XfPI3ChmFEPOOlFQuGVGLa3ub5hYq66WQkDw3abiZt
 PTU/BjYftESI6i8BshQQ6y8RPODxJYMWvf0ClKjSFlcxbg8+GIcOTUKjGioOOZqX
 3M8h556CSw8R/pKBMtzN50ibyg/dQ1S0a16sst31GrI/e5IN8C4GT6SktVOShrMc
 jOLbTqwjfwLh4yk7O5tBIEh+zynp4yXpBE0jFbuIsRNaL932f7g1KE2y1FYf0i6i
 eoOIRdVS/WnSyxnTUdbrFJrAUVPuIIX4uM6TAedVLoZaTQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3ff9u0u0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 02:08:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8a15d36c209so127947685a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 19:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761790123; x=1762394923;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=O/baTxXJPCHgYea9og1wAW8N5bDqCLQ1vuQ5vgT1fIE=;
 b=K3QKVkRNRFIH5XgUAf40HLM+Gr4MYX7PhZY97gVKHIwCW6a6moon55ZWsQxwtELm1P
 8r+syMUuB35DUyxFVWXfsRN/wSHbfI3bGSxFiuq/iDbiMjc/2xjhfEApv6I3pzs2Q1in
 He7J8kz2H7F2nZ1KH9LNIbOmW1r+lGU6QxS5YVPCZ+8FYn+ZRpqFjcJEzWQwoR3M3kTp
 SctCvYFOHX4G9353dsFikYljOAsld8Qs3gaEd55xQqWJocBr53Nr6UD21pjoIPjw+AyQ
 lT8R90TYvzSjbEhTR2ItX3tV3DbpmReHfHbnwl3earZjaVS8zsPEBi5dQT2BOH6DN75N
 9g+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761790123; x=1762394923;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O/baTxXJPCHgYea9og1wAW8N5bDqCLQ1vuQ5vgT1fIE=;
 b=e/bAzE3SZEL9s1p2d2s8qJ7DMd9ruvakBK08siRVtDFThYN/0VJfZiUW8dypTfA4Dn
 s8D5wMkBVvMDzcpY+wUE0XSk0e0SEm3OZGeM+R3Gmq9AwCmb0r/KyGPBu9hXLMeNkh8Z
 zTVcc9fVm1WGAASu5cTG90XVCuuWeg7DxPkAWCVa/CQPemay/oWe7yL+yQ7kVnPQbrF+
 H6/DOy9dnZU8eIb2p2AmpEo9W26xUHyDt3ZCWY/wsrxtPH5VtNarDM6168+610yOjSUX
 sEzUGmSjMY7mOzTAeWbO5PR5+inQpbmwWr5lKIQ9XNu30cJRQDIpWfAY75v6dbtW5BZZ
 iOPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6vXt/pVgFVATsx5V6Il91hbccubSwHqK1mRh2SZ/+V61cmryn7YsoJDrGnxq5RrgFHr4oVi0vyP8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYz24T5BGGGSLkJQ+5FsF34Sn6CoQOj0bjS+SZK3sEfv6BtrDx
 LCj9lt/wBWxMPkBZ4FiTiTgDj+XIB7JcEFfD4EfybUKLx1QnWJsayQ9ziymF1tcAYlatmPvlNgJ
 Lz0bjzSiz0jQL2Tv2ysABvRyv/BMErAURS7nkMWtNR6O8vXEknu0D6v01782a4cqjAMZl3Xk=
X-Gm-Gg: ASbGnctu1dk70SbKqWEIPcQ6s1eQ9mvkOAKraR/6I443HrXU09OnWdV2NtnRZstgGem
 5kGRvUBm6ubRNTLYyV2fEQPmmVbn1GZkTGPiV6Nzd0vElIbHyRrofM2z2NgfV1ECLqDAOpfOW3o
 IlK9/EQ99648gLWjz7QqEuTXdsDh+MbJlIVOoSeW+way3XvkpFE87qQsyZyMbNZ8GjcUonXwy+4
 lPjxe5e0UPlFIgIl+56ksB47tVmLQ2A6mCLn4YC+cfBNpGjOeYWSYmADhspuedJc3Bo6CaeRpu9
 OxXVgsGGXDsM6W7DPj06+uZlZ1clbQKx6yzpWiQEQ+4hwEDsJePdiz34/AKfjBgtftCy3jKBbHc
 3+WL21APpnv/44oFCYYBkltUO2A7NP+wfXpTemtkcr/dIeqUcr1Yt7eU8iers
X-Received: by 2002:a05:620a:45a3:b0:7e7:12c7:57d with SMTP id
 af79cd13be357-8aa2de73b12mr257835585a.44.1761790123299; 
 Wed, 29 Oct 2025 19:08:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfgmXNfYz7FjFrXiMMcOt/IAAGlLFbwsCSB3+3x8FbOF3Ov9Sbc6o7BWOw3LDDSUkHLl+H0A==
X-Received: by 2002:a05:620a:45a3:b0:7e7:12c7:57d with SMTP id
 af79cd13be357-8aa2de73b12mr257833485a.44.1761790122795; 
 Wed, 29 Oct 2025 19:08:42 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-89f25798afesm1161546485a.37.2025.10.29.19.08.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Oct 2025 19:08:41 -0700 (PDT)
Date: Thu, 30 Oct 2025 10:08:30 +0800
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
Message-ID: <aQLInjBCbeNJVanK@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-2-yuanjie.yang@oss.qualcomm.com>
 <zxofh6bwee3vjjlntlfqy7yg2iu2mipjvl7s5bcm6gbh233cjq@nuicjojawd2d>
 <aPsWEhM7i+gDjXE0@yuanjiey.ap.qualcomm.com>
 <4bnvh2ydtrmejknzpsxoalxoyjpq5g5cjbrico5ezbek24r52s@u5zy6ekh6lps>
 <aQF0zzUpLeUu4lrC@yuanjiey.ap.qualcomm.com>
 <5hftxsuqz745mxxk2hjpwfxwrm73p2l3dxn2mb2uqb2c44fd2w@l5xvadj7gvvg>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5hftxsuqz745mxxk2hjpwfxwrm73p2l3dxn2mb2uqb2c44fd2w@l5xvadj7gvvg>
X-Proofpoint-ORIG-GUID: Xu_8p6AcesjnaDhF33XjD68wAxrwHHvw
X-Proofpoint-GUID: Xu_8p6AcesjnaDhF33XjD68wAxrwHHvw
X-Authority-Analysis: v=2.4 cv=Cf4FJbrl c=1 sm=1 tr=0 ts=6902c8ac cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=Glo02QtyTbYzxwwq8ScA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDAxNSBTYWx0ZWRfX7At16w+VXDId
 YhvEmozWTxueG2S4Blm8yHoxH3hWcByZ5NLDDQZgqv1JU0B0twOFDlBtQyBA4D9tLMgk30nE10m
 pSo5oj9QLtdsma+0SkHrrWbgnCqU4+M5riHc+Cg73eNi6zUfX80EmzGkMjyeXXEjC4r+PhCFQxM
 MmJLQXGKQFw21TqGj1rox9Y2MrCoSYItPquo4dZISmCs6FlwntflTZ+ORUG/c3GeJXvjI9giIXf
 KhG79zVB+aCOiluhP1LhJgVFhLmX7UqJ///EzcPgVjeN/WW2OiyL8j/Xam2kacmRkgOZg3zAzO/
 SrxoZd0s/dbe/da2aYtkhDouS3PS0ckLcOGxBY9DbehT7rVF2JudlSB5I8nxPaN3m7Kzgmuo/76
 mrtClfJLmKMvE30lRrr668Z8qVFZAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300015
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

On Wed, Oct 29, 2025 at 02:20:13PM +0200, Dmitry Baryshkov wrote:
> On Wed, Oct 29, 2025 at 09:58:39AM +0800, yuanjiey wrote:
> > On Mon, Oct 27, 2025 at 02:22:04PM +0200, Dmitry Baryshkov wrote:
> > > On Fri, Oct 24, 2025 at 02:00:50PM +0800, yuanjiey wrote:
> > > > On Thu, Oct 23, 2025 at 03:14:38PM +0300, Dmitry Baryshkov wrote:
> > > > > On Thu, Oct 23, 2025 at 04:06:04PM +0800, yuanjie yang wrote:
> > > > > > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > > > > 
> > > > > > The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
> > > > > > VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.
> > > > > > 
> > > > > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > > > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/panel/panel-novatek-nt37801.c | 5 +++++
> > > > > >  1 file changed, 5 insertions(+)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/panel/panel-novatek-nt37801.c b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> > > > > > index d6a37d7e0cc6..7eda16e0c1f9 100644
> > > > > > --- a/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> > > > > > +++ b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> > > > > > @@ -267,6 +267,11 @@ static int novatek_nt37801_probe(struct mipi_dsi_device *dsi)
> > > > > >  	if (ret < 0)
> > > > > >  		return ret;
> > > > > >  
> > > > > > +	ret = regulator_set_voltage(ctx->supplies[0].consumer,
> > > > > > +				    1650000, 1950000);
> > > > > 
> > > > > This should be done in the DT. Limit the voltage per the user.
> > > > Two reason:
> > > > 1.
> > > > I see https://patchwork.freedesktop.org/patch/354612/
> > > > 
> > > > panel panel-novatek-nt35510.c also use regulator_set_voltage set right voltage,
> > > > so I do the same work.
> > > 
> > > Please look for the majority rather than the exceptions. Out of all
> > > panel drivers only two set the voltage directly.
> > > 
> > > > 
> > > > 2.     Kaanapali vddio regulator:
> > > > 
> > > > 		vreg_l12b_1p8: ldo12 {
> > > > 			regulator-name = "vreg_l12b_1p8";
> > > > 			regulator-min-microvolt = <1200000>;
> > > > 			regulator-max-microvolt = <1800000>;
> > > > 
> > > > 	Voltage is from 1.2~.1.8 V , So I can not set it 1.65~1.95 V from DT(1.95V is beyond the allowed range).
> > > > 	So I use regulator_set_voltage to set voltage, and regulator_set_voltage will choose the appropriate voltage.
> > > 
> > > DT has to list the voltage values that work for the devices on that
> > > particular platform. So, ldo12 should be listing 1.64 - 1.8 V.
> > get it. I check downstream DT,
> >   dosnstream DT:
> >    regulator-min-microvolt = <1800000>;
> >    regulator-max-microvolt = <1800000>;
> > 
> >   I test 1.8V works, So I will add 1.8V in next patch, do you think it is ok?
> 
> What does panel's datasheet say?

The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states 
VDDI=1.65V~1.95V.

So I should follow datasheet to set DT ldo12: 1.64 - 1.8V ?

if you think it is ture, I will fix it in next patch.

Thanks,
Yuanjie
 
> -- 
> With best wishes
> Dmitry
