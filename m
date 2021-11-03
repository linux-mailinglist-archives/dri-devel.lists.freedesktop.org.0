Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BA8444426
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 16:00:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C8EF73612;
	Wed,  3 Nov 2021 15:00:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43DEF73616
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Nov 2021 15:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635951652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uwI0Y59Q5jmF4PHv+uLDkwhNmEWKp2IZoCsuOpcoatA=;
 b=V8hupRDi7JW+MC8owgkOu+/x5Qo5KaggJE3sSIstfNGwbQoL9+gRulz1GWQFi/8GxGc41a
 enkqUtLyhFFkpJTFmMNpm+gZLs/uvyOcF+btSBtMsx0ql6i57D9Ot9z146O6p1kWLNpk7M
 zPe2NrI7r68797d6wlshTQaNDptLT/A=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-OPiXDLOvPk6OtlDBeB38sQ-1; Wed, 03 Nov 2021 11:00:51 -0400
X-MC-Unique: OPiXDLOvPk6OtlDBeB38sQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 144-20020a1c0496000000b003305ac0e03aso2867122wme.8
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Nov 2021 08:00:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uwI0Y59Q5jmF4PHv+uLDkwhNmEWKp2IZoCsuOpcoatA=;
 b=DcsYZfXqMR5JhUmUbgta6ymO03yiG4NgqLWdD4OW5diYU9pxQXI6HPhaNPEoRvBou7
 ij050tlQuwuEWii0qo9USYeeYdkkwnYzbRBu+Epiz+kNtSoBaFZ/WMiJMILhidetuiSl
 sLZ0F8HjnuWnSPNSRN7GfaShIYVxwyBBl9M5HLyKiAhRKKQ70TtfYWWC7VC6SmCNyrni
 FbQp9x78FgUXpD2cHKDeI5KbjedgeILgeeHP9tP2enCStUs5wPIRs/XvExGSvt6OLtF3
 UfvEAWSsC7g0wgNzB8drCZgZQjSBptNZMMF0Vf97SPRzlON7snnxyMjOZxmXeyvVt09N
 gu8w==
X-Gm-Message-State: AOAM531+8MIyyfxggicjmlfdERbhMjCioVKImadAWVgcYPGb1f/NR4eY
 2rv86EG+CfzPCgR8giU3/a0mT+99dhe4RL+BlPH5Y5s1lBHOzV/WgfnorUGReNYTvbH4Fx7vOmV
 Q7rtbU176cn86Y8ojJyaZQSozu7v5
X-Received: by 2002:a1c:740e:: with SMTP id p14mr15702605wmc.109.1635951649993; 
 Wed, 03 Nov 2021 08:00:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzlHYGSvfJmLDivVAOaT4xxbH7zmwqgCefExXH/bfigpAgkjWjbQ8meeoW65MqFlJvktgySGg==
X-Received: by 2002:a1c:740e:: with SMTP id p14mr15702572wmc.109.1635951649817; 
 Wed, 03 Nov 2021 08:00:49 -0700 (PDT)
Received: from [192.168.1.128] ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id q1sm2089857wmj.20.2021.11.03.08.00.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Nov 2021 08:00:49 -0700 (PDT)
Message-ID: <dbdbaf95-8625-aec9-4446-d39db77b23f2@redhat.com>
Date: Wed, 3 Nov 2021 16:00:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RESEND PATCH 0/5] Cleanups for the nomodeset kernel command line
 parameter logic
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20211103122809.1040754-1-javierm@redhat.com>
 <e02d23be-1a1c-570d-e76f-dbea76b6dd55@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <e02d23be-1a1c-570d-e76f-dbea76b6dd55@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, amd-gfx@lists.freedesktop.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Peter Robinson <pbrobinson@gmail.com>, Neal Gompa <ngompa13@gmail.com>,
 Dave Airlie <airlied@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 nouveau@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, spice-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, intel-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 11/3/21 14:01, Thomas Zimmermann wrote:

[snip]

>>
>>
>> Javier Martinez Canillas (5):
>>    drm/i915: Fix comment about modeset parameters
>>    drm: Move nomodeset kernel parameter handler to the DRM subsystem
>>    drm: Rename vgacon_text_force() function to drm_modeset_disabled()
>>    drm: Add a drm_drv_enabled() helper function
>>    drm: Use drm_drv_enabled() instead of drm_modeset_disabled()
> 
> There's too much churn here IMHO. Please merge patches 2+3 and 4+5. And 
> I'd put patch (4+5) first, so you have the drivers out of the way. After 
> that patch (2+3) should only modify drm_drv_enabled().
>

Sure, I'm happy with less patches.

Thanks for your feedback.
 
> Best regards
> Thomas
> 
Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

