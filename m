Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9381D76D759
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 21:01:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5748510E570;
	Wed,  2 Aug 2023 19:01:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A86DA10E574
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 19:01:24 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-99c1f6f3884so22975066b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Aug 2023 12:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691002883; x=1691607683;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=osatjqbzo6JXPILQNRf8QUtP7yGmhdrE/e+FRS4B8NY=;
 b=Q6qrnGQGmpFmn2tv1ponn9yGlDVg5Ek+b3lggx0DNPLeBggUAlhbvMr1jJ2Ka7dNhi
 EEO4CJJvjy4VIrpKL6pI/J2TUDtvSFOmlKswXNY7IoA6QeSKZGt9NJeazaCdp1PP7YXb
 mR8U5/2w+nMEXBSsJgfzBrMxnzD2Vbkwuuir6dp2XKYLGB1VmY+ekoThUGmjK26/illo
 JOGea7UmxK5ojg1+U/pPGCpk7DAO+JkK9NoPODmRXJQ9+je6mMqZYQFbxwtt4to8tEy7
 YmvuW/fuj0b81Z4nrzQ4beKqyq+cO9MEtE8gCh8O9KOU5jTN/+UglZ/BHznwjUGJiYVB
 iT8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691002883; x=1691607683;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=osatjqbzo6JXPILQNRf8QUtP7yGmhdrE/e+FRS4B8NY=;
 b=LKV52YU6XhpezeiC9xmOMGM/uMzWO48RPHLlZB/5soAPiEjVZ7eQMPSKmr1QV3ESsq
 nMiGZnnqSOOXjFjq5TRuh/Q/O+yj0jGvoi6wRTnmRHOpM6+ysHOp2Of1O3SHOFyobfJd
 +2fppQrLrgCMLZwiKIDb2S1HMqbmzh0lEac6ogWcEo+DrRjQq0MULNayrpx5QB1foKDS
 IBlE4ZrFMDZY6TUVSWry+ulUvHe6uQQXVMMJHqDLrt34LDyRwa3i6FyPjNqjqXMN/tyM
 xpwhT1vL7e1gaTbGPMq3LG5BC0YHdCQrYol0MvLNuWMvr40/E4VrSV/3A8X1samlSvHO
 O03Q==
X-Gm-Message-State: ABy/qLYkl8dqMMi+jd85s5WHeiQ/6uFzH419cGiFrCp5y6ekBAX8pGbA
 kAsE7cCEE8mVyZm13JnUD+kQZA==
X-Google-Smtp-Source: APBJJlGQs27IGKD1hLzqWX1o2A+XRPg/fCz8VX60XxBKLLEPVEnAqXC7Ba2YEC7T9oK7L8iZwnYR8w==
X-Received: by 2002:a17:906:224b:b0:99b:d435:e994 with SMTP id
 11-20020a170906224b00b0099bd435e994mr5895647ejr.32.1691002883015; 
 Wed, 02 Aug 2023 12:01:23 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 jp21-20020a170906f75500b00988c0c175c6sm9441808ejb.189.2023.08.02.12.01.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Aug 2023 12:01:22 -0700 (PDT)
Message-ID: <a32ce695-038f-0ef8-3584-5bd1ba528131@linaro.org>
Date: Wed, 2 Aug 2023 22:01:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/4] drm/uapi: document the USB subconnector type
Content-Language: en-GB
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20230729004913.215872-1-dmitry.baryshkov@linaro.org>
 <20230729004913.215872-4-dmitry.baryshkov@linaro.org>
 <20230802185547.GC32500@pendragon.ideasonboard.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230802185547.GC32500@pendragon.ideasonboard.com>
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, Janne Grunau <j@jannau.net>,
 Robert Foss <rfoss@kernel.org>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andy Gross <agross@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Leo Li <sunpeng.li@amd.com>, intel-gfx@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/08/2023 21:55, Laurent Pinchart wrote:
> Hi Dmitry,
> 
> Thank you for the patch.
> 
> On Sat, Jul 29, 2023 at 03:49:12AM +0300, Dmitry Baryshkov wrote:
>> To properly define the USB-C DP altmode connectors, add the USB
>> subconnector type.
>>
>> Suggested-by: Simon Ser <contact@emersion.fr>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/drm_connector.c | 1 +
>>   include/uapi/drm/drm_mode.h     | 1 +
>>   2 files changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
>> index a6066e4a5e9a..9e96b038f5d0 100644
>> --- a/drivers/gpu/drm/drm_connector.c
>> +++ b/drivers/gpu/drm/drm_connector.c
>> @@ -1050,6 +1050,7 @@ static const struct drm_prop_enum_list drm_dp_subconnector_enum_list[] = {
>>   	{ DRM_MODE_SUBCONNECTOR_DisplayPort, "DP"        }, /* DP */
>>   	{ DRM_MODE_SUBCONNECTOR_Wireless,    "Wireless"  }, /* DP */
>>   	{ DRM_MODE_SUBCONNECTOR_Native,	     "Native"    }, /* DP */
>> +	{ DRM_MODE_SUBCONNECTOR_USB,	     "USB"       }, /* DP */
> 
> Should this be DRM_MODE_SUBCONNECTOR_USB_C and "USB-C", in case we get
> another USB type later ?

Hmm, which id should I use for micro-USB then? (consider anx7808, 
SlimPort). I thought about using DRM_MODE_SUBCONNECTOR_USB for both of 
them. But maybe I should add another subtype for SlimPort.

> 
>>   };
>>   
>>   DRM_ENUM_NAME_FN(drm_get_dp_subconnector_name,
>> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
>> index 92d96a2b6763..0f74918b011c 100644
>> --- a/include/uapi/drm/drm_mode.h
>> +++ b/include/uapi/drm/drm_mode.h
>> @@ -398,6 +398,7 @@ enum drm_mode_subconnector {
>>   	DRM_MODE_SUBCONNECTOR_HDMIA       = 11, /*            DP */
>>   	DRM_MODE_SUBCONNECTOR_Native      = 15, /*            DP */
>>   	DRM_MODE_SUBCONNECTOR_Wireless    = 18, /*            DP */
>> +	DRM_MODE_SUBCONNECTOR_USB         = 20, /*            DP */
>>   };
>>   
>>   #define DRM_MODE_CONNECTOR_Unknown	0
> 

-- 
With best wishes
Dmitry

