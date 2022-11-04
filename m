Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FA26191CA
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 08:23:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E2BA10E6ED;
	Fri,  4 Nov 2022 07:23:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DDE510E6ED
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 07:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667546619; x=1699082619;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jNIWc97tS6wGon8k/Fw7hFZDoAAsSFUxCPMc9Hd2YGc=;
 b=eFWd4QlfdOGCGklOlExmdEMAd+FcWxdbn8DgvrJxLptsNGGMQL229UZk
 x0AU0xgJ9QUXGHlOZhGhW0i11bwAQk3FXGSv1qjLGhkhqis1FFCsLgHUt
 ryqTQxQ7G/PSob1O/63W+5ORHF9WWP+drVmmsaRjc0CTfUbRej6pRyyTo
 BsiQWJf7W/arG9Lkq9yeyBkv3k9TiDacGZQPwnBa+sqN5j1uBHP9rnjFS
 z1+I8lBbh17vsZTCGMtbYGLxljLtObfqAYaXhbeqYfeEl+0207Iz4MX7r
 H7MDuLEsYFrGa3a3i0ITMYSPYwfEUNn8YO9RtXY1Du1lRgFQZYdnaPSix w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="374140454"
X-IronPort-AV: E=Sophos;i="5.96,136,1665471600"; d="scan'208";a="374140454"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2022 00:23:38 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="880200009"
X-IronPort-AV: E=Sophos;i="5.96,136,1665471600"; d="scan'208";a="880200009"
Received: from joe-255.igk.intel.com (HELO localhost) ([172.22.229.67])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2022 00:23:34 -0700
Date: Fri, 4 Nov 2022 08:23:32 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [RFC PATCH v2 1/3] drivers/accel: define kconfig and register a
 new major
Message-ID: <20221104072332.GA3149018@linux.intel.com>
References: <20221102203405.1797491-1-ogabbay@kernel.org>
 <20221102203405.1797491-2-ogabbay@kernel.org>
 <Y2MMCIe5wND2XPqE@kroah.com>
 <CAFCwf13uLj=P6u6FAcY8M5qAXoaBdb+Ha-TYj0j2FAZnFAPFYg@mail.gmail.com>
 <CAFCwf12yRUG4593ozJMEwaaJBKyWqXTTCjef9O_fzWdQBxVrtw@mail.gmail.com>
 <d5630f32-208a-77d2-91ed-58ef526ed086@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5630f32-208a-77d2-91ed-58ef526ed086@infradead.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jiho Chu <jiho.chu@samsung.com>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oded Gabbay <ogabbay@kernel.org>, Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 John Hubbard <jhubbard@nvidia.com>, Alex Deucher <alexander.deucher@amd.com>,
 stanislaw.gruszka@intel.com, Kevin Hilman <khilman@baylibre.com>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 03, 2022 at 04:01:08PM -0700, Randy Dunlap wrote:
> >>> Module name if "M" is chosen?
> >> Will add
> > So, unfortunately, the path of doing accel as a kernel module won't
> > work cleanly (Thanks stanislaw for pointing this out to me).
> > The reason is the circular dependency between drm and accel. drm calls
> > accel exported symbols during init and when devices are registering
> > (all the minor handling), and accel calls drm exported symbols because
> > I don't want to duplicate the entire drm core code.
> 
> But DRM is a tristate symbol, so during drm init (loadable module), couldn't
> it call accel init code (loadable module)?
> 
> Or are you saying that they only work together if both of them are builtin?

Yes, with current state of the patches, we can not build code as modules.
There are symbols in accel that are from drm and we use accel symbols
in drm. This could be fixed by separating symbols accel requires in 
separate module i.e. drm_file_helper.ko, however Oded proposed to make
CONFIG_ACCEL compile option for DRM and all accel code will be
build in drm.ko . I think that ok, since accel is not big. 

Regards
Stanislaw

