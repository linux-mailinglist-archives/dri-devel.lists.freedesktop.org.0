Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIDCNAesm2kF4gMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 02:23:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AC51714CD
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 02:23:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F79B10E1E0;
	Mon, 23 Feb 2026 01:23:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ud7048ej";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G0XS4jPV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 470FA10E1E9
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 01:23:15 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61M1bg6W2917608
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 01:23:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LIWV/5G0cokkb/ZR19QELLZ7l/8kTWWB4xWhDTbzvGs=; b=Ud7048ejNeHA4vkx
 dBfiqeKBe3ezm5lg13+EriNcftbqRh2pNfrtbDX0xRWSH9giXlonYlx4MhbCzJqm
 Tf1ZefGJxA78yDCLulCwRkOCmbhJY8hISgzm+fCyj7t0JjbzzalfJ/HJtHGO9rHJ
 zQMbntVc5jPeuoskFC8dT+6pGRdpObX0/RSAye0f5yDSLBhDVuOdKMam+m31gmH0
 cuPJEoXzwHTw4HUnxv4Hub197Zndup7eE7MmW6S/6llMYeKjQ53Qsc9i2PjjJKa5
 3UVo+8laPmWcCWwvyfphKneIam4tGj3+4kmH9j2Stl1LDejXcaW1thmuddm4IJ0H
 G3dAfA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf603k1bu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 01:23:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8cb3a2eb984so522183085a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Feb 2026 17:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771809793; x=1772414593;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=LIWV/5G0cokkb/ZR19QELLZ7l/8kTWWB4xWhDTbzvGs=;
 b=G0XS4jPVuUjDKfF1cxiWF535/ow4cY4RISPK83xlc814O9KA4R73zfmpOAej2j4CJi
 sG3c6uQ2NA2CxIA34wXCRyVEUwABnwuBUyq60hTxotYbsid7rWxRSKm2PbjHbwsLPcNr
 THDPk9g5ceIHk6TOzcqiga9rtvPLgiU/PSXVYPfKdw9ShXDTE71V3dNWbi6+dApKCLbe
 nYLmkMiCwnx5595jDMlHQIPE6FGT2T+IZH7+f4z8dY2mPGwifOYqKhLgwoud6rGVlxZD
 ir18Dw4xi6sZ61xt3dCxyzkR8K/1XK8pblRaz2kjSBBrVch9jrnb7ifqCk9iS3QhgMSo
 d3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771809793; x=1772414593;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LIWV/5G0cokkb/ZR19QELLZ7l/8kTWWB4xWhDTbzvGs=;
 b=ZLgUnCuNQt+hDUzeUVvi2tKUSENSBJaGNijEChVFAdSzjG06FZhJi4HJgriaqu0OXh
 54KeOI3hZPUvn8pX5+9KDiy+TiU8kaa61QLq5qDf0lmS7/UkUxqhWTltyw4Yw1jGh1al
 cOdGz6P8yNMM5SKHZf4dO1oBHhD0WMG0GJoJ1VHF3DCzleHpAoMlvhRaclrNvMFbcK0V
 5UsTUsKnQwrO6LbKA65dEemyqledchJtueFT8jH1A/G6zb4siUXZBCbmte8EM+WxMDQ4
 f3iLqN2wqssfwNgGKM79H5wY6OB1c6AqygZ4eCWlLwCC79dCIDNXx9zH4UKHBgqkBZfw
 Y+7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzLkSJY0FW3DA2wGh7sxGMnEyUMyNRQKPO6YlP0GCKLkJlyuku/R2KXOSVLz7gzpAs2pxn6dFQUfc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxOCWh6wjW9UiBUt9DZt5KYKmPF49pBGvGr5spNEwWOwWe1E6eN
 FLDdaay0TdxQH7EgxyA+gW+J9UZqH1DLNPs/cgPoxHRcI2WgSyAtBDcHBbRwPP+3c8K38aMjPCP
 al1pG32veqJ0LsRqWW6H2ZN8nccp8zdgF8/jYm3P5n1176OOMtAj9qSJNz0xm6CJyP6imZIU=
