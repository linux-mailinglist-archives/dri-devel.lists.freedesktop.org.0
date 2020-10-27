Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C90B229A838
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 10:50:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 083006E03F;
	Tue, 27 Oct 2020 09:50:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAA836E03F;
 Tue, 27 Oct 2020 09:50:25 +0000 (UTC)
IronPort-SDR: RV3TBTjK7yPnmbi7qCwcIJrfNSbBVko39V1agiu+D9SEL3lj8nIafOgIeXGvdfk4cnnFsc+cK9
 UoCXqt0WkvcQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9786"; a="147337270"
X-IronPort-AV: E=Sophos;i="5.77,423,1596524400"; d="scan'208";a="147337270"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2020 02:50:25 -0700
IronPort-SDR: qMCcsfCv7LcXekTU/FKXjKqMgkKZYiw4Jv8CPir+TvgmB4iHfiAfmIdq9P2QcIWSqhtaPOWQII
 iPoa/dfj4AcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,423,1596524400"; d="scan'208";a="350223557"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga008.jf.intel.com with ESMTP; 27 Oct 2020 02:50:24 -0700
Received: from bgsmsx603.gar.corp.intel.com (10.109.78.82) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 27 Oct 2020 02:50:23 -0700
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 BGSMSX603.gar.corp.intel.com (10.109.78.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 27 Oct 2020 15:20:21 +0530
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.1713.004;
 Tue, 27 Oct 2020 15:20:21 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>
Subject: RE: [PATCH v3 14/16] drm/i915/hdcp: Add HDCP 2.2 stream register
Thread-Topic: [PATCH v3 14/16] drm/i915/hdcp: Add HDCP 2.2 stream register
Thread-Index: AQHWqTkItgbYgdwjiEOXz7Jf5LPbkKmrClsQ///FSICAAGlvIA==
Date: Tue, 27 Oct 2020 09:50:21 +0000
Message-ID: <38f7ba3e3ff348928c959864e1f1c3ec@intel.com>
References: <20201023122112.15265-1-anshuman.gupta@intel.com>
 <20201023122112.15265-15-anshuman.gupta@intel.com>
 <3b7df974286b4497ba31ad4a554062e0@intel.com>
 <20201027085704.GG29526@intel.com>
In-Reply-To: <20201027085704.GG29526@intel.com>
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>, "Li, 
 Juston" <juston.li@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Anshuman Gupta <anshuman.gupta@intel.com>
> Sent: Tuesday, October 27, 2020 2:27 PM
> To: Shankar, Uma <uma.shankar@intel.com>
> Cc: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org;
> seanpaul@chromium.org; Nikula, Jani <jani.nikula@intel.com>; C, Ramalingam
> <ramalingam.c@intel.com>; Li, Juston <juston.li@intel.com>
> Subject: Re: [PATCH v3 14/16] drm/i915/hdcp: Add HDCP 2.2 stream register
> 
> On 2020-10-27 at 12:41:41 +0530, Shankar, Uma wrote:
> >
> >
> > > -----Original Message-----
> > > From: Anshuman Gupta <anshuman.gupta@intel.com>
> > > Sent: Friday, October 23, 2020 5:51 PM
> > > To: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> > > Cc: seanpaul@chromium.org; Nikula, Jani <jani.nikula@intel.com>; C,
> > > Ramalingam <ramalingam.c@intel.com>; Li, Juston
> > > <juston.li@intel.com>; Shankar, Uma <uma.shankar@intel.com>; Gupta,
> > > Anshuman <anshuman.gupta@intel.com>
> > > Subject: [PATCH v3 14/16] drm/i915/hdcp: Add HDCP 2.2 stream
> > > register
> > >
> > > Add HDCP 2.2 DP MST HDCP2_STREAM_STATUS and HDCP2_AUTH_STREAM
> > > register in i915_reg header.
> > >
> > > Cc: Ramalingam C <ramalingam.c@intel.com>
> > > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/i915_reg.h | 30 ++++++++++++++++++++++++++++++
> > >  1 file changed, 30 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/i915/i915_reg.h
> > > b/drivers/gpu/drm/i915/i915_reg.h index 86a9a5145e47..cb6ec2c241f2
> > > 100644
> > > --- a/drivers/gpu/drm/i915/i915_reg.h
> > > +++ b/drivers/gpu/drm/i915/i915_reg.h
> > > @@ -9882,6 +9882,7 @@ enum skl_power_gate {
> > >  					  _PORTD_HDCP2_BASE, \
> > >  					  _PORTE_HDCP2_BASE, \
> > >  					  _PORTF_HDCP2_BASE) + (x))
> > > +
> > >  #define PORT_HDCP2_AUTH(port)		_PORT_HDCP2_BASE(port, 0x98)
> > >  #define _TRANSA_HDCP2_AUTH		0x66498
> > >  #define _TRANSB_HDCP2_AUTH		0x66598
> > > @@ -9921,6 +9922,35 @@ enum skl_power_gate {
> > >  					 TRANS_HDCP2_STATUS(trans) : \
> > >  					 PORT_HDCP2_STATUS(port))
> > >
> > > +#define PORT_HDCP2_STREAM_STATUS(port)
> 	_PORT_HDCP2_BASE(port,
> > > 0xC0)
> > > +#define _TRANSA_HDCP2_STREAM_STATUS		0x664C0
> > > +#define _TRANSB_HDCP2_STREAM_STATUS		0x665C0
> > > +#define TRANS_HDCP2_STREAM_STATUS(trans)	_MMIO_TRANS(trans, \
> > > +
> > > _TRANSA_HDCP2_STREAM_STATUS, \
> > > +
> > > _TRANSB_HDCP2_STREAM_STATUS)
> > > +#define   STREAM_ENCRYPTION_STATUS	BIT(31)
> > > +#define   STREAM_TYPE_STATUS		BIT(30)
> > > +#define HDCP2_STREAM_STATUS(dev_priv, trans, port) \
> > > +					(INTEL_GEN(dev_priv) >= 12 ? \
> > > +					 TRANS_HDCP2_STREAM_STATUS(trans) :
> > > \
> > > +					 PORT_HDCP2_STREAM_STATUS(port))
> > > +
> > > +#define _PORTA_HDCP2_AUTH_STREAM		0x66F00
> > > +#define _PORTB_HDCP2_AUTH_STREAM		0x66F04
> > > +#define PORT_HDCP2_AUTH_STREAM(port)	_MMIO_PORT(port, \
> > > +
> > > _PORTA_HDCP2_AUTH_STREAM, \
> > > +
> > > _PORTB_HDCP2_AUTH_STREAM)
> >
> > Should it also not be defined as the other counterparts for pre Gen12.
> It has already been defined with Gen12 and Pre Gen12 annotation below
> HDCP2_AUTH_STREAM should TRANS_HDCP2_AUTH_STREAM for Gen12 and
> PORT_HDCP2_AUTH_STREAM for pre Gen12.
> Is it something else u find it is missing ?

