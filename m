Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8973F632B
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 18:49:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68EDC899E9;
	Tue, 24 Aug 2021 16:49:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBC2C899DB
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Aug 2021 16:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629823745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kmI8hocKzE/m+bwvMVeJGFmHx34XKrmkWhq5ToJHaEI=;
 b=VwZ51M5MgtEnLizpAFgtprb2mwGZ0zbgGBp/Ex4Yi7Gx46U1x9U1bASNbtcVkLBOBVXFUk
 +OOP5N4SymTh7zOCD3aBgOglJxt5oQGQMaMkGPVGgZs5bdPP3L4ziMSOLCIdTZCmJfcSJl
 v9v0ZiKk3c4EFgXe8sdK7gMIzBqsqmM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-8oVIUH8uMnSdqvhhLo0lkA-1; Tue, 24 Aug 2021 12:49:02 -0400
X-MC-Unique: 8oVIUH8uMnSdqvhhLo0lkA-1
Received: by mail-ej1-f70.google.com with SMTP id
 q15-20020a17090622cf00b005c42d287e6aso3298124eja.18
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Aug 2021 09:49:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kmI8hocKzE/m+bwvMVeJGFmHx34XKrmkWhq5ToJHaEI=;
 b=X0PE6uEWu7rAsRP5Uga2XyzLsX6KWOdMmA7XaERjafjaZfGQYTKrVS0QV9SCTc8as4
 giXLFgUKHkYMEStpGyS2T7/rhx4Pgus+Li64aPfTU+lzgvYXdkXYxf6Y0Kd69+gwyse0
 F0w7b6wIrnErD1HTKMs4WKN+4r5/soAsUFV6pb7nF06+M90SIH3701C155sEI0BWscOR
 CbHxlDeuMCMeveCh1JJ+KpAoMqILa0/ZtvLMmFkQFskHBm4d8wJYic197MIx9Lg2tXfR
 qJhFhFimhtC1vwNZxbbZNRLI2h18JC7ogAOWzq6z0GsFAqMlpPDuULD2DuyYqEVnqqow
 4g4A==
X-Gm-Message-State: AOAM5315LXneERUIfIzvYj7wmDwXL/pMEiA8+uy8qs3JocZuQvrukXvt
 fdW78BlXs9KnU3i42MSK4hdyt9mPItD8yD15D2cJYGpLEUslUXQuwGK++HlldjVlDuxLR5zsq0m
 rcn6Fnh2tazv0Kno9wyZqEsEV7aQY
X-Received: by 2002:a50:d587:: with SMTP id v7mr10156660edi.120.1629823741204; 
 Tue, 24 Aug 2021 09:49:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8p9ZhB+YjhzpWWotEUbkffC5uCyVDihhEeekgXfX+ojksKruVky8vDsNitTFruPAJncVoXA==
X-Received: by 2002:a50:d587:: with SMTP id v7mr10156650edi.120.1629823741044; 
 Tue, 24 Aug 2021 09:49:01 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id dh8sm11642769edb.14.2021.08.24.09.49.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Aug 2021 09:49:00 -0700 (PDT)
Subject: Re: [GIT PULL] drm-misc + drm-intel: Add support for out-of-band
 hotplug notification
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel@ffwll.ch>
References: <34f13e21-9b1a-5f54-7e03-9705a6b51428@redhat.com>
 <871r6jgrin.fsf@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <15400f71-dfe6-3142-d191-596ef9af7e7a@redhat.com>
Date: Tue, 24 Aug 2021 18:48:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <871r6jgrin.fsf@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 8/24/21 10:45 AM, Jani Nikula wrote:
> On Fri, 20 Aug 2021, Hans de Goede <hdegoede@redhat.com> wrote:
>> Hello drm-misc and drm-intel maintainers,
>>
>> My "Add support for out-of-band hotplug notification" patchset:
>> https://patchwork.freedesktop.org/series/93763/
>>
>> Is ready for merging now, as discussed on IRC I based this series
>> on top drm-tip and when trying to apply the i915 parts on top
>> of drm-misc this fails due to conflict.
>>
>> So as Jani suggested here is a pull-req for a topic-branch with the
>> entire set, minus the troublesome i915 bits. Once this has been merged
>> into both drm-misc-next and drm-intel-next I can push the 2 i915
>> patch do drm-intel-next on top of the merge.
>>
>> Note there are also 2 drivers/usb/typec patches in here these
>> have Greg KH's Reviewed-by for merging through the drm tree,
>> Since this USB code does not change all that much. I also checked
>> and the drm-misc-next-2021-08-12 base of this tree contains the
>> same last commit to the modified file as usb-next.
>>
>> Daniel Vetter mentioned on IRC that it might be better for you to simply
>> pick-up the series directly from patchwork, that is fine too in that
>> case don't forget to add:
>>
>> Reviewed-by: Lyude Paul <lyude@redhat.com>
>>
>> To the entire series (given in a reply to the cover-letter)
>>
>> And:
>>
>> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>
>> To the usb/typec patches (patch 7/8), this was given in reply
>> to a previous posting of the series and I forgot to add this
>> in the resend.
> 
> Since this is mostly touching drm core, I think it should be merged to
> drm-misc-next first, and drm-intel-next after. Please let us know.

I agree this should go to drm-misc-next first.

(I was planning on pushing this to drm-misc-next myself,
but then ended up going with the topic branch because of the
conflict in the i915 bits.)

Regards,

Hans



>> The following changes since commit c7782443a88926a4f938f0193041616328cf2db2:
>>
>>   drm/bridge: ti-sn65dsi86: Avoid creating multiple connectors (2021-08-12 09:56:09 -0700)
>>
>> are available in the Git repository at:
>>
>>   git://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git drm-misc-intel-oob-hotplug-v1
>>
>> for you to fetch changes up to 7f811394878535ed9a6849717de8c2959ae38899:
>>
>>   usb: typec: altmodes/displayport: Notify drm subsys of hotplug events (2021-08-20 12:35:59 +0200)
>>
>> ----------------------------------------------------------------
>> Topic branch for drm-misc / drm-intel for OOB hotplug support for Type-C connectors
>>
>> ----------------------------------------------------------------
>> Hans de Goede (6):
>>       drm/connector: Give connector sysfs devices there own device_type
>>       drm/connector: Add a fwnode pointer to drm_connector and register with ACPI (v2)
>>       drm/connector: Add drm_connector_find_by_fwnode() function (v3)
>>       drm/connector: Add support for out-of-band hotplug notification (v3)
>>       usb: typec: altmodes/displayport: Make dp_altmode_notify() more generic
>>       usb: typec: altmodes/displayport: Notify drm subsys of hotplug events
>>
>>  drivers/gpu/drm/drm_connector.c          | 79 +++++++++++++++++++++++++++++
>>  drivers/gpu/drm/drm_crtc_internal.h      |  2 +
>>  drivers/gpu/drm/drm_sysfs.c              | 87 +++++++++++++++++++++++++++-----
>>  drivers/usb/typec/altmodes/Kconfig       |  1 +
>>  drivers/usb/typec/altmodes/displayport.c | 58 +++++++++++++--------
>>  include/drm/drm_connector.h              | 25 +++++++++
>>  6 files changed, 217 insertions(+), 35 deletions(-)
>>
> 

