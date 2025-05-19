Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD95BABBB9E
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 12:59:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A46C10E3E1;
	Mon, 19 May 2025 10:58:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ig9y+3xi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC47C10E3C2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:58:52 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9ip4p022760
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:58:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fqFaO3iumEsSA+9mwg4tpAHMyVx11KCQYF3S3tW2yiU=; b=ig9y+3xisTAGYAk6
 vzrFHWsJKR4tpkHn2DzOLoE6ImBbdkCTD+gi/Wu33ekx2QgrCFy8tD8krC0PeWjO
 JQiTJhrGJVDXBKd4ovWXhOu4IG8nwfMNdxUQPu4c3/Y+uuIO202cOBXzNYMv60eM
 sswb+dRXLsXkItnc6fy/pT9S3y/K7VactxYjLizylaZ8Zm/jfzJRh04PPUXucW8f
 cLeg6T7mjYHnEmnV5rfXXjOpFCt5zYrI5esrTFX/qP8AzOH0CoLepCJbujmFYvsB
 VbynHpFVuryKGJ88YN4KC1NDzaRlds0rnJgq1sSrtJCMj+hhALrrYb25HbC/5iFZ
 qjPiFA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r29d06qk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:58:52 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6f8dfae341eso5593776d6.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 03:58:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747652326; x=1748257126;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fqFaO3iumEsSA+9mwg4tpAHMyVx11KCQYF3S3tW2yiU=;
 b=oYq+O0ZoFF6iYUeku/htplEjAfdeQapBlUO788au729xNU4ks3FZmeCdMYFvgSXf3w
 zsJtYYC3bVtIYetsBHBf9Pck0tVC7k1ZzXfS67VvHMDWAaIMisqzfQXPxNankR3v6rnF
 DgX78Hv/sE36cozwkXK5Da6WgSk0spmd1AuaUrms3lxwTdSNKy4g9E1VZVg57bYOF2dR
 wTjKzRO7y358Q6+7SWDnm4cI2cLOB+fSTemCNdnhiL0tlAq/qJeApGhKTjFg94evZJs7
 2vCwhdfN0W9PRj4YsY0q6VrrbD50KXhli2W2NICwaKmXGLmmo4pLY8n1fBkmVlaW4LlJ
 ymSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlTQivmNE3Mipw5xYpk4WinsbhElrNCh0ZdyXAeubyoINxInnLZYHS2z/9GHV8R2SJsqlkY/tiITw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyee1d3d2H2bPhn4s6CVbnzA0y3jJaTwfqKIotvqikgqbsD7C0n
 BgKCb1Z4Std7GPueUkWd0A3AymA16di5YoSNJgOZgN4jSl9lN2mtT9KclpvB/vZKXxSccMrISNJ
 5d/Qo31oLyFh8Xr9QvHr1Tka5QlMNzW3+koCzKhlLcGImFlrsnInXCaQPOUuFCuz37TmvpxQ=
X-Gm-Gg: ASbGnctwRlSLl2nOL8lFGPFKdWgSn82qJT7QruXnFjaw1dGD+S9V+gtLPF3sOA6FLSX
 Xiayg7cXiK/pJIawOcCiM0R7b/zB6ppolDxY0CQ1ahAw4YNnKE7h5pYQTnmjMfTIJykI87K8BME
 D20DaQFcF/iSPljxRiZrxjMqte8EmU9ehRcKUMl2CF4C2elJx5rCo/IIsi9Kg0JPr9+xZ5j8H1W
 DqIdQNY3zb9B/Io6hENwxR6ZLhaNpcPJfiACwcWhcwNrIU5tMAuhvZyoxNuPO0cUfSLvNtPlUoY
 rX17GCIcIRh0n79oNjvbl4ZY9fyJVrWIBShosSP2dwu6HVGgMe5mHRHeBnC5tQsEgTVbOihKmAc
 uA2m7xq3K9th4E95p8wNN8PAr
X-Received: by 2002:a05:6214:c44:b0:6f5:3d00:48b7 with SMTP id
 6a1803df08f44-6f8b08f3e94mr177056326d6.41.1747652326275; 
 Mon, 19 May 2025 03:58:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJcAEu48QCPI3xLKvGvX0WyaLZgXZDfjvKNGszvjWv3n2dnBqxwTrw/HMaVSNLmCnqB1f7XA==
X-Received: by 2002:a05:6214:c44:b0:6f5:3d00:48b7 with SMTP id
 6a1803df08f44-6f8b08f3e94mr177056066d6.41.1747652325929; 
 Mon, 19 May 2025 03:58:45 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e6f314a2sm1801140e87.77.2025.05.19.03.58.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 03:58:44 -0700 (PDT)
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
Date: Mon, 19 May 2025 13:58:32 +0300
Message-Id: <174637445761.1385605.1655307242788912064.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250425-dpu-rework-vig-masks-v2-0-c71900687d08@oss.qualcomm.com>
References: <20250425-dpu-rework-vig-masks-v2-0-c71900687d08@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwNCBTYWx0ZWRfXzm6g9VXp6fjr
 z2J35b2dNT06GqQglbiVCA2m79ckBgRtrYtgM/ThOo+TWoYW4pxd+6nlEp0xzI7BGJOptBmw66J
 aOFwau3OaOzC6f6kt8jG5i1m1mKnpdDJkM9ng5lkHfJ0OdxKqwHV4VJd84Xx17uDoixMQZ4PBCO
 z7wsfa0VTKhfuhGRqTbiZVnfugjJRn7p7/qkFPbRyMzv6N8Xk51ycw2E21ixtS2qEM3YImkXmxe
 +iuWfh7WoDtBs4Lgd2EjfAVSyWZ9BWx1AkUzSE/Vh/b1hklLb8LkBxg7F9zYWTbqZ46ZvdIFe2F
 o3GnmdDFITgE6xd4shw8PVn27ceH7pIsL1IFpeDYDV8U2yNrU8Bh7lg2G7e+5LzzXNDZ4hlVYfV
 AZpKnwwBKUAqFVEDGQV7zNuCoFLGMJFinrUVU5jqRLmY9aD5n1uno5MP0gkawbG4CV8uPgip
X-Proofpoint-GUID: 5q5EZQiPP9FxtDgCdAPKANL1mX2g-_h_
X-Authority-Analysis: v=2.4 cv=KLdaDEFo c=1 sm=1 tr=0 ts=682b0eec cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=sAmZ8rDWQjnllFzyCpMA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: 5q5EZQiPP9FxtDgCdAPKANL1mX2g-_h_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=711 mlxscore=0
 suspectscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190104
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
