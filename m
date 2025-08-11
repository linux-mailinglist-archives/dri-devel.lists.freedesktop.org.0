Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24EFFB20575
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 12:33:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81C2910E42F;
	Mon, 11 Aug 2025 10:33:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fa1OArYr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42A0C10E432
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:33:42 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9d9Gd000605
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wsD7GGJiNnfcvjretasZ/pNIYgJDbc71adqR86O7WrU=; b=fa1OArYrsMY1cNmv
 6U5JEBininEQETN0UrxidHl7XVnaDk1pndGlmoG23MCFUxED68xnDTNCSFHJIoSU
 ZIPwylxia739ZMNH8Q+CRQUzLNK+jVU9M9ux6Cvxy034AnLh7yPwJRzmMV4k+kT0
 1tqtXQl0X1XLW9KSZtgGRL0FmUFs9kNo2eMOVUzEzhQaVnNaOf+txkpqqpVJFLUE
 QDIsKSTgiY4a4JwpzbQisDLiDH3mLyYaeATtMFd8khcUsIKrsCZ42+Z6enisuDJY
 etaHEHFzHMotOcB+HuB7UIY0rf8xmx+IGGobpkQA5wxETZ5MyMyGRf08VgmHOPhk
 ZJXPMQ==
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxq6uyph-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:33:41 +0000 (GMT)
Received: by mail-yb1-f200.google.com with SMTP id
 3f1490d57ef6-e9055838071so603139276.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 03:33:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754908420; x=1755513220;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wsD7GGJiNnfcvjretasZ/pNIYgJDbc71adqR86O7WrU=;
 b=WPoMj+jJekDmkSNmTUnn42nLzANZizoGWH7voISA3zjSXjRs2VOnwL64Qo9P55b2v4
 dFlfPVxySCnAq4hk/Z/e2ozzOuq6l/VqMGgeqcJFDwRouTNkSshfEU/5/iz1FqWOigRU
 TRzcPDYY5yM5gycG9FRwwG0tdn6YgqUCNxQR+f9K+uPil5hlBNYSshQ9K/58kvWTdHuk
 lArr2p3LG3AIR87bZolhJ3s/+vAn++bYdBbmPUZ4J/57beRCfhCXNDWwGlILpubxxLv/
 A9o6n6wQCBquIBaJqh9NogXmjiXaqxo3fj2Y+wOMsaa7NMidU0Z+s39hDl4bppfmZhhu
 tYKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrl1/wdjM+MUJWA5e3pj4JuajoegvVNS9cWPKB9U8ZifXKcQU9FOgfyYvSxnI7usG6X09ZktHChHQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQfoT1QbXOgqewzXQq8OzbOT9PjwR7luWhf7bXDZFXnc/68H4t
 hrmhotX8TJ/+qWA9Zmb8CYTylCMeLM+cmI/g3D+5JnBJ2JxKy52FxTqoXot8CHz1Q48ovcdYxVV
 AD7VF4cjzcZLMFRxgnmMAEZef8MJg9I9DJFhKasOhg2BeWsbeM3X3Qr2ZoE9xbYjdoG8Nzfk=
X-Gm-Gg: ASbGncsoILPwvSO+JKVrQZsmN4LsT+pp7p9snUcOR/3ZYRlGoMLjq56OOCsfd0MghTu
 hFUQM3faV0FfZqByURhvAIOy6nxYxJEvY2v3v+EFUsb/CE1MOpqRTkgROIaF8Ge0njDy8K8ECLa
 kqcvkVMJ+sqMKLzLBmbxFVribu97CpMJTyWl0EPRK7fKFEI7ZFZQAbFcB0Ue/sRB9gC+6ICliGx
 kRayg8Z23+a8GGSeE7Tv+qsnGc3b6lAWQphVRsqRKi53LP81/hujKKDk0RZrSCm9bO4roJjBIZ4
 QLu7mYcX9xDAyrdteIMfUIAvQGxVwFx1qHBtWKbDXMpGvUzCbmkT0w3VtFIOYNh4UFp17MtTiNE
 5PIT21HDXvDDbk4olvg==
X-Received: by 2002:a05:6902:1105:b0:e90:569e:8a1d with SMTP id
 3f1490d57ef6-e905c530befmr4533779276.0.1754908420451; 
 Mon, 11 Aug 2025 03:33:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEntP1C0STH3bZ4zJOHqYgn5Z4wBvYvhRLLkeSBhIq4vihJkw/i+kzn7lwfCsqCq1ZHC74r2w==
X-Received: by 2002:a05:6902:1105:b0:e90:569e:8a1d with SMTP id
 3f1490d57ef6-e905c530befmr4533757276.0.1754908419897; 
 Mon, 11 Aug 2025 03:33:39 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8eff60esm18546387a12.13.2025.08.11.03.33.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 03:33:39 -0700 (PDT)
Message-ID: <238a18e4-43b2-438d-9ca4-886806b77002@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 12:33:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] drm/msm/hdmi_phy_8998: convert from round_rate()
 to determine_rate()
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
 <20250810-drm-msm-phy-clk-round-rate-v2-7-0fd1f7979c83@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-7-0fd1f7979c83@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyOCBTYWx0ZWRfX+fZiNQugU81o
 s8+CNjJbl33ILGY8YmJTW+6xMrHRJmookckNBddB/uQKZfzO2JmAbTPfYSRr2kGb7i4lL/+I9oA
 vYqlj3nPOsBuoeIfE0jDynuHe5oLQ3dvgy22Z/+bO4wrJmxPT0u5iC5K5bBo7lMB1i5kyooS0mf
 z63Zvtpg398SixebngVIR2wzmChPVux/nY8/9tWVV9OnPIrkZRNVB6jUyNsIDYrXyJwF7M/edTx
 501rfnwkm38QMUUnhAp5F6fQOcp8otxmjhuZOnjeMMUSslJAYu0wQKpgEKYkaRtaSqahrHzmATe
 t5y4dOuflht3j36vTP4lTZ5GqK0pjhKnUB+4YM61LgMervH2kABS4p8Nw90pgMhp/DRM+0wayzv
 EmnY6pWe
X-Authority-Analysis: v=2.4 cv=QYhmvtbv c=1 sm=1 tr=0 ts=6899c705 cx=c_pps
 a=peiObFy/9J5zY6vzkL/ViA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=aS93HcZ8ji4XsMPHnqgA:9 a=QEXdDO2ut3YA:10 a=uSskPZdq7w8du69dlLff:22
X-Proofpoint-GUID: ZEfLVH_LPDkWCQtEpxF-k2E0K6koXt4P
X-Proofpoint-ORIG-GUID: ZEfLVH_LPDkWCQtEpxF-k2E0K6koXt4P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508090028
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
