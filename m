Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96188CDD1EA
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 23:32:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAC96113142;
	Wed, 24 Dec 2025 22:32:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nHdIk1d9";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M0kzRVqP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51D3A113142
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 22:32:34 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BOMGxMR3670199
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 22:32:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UraNFuYrxpgysjCGoBJLWahHGNJ2HdExFYPsS3LkjKw=; b=nHdIk1d96Qc6MtkX
 xuvXp/Zbi6UWSasbYHp5vrUsvuW6ONDvVuD4YhdeIkQeli60rQRn0B+IapRcPmtu
 bA+yn/4P/jRcga0RPZqlbubnY8u/SYKA1rb2tct2YleWM5jAJRdXuzAB7u6oVzRp
 6fJdt2KfdwCxQUxSo5ejZac6gkbEFft1VO9cZ1e1MGc3bcOFCpMIPKql526f9NJF
 W783TpjL3LzjyO7lAv9BZgdd3yxY5rn6MTLB+gquC+uOG+7Eh6UbYs0Mbq56WXQ0
 zfnqQ0TBm06NuVdpu76zM8JgzZR2g59EDvRf7T72H1Aq7cnS5vRh+mVe4rv+fYOV
 6+PoGA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7x46v2qk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 22:32:33 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4ed79dd4a47so132286061cf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 14:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766615553; x=1767220353;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UraNFuYrxpgysjCGoBJLWahHGNJ2HdExFYPsS3LkjKw=;
 b=M0kzRVqPb7LAFQGt2jZP/JiNWCMKPQMvLcttfDUKjiP3bIryeAhB3Pc4sIQr/ZLQ/K
 D2BfEY+mXJ2E+CLMoHiGX3Wua4M2quS2Q2GphcasfszpVfrRxBll80hVpMLKDUVNABIf
 bzVL3CKNlC5/5C61PlonPBaIJRftrA4Qc26RYxpq53CxNwibE1VKcucq3uFlDErvVnFE
 bHSty7FYYK3/r2cYfuG26SdjwXXVm1LI1Z1ewfXyjLMjeRdqLQNZonRb+2GTteopzt09
 xSa0ANq/WF8VwJd00f4ZUARxYFjPdjpnSd3wNoF5Vd5KOOVRsUmtoJEJjx/pQlmXPh4u
 kmmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766615553; x=1767220353;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UraNFuYrxpgysjCGoBJLWahHGNJ2HdExFYPsS3LkjKw=;
 b=Otab0ztTMjb0tsHcSZUhx5Am0Kba3c5e5dtYSqdS8232kU3k8beYiQueA020JzCnvr
 Mg3VDynU3eJM3xqgXLPBjUZ/ta2IvuMlq8V+aBcOfW244E4Tp5MS3exkuzcAXtsEWDeM
 JMlwaiVNrZmZPJQaIYnVYGxJbO5GKKw5cfNgUeMI0262sXDPTGidhpwZbPTSN5vpzrVC
 wGmUSZshDPZ4mIUhlFzuLwGmAH/SZZrdhTSfgx2j34OJjFwn6nF18zZNMkDKUtDvSWYL
 7v8J3VSZTEUw/KftgtdfeFknKlL/OBShVMAqEWr/1s2WqOZhCQvEpjOMtgRY3M9WXEO7
 aViA==
X-Gm-Message-State: AOJu0YzntZSogz+G7FaqcFJ6E5itxX122cXooDIMnf676U8QuTzQDeyL
 ArMYyI2uSZ/d/S4K60KJMgVf9EH9tpEFdmWxRZj9ioH68SdfenO4gCMXjafGs50ocR/ja6oCcOW
 WkFMk/FYfktNe/z1XihttKHzTzUJZ5B8WaUM/vXPayoRFzorRJjLTvI18BBXmKKu6IoQsCjo=
