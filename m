Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D045B5EF4
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 19:12:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FEAA10E197;
	Mon, 12 Sep 2022 17:12:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CF7B10E197;
 Mon, 12 Sep 2022 17:11:58 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28CFjec8000958;
 Mon, 12 Sep 2022 17:11:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Iv8qKl8exsTNqQvL9xoqmkA3Pw1r+M09k9/6mUv3Flk=;
 b=Z1RcikfMAhx0BTEaqwk8qeyWbXnckQXL1g440xEOPzYFNsYtEyUEf64IvxmHuIyRekfe
 uuurx/w8v6n+2pIj/YuoIZz098shiGz6+WN18qDp+QA7KnwmLFhiNH1Gvlp73yT2aKTr
 ljgZsqihjvO6xOA34B0tXF+mjYHl9dTwJmgBM4AUtu4feWaQLyWDadomN1vsEOSKkqCQ
 +nQKKYKPknfAguKvStGTqxtypHkpl4vPExVC9wx6FXWXo8ytDTxafQITHnp02es+sJRO
 BqFz4T1dw2xO+jtVTGr7T/Vi+3xVbzjB8ajVDrz2UZkvHMgWdGJaLeECc+6NSdHZRoRw xw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jgk0ddq17-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Sep 2022 17:11:39 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28CHBcBI013047
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Sep 2022 17:11:39 GMT
Received: from [10.111.167.172] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Mon, 12 Sep
 2022 10:11:35 -0700
Message-ID: <9a740a3b-30b6-05ab-e133-9b37186ba0db@quicinc.com>
Date: Mon, 12 Sep 2022 10:11:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 0/7] drm/msm: probe deferral fixes
Content-Language: en-US
To: Johan Hovold <johan+linaro@kernel.org>, Douglas Anderson
 <dianders@chromium.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Rob Clark" <robdclark@gmail.com>
References: <20220912154046.12900-1-johan+linaro@kernel.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220912154046.12900-1-johan+linaro@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: sbakWlb5mLpCHrY4wynzhCX1VSs1oa4F
X-Proofpoint-ORIG-GUID: sbakWlb5mLpCHrY4wynzhCX1VSs1oa4F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-12_12,2022-09-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0
 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 priorityscore=1501 mlxscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209120059
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
Cc: dri-devel@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adding kuogee to this series

Hi Johan

Thanks for posting this.

We will take a look at this, re-validate and give our reviews/tested-bys.

Thanks

Abhinav
On 9/12/2022 8:40 AM, Johan Hovold wrote:
> The MSM DRM is currently broken in multiple ways with respect to probe
> deferral. Not only does the driver currently fail to probe again after a
> late deferral, but due to a related use-after-free bug this also
> triggers NULL-pointer dereferences.
> 
> These bugs are not new but have become critical with the release of
> 5.19 where probe is deferred in case the aux-bus EP panel driver has not
> yet been loaded.
> 
> The underlying problem is lifetime issues due to careless use of
> device-managed resources.
> 
> Specifically, device-managed resources allocated post component bind
> must be tied to the lifetime of the aggregate DRM device or they will
> not necessarily be released when binding of the aggregate device is
> deferred.
> 
> The following call chain and pseudo code serves as an illustration of
> the problem:
> 
>   - platform_probe(pdev1)
>     - dp_display_probe()
>       - component_add()
> 
>   - platform_probe(pdev2) 				// last component
>     - dp_display_probe()					// d0
>         - component_add()
>           - try_to_bring_up_aggregate_device()
> 	   - devres_open_group(adev->parent)		// d1
> 
> 	   - msm_drm_bind()
> 	     - msm_drm_init()
> 	       - component_bind_all()
> 	         - for_each_component()
> 		   - component_bind()
> 		     - devres_open_group(&pdev->dev)	// d2
> 	             - dp_display_bind()
> 		       - devm_kzalloc(&pdev->dev)	// a1, OK
> 		     - devres_close_group(&pdev->dev)	// d3
> 
> 	       - dpu_kms_hw_init()
> 	         - for_each_panel()
> 	           - msm_dp_modeset_init()
> 		     - dp_display_request_irq()
> 		       - devm_request_irq(&pdev->dev)	// a2, BUG
> 		     - if (pdev == pdev2 && condition)
> 		       - return -EPROBE_DEFER;
> 
> 	      - if (error)
>   	        - component_unbind_all()
> 	          - for_each_component()
> 		    - component_unbind()
> 		      - dp_display_unbind()
> 		      - devres_release_group(&pdev->dev) // d4, only a1 is freed
> 
>             - if (error)
> 	     - devres_release_group(adev->parent)	// d5
> 
> The device-managed allocation a2 is buggy as its lifetime is tied to the
> component platform device and will not be released when the aggregate
> device bind fails (e.g. due to a probe deferral).
> 
> When pdev2 is later probed again, the attempt to allocate the IRQ a
> second time will fail for pdev1 (which is still bound to its platform
> driver).
> 
> This series fixes the lifetime issues by tying the lifetime of a2 (and
> similar allocations) to the lifetime of the aggregate device so that a2
> is released at d5.
> 
> In some cases, such has for the DP IRQ, the above situation can also be
> avoided by moving the allocation in question to the platform driver
> probe (d0) or component bind (between d2 and d3). But as doing so is not
> a general fix, this can be done later as a cleanup/optimisation.
> 
> Johan
> 
> 
> Johan Hovold (7):
>    drm/msm: fix use-after-free on probe deferral
>    drm/msm: fix memory corruption with too many bridges
>    drm/msm/dp: fix IRQ lifetime
>    drm/msm/dp: fix aux-bus EP lifetime
>    drm/msm/dp: fix bridge lifetime
>    drm/msm/hdmi: fix IRQ lifetime
>    drm/msm: drop modeset sanity checks
> 
>   drivers/gpu/drm/bridge/parade-ps8640.c   |  2 +-
>   drivers/gpu/drm/display/drm_dp_aux_bus.c |  5 +++--
>   drivers/gpu/drm/msm/dp/dp_display.c      | 16 +++++++++-------
>   drivers/gpu/drm/msm/dp/dp_parser.c       |  6 +++---
>   drivers/gpu/drm/msm/dp/dp_parser.h       |  5 +++--
>   drivers/gpu/drm/msm/dsi/dsi.c            |  9 +++++----
>   drivers/gpu/drm/msm/hdmi/hdmi.c          |  7 ++++++-
>   drivers/gpu/drm/msm/msm_drv.c            |  1 +
>   include/drm/display/drm_dp_aux_bus.h     |  6 +++---
>   9 files changed, 34 insertions(+), 23 deletions(-)
> 
