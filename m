Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C856AE21D9
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 20:14:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF94710EBAE;
	Fri, 20 Jun 2025 18:14:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VgQXY5r1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B808210E0BF
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 18:14:03 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KGVagI031102
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 18:14:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PEdfT0ej6rioFoBNjA/itEoF2Clr7rfXta6Q0FyrT4M=; b=VgQXY5r1aAjjEPfH
 WVWWFdEEHuNKYDeUeNXocsal8slANzB9p4RiMYK6hAcaM1Fkh1j92aREBMTfX5xM
 7pPCe0wqcxxYUigGDMYyQSN5jRAoYa5ldGVIf/vDnyzHV9N1Q+jA5DGoz0xlocSF
 +06YExKrKhp8TDwqpWXWC1eWdqQjlBdYKvIwi/38g+V0NsJqBGqn4oseIAos6xuS
 FwOvPpumkPZeV53BK/PJlyUurCoZdTmNw5mSP+5ze6rnJk21+mlWiIyrowSJ20Cv
 j8O8OdLtt+uXxEzGsSMbryAsp+Pkpf07BQ3rlee7swU3wSFxk9AZ0ph6L982cxH3
 jg97iQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47db82g8r4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 18:14:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7d400a4d4f2so92900485a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 11:14:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750443242; x=1751048042;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PEdfT0ej6rioFoBNjA/itEoF2Clr7rfXta6Q0FyrT4M=;
 b=wo4W99hepx3vNEIONGbZ6KV0wU1XCrsjUXN5CmBKh4JLW4uTfDTWphWTo22PnUP32w
 i/T0LuLtHGlwN+G3KON1t10Pc9KMeakd8jeJLKQCNgLadZmb6k89bEjElIqM2ihVkMPL
 UzZkcD7Q2vwaeCs6uXYdGaDxUypRMf4ty6ZuGbPhDSfpMbXibmsv79TgqHqiU6ARr/Kw
 shVY6hwILxMNodAFqN/fE8vjOVM2cK6DYzGQHhwS67G7KTTrwLG89N2gTjBCi3jzMgFW
 hqDXEen7idyirLfB7J7tZZVmQeJ94eo2D/hUCbSLFb08fETkMsPIrLwK5vzhSjjd6M1d
 B1WA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXF1ZXE9SpfSWoMJmhxIDNNBumCTb2DW0hfqt3XsgzDHrodkPiOHktHUEpCHgeFLwhOwmz39LVp0tk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwuTPdJzx1DZE69pMd1aI5Y3pmA8iKVARHKZrv46llipHZ+0p7k
 KJFhnmSBuxfq2s0/nIjPTKkEA/2zGbt8dy6DVv0OGNhWZLDtwzjRGP8H2kyR/1qCh1+1C000Dub
 Z99LMhJVjrfUFhmNHdEO+MdXJLL48rc71A3vD2p4Sf+5ddbfFMTYz9hWELgXMBs9uBSOkeB0=
X-Gm-Gg: ASbGncttSNxGpKakQAeJi7o0rEQClBqvxZSC/aGesfJp4Y6LamjwwNkA3GI4iPKvMAt
 LX+Uy/Rgi4cULfsvOGLD+TDpQWLU0K2Gk8E7u+jiPPI5oNhPqCa4Ie+A6osUXj5R+eqot8QF/0B
 pL+3+oyPBxq64fyMijbcQZx+u/fTAb9CYuiBY8DxoUePqoh0IGdwwOkCLNZXrpIAH490kBif/u6
 4LJZChADXTfWJUFBf8gC/SuFgvAINdD8AtxYeE/v5WyzQAnJ6SCFhnOX/eJo8yI05VzvLkOxP6M
 BZAmWMxdB2d5ezNKSPsm+z/F967oAg3OG1VuX/lo63tvYDVYfPCO/Xoo/+nQ0w/1kjRmYT5MzdA
 51SeLr1g/WMR90473gQDuQ9xWViTpU1egiCU=
X-Received: by 2002:a05:620a:198d:b0:7ce:d352:668f with SMTP id
 af79cd13be357-7d3f993c19fmr609665785a.47.1750443242059; 
 Fri, 20 Jun 2025 11:14:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEa1scLzEMTbwQtGcAzKMum3byZVIF6ahXfUCGXpgHDAwkBpTju7ydihEn+tbhWAI6tCDqAlg==
