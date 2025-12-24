Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB857CDBCB7
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 10:28:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F6C10E9A8;
	Wed, 24 Dec 2025 09:27:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XqQvfRUs";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JbzwHeOx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51D9410E9A7
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 09:27:56 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BO04oK6559752
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 09:27:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 q7FHghTX3uiDklouV4gc1+N9CvHPdPtpOY8FSlSz+qQ=; b=XqQvfRUsIhTVgRB8
 j3FMZpBxGMm8um0aRY+tQdnRSQKoj5/ihDN1vQR4Vvz70YWnfzXBFS/RzWHcWV75
 21Y1w60Jo1mcsW0yxa1UoHWeLz+tEr1La/tHrWq3YlX8RuOvMwgquwyZ5u/JLmPR
 TTYGZhOLxZrESw7ksblUWomzqdEmohr+5EQtHr29Tk3UU2D1Wq+8XxSevJsbPzNz
 kWRJzv8w+fDPV4JVtAPtZIBxrQW1ajpVG6dG2Okfot4sLhWdGayiI6k3OMrrh5/U
 043s+PL32KRK0BBBijtnkVwphN6yvWuUersPZ931d7VsyRaPQdsZ0XVONSAbL7VI
 5FCZNA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7u9cu49y-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 09:27:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ee09211413so144349901cf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 01:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766568475; x=1767173275;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q7FHghTX3uiDklouV4gc1+N9CvHPdPtpOY8FSlSz+qQ=;
 b=JbzwHeOx1/i089hDjDRgM73a6KEXkfZDmH1FUMhLJzi+a0YyxXCISeBqvI7mK+9S9U
 K7RZ8B6m/10OoPLohNx5pExr1uE8GSWaQ3oRqG3cAlKvZ4s8rXSWfHt2FqruvaqMzg9y
 QZzcrMe/4teuNc3Jaw/5a48MMEHwZEjOT5jthf27caMV5u6xTrEvmVJ6CwUsJr/0HMjh
 XTzMt+y9tZ38Igg4B39ws7JjHNIdizdAk+n7/AEIc4lVls7YzsbSdCzPeQ0K5GwcNYjM
 ZBT1ue7aXSFgZ+5NOySzrwRUmDzrYrKwFzS9klHFPYEflfgm7shAEIlOFlSqjeHWH317
 XJ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766568475; x=1767173275;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=q7FHghTX3uiDklouV4gc1+N9CvHPdPtpOY8FSlSz+qQ=;
 b=j2PnCkrYMpBPuED+i2K6js2lv9/5anoclCzRoKAhcqroU0bW87F5mPtfVOAFsdIjw9
 cpa0wY+P4M7AWVnnpiOgApvpHH19MqynsW2D5jmX5S1qChJdysXp7CiNjRlKZIM2ALeR
 vMMcinfIP2Rtmn31WBi3uResZ3Z2Gp5OqEceW3pNXwUwtaKICgiR7uocH5/iaC8sWXn+
 axqrkhTOkwkmiSR246eYe7lFOUewcmyZdpHNE7bC+S1rbJ+g0MSVcgSHTl9sQS5ozrGI
 pEtWmXOaMvAFJOsqGP9bwozPyVe7g3HFLJUeLtD/ZUNf7LMpCAaP8/cxInoTYC1miwR1
 7cSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVw9fW7sHOHmdQBeW705zqYUe8k/jfM/t7rJXnnJ+iteoxy4Q65rSt0FNRgtw8nYe5/2YPzRhxcvXI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQZ4z49Mn7dV/uRrgwVrne/yfwNQ6ZBPWPHpKSDP3r/G6ELV6o
 aUHZAlBCpW4ivrmMxTzcwgRUQUsTEHezfqFp1oGgOOYN/+JOJAQZTP3CumQ3WUmbXcsHqEyWtL7
 6qIPDHcrZXE++IRWsKbfiYby/A6mp2yn9LAYT0dApQ/gJwIr8TE/xG94d5hoP5tB9xVpJc1M=
