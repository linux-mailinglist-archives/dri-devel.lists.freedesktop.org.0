Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27943C18286
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 04:19:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13CE810E6F0;
	Wed, 29 Oct 2025 03:19:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XbjZI9NM";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ffKiOWR5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A303710E6ED
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 03:19:50 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59SJr5Lg2511527
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 03:19:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=tfuOdHYPuBbRAFi2S3af3q0y
 P5GTo3VvO9e3ehC0+QY=; b=XbjZI9NMTCuvP0ON7ljI95ue2bFZ+B/HKFusXoAu
 qEkt+u/kwHbY8Nxkjzf2PRQWD1DuCUHonMVw5yzIiNiZmhfXP4vdbOAhjk1YiMIG
 zNTDt2EbSh50D7j1fYqcSFrRq98ideoANTkSqSxFp/e3b7oLxSNmJRvJoybnpeP3
 pCviYwjRMLsogwg3RyK2Z76CnbIfWBKVjjMGrg65qXMQ3taif6HPBANHFNWHdaYR
 Lte9dBJUcmzMsOr4ZVRduSwJ5/qxgCc7ppEgZvLXcyOs/NvaPjSStmiVG+lSsaAH
 SaAVA+G4HDXUtIRRgn2eN0Uu81mc0iArsSZc3/5EEFP1oQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34cd909b-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 03:19:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8a65ae81248so659514685a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 20:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761707989; x=1762312789;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tfuOdHYPuBbRAFi2S3af3q0yP5GTo3VvO9e3ehC0+QY=;
 b=ffKiOWR5v6SUi/EoKAF5CNLoVCe/KXhP/Mta211L9Cj4rfm5zSLU2bBd1kelD9VIxw
 aSrfR7qDzYZVH6AZdNFw7PKRjStqrM/b/urr0YYH5YZQ8oMg4D+QejqjKU/pvY4RGlfw
 4H6TZjIM9L5PHdwY7nyQ3i5r+5R4XBmteQglBzUZlDfVD+9yotBtHzchCySoZCwH2/pm
 6wqvhsJMif/Np7g+/qqLuVvDmSFoEKH8lFhHFjtYbeEiFyGDI0Ee15fI/ECudtaWiiY7
 mSqFZZPZBPHUZVdiCDDsT/GWHMX6Y4StkLZJGDOZIhWSxdsJq8Vdhp17B9NXWAgtUeLZ
 P36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761707989; x=1762312789;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tfuOdHYPuBbRAFi2S3af3q0yP5GTo3VvO9e3ehC0+QY=;
 b=B48yAfnMwsvfpNnGwK+UsyeO5HxCOyP2o47/rnvpXwNNs58GzTX/4h3Nh33T0o4GuC
 INDR653g0qb3EZDGrDHvFFvkLw/ZsfmmlEs2T+8GdHVX2DZWqUOkqOpjk1L3XNCMon0C
 NchLDrcXP5cGfD04h3OqH+YWF0abN6fEKqXh/AtLQ9vZtWrb+wQEEo28rP8rrW6yfu15
 /P/dpnyBPTjjxzDmyJYd8ut4KK4Qu5cQtUOxlYJXByodNanjFYzxp3Y4pzzjly1G5Dfe
 TgNoJqEPJRkh3NIwNjfStjweWpE97D+TCRlhDWc1xkOSluubxBZs0jo8jpMm2Y8qGZEE
 flgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1hnhEE0mH9nL2FsXVDsLiAuZkYgjwQpEJCeIHFZcKVvEQr8FE7yx/RYt7rJkPpWuCKll35+oa0NQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOBuLrbJzMZ66mIgM0qVYWSLNUnBMQOoU6BXlljlPR0vUHxcg3
 t6HmcuKvJVtEt9vJYnwZSlbmrGh5Ko2QGfeSbj/26avWqnaA67w6g1XrT8ktX3iEUiqlbEJqYrC
 YvAdcU/v0ZcD75YjtBwM1mo9YppPH0SQpTtUfIjLufjHtJyRWiHpShIxHqDt9lZVA4Rc8UYQ=
X-Gm-Gg: ASbGncu147g6JpRI7+5vr8ds9tx/JRNc8bDbxM2PGZQyOQ6s8DHReOb/ZiajP+JipRs
 /g7xdHtZegXIJ/nLd+O+6sGEz7a6qatKg174oEy4KVX1ld3yTtpZtkn7HK9dDpgrHBP2uhqGLix
 Ni0hDLcXPgnP4v2zBoRuG5FSsWbHAuRYPYCi1e9A1RkdoGoodG4gIrdsY+EpZm94ZCx1a8axuD2
 zQfoHKCPoAJ9GTGAG6+GpuPUm5N99EdPEG2OVK3kKADoCVdH9sRVB38CWKk0vPPkOrdWXD5g0CE
 rqWXYupp6pFgZaU+IklO0u3+CJ04zI9mTAua4i/nZcPJWaqjAM0FXbWFk6f5eub10hjATCJwKPo
 dEw1XJk6SK3eRR3bFiVJeEMoAhTuYeCsdYxpssWNApfia8pRpTfAEggSFQMv2yvjl
X-Received: by 2002:a05:620a:c47:b0:8a6:999f:df02 with SMTP id
 af79cd13be357-8a8ea5951e0mr221840785a.0.1761707988862; 
 Tue, 28 Oct 2025 20:19:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPR1bnU91lCiITa3K23J2bvukY1QCUyEKr+SagA9SP4DVjvaGRLpGPgwIenuTxiRjw0NjoWg==
