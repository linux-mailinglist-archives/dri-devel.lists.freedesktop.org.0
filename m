Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 412F74C4BB1
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 18:11:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF31410E84B;
	Fri, 25 Feb 2022 17:11:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF4210E832;
 Fri, 25 Feb 2022 17:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645809114; x=1677345114;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+ckGQmcwUiL9thcSmPFe9yHhezVCd95r2n8Cnh6CBaI=;
 b=jE50RRLRuDTAUZ3DHqOnkELvhMzlAwWXQL6VDsUVMdQrSbPihOTfHico
 9niQGUWAA8au8M1gzwhedW5Sg75BPOD1EMT/9u7UzbWKwBpvteNdFU95Z
 8V2UWVzm5a2JfCzCIna+8DURQsIh8uYUl4/NgV7WZbXazribMIi7fePPz 4=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 25 Feb 2022 09:11:53 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 09:11:53 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Fri, 25 Feb 2022 09:11:52 -0800
Received: from [10.110.44.69] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Fri, 25 Feb
 2022 09:11:51 -0800
Message-ID: <46a9412e-1911-55ee-62e4-a30837bf09a4@quicinc.com>
Date: Fri, 25 Feb 2022 09:11:50 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [Freedreno] [RFC PATCH v2 1/5] drm/msm/dp: fix panel bridge
 attachment
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20220211224006.1797846-1-dmitry.baryshkov@linaro.org>
 <20220211224006.1797846-2-dmitry.baryshkov@linaro.org>
 <CAE-0n52iHFtHppZj-g0V1UP5oWzXjbNDjpOd-hgR+F=TqFzjVg@mail.gmail.com>
 <a1b1d3ef-4131-b8a9-5300-89092bce271b@linaro.org>
 <a219b978-21a8-a2d6-62c0-69c451b10c09@quicinc.com>
 <CAA8EJpp5RjazoHD3GEE-1wJZtG3hZV9PRc3TtsBFFCcsB4zCNg@mail.gmail.com>
 <9398567b-6517-8eb3-f5d5-d8c88cb10814@quicinc.com>
 <CAA8EJpp2KrHfNN0F7s6iNOd8Zh1w-1dBMfAXff4Yy4UAdpPGUA@mail.gmail.com>
 <aaf172c9-d645-10ed-68ab-1d3c0296af3b@quicinc.com>
 <CAA8EJprvtia+x7em1FwSGmkChJmrSvOwqXzsGi2Gobuwv3tTXw@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJprvtia+x7em1FwSGmkChJmrSvOwqXzsGi2Gobuwv3tTXw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/25/2022 1:04 AM, Dmitry Baryshkov wrote:
