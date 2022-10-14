Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCACD5FE60F
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 02:07:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 575D810EA03;
	Fri, 14 Oct 2022 00:07:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C29910EA03
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Oct 2022 00:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665706039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hHkH9nDLl3aJpoOFwoHcbNVheMWWstwOpF0hvFWehWU=;
 b=Z5Rq5FZJXzJ4H+PNk11JzeL9M3bI1WtzEKuBdGj3BoYV34sSemis91Xgaw1fnvExWgZd02
 P9EePI/yoFybfSrO6OVZHH4c8/CIXngFUBUMfuUgnwmrlqqEWDdcqNsvuwF4TauprS6UYL
 4yZ9nS0Xu7hkivsHh5iVZ+sFa2YjfWw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-607-4otSNwQhO2eGNrXNQm6YFA-1; Thu, 13 Oct 2022 20:07:12 -0400
X-MC-Unique: 4otSNwQhO2eGNrXNQm6YFA-1
Received: by mail-ej1-f70.google.com with SMTP id
 dt13-20020a170907728d00b007825956d979so1546372ejc.15
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 17:07:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hHkH9nDLl3aJpoOFwoHcbNVheMWWstwOpF0hvFWehWU=;
 b=P3MULpPeDzlXhf6acLKsFjhpFmoIw0pNIUunISPT0WeZ02mu/TBNAos3HOdOFzoY9a
 7iWw3UMdUrJPEMiCMPJU2KgItqlvehk4RO5S+juW1c897L5IBvzuChzq3OtJOMuH4x5/
 A9sbmwouusgMCrY9i/jUQqquvCK+ELzCn+48xzXMeSY70ojsxtQXmwVX0JVPD25+zVx8
 80m8NRV+suolLuGJkhKoja5Vqusq9m6mZjP8FJqNqMbgKWyQfovbssUPwGOmtTZrSLN5
 +0EiPiJZxlS5SwVFQ0R1gGXtMRKKNJuigH6SofRG26v9CBnFWuJ+UqRVmfi7agskx7ez
 XHPg==
X-Gm-Message-State: ACrzQf0ony5wiLLMmjPxkHUHAEkAzEEEhyLyaM1hfURyJkN/1ZCa6fou
 QsvKEXU7P0kZ0hwka7C/1FyLX9PFx2f73jaOaUXjv+wKXa2RjeCmC/CIuQv8lGEiZ2WicgzPWPC
 BX+PBH88D115H+/JkLOX1hAbPNIUZ
X-Received: by 2002:a17:907:6eac:b0:78d:ce9c:3761 with SMTP id
 sh44-20020a1709076eac00b0078dce9c3761mr1580489ejc.738.1665706031262; 
 Thu, 13 Oct 2022 17:07:11 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6xwFavq+mMqtUbSl48MHAHii/+xABQu3zibneARPMz60To4vvPYW7LegyAT+rcLKCxccJdTw==
X-Received: by 2002:a17:907:6eac:b0:78d:ce9c:3761 with SMTP id
 sh44-20020a1709076eac00b0078dce9c3761mr1580476ejc.738.1665706031070; 
 Thu, 13 Oct 2022 17:07:11 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b40:2ee8:642:1aff:fe31:a15c?
 ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 ky15-20020a170907778f00b0078bfff89de4sm612592ejc.58.2022.10.13.17.07.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Oct 2022 17:07:10 -0700 (PDT)
Message-ID: <4010f21b-4478-d860-c5ba-d6680d35993b@redhat.com>
Date: Fri, 14 Oct 2022 02:07:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH drm-misc-next v3 4/7] drm/arm/hdlcd: use drm_dev_unplug()
To: Liviu Dudau <liviu.dudau@arm.com>
References: <20221001011905.433408-1-dakr@redhat.com>
 <20221001011905.433408-5-dakr@redhat.com>
 <Y0bYGjtAHbjeGJHF@e110455-lin.cambridge.arm.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <Y0bYGjtAHbjeGJHF@e110455-lin.cambridge.arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Liviu,

On 10/12/22 17:07, Liviu Dudau wrote:
> Hi Danilo,
> 
> Appologies again for the delay in reviewing this as I was at XDC last week.

No worries, thanks for following up.

> Looking at the documentation for drm_dev_unplug, you can get a hint about what is going on:
> 
>   /*
>   * [....] There is one
>   * shortcoming however, drm_dev_unplug() marks the drm_device as unplugged before
>   * drm_atomic_helper_shutdown() is called. This means that if the disable code
>   * paths are protected, they will not run on regular driver module unload,
>   * possibly leaving the hardware enabled.
>   */
> 

Yes, that's the issue we have and pretty unfortunate. What we'd want for 
platform device drivers is to still be able to enter the sections locked 
with drm_dev_{enter,exit} on driver unbind, which we can't for at the 
moment.

I discussed this with Daniel Vetter on #dri-devel and for now he 
suggests to just not lock access to platform device bound resources and 
respin the patchset removing those parts.

Besides that I'll also work on a solution for drm_dev_unplug() / 
drm_dev_{enter,exit} to overcome this issue in the future.

> I'm finally getting to a conclusion: I'm still not sure what problem you were trying
> to solve when you have started this series and if you have found a scenario where
> you've got use after free then I would like to be able to reproduce it on my setup.
> Otherwise, I think this whole series introduces a regression on the behaviour of the
> driver and I would be inclined to reject it.

The problem is that DRM modeset objects should never be allocated with 
devm_*, since this can result in use-after free issues on driver unload. 
They should be freed when the last reference to the object is dropped, 
which DRM managed APIs take care of. As a consequence, DRM managed 
objects can potentially out-live platform device bound resources, which 
then should be protected from access. The first at least we can and 
should do.

It's not an issue that's unique to hdlcd, it's just a known issue to be 
addressed by all drivers. There's still the shortcoming concerning 
protecting platform bound resources as discussed above, but "the drmm 
parts should be a good idea no matter what" to cite Daniel.

I'll send a v4 without the drm_dev_{enter,exit} parts removed if that's 
fine for you.

- Danilo

> 
> Best regards,
> Liviu

