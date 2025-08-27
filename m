Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E07D1B38798
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 18:15:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC20C10E85E;
	Wed, 27 Aug 2025 16:15:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WgVXKxWV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2E8410E85E
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 16:15:01 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57R6k9U7030084
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 16:15:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 72Snl19eM9SG13obf5lnpG+wAP1deg4gz5g3WQbmbnU=; b=WgVXKxWVJuRBsVz9
 XHDVQMH89DBN52LZM0i6JeZ4HCO9BuZ+WqFlW+VLMi/eo3WJWoTOFmZ9dqk7WD9n
 gexfdNriIyYI+ZBpsbjCX4VcJO5mNo7yVDWfCqBgY56v6EMaaU5mFcaXO4gXKKYt
 5kr87RDxfNTDSA28KzPnSE9m32vauXAfpsRUCw8xgtrmcVg30I815WVOQI9ZKNVh
 4MeJ0ttIpcouCf9Z659WXuzLiGmyIfWFPZgmr4piBzXGSGSMWEsFvc3FWa/70htd
 AXv3ABUIQ9tWJTgnkg+GQtG6wS6Zoc5CqDYoAOVFPLieKtbT710xZQVDaqWZ5eEv
 ZjXmDA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5unw37n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 16:15:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b109affec8so42661cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 09:15:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756311300; x=1756916100;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=72Snl19eM9SG13obf5lnpG+wAP1deg4gz5g3WQbmbnU=;
 b=KS1NpqNFwvczDFB3SBgmvF+qI9681lLwHGtyUykfO3CZjmiWkUZ/WA/jlmVw1+N3CK
 EDBVvfO+nY1RNQK6i1Fw1neJMhI+RynKklTIfXTh72eLl3n3U0tsJ3fyZRIvQ/HEoaY3
 I7NYCG1zs7KVzvmqKuhsb0y9QH314dAr+Xr4fKoOUN4egluRqqhiSjJe4DNJixNlEEMO
 42FILCKdIgv459++bLp6yvFX4b6xAxg1DqpzegHqEhZjaOVLiOUZKCKupKYCg+nk2J06
 QE/XhdaRE7a6ibg9hqFcrb9wSo6HIgdGx85k9Af1KueZikUI7Oqmr+wA9ahaYu+Fekve
 BkJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWd2O/MhFils4msIAoMRwNn/DaPMwziLkcqT3OrTPt/NPBOtYMIp3j5D2TUgVpnYIjNgkuWkX4VflI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyu6hEzJycidKbw5B2ARPSarxGLea2YZLvyYmd+bhAdRR73ldnM
 EnJYsJPKKgHQXwej+YQbw/QAQHDdEMH6eo9pOftn/+WT758Q/SLxL+P1im1B6KmxOKXNy1C99Mn
 wZyo24fDZURiqB6H8CaecxMne4zWfRydeDlQ7jKkhmVQ2l0a+o4OdpWWMBSrB5AbNoA9p8Rs=
X-Gm-Gg: ASbGncuu3WVWCPo83d9m9eHA+E/wPHdb2qTXtsVmd8FXvW0ooVBbn9ZeMhb9r6YJMk2
 O5oEGsxnPCEbN9kHD3wCIleNXDTgTh/nHzdsrFREBGuKRWdDInWx19wQFJWXDKn118qruDuxQI5
 ssj2eFpA4AYydj4CO4GaFlKEx+6bOwRX+8PwfQ/YaCDthI8FNARFf0ciHtzbGEcZ/PjP2t+HGCF
 gKC04h4UA01I1y6uq18yqA0/KOtIHRpaYn0zi6Ihpt9fqZgNHcOsRO+5U30BfW261vVvSat1/Tl
 moX2zOLfhhMhZGkSP8OgLFosa8EfiinbzdxCxApjTWeWOB3kNRAdXBy4OAsBP4sc5IucUIgGeep
 jrTs/ZUNDusBeB14mQ40df6n2pOcPK6shHxknphMyBsgCnQ1U5lGN
X-Received: by 2002:a05:622a:4ac8:b0:4b2:e0ac:63b0 with SMTP id
 d75a77b69052e-4b2e0ac6451mr82573231cf.77.1756311299638; 
 Wed, 27 Aug 2025 09:14:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPzGcbfBYbuRl3Du92a0zsaKioL4MbDCRH7YFgTAKCluORsEyl5ZX6nTkAvEBJ0xy1YynMxA==
X-Received: by 2002:a05:622a:4ac8:b0:4b2:e0ac:63b0 with SMTP id
 d75a77b69052e-4b2e0ac6451mr82572361cf.77.1756311298937; 
 Wed, 27 Aug 2025 09:14:58 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f35c02020sm2863442e87.29.2025.08.27.09.14.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Aug 2025 09:14:57 -0700 (PDT)