X-Gm-Gg: AZuq6aIsuu1PmCtBvqzEKlAX2VAzkJwM5KsImiFwo5UjGOJ/oQmjS/YZWPvxARdS1NQ
 v8t5qRc04kuXCxANWEzhe/eavboX5Z6+ayVoHms4PE0YggJqvXBNyOKy5X2fl3zU7BhlJeRfqzB
 Xkw4Tvt+xGHsGU99ODOEt3Qa9+3BjuIx87Ru+spQdmRJLQ1BTbr31iAr5gFZkUOCuWR5njl0Nt2
 NUesoQau17xW6Zt2aamZcrZOP5+9OyHZ5NU8+db+kn2KDjEKaIyeF2/r7EvFgGpIz8EdQSckG+F
 3cP3qv+ePm/RIKEPTJHDfQ1hEUCiGcvY9ZLaFixO/Q/J++ztAIeOVxzfFcSGoUBZbK/Lv97DI5Q
 FCP+GmpJ4XdBUdTH5sWE9Q7s1e7gMQwzbd+8HtaXU7nNqcFjQbdazltWc5zgEqMh8zw4WGJPgtb
 JvGZsTwRzSyjhvdXqGFqyHGTQK/EZycT6myV4=
X-Received: by 2002:a05:620a:1927:b0:85c:bb2:ad9c with SMTP id
 af79cd13be357-8cb8ca656ebmr956476585a.53.1771809793581; 
 Sun, 22 Feb 2026 17:23:13 -0800 (PST)
X-Received: by 2002:a05:620a:1927:b0:85c:bb2:ad9c with SMTP id
 af79cd13be357-8cb8ca656ebmr956473185a.53.1771809793036; 
 Sun, 22 Feb 2026 17:23:13 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-389a78d2326sm13184151fa.15.2026.02.22.17.23.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Feb 2026 17:23:11 -0800 (PST)
Date: Mon, 23 Feb 2026 03:23:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?utf-8?B?TG/Dr2M=?= Minier <loic.minier@oss.qualcomm.com>
Subject: Re: [PATCH] drm/msm: add missing MODULE_DEVICE_ID definitions
Message-ID: <hpvt4dv3id6m26i4wvgngh6u553oag2vqc74anhs3q2ud57aqr@khrcib37a64d>
References: <20260219-msm-device-id-v1-1-9e7315a6fd20@oss.qualcomm.com>
 <d3119277-3205-49cb-81c6-1b12d10c5ec8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d3119277-3205-49cb-81c6-1b12d10c5ec8@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=XbWEDY55 c=1 sm=1 tr=0 ts=699bac02 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=NFef1q2CqZPfa1XFr5gA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDAwOSBTYWx0ZWRfX2xE9fAnG/wDk
 L+t+dEtCMAKAMhAIIScQFrkKL9RJzZOILLSyfLchb7NP/rRtsF27VuRJnulLSqD4tJNSwVxZc8f
 tzVd5lMHUYRrpjd8PzStmpWg9fIgo8Nx2KZBHOv0wiJ0h6ZOZJOyFZp5Mhnz8ToII5M5o6MOPr2
 cs/xDV9pz5IVxFrjgLUHbe6MPkwek/CkXWrPwyZCOe2G61lXJgBkJyW4KU7V77efSCeSeZVWXm7
 NFbpKKoljt3t8g8w97gYCra40JEHC+/sCypv5+iRCDaFh7ty6OVqGHR0r+0pmDM4pJ35m4HmuG6
 X/JPrRBdhiVbp1uyBwcbMNhynVKhrjjYlGmQFJHtBLsGbk/S2fieIRd5PpwZonAqTkmYKOn1p7i
 v4TwiIUGg5J86ChnrmmBgR/GQC7AnPpAhoQgYTtJJPaN2yh98CRFBCRmWhg7kdDtsgvPVLdXteR
 aAUMCCP44OEOKD3PHBQ==
