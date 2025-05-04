Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B71AA87B3
	for <lists+dri-devel@lfdr.de>; Sun,  4 May 2025 18:13:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49CFB10E11F;
	Sun,  4 May 2025 16:13:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mYY5Lk3e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 130B310E0FC
 for <dri-devel@lists.freedesktop.org>; Sun,  4 May 2025 16:13:41 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544Bdlmb000381
 for <dri-devel@lists.freedesktop.org>; Sun, 4 May 2025 16:13:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fqFaO3iumEsSA+9mwg4tpAHMyVx11KCQYF3S3tW2yiU=; b=mYY5Lk3ek8ARjW36
 ya8vLcViA5oGGfbflO8GqSaijdgywhA/EQTzHOUFPRDpjrhxCxfZDkt4HtqOQhan
 SqyB5dVuRVxw2Omtl/YX2bj2RB0X80D2/f6erMatdmoR5Mb6K/53Evyrf8XUY9qw
 rm+/a5Kp2OhZGEuZqNBIKp3qhEfhMMpEIQtetFVCXJYDpyHuU7tyEXj7B4olof5q
 BmlQqXjfSCF4zlPTz0RYva+HvcOOuVffDe1F8vGZ5M5yWVMKil1ylhQvlKyHOVk3
 lNOaQ9woRITIddiQ8r99fnzQi3VNB/WDzTcOc6uVOfTNYUGv1AkST4Vzzt5+7qIQ
 K2J/Kw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbwfj3g0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 04 May 2025 16:13:40 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-48cc1907229so45836601cf.3
 for <dri-devel@lists.freedesktop.org>; Sun, 04 May 2025 09:13:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746375219; x=1746980019;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fqFaO3iumEsSA+9mwg4tpAHMyVx11KCQYF3S3tW2yiU=;
 b=uezkP/0Tlh3neTxvnZWfNVAJjI46x2aLbikNtSFlep2bOz9GU8XscdHifVQDtCzGt3
 21BqfpY5OErfLzneDnUIP8SNTVW/NfkItxn+ADR8TVVzWOp5ak5hAxfj4AIJdA+XPIlD
 1ovgjWQD82/tz0wU2BUt27qRUR1SJeav/JDi7D4j7dW8JQ/Uqpz7CUzxCXZU4axoSIWt
 zTY8b9FyRdrcoWrKxlReRTSkeqvq/sQaTwDr8MGBSNBkyoof+/H7wBEBf0wzVNYwgw9F
 USf1QcqJf2g+j3I5Xw+ST8K9sPg/jIJcCxCRQ9IectEdLHRpq7sXVMPlfwpJ443Vh7Vv
 C0bQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXelozPU86Op+8kq6MabyEBqkn/reYIolZ7xfBUvDsJZcOuhKN9Un2odDfiSYpq6Zx0Lua/mHApdVw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyY/x+SK3qKb7ocI2+r68l9v7Cak5Z846kNYH32gX5L69tzEGEK
 a/ScylqCGZAlbwZg9gEfEatzvVeJx7VQ54FZDcSfZF95u6Yhbeo7uNOvPyASUAzrWHwOxQcD8lt
 XD5UQF5GGxreNfzSx7qg8Ttw5DW2F0DT53aZZhoZsdYgrOg2bFoCD9bNbNZ5bazBUryU=
X-Gm-Gg: ASbGncs07NBglEJBxtwwG/0Qyl/v72hedPIi/L2RYbdWP/U6wzZ9oWrBceIRAJh0YqL
 CJMfuyCEVvOz9ennUDLLHS8OIi18NFJ/MCIzrk3VfoavaDnjNteoT/4XEmkmOc3cpAmHRo6JqwA
 T+eZvyenw7nMSCVgh+vqT2/5fB41wx5oo1T2uDAbOfrjT67Dj/m7zbkonhBKGvd+IOSuMqyQ+cw
 hn46eYcKnwpv8nflbQLRkAK5bhSI3Z1N6WHRDehAsIiG0Uy1VR8WN0d3Roo0r+Q9cGb0gNTpVPU
 EkZ15ApKxhN2oFZOpFZJriMkX55DqVxqkgWvP3SXlT9zecIvf6N9P/AcAgBcYtQ2rGuKstXImsc
 sp2RfawoC9w3L0ZXG0UwCV71H
