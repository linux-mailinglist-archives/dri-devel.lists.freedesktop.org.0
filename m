Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2B5B54A91
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 13:04:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09F2310EC07;
	Fri, 12 Sep 2025 11:04:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CuqdSLRN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E962810EC08
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 11:04:09 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fKfo017558
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 11:04:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=uRiYWVeZhrzAaBhip5FSqu8N
 Vj+JbFtrHaupfkSzC2o=; b=CuqdSLRNCdEV/s+X64vOANtGFRmvkltCIFvt4Ewy
 xOYei2Qeg/sF/VMSdAIlrYtP0/Ce5tdo3BTI8sjsWbQtVqOH7W5E7tPcmPu9iu8/
 eITClcBMzIpIMk2mIyA5aMxHzUroJLDOa4HqHAjHJZnLe1H+ZHZPZz6fh1Mre9dz
 rntPktZakUi3N9DjqD6Cmo/LpbDd3fq5URTE4RmTc8deNRHN1yp+Q9Fm4Bl+2kv1
 P3e3WY3zVsNLoVfrAzvtQ/RwG+M3sqJCf7iFn8Y/AkbrGmSFGK+Mo7YdzGM+Qu23
 Y4ghqbneuIMryL05pvUv4oEoRShSO1sKFxJzjgbgpMvmRw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bwskhtu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 11:04:09 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-76a9a9326eeso7731246d6.3
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 04:04:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757675048; x=1758279848;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uRiYWVeZhrzAaBhip5FSqu8NVj+JbFtrHaupfkSzC2o=;
 b=p2ug8WKS2RFZr4zSH5vkKEPKJ51jwVXmDN0jVCxsIO/yt0UzK6kXqgWaNOmLwl2POw
 lNSMqqmyNOzr80JsMBcwmjjVjGcGykq61kYL6zXAHXlJ62IkPNQc/GkFm5KeKNTevU4W
 9VPWbA6Mdqr6XrfmlaG47Ly2w/1ZJld6g2kC4q3TFDNhYeuQB9gL6UxdLKsMz8VxK3fB
 9SV7WjSl4kwChXER7o5Ic5Djy0nGvoF7TRtbj+oSUcV1aI8oV4OVMimuBVgY/nfh0/ex
 7PybI/9sY3dWqStvBQeE90jSBd4OjbiFIuWQySUPhB73qOXYNSpV0zUc+jhfuc9ESrdZ
 fj+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUH1VnbRbqFv5VDOgUrbhPgA/2TubA+RJXGWC3wnSmf5Tw2VjMAOvyvbdXpqJxA88lDAXWsPMzds8k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxCEcsXEtRerZ5/JDj64omPNTXeZDQmHqsSuMVvcdx8+Kvz+T1i
 978lM3pCSKIF+qaAZL759PRBGKr1NjpIWRSDawP4+h5kpbeiwTgD5hPOcyCjNBaIsTcHjeNJzUP
 NSHodECw4B9rLmIFoVbbdLQ02mblf2DmPQhErWIKacJrWn5FVrZXcLtaVDmxhf4uXBr8jq1w=
X-Gm-Gg: ASbGncu2D9VYKUczT/fj6D2uhyZ+3YLhcTP44JV3RNPSyAhhwzpmaRX69qoDC1lk8W1
 C7yvBGIRM66ltEDdBahmzU2jq6Ab716ihYsjRENNxXpsn0hA1yr+1ucEkdhH6qzNjgwxpejdwYY
 oirz/w56tPHi7E36hjjNGlRJZlAyWYV8MWwTPz/oJUA5B4ve/XMSMP82YPt4889KnGlhOIuVze1
 S7ImzLC1CvHOM9/AQiZjCcoxSIvzhoFxvuso0uKBhTo+Mex6TXlzy/wh0vmlUWxnICc+2xKOJrw
 fvnbsL/+Vg/kf3djPrWlSnCcUOG6eQqm3W5D5VeniVQHTYhGarW9nrb6vbQX4UNJSWAuu8xDOUE
 fjP0ALr34bhMsNKAFEUfq+6UWfQXI4q6ZwHyxrfjIbKEx4nnu8fO1
X-Received: by 2002:a05:6214:20a1:b0:70d:d8e8:c5ad with SMTP id
 6a1803df08f44-767c50643c3mr31652886d6.50.1757675047517; 
 Fri, 12 Sep 2025 04:04:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGWK5ie/2oncU/4OssIMnMH7lHSxzphQkEo1qeToGVNk2BXrTzFDbaZYLruQvm7dYwaukXQA==
X-Received: by 2002:a05:6214:20a1:b0:70d:d8e8:c5ad with SMTP id
 6a1803df08f44-767c50643c3mr31652086d6.50.1757675046952; 
 Fri, 12 Sep 2025 04:04:06 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e5c3b622fsm1079317e87.2.2025.09.12.04.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 04:04:06 -0700 (PDT)
Date: Fri, 12 Sep 2025 14:04:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, jingoohan1@gmail.com, inki.dae@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
 alim.akhtar@samsung.com, hjc@rock-chips.com, heiko@sntech.de,
 andy.yan@rock-chips.com, dianders@chromium.org,
 m.szyprowski@samsung.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v5 11/17] drm/bridge: analogix_dp: Add new API
 analogix_dp_finish_probe()
Message-ID: <xaasoza4346jao6ihbdb4payecfi73qekaynkfa2vqqdp2slb4@2onoar4qvw6c>
References: <20250912085846.7349-1-damon.ding@rock-chips.com>
 <20250912085846.7349-12-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912085846.7349-12-damon.ding@rock-chips.com>
X-Proofpoint-ORIG-GUID: WeVNZoQNFlIq2Xrp7KPMo7yXMZaBGQTh
X-Proofpoint-GUID: WeVNZoQNFlIq2Xrp7KPMo7yXMZaBGQTh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX0H+vPnZDYPiJ
 UGzQk4Yev40QkUAhhB6j6AQLo0wKuvlqk1iIvvt2GczcIMtXMJzeK/NDKYxupdoct5xvaOBlHbS
 EFjBifrzGlRI1ac6vYRj/gTb348nZBfopgcR8COOA7aBuHMEClBuABq4ep13RVEsbqnUlH+ySf3
 ZKPm1op39GUYFIq2HCQVOjAVCGFwAwr+eax28S79kPRevBPB1y9wFm51kBmK3qL5hFLB4woDZqa
 GcIHac0XqjtlyeCn0GlmJ0WC9rV1qNoeCyvZMpa7441a/Gp/Roprr7eGgf5Wgvo7mss2VxB/cKH
 pEqBqR3fHP3b82booesNkwjoPFecpGsXCi4By8EnGbmBNiQt9Cz17X3+VHCneFDOLslS7Z1AqgC
 bKqckJyG
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68c3fe29 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=RmiVBL_TxkOMKIEFt2wA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018
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

On Fri, Sep 12, 2025 at 04:58:40PM +0800, Damon Ding wrote:
> Since the panel/bridge should logically be positioned behind the
> Analogix bridge in the display pipeline, it makes sense to handle
> the panel/bridge parsing on the Analogix side. Therefore, we add
> a new API analogix_dp_finish_probe(), which combines the panel/bridge
> parsing with component addition, to do it.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
