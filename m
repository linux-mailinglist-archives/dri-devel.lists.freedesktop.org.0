Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4445E76D75C
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 21:01:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31AA810E576;
	Wed,  2 Aug 2023 19:01:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AB8D10E576
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 19:01:43 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-99c4923195dso20654166b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Aug 2023 12:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691002901; x=1691607701;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/uiXLFyqi0TndokC8iIHz7AB81dmdZPxdDe2lbHBIzg=;
 b=xH5Jx9JeUwB4GKaJHzrgaIT/rj7R0LF5NIlk0zUNeO3OO5E+5ha1rO3JAwqGYNwwKK
 a5Hk6WyByeQ4psaheJn/mUzrEVZTmtfgmxf57fcTUmSWE1cFBpwL/UBSE1pACxpH535t
 vTZAufALnNiIqoL5TibeGRK4Yy5ysdveiFnn3f+pnRrFwSVsWoaaq6H9MB1/TxsIiSUJ
 yPtc3UlHszp5DozN9hmfCR1Xbe9u+wIg958zyp12OtPgi3rTNs/+LSw132hs3bmZJhCF
 iBlC+ZfFBfhwxT3QtZQhGbPOhEDpoQ1eOQ+33xHIwYnAndFBS2o51vjSmTfQPWKIHq3n
 43Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691002901; x=1691607701;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/uiXLFyqi0TndokC8iIHz7AB81dmdZPxdDe2lbHBIzg=;
 b=DaZVQKAbXOfH1HVVmegpkIxxdaZ8NRaoovsMBo8ugPoYgiY4E+Zj9iiM13CnNAoaZ2
 It3gABpmjqfqEaeZmwPm6KOYlzBQDzOkAhVg0Y00mKtXLsZx201aAZSa2NJLqal8csQU
 X9j6R1tT8Dz/gqd2AtGP04ApoRFZQKj6cWEF9cTiU3pMYPiS6ojkIUG3uvwUWxUHSYo6
 pgbzhw9D0elDb6mTpbz3OKoqg7/ivFKSRe88VDXhJIIhO1rS9i/9w/Y6KPZN4wNUPvD6
 +/YZ5eh14FIpacnwV60wiXRvPMEYr7Z3EYif0kRNExiZaXhloYXfOK+/3V1mV+PBqU/O
 ijpg==
X-Gm-Message-State: ABy/qLY4XayY3SrOCUwu/ZBo2odU6eiFiUeoPc8zxBK+IEHxHvspGY4j
 mg/CkSVdNhUwO5a+ZETiZa6nBA==
X-Google-Smtp-Source: APBJJlE0H43SsQYhz99YLYTzxIw5ENQZXyxljRBlHAGwbqHbO06ZdJLEg9WMvEDC4tAwWU+YeOVzcQ==
X-Received: by 2002:a17:906:31c2:b0:98e:419b:4cbc with SMTP id
 f2-20020a17090631c200b0098e419b4cbcmr5254910ejf.12.1691002901628; 
 Wed, 02 Aug 2023 12:01:41 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 ks18-20020a170906f85200b00977ca5de275sm9663559ejb.13.2023.08.02.12.01.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Aug 2023 12:01:41 -0700 (PDT)
Message-ID: <3ddc1074-a428-c253-d630-2257de28ade2@linaro.org>
Date: Wed, 2 Aug 2023 22:01:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/4] drm: allow specifying default subtype for the DP
 subconnector property
Content-Language: en-GB
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20230729004913.215872-1-dmitry.baryshkov@linaro.org>
 <20230729004913.215872-2-dmitry.baryshkov@linaro.org>
 <20230802185454.GA29718@pendragon.ideasonboard.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230802185454.GA29718@pendragon.ideasonboard.com>
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

On 02/08/2023 21:54, Laurent Pinchart wrote:
> Hi Dmitry,
> 
> Thank you for the patch.
> 
> On Sat, Jul 29, 2023 at 03:49:10AM +0300, Dmitry Baryshkov wrote:
>> In the embedded usecases the default subtype depends on the bridge
>> chain, so it is easier to specify the subtype at the proprety attachment
> 
> s/proprety/property/
> 
>> type rather than specifying it later.
> 
> Did you mean s/type/time/ ?
> 
> I think I understand why you need this, looking at patch 2/4, but the
> commit message isn't very clear. It would benefit from being reworded.

Ack, thanks for the feedback.

