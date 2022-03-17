Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCE94DCC97
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 18:36:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95A6410E805;
	Thu, 17 Mar 2022 17:36:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A2D410E805;
 Thu, 17 Mar 2022 17:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1647538580; x=1679074580;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=jiW5EE6owFliZXobW5Ihk7DmGnoY8atQYbqw4uFtVA4=;
 b=EhNgTGrrYXDyGcTTgz9ajcuQuKae8Jb8B44i+9O66aelpbxT6rtubPB7
 iKFQarcdFzJ4IKUJ3sIWQjeyoJcP+5qOhZxo1pmqMjKsmOdpJ2o0J9jwG
 jTxq0jMY6qS8WWEKfWxdRUOnGzanS7rIwaNpBR74qBfJp6u6fXBPORXu7 k=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 17 Mar 2022 10:36:19 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 10:36:18 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 17 Mar 2022 10:36:18 -0700
Received: from [10.110.116.22] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 17 Mar
 2022 10:36:17 -0700
Message-ID: <876f707b-5d52-fd1c-9e58-d3ff8e1bb7fd@quicinc.com>
Date: Thu, 17 Mar 2022 10:36:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 1/6] drm: allow real encoder to be passed for
 drm_writeback_connector
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
References: <1646963400-25606-1-git-send-email-quic_abhinavk@quicinc.com>
 <1646963400-25606-2-git-send-email-quic_abhinavk@quicinc.com>
 <CAA8EJpqnC=crWaSrXLNLBX5WsZ6LDzG0aNUu7RmqhDPTvP8tFQ@mail.gmail.com>
 <YisC4cY8EZADarG6@pendragon.ideasonboard.com>
 <YjMHAI8zlxey/WNl@phenom.ffwll.local>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <YjMHAI8zlxey/WNl@phenom.ffwll.local>
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
Cc: hamohammed.sa@gmail.com, suraj.kandpal@intel.com, emma@anholt.net,
 rodrigosiqueiramelo@gmail.com, jani.nikula@intel.com, liviu.dudau@arm.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, melissa.srw@gmail.com,
 nganji@codeaurora.org, seanpaul@chromium.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, james.qian.wang@arm.com,
 quic_aravindh@quicinc.com, mihail.atanassov@arm.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel

On 3/17/2022 3:01 AM, Daniel Vetter wrote:
> On Fri, Mar 11, 2022 at 10:05:53AM +0200, Laurent Pinchart wrote:
>> On Fri, Mar 11, 2022 at 10:46:13AM +0300, Dmitry Baryshkov wrote:
>>> On Fri, 11 Mar 2022 at 04:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>>
>>>> For some vendor driver implementations, display hardware can
>>>> be shared between the encoder used for writeback and the physical
>>>> display.
>>>>
>>>> In addition resources such as clocks and interrupts can
>>>> also be shared between writeback and the real encoder.
>>>>
>>>> To accommodate such vendor drivers and hardware, allow
>>>> real encoder to be passed for drm_writeback_connector.
>>>>
>>>> Co-developed-by: Kandpal Suraj <suraj.kandpal@intel.com>
>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>> ---
>>>>   drivers/gpu/drm/drm_writeback.c |  8 ++++----
>>>>   include/drm/drm_writeback.h     | 13 +++++++++++--
>>>>   2 files changed, 15 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
>>>> index dccf4504..4dad687 100644
>>>> --- a/drivers/gpu/drm/drm_writeback.c
>>>> +++ b/drivers/gpu/drm/drm_writeback.c
>>>> @@ -189,8 +189,8 @@ int drm_writeback_connector_init(struct drm_device *dev,
>>>>          if (IS_ERR(blob))
>>>>                  return PTR_ERR(blob);
>>>>
>>>> -       drm_encoder_helper_add(&wb_connector->encoder, enc_helper_funcs);
>>>> -       ret = drm_encoder_init(dev, &wb_connector->encoder,
>>>> +       drm_encoder_helper_add(wb_connector->encoder, enc_helper_funcs);
>>>> +       ret = drm_encoder_init(dev, wb_connector->encoder,
>>>>                                 &drm_writeback_encoder_funcs,
>>>>                                 DRM_MODE_ENCODER_VIRTUAL, NULL);
>>>
>>> If the encoder is provided by a separate driver, it might use a
>>> different set of encoder funcs.
>>
>> More than that, if the encoder is provided externally but doesn't have
>> custom operations, I don't really see the point of having an external
>> encoder in the first place.
>>
>> Has this series been tested with a driver that needs to provide an
>> encoder, to make sure it fits the purpose ?
> 
> Also, can we not force all drivers to do this setup that don't need it? We
> have a ton of kms drivers, forcing unnecessary busiwork on drivers is
> really not good.
> -Daniel
No, there will not be any requirement forced for existing drivers.
A new API will be exposed for new clients which setup the encoder.
> 
>>
>>> I'd suggest checking whether the wb_connector->encoder is NULL here.
>>> If it is, allocate one using drmm_kzalloc and init it.
>>> If it is not NULL, assume that it has been initialized already, so
>>> skip the drm_encoder_init() and just call the drm_encoder_helper_add()
>>>
>>>>          if (ret)
>>>> @@ -204,7 +204,7 @@ int drm_writeback_connector_init(struct drm_device *dev,
>>>>                  goto connector_fail;
>>>>
>>>>          ret = drm_connector_attach_encoder(connector,
>>>> -                                               &wb_connector->encoder);
>>>> +                                               wb_connector->encoder);
>>>>          if (ret)
>>>>                  goto attach_fail;
>>>>
>>>> @@ -233,7 +233,7 @@ int drm_writeback_connector_init(struct drm_device *dev,
>>>>   attach_fail:
>>>>          drm_connector_cleanup(connector);
>>>>   connector_fail:
>>>> -       drm_encoder_cleanup(&wb_connector->encoder);
>>>> +       drm_encoder_cleanup(wb_connector->encoder);
>>>>   fail:
>>>>          drm_property_blob_put(blob);
>>>>          return ret;
>>>> diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
>>>> index 9697d27..0ba266e 100644
>>>> --- a/include/drm/drm_writeback.h
>>>> +++ b/include/drm/drm_writeback.h
>>>> @@ -25,13 +25,22 @@ struct drm_writeback_connector {
>>>>          struct drm_connector base;
>>>>
>>>>          /**
>>>> -        * @encoder: Internal encoder used by the connector to fulfill
>>>> +        * @encoder: handle to drm_encoder used by the connector to fulfill
>>>>           * the DRM framework requirements. The users of the
>>>>           * @drm_writeback_connector control the behaviour of the @encoder
>>>>           * by passing the @enc_funcs parameter to drm_writeback_connector_init()
>>>>           * function.
>>>> +        *
>>>> +        * For some vendor drivers, the hardware resources are shared between
>>>> +        * writeback encoder and rest of the display pipeline.
>>>> +        * To accommodate such cases, encoder is a handle to the real encoder
>>>> +        * hardware.
>>>> +        *
>>>> +        * For current existing writeback users, this shall continue to be the
>>>> +        * embedded encoder for the writeback connector.
>>>> +        *
>>>>           */
>>>> -       struct drm_encoder encoder;
>>>> +       struct drm_encoder *encoder;
>>>>
>>>>          /**
>>>>           * @pixel_formats_blob_ptr:
>>
>> -- 
>> Regards,
>>
>> Laurent Pinchart
> 
