Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A19326E776
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 23:35:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D81446E03E;
	Thu, 17 Sep 2020 21:35:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F17866E03E
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 21:35:23 +0000 (UTC)
IronPort-SDR: q5kQuD72uCylSFiIgjVX49IaBKSIEknUC5UuT7ZUcyS3Wa2Tvd6VHFfvPq2jWAcqfmzg8d/gda
 m2nr4Z0lC/bw==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="223969149"
X-IronPort-AV: E=Sophos;i="5.77,272,1596524400"; d="scan'208";a="223969149"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2020 14:35:19 -0700
IronPort-SDR: Q9dXyvDnpLJrDbIMCfVjW0S0GMnX5iGEkiwByOun0p3b/BedA2YB+zHByRuX8thjy2H13dfdqa
 XhO/7GHPuxdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,272,1596524400"; d="scan'208";a="307628762"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 17 Sep 2020 14:35:16 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 18 Sep 2020 00:35:15 +0300
Date: Fri, 18 Sep 2020 00:35:15 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCHv2] dt-bindings: dp-connector: add binding for DisplayPort
 connector
Message-ID: <20200917213515.GE6112@intel.com>
References: <20200917055210.22868-1-tomi.valkeinen@ti.com>
 <20200917112229.GR6112@intel.com>
 <5265c620-ee51-3896-4c5a-9e3284c52327@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5265c620-ee51-3896-4c5a-9e3284c52327@ti.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Swapnil Kashinath Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 17, 2020 at 03:39:38PM +0300, Tomi Valkeinen wrote:
> On 17/09/2020 14:22, Ville Syrj=E4l=E4 wrote:
> > On Thu, Sep 17, 2020 at 08:52:10AM +0300, Tomi Valkeinen wrote:
> >> Add binding for DisplayPort connector. A few notes:
> >>
> >> * Similar to hdmi-connector, it has hpd-gpios as an optional property,
> >>   as the HPD could also be handled by, e.g., the DP bridge.
> >>
> >> * dp-pwr-supply, which provides 3.3V on DP_PWR pin, is optional, as it
> >>   is not strictly required: standard DP cables do not even have the pin
> >>   connected.
> >>
> >> * Connector type. Full size and mini connectors are identical except f=
or
> >>   the connector size and form, so I believe there is no functional need
> >>   for this property. But similar to 'label' property, it might be used
> >>   to present information about the connector to the userspace.
> >>
> >> * No eDP. There's really no "eDP connector", as it's always a custom
> >>   made connection between the DP and the DP panel. So possibly there is
> >>   no need for edp-connector binding, but even if there is, I don't want
> >>   to guess what it could look like, and could it be part of the
> >>   dp-connector binding.
> >>
> >> * No DP++. I'm not familiar with DP++, but I think it's all handled by
> >>   the DP bridge, and does not need any new properties to the dp-connec=
tor.
> > =

> > You might need an i2c bus for this. It's up to the source device
> > to either hook up just AUX CH, or both AUX CH and DDC to a DP++
> > connector. If just AUX CH is wired up you are limited to using
> > only type2 DP dual mode adapters, whereas if you also have DDC
> > the crappier type1 adapters will also work.
> =

> Ok, thanks for the clarifications on this.
> =

> > I guess it's possible some bridges might handle all that for you.
> > But eg. on i915 we always set up both AUX CH and DDC, and some
> > extra circuitry on the board will isolate one or the other
> > depending on what kind of dongle/cable gets plugged in
> > (identified via the CONFIG pins).
> =

> Is that automatic on i915? I could imagine a gpio-controlled mux doing th=
e isolation, and then we
> need some driver controlling the gpio.

Yeah, we don't even get the state of that pin in the driver.
We just blindly probe both DDC and AUX CH. Due to the isolation
only one goes through, the other other just times out.

> =

> I could add the ddc bus the same way as on hdmi-connector.yaml, but perha=
ps it's better to leave
> that for someone with a DP++ board. Afaics, there should be no problems a=
dding this later.

Another option might be to declare both dp and hdmi connectors for
the same physical connector. That's the approach we use for
drm_connectors in i915. But dunno if that's a good idea for dt.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
