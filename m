Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF9DABBBAB
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 12:59:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 183D410E3D6;
	Mon, 19 May 2025 10:59:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AgMTqKBm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C917010E3C1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:58:52 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J8v4K3021956
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:58:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 P97x1i15pR0DFA8r2mBaSyn//YiqASvzqBgFrFYv0Xc=; b=AgMTqKBmMNCFRM3d
 QmR+FeI7IoPU3llq3T4SCH2Hfx8Oet0nJ/zWjbnHMg5qQKZHW2qhJLn4I32vWn1S
 H1WjjmW4q32mwrRmapFrMFAzwTo5UXwChnWes5kAuGwYkYM5+kFImwG2SSMZB7sZ
 tEjMXc//6RKqHdcXXj5978JejS6taGAXEjRUDrm88wtkUsOWYEQARJXuoF1Wjj7J
 ZIYzmgKcoYZ5a76Y/l2jL+IjOKL/PjpzTVUGyTP1rLR6eXpHEIs1+qV/pUO+X8hi
 XEldOAP6lKYg0454DFIFsmcqoyOVHYynk7woKlVs5XShCB6YZ52tzPNB22kvNk4J
 rbTWoQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjnym4fp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:58:51 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6f8d3f48f35so21490826d6.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 03:58:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747652331; x=1748257131;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P97x1i15pR0DFA8r2mBaSyn//YiqASvzqBgFrFYv0Xc=;
 b=MhcTnv1nRHNA//nItCTxgNOdf2dAoXc/q1+rWk1OfsehFy1QtH/LFQQmUSwp5CFw7E
 tR/dan6RROJ1Okaus87kwqQbxEHWU0+q8KFp0fT5PPhbVtzrdMnqz+Kybq/7SCeQIpzB
 dpgTKV82yiPEaXQFpKXF9zFKvzLcRAxJNK24wNXdsnhg+JT3dXAjazAAEO3CiJFeRsq7
 2ZHVKVeG9EM3t9IEIUxI+4eDQ1IQUKmiWI2GKr2xnXxE9wfZjRDdyzNsRibyRtQRKWYu
 +ZBzuVZxlTJY8Lf1/Brrdwr2JFb5Pd//xCr6mCeDkwjTd/oC3Ywe3e7Isdd8aZN9Uqg+
 gwcQ==
X-Gm-Message-State: AOJu0YwH4RDlMNda8yAGnNXJqohkC/nmTvzj0gpcZPFPp7EHFs219MbW
 qeGd/StjVTFah8DOWo7MGjSl/z5Q0ALhfP29e91eK5qgs+BCpHPhKNynEqWE4g1YhGW4pD28cxa
 Evb6pimU+t5XfSTeXBHZ1jTQW7rChuqD+pOGDBTPLo2E+e0bDnh3KMgdzISHriqITgxhR8EI=
X-Gm-Gg: ASbGncutm3HlElOlcHo4AgphTykJNY72SaxjK20D7BmZ1NAUtX+U7SO//x/jqIgpxgp
 YyIN0iCMHLp5pWstOK5jp2p2MSKSS3HfcPlT2ikWNmGeBGlpuds3xhB/f301cDzGqzGO1R7AJ0m
 MN1i2OI5O81y66xGSKDbfJacX2SKBPqNQtU8X+fR1Z2MZsDJZGmDg0pugSP8kLjR792Pfstm46i
 ui8BqHYnFN7+6g5nMOd987wMjTApmVVjcD0eUy1PV8fswRvUgqiuG7F8rENTFEkT8AxWj//38dS
 WQkI+OrCoNkWGU5RV0MQQcmuCd6tBSmIVW7Fd7RF6irNhNeDJoGIps+zqbvXLxQYfyuDa4sRHED
 gdJnmsszd/GN+fCFG/NVvYhUi
X-Received: by 2002:a05:6214:1cca:b0:6f2:c94f:8cfe with SMTP id
 6a1803df08f44-6f8b08b7479mr224935616d6.23.1747652331148; 
 Mon, 19 May 2025 03:58:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRauQlOm++SfaTq2hFhTkCOAP4U1NEnYr+eOjzxOglAC03Q1vWVud53//B6i/067FYK6Nu1Q==
X-Received: by 2002:a05:6214:1cca:b0:6f2:c94f:8cfe with SMTP id
 6a1803df08f44-6f8b08b7479mr224935316d6.23.1747652330775; 
 Mon, 19 May 2025 03:58:50 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e6f314a2sm1801140e87.77.2025.05.19.03.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 03:58:49 -0700 (PDT)
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
Date: Mon, 19 May 2025 13:58:35 +0300
Message-Id: <174637445759.1385605.11279102681373913656.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250423-dp-hdmi-audio-v7-1-8407a23e55b2@oss.qualcomm.com>
References: <20250423-dp-hdmi-audio-v7-1-8407a23e55b2@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwNCBTYWx0ZWRfX7JMjUszJGrTk
 v5+w1EeSGXgLp+DOMO/RYoC3jWI2GSrABxvspO+gnofAsW7KUdV9kWsqt6+YeCeh7edVNiSC5V7
 fExmVekCkA84EYlWzcGWFJSGXs2vvnC2JlAl7zhulOipUMpAFAdePkpIQVAvGfU1XppRg7eBd+S
 KteQE569wBhMXZcB7IaaEOHk4TKNaIA9cgY0VEOCrefH2DroTctcEwfIFnOplecLGSTg4nBV7Kd
 fsAvuVMcB9GfV1TCgm9qwnWZ2gHU8zGvvmchMHNSEAolbI7Es8beL77jgaB1YMzn99Dj/g4SPId
 9caoyy4mnSxQaDt/3wwyi8k5++pfYJxeZofjsnvrPxmBKYiMrdmlaQg9DrdaPMHIarBaNWhcB2C
 3VOZxABO85w9+pw744PRiBEeQsyfWk8sxjYKFYEIeUubO4cko4FA/IjdAnSOYvQZXv7O0jBV
X-Authority-Analysis: v=2.4 cv=Z9XsHGRA c=1 sm=1 tr=0 ts=682b0eeb cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=ElSFvC5XDyh-nl6B9PUA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: A0wvzPPM3qFeBDp3R2Ct2DMtPgo6n0lc
X-Proofpoint-ORIG-GUID: A0wvzPPM3qFeBDp3R2Ct2DMtPgo6n0lc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=952 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
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
