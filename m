Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5879804429
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 02:37:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7023510E460;
	Tue,  5 Dec 2023 01:37:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA39610E45E
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 01:37:19 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-50bf898c43cso1553277e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 17:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701740238; x=1702345038; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WASjpjTYaDMI+M/17yk15wAWPvG4vdjSosKnmO8NGfY=;
 b=amTJ6ZWPIl4dNRkYtczx7ogjey5UZyFsCdE0htUvS236lxdyeEIB5iSF2nPHJxd70d
 ZOC3l0mhFd6Fou2bzWd2QMavKPOtBULgC2bX7hUiW1qO0TN1Ojc4Li+BC+VWyYHz8tO7
 8Hvm87wjYbkhf6gotNH24PWtMEt3S42eXaiwMMG2VNf1jLBOnsLl1LoWWFKwA1FhPICp
 CSPx3EhwxB6GUbdgHzBE+qrfw6y+ua5yHo2hpIXmbpqsozYcPm0aO+V6O7lI+jfnI3Qc
 mJE2NZjuSqFDEHQmNQnr2Iq2aIOZ8K45CdQRsBZzMJa7oiF9BCM6B5IiFicAH+6lPQMV
 0BYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701740238; x=1702345038;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WASjpjTYaDMI+M/17yk15wAWPvG4vdjSosKnmO8NGfY=;
 b=QCWzZdXEv1fgf8skMgRxsAG1xn5ZsXAG6AxMxoQc9wfOQiLhezgQaP8yEY+Uge+0Nl
 1ONAY0DwyL+NMndLaQf7yvmhY5kUDvsc7yO2JhjCKS81ZJKGt71J55Svflx+taLtUAbX
 ruOhW4tKepY77Wsk48/kfHiRUTK5/JTzD3+sEnwzx60VjgQra635jky+nVBumpzhOmSj
 IvW6BxGbcKdkwc41TL3XwoiT+OKojmtngxDcpDMKrao9bJPPFVSxbPAIpjGGS2LuDe7u
 b8fhkD9WFw9onCoPfIbKrfIQydd3tH8auaXOKS65EUjSCn92GXJdtfinYwyMVLTgEW1E
 Vtuw==
X-Gm-Message-State: AOJu0Yz6S/+OdfnHJH5ze4oWShBU4hwcj0K5yWddGt+okjzgnZi2Y+nS
 ZHPZTSFc6eoS8O8he+ZplN6DuHLtPB0a3tJRDVhwo/rb
X-Google-Smtp-Source: AGHT+IFslhiOic1qREeaSAz0mp7DKToeKSsKbXF1VH2ZlFwxZ1cI2ZJ9EDSlD4n7/CMoKxgEbVJkow==
X-Received: by 2002:a05:6512:3b0b:b0:50b:f51a:299c with SMTP id
 f11-20020a0565123b0b00b0050bf51a299cmr1142916lfv.30.1701740237875; 
 Mon, 04 Dec 2023 17:37:17 -0800 (PST)
Received: from ?IPV6:2001:14ba:a0db:1f00::227?
 (dzdqv0yyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::227])
 by smtp.gmail.com with ESMTPSA id
 g13-20020a19ac0d000000b0050bfdaf01e0sm269941lfc.260.2023.12.04.17.37.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Dec 2023 17:37:16 -0800 (PST)
Message-ID: <ff89354d-c9d1-486a-982b-0bb976f6b699@linaro.org>
Date: Tue, 5 Dec 2023 03:37:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] drm/atomic-helper: rename
 drm_atomic_helper_check_wb_encoder_state
Content-Language: en-GB
To: Maxime Ripard <mripard@kernel.org>
References: <20231201220843.2023117-1-dmitry.baryshkov@linaro.org>
 <uqrsl3gehpjybzb6cish7vpub3xznouomn4246b7j4i3qiiumv@enskrm5kpwa5>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <uqrsl3gehpjybzb6cish7vpub3xznouomn4246b7j4i3qiiumv@enskrm5kpwa5>
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
Cc: freedreno@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/12/2023 10:38, Maxime Ripard wrote:
> On Sat, Dec 02, 2023 at 12:07:49AM +0200, Dmitry Baryshkov wrote:
>> The drm_atomic_helper_check_wb_encoder_state() function doesn't use
>> encoder for anything other than getting the drm_device instance. The
>> function's description talks about checking the writeback connector
>> state, not the encoder state. Moreover, there is no such thing as an
>> encoder state, encoders generally do not have a state on their own.
>>
>> Drop the first argument and rename the function to
>> drm_atomic_helper_check_wb_connector_state().
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>
>> Resending, no reaction for two months
>>
>> ---
>>   drivers/gpu/drm/drm_atomic_helper.c   | 10 ++++------
>>   drivers/gpu/drm/vkms/vkms_writeback.c |  2 +-
>>   include/drm/drm_atomic_helper.h       |  3 +--
>>   3 files changed, 6 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
>> index 2444fc33dd7c..d69591381f00 100644
>> --- a/drivers/gpu/drm/drm_atomic_helper.c
>> +++ b/drivers/gpu/drm/drm_atomic_helper.c
>> @@ -795,8 +795,7 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
>>   EXPORT_SYMBOL(drm_atomic_helper_check_modeset);
>>   
>>   /**
>> - * drm_atomic_helper_check_wb_encoder_state() - Check writeback encoder state
>> - * @encoder: encoder state to check
>> + * drm_atomic_helper_check_wb_connector_state() - Check writeback connector state
>>    * @conn_state: connector state to check
>>    *
>>    * Checks if the writeback connector state is valid, and returns an error if it
>> @@ -806,8 +805,7 @@ EXPORT_SYMBOL(drm_atomic_helper_check_modeset);
>>    * Zero for success or -errno
>>    */
>>   int
>> -drm_atomic_helper_check_wb_encoder_state(struct drm_encoder *encoder,
>> -					 struct drm_connector_state *conn_state)
>> +drm_atomic_helper_check_wb_connector_state(struct drm_connector_state *conn_state)
> 
> AFAIK, all the helpers take the object as first argument, so I'm fine
> with the name change but it should take a drm_connector too. And ideally
> a drm_atomic_state pointer instead of drm_connector_state too.

I think we then might take even further step and pass 
drm_writeback_connector to this function. I'll send this as a part of v2.

> 
>>   {
>>   	struct drm_writeback_job *wb_job = conn_state->writeback_job;
>>   	struct drm_property_blob *pixel_format_blob;
>> @@ -827,11 +825,11 @@ drm_atomic_helper_check_wb_encoder_state(struct drm_encoder *encoder,
>>   		if (fb->format->format == formats[i])
>>   			return 0;
>>   
>> -	drm_dbg_kms(encoder->dev, "Invalid pixel format %p4cc\n", &fb->format->format);
>> +	drm_dbg_kms(conn_state->connector->dev, "Invalid pixel format %p4cc\n", &fb->format->format);
> 
> Which would also avoid the checkpatch warning there.
> 
> Maxime

-- 
With best wishes
Dmitry

