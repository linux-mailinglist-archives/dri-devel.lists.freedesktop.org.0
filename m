Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFE324981B
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 10:18:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2CB96E203;
	Wed, 19 Aug 2020 08:18:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF47F6E1FB;
 Wed, 19 Aug 2020 08:18:23 +0000 (UTC)
IronPort-SDR: 4TBNeWqheYAgRVLNGO0kadY4Rq61k18qS2/mUtREdPfPj53jy4BuTSfYw2niNMLfHLv/ltfjSQ
 kQhhopDpnDbw==
X-IronPort-AV: E=McAfee;i="6000,8403,9717"; a="135137444"
X-IronPort-AV: E=Sophos;i="5.76,330,1592895600"; d="scan'208";a="135137444"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2020 01:18:23 -0700
IronPort-SDR: ilI64Wz5Z+Z71l+QIDNzSZ3iPXNf4E+t+GIlqPDLR+N+j+1uYwnkjN7yu0AoGisY+84Qbq9r2Y
 S2yqw6dGyocA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,330,1592895600"; d="scan'208";a="497160096"
Received: from fmsmsx602-2.cps.intel.com (HELO fmsmsx602.amr.corp.intel.com)
 ([10.18.84.212])
 by fmsmga006.fm.intel.com with ESMTP; 19 Aug 2020 01:18:23 -0700
Received: from bgsmsx606.gar.corp.intel.com (10.67.234.8) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 19 Aug 2020 01:18:22 -0700
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 BGSMSX606.gar.corp.intel.com (10.67.234.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 19 Aug 2020 13:48:20 +0530
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.1713.004;
 Wed, 19 Aug 2020 13:48:20 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Laxminarayan Bharadiya, Pankaj"
 <pankaj.laxminarayan.bharadiya@intel.com>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "daniels@collabora.com" <daniels@collabora.com>, "Lattannavar, Sameer"
 <sameer.lattannavar@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Jonathan Corbet <corbet@lwn.net>
Subject: RE: [PATCH v5 2/5] drm/drm-kms.rst: Add plane and CRTC scaling filter
 property documentation
Thread-Topic: [PATCH v5 2/5] drm/drm-kms.rst: Add plane and CRTC scaling
 filter property documentation
Thread-Index: AQHWaU9x6yg9t2Hau0ajfEizWOhz7qk/L36w
Date: Wed, 19 Aug 2020 08:18:20 +0000
Message-ID: <9413580e28154b4d8409264b295f26a8@intel.com>
References: <20200803042953.7626-1-pankaj.laxminarayan.bharadiya@intel.com>
 <20200803042953.7626-3-pankaj.laxminarayan.bharadiya@intel.com>
In-Reply-To: <20200803042953.7626-3-pankaj.laxminarayan.bharadiya@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.223.10.1]
MIME-Version: 1.0
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
Cc: "Laxminarayan Bharadiya, Pankaj" <pankaj.laxminarayan.bharadiya@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Pankaj
> Bharadiya
> Sent: Monday, August 3, 2020 10:00 AM
> To: jani.nikula@linux.intel.com; daniel@ffwll.ch; intel-gfx@lists.freedesktop.org;
> dri-devel@lists.freedesktop.org; ville.syrjala@linux.intel.com;
> daniels@collabora.com; Lattannavar, Sameer <sameer.lattannavar@intel.com>;
> Maarten Lankhorst <maarten.lankhorst@linux.intel.com>; Maxime Ripard
> <mripard@kernel.org>; Thomas Zimmermann <tzimmermann@suse.de>; David
> Airlie <airlied@linux.ie>; Jonathan Corbet <corbet@lwn.net>
> Cc: Laxminarayan Bharadiya, Pankaj
> <pankaj.laxminarayan.bharadiya@intel.com>
> Subject: [PATCH v5 2/5] drm/drm-kms.rst: Add plane and CRTC scaling filter
> property documentation
> 
> Add documentation for newly introduced KMS plane and CRTC scaling filter
> properties.

Looks good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> changes since v3:
> * None
> changes since v1:
> * None
> changes since RFC:
> * Add separate documentation for plane and CRTC.
> 
> Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
> ---
>  Documentation/gpu/drm-kms.rst | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
> index 3c5ae4f6dfd2..8e4031afbb1b 100644
> --- a/Documentation/gpu/drm-kms.rst
> +++ b/Documentation/gpu/drm-kms.rst
> @@ -518,6 +518,18 @@ Variable Refresh Properties  .. kernel-doc::
> drivers/gpu/drm/drm_connector.c
>     :doc: Variable refresh properties
> 
> +Plane Scaling Filter Property
> +-----------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_plane.c
> +   :doc: Plane scaling filter property
> +
> +CRTC Scaling Filter Property
> +-----------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_crtc.c
> +   :doc: CRTC scaling filter property
> +
>  Existing KMS Properties
>  -----------------------
> 
> --
> 2.23.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
