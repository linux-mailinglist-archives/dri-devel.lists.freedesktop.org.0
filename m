Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 128D579CF46
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 13:07:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E66710E3F6;
	Tue, 12 Sep 2023 11:07:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D02410E3F6;
 Tue, 12 Sep 2023 11:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694516831; x=1726052831;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=queqzhRbeR3Nj+YUk9K91rnEmvO6n/oprFrSvOLZ3vs=;
 b=DHuo/3RdKkNvNnccazWYNCIXxp2eD2inpZwKkNPeTz/s0jMUf1DLqb14
 /Xb8HNXEoj2KBvNFekCYy4Btjjej5TrUQEHeRszjGUKWwEHVKq+4I0ASZ
 +2dGTloW27AfpPr9d3by7QnHPWyZSDC8sjFZdakIrGUX4bRtue9bRzORB
 rKtq+80tm1dkYumUDdhurubo9Xz8mEFA7/cgL2b74Yx0NUD5ebLKvue1D
 BzWyv1oLBjt2ODDbaJgiVYYCdFDUJoMZ97FAU2LmUYIyKnwFKsgtbymx3
 yX5kIAxDMGt5ZWfBkroXibCgARx5ZculLuKmFxhjbB4QewL2WrssqII6S g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="378252710"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="378252710"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 04:05:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="1074512474"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="1074512474"
Received: from kuha.fi.intel.com ([10.237.72.185])
 by fmsmga005.fm.intel.com with SMTP; 12 Sep 2023 04:05:52 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Tue, 12 Sep 2023 14:05:51 +0300
Date: Tue, 12 Sep 2023 14:05:51 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [RFC PATCH v1 01/12] Revert "drm/sysfs: Link DRM connectors to
 corresponding Type-C connectors"
Message-ID: <ZQBGD8CY5OVKYX63@kuha.fi.intel.com>
References: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
 <20230903214150.2877023-2-dmitry.baryshkov@linaro.org>
 <ZPbrtAlO2Y+bjDhf@kuha.fi.intel.com>
 <CAA8EJpqUg2-k7LLBL38RHU1sThkXB54ca68xEMd1yMnHQcQ++w@mail.gmail.com>
 <ZPh0Ps9UJ3HLzdeR@kuha.fi.intel.com>
 <CAA8EJpratbBybgk8woD3maA=J_HuQis44Unq0n+c_UvaFs__AA@mail.gmail.com>
 <ZPiAwOf00RREiYPr@kuha.fi.intel.com>
 <6b6bacee-f7b6-4cfe-be3d-24bda44bfbcf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b6bacee-f7b6-4cfe-be3d-24bda44bfbcf@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Janne Grunau <j@jannau.net>,
 Robert Foss <rfoss@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andy Gross <agross@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Won Chung <wonchung@google.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 12, 2023 at 12:15:10AM +0300, Dmitry Baryshkov wrote:
