Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB74A5A3A1B
	for <lists+dri-devel@lfdr.de>; Sat, 27 Aug 2022 23:35:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4103210ED80;
	Sat, 27 Aug 2022 21:35:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8D1710ED74;
 Sat, 27 Aug 2022 21:35:07 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27RLHM2w011783;
 Sat, 27 Aug 2022 21:35:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Di7OsPcBjNWqFHC5uizMcoPP0R7q15sIlxaS/f6xIG0=;
 b=PsHmuszQU9muJGpDgw/i1BNWWWi7dsODRVKbR2kpVF8q/7/ttTEGsLjl8NZ8UC7MuUQg
 AFQ+F1xE0kJ5xyVdRugBROMGg8uDDwWaAqppElfD7hQreJIcYPhJOjOxsiPK/go6QkGr
 0TI8wKCD+T0hZHcPm9e+IjDxKNegX6ARHqbJSUe7r1x9TSinhIyfQBOW/GuALbkXuUCz
 O5JmQWYDdUUysQ1REhdqi/8VJ99rbzllxMPknS5JAAJHcBBFXgcZparzFaaAUjpqaNSL
 +9n1SJmJA9I9J479VhG9T9yyn1XY/aNZX3NQTbkQX9GvgpQkvGRL/HWmqEWHsMWwXIqh Gw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j7c1qhe59-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 27 Aug 2022 21:35:01 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27RLZ0fe018335
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 27 Aug 2022 21:35:00 GMT
Received: from [10.38.245.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Sat, 27 Aug
 2022 14:34:58 -0700
Message-ID: <a938b3fc-c7da-bf83-3029-b6724e1d83f6@quicinc.com>
Date: Sat, 27 Aug 2022 14:34:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PATCH v2.5] drm/msm/dsi: switch to DRM_PANEL_BRIDGE
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <0abf1924-485b-8f1c-c8c8-d14dcccc3a27@quicinc.com>
 <20220712132258.671263-1-dmitry.baryshkov@linaro.org>
 <99c1a222-5311-acff-6658-c09d41bd0013@quicinc.com>
 <91f48744-a6fe-d448-4962-9a0d733f752d@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <91f48744-a6fe-d448-4962-9a0d733f752d@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 48IOygwfkSnkP-95ridkVjoQRRjpB6gL
