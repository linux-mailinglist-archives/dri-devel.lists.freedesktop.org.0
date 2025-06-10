Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BA5AD45E0
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 00:25:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C78310E5E4;
	Tue, 10 Jun 2025 22:25:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eGoXBpPC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6705D10E5E4
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 22:25:07 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AIPqZP023657
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 22:25:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=XDHd4ci76N1m7artzB98ac4U
 VLxKbD1UASxKG9cjK+o=; b=eGoXBpPCA8IG4+slW/R1e4StfS4i34M8KB9e9FoQ
 Lv2L/3o+DBHu8wLEii9tu5eomqy3mpHA8gMYHkzplcM0cWMc5zye38Iuv3IW6Lp3
 A0+leM91Up9WgHkVgiDuXdR58QAInOJ+PqE0CRhsN0C+rnoSBq+PunorAt8ekmwd
 /lmsycRnNt36QCNcavTjn4fPo6C4u9YiW2lpOMbgKJh9f0cNSLelpRsFx6tYoLby
 gjNoeTqYa0g8IpHSybMKrlgEcx+GvE1Ea3EeI398mOiRefwfyi/JtsVMku78GXCI
 3N+JZgLoTBlREVwdNFIO7YopgO8rRsrihBZ2TjpAQSXU2A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474eqcjx2m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 22:25:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c790dc38b4so49662585a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 15:25:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749594305; x=1750199105;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XDHd4ci76N1m7artzB98ac4UVLxKbD1UASxKG9cjK+o=;
 b=qB6k9kWfRAZehW8P5kwwt5DnXmGTj1xedVFyp1bFdd1I7zKw9E5lYq+ZlZBFBFf/MM
 mV8DeInlYfX/4GZh6MsH5JGZU+x787VFNmfwnT1IsO/YfEbgea4xIbmh2g3arqDfnDGj
 0rxHZ1Ng2cVROHIu8hToNI1jSDl4CFeVT1kpBuKe28jKR+yF91bZkSsUj2GPcG9N5sS4
 3pxPf3MqrnId+J36rhSm7uaxX/Rpz0GFsMUoi+dyuB1yh+Wr6dGncK1jSm1HfK1Yl8kb
 HJJ1DE2TsMQDEWcS1wUvYHJ5wT+MXJ5AAa3wUZxfSz/jAC1or6F8BeLIfURBMP3yspQp
 TKKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXb+hDF/tu3Mwk/wL7hGJ24O/ZD3Y6qcaA0s6JmwBTUDEQWWHzEQJdb1TTqdH0MU3MyM6heBvr6NtA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPsJulR+GK0mYdiUv9F4sVxdwpjfTVsISjh6KFtTPeY1KlXWXr
 0SiqT4IfyIm1fk8hKvEpQSYN7PreMgCjaNZ9T5cu1d9GKaLuX7Db30Qa8Czjl98ribpLyZssAnl
 U5WRWvnxmuXGQmkf5cSXhD0UHyF47gyqexmjVmSgLgP7TxX00gIHmvxPoURNEFMSjV9rspSM=
X-Gm-Gg: ASbGncvVzljFv/i6ck0LN8qo+d4+weeQ97n6TBh03+4wGUBR43IV0wC3eXqVp5sG1bH
 Wt1V3DNI31yEFfPaoGcTTUQdRte1aHBNmZw31zFx79DsDk3RGUYFldVJD7+ZNM1TTdf1eHcMcid
 W8kQNQbwL7jVInFthG4edWd62/KgqzFyXYc0TnSA4yZbCpSkPyK+BVvtKMdgXUTC+hqE1BcpJ00
 lPv3SSQMzqSdTETkXTloOoXrlx7Xx4oSxSeoQcwNIRSpeGk6p2ANvakhCG0bKtpopqp2mxQ/kd2
 Ov+RBakId2lRcgs9wt6EJJ8aqw6MA2OalrpD31hFmhpwJdWydjmPb2LwxMsG34W/CbhYth33soj
 /2mPeN5H/V0j/sPCH8OI5dlgZky1n4o6voRQ=
X-Received: by 2002:a05:620a:3184:b0:7ce:ea9d:5967 with SMTP id
 af79cd13be357-7d3a888cc40mr175308985a.15.1749594305566; 
 Tue, 10 Jun 2025 15:25:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEvri0NokR0cixmKJM7ugmHZgyYf1QPIBroXgD4LM3M5FEjj8mAWnMIjgTZswFHUeWxkQZCg==
X-Received: by 2002:a05:620a:3184:b0:7ce:ea9d:5967 with SMTP id
 af79cd13be357-7d3a888cc40mr175303985a.15.1749594305169; 
 Tue, 10 Jun 2025 15:25:05 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32ae1ccdd53sm15739121fa.88.2025.06.10.15.25.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 15:25:03 -0700 (PDT)
Date: Wed, 11 Jun 2025 01:25:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Abel Vesa <abel.vesa@linaro.org>, Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v6 11/17] drm/msm/dsi: Add support for SM8750
Message-ID: <shj5i5bjauxfuynrdaw4dysx4ypfr5a4tyhjsweroemt4wcavl@anxzkf23onlm>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
 <20250610-b4-sm8750-display-v6-11-ee633e3ddbff@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610-b4-sm8750-display-v6-11-ee633e3ddbff@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDE4NSBTYWx0ZWRfX4ZLYJxDpfHrJ
 rgHjv3hfhBPPPLe9em/vDer4UMOXcdUamh0SCaD7dU7HRHtV0gIgT8RIUbqmK8zshFC7gjXt9a8
 wc2T1PCu9oUa7h5ArmVt9c7Tfenvh1OEHpVOubG8hsBMrNbI/uO8uOmGpKGSiUcrxLO4d3TUt12
 /dhB5HFS98MHJUxVABtX8rvFxl5HGwUh+flIxNdwtquvoRCUboxKdGhFGQ0b4mecWNEkDDHOTyt
 8V20B/pta/dJegKO0Y1GgiVIz+TOSFsKkrZAT6YsF03w6lUJG07eocfp1atnHF70a75DpMtA3cG
 cw+agPSG2hiU6usBCTNjMBm3TIg7myGO00M9P9hMovbFf/6gFHKkNNZ7gB9kjNdrWFblfbGFkkt
 YrqjKkBybj0T1aZgKdHltLINkiUpMwifOMFdX5cm39bIrPD8u1cHKMghE3QVixQAlyPI3GOu
X-Authority-Analysis: v=2.4 cv=Q7TS452a c=1 sm=1 tr=0 ts=6848b0c2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Fe6Hossnl1h87qNRHPAA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: SXoPBEwZV1-q0alkLH8XIH_y-PWWF2pL
X-Proofpoint-ORIG-GUID: SXoPBEwZV1-q0alkLH8XIH_y-PWWF2pL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_10,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=820
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100185
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

On Tue, Jun 10, 2025 at 04:05:49PM +0200, Krzysztof Kozlowski wrote:
> Add support for DSI on Qualcomm SM8750 SoC with notable difference:
> 
> DSI PHY PLLs, the parents of pixel and byte clocks, cannot be used as
> parents before DSI PHY is configured, the PLLs are prepared and their
> initial rate is set.  Therefore assigned-clock-parents are not working
> here and driver is responsible for reparenting clocks with proper
> procedure: see dsi_clk_init_6g_v2_9().
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
