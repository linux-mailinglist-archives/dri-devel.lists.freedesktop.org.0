Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CC8B09F4A
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 11:23:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45EED10E930;
	Fri, 18 Jul 2025 09:23:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MMa3nh+j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F1010E92E
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 09:23:21 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I7AUxv028060
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 09:23:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 R9tbdwW74cZEyqwu7Rui55/J0rnn4mTkIqlUTKDRA+4=; b=MMa3nh+jnbnhJj/n
 qLQLWRiB8S65cc2Ewc0lGtk7lveJn4/SBE3pbMdBizMtCXuUyixMc1OkNBN49KTg
 nZ2nREVccb8OVDQpqgK9wlOQzuN3Nf2BvQ0TRg0R2Rn2mBmRxSIcxhMhGzpisIjt
 nB7dKqeET01QFmvtrzYIznq9zZ9/ZCDczjvrnHLO++e8lONjZZP2sFNykCgKnMma
 Ixi2/NtSYvZAnKU14/XT7d6a7oQB+YWRG7OsJ+QTB8LVZC6euEmaZlwiWK1GiWc+
 mwLdpRPLgROVQm59wwns/lyozmb5pEi94KDrerDGy5uFiHm8xmxM5cuqN8dz7swz
 iY3WEg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wnh6364n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 09:23:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4a9b1f1fa5eso5113491cf.2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 02:23:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752830599; x=1753435399;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R9tbdwW74cZEyqwu7Rui55/J0rnn4mTkIqlUTKDRA+4=;
 b=gK2swFRDEtLCmd7VvQXNLn1HbbBMnPb68RbbjOknC9ATyyrvV4jkRMFdpOlbPs482i
 AEg6UurqZZhTRJCt+QAdo5+VoAMDZjmeaPAPjxGo0VC446RPumWI+da9JOEewLoqSCA8
 U0JiW7H4RdaYYQy4jTqNvueW1o+UDbiDYKNX1tIQE1q99nvi95oGWM1NsRFqi7lb2fvO
 ASeAG4FAoAAVL/rCUN+Q03pa6vmM63v2pE6gHdTpjHPIxO+NK8Aa7+Gnu3Dwjj2zONra
 rRNa8hC42LphjHNKphNUZJD3DFetgvUlryykVHApvqlWsOlZ6BmuGZArmjUL12LYOu+A
 OyrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWek3g0SvarS72H8cA9YQgYvfsJkGqTyTa6nd/aSLCzjKRgFzjM5rc/+1qyXFTPpzremp9jH71Q2bE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwW4l2ElpnSX0acK5eyDrlnyIOZcEbEL8MHBklWNuXRKetPxH5t
 ZAnpyspUKkZ1uHzD78hgZ88SqzR6hp2ZsZHOZ7OFXa4WZZySUCd+FsFNxyeIlSxI+v6olMtiF2p
 zEDCWV7Fb+afELWAzoLt633AOSq4xK+C3TOdYNZXf1BtGF2BKEZvpjyZXFwXpB1NjT1xbknA=
X-Gm-Gg: ASbGnct9KRl8ZGfUe4m474HhmwvRoGfn1MZ8cwBFDPGyl+fFQpAwURrNRKf7yhbHfRE
 jsSjNd3bcUHEqdLYNlrdmqX0VAo8oJBQpyXtkJhN2ireGtj90EVDgT7txUI8/0+wwZ5FF67JaUZ
 EVOZVwHtizNdiNibEu+Z3wjLnmWH0oL8/LeykXkzcLf2CJkXYcnxiQ77ma+1uDrUiB6iuCV5qY1
 DC12m/R1fa6aWH0H6ySWJbuFmZ82Kd/aE3HSsUNM9Rhnt9wF9BHTWYZB+lwXHmSPlq2Ksbsp0fH
 jljSP47jK+Q6jkpg/nSp/5anAIPPAnlNuHuMHW6oNqCwkMdiCG6u2cn6jFoRQWPYDx74eGtk3Bl
 Cb32SI9NSH+cnX5N/tzAS
X-Received: by 2002:a05:620a:27d2:b0:7e2:1609:a19a with SMTP id
 af79cd13be357-7e342aeef45mr582359785a.8.1752830599146; 
 Fri, 18 Jul 2025 02:23:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEp5OpRRRlubBf4j3XB9hMRhuiSC9XEu5aCviHEU07bToJoCBMGtr/bqJyK9a710HZLckzjkg==
X-Received: by 2002:a05:620a:27d2:b0:7e2:1609:a19a with SMTP id
 af79cd13be357-7e342aeef45mr582357585a.8.1752830598696; 
 Fri, 18 Jul 2025 02:23:18 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aec6c7d9941sm87211666b.56.2025.07.18.02.23.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jul 2025 02:23:17 -0700 (PDT)
Message-ID: <17ea4f08-daf0-406c-8760-23a23417ec1f@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 11:23:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: Add MST pixel streams for
 displayport
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Danila Tikhonov
 <danila@jiaxyga.com>, cros-qcom-dts-watchers@chromium.org
Cc: Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Yongxing Mou <quic_yongmou@quicinc.com>
References: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
 <20250717-dp_mst_bindings-v3-5-72ce08285703@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250717-dp_mst_bindings-v3-5-72ce08285703@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dKimmPZb c=1 sm=1 tr=0 ts=687a1288 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=biz6BXDC6RXR6m6nPMoA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: xJ1ud77fXagHMkNxKB8X9VqE4XD6slz2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDA3MyBTYWx0ZWRfX7zpTC6+ry+Zv
 +v5zwQnjW1JhKGIiKW5zKf+ShQfT0qJxF80DSkomaZUR4yBnqKg8XwRRijfS6lnwPGRurJentWe
 wt1hxLdtnMqU8vPBCrvAjU5+Vp5haveTRyBrcAf9pC52rP45wIrbhXmW1X+F0aIUiwj9fnBzsWA
 AjTNN+dUfbGdIeH4vmc9AZen72F0h/ALQ2z/YKCrwwhG83ckM9ImqaX6JX22JD706SCgY9OJJeg
 057RoUq79eLe/CdwTWXSAPoOyBkBmZRps1+6DbQsTUh+MDhez1ZtqYccZuIl8DzLy9/kcvJ1aH4
 PmByM2B2I0xvaIv+fueC1F13ODubSPfBcg1uB7gz94NcnG/y6ZPyW4ahLTmQ5CFlfztNnnBO9DH
 rApET0tVNqoA6RRWpb92X+ZWAlkxyvxkKmaiULsBeO3Hv0kZWZoODHlW1lmckfG8yED0kMQH
X-Proofpoint-ORIG-GUID: xJ1ud77fXagHMkNxKB8X9VqE4XD6slz2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 mlxlogscore=650 mlxscore=0 spamscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180073
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

On 7/18/25 1:28 AM, Jessica Zhang wrote:
> The following chipsets support 2 total pixel streams:
>   - sa8775p (on mdss_dp1)
>   - sc8180x
>   - sc8280xp (mdss_dp0-2 only)
>   - sm8150
>   - sm8350

I think 8250 can do 2 streams too, no?

sdm845/sm7150 also have the clocks for it FWIW, but that doesn't
necessarily mean they're consumed

Konrad