X-Received: by 2002:a05:620a:198d:b0:7ce:d352:668f with SMTP id
 af79cd13be357-7d3f993c19fmr609661385a.47.1750443241575; 
 Fri, 20 Jun 2025 11:14:01 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553e4144306sm363384e87.18.2025.06.20.11.13.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jun 2025 11:13:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paloma Arellano <quic_parellan@quicinc.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Douglas Anderson <dianders@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v6 00/11] drm/msm/dp: perform misc cleanups
Date: Fri, 20 Jun 2025 21:13:52 +0300
Message-Id: <175044313809.2014621.2079971726903686227.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250518-fd-dp-audio-fixup-v6-0-2f0ec3ec000d@oss.qualcomm.com>
References: <20250518-fd-dp-audio-fixup-v6-0-2f0ec3ec000d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 1HLVf92UIN1hmAgP_YFi0QVBn12CdsAt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEyNyBTYWx0ZWRfX4WzU3MZZihno
 CUZCVV2Z86p5ixBmFyIseB2By/q1SSpnHxG43WHmx8xeA1Osvh9LJaJaMTq6hedixU7JqDDdUQj
 /OHdhZhINcERgaeP0yjjHcMgJCbgq/GxjInqczyWc+/TcDTYonWV+S/L/23GV1ZtuabmelGtV8k
 svGNmrzhrVNKrDerRUdhD5xMfwtmw42Q+A9XRBI9dga3EA/9qEYlfLe6o/0jXKrYtyQJGJ8E4RU
 tyL61xiALQayGWWZBKHijIGjjYC7Y7e2OKiv57fizehXgoqRUtJVwm2AaSbd4FVJ/t8Zeda4v9J
 POSSKt71HroGJfAhCrQGzl2qkMnQVsQzyF6THqw4r9g2ZqCzNpy5a/JChfcGFQkxM5MJfmj08NP
 V2DYwNx91N/hWeNVc7qczkq2uvZHNSey0qvsAKqsotBN2DJKYaQEBRfSvvPgYHUWwstmZIbV
X-Authority-Analysis: v=2.4 cv=RaOQC0tv c=1 sm=1 tr=0 ts=6855a4ea cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=e5mUnYsNAAAA:8 a=DVdRDH6YNUG9iR60fqEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: 1HLVf92UIN1hmAgP_YFi0QVBn12CdsAt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_07,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=595 clxscore=1015 priorityscore=1501
 phishscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200127
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


On Sun, 18 May 2025 14:21:33 +0300, Dmitry Baryshkov wrote:
> Rework most of the register programming functions to be local to the
> calling module rather than accessing everything through huge dp_catalog
> monster.
> 
> 

Applied, thanks!

[01/11] drm/msm/dp: split MMSS_DP_DSC_DTO register write to a separate function
        https://gitlab.freedesktop.org/lumag/msm/-/commit/4ded343a67f0
[02/11] drm/msm/dp: read hw revision only once
        https://gitlab.freedesktop.org/lumag/msm/-/commit/f12a3d46e2f0
[03/11] drm/msm/dp: pull I/O data out of msm_dp_catalog_private()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/df1a7ecda2ab
[04/11] drm/msm/dp: move I/O functions to global header
        https://gitlab.freedesktop.org/lumag/msm/-/commit/e7957db17d91
[05/11] drm/msm/dp: move/inline AUX register functions
        https://gitlab.freedesktop.org/lumag/msm/-/commit/da5c957bdcb4
[06/11] drm/msm/dp: move/inline panel related functions
        https://gitlab.freedesktop.org/lumag/msm/-/commit/5b2ef0755ce6
[07/11] drm/msm/dp: move/inline audio related functions
        https://gitlab.freedesktop.org/lumag/msm/-/commit/1324e395929c
[08/11] drm/msm/dp: move/inline ctrl register functions
        https://gitlab.freedesktop.org/lumag/msm/-/commit/8583a655f2c2
[09/11] drm/msm/dp: move more AUX functions to dp_aux.c
        https://gitlab.freedesktop.org/lumag/msm/-/commit/078a56d3ee82
[10/11] drm/msm/dp: move interrupt handling to dp_ctrl
        https://gitlab.freedesktop.org/lumag/msm/-/commit/609aa04d4f3c
[11/11] drm/msm/dp: drop the msm_dp_catalog module
        https://gitlab.freedesktop.org/lumag/msm/-/commit/9d47325ee063

Best regards,
-- 
With best wishes
Dmitry

