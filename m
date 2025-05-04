Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E981DAA87BA
	for <lists+dri-devel@lfdr.de>; Sun,  4 May 2025 18:13:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5799D10E125;
	Sun,  4 May 2025 16:13:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WGGVODzD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C439F10E2CC
 for <dri-devel@lists.freedesktop.org>; Sun,  4 May 2025 16:13:45 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5449L4a1001948
 for <dri-devel@lists.freedesktop.org>; Sun, 4 May 2025 16:13:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 P97x1i15pR0DFA8r2mBaSyn//YiqASvzqBgFrFYv0Xc=; b=WGGVODzDyzMk5G2S
 mkY59L1kxpwBZ2j3zGyB9hlsatxZhWI3y17xKjPbWLyvMHBlQc81X1NlLMkSSEUk
 GPS47xc0CSyz/Lx+Kv75VOFA33okDO9YmWQL3xzwLLfDAE3B5ZyyvJsECkPC332M
 CgO0cO90tYitEJvzcWiyh+k0kfNFfJEhQBuWVKwke9chjD0xOosEhCFUvbIg+lgG
 QbxGMQ/veayEzFGVS9EK62iZRHxOzlxsovoh0KeIkbulhNyTuDljYEkGiPfAdEPH
 LxW+gq+Xr7YNfNj0OvrwKo5hDqVxG/yssC70FUd6SyffRTrOV+kzHdo+zuajr0D0
 XrmCOw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9ep29s4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 04 May 2025 16:13:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-47ae8b206a4so70677141cf.0
 for <dri-devel@lists.freedesktop.org>; Sun, 04 May 2025 09:13:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746375224; x=1746980024;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P97x1i15pR0DFA8r2mBaSyn//YiqASvzqBgFrFYv0Xc=;
 b=bAB8kClH14w5Z7LMVsGaAqvcwoj8XvzaXTWE29V6SRddpbF+Q9Tm3WsBrl4wM0v6T0
 InKQI+qcolkc5QaP8sOV070ddzt4i+PgW6NJ6l/TGjioC9/Oq3HAGupB2xztBuymPh8/
 0vFcCBE5vEFFAw5KGaOjbRvtcNrU2IbCybUkoxzWGW2bXILSKgljIsYQTb8xy5h+yF0N
 F8HzZdi1KeqaACc+aIBhUHtj1GxLhjSi8TQxuJC6VPY5enZl6eZcCmdFzIjECDvUPG7Q
 METihsk3bNlAVVqw45kTnTcJLaZeF4ln1aSMdhaBHVltV9mGYNG3sR8Z4BbSkoIGq9xa
 TykA==
X-Gm-Message-State: AOJu0YxlGTvZVkdDFg+2sNuW6tYkMgvn0trHRjw4zJpxym6P4yYO206O
 kKUjUDNuvpE1YtwQ7wSOL7YJduS3faNnYnY5BAUxbesKo3JBwdsLINwOWBHLDycXRiOmE9cMeik
 hQ2fU63bPAn5iMtZiUFBUrK0Xdhtvp3+vZYc/Wto8zrSq+LVSNFzFPn2iP3G0R17Zxos=
X-Gm-Gg: ASbGncsAGVNfUTtnWZxnx+QDrfCCIXgCqlhD0Vj/LsFqPLd8S+SwPGwI8oUBH+UGw19
 xP2RGubie775p3ooSgODM2bTxTo45BUfezhOLMlBGY03KcPB5RkBZCpqvNMgAQXte+ftTDYgauW
 4BsugCDAqJLcGUL1LKjv/kAxItiDpIudL+uydVy3g/Ogj3+me3RExq3DiSpzUMVg/qTLEPoIVnC
 NcsxurZnimEKDNn8lm5ztQnOQCP3KlCJZ6o5WDQ24+naGrA0uCwG6Tk62FsxMGkbRmGJRnJrkDU
 da2YVsarjes7DMMYfdxm9YcurIEAqPbFMSOF6nYkHP6H1PO/Q3DTc13hvFVuXzlpdZAQ8z+TdD8
 xfeYfzADBBSun4qmeED6+hhDA
X-Received: by 2002:ac8:5a8b:0:b0:476:add4:d2b7 with SMTP id
 d75a77b69052e-48e0183cb3bmr54064711cf.51.1746375224156; 
 Sun, 04 May 2025 09:13:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH71qwpN6e0AWx4hQF0CPbGvBpbvyols0nzZVR9KjxAriV0LNGtW7IHLvJUL4f75onAKh328Q==
X-Received: by 2002:ac8:5a8b:0:b0:476:add4:d2b7 with SMTP id
 d75a77b69052e-48e0183cb3bmr54064441cf.51.1746375223770; 
 Sun, 04 May 2025 09:13:43 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94ee937sm1335231e87.142.2025.05.04.09.13.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 09:13:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Hermes Wu <Hermes.wu@ite.com.tw>, Dmitry Baryshkov <lumag@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v7] drm/msm/dp: reuse generic HDMI codec implementation
Date: Sun,  4 May 2025 19:13:25 +0300
Message-Id: <174637445759.1385605.11279102681373913656.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250423-dp-hdmi-audio-v7-1-8407a23e55b2@oss.qualcomm.com>
References: <20250423-dp-hdmi-audio-v7-1-8407a23e55b2@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EOUG00ZC c=1 sm=1 tr=0 ts=68179238 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=ElSFvC5XDyh-nl6B9PUA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: ZJLRYlIx625CwrcEfIX9HST9PEk_T8sB
X-Proofpoint-GUID: ZJLRYlIx625CwrcEfIX9HST9PEk_T8sB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE1MiBTYWx0ZWRfX2s/EjiKy70n9
 4xGEH61AeCcO4cKX9HdsZi9Fj5XzOFraYS4RMSw4ewc4yuFabnDTy2zhyiGzS89eJlpzJET7IA7
 heefyquWDovnoOMCVy5jV8+3RxD1Y7kSQZYPgapaPJrj1EF3JrOF4wiOWik5LnO2cBLVrU5WAsB
 Js+sWtHwfmVaA3mI4LnGbDls3ZiEEDcFzfITPijGLHCHabP8jjibnS7PB2IVFsdIf6mAvl1Yb4e
 HyxhLQzvqgxAMl+iNpgPvJgsgq6YypP6Mi+dUso4FstbiX8VROZGJyFjnt5pl1PfGhhkCCvgge4
 CeSIGx/60uV3iYbZYB1jgQoQoBZPd4zI11jen7u0hoRP++9BatcUnOiXHFB4xjVVSEPRayyILNR
 81/PyjLF+MthB7MYDd+d6EGKN+BagY/QIAxVE1WKUYJlzqwajveuXZbwNfhA3AMVat2TudUE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=948 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505040152
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


On Wed, 23 Apr 2025 20:52:45 +0300, Dmitry Baryshkov wrote:
> The MSM DisplayPort driver implements several HDMI codec functions
> in the driver, e.g. it manually manages HDMI codec device registration,
> returning ELD and plugged_cb support. In order to reduce code
> duplication reuse drm_hdmi_audio_* helpers and drm_bridge_connector
> integration.
> 
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dp: reuse generic HDMI codec implementation
      https://gitlab.freedesktop.org/lumag/msm/-/commit/98a8920e7b07

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