X-Proofpoint-ORIG-GUID: 967EB-3O5LNaMHp4B-QS8EkndsHOgCgP
X-Proofpoint-GUID: 967EB-3O5LNaMHp4B-QS8EkndsHOgCgP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230009
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akhilpo@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:loic.minier@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 89AC51714CD
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 01:12:15AM +0530, Akhil P Oommen wrote:
> On 2/19/2026 5:49 PM, Dmitry Baryshkov wrote:
> > The drm/msm module bundles several drivers, each of them having a
> > separate OF match table, however only MDSS (subsystem) and KMS devices
> > had corresponding MODULE_DEVICE_ID tables. Thus, if the platform has
> > enabled only the GPU device (without enabling display counterparts), the
> > module will not be picked up and loaded by userspace.
> > 
> > Add MODULE_DEVICE_ID to the GPU driver and to all other drivers in this
> > module.
> > 
> > Fixes: 55459968176f ("drm/msm: add a330/apq8x74")
> > Reported-by: Loïc Minier <loic.minier@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> > The Fixes tag points to the first commit introducing OF-based GPU
> > matching (and thus possibility for the headless GPU binding). Other
> > are not usable without the main MDP4 / MDP5 / DPU drivers, so they
> > didn't get the Fixes tags of their own.
> > ---
> >  drivers/gpu/drm/msm/adreno/adreno_device.c | 1 +
> >  drivers/gpu/drm/msm/dp/dp_display.c        | 1 +
> >  drivers/gpu/drm/msm/dsi/dsi.c              | 1 +
> >  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c      | 1 +
> >  drivers/gpu/drm/msm/hdmi/hdmi.c            | 1 +
> >  drivers/gpu/drm/msm/hdmi/hdmi_phy.c        | 1 +
> >  6 files changed, 6 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > index 554d746f115b..4edfe80c5be7 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > @@ -302,6 +302,7 @@ static const struct of_device_id dt_match[] = {
> >  	{ .compatible = "qcom,kgsl-3d0" },
> >  	{}
> >  };
> > +MODULE_DEVICE_TABLE(of, dt_match);
> >  
> >  static int adreno_runtime_resume(struct device *dev)
> >  {
> > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > index 476848bf8cd1..d2124d625485 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > @@ -210,6 +210,7 @@ static const struct of_device_id msm_dp_dt_match[] = {
> >  	{ .compatible = "qcom,x1e80100-dp", .data = &msm_dp_desc_x1e80100 },
> >  	{}
> >  };
> > +MODULE_DEVICE_TABLE(of, msm_dp_dt_match);
> >  
> >  static struct msm_dp_display_private *dev_get_dp_display_private(struct device *dev)
> >  {
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
> > index d8bb40ef820e..3c9f01ed6271 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi.c
> > @@ -198,6 +198,7 @@ static const struct of_device_id dt_match[] = {
> >  	{ .compatible = "qcom,dsi-ctrl-6g-qcm2290" },
> >  	{}
> >  };
> > +MODULE_DEVICE_TABLE(of, dt_match);
> >  
> >  static const struct dev_pm_ops dsi_pm_ops = {
> >  	SET_RUNTIME_PM_OPS(msm_dsi_runtime_suspend, msm_dsi_runtime_resume, NULL)
> > diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> > index 7937266de1d2..c59375aaae19 100644
> > --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> > +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> > @@ -582,6 +582,7 @@ static const struct of_device_id dsi_phy_dt_match[] = {
> >  #endif
> >  	{}
> >  };
> > +MODULE_DEVICE_TABLE(of, dsi_phy_dt_match);
> >  
> >  /*
> >   * Currently, we only support one SoC for each PHY type. When we have multiple
> > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> > index 5afac09c0d33..d5ef5089c9e9 100644
> > --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> > +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> > @@ -441,6 +441,7 @@ static const struct of_device_id msm_hdmi_dt_match[] = {
> >  	{ .compatible = "qcom,hdmi-tx-8660", .data = &hdmi_tx_8960_config },
> >  	{}
> >  };
> > +MODULE_DEVICE_TABLE(of, msm_hdmi_dt_match);
> >  
> >  static struct platform_driver msm_hdmi_driver = {
> >  	.probe = msm_hdmi_dev_probe,
> > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
> > index 667573f1db7c..f726555bb681 100644
> > --- a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
> > +++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
> > @@ -204,6 +204,7 @@ static const struct of_device_id msm_hdmi_phy_dt_match[] = {
> >  	  .data = &msm_hdmi_phy_8998_cfg },
> >  	{}
> >  };
> > +MODULE_DEVICE_TABLE(of, msm_hdmi_phy_dt_match);
> >  
> >  static struct platform_driver msm_hdmi_phy_platform_driver = {
> >  	.probe      = msm_hdmi_phy_probe,
> > 
> 
> https://lore.kernel.org/lkml/20260124-adreno-module-table-v1-1-9c2dbb2638b4@oss.qualcomm.com/
> fwiw, there was a related patch that I posted recently. We can drop that.

Ouch, sorry, I forgot about it. I'll pick it up and then apply the rest
of this patch on top, adjusting the Fixes and commit message.

> 
> Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> 
> -Akhil.
> 
> > ---
> > base-commit: fe9e3edb6a215515d1148d32a5c445c5bdd7916f
> > change-id: 20260219-msm-device-id-84b95d22c0b0
> > 
> > Best regards,
> 

-- 
With best wishes
Dmitry
