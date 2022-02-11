Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D646C4B30D8
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 23:40:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CE5310EBA3;
	Fri, 11 Feb 2022 22:40:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A72DA10EA6A;
 Fri, 11 Feb 2022 10:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644574418; x=1676110418;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zlXY5BGr3g4aDi06mZ0WehHz0ylIEs18Z4Mc6cjxans=;
 b=Z3/L49OxB4s3aTm3kENxUnr4bfeWKkFZZc8NE39sekQ1BM7Q66gSoCyY
 y6LVdD3UO8lY710cbnNqsRS8iAxC0mr6uViBYYAmrepAHaBYwHXiO7ovQ
 yPWx7OILtGerw3ebvltjR2ozR/4cFQ61Hz4z/wq1Kc9zcet6ZZ6whPvgU
 hsENWyw2SEHFvIorZIByDI0deAYId69gRSJRSnkEhFbGSjY5DgHtE4lL9
 GD+QZw2A6esdwSvQa90+rKlEF0va0MdrZj8SkFj5X0vH3N5IKemL53G5u
 0kwwNZ99tQqJ3HvEAaBEvKXXo7IltzwolEP/FORwTGHj/XYDr9l4Snnb6 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="237109180"
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="237109180"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 02:13:38 -0800
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="483275372"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 02:13:34 -0800
Received: by lahna (sSMTP sendmail emulation); Fri, 11 Feb 2022 12:13:31 +0200
Date: Fri, 11 Feb 2022 12:13:31 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v2 1/9] thunderbolt: move definition of
 PCI_CLASS_SERIAL_USB_USB4
Message-ID: <YgY2yzpJ1VFXY9nF@lahna>
References: <20220210224329.2793-1-mario.limonciello@amd.com>
 <20220210224329.2793-2-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220210224329.2793-2-mario.limonciello@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Fri, 11 Feb 2022 22:40:02 +0000
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
Cc: Michael Jamet <michael.jamet@intel.com>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>,
 Andreas Noever <andreas.noever@gmail.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Alexander.Deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 10, 2022 at 04:43:21PM -0600, Mario Limonciello wrote:
> This PCI class definition of the USB4 device is currently located only in
> the thunderbolt driver.
> 
> It will be needed by a few other drivers for upcoming changes. Move it into
> the common include file.
> 
> Acked-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
