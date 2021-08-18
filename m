Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 880183F0DD8
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 00:03:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A92890A5;
	Wed, 18 Aug 2021 22:03:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F85B6E8D9
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 22:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629324219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oK2hoz1pNxOtprsAxgLW7HzE+yMICN6HsSK04cEBylI=;
 b=U1M12Ef79gIzWfAIQ3nKTA5kV9J77YweVmr2XZeQqYPDhkfg47XtnhBmbV+pFsI9aCK4qW
 U2atCuQs/Zh0SOhFeUYi5WFzUK7cJ4ejWAY/7kGLTZi5Mk5nZXP+LPiSPTeQ5a4glYODvi
 oxPVlQQ305AT9dYNocq1IcpdZfO4Zew=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-03wqR7WlOIGqBb0jVYP9NQ-1; Wed, 18 Aug 2021 18:03:38 -0400
X-MC-Unique: 03wqR7WlOIGqBb0jVYP9NQ-1
Received: by mail-qv1-f69.google.com with SMTP id
 b2-20020a0cc9820000b0290352b2c7d7e1so3179735qvk.9
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 15:03:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=oK2hoz1pNxOtprsAxgLW7HzE+yMICN6HsSK04cEBylI=;
 b=VIDybnMYP764BSTiTh9fp3DvPDsfi0tmK2K/PzAj/h/ZKBLME4Cs/+pq6mLY8hatyr
 b0pSqY2TzQMboasQ03QOi9NcS4X09Zr3CwOrFIJ2lcyYqBWeNl1sIkvbg+Z4RIH/9XxS
 VDkcgcNnWuEcmskeud4yStr7bgEVLXihv5mNhMG/NKPEnoili1Iqo4DgpsIHNnPx/SK6
 Vy/rQ/P4ZBo2D9DnYw/yjQLkgjUHM5Wt4Ssd/mbG4qTZmA2kQYj/SzGNkkl8ydojK/3i
 w5Zp7zxKCIheV5iErwgutBHa21kF+1qod8rBQ7CocSs0IcfH3ogZy4yu+lNxdYSM1WJb
 4tNQ==
X-Gm-Message-State: AOAM532VR2jNGUZg234p2tdb+DMmF5+7GQ7k8NRfapMmYWgaReeLJwO3
 9OAgARS1SEevfOSDGq7N+RYiajQ1FaItY/cZtR540WlJRxjQpxvp8d030P1Wqdw6M/uktH60X3F
 /++qXhzVx4w3Q/k2YLACfPsYjU+Hv
X-Received: by 2002:a37:8a44:: with SMTP id m65mr520040qkd.72.1629324218131;
 Wed, 18 Aug 2021 15:03:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzc1VLlBPcs2iR13iycuCWuLv6rS+CUis7hvVYcDzugjfZJrLwBK518fpIWhBKDSKQE00KYsg==
X-Received: by 2002:a37:8a44:: with SMTP id m65mr520023qkd.72.1629324217953;
 Wed, 18 Aug 2021 15:03:37 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id b19sm620360qkc.7.2021.08.18.15.03.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 15:03:37 -0700 (PDT)
Message-ID: <1f5f00e0042e48bc3420c3f17457e82d83e68567.camel@redhat.com>
Subject: Re: [PATCH 0/8] drm + usb-type-c: Add support for out-of-band
 hotplug notification (v4 resend)
From: Lyude Paul <lyude@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Imre Deak <imre.deak@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, Heikki
 Krogerus <heikki.krogerus@linux.intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org,  linux-usb@vger.kernel.org
Date: Wed, 18 Aug 2021 18:03:35 -0400
In-Reply-To: <20210817215201.795062-1-hdegoede@redhat.com>
References: <20210817215201.795062-1-hdegoede@redhat.com>
Organization: Red Hat
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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

This looks great to me! Wasn't much to comment on here as most of this looks
fine to me. For the whole series:

Reviewed-by: Lyude Paul <lyude@redhat.com>

This will be quite interesting to try getting working for nouveau

