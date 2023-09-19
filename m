Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8013B7A6EDC
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 00:53:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF6ED10E12D;
	Tue, 19 Sep 2023 22:53:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 335DD10E12D;
 Tue, 19 Sep 2023 22:53:35 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38JLOoaq007293; Tue, 19 Sep 2023 22:53:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=yFvkAN2U77GZQzYs3I/vg/aVIL6xZ9s/4RXI0DI68lo=;
 b=WPCKnLsYZhN6BwmrysIUYUlg90n9pWY/zcmazsA2k1asDuyTBSfdqCB2T0CoCdonBLTt
 oVydH4SMZxnL5NzSStxs272Uz14shqozZ1YDHXvMRi8p0hS97mzxydYps5p/Q8IMphNZ
 DXMNDAQyAgH/mXY7KaklugF9Jw6ddo0xNzEKc/pGb5f1RL53IkdOYCZlU6RY3Qje4FVZ
 3XnwUS9bAYHtOI+y4tpNV1ng7t3mHEzm41nsaDT+LPeVnW/a5RKSdVi6XXknUA61ie1p
 g6I/SsGHTPO6/jbjOX1VGDROTNmktoqo0jjWip63Vv/6IaWZTEXrQsYiEw0smy3rp9Nm vw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t6pmq3upq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Sep 2023 22:53:18 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38JMrHU5027195
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Sep 2023 22:53:17 GMT
Received: from [10.71.111.102] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Tue, 19 Sep
 2023 15:53:16 -0700
Message-ID: <24afa449-afe5-fdf4-0ad4-f2174e412569@quicinc.com>
Date: Tue, 19 Sep 2023 15:53:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm: remove drm_bridge_hpd_disable() from
 drm_bridge_connector_destroy()
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20230919174813.26958-1-quic_abhinavk@quicinc.com>
 <20230919181246.GA24325@pendragon.ideasonboard.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230919181246.GA24325@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: -C_-drNL20fqcxiFF3LbtRn6farci87o
X-Proofpoint-ORIG-GUID: -C_-drNL20fqcxiFF3LbtRn6farci87o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-19_12,2023-09-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=813 mlxscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309190195
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, freedreno@lists.freedesktop.org,
 andersson@kernel.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, quic_parellan@quicinc.com,
 dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent

On 9/19/2023 11:12 AM, Laurent Pinchart wrote:
> Hi Abhinav,
> 
> Thank you for the patch.
> 
> On Tue, Sep 19, 2023 at 10:48:12AM -0700, Abhinav Kumar wrote:
>> drm_bridge_hpd_enable()/drm_bridge_hpd_disable() callbacks call into
>> the respective driver's hpd_enable()/hpd_disable() ops. These ops control
>> the HPD enable/disable logic which in some cases like MSM can be a
>> dedicate hardware block to control the HPD.
>>
>> During probe_defer cases, a connector can be initialized and then later
>> destroyed till the probe is retried. During connector destroy in these
>> cases, the hpd_disable() callback gets called without a corresponding
>> hpd_enable() leading to an unbalanced state potentially causing even
>> a crash.
>>
>> This can be avoided by the respective drivers maintaining their own
>> state logic to ensure that a hpd_disable() without a corresponding
>> hpd_enable() just returns without doing anything.
>>
>> However, to have a generic fix it would be better to avoid the
>> hpd_disable() callback from the connector destroy path and let
>> the hpd_enable() / hpd_disable() balance be maintained by the
>> corresponding drm_bridge_connector_enable_hpd() /
>> drm_bridge_connector_disable_hpd() APIs which should get called by
>> drm_kms_helper_disable_hpd().
> 
> The change makes sense to me, but I'm a bit worried this could introduce
> a regression by leaving HPD enabled in some cases.
> 
> I agree that bridges shouldn't track the HPD state, it should be tracked
> by the core and the .enable_hpd() and .disable_hpd() operations should
> be balanced. Their documentation, however, doesn't clearly state this,
> and the documentation of the callers of these operations is also fairly
> unclear.
> 
> Could you perhaps try to improve the documentation ? With that,
> 

Yes, sure, Let me upload another patch to improve the documentation of 
.enable_hpd(), .disable_hpd() and its callers.

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> for this patch.
> 

Thanks

Abhinav

>> changes in v2:
>> 	- minor change in commit text (Dmitry)
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/drm_bridge_connector.c | 6 ------
>>   1 file changed, 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
>> index 1da93d5a1f61..c4dba39acfd8 100644
>> --- a/drivers/gpu/drm/drm_bridge_connector.c
>> +++ b/drivers/gpu/drm/drm_bridge_connector.c
>> @@ -187,12 +187,6 @@ static void drm_bridge_connector_destroy(struct drm_connector *connector)
>>   	struct drm_bridge_connector *bridge_connector =
>>   		to_drm_bridge_connector(connector);
>>   
>> -	if (bridge_connector->bridge_hpd) {
>> -		struct drm_bridge *hpd = bridge_connector->bridge_hpd;
>> -
>> -		drm_bridge_hpd_disable(hpd);
>> -	}
>> -
>>   	drm_connector_unregister(connector);
>>   	drm_connector_cleanup(connector);
>>   
> 