Date: Wed, 27 Aug 2025 19:14:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
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
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, quic_lliu6@quicinc.com
Subject: Re: [PATCH v3 11/14] phy: qcom: qmp-usbc: Finalize USB/DP switchable
 PHY support
Message-ID: <inxoswyre3qalrb3dj3lz3b5vmnpnkyy3hh4oum3z6p7yqlo2v@7g67yvvb25tc>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-11-a43bd25ec39c@oss.qualcomm.com>
 <jjsijdmh4hdbgd2boebtrmzvblvhz2hnl7mtv5ga76ine2fnsb@i72dz3r4lbjp>
 <82d19340-b887-4093-9d24-4b2e19b99f8b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <82d19340-b887-4093-9d24-4b2e19b99f8b@oss.qualcomm.com>
X-Proofpoint-GUID: Xuyl6etE61lkHKqIAUj2knBX5RI0wYkV
X-Proofpoint-ORIG-GUID: Xuyl6etE61lkHKqIAUj2knBX5RI0wYkV
X-Authority-Analysis: v=2.4 cv=JJo7s9Kb c=1 sm=1 tr=0 ts=68af2f04 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=M2k1YX_etJ5cuwz7zUoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMSBTYWx0ZWRfXwLloYt/IxB55
 YB+Sq98dJ4b0jv9eybSfJKyNx2hvvF9/dDgxkGxL61MuA+PeH8EJq643wG0Aq8nP6II5Y552JZA
 a4EEjQpwSVZUvq+x9kBzp9VFWPXWfIBqCTvI9jlMgJeKYXPIHDclmhbBB2ohaKyRFAwVQIRw4pb
 PdUGKIjjllyo3kWt2qwab98zhau8yNqx3/jlCbSLtXgYiDcdXUkwxOB5cr6tWUbOPOwGl00/eQP
 7wMbnCM7g2l3aHjxrT1+iFgS1Ae5t4lWVLjMSSGmk5s2cZbxLUDLAD6DiGLc+UrJR6mPaWYfySh
 hSzf2k4lKXF9Vv58hZ+JVnokp+jQ4UsUZOJ9s1qCRRdh/UdHrP6yRfhLlN7IvgewGiAnj12RHY1
 OjCcCnJD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_04,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230031
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

On Wed, Aug 27, 2025 at 08:34:39PM +0800, Xiangxu Yin wrote:
> 
> On 8/20/2025 7:42 PM, Dmitry Baryshkov wrote:
> > On Wed, Aug 20, 2025 at 05:34:53PM +0800, Xiangxu Yin wrote:
> >> Complete USB/DP switchable PHY integration by adding DP clock
> >> registration, aux bridge setup, and DT parsing. Implement clock
> >> provider logic for USB and DP branches, and extend PHY translation
> >> to support both USB and DP instances.
> >>
> >> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> >> ---
> >>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 331 ++++++++++++++++++++++++++++---
> >>  1 file changed, 299 insertions(+), 32 deletions(-)
> >>
> >>  static int qmp_usbc_probe(struct platform_device *pdev)
> >>  {
> >>  	struct device *dev = &pdev->dev;
> >> @@ -1703,16 +1944,32 @@ static int qmp_usbc_probe(struct platform_device *pdev)
> >>  	if (ret)
> >>  		return ret;
> >>  
> >> -	/* Check for legacy binding with child node. */
> >> -	np = of_get_child_by_name(dev->of_node, "phy");
> >> -	if (np) {
> >> -		ret = qmp_usbc_parse_usb_dt_legacy(qmp, np);
> >> -	} else {
> >> +	if (qmp->cfg->type == QMP_PHY_USBC_USB3_DP) {
> > Should not be necessary.
> 
> 
> Got it. I’ll merge the parsing logic into a single qmp_usbc_parse_dt function.
> 
> Also, I checked the compatible strings in the dtsi files for this PHY series
> looks like no current product uses the legacy binding. 
> I’ll drop qmp_usbc_parse_usb_dt_legacy in the next version.


No. It's _legacy_, it has been implemented in order to support old DTs,
which existed at some point but then were refactored into the current
state. You can't randomly drop DT support.

> 
> 
> >>  		np = of_node_get(dev->of_node);
> >> -		ret = qmp_usbc_parse_usb_dt(qmp);
> >> +
> >> +		ret = qmp_usbc_parse_usb3dp_dt(qmp);
> >> +		if (ret) {
> >> +			dev_err(qmp->dev, "parse DP dt fail ret=%d\n", ret);
> >> +			goto err_node_put;
> >> +		}
> >> +
> >> +		ret = drm_aux_bridge_register(dev);
> >> +		if (ret) {
> >> +			dev_err(qmp->dev, "aux bridge reg fail ret=%d\n", ret);
> >> +			goto err_node_put;
> >> +		}

-- 
With best wishes
Dmitry