X-Gm-Gg: AY/fxX4sR9llUDdLCsIB+D+c6no1T6FhETE4app4HHjtKkmOep5KnQVl0bYsUNLLiC4
 BC6qfUQ0awTF9lO4mVr2SeacMsCFG6cvvvGWrd+FfdGdcdwlaYFR8g4MRgAgCqB0Lu1PeKlHjWh
 olJEI3exTPvrbVwCq3LWDieiwA3UdZmPxIyqQk+2foNbBDuMVPanpfK/97MkDJXqFtMTB79wKsm
 LCfaAZwtqTz+FZPOP1MDACVx50gchCa96ypSn8yAk2XqnBm8ch9ANeEwF/l8tAchQgCar9jlWUg
 zb7iRvnWMSC+RiMjqnwX8ljkSPbeHN2WBCU8Y80PJ2gZA1iJog1ToAMcgue6mrtloMQFPGc3NXs
 tZDIvfeCboDK1KWR2kvnux5tDZotauvYJaLjNJB6Z6TS8dFrtGWRAMpZjyXLB3XDdTSjZAspI+C
 NpCFD/PstUE/tqTnzhklBKQSE=
X-Received: by 2002:a05:622a:4ccc:b0:4e2:e58a:57e1 with SMTP id
 d75a77b69052e-4f4abd1fd20mr319277381cf.37.1766615552551; 
 Wed, 24 Dec 2025 14:32:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGn3E7ooVJGy2fcsFLgGKtHFkRwVCp/umZC4k5RBMwllPtRmK2vC1IGq6txC+42jL9b+1gxOg==
X-Received: by 2002:a05:622a:4ccc:b0:4e2:e58a:57e1 with SMTP id
 d75a77b69052e-4f4abd1fd20mr319277151cf.37.1766615552154; 
 Wed, 24 Dec 2025 14:32:32 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38122693ad3sm42746951fa.49.2025.12.24.14.32.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 14:32:29 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
In-Reply-To: <20250803-lt9611uxc-hdmi-v1-0-cb9ce1793acf@oss.qualcomm.com>
References: <20250803-lt9611uxc-hdmi-v1-0-cb9ce1793acf@oss.qualcomm.com>
Subject: Re: [PATCH RESEND 0/2] drm/bridge: lontium-lt9611uxc: switch to
 DRM_BRIDGE_OP_HDMI_AUDIO
Message-Id: <176661554772.2411515.14289224108428205133.b4-ty@oss.qualcomm.com>
Date: Thu, 25 Dec 2025 00:32:27 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: v4A-LCbyyRNWQqFBa9FxbLfKKYNIrGQE
X-Proofpoint-GUID: v4A-LCbyyRNWQqFBa9FxbLfKKYNIrGQE
X-Authority-Analysis: v=2.4 cv=aOf9aL9m c=1 sm=1 tr=0 ts=694c6a01 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jdnYiPbrDYKY_qMFIeYA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDIwMyBTYWx0ZWRfXy/Ti41Yas4iL
 M05SIgqoCgtsQeGC16I0p5cqsW1pJE/wCG/jxmXj03tlIeyVlKnay11IUojhUUdJjk2kJrv/WuZ
 3BvjRLPjWN67unjFWdCkUjFMSiDfZyklFnOPa77wOFQkFV+fg8D6oXdfIkEpWVuvH4t8JrnkCCe
 1pRYZTH9xjZnzRl8vZ2Uc2vcX6TtnC/3qWxN/NhWuAPrrmwirygSB1Yw+Rs4tMfd1QWo+R/oP5D
 56GbWJfytMDWaFFY1pK1cQX09pfZz1WTRhsxrWx+bdDvraqb6chF71AWVhgOLSyThGaakRoB3WP
 WlZxT2yDT3SoI5dWk1fPw053XN4h6lP88MG49otQsQa+4H7qd3f+7Rhd0NcjY/I/Ybk+JO2jD1X
 eJYBVVK3eC0orOfI2ysSIbqiSaX7+iGGYFxqXRgW5s/q/hehVHZxm2/jXJg2NF3qXvrfjGlUXsD
 zXpa79sfXp1doiCROgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240203
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

On Sun, 03 Aug 2025 14:53:50 +0300, Dmitry Baryshkov wrote:
> Use DRM HDMI audio helpers in order to implement HDMI audio support for
> Lontium LT9611UXC bridge.
> 
> 

Applied to drm-misc-next, thanks!

[1/2] drm/bridge: add connector argument to .hpd_notify callback
      commit: 8a717c16ddf261118e9128d7f146d68a2567f087
[2/2] drm/bridge: lontium-lt9611uxc: switch to HDMI audio helpers
      commit: c08c123d4cd6ec3ee482d607e29388d0db2d3f1d

Best regards,
-- 
With best wishes
Dmitry


