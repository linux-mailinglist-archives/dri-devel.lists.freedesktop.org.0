Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 836D4BC4F60
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 14:49:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5359F10E103;
	Wed,  8 Oct 2025 12:49:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="A8En/Nhy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F3B210E103
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 12:49:34 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890aHB002321
 for <dri-devel@lists.freedesktop.org>; Wed, 8 Oct 2025 12:49:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=o2l8a/RrMPRcP4HFtypecMkn
 iIuriznY41w/vPB6cWA=; b=A8En/NhyIRh4HBUKryyFxcP6tqikwtzeowJFs/Y/
 bSMfBxwyD7jcPRkkyhOpF7d6hk+X1brXogBJ38N35TZkVAPV88ISBzcEt9z7/ZJ5
 24O7ZR35KJEQii2T1RY91FDEExU1SqmS41wD7tKKuqRSEss2+PNneeq6e6zrjm3I
 lSwJ3QDc1Fpfojoap+WJtabhSPYUoC47wCl7qwaehiBk3X1laIHv6kw1IXjJndlF
 XplTvtDIBLRVK/fis3YjZk/AvZP1Fyn1hSDB6HiUmyr2hsgHPqFELpoecUDIGIwD
 fKw6dZmWAkOdv5SaqgwYtMhhYoynotcg79GgfeENCSeMFQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jrxnaug9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 12:49:33 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-78e45d71f05so152800726d6.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 05:49:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759927772; x=1760532572;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o2l8a/RrMPRcP4HFtypecMkniIuriznY41w/vPB6cWA=;
 b=mF8nC7G4eKPSzMrgf/boUfhZbiV9eX3vIHxX28EDIxrIypWZYsyqpndK3t+BgC4LXd
 vrP3l1+1amcLhPBr0wTBUSRriqBSD22/6RgMwmGcTKs+CDSB4tgPg6ufp7fzq6aD6v6U
 Nnmy2Tdft6q2JAWczsS3Z5joT+GYzOd7j7Dk79W4xt/rN0XmD3h++BvCcXt7QgdDHFfe
 M4KeLBS4DZTCNauUxQHO+o02IiuOq59MkNRnMSziuaUgFFwgGcFFdgJPHCwb/Z2pyyIC
 /shfMWFYJtaKkYwe7rHwnEeGcqwY+GOAg/E0ZZFQ/EAA1W78QqfW2FyZpEngWAI7qnQt
 7IZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdkyJYtz6RMKVW5gsMdaYBW4K9afMXbJKAuCBjzVcPyotqv0kEjtRSZc4/W1uflI5aRnPY4FzAIbM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxooynwXQq2YGluyG3dx3yIe1QZ+ICv3+AFeN/Gi8DeM95XDWKX
 wPtwJIVCczFoddJdM6IcafOLhe6YdKl1U71onZqtbtdraYekcf4w4bQJ672XNe2tHsjXC+kS3yy
 Wf/Oq6fc/uIJFm+puzHj58RdLw7x3eSVpGVPTIx5J42gEkoSsCUqlgqGS5S7hSTqtQ+wTRMo=
X-Gm-Gg: ASbGncu8wPDy+QEi95H2g3XGo8i+64TZrFTxz3p+V5lV1ymHCk4L2x+8DPyvqF/zNKG
 mX/8ABsj2TNX8K5JT6acTOcGiZY8bpVtikRDlSI8vbpLFtYxGeoho2QEtHsg7eYaSA+oN33Zrcy
 mutU9mIi0pQt/5rKknhHTWVgWicRd7P5eQVqPIvr0VYsmjeLms1NWMMOckfufNqkTg1G0vtO9Ge
 ZjKQlLfOZR+PgWMh9DjqT0U7Z2GocdgiOGedPEBivBN0+IgTwqWeHt+DeCyvhcJA4Zpv//04hvP
 fNZsOup5JpQouz4qqqdC87CmaZfB06RGdwJ4e1JM7wRRhRKN8P2GSp5yVPEtIpw0Lwml7Z3P9bZ
 SjGzluldSIGV1/2gT2Iy9qDq0FQ/U/MeO/wI5fyPG7YwFsBnnbi/+IIdnPg==
X-Received: by 2002:a05:622a:1492:b0:4dd:e207:fd0 with SMTP id
 d75a77b69052e-4e6ead694f8mr45839071cf.74.1759927772251; 
 Wed, 08 Oct 2025 05:49:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6R45gywYeXfKfF/AAK9J8gCfjus0oEKiXMqBK9n/2HJsk3Zc+ToSrG2ZqrEHLeKIGtHha6Q==
X-Received: by 2002:a05:622a:1492:b0:4dd:e207:fd0 with SMTP id
 d75a77b69052e-4e6ead694f8mr45838661cf.74.1759927771781; 
 Wed, 08 Oct 2025 05:49:31 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-375f39fcb2dsm20195561fa.22.2025.10.08.05.49.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 05:49:30 -0700 (PDT)