On Tue, 2021-08-17 at 23:51 +0200, Hans de Goede wrote:
> Hi all,
> 
> Here is a rebased-resend of v4 of my patchset making DP over Type-C work on
> devices where the Type-C controller does not drive the HPD pin on the GPU,
> but instead we need to forward HPD events from the Type-C controller to
> the DRM driver.
> 
> Changes in v4 resend:
> - Rebase on top of latest drm-tip
> 
> Changes in v4:
> - Rebase on top of latest drm-tip
> - Add forward declaration for struct fwnode_handle to drm_crtc_internal.h
>   (fixes warning reported by kernel test robot <lkp@intel.com>)
> - Add Heikki's Reviewed-by to patch 7 & 8
> - Add Heikki's Tested-by to the series
> 
> Changes in v3:
> - Base on top of latest drm-tip, which should fix the CI being unable to
>   apply (and thus to test) the patches
> - Make intel_acpi_assign_connector_fwnodes() take a ref on the fwnode
>   it stores in connector->fwnode and have drm_connector_cleanup() put
>   this reference
> - Drop data argument from drm_connector_oob_hotplug_event()
> - Make the Type-C DP altmode code only call
> drm_connector_oob_hotplug_event()
>   when the HPD bit in the status vdo changes
> - Drop the platform/x86/intel_cht_int33fe: Correct "displayport" fwnode
>   reference patch, this will be merged independently through the pdx86 tree
> 
> Changes in v2:
> - Replace the bogus "drm/connector: Make the drm_sysfs connector->kdev
>   device hold a reference to the connector" patch with:
>   "drm/connector: Give connector sysfs devices there own device_type"
>   the new patch is a dep for patch 2/9 see the patches
> 
> - Stop using a class-dev-iter, instead at a global connector list
>   to drm_connector.c and use that to find the connector by the fwnode,
>   similar to how we already do this in drm_panel.c and drm_bridge.c
> 
> - Make drm_connector_oob_hotplug_event() take a fwnode pointer as
>   argument, rather then a drm_connector pointer and let it do the
>   lookup itself. This allows making drm_connector_find_by_fwnode() a
>   drm-internal function and avoids code outside the drm subsystem
>   potentially holding on the a drm_connector reference for a longer
>   period.
> 
> This series not only touches drm subsys files but it also touches
> drivers/usb/typec/altmodes/typec_displayport.c, that file usually
> does not see a whole lot of changes. So I believe it would be best
> to just merge the entire series through drm-misc, Assuming we can
> get an ack from Greg for merging the typec_displayport.c changes
> this way.
> 
> Regards,
> 
> Hans
> 
> Hans de Goede (7):
>   drm/connector: Give connector sysfs devices there own device_type
>   drm/connector: Add a fwnode pointer to drm_connector and register with
>     ACPI (v2)
>   drm/connector: Add drm_connector_find_by_fwnode() function (v3)
>   drm/connector: Add support for out-of-band hotplug notification (v3)
>   drm/i915/dp: Add support for out-of-bound hotplug events
>   usb: typec: altmodes/displayport: Make dp_altmode_notify() more
>     generic
>   usb: typec: altmodes/displayport: Notify drm subsys of hotplug events
> 
> Heikki Krogerus (1):
>   drm/i915: Associate ACPI connector nodes with connector entries (v2)
> 
>  drivers/gpu/drm/drm_connector.c              | 79 ++++++++++++++++++
>  drivers/gpu/drm/drm_crtc_internal.h          |  2 +
>  drivers/gpu/drm/drm_sysfs.c                  | 87 +++++++++++++++++---
>  drivers/gpu/drm/i915/display/intel_acpi.c    | 46 +++++++++++
>  drivers/gpu/drm/i915/display/intel_acpi.h    |  3 +
>  drivers/gpu/drm/i915/display/intel_display.c |  1 +
>  drivers/gpu/drm/i915/display/intel_dp.c      | 12 +++
>  drivers/usb/typec/altmodes/Kconfig           |  1 +
>  drivers/usb/typec/altmodes/displayport.c     | 58 ++++++++-----
>  include/drm/drm_connector.h                  | 25 ++++++
>  10 files changed, 279 insertions(+), 35 deletions(-)
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