X-Gm-Gg: AY/fxX4XcxETdLVOZLG6EWgeS0Z4kRHFTN7Xaxd/WQQ3HZwFt0FPqjabqa3QDtJCMzO
 aDqsj+i+L4Trij8TUVpJf1w3Xqc55crn9NNlQcwSYm6auL5OcjQ64kFaEPYzB+9TdA5TaDcvsXP
 M5bwoEBaumBcaO4QduslxVBDIMPjwOFb6slNw1+Jj3L9Sh84lFgnNaylx2VrGN4rl4M2Apy/lDo
 zxmE0/+kFRrPd/HzIRokTEpVtQcTZnQ8NIkecTUoBuACIxSNyhKWW/CgjUVSxsGQvq3hmRxCMal
 czPY9nks5d5dgwkY3PdnhVi0DuBTPZrMm8ai2MjKTgtOUXdqF28kfAZ8IDzj/q1/ZeQiw+WzQUi
 YKgN2g59RCucObDpFPMtCIfmZqSttUZGIwtwx/v1QBB/aY4ud7sjArBReqBFG7v+/YK+YiVuAWb
 duDzzLZ1AOprcKw3SD/iHUUzU=
X-Received: by 2002:a05:622a:130e:b0:4ee:26bd:13fa with SMTP id
 d75a77b69052e-4f4abdd147bmr258958831cf.80.1766568474710; 
 Wed, 24 Dec 2025 01:27:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFv8MKmpaRPfb+4/iM2hRiwAOTJVkTLovJm5R61nJTI1nkvDcvDs063ITmDJne8s4O6OtuTHg==
X-Received: by 2002:a05:622a:130e:b0:4ee:26bd:13fa with SMTP id
 d75a77b69052e-4f4abdd147bmr258958611cf.80.1766568474138; 
 Wed, 24 Dec 2025 01:27:54 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-381224de761sm43606051fa.1.2025.12.24.01.27.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 01:27:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Teguh Sobirin <teguh@sobir.in>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: Set vsync source irrespective of mdp top
 support
Date: Wed, 24 Dec 2025 11:27:46 +0200
Message-ID: <176656845704.3796981.11060457763537143127.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <TYUPR06MB6099C539BD2C937F8630FF8EDDD5A@TYUPR06MB6099.apcprd06.prod.outlook.com>
References: <TYUPR06MB6099C539BD2C937F8630FF8EDDD5A@TYUPR06MB6099.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: UkhOUPf-yQ8rJd86kGPf6Ys_IPxnUczY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA4MCBTYWx0ZWRfX3XLr0mIPzwZy
 o6lGjRX90DxGJhDjrODP4Fouytmwl8LmNrVIsqoruot3k3wWU3TtdZyoi9+8pOwoMXkzPeWvco5
 ksK+BVnXsk7rq64uisAumUnIMM8k3maEifUWSqX5JFXg5HuG0Svv6mOE0ii9bxxrXWH4sk5Ok04
 WBJZybjRneiLLTaMRI07N7zxn0Eu7Nr3SI9lN5ZSlE573kg9WVusMmSsJWaxY3pOnfyudTZR1u4
 mWN2iaxWofFnsTbftWz+t0Rvx9rc6KBJZmOO0jCj9QEsiUfmTA7X91h238VRuK3pZnFxST0jo6W
 EhVZtyYeXlitYN0JeBV0yd3Gz6dvcJW59G+0Z9gQ9uO1YN2uZoP6mvromQw2wqsF++YYJ2Wcuyt
 bDY7hwUDi4q4ROSMILoy5+ILaLnOin4IaqMCyD9wzKLvMvwREY3TYDHRt/W6hNGck73RmAPe8ZL
 9pNBxQP/omefx2+RNvA==
X-Authority-Analysis: v=2.4 cv=HsN72kTS c=1 sm=1 tr=0 ts=694bb21b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=TLISOKiRIOAQD9zG33kA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: UkhOUPf-yQ8rJd86kGPf6Ys_IPxnUczY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240080
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

On Fri, 21 Nov 2025 14:02:08 +0800, Teguh Sobirin wrote:
> Since DPU 5.x the vsync source TE setup is split between MDP TOP and
> INTF blocks.  Currently all code to setup vsync_source is only exectued
> if MDP TOP implements the setup_vsync_source() callback. However on
> DPU >= 8.x this callback is not implemented, making DPU driver skip all
> vsync setup. Move the INTF part out of this condition, letting DPU
> driver to setup TE vsync selection on all new DPU devices.
> 
> [...]

Applied to msm-fixes, thanks!

[1/1] drm/msm/dpu: Set vsync source irrespective of mdp top support
      https://gitlab.freedesktop.org/lumag/msm/-/commit/0a7836e1db9c

Best regards,
-- 
With best wishes
Dmitry


