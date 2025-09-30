Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A21FBABB8A
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 09:03:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 906BB10E4FE;
	Tue, 30 Sep 2025 07:03:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OOut8Vw5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C453610E4FE
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 07:03:00 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4HPgS009323
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 07:03:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ZILBarotSZWQdM56LLJz3+w/
 7JscPhGYyLjRbrYgdnY=; b=OOut8Vw5yYRY4OGq48yBkocOurdwvVdz2F1lCt6o
 k2gP3wjxwc5Aysiuye2xQK2pZM1ndn2A08UC2m1ielc6IQUggOShqqOGyiZXadlm
 vhpKm7dbSBDU+VPSb/YE0XhgUHTUEqZLq+3yacne2pSC//8fyBfWbXLFqhlG7/p+
 3BuJ7W3TU6nEUBTYIdkpFLp77cyYQwCxCvZnvHAQTNtd97eHYTD9YylFAH8sBFA8
 lje4KKku7gcJcPdVJwW/6MMd9qL14cPT+Q0IGW5rpts3lhEI4sz1qEwVj0bYYlKV
 RKee9WgC1CRvh3/JcmNlaoeiMIOrdP0vRyclmTH5YulaFg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e977qrbw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 07:03:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4e1015c48c8so37273131cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 00:03:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759215779; x=1759820579;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZILBarotSZWQdM56LLJz3+w/7JscPhGYyLjRbrYgdnY=;
 b=UusB+FYcghWDXo+PqOuZTbHfgXYm2woDwEa8pdYMa9y8WNzK7ZX8nDM6sriAKL99Fk
 kX6T0XGhNQ/4cZH7ETSDdfSh9fcd4fy0pePBdZLu9QVx/QJedXsIUhgt83yii+2pZrCf
 TDtP8GL4Crs47cP7UBIshHDgMgIVdQpSyY5QqxbYilGZ/p9VJNYrZ+HJuiYconxbmSby
 zJWlIp6Yaya4ohFk5NzkbydIQUWHvGApU70knX5Iw5VXUAPMNm6hzD5LgrkLGONmml7P
 2bW2dEoVQPpOlzw5tTt8Yt13XvCqGdcAuJ8AYx5chTQJUfZ26O3Wbcv1/w+Mv/Tv4PIw
 N1Nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhOG70HrUnwVoNNQ95ckM+OKE5qdOaCMBoFHNiPy0VZjK+lCacbOliSI7bs5R6QQx252YZWsE9/Uw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyO4H5q89oN/HFmX0XdYrzSvk1ugiqQbo9De1bMOzkU3stdoND1
 StVQhTMve0ZVgDOe0P6iym579ak0VngXPxyInvlXiTx7vsX5lEqPynInqFae0GgXATVa5hnhlRj
 bCDyUjLezyC1jSbd1hO4gO0pv5lPug0tuVcmyLp1UZcNXjFOE/NO8tuL3TUYF/l0zaoy/PeE=
X-Gm-Gg: ASbGnctOQ5oYXfuiMJXzrag/w0XE+IhaBpEtSdelvS0NdV6FWumV2MqODE/la27uYcP
 ma+zcN4El9Ovo51lN7bFIkUOmxdj+0LlSE2V9eFjyuShGPCcaGq+/9/7KmkPAp4Xl+b6ayvnUhC
 9h5HRdd9KGledbdoSHjtBTKmwy8CvQfjsMbCmPZ9gZOd6PPJboWobVEjAAlbRweT0Q29c9V4Yg1
 ORhLpRpY7lsm1dK8bw/U1n1IKiVMgdtKQL/+SQ3ouWVWg7MSBenXYJs8DWXwrv25SRm/CBnVo2q
 57JPADzZCXpmoTlLtQhH2ZxNFYFoVN/gmxoG2YHxZnkPuNMh0lJRqyb7dj/aTMC8a8NeRhRtb8o
 LvdFU7Krvf1kfScEzMp7KToFbVCsIWgtHY1wyrh0Tc1viStuCggo//UzcmQ==
X-Received: by 2002:a05:622a:255:b0:4ab:6e3d:49b4 with SMTP id
 d75a77b69052e-4e27d7c1b65mr43578451cf.7.1759215778772; 
 Tue, 30 Sep 2025 00:02:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFA6lGjRTL6r8mC989qOKGIofS9wz03iYOMq+60qPx/pT9WrIKYNjXkEHiEux+C3IniYKpKBg==
X-Received: by 2002:a05:622a:255:b0:4ab:6e3d:49b4 with SMTP id
 d75a77b69052e-4e27d7c1b65mr43577931cf.7.1759215778195; 
 Tue, 30 Sep 2025 00:02:58 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5839329881dsm4325236e87.87.2025.09.30.00.02.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 00:02:57 -0700 (PDT)
Date: Tue, 30 Sep 2025 10:02:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH 01/17] soc: qcom: ubwc: Add config for Kaanapali
Message-ID: <yhcqj3beliary34msn6zbaig7j4krn32st37g4n3ey7oipswea@ckio3yjuwswo>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-1-73530b0700ed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-kaana-gpu-support-v1-1-73530b0700ed@oss.qualcomm.com>
X-Proofpoint-GUID: 5JxWsd2jPWe11NAmCgK2QGIzAuZ9mi2L
X-Proofpoint-ORIG-GUID: 5JxWsd2jPWe11NAmCgK2QGIzAuZ9mi2L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MyBTYWx0ZWRfX0c2xqk0VQYbY
 a8fYpjcf5TR8cxutWEGT9QTpvwoFkJu/usORXa/kmBMNTPp9s/YBZcOnxQ8vKfv7PhBkuT1mEQb
 c5X8GHpIjYQQjIhVMF3kMwogE7cz2nkNfvySkMMDjpsuaH/JMzGtrwwcsz+0eZ0wgMVdTGQBNnL
 N14WoFFTxym5aMdJDcnx/Pt5xrm7TKOmwyE/lMeHRejSPAziQna49TzcunbuDsVSchHJ+q/bSBh
 nwWk/5t37WZQ2t5hhfeCgnV0C+mCT2Uz23rHQFjONJjGiMVzAlXs4EcWCsUeCN4bjPJD0TJJHGU
 ln9cv2pFcfbkB2xl2/VskblllyV698mMNYfCodFxs2jG5HQ9JDza44a9Vh2UeptexFZ81WjS3Av
 dO9zkuyD9JU7zzb/U6rW3UK3gktFXg==
X-Authority-Analysis: v=2.4 cv=Sf36t/Ru c=1 sm=1 tr=0 ts=68db80a4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=_QbXVIGTKPyQLETMuiAA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270043
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

On Tue, Sep 30, 2025 at 11:18:06AM +0530, Akhil P Oommen wrote:
> Add the ubwc configuration for Kaanapali chipset. This chipset brings
> support for UBWC v6 version. The rest of the configurations remains
> as usual.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/ubwc_config.c | 11 +++++++++++
>  include/linux/soc/qcom/ubwc.h  |  1 +
>  2 files changed, 12 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
