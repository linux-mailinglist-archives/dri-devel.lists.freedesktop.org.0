Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2849CB20562
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 12:32:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80D9410E42D;
	Mon, 11 Aug 2025 10:32:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IA02Yh3N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE6D710E422
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:32:26 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dCr4007636
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:32:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=WlaZxjCGfsTi93SkuSR2T8Yq
 07Bi9pE1AjxRp5EAaPI=; b=IA02Yh3NboUJA0n3jJF6ku+QfGN0XT8g2rXZFYHy
 VCmVeGkQGdA0BITjpCxL1edsddPuQe5QTWsNLXvBQw7tad1h0hBtKRwE93PqghzA
 dhJUCdZsCZXqwj3zwbGr0g8/Ds1hKLCdjOBQNnflluOO1h+t34NmbXZzwwCXD43M
 ppy8wv9uyj/xeD8I+mcF4GXFvhh0zHrppeje6qljyf9RqJvDO/7dPwZ8/7NHxE05
 XzYTP7uYT5c00PkSBMt0AnQmxCVD6AHOAUDo+hRzv1lgQgsvArT4p6OmXhIEsaI/
 79LVIGNGDTTW64bNBp7uFHK8IBLz1Qw6dvDKJ3CXsKsEcA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dv1fm7eu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:32:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b08b271095so116907001cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 03:32:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754908345; x=1755513145;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WlaZxjCGfsTi93SkuSR2T8Yq07Bi9pE1AjxRp5EAaPI=;
 b=xLQHmCcpck78gdvmPBzHf2ebLuqII+Ub9+DHqgVLXsrWhMPU0riZ0x8tsiHms9oLWY
 rQW4ZY1W8FrdL9WrufYopWmeqza3ynHKAp8CsYTKF9BpY1SIRoBAOlEACd4/yiaCm7F3
 zVjEU2cgZ/0uumB0Dbu97184YxBgAyCXnZQm1SAcGUygXikh73//CMzVVsxJGo61aWRI
 Z27xr5oj2ojPlTh4KOPISKvzMdhrxqcub1HJtNkz5mfEEkNfJYMuNsy5Pt3y3Qrw2uLN
 V7ypDhNNfEKNqSQiaqAzj4RFf1W2cSIJbbcGGEOc9zhGje+QXoDui0LoIlZArBGwbol1
 AdUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWy6I08vAm1Amt70THgiFaHbO0LqRBcmk+VswEUA0uZPZh6IGThMmrt4/TE+nRzkUBjhwDoUUUW++4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyMhjHOT5zDBqMBhYmDEc8kSR/sBoJfAzYlB1Ti8PlY6+6z6GSk
 U5T3u/b5Tin0b0IibthrmAW8BO9LbZf7Rp9szGj8NHC20EQUlvQd/TTlJHtTBElxbzl20C1uCe4
 zCNdN3FRVUoKzjFeJZ84R8MKDTZ/w11xkKSi4VPy7YeSUtEH2c6q+CdLyIAZ3rmbTFOHkeYo=
X-Gm-Gg: ASbGncsLZHCMp8SAKYhPz3/7h1xBxyZR/U3fAn4+ES6zzyGqBY/4WF7UwmTkF22ELUP
 CaSm9ZyaCRF1kSR3OoCKOePWcQJPCUa2xm4r7j7FU+LF/A9A41NjYC5DNtILkDUMpCuxcKwNDbP
 3yqUXZOf0813BgzZB8IxGSMHZJ2AoxBEDR4PVRecnfeHmhkuNOobN6M/AIQSqo6V+Hfri/6wTPx
 y/tEd4AGCtApbJGoIJVzgE+HpTg6TIby6hTpKN917U1SIvEeFLts1zKYZeaTGpcE3bYast9pOuJ
 PN9gEhxUUmpNd2Y4WuL/IQKGeuRHJQHsTfDuTn0m+gL0T9uo7ItVKEUu++L/fYtNThDZxRr+OUJ
 d4dNKy2WT0wTnO8ltv4CUIckELqPkKL9XVcn60BKsdbT8wC5PHi41
X-Received: by 2002:ac8:5850:0:b0:4b0:8633:f961 with SMTP id
 d75a77b69052e-4b0aebe7865mr200416351cf.0.1754908345035; 
 Mon, 11 Aug 2025 03:32:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGI8sa5r1o7gt5+wFXRCE2Q7Do41HTXVXbxsWRBmDIwxhwtGo1QPiM9a8ztAkxfkOqvDVAq1A==
X-Received: by 2002:ac8:5850:0:b0:4b0:8633:f961 with SMTP id
 d75a77b69052e-4b0aebe7865mr200415961cf.0.1754908344591; 
 Mon, 11 Aug 2025 03:32:24 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b8898c158sm4264371e87.14.2025.08.11.03.32.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 03:32:23 -0700 (PDT)
Date: Mon, 11 Aug 2025 13:32:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Brian Masney <bmasney@redhat.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/7] drm/msm/dsi/phy: convert from clk round_rate() to
 determine_rate()
Message-ID: <oukh4eoh3kwyzqo5shujprxsizssbs2gckaa3fr54tqu5qmqkc@6nbvqf4rc5av>
References: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
 <d00689fb-8074-48df-ae95-bcdf5e756111@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d00689fb-8074-48df-ae95-bcdf5e756111@oss.qualcomm.com>
X-Proofpoint-GUID: zZSzuzulBmdBAlcSTMOvvVQU7AZqah2g
X-Authority-Analysis: v=2.4 cv=cLTgskeN c=1 sm=1 tr=0 ts=6899c6ba cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=9wg58hZYqdY_vEwv324A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAwMyBTYWx0ZWRfXy6pkv6Z8B5mf
 FKYtKFdZlIquaX3t7pTIlqPQOxcUOs4rfqqqnOk2bt837Gjf2zWLhISkrgeFeZWwHmmReHOgXDg
 +2qMVWqnOTJcvrI7ODdWudSoa5xNdSWTWfI4KYGjCCBPqYj+fLMk3qRmmMEJbCEY38V3sPdUCJt
 EG2n3VFEOzcMvymhwgXWnlTPYcnEXcGy5gNrafuY3HMFRk0n4XGeBcv53QCmfJbVdg/Peb7FRhm
 cGR9YTPsay1jQG3NKMSCITEdO/lFnmDWFn+p31q/SAc9HqtIyHbx/+ULTrhI++o21KW/1uQgJZ+
 tYCVZUcPGgsz79RhG38BOcu62piZ4HL63ib3zjbuP+Ax3qbbhlxUG4RDWWiyq7y2sRUMsAs+Nss
 XyIq3U+r
X-Proofpoint-ORIG-GUID: zZSzuzulBmdBAlcSTMOvvVQU7AZqah2g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090003
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

On Mon, Aug 11, 2025 at 11:02:46AM +0200, Konrad Dybcio wrote:
> On 8/11/25 12:57 AM, Brian Masney wrote:
> > The round_rate() clk ops is deprecated in the clk framework in favor
> > of the determine_rate() clk ops, so let's go ahead and convert the
> > drivers in the drm/msm/dsi/phy subsystem using the Coccinelle semantic
> > patch posted below. I did a few minor cosmetic cleanups of the code in a
> > few cases.
> 
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Unfortunately pw-fdo doesn't track series replies. Could you please r-b
patches individually (sorry for the troubles).

-- 
With best wishes
Dmitry
