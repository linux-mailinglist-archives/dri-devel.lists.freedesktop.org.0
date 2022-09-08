Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BC35B264D
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 20:53:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD7010EBC4;
	Thu,  8 Sep 2022 18:53:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 802C510EBC4;
 Thu,  8 Sep 2022 18:53:22 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 288ILCc2025860;
 Thu, 8 Sep 2022 18:53:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=PVWQV9fVKCz51CeppBvuDOBVcv5Q22kv7TX1fJNpK1o=;
 b=i+SgHvZ4h9qyxlSgImwCF02NuuWmsYhavGTkDif34665KAGUpatMK/prHk2sBymA0wni
 qEDPR/5+/YVFGl3YWzQRA6FF6B+Y+bV2UaxqK+eZA2BjNd+ewxkgug7PH7ZYbMDlmab3
 Ygo+EAJFEyC5II5Y8TLSedTxY04yjU6oWWjb46CmzvEQ6RWBb14dmbeIDZRQ5Sp/l5mA
 gWoRBVzGwU2E39+Ah5y2JFjtJ+IcvFcwFiGGmkzTtNnyCohUZAjHJog7YWcppV1rcgt0
 ng7fvchwP17vEG2Z3sJLgh2IrXfx7LCh/JOIMgUTGLImW9Yh/NyUSctJ3zTsSGoWeLmn Qg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jfdc7204q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Sep 2022 18:53:19 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 288IrIXJ023968
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 8 Sep 2022 18:53:18 GMT
Received: from [10.111.169.242] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Thu, 8 Sep 2022
 11:53:16 -0700
Message-ID: <b992a7ec-3c30-c2df-d173-74dc2a03dc56@quicinc.com>
Date: Thu, 8 Sep 2022 11:53:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [RFC PATCH 2/3] drm/msm: filter out modes for DSI bridge having
 unsupported clock
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, <freedreno@lists.freedesktop.org>
References: <1661830389-22439-1-git-send-email-quic_abhinavk@quicinc.com>
 <1661830389-22439-3-git-send-email-quic_abhinavk@quicinc.com>
 <CAE-0n50JDpYUO10QzGocq0m_irJJ4Ag7zUv_hyPqPOb-2_=RkQ@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAE-0n50JDpYUO10QzGocq0m_irJJ4Ag7zUv_hyPqPOb-2_=RkQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: QgqRF9dh1teL0I_32pYLbWj5eco2f5q9
X-Proofpoint-ORIG-GUID: QgqRF9dh1teL0I_32pYLbWj5eco2f5q9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-08_11,2022-09-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 mlxlogscore=999
 spamscore=0 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209080066
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
Cc: dianders@chromium.org, dri-devel@lists.freedesktop.org,
 seanpaul@chromium.org, dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stephen

On 9/7/2022 6:06 PM, Stephen Boyd wrote:
> Quoting Abhinav Kumar (2022-08-29 20:33:08)
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
>> index 39bbabb5daf6..3a06a157d1b1 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
>> @@ -265,6 +265,11 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
>>          return ret;
>>   }
>>
>> +void msm_dsi_set_max_extpclk(struct msm_dsi *msm_dsi, int max_ext_pclk)
> 
> Do we really need a 'setter' API for something like this? Why can't we
> directly access the constant value for the max clk in the function that
> uses it to limit modes?

That constant value is part of the DPU catalog. the value needs to be 
passed from the DPU to DSI/DP for it to use. Hence the setter API.

In this RFC atleast, this is being modeled as a DPU catalog entry.

