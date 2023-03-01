Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E4A6A68CB
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 09:19:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6F3710E1E2;
	Wed,  1 Mar 2023 08:19:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C3E710E0A3;
 Wed,  1 Mar 2023 08:19:20 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3216cLLk008645; Wed, 1 Mar 2023 08:19:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=XCu69khBpeYOTovY4nV/xv6Wb4NsMlSDVITdwIxKRVM=;
 b=IlFvFDy3obQJ/P0ffky6IhP+dsvZM+IWDFNgzow9NlzOVpDr9e6K4ZfOnqNXrd3lf+E+
 NSOUkxibahs25RFieGKVcLdPfD+m3IRXA6albr8PvMT6AqlvpZKHy41VJRd7Cdjt2lUj
 bAw2THix//9J8D6INjkgmmTUd70+uHaLeTS+AoSvTv8RtgoQZAamEHDCp5O1qhhYkwAm
 nwp6Aza/bCeJ7irb+MMk41it0frTZohC/pzEei1FUPiRUViMBUAgxldIDw1u2l6EMo13
 QN9Gtz+I/KymCEJENtjxkDISPQHCF9mQ+O0dZK9+6YZ4HQrDqMJH4NwaWstT0Wx/NYgd cg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p1as344at-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Mar 2023 08:19:15 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3218JEYT022749
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 1 Mar 2023 08:19:14 GMT
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Wed, 1 Mar 2023 00:19:14 -0800
Received: from nalasex01a.na.qualcomm.com ([fe80::96c7:affa:94e1:ece3]) by
 nalasex01a.na.qualcomm.com ([fe80::96c7:affa:94e1:ece3%4]) with mapi id
 15.02.0986.041; Wed, 1 Mar 2023 00:19:14 -0800
From: "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
To: "Bjorn Andersson (QUIC)" <quic_bjorande@quicinc.com>
Subject: RE: [RFC PATCH 2/2] drm/msm/dp: enable pm_runtime support for dp
 driver
Thread-Topic: [RFC PATCH 2/2] drm/msm/dp: enable pm_runtime support for dp
 driver
Thread-Index: AQHZR46++Rtzp3ChJkCW70X/5ZQgK67j/66AgAGd2tA=
Date: Wed, 1 Mar 2023 08:19:14 +0000
Message-ID: <511d7b597b68441d8596dcb51ff18a5d@quicinc.com>
References: <20230223135635.30659-1-quic_sbillaka@quicinc.com>
 <20230223135635.30659-3-quic_sbillaka@quicinc.com>
 <20230227233641.GC4062527@hu-bjorande-lv.qualcomm.com>
In-Reply-To: <20230227233641.GC4062527@hu-bjorande-lv.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.216.29.118]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 6EpenrSIfWveMZcOCaDx4nlczSkUH0VR
X-Proofpoint-GUID: 6EpenrSIfWveMZcOCaDx4nlczSkUH0VR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-01_04,2023-02-28_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 mlxlogscore=999 suspectscore=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303010067
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
Cc: "Kalyan Thota \(QUIC\)" <quic_kalyant@quicinc.com>,
 "dianders@chromium.org" <dianders@chromium.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 "Vishnuvardhan Prodduturi \(QUIC\)" <quic_vproddut@quicinc.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "swboyd@chromium.org" <swboyd@chromium.org>,
 "sean@poorly.run" <sean@poorly.run>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c
>> b/drivers/gpu/drm/msm/dp/dp_aux.c
>[..]
>> +static int dp_runtime_resume(struct device *dev) {
>> +	struct platform_device *pdev =3D to_platform_device(dev);
>> +	struct msm_dp *dp_display =3D platform_get_drvdata(pdev);
>> +	struct dp_display_private *dp;
>> +
>> +	dp =3D container_of(dp_display, struct dp_display_private, dp_display)=
;
>> +	dp_display_host_init(dp);
>> +
>> +	if (dp->dp_display.is_edp) {
>> +		dp_display_host_phy_init(dp);
>> +	} else {
>> +		dp_catalog_hpd_config_intr(dp->catalog,
>> +				DP_DP_HPD_PLUG_INT_MASK |
>> +				DP_DP_HPD_UNPLUG_INT_MASK,
>> +				true);
>
>I believe this is backwards.
>
>Only in the event that there's no "downstream" HPD handler should we use
>the internal HPD. This is signalled by the DRM framework by a call to
>dp_bridge_hpd_enable(). So we should use that to enable/disable the
>internal HPD handler.
>
>When this happens, we have a reason for keeping power on; i.e. call
>pm_runtime_get(). Once we have power/clocking, we'd call
>dp_catalog_hpd_config_intr(), from dp_bridge_hpd_enable().
>
>
>In the case that the internal HPD handling is not use,
>dp_bridge_hpd_enable() will not be called, instead once the downstream hpd
>handler switches state dp_bridge_hpd_notify() will be invoked.
>
>In this case, we need the DP controller to be powered/clocked between
>connector_status_connected and connector_status_disconnected.
>
>
>I believe this should allow the DP controller(s) to stay powered down in t=
he
>case where we have external HPD handling (e.g. USB Type-C or gpio-based
>dp-connector).
>
>Regards,
>Bjorn

I agree with the approach. I am moving my dev to msm-next. Will make the ch=
anges according to the HPD handling and repost

Thank you,
Sankeerth
