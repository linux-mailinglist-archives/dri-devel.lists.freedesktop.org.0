Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E62ADB20580
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 12:34:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4636B10E423;
	Mon, 11 Aug 2025 10:34:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Aj2ELdzs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 515A110E434
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:33:59 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dKup018311
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:33:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wsD7GGJiNnfcvjretasZ/pNIYgJDbc71adqR86O7WrU=; b=Aj2ELdzsgekhYgRt
 ClktyV2PtJ2CPU1+yHxzLljbB7VL8jO6/Qu75jWuF4fCwLZRtRfpwD2z+8UHaQlR
 F91dHXHznoR/VAZnbcxOhAUWozo1E/eSg7+hcF4UbaaP1SS8dX3A3ul8wwIvfskb
 kAQKD2pNqF5Ooj94/JJfwt0Adj5BvQ99j7X7bZlnKoz6n05iJ5U0uT2yhvQsERrj
 OPufcVYx7EdUIj9e+yP6ogpa/JGZLbfNiHq5zeUzmzO6ksgpYxhYFm8dXIuLIxOM
 ZaqxieeJm4j532hLK/vWcm7CSL9NeRS7c2KyCBW+NCpiuXBPao/WoB81t22D9wFK
 aerQIQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dy3g406b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:33:58 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-70941c8a17aso12942016d6.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 03:33:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754908437; x=1755513237;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wsD7GGJiNnfcvjretasZ/pNIYgJDbc71adqR86O7WrU=;
 b=fzJlrpyT8xfREXK2L+8lNFXlJ+pZEoMO6q3f0IA2YbNZys/hnl1c6sC7psBe5zm9dd
 2wcuiaDduS8Cvbfks3O8sHY1mtiPVSKdFYmjoFlo296tq6MRxnji7Crs2kqyuVn7+cOM
 kc228IQv1WMj65IaqgXFOk989Rous117roVvOwqXt5aItXB42YEugWQuijaD8jWCPMOY
 4xqMyIu7hmDLjMnbCTE//s15sYS2Ux7oXkLyD/zTn2GX3BBDnmOJD0NH2X65X2YI9dJo
 GBa5fn7X07l8qfyrrk2gnj60Qblb6VpDuujfMkdLa7FdZcjxH0FCo34xPX4aBvr3L2gE
 nf/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWmK2iXQuEi5rNXMe48qjC/z4CTegTeeFDQW9CVESd28l6KUjD/S1pxKg3QhXSepgBSP46O5mKkfg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywf3bs9VDAwN6dJExzebYjhn1BYEYUG3cEustaLWOH0u9LL0A8x
 gvRBywj8dCILpk857S6FN+AcSxenAsTlPlqOsCTw1zHIv/HNmNp4i8B5cWFkx8tnL2vrukeg9ox
 3GK4LwOBTAkDbG405o7qvp3/htf14SDCdtnk6fSaLUazq+Y3s3H04hM8HlDq4TCfIcgpjZSk=
X-Gm-Gg: ASbGncuTu9lNiLWviuWD+/MTIstHaWXheFSa22njM5U4JnpjDGEDK42u+wux67WUZ4Y
 9HkvWzv3Kav/jwPb9BTNsGGRhmk+dSB3uU3xpbuhueMfg57LJpTv6CKL7e8TNJItjuWpbXc1r2y
 t+tpVtheyoS+X/qcBcPYb1rD40tp46xPtCojlquU4Ey+yNdt2HHMdhCDUdECSZaSlm/SRE38ekU
 X0Tez7XWIUHA/uG3Mrjy/Mog8WelRAgGUcD/p/dQOZJ0iWqc62tqsZIQMEiI3Zf3TBqKIGjZs/J
 kUX1pCenqTqZkp/UJuRTASmJ+ILbeIqwQq9weBUlsAR/QcWwonrig4rU6LYVqgyqZnKQSNlDQpV
 MAVzIxYYcQqyk9+9lyg==
X-Received: by 2002:a05:6214:21c9:b0:707:76b6:2135 with SMTP id
 6a1803df08f44-709ac152639mr49721796d6.4.1754908437519; 
 Mon, 11 Aug 2025 03:33:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZPUcFhvJ+o3XZIPZBMeA11da0VhO9plin+aeS/4AZ3/QDcw95Q3QsJu+fTZO17e7WElJo9g==
X-Received: by 2002:a05:6214:21c9:b0:707:76b6:2135 with SMTP id
 6a1803df08f44-709ac152639mr49721596d6.4.1754908437064; 
 Mon, 11 Aug 2025 03:33:57 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8eff60esm18546387a12.13.2025.08.11.03.33.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 03:33:56 -0700 (PDT)
Message-ID: <1442a1f1-8cba-4f63-a9c8-85118d728365@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 12:33:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] drm/msm/dsi_phy_10nm: convert from round_rate() to
 determine_rate()
To: Brian Masney <bmasney@redhat.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
 <20250810-drm-msm-phy-clk-round-rate-v2-1-0fd1f7979c83@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-1-0fd1f7979c83@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X4lSKHTe c=1 sm=1 tr=0 ts=6899c716 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=aS93HcZ8ji4XsMPHnqgA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzMSBTYWx0ZWRfX3BqL2lL4ycnM
 TNZzYfSO9Vmyk17B2CMZJGF8ZUzQuQAd9bCgVV8OEpI/5em5D3YoSyEBptxG+rHMgip11kL3s9A
 3HyyGzlxodBNrCO7TWx+yV3tB3BnmPsceoes4k7vNBaspV0rYMlQHRHqpR8MRkdWaIIhGBypW7K
 bV7PUdKYYCxWTgKL9ylsfC+0+OrqdNTBV28WJKEhytY6eJx7CnuRmg/Gz1vnciQ+kOn9whT4PkX
 yvbFVOncpvbiLfaooM6mEiWZMw1ynCkFO963ArZaR6t9WU7E+GZV3THqbDMrM2uaqNoKx/xRyH9
 AmPy2uJ42QiKHt1S+QKJZ5Svpvb1D115/8AX8vrMhjULVulKfTcmRXisC89wDB9t09pWLTTWnFh
 t++Sca7L
X-Proofpoint-GUID: hRgyrMf3ob4-6qlaaTxWtO-x04mxWgBQ
X-Proofpoint-ORIG-GUID: hRgyrMf3ob4-6qlaaTxWtO-x04mxWgBQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090031
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

On 8/11/25 12:57 AM, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series. The change to use clamp_t() was
> done manually.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