I was checking the declarations similar to
#define PORT_HDCP2_AUTH(port)		_PORT_HDCP2_BASE(port, 0x98)

But as discussed offline, this set is placed at different register group then the rest of
HDCP regs. So this looks good.

Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Thanks,
> Anshuman.
> >
> > > +#define _TRANSA_HDCP2_AUTH_STREAM		0x66F00
> > > +#define _TRANSB_HDCP2_AUTH_STREAM		0x66F04
> > > +#define TRANS_HDCP2_AUTH_STREAM(trans)	_MMIO_TRANS(trans, \
> > > +
> > > _TRANSA_HDCP2_AUTH_STREAM, \
> > > +
> > > _TRANSB_HDCP2_AUTH_STREAM)
> > > +#define   AUTH_STREAM_TYPE		BIT(31)
> > > +#define HDCP2_AUTH_STREAM(dev_priv, trans, port) \
> > > +					(INTEL_GEN(dev_priv) >= 12 ? \
> > > +					 TRANS_HDCP2_AUTH_STREAM(trans) : \
> > > +					 PORT_HDCP2_AUTH_STREAM(port))
> > > +
> > >  /* Per-pipe DDI Function Control */
> > >  #define _TRANS_DDI_FUNC_CTL_A		0x60400
> > >  #define _TRANS_DDI_FUNC_CTL_B		0x61400
> > > --
> > > 2.26.2
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