> On Fri, 25 Feb 2022 at 07:45, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 2/24/2022 8:22 PM, Dmitry Baryshkov wrote:
>>> On Fri, 25 Feb 2022 at 05:01, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 2/24/2022 12:41 PM, Dmitry Baryshkov wrote:
>>>>> On Thu, 24 Feb 2022 at 21:25, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 2/18/2022 6:26 PM, Dmitry Baryshkov wrote:
>>>>>>> On 19/02/2022 02:56, Stephen Boyd wrote:
>>>>>>>> Quoting Dmitry Baryshkov (2022-02-11 14:40:02)
>>>>>>>>> In commit 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display
>>>>>>>>> enable and disable") the DP driver received a drm_bridge instance, which
>>>>>>>>> is always attached to the encoder as a root bridge. However it conflicts
>>>>>>>>> with the panel_bridge support for eDP panels. The panel bridge attaches
>>>>>>>>> to the encoder before the "dp" bridge has a chace to do so. Change
>>>>>>>>
>>>>>>>> s/chace/chance/
>>>>>>>>
>>>>>>>>> panel_bridge attachment to come after dp_bridge attachment.
>>>>>>>>
>>>>>>>> s/panel_bridge/panel bridge/ possibly? And maybe clarify that dp_bridge
>>>>>>>> is the "DP driver's drm_bridge instance created in
>>>>>>>> msm_dp_bridge_init()"?
>>>>>>>>
>>>>>>>> My understanding is that we want to pass the bridge created in
>>>>>>>> msm_dp_bridge_init() as the 'previous' bridge so that it attaches the
>>>>>>>> panel bridge to the output of the DP bridge that's attached to the
>>>>>>>> encoder.
>>>>>>>
>>>>>>> Thanks! I'll update the commit log when pushing the patches.
>>>>>>
>>>>>> Please correct if i am missing something here.
>>>>>>
>>>>>> You are right that the eDP panel's panel bridge attaches to the encoder
>>>>>> in dp_drm_connector_init() which happens before msm_dp_bridge_init() and
>>>>>> hence it will attach directly to the encoder.
>>>>>>
>>>>>> But we are talking about different encoders here. DP's dp_display has a
>>>>>> different encoder compared to the EDP's dp_display.
>>>>>
>>>>> The encoders are different. However both encoders use the same
>>>>> codepath, which includes dp_bridge. It controls dp_display by calling
>>>>> msm_dp_display_foo() functions.
>>>>>
>>>
>>>>>> So DP's bridge will still be attached to its encoder's root.
>>>>>
>>>>> There is one dp_bridge per each encoder. Consider sc8180x which has 3
>>>>> DP controllers (and thus 3 dp_bridges).
>>>>>
>>>>
>>>> Sorry, but I still didnt follow this.
>>>>
>>>> So for eDP, dp_drm_connector_init() will attach the panel_bridge
>>>> and then msm_dp_bridge_init() will add a drm_bridge.
>>>>
>>>> And yes in that case, the drm_bridge will be after the panel_bridge
>>>>
>>>> But since panel_bridge is at the root for eDP it should be okay.
>>>
>>> No. It is not.
>>> For both DP and eDP the chain should be:
>>> dpu_encoder -> dp_bridge -> external (panel) bridge, optional for DP
>>> -> [other bridges] -> connector
>>>
>>> Otherwise drm_bridge_chain_foo() functions would be called in the
>>> incorrect order.
>>
>> Agreed. For drm_bridge_chain_foo() ordering to be correct, for eDP chain
>> the order should be what you mentioned and panel_bridge should be at the
>> end ( should be the last one ).
>>
>> For the above reason,
>>
>> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> I still didnt understand what gets affected by this for the
>> msm_dp_display_foo() functions you mentioned earlier and wanted to get
>> some clarity on that.
> 
> They should be called at the correct time.
> 
>>>
>>> Thus the dp_bridge should be attached directly to the encoder
>>> (drm_encoder) and panel_bridge should use dp_bridge as the 'previous'
>>> bridge.
>>>
>>
>> Agreed.
>>
>>> For example, for the DP port one can use a display-connector (which
>>> actually implements drm_bridge) as an external bridge to provide hpd
>>> or dp power GPIOs.
>>>
>>> Note, that the current dp_connector breaks layering. It makes calls
>>> directly into dp_display, not allowing external bridge (and other
>>> bridges) to override get_modes/mode_valid and other callbacks.
>>> Thus one of the next patches in series (the one that Kuogee had issues
>>> with) tries to replace the chain with the following one:
>>> dpu_encoder -> dp_bridge -> external (panel) bridge -> [other bridges]
>>> -> drm_bridge_connector.
>>>
>>>>
>>
>> So originally the plan was always that the DP connector layer intercepts
>> the call because panel-eDP file did not support reading of the EDID ( we
>> have not provided the aux bus ). So it was intended that we did not want
>> to goto the eDP panel to get the modes. Not an error but something which
>> we wanted to cleanup later when we moved to panel-eDP completely.
> 
> panel_edp_get_modes() correctly handles this case and returns modes
> specified in the panel description. So the code should work even with
> panel-eDP and w/o the AUX bus.
> 

If hard-coded modes are not present, it will fail in below case:

     /*
      * Add hard-coded panel modes. Don't call this if there are no timings
      * and no modes (the generic edp-panel case) because it will clobber
      * the display_info that was already set by drm_add_edid_modes().
      */
     if (p->desc->num_timings || p->desc->num_modes)
         num += panel_edp_get_non_edid_modes(p, connector);
     else if (!num)
         dev_warn(p->base.dev, "No display modes\n");

Thats exactly the error he was seeing.

>>
>> Till then we wanted the dp_connector to read the EDID and get the modes.
>>
>> So this was actually intended to happen till the point where we moved to
>> panel-eDP to get the modes.
>>
>> Hence what you have mentioned in your cover letter is right that the
>> chain was broken but there was no loss of functionality due to that today.
>>
>> Now that these changes are made, we can still goto panel-eDP file for
>> the modes because of the below change from Sankeerth where the mode is
>> hard-coded:
>>
>> https://patchwork.freedesktop.org/patch/473431/
>>
>> With this change cherry-picked it should work for kuogee. We will
>> re-test that with this change.
> 
> I suppose he had both of the changes in the tree. Otherwise the
> panel_edp_get_modes() wouldn't be called.

No he did not.

That brings up another point.

Even Bjorn was relying on the DP connector's get_modes() for his eDP 
panel if I am not mistaken.

Unless he makes an equivalent change for his panel OR supports reading 
EDID in panel-edp, then he will hit the same error.