> 
>> +{
>> +        msm_dsi_host_set_max_extpclk(msm_dsi->host, max_ext_pclk);
>> +}
>> +
>>   void msm_dsi_snapshot(struct msm_disp_state *disp_state, struct msm_dsi *msm_dsi)
>>   {
>>          msm_dsi_host_snapshot(disp_state, msm_dsi->host);
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
>> index 2a96b4fe7839..1be4ebb0f9c8 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi.h
>> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
>> @@ -93,8 +93,9 @@ int msm_dsi_host_power_on(struct mipi_dsi_host *host,
>>   int msm_dsi_host_power_off(struct mipi_dsi_host *host);
>>   int msm_dsi_host_set_display_mode(struct mipi_dsi_host *host,
>>                                    const struct drm_display_mode *mode);
>> -enum drm_mode_status msm_dsi_host_check_dsc(struct mipi_dsi_host *host,
>> -                                           const struct drm_display_mode *mode);
>> +enum drm_mode_status msm_dsi_host_mode_valid(struct mipi_dsi_host *host,
>> +               const struct drm_display_mode *mode,
>> +               struct drm_bridge *ext_bridge);
>>   unsigned long msm_dsi_host_get_mode_flags(struct mipi_dsi_host *host);
>>   int msm_dsi_host_register(struct mipi_dsi_host *host);
>>   void msm_dsi_host_unregister(struct mipi_dsi_host *host);
>> @@ -109,6 +110,7 @@ void msm_dsi_host_get_phy_clk_req(struct mipi_dsi_host *host,
>>   void msm_dsi_host_destroy(struct mipi_dsi_host *host);
>>   int msm_dsi_host_modeset_init(struct mipi_dsi_host *host,
>>                                          struct drm_device *dev);
>> +void msm_dsi_host_set_max_extpclk(struct mipi_dsi_host *host, int max_ext_pclk);
>>   int msm_dsi_host_init(struct msm_dsi *msm_dsi);
>>   int msm_dsi_runtime_suspend(struct device *dev);
>>   int msm_dsi_runtime_resume(struct device *dev);
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index 57a4c0fa614b..4428a6a66ee1 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -172,6 +172,9 @@ struct msm_dsi_host {
>>          int dlane_swap;
>>          int num_data_lanes;
>>
>> +       /* max pixel clock when used with a bridge chip */
>> +       int max_ext_pclk;
> 
> Will pixel clock be negative? What units is this in? Hz?

This is in Khz. It cannot be negative. I was also thinking of an 
unsigned int for this but the drm_display_mode's clock is an int so i 
also kept it like this.

227 struct drm_display_mode {
228 	/**
229 	 * @clock:
230 	 *
231 	 * Pixel clock in kHz.
232 	 */
233 	int clock;		/* in kHz */
234 	u16 hdisplay;


> 
>> +
>>          /* from phy DT */
>>          bool cphy_mode;
>>
>> @@ -2076,6 +2079,13 @@ int msm_dsi_host_modeset_init(struct mipi_dsi_host *host,
>>          return 0;
>>   }
>>
>> +void msm_dsi_host_set_max_extpclk(struct mipi_dsi_host *host, int max_ext_pclk)
>> +{
>> +       struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>> +
>> +       msm_host->max_ext_pclk = max_ext_pclk;
>> +}
>> +
>>   int msm_dsi_host_register(struct mipi_dsi_host *host)
>>   {
>>          struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>> @@ -2548,17 +2558,14 @@ int msm_dsi_host_set_display_mode(struct mipi_dsi_host *host,
>>          return 0;
>>   }
>>
>> -enum drm_mode_status msm_dsi_host_check_dsc(struct mipi_dsi_host *host,
>> -                                           const struct drm_display_mode *mode)
>> +static enum drm_mode_status msm_dsi_host_check_dsc(struct mipi_dsi_host *host,
>> +               const struct drm_display_mode *mode)
>>   {
>>          struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>>          struct drm_dsc_config *dsc = msm_host->dsc;
>>          int pic_width = mode->hdisplay;
>>          int pic_height = mode->vdisplay;
>>
>> -       if (!msm_host->dsc)
>> -               return MODE_OK;
>> -
>>          if (pic_width % dsc->slice_width) {
>>                  pr_err("DSI: pic_width %d has to be multiple of slice %d\n",
>>                         pic_width, dsc->slice_width);
>> @@ -2574,6 +2581,29 @@ enum drm_mode_status msm_dsi_host_check_dsc(struct mipi_dsi_host *host,
>>          return MODE_OK;
>>   }
>>
>> +enum drm_mode_status msm_dsi_host_mode_valid(struct mipi_dsi_host *host,
>> +                                           const struct drm_display_mode *mode,
>> +                                           struct drm_bridge *ext_bridge)
>> +{
>> +       struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>> +
>> +       /* TODO: external bridge chip with DSI having DSC */
>> +       if (msm_host->dsc)
>> +               return msm_dsi_host_check_dsc(host, mode);
>> +
>> +       /* TODO: add same logic for non-dpu targets */
>> +       if (!msm_host->max_ext_pclk)
>> +               return MODE_OK;
>> +
>> +       if (ext_bridge) {
>> +               if (ext_bridge->ops & DRM_BRIDGE_OP_HPD)
> 
> Nitpick: Collapse conditions
> 
> 	if (ext_bridge && (ext_bridge->ops & DRM_BRIDGE_OP_HPD))

Ack
> 
> Also, what does HPD have to do with this?

The documents referenced in the cover letter define the limits for 
built-in and external displays.

This series is targetted only for external displays with an underlying 
assumption that built-in displays are chosen at design time of the 
product and the product spec should be kept in mind while choosing them.

But for external ( pluggable ) displays, this is not true as the 
consumer can plug-in any monitor.

Now, there is no rule that DSI cannot be used as the external display 
with a DSI to HDMI or DSI to DP bridge chip.

In those cases, we need to check if the ext_bridge has HPD support and 
if so use this filtering of modes.

After discussing with Dmitry, I do agree though that instead of checking 
the next bridge, I should be checking the last bridge in the chain instead.

So when i do push the next version, I should change this to check if the 
last bridge has HPD support.

> 
>> +                       if (mode->clock > msm_host->max_ext_pclk)
>> +                               return MODE_CLOCK_HIGH;
>> +       }
>> +
>> +       return MODE_OK;
>> +}
>> +
>>   unsigned long msm_dsi_host_get_mode_flags(struct mipi_dsi_host *host)
>>   {
>>          return to_msm_dsi_host(host)->mode_flags;