X-Proofpoint-GUID: 48IOygwfkSnkP-95ridkVjoQRRjpB6gL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-27_10,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 phishscore=0 mlxscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208270081
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/22/2022 10:53 AM, Dmitry Baryshkov wrote:
> On 15/07/2022 00:54, Abhinav Kumar wrote:
>>
>>
>> On 7/12/2022 6:22 AM, Dmitry Baryshkov wrote:
>>> Currently the DSI driver has two separate paths: one if the next device
>>> in a chain is a bridge and another one if the panel is connected
>>> directly to the DSI host. Simplify the code path by using panel-bridge
>>> driver (already selected in Kconfig) and dropping support for
>>> handling the panel directly.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>
>>> I'm not sending this as a separate patchset (I'd like to sort out mdp5
>>> first), but more of a preview of changes related to
>>> msm_dsi_manager_ext_bridge_init().
>>>
>>> ---
>>>   drivers/gpu/drm/msm/dsi/dsi.c         |  35 +---
>>>   drivers/gpu/drm/msm/dsi/dsi.h         |  16 +-
>>>   drivers/gpu/drm/msm/dsi/dsi_host.c    |  25 ---
>>>   drivers/gpu/drm/msm/dsi/dsi_manager.c | 283 +++-----------------------
>>>   4 files changed, 36 insertions(+), 323 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c 
>>> b/drivers/gpu/drm/msm/dsi/dsi.c
>>> index 1625328fa430..4edb9167e600 100644
>>> --- a/drivers/gpu/drm/msm/dsi/dsi.c
>>> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
>>> @@ -6,14 +6,6 @@
>>>   #include "dsi.h"
>>>   #include "dsi_cfg.h"
>>> -struct drm_encoder *msm_dsi_get_encoder(struct msm_dsi *msm_dsi)
>>> -{
>>> -    if (!msm_dsi || !msm_dsi_device_connected(msm_dsi))
>>> -        return NULL;
>>> -
>>> -    return msm_dsi->encoder;
>>> -}
>>> -
>>>   bool msm_dsi_is_cmd_mode(struct msm_dsi *msm_dsi)
>>>   {
>>>       unsigned long host_flags = 
>>> msm_dsi_host_get_mode_flags(msm_dsi->host);
>>> @@ -220,7 +212,6 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, 
>>> struct drm_device *dev,
>>>                struct drm_encoder *encoder)
>>>   {
>>>       struct msm_drm_private *priv;
>>> -    struct drm_bridge *ext_bridge;
>>>       int ret;
>>>       if (WARN_ON(!encoder) || WARN_ON(!msm_dsi) || WARN_ON(!dev))
>>> @@ -254,26 +245,10 @@ int msm_dsi_modeset_init(struct msm_dsi 
>>> *msm_dsi, struct drm_device *dev,
>>>           goto fail;
>>>       }
>>> -    /*
>>> -     * check if the dsi encoder output is connected to a panel or an
>>> -     * external bridge. We create a connector only if we're 
>>> connected to a
>>> -     * drm_panel device. When we're connected to an external bridge, we
>>> -     * assume that the drm_bridge driver will create the connector 
>>> itself.
>>> -     */
>>> -    ext_bridge = msm_dsi_host_get_bridge(msm_dsi->host);
>>> -
>>> -    if (ext_bridge)
>>> -        msm_dsi->connector =
>>> -            msm_dsi_manager_ext_bridge_init(msm_dsi->id);
>>> -    else
>>> -        msm_dsi->connector =
>>> -            msm_dsi_manager_connector_init(msm_dsi->id);
>>> -
>>> -    if (IS_ERR(msm_dsi->connector)) {
>>> -        ret = PTR_ERR(msm_dsi->connector);
>>> +    ret = msm_dsi_manager_ext_bridge_init(msm_dsi->id);
>>> +    if (ret) {
>>>           DRM_DEV_ERROR(dev->dev,
>>>               "failed to create dsi connector: %d\n", ret);
>>> -        msm_dsi->connector = NULL;
>>>           goto fail;
>>>       }
>>> @@ -287,12 +262,6 @@ int msm_dsi_modeset_init(struct msm_dsi 
>>> *msm_dsi, struct drm_device *dev,
>>>           msm_dsi->bridge = NULL;
>>>       }
>>> -    /* don't destroy connector if we didn't make it */
>>> -    if (msm_dsi->connector && !msm_dsi->external_bridge)
>>> -        msm_dsi->connector->funcs->destroy(msm_dsi->connector);
>>> -
>>> -    msm_dsi->connector = NULL;
>>
>>  From what i can see all the usages of msm_dsi->connector are removed 
>> after this change. So can we drop that?
> 
> The connector field is dropped from the msm_dsi struct. If you are 
> asking about the msm_dsi_modeset_init(), we can not drop it since we 
> require the DRM device with GEM being initialized in order to allocate 
> DSI DMA buffer. We can think about moving DMA buffer allocation towards 
> the usage point, however this is definitely a separate commit.
> 
> [skipped]

Yes, got it.
> 
>>> *msm_dsi_manager_ext_bridge_init(u8 id)
>>>       ret = drm_bridge_attach(encoder, ext_bridge, int_bridge,
>>>               DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>>>       if (ret == -EINVAL) {
>>> -        struct drm_connector *connector;
>>> -        struct list_head *connector_list;
>>> -
>>> -        /* link the internal dsi bridge to the external bridge */
>>> -        drm_bridge_attach(encoder, ext_bridge, int_bridge, 0);
>>> -
>>>           /*
>>> -         * we need the drm_connector created by the external bridge
>>> -         * driver (or someone else) to feed it to our driver's
>>> -         * priv->connector[] list, mainly for msm_fbdev_init()
>>> +         * link the internal dsi bridge to the external bridge,
>>> +         * connector is created by the next bridge.
>>>            */
>>> -        connector_list = &dev->mode_config.connector_list;
>>> +        ret = drm_bridge_attach(encoder, ext_bridge, int_bridge, 0);
>>> +        if (ret < 0)
>>> +            return ret;
>>> +    } else {
>>> +        struct drm_connector *connector;
>>> -        list_for_each_entry(connector, connector_list, head) {
>>> -            if (drm_connector_has_possible_encoder(connector, encoder))
>>> -                return connector;
>>> +        /* We are in charge of the connector, create one now. */
>>> +        connector = drm_bridge_connector_init(dev, encoder);
>>> +        if (IS_ERR(connector)) {
>>> +            DRM_ERROR("Unable to create bridge connector\n");
>>> +            return PTR_ERR(connector);
>>>           }
>>
>> Ok, I understood now. We create the connector using 
>> drm_bridge_connector_init() only when the brige doesnt create one 
>> already.
>>
>> In both cases since now we are leaving the hpd handling to the next 
>> bridge, like I was suggesting, the dsi_hpd_worker() etc can be dropped 
>> now. Because anyway without setting the DRM_CONNECTOR_POLL_HPD, event 
>> will not be sent to usermode.
> 
> I've submitted https://patchwork.freedesktop.org/series/107564/ as a 
> separate change.
> 
Thanks for pushing this change, I have R-bed that too.

For this one, now I can

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

>>
>>> -        return ERR_PTR(-ENODEV);
>>> -    }
>>> -
>>> -    connector = drm_bridge_connector_init(dev, encoder);
>>> -    if (IS_ERR(connector)) {
>>> -        DRM_ERROR("Unable to create bridge connector\n");
>>> -        return ERR_CAST(connector);
>>> +        ret = drm_connector_attach_encoder(connector, encoder);
>>> +        if (ret < 0)
>>> +            return ret;
>>>       }
>>> -    drm_connector_attach_encoder(connector, encoder);
>>> +    /* The pipeline is ready, ping encoders if necessary */
>>> +    msm_dsi_manager_set_split_display(id);
>>> -    return connector;
>>> +    return 0;
>>>   }
>>>   void msm_dsi_manager_bridge_destroy(struct drm_bridge *bridge)
> 