> On 06/09/2023 16:38, Heikki Krogerus wrote:
> > On Wed, Sep 06, 2023 at 03:48:35PM +0300, Dmitry Baryshkov wrote:
> > > On Wed, 6 Sept 2023 at 15:44, Heikki Krogerus
> > > <heikki.krogerus@linux.intel.com> wrote:
> > > > 
> > > > On Tue, Sep 05, 2023 at 01:56:59PM +0300, Dmitry Baryshkov wrote:
> > > > > Hi Heikki,
> > > > > 
> > > > > On Tue, 5 Sept 2023 at 11:50, Heikki Krogerus
> > > > > <heikki.krogerus@linux.intel.com> wrote:
> > > > > > 
> > > > > > Hi Dmitry,
> > > > > > 
> > > > > > On Mon, Sep 04, 2023 at 12:41:39AM +0300, Dmitry Baryshkov wrote:
> > > > > > > The kdev->fwnode pointer is never set in drm_sysfs_connector_add(), so
> > > > > > > dev_fwnode() checks never succeed, making the respective commit NOP.
> > > > > > 
> > > > > > That's not true. The dev->fwnode is assigned when the device is
> > > > > > created on ACPI platforms automatically. If the drm_connector fwnode
> > > > > > member is assigned before the device is registered, then that fwnode
> > > > > > is assigned also to the device - see drm_connector_acpi_find_companion().
> > > > > > 
> > > > > > But please note that even if drm_connector does not have anything in
> > > > > > its fwnode member, the device may still be assigned fwnode, just based
> > > > > > on some other logic (maybe in drivers/acpi/acpi_video.c?).
> > > > > > 
> > > > > > > And if drm_sysfs_connector_add() is modified to set kdev->fwnode, it
> > > > > > > breaks drivers already using components (as it was pointed at [1]),
> > > > > > > resulting in a deadlock. Lockdep trace is provided below.
> > > > > > > 
> > > > > > > Granted these two issues, it seems impractical to fix this commit in any
> > > > > > > sane way. Revert it instead.
> > > > > > 
> > > > > > I think there is already user space stuff that relies on these links,
> > > > > > so I'm not sure you can just remove them like that. If the component
> > > > > > framework is not the correct tool here, then I think you need to
> > > > > > suggest some other way of creating them.
> > > > > 
> > > > > The issue (that was pointed out during review) is that having a
> > > > > component code in the framework code can lead to lockups. With the
> > > > > patch #2 in place (which is the only logical way to set kdev->fwnode
> > > > > for non-ACPI systems) probing of drivers which use components and set
> > > > > drm_connector::fwnode breaks immediately.
> > > > > 
> > > > > Can we move the component part to the respective drivers? With the
> > > > > patch 2 in place, connector->fwnode will be copied to the created
> > > > > kdev's fwnode pointer.
> > > > > 
> > > > > Another option might be to make this drm_sysfs component registration optional.
> > > > 
> > > > You don't need to use the component framework at all if there is
> > > > a better way of determining the connection between the DP and its
> > > > Type-C connector (I'm assuming that that's what this series is about).
> > > > You just need the symlinks, not the component.
> > > 
> > > The problem is that right now this component registration has become
> > > mandatory. And if I set the kdev->fwnode manually (like in the patch
> > > 2), the kernel hangs inside the component code.
> > > That's why I proposed to move the components to the place where they
> > > are really necessary, e.g. i915 and amd drivers.
> > 
> > So why can't we replace the component with the method you are
> > proposing in this series of finding out the Type-C port also with
> > i915, AMD, or whatever driver and platform (that's the only thing that
> > component is used for)?
> 
> The drm/msm driver uses drm_bridge for the pipeline (including the last DP
> entry) and the drm_bridge_connector to create the connector. I think that
> enabling i915 and AMD drivers to use drm_bridge fells out of scope for this
> series.
> 
> 
> > Determining the connection between a DP and its Type-C connector is
> > starting to get really important, so ideally we have a common solution
> > for that.
> 
> Yes. This is what we have been discussing with Simon for quite some time on
> #dri-devel.
> 
> Unfortunately I think the solution that got merged was pretty much hastened
> in instead of being well-thought. For example, it is also not always
> possible to provide the drm_connector / typec_connector links (as you can
> see from the patch7. Sometimes we can only express that this is a Type-C DP
> connector, but we can not easily point it to the particular USB-C port.
> 
> So, I'm not sure, how can we proceed here. Currently merged patch breaks
> drm/msm if we even try to use it by setting kdef->fwnode to
> drm_connector->fwnode. The pointed out `drivers/usb/typec/port-mapper.c` is
> an ACPI-only thing, which is not expected to work in a non-ACPI cases.

You really have to always supply not only the Type-C ports and partners,
but also the alt modes. You need them, firstly to keep things sane
inside kernel, but more importantly, so they are always exposed to the
user space, AND, always the same way. We have ABIs for all this stuff,
including the DP alt mode. Use them. No shortcuts.

So here's what you need to do. UCSI does not seem to bring you
anything useful, so just disable it for now. You don't need it. Your
port driver is clearly drivers/soc/qcom/pmic_glink_altmode.c, so
that's where you need to register all these components - the ports,
partners and alt modes. You have all the needed information there.

Only after you've done that we can start to look at how should the
connection between the DPs and their USB Type-C connectors be handled.

thanks,

-- 
heikki
