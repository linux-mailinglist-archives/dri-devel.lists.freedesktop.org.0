Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55112A84D05
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 21:30:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EBE210EA5B;
	Thu, 10 Apr 2025 19:30:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cj01MTYw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D7B610EA51
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 19:30:10 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AFwlvu018319
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 19:30:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=xmOqzP4u+pl/ZdWWXRUlQS2t
 mT+CqYg1/8FByj9msJk=; b=cj01MTYwnP3NPdggXBrPcXP1VnXQKb/vyNjuywjL
 wTMg//l2o72exuPycgQv4sOAPc7Khu45IALyEkqzFpia38QgoGYqqCR6sT7/RJUo
 gfaAEbD9o2uS4muFO49oqZGagCushbqlY8UIxzF0b5JcaLNJV/ebMwtsxZTxsj+1
 gos6JwTM27v83nRgTyr+cU5X5sIW6+jiR7X+pfRMSNOqYI1Fofy5y4nY+2a80z8d
 I6rPv+9gc4juB+lPs2PpsL9TrBMRa0kF2f9y5XXFuokLUMPqGGsuLpfejkz3LsSL
 hJ6+zNlGZhiaHG+9w7f48oZJFLrswxn/rlggoCtvZ+aU8A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twtb8856-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 19:30:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c5c82c6d72so216452685a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 12:30:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744313408; x=1744918208;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xmOqzP4u+pl/ZdWWXRUlQS2tmT+CqYg1/8FByj9msJk=;
 b=lOSnFwv3UOJWiBDpsgH5QqRp6rFDZTFHNhWzJ72s88agRvDSvDT8zzA7HfO1XWTnsj
 sauoroVQbwkDA7Gk77JHjg4LF8yieFUYZ+opUgeamWO9voOK3WfdQqn2/Ur10A6l7grE
 UdkDcJzjFue+8B38gsCBbtgX2KoWjC5bMFZ3WywrceAwnvDEB6ohGMB/5AkdIUEbEbCd
 rOwvQUPxK/NhP6SqXoFbxsURCBETjPCsvyb/Dws1RpEMDzYedQs3dIp9x7CTE+AXtDcM
 p6lSKC0gq6HDf5xklv2VU9C9KOzTln+pIoVhzWG/0bN32G0R7Z5qkrebEtmLTObTH8X7
 c5bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3+I8HhP559QJ6Z4G/d/1U15aqvYJXbvfiHAQFxBaGhkyBbPwzLabjmRW3BFrHN32ZLWbnMPVSzZ4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YznDdDEylx3MvWQTIxhzZcCsDnvwP1eKJcBU6GejgoDpPO4qztK
 F/KLLTap0rpuomcOgiMQJfJCJx5thCynSoWWtVfMRggghRASKiMTLe2U6x4psydazkwmngHCIlr
 M9JRltRaQx6rAtYn8wu6XglOHjpngBAeu465Jc3YEF4bAIup+gNmutDLmA3zq6694NQs=
X-Gm-Gg: ASbGncsHBPL80iPji2EKASKxYsQXNWzdOVZfp1Av3kDZhHVfeFlhlyub+OtePV5CcEc
 91QNfPEJhi6HcwxWc4Z3+YE8qIzOT5jfmrq7NQxPgqoXYOLNJryo4NSLyHA7GquqQxFsTKJwI2m
 SBAVzh98uRD4TefMk4t8VMd6PtSSwX4SToySVC5sX0di6r+nyXNKhBkVu7+7bqesqXBhQPh7tE7
 8vWAsA44Qzwb6HsW1dNu/uOrkPQ5ee2opV0aEBQ3RFJpTyd3gH1g+59LCSI/uM+oaqGvd4EIiMp
 u2wJNfPczwmCUNX42PiaWH2zMCtFkA5Zd5e6YLuiw9MUbXIy31tBEheDBcIVcaUSnTfBM3FP4VE
 =
X-Received: by 2002:a05:620a:248c:b0:7c5:4348:183e with SMTP id
 af79cd13be357-7c7af0d400amr26913985a.20.1744313408110; 
 Thu, 10 Apr 2025 12:30:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEy0Yv3SFaPPo6VgdBieIMea7BQKaDgcTkqEdmLGwfF3jij9ifdIj6Lgirjn6F8+UXSuYGWow==
X-Received: by 2002:a05:620a:248c:b0:7c5:4348:183e with SMTP id
 af79cd13be357-7c7af0d400amr26909285a.20.1744313407804; 
 Thu, 10 Apr 2025 12:30:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54d3d239f48sm228966e87.97.2025.04.10.12.30.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Apr 2025 12:30:06 -0700 (PDT)
Date: Thu, 10 Apr 2025 22:30:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@intel.com>, Imre Deak <imre.deak@intel.com>,
 Lyude Paul <lyude@redhat.com>, Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 Andy Yan <andy.yan@rock-chips.com>, Abel Vesa <abel.vesa@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/display: dp: delete some dead code
Message-ID: <qdzrybtfgfhrlru7xhv4a3nejnt2owhexpkpbhcxtojjjvyaz3@45vejwh5ffjl>
References: <de03fbc6-ca8d-4d3d-b80f-d1235b2b346f@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de03fbc6-ca8d-4d3d-b80f-d1235b2b346f@stanley.mountain>
X-Proofpoint-GUID: Aa9W3q4nmkEJYUJ0ORG8V-eMfp3UQuKF
X-Authority-Analysis: v=2.4 cv=LLlmQIW9 c=1 sm=1 tr=0 ts=67f81c41 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=fLjeHktqZpDZhfEeQlAA:9
 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Aa9W3q4nmkEJYUJ0ORG8V-eMfp3UQuKF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=898 malwarescore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100141
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

On Thu, Apr 10, 2025 at 07:25:14PM +0300, Dan Carpenter wrote:
> We re-worked this code a bit in commit af67978ee37e ("drm/display: dp:
> use new DCPD access helpers") but there was a little bit of stray
> dead code left over.  Clean it up.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)


Fixes: af67978ee37e ("drm/display: dp: use new DCPD access helpers")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
