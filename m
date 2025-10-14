Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8CDBDB99A
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 00:17:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EC2410E6A7;
	Tue, 14 Oct 2025 22:17:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="B9XLbw6F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F33D710E6A7
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 22:17:05 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EKRXhM019993
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 22:17:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=acxFHNB1qCMmBdmM94I3DPDY
 6fafFAZsfZx2OVrKtSs=; b=B9XLbw6Fx2zZ1zBQM570nvp2RMkPYfqyQDQkWZhv
 fzQTbA08rlojgXNeCKfhGuQOndGo3Y9tjj47AwmdGiNu8D62lfTRJqwRTWqzObbm
 xX6SwScK2mMiHynka1CbmHUJMHuVb5DV1hyIOwY0wpOeQ2enGaDuK/DwgLiZ8FrH
 VoyoZlgmM86qvCb+OekhKp3cfCmCoNexlt8FcneC3FxejfLl1BhtIjXifYcyBjaC
 GxUgqbLfCGJ0pdouIlqEZdznFyJgvzWwVOXiKK9ZPB2zaNkC7Ug2trpVYDm865Qt
 gxicwWVxfk9/n1UxpeD35z1/p3BZ2BpyDKkH01UxhTINyg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rtrt7315-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 22:17:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-88e2bd0791cso8746085a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 15:17:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760480224; x=1761085024;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=acxFHNB1qCMmBdmM94I3DPDY6fafFAZsfZx2OVrKtSs=;
 b=XOP6Hd1wcVtWVKmXVdZZXQIQmrXgWGmGSZltFcKKIx2n23IElzySM/VnFzmebdFyU/
 7yQmCoWRFA4+myF5BpdqENDtoXpmylYQnwM5hiDZTCsOBs+biG/U71jMG6Q3PA/RCMzi
 8lEYEifn6odL1Fzd5OYKJXL4Zs7voWhBRm/7Xu6bnT/OUUmhc40mOB//zGc4LofPKkf0
 pVyyK51lcZ4BkBP36xGhbOxIbiDpR6Ezkk3NNv1f0r8GJy7X/jythWvaZZ85seTI1PNx
 OYRCiMsyKT6hIF6Oy3zjWTWAwT5ge/9mwaybk9w2hoocSrQdI/Ws+LCfBk5jP9sOQceH
 XtvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1C5FgCbP+gvLFrfMqU+mNyOPz2ZV+WeKEW2E39xn4PB2J0GwnR3SL+fg9lsqepHdH0Pzk2N970S4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2yA3aHL7fUoU8pDrMu8cES7cSbLmMGEtXj7VRVWR761js41w1
 FuFYanNhbsM1/UxcM282LCSxcyqxidh7UaFlUHsVfv7BjwCsZHKDE7XokQg0cmCBJ/e8+B7+bya
 RB9gsO+WOcVo5iOIFWo5jFj35l/54oTe+A0jlwq1CkiQdFDAZNxUcgGwo0kHBJgi3VxQbLvM=
X-Gm-Gg: ASbGncvV4pO+gRrBUukjb4WvM4WhFgdr9/kQpP7AplnfnB1QiFK38dtQ26Y2G4DokVT
 yMgfYC7mTTsGA8RIdMPiTujedMfi7rZg1XECCETMZWwG8/jSDNN7PxuzqKQvS6PYMfv/Yc1bOm8
 BTmcVe+VxNVTJh9WXiQA1qDQie53cNVic8rQt8uXJC2/Zk2DxiCk9Y8c391T2GiYApKSyOYJKXx
 mZf5PImP1aT2Ow/sJnClwrhgQgefTlLr9oO5hAjoV2/D3wXagLotVLELKMEw0Q+QEgJloakUjFi
 7ds1GLasaek24762X9RC4+VPkIEAIiZW7MIP7YNYb+98rWru6YeL9XIs7Xqtvn8PORVZetD/Y0q
 wytnNEnXH1+/MqntC5DhF096oXo1Ueaeda8PA8Qq2EyplXeA4qZDW
X-Received: by 2002:a05:620a:d96:b0:84e:2544:6be7 with SMTP id
 af79cd13be357-88356bece86mr3605347285a.65.1760480224030; 
 Tue, 14 Oct 2025 15:17:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqry7gL0o/foP5bdIZkkIufw42pdC4mWKYSgvEtxW5lk93OwMTW4qm5JmsLq1hgKg1FOcqoQ==
X-Received: by 2002:a05:620a:d96:b0:84e:2544:6be7 with SMTP id
 af79cd13be357-88356bece86mr3605341585a.65.1760480223473; 
 Tue, 14 Oct 2025 15:17:03 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3762e77ea14sm42497401fa.7.2025.10.14.15.16.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 15:17:01 -0700 (PDT)
Date: Wed, 15 Oct 2025 01:16:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: xiangxu.yin@oss.qualcomm.com
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: qcs615-ride: Enable DisplayPort
Message-ID: <geh3pbatv53bnk2zgyalnwvumvcsqaz6n7x6dniohsfk7r56sq@mpflfuye62ly>
References: <20251014-add-displayport-support-to-qcs615-devicetree-v3-0-74ec96ba8144@oss.qualcomm.com>
 <20251014-add-displayport-support-to-qcs615-devicetree-v3-3-74ec96ba8144@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014-add-displayport-support-to-qcs615-devicetree-v3-3-74ec96ba8144@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 0vJrrlYi99gL5t9wQwORta5bCXHwp0yM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAyMiBTYWx0ZWRfX/tYhbrrD0ICe
 8aa9e/dsSg+nv7PRSGxQq2TtyJudf+d7xYWSBuZH/rsPVlVw0e2n0Vhj+MeD9P/got/xZJ/mTDn
 2Vs9UYXrHwCAdVIcwLgJwxRmAWY89AeDdmqjtM4oGk9iAhlIBsd7zLP8MwQeLN9qm1Ff6cMPHrV
 d60drjBMEcwQPeJqGAMrWgAuJd/F8tG0YdlENWkBFHp5muHKCV+Xt4s+pwkcOx0LHlFiL/yHRlL
 lMuYFl1sriefazBnO0SYY3m5uyC9eNQzDa8KqfWaPFa+ktHivBwX/aeihyb8N1AeSfOHjNI7vPz
 Qx8/28DQSRj2W1R80PCIA0M1KALi/WpaC0TYRxDLP0InDmtihMvNBB7FwhFuyVIGSNQqAklCl6N
 NbAyhhyO97xWN1tqGQdqnM6oXifzMA==
X-Authority-Analysis: v=2.4 cv=SfD6t/Ru c=1 sm=1 tr=0 ts=68eecbe1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=VdtQghO5X5uSFlG9jygA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 0vJrrlYi99gL5t9wQwORta5bCXHwp0yM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130022
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

On Tue, Oct 14, 2025 at 07:54:56PM +0800, Xiangxu Yin via B4 Relay wrote:
> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> 
> Add DP connector node and configure MDSS DisplayPort controller for
> QCS615 Ride platform. Include lane mapping and PHY supply settings

The "lane mapping" no longer applies. LGTM otherwise.

> to support DP output.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 

-- 
With best wishes
Dmitry
