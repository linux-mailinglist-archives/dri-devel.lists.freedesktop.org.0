Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D29EB53310
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 15:02:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D22FA10EB22;
	Thu, 11 Sep 2025 13:02:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FMPIOm8A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F25D10EB22
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 13:02:47 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BBB0DB015055
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 13:02:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=WOjKakWSJUNAIQxWsQlAPujB
 r+5TdOe/svr2H2na+E4=; b=FMPIOm8Awg8n6eaKaddTiTh3sj+RnU56NbVJ87hz
 NIBlaXAAIkvKo9pYDptzD3yqHm8DJBEOs0yYNKTLay5mxJY9D0WOsxnodTlo5hxi
 xR7+vm5RPDaoguYR9ZBi46k05KFoOD5f7Kt7cy4tioE45QskcOYQGUOsCONy3s05
 Q+6/WBFo9eU21CNfir16Os/a0iGz9/VfLR84RQ8LzNCi6uFRrd1RgTU0NZTrZBsq
 d0EKUsDiVUyjUz4mnRvBJyfUsxUbwORJa1Hgd0DuyWS8IhyK1IvDRJIrbweDT/Vi
 aYnm6VKk+hH4kIspiUYJcvqCdZ7O+XlwNJRUS7v7Nuvlbw==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4m7kh6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 13:02:46 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id
 46e09a7af769-74be52f5459so810602a34.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 06:02:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757595766; x=1758200566;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WOjKakWSJUNAIQxWsQlAPujBr+5TdOe/svr2H2na+E4=;
 b=lhEZ6c0XP1k/XTBhITteAvuiEIpet4prXoKmFCmoQpdAYbGp6IhDuo5DfNSwLKNNNC
 r4Tl8G3XhhqH7t0GUjkgjQd67sbXO294R0ubJ9UD4gMb8G2YxNlAMhGxrxzvsooy/3Av
 LpCBFPzl1I2354rB006J81w4Rz9d36tj+L9sBRnC/mspZT3dLu56S/I91oAZ/PWTwCOf
 JUjVjTV0lS244XP11ag65kLD4Pq0VqI+Nh6KHv958ftuTuTfdAzPOCFfroN2hpuQK7He
 AUV+1z1fFB+Lc3jz5AwgnxgyOihjstXtbOmTIfPTJwq2nG6Ms3Z5MzymAm0hd9mi1ybb
 a0iA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVv8a/tkGASKbv8Y6VdiwjF8yzt7ByiNx0GZtC36YC/q2eZXzKN6nLhowEokmhooJLRkrnryQ+RA5o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxLfEfpWwewJ+0QNM55CFI8MhJ9Wnqt9kUISzDxi3PYtsIiXm41
 y5gTdQMe2jDOJp6JYJk5N7m8TA6a0GOK9jSd7xq0oThdiCUqS58ZrzUfoSXpFHRE46iJlcqVKf8
 nxxmbMWq3VZju/j+gt0vB0YTpiI4t/kEGwG1/3GL44/0ASMwCDxrtXLLDyVfkhjPl16JsVCk=
X-Gm-Gg: ASbGncuNgISqGBvR37dbphhJ3rARScJ0vGXTqtxrkHQ+xmAeOSRpozp1zfTh7zJahuY
 YyqND+FmSzeq1s58UDAkR6X8hKeRTb54bEDLkdMhMHQcq4+9hOoglHFg4x1wqJsdalR0DaUTNGd
 vawvb3+ZFUmcab/e03Eq6TqGlvt1Hf7jUFmsDmskVe/WXGH29/ixbE+k7mmp3KInJAFxnirsDn3
 TnPwkVtaRO4MmVziGqi0zalHf7hmjjBjiLku9Fo6oge9hhWHmmwJOz6zaesxBMxrBYAwNLIUC4i
 /3gdDudh7q2UrRvENaaicbIrfC2BM26QK06UgpaiOU1wkoi4Kk+iwzOhc6EP/qYe4QpesHafehK
 Jg8JQdxqwz6brG3T32gxWgAfcE8354FCTAxzmQz9bk8ppGnVSSIdF
X-Received: by 2002:a05:6871:9f23:b0:329:8747:1653 with SMTP id
 586e51a60fabf-32987569accmr6700549fac.49.1757595765371; 
 Thu, 11 Sep 2025 06:02:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHllAsg+d3b0kcKub7S1vojdU22rC6Gpz9ONEV9J6SRbyOSxxcJp+ShDd6GhvzKBP0tyHSfqg==
X-Received: by 2002:a05:6871:9f23:b0:329:8747:1653 with SMTP id
 586e51a60fabf-32987569accmr6700417fac.49.1757595764406; 
 Thu, 11 Sep 2025 06:02:44 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e5cf2f446sm425872e87.42.2025.09.11.06.02.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 06:02:42 -0700 (PDT)
Date: Thu, 11 Sep 2025 16:02:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
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
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] drm/msm: Add display support for Glymur platform
Message-ID: <xjtg6emrb7svloz2fkaotfbj4m2wzmddxdsdnjk5wkbmocqzmd@l656suk46pkd>
References: <20250911-glymur-display-v1-0-d391a343292e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911-glymur-display-v1-0-d391a343292e@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX14pH+vLapn8U
 glozslw3TD/azfHu+I/+6Gw+RiAbYmrsKpwHxlslRmVvKEhEJLGpgBim05xYOEfml2uYabl8gsZ
 bqhw/1Aso0WvKT3pHP2yaNUhKfssXgjU1WUtWE6yX4SWwd0qVG0CSeEwqQm5q4TVliOO1fM5MdM
 HZZvsBqgEopm7umwj0kBZtATcGe2O935Hmu02sOZhW4nTgUEHVAj6+CLa8+DVP24YWHN1eT2LQh
 I4hGwZEB+GaZncSb1zvTZCbSE6e8b9HgmF0bUBBCwBM+hrE0MDku3lnsEVDwcPMSsXlJqdbXp+T
 K5ysOjvCVu4uoK3YmntPdJg44JzieUsSGKTXffxWvdNcGUafr60wzTrfOyhdqgJNMZxr6Dd+p14
 5/z3KpwJ
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c2c876 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=cOPp_-mWbVNMstl9cqoA:9 a=CjuIK1q_8ugA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: YNjHFovzvISz65OgBSSM_EcNvmNXkbh8
X-Proofpoint-ORIG-GUID: YNjHFovzvISz65OgBSSM_EcNvmNXkbh8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038
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

On Thu, Sep 11, 2025 at 03:28:47PM +0300, Abel Vesa wrote:
> The Glymur MDSS is based on the one found in SM8750, with 2 minor number
> version bump. Differences are mostly in the DPU IP blocks numbers and
> their base offsets.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
> Abel Vesa (6):
>       dt-bindings: display: msm: Document the Glymur Mobile Display SubSystem
>       dt-bindings: display: msm: Document the Glymur Display Processing Unit
>       dt-bindings: display: msm: Document the Glymur DiplayPort controller
>       drm/msm/mdss: Add Glymur device configuration
>       drm/msm/dpu: Add support for Glymur
>       drm/msm/dp: Add support for Glymur
> 

This will not work without the UBWC config for this paltform. Please
include it into the next submission.

-- 
With best wishes
Dmitry
