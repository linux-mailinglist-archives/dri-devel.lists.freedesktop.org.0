Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 684F53F5A07
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 10:45:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCBB789C94;
	Tue, 24 Aug 2021 08:45:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B253789BE8;
 Tue, 24 Aug 2021 08:45:43 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10085"; a="197514865"
X-IronPort-AV: E=Sophos;i="5.84,346,1620716400"; d="scan'208";a="197514865"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2021 01:45:42 -0700
X-IronPort-AV: E=Sophos;i="5.84,346,1620716400"; d="scan'208";a="526534192"
Received: from romerosa-mobl.amr.corp.intel.com (HELO localhost)
 ([10.249.44.170])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2021 01:45:39 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: "dri-devel\@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [GIT PULL] drm-misc + drm-intel: Add support for out-of-band
 hotplug notification
In-Reply-To: <34f13e21-9b1a-5f54-7e03-9705a6b51428@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <34f13e21-9b1a-5f54-7e03-9705a6b51428@redhat.com>
Date: Tue, 24 Aug 2021 11:45:36 +0300
Message-ID: <871r6jgrin.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, 20 Aug 2021, Hans de Goede <hdegoede@redhat.com> wrote:
> Hello drm-misc and drm-intel maintainers,
>
> My "Add support for out-of-band hotplug notification" patchset:
> https://patchwork.freedesktop.org/series/93763/
>
> Is ready for merging now, as discussed on IRC I based this series
> on top drm-tip and when trying to apply the i915 parts on top
> of drm-misc this fails due to conflict.
>
> So as Jani suggested here is a pull-req for a topic-branch with the
> entire set, minus the troublesome i915 bits. Once this has been merged
> into both drm-misc-next and drm-intel-next I can push the 2 i915
> patch do drm-intel-next on top of the merge.
>
> Note there are also 2 drivers/usb/typec patches in here these
> have Greg KH's Reviewed-by for merging through the drm tree,
> Since this USB code does not change all that much. I also checked
> and the drm-misc-next-2021-08-12 base of this tree contains the
> same last commit to the modified file as usb-next.
>
> Daniel Vetter mentioned on IRC that it might be better for you to simply
> pick-up the series directly from patchwork, that is fine too in that
> case don't forget to add:
>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
>
> To the entire series (given in a reply to the cover-letter)
>
> And:
>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>
> To the usb/typec patches (patch 7/8), this was given in reply
> to a previous posting of the series and I forgot to add this
> in the resend.

Since this is mostly touching drm core, I think it should be merged to
drm-misc-next first, and drm-intel-next after. Please let us know.

BR,
Jani.


>
> Regards,
>
> Hans
>
>
> The following changes since commit c7782443a88926a4f938f0193041616328cf2db2:
>
>   drm/bridge: ti-sn65dsi86: Avoid creating multiple connectors (2021-08-12 09:56:09 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git drm-misc-intel-oob-hotplug-v1
>
> for you to fetch changes up to 7f811394878535ed9a6849717de8c2959ae38899:
>
>   usb: typec: altmodes/displayport: Notify drm subsys of hotplug events (2021-08-20 12:35:59 +0200)
>
> ----------------------------------------------------------------
> Topic branch for drm-misc / drm-intel for OOB hotplug support for Type-C connectors
>
> ----------------------------------------------------------------
> Hans de Goede (6):
>       drm/connector: Give connector sysfs devices there own device_type
>       drm/connector: Add a fwnode pointer to drm_connector and register with ACPI (v2)
>       drm/connector: Add drm_connector_find_by_fwnode() function (v3)
>       drm/connector: Add support for out-of-band hotplug notification (v3)
>       usb: typec: altmodes/displayport: Make dp_altmode_notify() more generic
>       usb: typec: altmodes/displayport: Notify drm subsys of hotplug events
>
>  drivers/gpu/drm/drm_connector.c          | 79 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_crtc_internal.h      |  2 +
>  drivers/gpu/drm/drm_sysfs.c              | 87 +++++++++++++++++++++++++++-----
>  drivers/usb/typec/altmodes/Kconfig       |  1 +
>  drivers/usb/typec/altmodes/displayport.c | 58 +++++++++++++--------
>  include/drm/drm_connector.h              | 25 +++++++++
>  6 files changed, 217 insertions(+), 35 deletions(-)
>

-- 
Jani Nikula, Intel Open Source Graphics Center
