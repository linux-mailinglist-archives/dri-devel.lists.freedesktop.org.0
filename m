Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EF7B3FA39
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 11:23:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3DBD10E610;
	Tue,  2 Sep 2025 09:23:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iifSQy9p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92CA610E610
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 09:23:34 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822SGp7030247
 for <dri-devel@lists.freedesktop.org>; Tue, 2 Sep 2025 09:23:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Ch/LhY4Ftoj00uev1yGdlcFF
 tJHZQ9xg8w0D9kgtUtE=; b=iifSQy9p3IEu5hNQ/ysGtvHwuEFAAtMxJbSFFxCS
 1HDtjhOMn4NA5Wwok95SBz9wNOiakQBHMMAtX9eObaDZT7dnRahZoOHXnTrMyVQD
 +zKZ7DKnPxghc4nF5imAfu1x+SY6qI6m3CBSh7V0QqIMgWeOJhFBFqUWUBmN/chX
 vRCgSRsi6u0n6lXU9UbuO+Iyz8cw/xKJg2lNUscGlabDJlZt9Va4jKcW3u/TO6ow
 d/MAq2L9C+wAXlY2vU5r3M+bj3qmjfb0oDEEDJdGRWvmbt8olJacHDFZCYwB6oLS
 Oh3G0mT8xmIm9jo3HG/t305jCNRGdvOVrvyBdH/7+KGb5A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wy33bb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 09:23:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b32d323297so40834951cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 02:23:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756805013; x=1757409813;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ch/LhY4Ftoj00uev1yGdlcFFtJHZQ9xg8w0D9kgtUtE=;
 b=HNj5qCSvovkNjo3NrEgqu8e86ewyxAUyAwA6FHe4eCwlCarPVBneGyjWGaxTOIIfPU
 B1TVq5w+Z1XLe7ZzaUOybiapH+1BUrkpOPVj8Txjo+Gzqg5/pk4vgHt9yFG5UMcJVgle
 +dZT1k6vVuP7D553mxG1l28a+Ekc0pynDSBYN5YHNlrofj4fMlCQzJDxh40cAeeDtDYB
 YcJPdw8kmqEm/hdBGbJysEtXijwnQRDkzxths4sIc6e3hzx6ZL3Acm13CV+QZfW/svGH
 vsllu3y0tWA0QGvt/0cHTjLB2Vo5RwLXZ6yz3KEqFBVsmWw32THxEeHcCTZ//h6x/Yjw
 lCmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxEfK7uWJhOe6lWMzb+mLE2IMfNRpFkE6fIDxm+TIOLqUE43xoLzMDEo+2FMS9krpuJ5qb8S3TNGY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNsXN55XmHrRrPIujeCCUIHpT+L/2xucfK+OYZSUdIRVmgBNDm
 lQ7Hz9VURpRd70wWJmFBHlwIiG7lx6eTlGG30p9gJgiYhUP9wK8bibTRatthRnSFthx9Qw3PXYb
 yiObZuWiEf55xiaLXXqn76KM+q2kg7Xex6V35w+QZxxyeowP/FT8IyW93Yty9Uxm+PrIQqGw=
X-Gm-Gg: ASbGncup60LodGj+QMKQzRUFktaz6r40rXGr4KLbs9kDXRLMTCQIVeYGiQgkg17osVY
 WIIYdeKJ3+mmWZIjm1c5ke5nA3theIgU6TdpexveeZiBD4jKBijNk+O+Q72ZqhIxhy+fozouLDn
 7lpOsi8+bzFvw4gSZ7/IopaLWbcVToj8T7uOhziKeJVqNiyDvzjgX1ahZ57uHBk1MxGT7Wj22n5
 IZQuKxSpqe4yhyj4l4cNAvhcXHrJZaFz9XbDXPuUMR1UA6zVgy8jc9qb90k7b7MSGwutN8GteAh
 YgtouTuKkZxGRmtVNvbL2sDC3OkzQtmzWUYuwjhocCCAHXBnXPsLtgEL48km8xgHSzrE8CCT6f+
 0Gbe2Ay18E/f+CSjRwWEUeWf/t9Onrm4FMDFdngM/bBwp3afKJQ5o
X-Received: by 2002:a05:622a:104:b0:4b2:9bd2:8176 with SMTP id
 d75a77b69052e-4b31d84444emr121691241cf.27.1756805012810; 
 Tue, 02 Sep 2025 02:23:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECcy5unw6WFIHBHq5iOWTGUfamDps6b170cwBunY645CsFBbNJrcuVd5piaxYGqW0iNZ5IXg==
X-Received: by 2002:a05:622a:104:b0:4b2:9bd2:8176 with SMTP id
 d75a77b69052e-4b31d84444emr121690831cf.27.1756805012345; 
 Tue, 02 Sep 2025 02:23:32 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608279ceb6sm546116e87.100.2025.09.02.02.23.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 02:23:31 -0700 (PDT)
Date: Tue, 2 Sep 2025 12:23:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org
Subject: Re: [PATCH v2 2/5] drm/bridge: simple: add Realtek RTD2171
 DP-to-HDMI bridge
Message-ID: <w7lf26lyltduionxhckld76xhi4dsxzhmyfzz5notzt7cu3ixi@xns65dvdejb6>
References: <20250902-topic-x1e80100-hdmi-v2-0-f4ccf0ef79ab@linaro.org>
 <20250902-topic-x1e80100-hdmi-v2-2-f4ccf0ef79ab@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902-topic-x1e80100-hdmi-v2-2-f4ccf0ef79ab@linaro.org>
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b6b795 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=eHZZoxIKThfaNsFTWoEA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: bCy-9d5bsNmt4w6_uSQS9HvtPMv4EkiT
X-Proofpoint-ORIG-GUID: bCy-9d5bsNmt4w6_uSQS9HvtPMv4EkiT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfXxcUD6Y+7gdec
 +ia/0XLiH5FkWiuFkSZexFD+a0r5jsEbSjND6YAQGm+nI6cGiuQj9FErRvYMEPBx5sCPGvT6mqQ
 g1jbP6tx+NCP9zxYY3jGT7CAYowDquqKkjU/Th+cBPR21DmtjAUAQeXKxIq+ouqbKN0VAaecNiT
 3RLOFG6RAnictQRPRL2NvusG8W4BYwX/daEaqXYUxLloWqGNdJ48nDvqWukwyt1tRv1qsKTL9Q+
 MQdfukuFfvCnSEbO4NY3li/SxYTwov57LtPmyyluJKhUQ5RPW/FCQ9yHPchuldLnqo/hEy+Cb0G
 Z1mbNMlJErH9QgvpI5kmiWD+MEuaE7NWQKUzkZUq8h3eKCHRlYupQnFks2AKpD+CEwPgNJ7yoHF
 aDQ59E+C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101
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

On Tue, Sep 02, 2025 at 11:00:29AM +0200, Neil Armstrong wrote:
> Add support for the transparent Realtek RTD2171 DP-to-HDMI bridge.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/bridge/simple-bridge.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
