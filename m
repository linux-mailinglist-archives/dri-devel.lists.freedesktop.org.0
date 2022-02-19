Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 138794BC4D8
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 03:27:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A1B10EB28;
	Sat, 19 Feb 2022 02:27:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B920910EB27
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Feb 2022 02:27:01 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id e2so3384842ljq.12
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 18:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=IdQuvPdE/S4qlv5lMX2CTY4ZIw7BaXOuiozopHqRT6w=;
 b=YJkgom0cuyDGDmZTKqx1EYQnaQXBwCUG6RIxkTqqcqRR4mqqViZ0Gk9vT9xoJzwmbJ
 ge5QVQZWhopZrG5enB+6V7MKeApWlo/j+xSK649dXbN3hOnUiRKNSX8K6Td8HwlrUwOx
 ez4U6NPuWOOC+jvfleTf1pZhfoJtD9WgByZzFcYHXUJt1OJYx8YvVQm/WaSSdcUNTKZj
 QY/wAe+tOyj7T0BYXBoROG7VPTQxrtMBCL2gCEIPpYNBCDP1HxDouBzSmxRQafagdT6e
 fagasOfUQilhxwSjYBACsAEv5UZdfklkIZLDMQGzK76ZMD+NZoxPUCEjbibnQIuE5Rqo
 qlZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IdQuvPdE/S4qlv5lMX2CTY4ZIw7BaXOuiozopHqRT6w=;
 b=ZSPmf75mXAN97hjVhOGFHzAHlLWUT1NqAbKcAy7ksUThJFnanP87MEdecxon63C7RA
 whNWFvlARMSGgAVCseTY/jieDVI8v8ZC8imrb2mRIwUwajUsHIGbZl1we68Kv1B8DK7a
 FTj/o6Pu3xWGa/MlIR29+0Oc4XcNNuIFBjCF+94Xb9DBImeQ8vispPmDVc59tTY1LacM
 GnqPhyqyhblfSyvkos0cG1LSyOBnuh5FerjgNVd7ojnDrcGPhRv0lMLbkLXq1BgQikKm
 yymKeP13/WmBW9a1PzThZDo23lEB7IK1cugFTBsULbvq3MiWGGNs1NdKRhbAbr405DZU
 TQYw==
X-Gm-Message-State: AOAM531HSIdKenZRwiucRd4l30k1OC/LnrqQ27bc2v4JIAMW9sfgZiP2
 wGP2GTTP7uxsVipUmUB30dkpCg==
X-Google-Smtp-Source: ABdhPJzfnCK14YHvzUMUBrZak0qwu6CAvdKuc4cafh2DrzArUw7pQPwvTREIpejvLUZftorefoKmXQ==
X-Received: by 2002:a2e:960e:0:b0:246:8fd:7cd5 with SMTP id
 v14-20020a2e960e000000b0024608fd7cd5mr7545520ljh.13.1645237619860; 
 Fri, 18 Feb 2022 18:26:59 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id s2sm434456lfr.126.2022.02.18.18.26.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 18:26:59 -0800 (PST)
Message-ID: <a1b1d3ef-4131-b8a9-5300-89092bce271b@linaro.org>
Date: Sat, 19 Feb 2022 05:26:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [RFC PATCH v2 1/5] drm/msm/dp: fix panel bridge attachment
Content-Language: en-GB
To: Stephen Boyd <swboyd@chromium.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
References: <20220211224006.1797846-1-dmitry.baryshkov@linaro.org>
 <20220211224006.1797846-2-dmitry.baryshkov@linaro.org>
 <CAE-0n52iHFtHppZj-g0V1UP5oWzXjbNDjpOd-hgR+F=TqFzjVg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAE-0n52iHFtHppZj-g0V1UP5oWzXjbNDjpOd-hgR+F=TqFzjVg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/02/2022 02:56, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2022-02-11 14:40:02)
>> In commit 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display
>> enable and disable") the DP driver received a drm_bridge instance, which
>> is always attached to the encoder as a root bridge. However it conflicts
>> with the panel_bridge support for eDP panels. The panel bridge attaches
>> to the encoder before the "dp" bridge has a chace to do so. Change
> 
> s/chace/chance/
> 
>> panel_bridge attachment to come after dp_bridge attachment.
> 
> s/panel_bridge/panel bridge/ possibly? And maybe clarify that dp_bridge
> is the "DP driver's drm_bridge instance created in
> msm_dp_bridge_init()"?
> 
> My understanding is that we want to pass the bridge created in
> msm_dp_bridge_init() as the 'previous' bridge so that it attaches the
> panel bridge to the output of the DP bridge that's attached to the
> encoder.

Thanks! I'll update the commit log when pushing the patches.

> 
>>
>> Fixes: 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display enable and disable")
>> Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> 
>>   drivers/gpu/drm/msm/dp/dp_drm.c | 21 +++++++++++----------
>>   1 file changed, 11 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
>> index d4d360d19eba..26ef41a4c1b6 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
>> @@ -169,16 +169,6 @@ struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display)
>>
>>          drm_connector_attach_encoder(connector, dp_display->encoder);
>>
>> -       if (dp_display->panel_bridge) {
>> -               ret = drm_bridge_attach(dp_display->encoder,
>> -                                       dp_display->panel_bridge, NULL,
>> -                                       DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>> -               if (ret < 0) {
>> -                       DRM_ERROR("failed to attach panel bridge: %d\n", ret);
>> -                       return ERR_PTR(ret);
>> -               }
>> -       }
>> -
>>          return connector;
>>   }
>>
>> @@ -246,5 +236,16 @@ struct drm_bridge *msm_dp_bridge_init(struct msm_dp *dp_display, struct drm_devi
>>                  return ERR_PTR(rc);
>>          }
>>
>> +       if (dp_display->panel_bridge) {
>> +               rc = drm_bridge_attach(dp_display->encoder,
>> +                                       dp_display->panel_bridge, bridge,
>> +                                       DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>> +               if (rc < 0) {
>> +                       DRM_ERROR("failed to attach panel bridge: %d\n", rc);
>> +                       drm_bridge_remove(bridge);
>> +                       return ERR_PTR(rc);
>> +               }
>> +       }
>> +
>>          return bridge;
> 
> Not a problem with this patch, but what is this pointer used for? I see
> it's assigned to priv->bridges and num_bridges is incremented but nobody
> seems to look at that.


That's on my todo list. to remove connectors array and to destroy 
created bridges during drm device destruction.

-- 
With best wishes
Dmitry
