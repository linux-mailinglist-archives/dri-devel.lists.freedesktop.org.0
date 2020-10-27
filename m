Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F8A29A763
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 10:10:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8CD76EB36;
	Tue, 27 Oct 2020 09:10:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB1F96EB36;
 Tue, 27 Oct 2020 09:10:46 +0000 (UTC)
IronPort-SDR: mhngcBV8/zOEgIiBmwvXJKv1rjVrjDQZtahp5y5VYHYPDFTrWU2rjporuQ5NrmN8vRDgIia+87
 n+7yDrkfpBzQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9786"; a="164549653"
X-IronPort-AV: E=Sophos;i="5.77,423,1596524400"; d="scan'208";a="164549653"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2020 02:10:46 -0700
IronPort-SDR: sOP2GYbPxn+6s0IvBPWarw/h9Lps9a3+9gxa/3Aa+PMdHIAJRXC8zQycT/Kc2NSdoXMA7U7XEm
 B4O84WN+VL5w==
X-IronPort-AV: E=Sophos;i="5.77,423,1596524400"; d="scan'208";a="524620509"
Received: from genxfsim-desktop.iind.intel.com (HELO intel.com)
 ([10.223.74.178])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2020 02:10:43 -0700
Date: Tue, 27 Oct 2020 14:27:05 +0530
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>
Subject: Re: [PATCH v3 14/16] drm/i915/hdcp: Add HDCP 2.2 stream register
Message-ID: <20201027085704.GG29526@intel.com>
References: <20201023122112.15265-1-anshuman.gupta@intel.com>
 <20201023122112.15265-15-anshuman.gupta@intel.com>
 <3b7df974286b4497ba31ad4a554062e0@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3b7df974286b4497ba31ad4a554062e0@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On 2020-10-27 at 12:41:41 +0530, Shankar, Uma wrote:
> 
> 
> > -----Original Message-----
> > From: Anshuman Gupta <anshuman.gupta@intel.com>
> > Sent: Friday, October 23, 2020 5:51 PM
> > To: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> > Cc: seanpaul@chromium.org; Nikula, Jani <jani.nikula@intel.com>; C,
> > Ramalingam <ramalingam.c@intel.com>; Li, Juston <juston.li@intel.com>;
> > Shankar, Uma <uma.shankar@intel.com>; Gupta, Anshuman
> > <anshuman.gupta@intel.com>
> > Subject: [PATCH v3 14/16] drm/i915/hdcp: Add HDCP 2.2 stream register
> > 
> > Add HDCP 2.2 DP MST HDCP2_STREAM_STATUS
> > and HDCP2_AUTH_STREAM register in i915_reg header.
> > 
> > Cc: Ramalingam C <ramalingam.c@intel.com>
> > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > ---
> >  drivers/gpu/drm/i915/i915_reg.h | 30 ++++++++++++++++++++++++++++++
> >  1 file changed, 30 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> > index 86a9a5145e47..cb6ec2c241f2 100644
> > --- a/drivers/gpu/drm/i915/i915_reg.h
> > +++ b/drivers/gpu/drm/i915/i915_reg.h
> > @@ -9882,6 +9882,7 @@ enum skl_power_gate {
> >  					  _PORTD_HDCP2_BASE, \
> >  					  _PORTE_HDCP2_BASE, \
> >  					  _PORTF_HDCP2_BASE) + (x))
> > +
> >  #define PORT_HDCP2_AUTH(port)		_PORT_HDCP2_BASE(port, 0x98)
> >  #define _TRANSA_HDCP2_AUTH		0x66498
> >  #define _TRANSB_HDCP2_AUTH		0x66598
> > @@ -9921,6 +9922,35 @@ enum skl_power_gate {
> >  					 TRANS_HDCP2_STATUS(trans) : \
> >  					 PORT_HDCP2_STATUS(port))
> > 
> > +#define PORT_HDCP2_STREAM_STATUS(port)		_PORT_HDCP2_BASE(port,
> > 0xC0)
> > +#define _TRANSA_HDCP2_STREAM_STATUS		0x664C0
> > +#define _TRANSB_HDCP2_STREAM_STATUS		0x665C0
> > +#define TRANS_HDCP2_STREAM_STATUS(trans)	_MMIO_TRANS(trans, \
> > +
> > _TRANSA_HDCP2_STREAM_STATUS, \
> > +
> > _TRANSB_HDCP2_STREAM_STATUS)
> > +#define   STREAM_ENCRYPTION_STATUS	BIT(31)
> > +#define   STREAM_TYPE_STATUS		BIT(30)
> > +#define HDCP2_STREAM_STATUS(dev_priv, trans, port) \
> > +					(INTEL_GEN(dev_priv) >= 12 ? \
> > +					 TRANS_HDCP2_STREAM_STATUS(trans) :
> > \
> > +					 PORT_HDCP2_STREAM_STATUS(port))
> > +
> > +#define _PORTA_HDCP2_AUTH_STREAM		0x66F00
> > +#define _PORTB_HDCP2_AUTH_STREAM		0x66F04
> > +#define PORT_HDCP2_AUTH_STREAM(port)	_MMIO_PORT(port, \
> > +
> > _PORTA_HDCP2_AUTH_STREAM, \
> > +
> > _PORTB_HDCP2_AUTH_STREAM)
> 
> Should it also not be defined as the other counterparts for pre Gen12.
It has already been defined with Gen12 and Pre Gen12 annotation below
HDCP2_AUTH_STREAM should TRANS_HDCP2_AUTH_STREAM for Gen12 and
PORT_HDCP2_AUTH_STREAM for pre Gen12.
Is it something else u find it is missing ?
Thanks,
Anshuman.
> 
> > +#define _TRANSA_HDCP2_AUTH_STREAM		0x66F00
> > +#define _TRANSB_HDCP2_AUTH_STREAM		0x66F04
> > +#define TRANS_HDCP2_AUTH_STREAM(trans)	_MMIO_TRANS(trans, \
> > +
> > _TRANSA_HDCP2_AUTH_STREAM, \
> > +
> > _TRANSB_HDCP2_AUTH_STREAM)
> > +#define   AUTH_STREAM_TYPE		BIT(31)
> > +#define HDCP2_AUTH_STREAM(dev_priv, trans, port) \
> > +					(INTEL_GEN(dev_priv) >= 12 ? \
> > +					 TRANS_HDCP2_AUTH_STREAM(trans) : \
> > +					 PORT_HDCP2_AUTH_STREAM(port))
> > +
> >  /* Per-pipe DDI Function Control */
> >  #define _TRANS_DDI_FUNC_CTL_A		0x60400
> >  #define _TRANS_DDI_FUNC_CTL_B		0x61400
> > --
> > 2.26.2
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
