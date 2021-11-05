Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6195E446315
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 13:01:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7E6F89CD4;
	Fri,  5 Nov 2021 12:01:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD2989D39
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Nov 2021 12:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636113674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d6mnjEfsvPWlmw0Dlsyl+1vpuoyclHqeKNkGqPRjBhA=;
 b=blUsf+DphCkAa2HzUFHJk6+P+VzzwtzOxDAyn5bgR5WNRZGlPXWs1j2BdkXG88YOnqg8Ay
 TO/sHz4yO/A7M742m4XkmdR1n4lr3z2kNopkY2ejELFhcmmoazFDDpNlPudMu7hH2+8kb4
 SaT2zuHLgAHlqMsJYaQk3CKa5l7A+fk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-JWQpqyBVNDyvIpS-zBtSVA-1; Fri, 05 Nov 2021 08:00:52 -0400
X-MC-Unique: JWQpqyBVNDyvIpS-zBtSVA-1
Received: by mail-wm1-f71.google.com with SMTP id
 j25-20020a05600c1c1900b00332372c252dso3201878wms.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Nov 2021 05:00:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=d6mnjEfsvPWlmw0Dlsyl+1vpuoyclHqeKNkGqPRjBhA=;
 b=5ffcR9YN5NF4oofuQNimuHrmNTtwhy2KGex9KbIbs8T2pnc/gvY5CYcR2/uQ97U6tS
 P1bWYKYMQp9j/RbpNDDMzRUR2oZyIOODcDiqYt+YlN6tkvmAJOZN82HtLoFvk5/6bruN
 To8n6Dl/lWZUgOoC9yORyw9yMivUKjbJTz5bXLZt7UWzvSFTZJiD8oAarwdlHKFKsZok
 OGd8s6Zxq0Q/8D+0exHMNk7Zu2UPvQa62An2EmaJ/fD6GD/9u0vRWvaZ3qyxU4azktu6
 tJqAcpOqcCpft/uFXA9DCoa3vCT/myBr+8f8I86huXK9ESdF462urAAJLCFZpluQ7dN6
 wn7A==
X-Gm-Message-State: AOAM531MjOipCPwRrsGwUSGKoe2fBraFs5vbmF2m9T9fc3RfCSjAXOEV
 mwIeDlQwDnCG3TSvEJsSux+xav6L2s6CKi7IqPM2O9Wtb/DA7nlOiWUfSfk/tDLjdNhNsuubtS/
 +ggi3BKWILsuONSV9HrjW2eOe/UZU
X-Received: by 2002:a05:6000:1868:: with SMTP id
 d8mr36559130wri.285.1636113651755; 
 Fri, 05 Nov 2021 05:00:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxlHaNU9FU6Qy+ImAOwcqW/sLneLxZOG0rukxfbYjqJBdrwuSz7fg+xp3pWIymRwt/FJOPRA==
X-Received: by 2002:a05:6000:1868:: with SMTP id
 d8mr36559073wri.285.1636113651479; 
 Fri, 05 Nov 2021 05:00:51 -0700 (PDT)
Received: from [192.168.1.128] ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id m21sm7590336wrb.2.2021.11.05.05.00.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Nov 2021 05:00:51 -0700 (PDT)
Message-ID: <335a9e0f-cce9-480b-10e0-bd312b81e587@redhat.com>
Date: Fri, 5 Nov 2021 13:00:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 1/2] drm: Add a drm_drv_enabled() to check if drivers
 should be enabled
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20211104160707.1407052-1-javierm@redhat.com>
 <20211104160707.1407052-2-javierm@redhat.com> <87ilx7ae3v.fsf@intel.com>
 <0c07f121-42d3-9f37-1e14-842fb685b501@redhat.com>
 <d4a64906-69e5-3250-2362-79f2afac0a23@suse.de>
 <38dbcc8f-2f95-6846-537f-9b85468bfa87@redhat.com> <877ddmapfj.fsf@intel.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <877ddmapfj.fsf@intel.com>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Hans de Goede <hdegoede@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, amd-gfx@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>, Ben Skeggs <bskeggs@redhat.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Gerd Hoffmann <kraxel@redhat.com>, spice-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Dave Airlie <airlied@redhat.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 virtualization@lists.linux-foundation.org, intel-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/5/21 11:04, Jani Nikula wrote:
> On Fri, 05 Nov 2021, Javier Martinez Canillas <javierm@redhat.com> wrote:

[snip]

>>
>> Do you envision other condition that could be added later to disable a
>> DRM driver ? Or do you think that just from a code readability point of
>> view makes worth it ?
> 
> Taking a step back for perspective.
> 
> I think there's broad consensus in moving the parameter to drm, naming
> the check function to drm_something_something(), and breaking the ties
> to CONFIG_VGA_CONSOLE. I appreciate the work you're doing to that
> effect.
>

Thanks, I appreciate your feedback and comments.
 
> I think everything beyond that is still a bit vague and/or
> contentious. So how about making the first 2-3 patches just that?
> Something we can all agree on, makes good progress, improves the kernel,
> and gives us something to build on?
>

That works for me. Thomas, do you agree with that approach ?
 
Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

