Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1659B1BF4F
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 05:32:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B4610E710;
	Wed,  6 Aug 2025 03:32:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="H3NOzBAe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4BDE10E710
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Aug 2025 03:32:28 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5761ekMD008622
 for <dri-devel@lists.freedesktop.org>; Wed, 6 Aug 2025 03:32:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=bp0e1t87ImDZTopBTTYuyUrx
 Q5c7XAIZXEo3/bApLtk=; b=H3NOzBAeKdtKarKmdUnhoOypiXBVExme4WQw68Jj
 e0Ar8g1fQheujC/POvP6jyRILOgNON0357Xa3OpDg//77TllFcPfHdgA0FwhYR2u
 4QTl230rC6WaeSjzBSQwKuk++t3QUtBDKWaq8Mia4nFxR6MKiEJ/Kdl/QsSDFoYg
 Ayjeb2UOdZmm5m6kXRWyOTNZKH0IBg20ufthER5+qhXIZI5EEbB67dfme/b//ovZ
 aOFtYt+JiBhiIqZasgiYnomp1VYLkAepuS//rmPeVwlsFHm0lf8P20ZibCmwhzWT
 Qq6kpVGkFepgyJT1hSF8nN2jq+AVOr73y6S57ZobLxupvw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy8993r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Aug 2025 03:32:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7e7ffcbce80so513591385a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Aug 2025 20:32:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754451147; x=1755055947;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bp0e1t87ImDZTopBTTYuyUrxQ5c7XAIZXEo3/bApLtk=;
 b=IRmTiie21Wy6LDuBLnJoP93ZLthpgiJqLwPFbpbd9Tw8ypF10Y6sfXZIw3Z+dmkIgp
 jt8oh3BjDP4Nm4I9ReHN7ZQCoObz0rkgbwTmr7+s7yxxpcHrX3RQRfLS0HKk0nGc914h
 9AFFuipMoMeX+Ix0g07XHYDHYTjl8N9J8VHLfZX/SjcVLJsA7sogzTzVG6Q02gsRSd/t
 Wdm0WUMApTqo4Dh1XtFgYiaF+UCfmFPGeKbMeSv213THOMohL6nx7zw0lFU3mSMVHLo9
 KFmKYHYvpCi0HHg4tzh9e0yuhEILVe4Wf6przXa8ofyyucSoL6CqikKMz34EwyqWwqC3
 ElkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1vWVWm2hvXs289yXzjkmUQxt3D0FlK1C3dTyw+5WzwEW/xoySy3WRvIxmj4bVt1w21j2kdYbN37E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKCBBvuCtXa3EGCm7e5Fv3DBYj/28kFBHupnZrgbIYJtPQqtHB
 asGDt2kZSEucv++xk1B1PNKa9E2XpAOytM/bVXIZVhO2buoFyNc1lZV7pbgTqs0JCR4P86uOiYl
 7m0PAxqjAlv7QPzXSjIsn93FlJwEC5qlHqM8G6Y22hHvwPjEbDT2GhuU9RdNEI8UfD7/FGkc=
X-Gm-Gg: ASbGncv2t3lvdG+ZEyRgrtWnG3AOWMrHmumUTIV+P4Ni0PcIOxnjqTV03ArCUmcmf9n
 vyUMxImdyuP/QPfrUyIvno04ctkbkPDm5EPOkK1YzPuSPxygqctpN7GzVJnthrCcNmQfHHUfgs7
 z2KZOigXuL+SpLtkoJx4J+KxQk/5LWELoz/5hzsISIXM1tZH+RUt4aQIt54kMACW8TRNCPk2Ye8
 I7k7JFaFDTXE2KOO2JgBdI+KnBzgQoCPGocXB21Ll320V9CAqHloKFS2q+5n9DImnFW/1tXygei
 9P1z09CLEDrR0VeBZtSKng+lnBwlpHX3CvxwsqH/3jiWMbbH0FS9L/AQPzn88oEi9kbKcvXSu/E
 3JlIEHKIiKuVb7pazBtw9EhyDQJL60Qddx8QrKpoLUBzzRoZM5CjX
X-Received: by 2002:a05:620a:2549:b0:7e7:12c1:8f93 with SMTP id
 af79cd13be357-7e8167979cdmr148177085a.63.1754451146911; 
 Tue, 05 Aug 2025 20:32:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7yVn7ORcrOBeeziceNORYHI0f/zhevLvW7M4a3MwVZorhSohXkORjlxptKKnzNulfEggRxQ==
X-Received: by 2002:a05:620a:2549:b0:7e7:12c1:8f93 with SMTP id
 af79cd13be357-7e8167979cdmr148174785a.63.1754451146366; 
 Tue, 05 Aug 2025 20:32:26 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-33238272d10sm22210681fa.4.2025.08.05.20.32.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 20:32:24 -0700 (PDT)
Date: Wed, 6 Aug 2025 06:32:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 5/6] soc: qcom: ubwc: Add QCS8300 UBWC cfg
Message-ID: <xfhxrzrzct6n25jtoaacptf2grd44gazfm7fkiyqlhq5bjqujz@bjvacutguagv>
References: <20250806-mdssdt_qcs8300-v6-0-dbc17a8b86af@quicinc.com>
 <20250806-mdssdt_qcs8300-v6-5-dbc17a8b86af@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806-mdssdt_qcs8300-v6-5-dbc17a8b86af@quicinc.com>
X-Proofpoint-GUID: oNRzlHX4XG62dl4hLDO0tG-mh-JEre2p
X-Proofpoint-ORIG-GUID: oNRzlHX4XG62dl4hLDO0tG-mh-JEre2p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfXy6Bf3SbqlHcl
 WniwmDAFle10cYYnd9iCsnkzGTueWPgfU2aLZ1zTZKJaskQ3WhxGT1QOnBvrFpJ7L5WyhfG0w7R
 ZNkjHi2Psr8KBDhfBa2S5U8NeUtSSlaOd5t30Bhj/c/S5jTZHwh7U3rDAmCtj8QnQMXPjZ/EIMv
 mLbn6XrsL95SsRxJaeOHie8xxziy+pRAOTLZenYh5iYbU8q19s7aWtA2e1frbGz8FOYwE0kWDfP
 2UJgCLFVGGwq3M4EaFN5U7CZHtVvmVFrbHVsEn0gN8r4hlYCDyGx6NVOVoQkuaWC3LsYJ5guww6
 BWECR2AQaMCoCmS6Zu64b5Ot0/7lZmz06EQD6Ae1rBnMnmbyc5ucgqGQHUmX9tdlJsFHhi/xdr+
 2vJXEF9d
X-Authority-Analysis: v=2.4 cv=GrlC+l1C c=1 sm=1 tr=0 ts=6892cccc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=qcYK-ZiiYIKsHLxbHAsA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009
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

On Wed, Aug 06, 2025 at 11:16:49AM +0800, Yongxing Mou wrote:
> The QCS8300 supports UBWC 4.0 and 4 channels LP5 memory interface. Use
> the SC8280XP as fallback for QCS8300 according to the specification.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/soc/qcom/ubwc_config.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Bjorn, is there a chance that you'd ack merging this through the msm
tree?

-- 
With best wishes
Dmitry
