Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3137117EF
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 22:15:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A72DF10E759;
	Thu, 25 May 2023 20:15:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE0010E759;
 Thu, 25 May 2023 20:15:15 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34PI0R47030915; Thu, 25 May 2023 20:14:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=wl9K5q4yBSj7UvRgOUmsizD3SBlxsAevLOS4aGiyrUo=;
 b=Gpf0bZSXiqkLgHifBzzVgTFj8gF8tg3BzJCNrOkt4F7/TAacx7zZ0BblhYpC3lGXVJ//
 ChlAX5rZLXrtcbx8kPguTH8d+YJg92P2eeqUrI/7TQYkAPVEA3jlUm7ZMOOtlB6q3uJC
 DXCqPzlMwl0ozDSL8Y7eG9OvNfbsfqGkMk/QmDDYRGoXuVAzcSuhjygN2CqVz6bmcoFr
 DWgEAXpwFPJw3M8iBFIVkmpcJqJnQoreEkmXznY8+7ZEE73zlnUIyP/29yMP5Acwyot5
 Ynl4QWju27NLG02WQQyKY6vHuIfydQq0mKT4ksimSKwobERJFZma3FABusfhAxZMQxzX Qw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qt1tqssep-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 May 2023 20:14:57 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34PKEurR026410
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 May 2023 20:14:56 GMT
Received: from [10.110.20.135] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Thu, 25 May
 2023 13:14:54 -0700
Message-ID: <3acac6c5-16a5-ed10-11b8-03df44eaf065@quicinc.com>
Date: Thu, 25 May 2023 13:14:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v6] drm/msm/dp: enable HDP plugin/unplugged interrupts at
 hpd_enable/disable
Content-Language: en-US
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, <dri-devel@lists.freedesktop.org>, 
 <robdclark@gmail.com>, <sean@poorly.run>, <swboyd@chromium.org>,
 <dianders@chromium.org>, <vkoul@kernel.org>, <daniel@ffwll.ch>,
 <airlied@gmail.com>, <agross@kernel.org>,
 <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
References: <1684878756-17830-1-git-send-email-quic_khsieh@quicinc.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <1684878756-17830-1-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: n9tKrbyvt0snvnE4TEvW-1L0iCocw5P9
X-Proofpoint-GUID: n9tKrbyvt0snvnE4TEvW-1L0iCocw5P9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-25_10,2023-05-25_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 mlxscore=0
 spamscore=0 bulkscore=0 malwarescore=0 mlxlogscore=489 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305250170
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
Cc: quic_sbillaka@quicinc.com, leonard@lausen.nl, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, marijn.suijten@somainline.org,
 quic_jesszhan@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/23/2023 2:52 PM, Kuogee Hsieh wrote:
> The internal_hpd flag is set to true by dp_bridge_hpd_enable() and set to
> false by dp_bridge_hpd_disable() to handle GPIO pinmuxed into DP controller
> case. HDP related interrupts can not be enabled until internal_hpd is set
> to true. At current implementation dp_display_config_hpd() will initialize
> DP host controller first followed by enabling HDP related interrupts if
> internal_hpd was true at that time. Enable HDP related interrupts depends on
> internal_hpd status may leave system with DP driver host is in running state
> but without HDP related interrupts being enabled. This will prevent external
> display from being detected. Eliminated this dependency by moving HDP related
> interrupts enable/disable be done at dp_bridge_hpd_enable/disable() directly
> regardless of internal_hpd status.
> 
> Changes in V3:
> -- dp_catalog_ctrl_hpd_enable() and dp_catalog_ctrl_hpd_disable()
> -- rewording ocmmit text
> 
> Changes in V4:
> -- replace dp_display_config_hpd() with dp_display_host_start()
> -- move enable_irq() at dp_display_host_start();
> 
> Changes in V5:
> -- replace dp_display_host_start() with dp_display_host_init()
> 
> Changes in V6:
> -- squash remove enable_irq() and disable_irq()
> 
> Fixes: cd198caddea7 ("drm/msm/dp: Rely on hpd_enable/disable callbacks")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