X-Received: by 2002:a05:620a:c47:b0:8a6:999f:df02 with SMTP id
 af79cd13be357-8a8ea5951e0mr221839085a.0.1761707988386; 
 Tue, 28 Oct 2025 20:19:48 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-89f243142b5sm979056185a.8.2025.10.28.20.19.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 20:19:47 -0700 (PDT)
Date: Wed, 29 Oct 2025 11:19:36 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 robin.clark@oss.qualcomm.com, lumag@kernel.org,
 abhinav.kumar@linux.dev, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 01/12] drm/msm/dsi/phy: Add support for Kaanapali
Message-ID: <aQGHyN19/a/tl0BH@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023075401.1148-2-yuanjie.yang@oss.qualcomm.com>
 <omlhiywjr46ik6bj2aiutgcf4aifen4vsvtlut7b44ayu4g4vl@zn4u3zkf6cqx>
 <ad906eb5-c08f-4b66-9e37-aaba99889ad4@oss.qualcomm.com>
 <aPryORKIuSwtXpon@yuanjiey.ap.qualcomm.com>
 <einog245dsbqtx3by2cojyzmyctk2fffpwndwoe24puwqq4fta@cu6iiidxqgr4>
 <0291d0f2-483f-48d8-8c75-f1bbcd1ab18f@oss.qualcomm.com>
 <ehgdx7av3jewowkvtsqrbnsphgxm5hryl6n5otnapi4xneldze@gcwvpssisv2x>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ehgdx7av3jewowkvtsqrbnsphgxm5hryl6n5otnapi4xneldze@gcwvpssisv2x>
X-Proofpoint-ORIG-GUID: 61aX2ZnoMhbm7Ao4TXrC01seBvEmzbrE
X-Proofpoint-GUID: 61aX2ZnoMhbm7Ao4TXrC01seBvEmzbrE
X-Authority-Analysis: v=2.4 cv=avi/yCZV c=1 sm=1 tr=0 ts=690187d5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=dRtYTIcgi1dzbadgoRkA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDAyNCBTYWx0ZWRfX+O7gAgdhZtT6
 5V9VJal7R1qKVX6WTCUqoT5ZIIDas6pQvpIeus/Y262CilPW1KO5UirEAFG/ms6vsTke1/niEM9
 dRpevTGzgTKSwGbGvs8uxhdSp56I2+Cv+bbVVl/8/fIQwuIDPuVq+HnDc5X8sk8K1zvGHHps0DW
 XLRDCg3e2B4CpcjoGDx2yYsK5WQ1c4D7GF9XZolotmub4gkWY8jer9Ynsj5evzenbdHvEcm63fi
 jL8dhfoFK09Sde+ozJjW6tUZ0/KZclpkZDdv5B6PLileimbSBniwuMglaMWpdxVYld/4pLxbac6
 XY1FH83ja3Cpl1zaZqHyVDQFAjL+gEeHnNk8EHEI/51tGRfOUG1D/12RxqsPSwPCK4cAlSJ5xvE
 ONC083QEv5K0DbqSflzfGw3FOlzb/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510290024
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

On Mon, Oct 27, 2025 at 03:29:40PM +0200, Dmitry Baryshkov wrote:
> On Mon, Oct 27, 2025 at 02:20:26PM +0100, Konrad Dybcio wrote:
> > On 10/27/25 2:14 PM, Dmitry Baryshkov wrote:
> > > On Fri, Oct 24, 2025 at 11:27:53AM +0800, yuanjiey wrote:
> > >> On Thu, Oct 23, 2025 at 02:02:45PM +0200, Konrad Dybcio wrote:
> > >>> On 10/23/25 1:48 PM, Dmitry Baryshkov wrote:
> > >>>> On Thu, Oct 23, 2025 at 03:53:50PM +0800, yuanjie yang wrote:
> > >>>>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > >>>>>
> > >>>>> Add DSI PHY support for the Kaanapali platform.
> > >>>>>
> > >>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > >>>>> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > >>>>> ---
> > >>>
> > >>> [...]
> > >>>
> > >>>>> +	.io_start = { 0x9ac1000, 0xae97000 },
> > >>>>
> > >>>> These two addresses are very strange. Would you care to explain? Other
> > >>>> than that there is no difference from SM8750 entry.
> > >>>
> > >>> They're correct.
> > >>> Although they correspond to DSI_0 and DSI_2..
> > >>>
> > >>> Yuanjie, none of the DSI patches mention that v2.10.0 is packed with
> > >>> new features. Please provide some more context and how that impacts
> > >>> the hw description.
> > >>
> > >> Thanks for your reminder.
> > >>
> > >> Correct here:
> > >> io_start = { 0x9ac1000, 0x9ac4000 }  DSI_Phy0 DSI_phy1
> > >>
> > >> And v2.10.0 no clearly meaningful changes compared to v2.9.0.
> > >> just some register address change.
> > > 
> > > Addition of DSI2 is a meaningful change, which needs to be handled both
> > > in the core and in the DSI / DSI PHY drivers.
> > 
> > DSI2 was introduced in 8750 already, but it was done without any
> > fanfare..
> > 
> > I see a diagram that shows an XBAR with inputs from DSI0 and DSI2,
> > and an output to DSI0_PHY (same thing on kaanapali - meaning this
> > patch is potentially wrong and should ref DSI1_PHY instead?)
> 
Yes, I check ipcata Doc, I see DSI0\DSI0_PHY DSI1\DSI1_PHY DSI2\DSI2_PHY in Kaanapali, 
addition of DSI2\DSI2_PHY compared to SM8650.

look like I should add: config io_start = {DSI0_PHY, DSI1_PHY, DSI2_PHY},

Do you thinks this fix is OK?

Thanks,
Yuanjie

> Most likely.


> 
> -- 
> With best wishes
> Dmitry
