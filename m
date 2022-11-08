Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4AB62113C
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 13:46:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7AC710E42B;
	Tue,  8 Nov 2022 12:46:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 588C010E425
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 12:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667911583; x=1699447583;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yInpcuBqffNpHyEIyvcFabmM7Yq7M2fOh2s3ydZG1aI=;
 b=WX/Be1QGWY+mRo5CQDhhLaaXc48iaF8QToYM1ve0AA0pCEmTsyGv5RcR
 ActnbjiPudBLoHvxIrlFtLkWNR/MRn0OxshYtlHkVNFyDsKgDFjVigi9K
 XMNnJAtC26WOTypD5shTlYbIwTiX6JU2qaJmix4hz3wqSMmXS88E3Pkmu
 Iow3SNUnXxMoVBT6g4IzHdM6T/s9raR+7JpJnnsalYw2uuhhrmupakr5L
 2Ote9NdChx8UxReRZzr1LOoYuA2XzZ/HN/kzrBbEWW+8c4ySSC0ExgFae
 pOTxN6sltD85Id9tfeZF91WmFb2xSGxex9RFjomPVoYSPPDRl/Dcdck0A A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="298199924"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; d="scan'208";a="298199924"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2022 04:46:22 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="778913220"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; d="scan'208";a="778913220"
Received: from joe-255.igk.intel.com (HELO localhost) ([172.22.229.67])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2022 04:46:17 -0800
Date: Tue, 8 Nov 2022 13:46:14 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [RFC PATCH v3 1/3] drivers/accel: define kconfig and register a
 new major
Message-ID: <20221108124614.GA6397@linux.intel.com>
References: <20221106210225.2065371-1-ogabbay@kernel.org>
 <20221106210225.2065371-2-ogabbay@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221106210225.2065371-2-ogabbay@kernel.org>
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
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Christoph Hellwig <hch@infradead.org>,
 Jagan Teki <jagan@amarulasolutions.com>, Jason Gunthorpe <jgg@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Arnd Bergmann <arnd@arndb.de>, Jiho Chu <jiho.chu@samsung.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Nov 06, 2022 at 11:02:23PM +0200, Oded Gabbay wrote:
> Add a new Kconfig for the accel subsystem. The Kconfig currently
> contains only the basic CONFIG_DRM_ACCEL option that will be used to
> decide whether to compile the accel registration code. Therefore, the
> kconfig option is defined as bool.
> 
> The accel code will be compiled as part of drm.ko and will be called
> directly from the DRM core code. The reason we compile it as part of
> drm.ko and not as a separate module is because of cyclic dependency
> between drm.ko and the separate module (if it would have existed).
> This is due to the fact that DRM core code calls accel functions and
> vice-versa.
> 
> The accelerator devices will be exposed to the user space with a new,
> dedicated major number - 261.
> 
> The accel init function registers the new major number as a char device
> and create corresponding sysfs and debugfs root entries, similar to
> what is done in DRM init function.
> 
> I added a new header called drm_accel.h to include/drm/, that will hold
> the prototypes of the drm_accel.c functions. In case CONFIG_DRM_ACCEL
> is set to 'N', that header will contain empty inline implementations of
> those functions, to allow DRM core code to compile successfully
> without dependency on CONFIG_DRM_ACCEL.
> 
> I Updated the MAINTAINERS file accordingly with the newly added folder
> and I have taken the liberty to appropriate the dri-devel mailing list
> and the dri-devel IRC channel for the accel subsystem.
> 
> Signed-off-by: Oded Gabbay <ogabbay@kernel.org>

Tested-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

I tested those patches with intel_vpu driver. After initial troubles,
I got things worked with our driver and user mode components.

Regards
Stanislaw
