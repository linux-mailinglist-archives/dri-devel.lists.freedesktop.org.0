Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA074F77E9
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 09:43:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A74E89DEA;
	Thu,  7 Apr 2022 07:43:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89287898AA
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 07:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649317395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4EX5Jm2qmutxx25UZpYyb3t/77xiYceloaJ7dNE06/A=;
 b=YPn45kSxfJQm5LE8GSum/siKZRSIrPTwETzYotRYqp/IUtiVZDStZkSFYI198yGoR55iMA
 CXWx+KHN0afDDDoDfywdmSHUWg1a9XYn4MWJblWe4nk+B9DqPuSQTowd4HyeL4a7qbtj2p
 6COJHiMjzB5sZXshMT9YWudRZOWSkpg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-tOJmjPBZOvO-poREQH8M0Q-1; Thu, 07 Apr 2022 03:43:11 -0400
X-MC-Unique: tOJmjPBZOvO-poREQH8M0Q-1
Received: by mail-wr1-f72.google.com with SMTP id
 k3-20020adfb343000000b0020605c1e785so985852wrd.18
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Apr 2022 00:43:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4EX5Jm2qmutxx25UZpYyb3t/77xiYceloaJ7dNE06/A=;
 b=x7PQRtJBACjyK+VLYUz6q6T121wxihqsiiBSqXgDrfcGLPr7avEnW8uuBaJyNwX4bx
 f6Soex18p1one4S/garTj0I+FV8/0aPBLvg+CSaQTpvtkAbhOxXckqj0uYOXv1e6/Fyu
 3ujOWaPSH8BiCNTSRkhi5WBcX/w5eOAOsUAI1IbmBu9ODTKP92M0G6J0H9XLN5CG0dQ1
 E1cGqOUeexovPW361mgill+xQ+Vos/TC/KfE3fuUfhXezuU6TpAR/xtjARUoBuqLUoyl
 KEJLd0p0rJKH+knr4/NP+brtrnfN6Yg5WrJjR4zHYZx3/Tjl24gI9J4gq9xyvAc2m5D2
 brIQ==
X-Gm-Message-State: AOAM530dvRAz6pDnSNWyywKmY0Jmz33SmmkGN7CvzD+yd/rSqQhZz4Jm
 HGIZkwyqlNb7VLFGNO8ueDPyA2nL4+1VigFyFpaCIipXLE5qAnOMDsUMDHmcs4xplcdz85Dqeqd
 c0521+vX5WJjp5KGyIsVvpCHE91XG
X-Received: by 2002:a5d:5986:0:b0:205:87ae:9b08 with SMTP id
 n6-20020a5d5986000000b0020587ae9b08mr9683691wri.652.1649317387709; 
 Thu, 07 Apr 2022 00:43:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzna1DlvNodN0MCdEzKf9FVylRqK6Ebsb4WtQzlghQd0W41SCYySLH2G7touh7tDnaixFsIrQ==
X-Received: by 2002:a5d:5986:0:b0:205:87ae:9b08 with SMTP id
 n6-20020a5d5986000000b0020587ae9b08mr9683674wri.652.1649317387477; 
 Thu, 07 Apr 2022 00:43:07 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 q14-20020a1cf30e000000b0038986a18ec8sm6817420wmq.46.2022.04.07.00.43.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Apr 2022 00:43:07 -0700 (PDT)
Message-ID: <f6daa1b3-8267-72ee-182a-6ed61fe650cf@redhat.com>
Date: Thu, 7 Apr 2022 09:43:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 3/8] drm/display: Introduce a DRM display-helper module
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 jani.nikula@linux.intel.com, lyude@redhat.com
References: <20220322192743.14414-1-tzimmermann@suse.de>
 <20220322192743.14414-4-tzimmermann@suse.de>
 <e02eceb6-4bf5-3641-502e-9e5a246ae5fd@redhat.com>
 <b17ead61-b7f1-d57a-d51f-c961d8ad59a1@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <b17ead61-b7f1-d57a-d51f-c961d8ad59a1@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/6/22 21:08, Thomas Zimmermann wrote:
> Hi Javier
> 
> Am 30.03.22 um 11:23 schrieb Javier Martinez Canillas:
>> On 3/22/22 20:27, Thomas Zimmermann wrote:
>>> Replace the DP-helper module with a display-helper module. Update
>>> all related Kconfig and Makefile rules.
>>>
>>> Besides the existing code for DisplayPort, the new module will
>>> contain helpers for other video-output standards, such as HDMI.
>>> Drivers will still be able to select the required video-output
>>> helpers. Linking all such code into a single module avoids the
>>> proliferation of small kernel modules.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> ---
>>
>> [snip]
>>
>>> +config DRM_DISPLAY_HELPER
>>> +	tristate
>>> +	depends on DRM
>>> +	help
>>> +	  DRM helpers for display adapters.
>>> +
>>>   config DRM_DP_HELPER
>>>   	tristate
>>>   	depends on DRM
>>> +	select DRM_DISPLAY_HELPER
>>>   	help
>>>   	  DRM helpers for DisplayPort.
>>>
>>
>> I was about to ask why this would still be needed but then re-read the
>> commit message that says drivers will still be able to select required
>> video-output helpers.
>>
>> That makes sense since the fact that all helpers will be in the same module
>> would be transparent to drivers.
> 
> After some more testing, it turns out to be not so easy. For example, if 
> we have DP_HELPER=m and HDMI_HELPER=y, then DISPLAY_HELPER would be 
> auto-selected as 'y'. The code for DP_HELPER would not be linked correctly.
>
> I'm going to make drivers select DISPLAY_HELPER and the rsp helpers 
> explicitly. The individual helpers would be covered boolean options that 
> enable the feature in the display-helper library.
> 
> If you know some Kconfig magic to enable the original design, let me know.
>

I do not. But I wonder if the problem here is the usage of select rather than
depends and if with the later the original design could still be achieved...

But yes, probably the only way to prevent that issue is to make the drivers
to explicitly select both DRM_DISPLAY_HELPER and respective helpers symbol.
 -- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

