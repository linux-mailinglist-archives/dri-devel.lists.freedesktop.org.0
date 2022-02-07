Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D004AB59A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 08:20:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D08D010E4A8;
	Mon,  7 Feb 2022 07:20:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9C2110E4A8;
 Mon,  7 Feb 2022 07:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644218455; x=1675754455;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=pu0BUIY/nfx6gvU0Um7W4uLuEpTKGRQoIWPBtxGl+YI=;
 b=gENzbF8/+dJJojTqy0dTCQYEjMzXdXN3tp4c+JfZAa1HH6AN2BTbrPIi
 G1r7lGj6gYCHtSnxloAcQlm5LVHSGqUHu0q6TURfP7IUykkCmKXiljJRe
 5cDsF+mCqZNs/14n0nCUcv/SdAN0S/V3F/wycH6Efxru8r84isrV6VpGm 8=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 06 Feb 2022 23:20:55 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2022 23:20:54 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Sun, 6 Feb 2022 23:20:54 -0800
Received: from [10.38.243.172] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Sun, 6 Feb 2022
 23:20:52 -0800
Message-ID: <d69038d6-a853-d2d9-81de-0ad10c4d6a3a@quicinc.com>
Date: Sun, 6 Feb 2022 23:20:50 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 5/6] drm/rcar_du: changes to rcar-du driver resulting from
 drm_writeback_connector structure changes
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>
References: <20220202085429.22261-1-suraj.kandpal@intel.com>
 <20220202085429.22261-6-suraj.kandpal@intel.com>
 <Yfp8Q6OFqTAvESOi@pendragon.ideasonboard.com> <87y22ts948.fsf@intel.com>
 <YfqGbqQQz5vrDaLI@pendragon.ideasonboard.com>
 <CAA8EJpqr6MB64EAtLU3nBjgjx1COwn4auenCCw4kHB489VG0CA@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpqr6MB64EAtLU3nBjgjx1COwn4auenCCw4kHB489VG0CA@mail.gmail.com>
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
Cc: Kandpal Suraj <suraj.kandpal@intel.com>, carsten.haitzler@arm.com,
 Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, arun.r.murthy@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent

On 2/6/2022 3:32 PM, Dmitry Baryshkov wrote:
> On Wed, 2 Feb 2022 at 16:26, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
>>
>> Hi Jani,
>>
>> On Wed, Feb 02, 2022 at 03:15:03PM +0200, Jani Nikula wrote:
>>> On Wed, 02 Feb 2022, Laurent Pinchart wrote:
>>>> On Wed, Feb 02, 2022 at 02:24:28PM +0530, Kandpal Suraj wrote:
>>>>> Changing rcar_du driver to accomadate the change of
>>>>> drm_writeback_connector.base and drm_writeback_connector.encoder
>>>>> to a pointer the reason for which is explained in the
>>>>> Patch(drm: add writeback pointers to drm_connector).
>>>>>
>>>>> Signed-off-by: Kandpal Suraj <suraj.kandpal@intel.com>
>>>>> ---
>>>>>   drivers/gpu/drm/rcar-du/rcar_du_crtc.h      | 2 ++
>>>>>   drivers/gpu/drm/rcar-du/rcar_du_writeback.c | 8 +++++---
>>>>>   2 files changed, 7 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
>>>>> index 66e8839db708..68f387a04502 100644
>>>>> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
>>>>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
>>>>> @@ -72,6 +72,8 @@ struct rcar_du_crtc {
>>>>>     const char *const *sources;
>>>>>     unsigned int sources_count;
>>>>>
>>>>> +  struct drm_connector connector;
>>>>> +  struct drm_encoder encoder;
>>>>
>>>> Those fields are, at best, poorly named. Furthermore, there's no need in
>>>> this driver or in other drivers using drm_writeback_connector to create
>>>> an encoder or connector manually. Let's not polute all drivers because
>>>> i915 doesn't have its abstractions right.
>>>
>>> i915 uses the quite common model for struct inheritance:
>>>
>>>        struct intel_connector {
>>>                struct drm_connector base;
>>>                /* ... */
>>>        }
>>>
>>> Same with at least amd, ast, fsl-dcu, hisilicon, mga200, msm, nouveau,
>>> radeon, tilcdc, and vboxvideo.
>>>
>>> We could argue about the relative merits of that abstraction, but I
>>> think the bottom line is that it's popular and the drivers using it are
>>> not going to be persuaded to move away from it.
>>
>> Nobody said inheritance is bad.
>>
>>> It's no coincidence that the drivers who've implemented writeback so far
>>> (komeda, mali, rcar-du, vc4, and vkms) do not use the abstraction,
>>> because the drm_writeback_connector midlayer does, forcing the issue.
>>
>> Are you sure it's not a coincidence ? :-)
>>
>> The encoder and especially connector created by drm_writeback_connector
>> are there only because KMS requires a drm_encoder and a drm_connector to
>> be exposed to userspace (and I could argue that using a connector for
>> writeback is a hack, but that won't change). The connector is "virtual",
>> I still fail to see why i915 or any other driver would need to wrap it
>> into something else. The whole point of the drm_writeback_connector
>> abstraction is that drivers do not have to manage the writeback
>> drm_connector manually, they shouldn't touch it at all.
> 
> Laurent, I wanted to shift a bit from the question of drm_connector to
> the question of drm_encoder being embedded in the
> drm_writeback_connector.
> In case of the msm driver the drm_encoder is not a lightweight entity,
> but a full-featured driver part. Significant part of it can be shared
> with the writeback implementation, if we allow using a pointer to the
> external drm_encoder with the drm_writeback_connector.
> Does the following patch set stand a chance to receive your ack?
>   - Switch drm_writeback_connector to point to drm_encoder rather than
> embedding it?
>   - Create drm_encoder for the drm_writeback_connector when one is not
> specified, so the current drivers can be left unchanged.
> 

I second Dmitry's request here. For the reasons he has mentioned along 
with the possibility of the writeback encoder being shared across 
display pipelines, strengthens our request of the drm encoder being a 
pointer inside the drm_writeback_connector instead of embedding it.

Like I had shown in my RFC, in case the other drivers dont specify one,
we can allocate one:

https://patchwork.kernel.org/project/dri-devel/patch/1642732195-25349-1-git-send-email-quic_abhinavk@quicinc.com/

We think this should be a reasonable accomodation to the existing
drm_writeback driver.

Thanks

Abhinav

>>
>>> So I think drm_writeback_connector should *not* use the inheritance
>>> abstraction because it's a midlayer that should leave that option to the
>>> drivers. I think drm_writeback_connector needs to be changed to
>>> accommodate that, and, unfortunately, it means current writeback users
>>> need to be changed as well.
>>>
>>> I am not sure, however, if the series at hand is the right
>>> approach. Perhaps writeback can be modified to allocate the stuff for
>>> you if you prefer it that way, as long as the drm_connector is not
>>> embedded in struct drm_writeback_connector.
>>>
>>>> Nack.
>>>>
>>>>>     struct drm_writeback_connector writeback;
>>>>>   };
>>>>>
>>>>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
>>>>> index c79d1259e49b..5b1e83380c47 100644
>>>>> --- a/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
>>>>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
>>>>> @@ -200,8 +200,10 @@ int rcar_du_writeback_init(struct rcar_du_device *rcdu,
>>>>>   {
>>>>>     struct drm_writeback_connector *wb_conn = &rcrtc->writeback;
>>>>>
>>>>> -  wb_conn->encoder.possible_crtcs = 1 << drm_crtc_index(&rcrtc->crtc);
>>>>> -  drm_connector_helper_add(&wb_conn->base,
>>>>> +  wb_conn->base = &rcrtc->connector;
>>>>> +  wb_conn->encoder = &rcrtc->encoder;
>>>>> +  wb_conn->encoder->possible_crtcs = 1 << drm_crtc_index(&rcrtc->crtc);
>>>>> +  drm_connector_helper_add(wb_conn->base,
>>>>>                              &rcar_du_wb_conn_helper_funcs);
>>>>>
>>>>>     return drm_writeback_connector_init(&rcdu->ddev, wb_conn,
>>>>> @@ -220,7 +222,7 @@ void rcar_du_writeback_setup(struct rcar_du_crtc *rcrtc,
>>>>>     struct drm_framebuffer *fb;
>>>>>     unsigned int i;
>>>>>
>>>>> -  state = rcrtc->writeback.base.state;
>>>>> +  state = rcrtc->writeback.base->state;
>>>>>     if (!state || !state->writeback_job)
>>>>>             return;
>>>>>
>>
>> --
>> Regards,
>>
>> Laurent Pinchart
> 
> 
> 