> 
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c              | 3 ++-
>>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 3 ++-
>>   drivers/gpu/drm/drm_connector.c                             | 6 ++++--
>>   drivers/gpu/drm/i915/display/intel_dp.c                     | 3 ++-
>>   include/drm/drm_connector.h                                 | 3 ++-
>>   5 files changed, 12 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
>> index d34037b85cf8..c18459ecd4be 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
>> @@ -2022,7 +2022,8 @@ amdgpu_connector_add(struct amdgpu_device *adev,
>>   
>>   	if (connector_type == DRM_MODE_CONNECTOR_DisplayPort ||
>>   	    connector_type == DRM_MODE_CONNECTOR_eDP) {
>> -		drm_connector_attach_dp_subconnector_property(&amdgpu_connector->base);
>> +		drm_connector_attach_dp_subconnector_property(&amdgpu_connector->base,
>> +							      DRM_MODE_SUBCONNECTOR_Unknown);
>>   	}
>>   
>>   	return;
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
>> index 943959012d04..297321f0199e 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
>> @@ -759,7 +759,8 @@ void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
>>   	drm_dp_mst_topology_mgr_init(&aconnector->mst_mgr, adev_to_drm(dm->adev),
>>   				     &aconnector->dm_dp_aux.aux, 16, 4, aconnector->connector_id);
>>   
>> -	drm_connector_attach_dp_subconnector_property(&aconnector->base);
>> +	drm_connector_attach_dp_subconnector_property(&aconnector->base,
>> +						      DRM_MODE_SUBCONNECTOR_Unknown);
>>   }
>>   
>>   int dm_mst_get_pbn_divider(struct dc_link *link)
>> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
>> index a3d3e7dc08b2..a6066e4a5e9a 100644
>> --- a/drivers/gpu/drm/drm_connector.c
>> +++ b/drivers/gpu/drm/drm_connector.c
>> @@ -1577,10 +1577,12 @@ EXPORT_SYMBOL(drm_mode_create_dvi_i_properties);
>>   /**
>>    * drm_connector_attach_dp_subconnector_property - create subconnector property for DP
>>    * @connector: drm_connector to attach property
>> + * @subtype: initial value for the subconnector type
>>    *
>>    * Called by a driver when DP connector is created.
>>    */
>> -void drm_connector_attach_dp_subconnector_property(struct drm_connector *connector)
>> +void drm_connector_attach_dp_subconnector_property(struct drm_connector *connector,
>> +						   enum drm_mode_subconnector subtype)
>>   {
>>   	struct drm_mode_config *mode_config = &connector->dev->mode_config;
>>   
>> @@ -1594,7 +1596,7 @@ void drm_connector_attach_dp_subconnector_property(struct drm_connector *connect
>>   
>>   	drm_object_attach_property(&connector->base,
>>   				   mode_config->dp_subconnector_property,
>> -				   DRM_MODE_SUBCONNECTOR_Unknown);
>> +				   subtype);
>>   }
>>   EXPORT_SYMBOL(drm_connector_attach_dp_subconnector_property);
>>   
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
>> index 474785110662..5819105187f6 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>> @@ -5391,7 +5391,8 @@ intel_dp_add_properties(struct intel_dp *intel_dp, struct drm_connector *connect
>>   	enum port port = dp_to_dig_port(intel_dp)->base.port;
>>   
>>   	if (!intel_dp_is_edp(intel_dp))
>> -		drm_connector_attach_dp_subconnector_property(connector);
>> +		drm_connector_attach_dp_subconnector_property(connector,
>> +							      DRM_MODE_SUBCONNECTOR_Unknown);
>>   
>>   	if (!IS_G4X(dev_priv) && port != PORT_A)
>>   		intel_attach_force_audio_property(connector);
>> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
>> index 5a8115dca359..a130a78f6e0f 100644
>> --- a/include/drm/drm_connector.h
>> +++ b/include/drm/drm_connector.h
>> @@ -1990,7 +1990,8 @@ const char *drm_get_hdcp_content_type_name(int val);
>>   int drm_get_tv_mode_from_name(const char *name, size_t len);
>>   
>>   int drm_mode_create_dvi_i_properties(struct drm_device *dev);
>> -void drm_connector_attach_dp_subconnector_property(struct drm_connector *connector);
>> +void drm_connector_attach_dp_subconnector_property(struct drm_connector *connector,
>> +						   enum drm_mode_subconnector subtype);
>>   
>>   int drm_mode_create_tv_margin_properties(struct drm_device *dev);
>>   int drm_mode_create_tv_properties_legacy(struct drm_device *dev,
> 

-- 
With best wishes
Dmitry

