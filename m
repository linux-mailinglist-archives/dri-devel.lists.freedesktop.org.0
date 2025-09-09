Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A64AB4FF93
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 16:36:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3A3310E734;
	Tue,  9 Sep 2025 14:36:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="i90iwT/3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0644C10E734
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 14:36:21 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LS57030484
 for <dri-devel@lists.freedesktop.org>; Tue, 9 Sep 2025 14:36:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zXGegGJ48SCtTO4w0PCDokld7WbWJN8IL1FLEXJw6Qs=; b=i90iwT/3Lg15lvDO
 +hri2zsxcEqjOzAZ0dNzp6OusuJQuoQKWBDb1KWRd9w88Lm8SY1lDq8wIa+rQD4y
 oiOdvSoQuBbAt/AzRceXd00+w91Ez6MsljUDLN9AggtMb9BgtaASur2oj7zeA/8G
 Zyd9qdfz1g5fOP4lyCIMSr29WLTSfRowpvK80fEdAyiClC5yMRPH31dlyvYXi0c4
 Nq3cYiSYnHQllm450Yny+7ygiYWyo5lRKPSnMsFk1Kvs+GsVs4p/vl72GkOkrSiv
 K1/cUPOMN1KLqyYqxazY6wxU3j3Ihn6pJMn53cN8qPfSYT68lD0ET1R0hTa+2P4n
 8DMhEw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490c9j8m7n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 14:36:20 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-71ff3e1256cso137104246d6.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 07:36:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757428580; x=1758033380;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zXGegGJ48SCtTO4w0PCDokld7WbWJN8IL1FLEXJw6Qs=;
 b=swTdhXn7Av9uGA4qQDR6EJbW1cg2Q4TUWthjd5k/hwrubqBUukxzltqDqxuSVkOelV
 NKLAmspIYHUXmpRFhym0V8Q0sYi1Qf0fVshIEaMYHrxesbXxE5V02XH0BU0ZOdGidTgB
 8kgv5+W63chx955Oz+3zoJvVOrQyZnJZ04HCcLpW+8vLsTRPb+q5Z7MyF0Q85FuIuie8
 BU1mfouZ3sQsVxnMM0OmuxZxc8Ep2BH4KRclz5vMlf4+FXORyHuWULVUWCFRJVaVkwyZ
 2KO06+eWAqRbumC/Q/Pc60rw6hHu/eSH6IycPEbEr3twpK4ZAqB87fPZCbxKZyiQrpPv
 CEHw==
X-Gm-Message-State: AOJu0YyctmRCAPE+XqggS4ZVXeAJdQG9699WSzf7Gry9tWkuH34ZFlSs
 moCd16fhichIIyAdPUQ8J4o8pZPDsJdT6u5b7sKjrPvSoJMrPdEu28HXIts01osg6sUsTBiMBbo
 7X1f5M3Onm+7xcjFFppM5HcrTnvUk7vefvXNSmc94Zqbsq/cpd310n8deR/IxLvyMc9xVbtE=
X-Gm-Gg: ASbGncvMA0kgr6GUpahAR+y5xYUN+cLqXQFufht26tp5A1qk+v6E6XVUgYSLnZt1F3j
 0tF2djRyYjCEsgG4JZqf4gga11xmveGfZOuXOl+q8cd3czxWZslqrIk+blxA8yvEVPAX4Z5ZaqZ
 1qzKuI+/dAVY58P3z3IGfo0AUW4iz7yv+KwEjuTsjv06IbA09ORj/vaCW51RREQZTmkqgbssqqA
 /BLA8Rj5uFAcbceyyU1ig4ePMR7NWwZ/aQ0X4NC2BFNzCJ1OJ83e+WPJqfHzIXsmYDdaq/J6X6O
 vsM1kxb7Uqv/zJ+Z9HIJ07EGT/JZoCJ1O8gP8X1MMqnMoD5xr+EwI24ncKJnNr3C2S4SfX6rJQi
 dSejpYhqPOZc+75rLBVZOVKvJrc1uP4oudGlsVYJcfWhoQHU461g0
X-Received: by 2002:ad4:5cea:0:b0:721:2fac:ba84 with SMTP id
 6a1803df08f44-7391bf469c7mr138686716d6.14.1757428579917; 
 Tue, 09 Sep 2025 07:36:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF77zne3M2caVk1ttaE+RHTc/idA8A8JOQgAJqG37QNc5KMMVGPSFhdpJNJlTAki4xuMukecA==
X-Received: by 2002:ad4:5cea:0:b0:721:2fac:ba84 with SMTP id
 6a1803df08f44-7391bf469c7mr138686186d6.14.1757428579379; 
 Tue, 09 Sep 2025 07:36:19 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5680c424708sm567120e87.8.2025.09.09.07.36.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 07:36:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>, Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/bridge: ite-it6263: Support HDMI vendor specific
 infoframe
Date: Tue,  9 Sep 2025 17:36:14 +0300
Message-ID: <175742856369.1251022.15056942229474893550.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250908-it6263-vendor-specific-infoframe-v2-1-3f2ebd9135ad@nxp.com>
References: <20250908-it6263-vendor-specific-infoframe-v2-1-3f2ebd9135ad@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyMiBTYWx0ZWRfX2mhJuMXSh8VN
 HVoiICanmHadClQiYdFHOS7uYoB3fCaZ23+7tbk74M52loJdX30Zp77Tx/TF+YZwS+WZtYhcEf7
 J9ZV+q1iZnsfG1Kw0eOVp+UlLl6wgHz5d5bQjKfZyMR+R82eW4otirR0UC6TxgT36KHwgfHj3Yb
 m6az/JWkZ/T0fx5bFaoLuaf2p+fFFgHrXryKhI0IoNXT6R2sJ476hqifQclnSXDUWrMNZH1ET0E
 VyAdEoWbo/Vp8yXJifIikXAh2mxnDj/aRIZkFQ5XztBRXg7IcZ8bPx+oKu/MA6N3ybdnM1KQKCr
 K2NLW4NgvD+hLMRNC1LpiwjtNegabbo8S8Nm4lYab4BGtzk4IAzM3C86E/vGNOLR7JBG2SJqqti
 DcyhCTJS
X-Proofpoint-ORIG-GUID: w_qGW93NakBSCCz-PE1V9X9IPFxWK2f5
X-Authority-Analysis: v=2.4 cv=PpOTbxM3 c=1 sm=1 tr=0 ts=68c03b65 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=Rpg_6oIlysUL7RbACEAA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: w_qGW93NakBSCCz-PE1V9X9IPFxWK2f5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060022
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

On Mon, 08 Sep 2025 14:05:48 +0800, Liu Ying wrote:
> IT6263 supports HDMI vendor specific infoframe.  The infoframe header
> and payload are configurable via NULL packet registers.  The infoframe
> is enabled and disabled via PKT_NULL_CTRL register.  Add the HDMI vendor
> specific infoframe support.
> 
> 

Applied to drm-misc-next, thanks!

[1/1] drm/bridge: ite-it6263: Support HDMI vendor specific infoframe
      commit: f50b969bafafb2810a07f376387350c4c0d72a21

Best regards,
-- 
With best wishes
Dmitry

