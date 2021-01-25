Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E32D0302393
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 11:20:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B509989FE3;
	Mon, 25 Jan 2021 10:20:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 927D189F49;
 Mon, 25 Jan 2021 10:20:50 +0000 (UTC)
IronPort-SDR: MLEcA5xAbiQLlWZZAVnSoIkU13bHzcD8VmZF0zsUkLP1ZzHo11qcttIVU7jfnvqgLRpbLg0/RE
 Z0erV5kFZmLA==
X-IronPort-AV: E=McAfee;i="6000,8403,9874"; a="177129712"
X-IronPort-AV: E=Sophos;i="5.79,373,1602572400"; d="scan'208";a="177129712"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2021 02:20:50 -0800
IronPort-SDR: akytaJWiaBld45QFQLP5/MONALtuGt4SKABR6xA3o42a3g3MrkWEFLfrFSURJG6/jhy4+NcjaP
 UDMwn1QNu5vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,373,1602572400"; d="scan'208";a="361422328"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga008.fm.intel.com with ESMTP; 25 Jan 2021 02:20:50 -0800
Received: from bgsmsx605.gar.corp.intel.com (10.67.234.7) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 25 Jan 2021 02:20:49 -0800
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 BGSMSX605.gar.corp.intel.com (10.67.234.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 25 Jan 2021 15:50:47 +0530
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.1713.004;
 Mon, 25 Jan 2021 15:50:47 +0530
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Colin King
 <colin.king@canonical.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "C,
 Ramalingam" <ramalingam.c@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH][next] drm/i915/hdcp: Fix return of value in uninitialized
 variable ret
Thread-Topic: [PATCH][next] drm/i915/hdcp: Fix return of value in
 uninitialized variable ret
Thread-Index: AQHW8NCsVaR1vL8Y9E2VXHHZueOJa6ozZo4AgAS/EtA=
Date: Mon, 25 Jan 2021 10:20:47 +0000
Message-ID: <422669df7166485aa5d4acfa3d3bf58e@intel.com>
References: <20210122150957.209779-1-colin.king@canonical.com>
 <87y2glj8v5.fsf@intel.com>
In-Reply-To: <87y2glj8v5.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
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
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It is already merged to drm-intel-next 
https://cgit.freedesktop.org/drm/drm-intel/commit/?h=drm-intel-next&id=40a6cead28f841ac350bd38dd7260ecacd5eab03

> -----Original Message-----
> From: Jani Nikula <jani.nikula@linux.intel.com>
> Sent: Friday, January 22, 2021 8:51 PM
> To: Colin King <colin.king@canonical.com>; Joonas Lahtinen
> <joonas.lahtinen@linux.intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
> David Airlie <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; C, Ramalingam
> <ramalingam.c@intel.com>; Gupta, Anshuman <anshuman.gupta@intel.com>;
> Shankar, Uma <uma.shankar@intel.com>; intel-gfx@lists.freedesktop.org; dri-
> devel@lists.freedesktop.org
> Cc: kernel-janitors@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH][next] drm/i915/hdcp: Fix return of value in uninitialized
> variable ret
> 
> On Fri, 22 Jan 2021, Colin King <colin.king@canonical.com> wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > Currently when there are other connectors on the port using HDCP the
> > function _intel_hdcp_disable returns a garbage uninitialized value in
> > variable ret.  I believe the intention is to return 0, so return this
> > literal value instead of the value in ret.
> >
> > Addresses-Coverity: ("Uninitialized scalar return")
> > Fixes: 899c8762f981 ("drm/i915/hdcp: Configure HDCP2.2 MST steram
> > encryption status")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> Thanks, but there's already a fix in progress:
> 
> http://lore.kernel.org/r/20210119064655.1605-3-anshuman.gupta@intel.com
> 
> BR,
> Jani.
> 
> 
> > ---
> >  drivers/gpu/drm/i915/display/intel_hdcp.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c
> > b/drivers/gpu/drm/i915/display/intel_hdcp.c
> > index db8dff2eeb0a..a0e7b0bf892b 100644
> > --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> > @@ -883,7 +883,7 @@ static int _intel_hdcp_disable(struct intel_connector
> *connector)
> >  	 * until it disabled HDCP encryption for all connectors in MST topology.
> >  	 */
> >  	if (dig_port->num_hdcp_streams > 0)
> > -		return ret;
> > +		return 0;
> >
> >  	hdcp->hdcp_encrypted = false;
> >  	intel_de_write(dev_priv, HDCP_CONF(dev_priv, cpu_transcoder, port),
> > 0);
> 
> --
> Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