Date: Wed, 8 Oct 2025 15:49:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
 marijn.suijten@somainline.org, swboyd@chromium.org, mripard@kernel.org,
 abel.vesa@linaro.org, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 robin.clark@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
 abhinav.kumar@linux.dev, sean@poorly.run, airlied@gmail.com,
 simona@ffwll.ch, alex.vinarskis@gmail.com,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_riteshk@quicnic.com, quic_amitsi@quicnic.com
Subject: Re: [PATCH 2/4] arm64: dts: qcom: lemans: add mdss1 displayPort
 device nodes
Message-ID: <6uo2w4lscjlx5mtio2xw3xgyyu6kem6kavtdxtu7cbyix6kews@h2ou2awbppzy>
References: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
 <20250926085956.2346179-3-quic_mkuntuma@quicinc.com>
 <e3400ab5-c4ea-455a-b8ea-d4fba2ece85d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e3400ab5-c4ea-455a-b8ea-d4fba2ece85d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwMSBTYWx0ZWRfXxgloXLOZrRb/
 HetKX1l9Zz5FY7aZmnTrBE0xAMPg8x1EgbaNNO8U7GqyqXk/74O3T1ytl8eHZRll8Yq7zDK+AG8
 RLWYQgeU2WIgAyPhe7fkM6Z7MYJGs4cNeTc95faXCZ5I4/UADSqZ3QyY9dVDaHKDULsJ7JU6jGD
 BDAncieyskpxMbP2iq8W70KCeEbPSQZwz0RyTXBWo3cICvoMe2vr75ctHnkXehbGhz13VTiR+Os
 BLuYxkpn19hxTb7dzNV1JWfTbnqkkEWE/rSDa+gGULWXVFFv9kuznavi/pw6dCZylMr07LnmVHC
 Um4nm/jwF58Bk5ehd9y/YFppVSRjuCNTq/l2TOMjp/fM2yGvv1S4cM6UDl5UfFFYH38xgusWcgn
 p5DCKchE/C27wWmJdZYP4OBGll2acQ==
X-Proofpoint-GUID: s3p59Y4fnjijyoVfZhRt_HHKMdVfV05z
X-Proofpoint-ORIG-GUID: s3p59Y4fnjijyoVfZhRt_HHKMdVfV05z
X-Authority-Analysis: v=2.4 cv=EqnfbCcA c=1 sm=1 tr=0 ts=68e65ddd cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=dL1b4mpT1AD2RcxrWJwA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040001
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

On Wed, Oct 08, 2025 at 02:40:35PM +0200, Konrad Dybcio wrote:
> On 9/26/25 10:59 AM, Mani Chandana Ballary Kuntumalla wrote:
> > Add device tree nodes for the mdss1 DPTX0 and DPTX1 controllers
> > with their corresponding PHYs.
> > 
> > Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> > ---
> 
> [...]
> 
> > +			mdss1_dp0: displayport-controller@22154000 {
> > +				compatible = "qcom,sa8775p-dp";
> > +
> > +				reg = <0x0 0x22154000 0x0 0x104>,
> 
> sz = 0x200

Hmm, why? I think the memory map specifies these sizes.

> 
> 
> > +			mdss1_dp1: displayport-controller@2215c000 {
> > +				compatible = "qcom,sa8775p-dp";
> > +
> > +				reg = <0x0 0x2215c000 0x0 0x104>,
> > +				      <0x0 0x2215c200 0x0 0x0c0>,
> > +				      <0x0 0x2215d000 0x0 0x770>,
> > +				      <0x0 0x2215e000 0x0 0x09c>,
> > +				      <0x0 0x2215f000 0x0 0x09c>,
> > +				      <0x0 0x22160000 0x0 0x09c>,
> > +				      <0x0 0x22161000 0x0 0x09c>,
> > +				      <0x0 0x22162000 0x0 0x23c>,
> > +				      <0x0 0x22163000 0x0 0x23c>;
> 
> 0x2216_2000 and _3000 don't exist, there's no MST2/3

Hmm, I will need to check this...

> 
> sizes should be changed similarly 
> 
> [...]
> 
> >  		dispcc1: clock-controller@22100000 {
> > @@ -6872,6 +7115,8 @@ dispcc1: clock-controller@22100000 {
> >  				 <&rpmhcc RPMH_CXO_CLK>,
> >  				 <&rpmhcc RPMH_CXO_CLK_A>,
> >  				 <&sleep_clk>,
> > +				 <&mdss1_dp0_phy 0>, <&mdss1_dp0_phy 1>,
> > +				 <&mdss1_dp1_phy 0>, <&mdss1_dp1_phy 1>,
> >  				 <0>, <0>, <0>, <0>,
> 
> You need to remove the same amount of zeroes that you added

Nice catch. Which means that somebody was sending untested patches.
Nice.

-- 
With best wishes
Dmitry