Given that your changes were only compile tested, lets wait for both 
Kuogee and Bjorn to validate their resp setups.

> 
>>>> Your commit text was mentioning about DP.
>>>>
>>>> For DP, for each controller in the catalog, we will call modeset_init()
>>>> which should skip this part for DP
>>>>
>>>>      if (dp_display->panel_bridge) {
>>>>            ret = drm_bridge_attach(dp_display->encoder,
>>>>                        dp_display->panel_bridge, NULL,
>>>
>>> as you see, NULL is incorrect. It should be a pointer to dp_bridge instead
>>>
>>>>                        DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>>>>            if (ret < 0) {
>>>>                DRM_ERROR("failed to attach panel bridge: %d\n", ret);
>>>>                return ERR_PTR(ret);
>>>>            }
>>>>        }
>>>>
>>>> Followed by calling msm_dp_bridge_init() which will actually attach the
>>>> bridge:
>>>>
>>>> drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>>>
>>> And this bridge should be attached before the external bridge.
>>>
>>>>
>>>> Now, even for 3 DP controllers, this shall be true as there will be 3
>>>> separate encoders and 3 dp_displays and hence 3 drm_bridges.
>>>>
>>>> What am i missing here?
>>>>
>>>>>>
>>>>>> So what are we achieving with this change?
>>>>>>
>>>>>>>
>>>>>>>>
>>>>>>>>>
>>>>>>>>> Fixes: 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display
>>>>>>>>> enable and disable")
>>>>>>>>> Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>>>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>>>>> ---
>>>>>>>>
>>>>>>>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>>>>>>>>
>>>>>>>>>      drivers/gpu/drm/msm/dp/dp_drm.c | 21 +++++++++++----------
>>>>>>>>>      1 file changed, 11 insertions(+), 10 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c
>>>>>>>>> b/drivers/gpu/drm/msm/dp/dp_drm.c
>>>>>>>>> index d4d360d19eba..26ef41a4c1b6 100644
>>>>>>>>> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
>>>>>>>>> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
>>>>>>>>> @@ -169,16 +169,6 @@ struct drm_connector
>>>>>>>>> *dp_drm_connector_init(struct msm_dp *dp_display)
>>>>>>>>>
>>>>>>>>>             drm_connector_attach_encoder(connector, dp_display->encoder);
>>>>>>>>>
>>>>>>>>> -       if (dp_display->panel_bridge) {
>>>>>>>>> -               ret = drm_bridge_attach(dp_display->encoder,
>>>>>>>>> -                                       dp_display->panel_bridge, NULL,
>>>>>>>>> -                                       DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>>>>>>>>> -               if (ret < 0) {
>>>>>>>>> -                       DRM_ERROR("failed to attach panel bridge:
>>>>>>>>> %d\n", ret);
>>>>>>>>> -                       return ERR_PTR(ret);
>>>>>>>>> -               }
>>>>>>>>> -       }
>>>>>>>>> -
>>>>>>>>>             return connector;
>>>>>>>>>      }
>>>>>>>>>
>>>>>>>>> @@ -246,5 +236,16 @@ struct drm_bridge *msm_dp_bridge_init(struct
>>>>>>>>> msm_dp *dp_display, struct drm_devi
>>>>>>>>>                     return ERR_PTR(rc);
>>>>>>>>>             }
>>>>>>>>>
>>>>>>>>> +       if (dp_display->panel_bridge) {
>>>>>>>>> +               rc = drm_bridge_attach(dp_display->encoder,
>>>>>>>>> +                                       dp_display->panel_bridge,
>>>>>>>>> bridge,
>>>>>>>>> +                                       DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>>>>>>>>> +               if (rc < 0) {
>>>>>>>>> +                       DRM_ERROR("failed to attach panel bridge:
>>>>>>>>> %d\n", rc);
>>>>>>>>> +                       drm_bridge_remove(bridge);
>>>>>>>>> +                       return ERR_PTR(rc);
>>>>>>>>> +               }
>>>>>>>>> +       }
>>>>>>>>> +
>>>>>>>>>             return bridge;
>>>>>>>>
>>>>>>>> Not a problem with this patch, but what is this pointer used for? I see
>>>>>>>> it's assigned to priv->bridges and num_bridges is incremented but nobody
>>>>>>>> seems to look at that.
>>>>>>>
>>>>>>>
>>>>>>> That's on my todo list. to remove connectors array and to destroy
>>>>>>> created bridges during drm device destruction.
>>>>>>>
>>>>>
>>>>>
>>>>>
>>>
>>>
>>>
> 
> 
> 
