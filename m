Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6817438C5DA
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 13:41:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EAF36E0FC;
	Fri, 21 May 2021 11:41:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00BBA6E0F7;
 Fri, 21 May 2021 11:41:09 +0000 (UTC)
IronPort-SDR: fa56FqsCZBuYh3hY7oZ+jP/ZE1GWLaxvmxwHEW4n9Aflma4vmjw9cz8elv7VOyIO8gozoF3vRx
 amaiooAF0FDw==
X-IronPort-AV: E=McAfee;i="6200,9189,9990"; a="188591880"
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; d="scan'208";a="188591880"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2021 04:41:08 -0700
IronPort-SDR: YIK2n34v8umkm+IAPpDeACOESV7W80LamTXMNDhNBVyAxH8Z1juHU5Snnwo+BCpD7gVo7QOa8D
 jojbaFIOwKRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; d="scan'208";a="544043738"
Received: from kuha.fi.intel.com ([10.237.72.162])
 by fmsmga001.fm.intel.com with SMTP; 21 May 2021 04:41:03 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Fri, 21 May 2021 14:41:03 +0300
Date: Fri, 21 May 2021 14:41:03 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 0/8] drm + usb-type-c: Add support for out-of-band
 hotplug notification (v3)
Message-ID: <YKecT6x9hOoBkyf2@kuha.fi.intel.com>
References: <20210505162415.531876-1-hdegoede@redhat.com>
 <YJosrajgV9zem5lr@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YJosrajgV9zem5lr@kuha.fi.intel.com>
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
Cc: dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 platform-driver-x86@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 11, 2021 at 10:05:26AM +0300, Heikki Krogerus wrote:
> On Wed, May 05, 2021 at 06:24:07PM +0200, Hans de Goede wrote:
> > Hi All,
> > 
> > Here is v3 of my patchset making DP over Type-C work on devices where the
> > Type-C controller does not drive the HPD pin on the GPU, but instead
> > we need to forward HPD events from the Type-C controller to the DRM driver.
> 
> These look good to me. I can also test these next week if needed. I'll
> give my Tested-by tag after that if these haven't been taken by
> anybody by that.

It's almost weird to see console output from the Type-C connector on
my good old GPD printed to an actual display :-)

At least in my tests, the DP alt mode driver now calls
drm_connector_oob_hotplug_event() only when it should. This is pretty cool!
FWIW:

Tested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>


thanks,

-- 
heikki
