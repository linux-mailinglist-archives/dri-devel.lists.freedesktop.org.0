Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CAE61F43E
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 14:25:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2D7D10E310;
	Mon,  7 Nov 2022 13:25:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E4D10E30E
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 13:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667827510; x=1699363510;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hlL+DfWEWMRR8orTzyWzhpO4GGMnYRYRp0nALpNPto8=;
 b=cp6hbDSmSO83haL5ffl0FtbZ+43YDxoK4hJCJaS7Zd6yTeQNYibspmt9
 Uv5Vm08/OSOohMKc0aDdTHfhNMsgd9oFZjZzLBvIy+qYk2/x3U5lvU1if
 o2ifI26yfcARX0xmC0d8pcS/1JN1PuZg0TVO//sTD50VEmgatRUr6pycG
 4jHxaWtueyFH8o5UhwbOfyi9ykqdULvAEvcVBzXRIcaVSptVyO8nMEY5p
 pqwbWF+Asd7NXmIpk9WqQ4y6ePSNlJ0JOivmL6SeR8CuiYY1Xd42hyEwL
 bXPzOHNRPMUyDWwuiNf5j0SisV+L5lUjaI8iI73+Y0JkaydllpEnMn/Ql g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="290129990"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="290129990"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 05:25:09 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="761093220"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="761093220"
Received: from joe-255.igk.intel.com (HELO localhost) ([172.22.229.67])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 05:25:05 -0800
Date: Mon, 7 Nov 2022 14:25:03 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [RFC PATCH v2 1/3] drivers/accel: define kconfig and register a
 new major
Message-ID: <20221107132503.GA3590860@linux.intel.com>
References: <20221102203405.1797491-1-ogabbay@kernel.org>
 <20221102203405.1797491-2-ogabbay@kernel.org>
 <Y2MMCIe5wND2XPqE@kroah.com>
 <CAFCwf13uLj=P6u6FAcY8M5qAXoaBdb+Ha-TYj0j2FAZnFAPFYg@mail.gmail.com>
 <CAFCwf12yRUG4593ozJMEwaaJBKyWqXTTCjef9O_fzWdQBxVrtw@mail.gmail.com>
 <Y2kAcCu4z2LUMN7u@nvidia.com>
 <CAFCwf10K-dTu455QfOK8i6thismY-FUN2Rws830EGiqOcGWFgA@mail.gmail.com>
 <Y2kDzPswkKyZyRpS@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2kDzPswkKyZyRpS@nvidia.com>
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
Cc: Christoph Hellwig <hch@infradead.org>, Jiho Chu <jiho.chu@samsung.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Arnd Bergmann <arnd@arndb.de>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Oded Gabbay <ogabbay@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>, stanislaw.gruszka@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

On Mon, Nov 07, 2022 at 09:10:36AM -0400, Jason Gunthorpe wrote:
> On Mon, Nov 07, 2022 at 03:01:08PM +0200, Oded Gabbay wrote:
> > I don't agree with your statement that it should be "a layer over top of DRM".
> > Anything on top of DRM is a device driver.
> > Accel is not a device driver, it is a new type of drm minor / drm driver.
> 
> Yeah, I still think this is not the right way, you are getting almost
> nothing from DRM and making everything more complicated in the
> process.
> 
> > The only alternative imo to that is to abandon the idea of reusing
> > drm, and just make an independant accel core code.
> 
> Not quite really, layer it properly and librarize parts of DRM into
> things accel can re-use so they are not intimately tied to the DRM
> struct device notion.

What do you mean by "struct device notion" ? struct drm_devce ? 

Regards
Stanislaw
