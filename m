Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C55A56AD68
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 23:25:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23EA5112435;
	Thu,  7 Jul 2022 21:25:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A4A810F4B7;
 Thu,  7 Jul 2022 21:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1657229113; x=1688765113;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=nH6fEtoTXnECESFrdnd0mY4HzM7PFgFTGxMaeSvl0rM=;
 b=lbVMwxrs8gMNJc/iVVs/ZC+zJR57guOxTZAFawOIPNWxZx5Nfvu5kpXq
 EKtAAqd6epEpR9JSUnF4VQhiNUteNp+XdAOpjpaGsxwzctWDkT7WBqaHZ
 61sEozhLYwLCLOvcH1Z0tDWVHI7dzl8pCFBcqooUZjGKW/707y/Ac1ihR 0=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 07 Jul 2022 14:25:12 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 14:25:12 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 7 Jul 2022 14:25:12 -0700
Received: from [10.111.163.64] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 7 Jul 2022
 14:25:09 -0700
Message-ID: <7e029069-3c8d-ad0e-b992-8b2b06f5c4fc@quicinc.com>
Date: Thu, 7 Jul 2022 14:25:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PATCH] drm/msm/dsi: Set panel orientation when
 directly connected
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>
References: <20220706191442.1150634-1-swboyd@chromium.org>
 <40b6a28c-0237-55d7-2f5d-1c571f27e7d6@quicinc.com>
 <CAE-0n51KOMLP4XJHw2CPNikzfhY0xdjeCScYwvCZ7gAYJM+8Fw@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAE-0n51KOMLP4XJHw2CPNikzfhY0xdjeCScYwvCZ7gAYJM+8Fw@mail.gmail.com>
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
Cc: freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/7/2022 2:21 PM, Stephen Boyd wrote:
> Quoting Abhinav Kumar (2022-07-07 14:11:08)
>>
>>
>> On 7/6/2022 12:14 PM, Stephen Boyd wrote:
>>> Set the panel orientation in drm when the panel is directly connected,
>>> i.e. we're not using an external bridge. The external bridge case is
>>> already handled by the panel bridge code, so we only update the path we
>>> take when the panel is directly connected/internal. This silences a
>>> warning splat coming from __drm_mode_object_add() on Wormdingler boards.
>>>
>>> Cc: Hsin-Yi Wang <hsinyi@chromium.org>
>>> Cc: Douglas Anderson <dianders@chromium.org>
>>> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
>>> ---
>>>
>>> This relies on commit 5e41b01a7808 ("drm/panel: Add an API to allow drm
>>> to set orientation from panel") which is in drm-misc
>>>
>>>    drivers/gpu/drm/msm/dsi/dsi_manager.c | 2 ++
>>>    1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
>>> index cb84d185d73a..9333f7095acd 100644
>>> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
>>> @@ -268,6 +268,8 @@ static int msm_dsi_manager_panel_init(struct drm_connector *conn, u8 id)
>>>                return PTR_ERR(panel);
>>>        }
>>>
>>> +     drm_connector_set_orientation_from_panel(conn, panel);
>>> +
>>
>> This should be moved below the !panel check since you are passing panel
>> as one of the params.
> 
> drm_connector_set_orientation_from_panel() checks for a NULL panel
> pointer and sets to UNKNOWN. If I moved this below the !panel check then
> I'd have to split that condition for !IS_BONDED_DSI() which was more
> diff.
> 

Ah okay. Even if the panel is null, it sets it to 
DRM_MODE_PANEL_ORIENTATION_UNKNOWN.

>>
>> I looked up the doc and it says that for unknown(default cases) this is
>> a no-op so I think this change is fine otherwise.
>>
>> "It is allowed to call this function with a panel_orientation of
>> DRM_MODE_PANEL_ORIENTATION_UNKNOWN, in which case it is a no-op."
> 
> Ok, so you're fine with this patch?

Yes, I only held back the R-b for the previous comment, now since thats 
clarified.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
>>
>>
>>>        if (!panel || !IS_BONDED_DSI())
>>>                goto out;
>>>
>>>
>>> base-commit: 15b9ca1641f0c3cd74885280331e9172c62a125e