X-Received: by 2002:ac8:5a85:0:b0:47a:cc04:aabc with SMTP id
 d75a77b69052e-48dff9dd1eamr62916611cf.21.1746375219173; 
 Sun, 04 May 2025 09:13:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4PpjTVXPh6t2ptCuDJ0u61ftt8JaFdmA2iRccvAqFCJVOcO9pPmlvh7PN0itVonAKVAxATg==
X-Received: by 2002:ac8:5a85:0:b0:47a:cc04:aabc with SMTP id
 d75a77b69052e-48dff9dd1eamr62916281cf.21.1746375218850; 
 Sun, 04 May 2025 09:13:38 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94ee937sm1335231e87.142.2025.05.04.09.13.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 09:13:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] drm/msm/dpu: update SmartDMA feature masks
Date: Sun,  4 May 2025 19:13:22 +0300
Message-Id: <174637445761.1385605.1655307242788912064.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250425-dpu-rework-vig-masks-v2-0-c71900687d08@oss.qualcomm.com>
References: <20250425-dpu-rework-vig-masks-v2-0-c71900687d08@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: nx2j8HxfhUTKRLuEEEo2i4QwMMQxkd7q
X-Proofpoint-GUID: nx2j8HxfhUTKRLuEEEo2i4QwMMQxkd7q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE1MiBTYWx0ZWRfX9Iz9G8KLLeLE
 49QHiLdbDygNtHs3O6Kk1vKNo+jNEdaq9dSjWnOad43HdOiKxNCUf0JRy2it3JgCZS1SjsPEwNh
 NjMAL/3eWUi2R+6Do2PbVdtyTxeepJTmcc3OgdQjr0hmkkJHCWTiVY/MnRmrnCTjne3U618o8fT
 qje/p3MNBlVV+xMt8dTGOv7sETukoA+vAid5kwcsYGO3l8I7nghbCkl+IXS33jtAoZW/zfEM3Sn
 Mj6REfUhp4CLLWd9i83B+9rNdR7rAliPaVlqWy0StVzKgbyQZSSV6lAl9jYLtPKUYNyFM0NKHoe
 7ZJYEVO2HQTJ+R+gFWZXyFZ3w5o9fQX4inPbqRf3iXfe8twNqbBGyQMaJtPQQmp5mtFBpa5DmZh
 5Aw2UZ7hi3l5YfKOVjnjLdKDePr7AjeKUCV0b6IG/Sxq3SoNCK7JejFQtQZ/UHuF6iZJOq4j
X-Authority-Analysis: v=2.4 cv=AfqxH2XG c=1 sm=1 tr=0 ts=68179234 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=sAmZ8rDWQjnllFzyCpMA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0
 mlxscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=705
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505040152
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


On Fri, 25 Apr 2025 22:49:07 +0300, Dmitry Baryshkov wrote:
> It is easy to skip or ignore the fact that the default SSPP feature
> masks for SDM845+ don't include the SmartDMA bit (both during
> development and during the review stage).
> 
> Enable SmartDMA on SC8180X, SC8280XP, SM8150 and SM8550. Then rename
> SSPP feature masks to make it more explicit that using non-SmartDMA
> masks should not be an exception rather than the rule.
> 
> [...]

Applied, thanks!

[1/5] drm/msm/dpu: enable SmartDMA on SM8150
      https://gitlab.freedesktop.org/lumag/msm/-/commit/6a2343de0b6f
[2/5] drm/msm/dpu: enable SmartDMA on SC8180X
      https://gitlab.freedesktop.org/lumag/msm/-/commit/8dcccd7a156f
[3/5] drm/msm/dpu: enable SmartDMA on SC8280XP
      https://gitlab.freedesktop.org/lumag/msm/-/commit/63958b80c2c5
[4/5] drm/msm/dpu: enable SmartDMA on SM8550
      https://gitlab.freedesktop.org/lumag/msm/-/commit/3f5e910b33a3
[5/5] drm/msm/dpu: rename non-SmartDMA feature masks to be more explicit
      https://gitlab.freedesktop.org/lumag/msm/-/commit/79af56964ee5

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
