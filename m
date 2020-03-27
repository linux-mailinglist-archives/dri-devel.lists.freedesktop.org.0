Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7C31951E0
	for <lists+dri-devel@lfdr.de>; Fri, 27 Mar 2020 08:28:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D87956E04A;
	Fri, 27 Mar 2020 07:28:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB5E06E02B;
 Fri, 27 Mar 2020 07:28:00 +0000 (UTC)
IronPort-SDR: xIKKWFMnPDZxj6SPOoFuiPETnX4YtT1nIe6QzY5f54Yw9BDoIO4L4kjgiSsX1cHadHmgGEAET5
 ZwzhlTSlZapw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2020 00:27:59 -0700
IronPort-SDR: Fq+XwKNPaEe8JM8wkvZixfDf4QLI/qxKGXY8zWjC5NsbHfVVGA1TWWPOc1i4UvwBC7Hb/RfXl+
 i84HBnDcguoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,311,1580803200"; d="scan'208";a="447317522"
Received: from irsmsx153.ger.corp.intel.com ([163.33.192.75])
 by fmsmga005.fm.intel.com with ESMTP; 27 Mar 2020 00:27:57 -0700
Received: from irsmsx604.ger.corp.intel.com (163.33.146.137) by
 IRSMSX153.ger.corp.intel.com (163.33.192.75) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 27 Mar 2020 07:27:56 +0000
Received: from irsmsx605.ger.corp.intel.com (163.33.146.138) by
 IRSMSX604.ger.corp.intel.com (163.33.146.137) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 27 Mar 2020 07:27:56 +0000
Received: from irsmsx605.ger.corp.intel.com ([163.33.146.138]) by
 IRSMSX605.ger.corp.intel.com ([163.33.146.138]) with mapi id 15.01.1713.004;
 Fri, 27 Mar 2020 07:27:56 +0000
From: "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>
To: "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v7 05/18] video/hdmi: Add Unpack only function
 for DRM infoframe
Thread-Topic: [Intel-gfx] [PATCH v7 05/18] video/hdmi: Add Unpack only
 function for DRM infoframe
Thread-Index: AQHV4K+D4GGLpaNfYkqvNBu0B8JWuahRj9KAgAAFOoCAAAcUgIAKtSmA
Date: Fri, 27 Mar 2020 07:27:56 +0000
Message-ID: <2dd87897a2c1dea8d882141823ed1ca1206ec01c.camel@intel.com>
References: <20200211074657.231405-1-gwan-gyeong.mun@intel.com>
 <20200211074657.231405-6-gwan-gyeong.mun@intel.com>
 <87k13fcm8w.fsf@intel.com> <87h7yjcldq.fsf@intel.com>
 <20200320115737.GF5193@pendragon.ideasonboard.com>
In-Reply-To: <20200320115737.GF5193@pendragon.ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.252.26.111]
Content-ID: <1F121079EAA74E48BB7E5655D9C021EC@intel.com>
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
Cc: "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "b.zolnierkie@samsung.com" <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2020-03-20 at 13:57 +0200, Laurent Pinchart wrote:
> Hi Jani,
> 
> On Fri, Mar 20, 2020 at 01:32:17PM +0200, Jani Nikula wrote:
> > On Fri, 20 Mar 2020, Jani Nikula <jani.nikula@linux.intel.com>
> > wrote:
> > > On Tue, 11 Feb 2020, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> > > wrote:
> > > > It adds an unpack only function for DRM infoframe for dynamic
> > > > range and
> > > > mastering infoframe readout.
> > > > It unpacks the information data block contained in the binary
> > > > buffer into
> > > > a structured frame of the HDMI Dynamic Range and Mastering
> > > > (DRM)
> > > > information frame.
> > > > 
> > > > In contrast to hdmi_drm_infoframe_unpack() function, it does
> > > > not verify
> > > > a checksum.
> > > > 
> > > > It can be used for unpacking a DP HDR Metadata Infoframe SDP
> > > > case.
> > > > DP HDR Metadata Infoframe SDP uses the same Dynamic Range and
> > > > Mastering
> > > > (DRM) information (CTA-861-G spec.) such as HDMI DRM infoframe.
> > > > But DP SDP header and payload structure are different from HDMI
> > > > DRM
> > > > Infoframe. Therefore unpacking DRM infoframe for DP requires
> > > > skipping of
> > > > a verifying checksum.
> > > > 
> > > > Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> > > > Reviewed-by: Uma Shankar <uma.shankar@intel.com>
> > > 
> > > Bartlomiej, can I have your ack for merging this via drm-intel
> > > along
> > > with the rest of the series, please?
> > 
> > Or Hans or Laurent, from v4l/video point of view.
> 
> I'm no expert on InfoFrame, I'll only comment on the API below.
> 
> > > > ---
> > > >  drivers/video/hdmi.c | 58 +++++++++++++++++++++++++++++++-----
> > > > --------
> > > >  include/linux/hdmi.h |  2 ++
> > > >  2 files changed, 43 insertions(+), 17 deletions(-)
> > > > 
> > > > diff --git a/drivers/video/hdmi.c b/drivers/video/hdmi.c
> > > > index 9c82e2a0a411..9818836d82b7 100644
> > > > --- a/drivers/video/hdmi.c
> > > > +++ b/drivers/video/hdmi.c
> > > > @@ -1775,20 +1775,18 @@ hdmi_vendor_any_infoframe_unpack(union
> > > > hdmi_vendor_any_infoframe *frame,
> > > >  }
> > > >  
> > > >  /**
> > > > - * hdmi_drm_infoframe_unpack() - unpack binary buffer to a
> > > > HDMI DRM infoframe
> > > > + * hdmi_drm_infoframe_unpack_only() - unpack binary buffer to
> > > > a HDMI DRM infoframe
> > > >   * @frame: HDMI DRM infoframe
> > > >   * @buffer: source buffer
> > > >   * @size: size of buffer
> > > >   *
> > > > - * Unpacks the information contained in binary @buffer into a
> > > > structured
> > > > + * Unpacks the information data block contained in binary
> > > > @buffer into a structured
> 
> Line wrap please.
> 
> This needs to be clarified to explain exactly what the buffer points
> to.
> 
Okay I'll update clear comments next version.
> Also, as this is applicable to DP too, shouldn't we drop the hdmi_
> prefix ? Is there another prefix that could be used for functions
> that
> are application to infoframe handling shared by different display
> interfaces ? A bit of refactoring would help making all this clear.
> 
Both DP and HDMI use CTA-861-G spec for DRM infoframe. I'll update
prefix with cta_ instead of hdmi_.
> > > >   * @frame of the HDMI Dynamic Range and Mastering (DRM)
> > > > information frame.
> > > > - * Also verifies the checksum as required by section 5.3.5 of
> > > > the HDMI 1.4
> > > > - * specification.
> > > >   *
> > > >   * Returns 0 on success or a negative error code on failure.
> > > >   */
> > > > -static int hdmi_drm_infoframe_unpack(struct hdmi_drm_infoframe
> > > > *frame,
> > > > -				     const void *buffer, size_t
> > > > size)
> > > > +int hdmi_drm_infoframe_unpack_only(struct hdmi_drm_infoframe
> > > > *frame,
> > > > +				   const void *buffer, size_t
> > > > size)
> > > >  {
> > > >  	const u8 *ptr = buffer;
> > > >  	const u8 *temp;
> > > > @@ -1797,23 +1795,13 @@ static int
> > > > hdmi_drm_infoframe_unpack(struct hdmi_drm_infoframe *frame,
> > > >  	int ret;
> > > >  	int i;
> > > >  
> > > > -	if (size < HDMI_INFOFRAME_SIZE(DRM))
> > > > -		return -EINVAL;
> > > > -
> > > > -	if (ptr[0] != HDMI_INFOFRAME_TYPE_DRM ||
> > > > -	    ptr[1] != 1 ||
> > > > -	    ptr[2] != HDMI_DRM_INFOFRAME_SIZE)
> > > > -		return -EINVAL;
> > > > -
> > > > -	if (hdmi_infoframe_checksum(buffer,
> > > > HDMI_INFOFRAME_SIZE(DRM)) != 0)
> > > > +	if (size < HDMI_DRM_INFOFRAME_SIZE)
> > > >  		return -EINVAL;
> > > >  
> > > >  	ret = hdmi_drm_infoframe_init(frame);
> > > >  	if (ret)
> > > >  		return ret;
> > > >  
> > > > -	ptr += HDMI_INFOFRAME_HEADER_SIZE;
> > > > -
> > > >  	frame->eotf = ptr[0] & 0x7;
> > > >  	frame->metadata_type = ptr[1] & 0x7;
> > > >  
> > > > @@ -1837,6 +1825,42 @@ static int
> > > > hdmi_drm_infoframe_unpack(struct hdmi_drm_infoframe *frame,
> > > >  
> > > >  	return 0;
> > > >  }
> > > > +EXPORT_SYMBOL(hdmi_drm_infoframe_unpack_only);
> > > > +
> > > > +/**
> > > > + * hdmi_drm_infoframe_unpack() - unpack binary buffer to a
> > > > HDMI DRM infoframe
> > > > + * @frame: HDMI DRM infoframe
> > > > + * @buffer: source buffer
> > > > + * @size: size of buffer
> > > > + *
> > > > + * Unpacks the information contained in binary @buffer into a
> > > > structured
> 
> Same here. The difference between the two functions is "information
> data
> block" vs. "information", it's very unclear to the reader without
> looking at either the commit message or the implementation.
> 
I'll update clear comments next version.

Thank you for giving me review comments.

G.G.

> > > > + * @frame of the HDMI Dynamic Range and Mastering (DRM)
> > > > information frame.
> > > > + * Also verifies the checksum as required by section 5.3.5 of
> > > > the HDMI 1.4
> > > > + * specification.
> > > > + *
> > > > + * Returns 0 on success or a negative error code on failure.
> > > > + */
> > > > +static int hdmi_drm_infoframe_unpack(struct hdmi_drm_infoframe
> > > > *frame,
> > > > +				     const void *buffer, size_t
> > > > size)
> > > > +{
> > > > +	const u8 *ptr = buffer;
> > > > +	int ret;
> > > > +
> > > > +	if (size < HDMI_INFOFRAME_SIZE(DRM))
> > > > +		return -EINVAL;
> > > > +
> > > > +	if (ptr[0] != HDMI_INFOFRAME_TYPE_DRM ||
> > > > +	    ptr[1] != 1 ||
> > > > +	    ptr[2] != HDMI_DRM_INFOFRAME_SIZE)
> > > > +		return -EINVAL;
> > > > +
> > > > +	if (hdmi_infoframe_checksum(buffer,
> > > > HDMI_INFOFRAME_SIZE(DRM)) != 0)
> > > > +		return -EINVAL;
> > > > +
> > > > +	ret = hdmi_drm_infoframe_unpack_only(frame, ptr +
> > > > HDMI_INFOFRAME_HEADER_SIZE,
> > > > +					     size -
> > > > HDMI_INFOFRAME_HEADER_SIZE);
> > > > +	return ret;
> > > > +}
> > > >  
> > > >  /**
> > > >   * hdmi_infoframe_unpack() - unpack binary buffer to a HDMI
> > > > infoframe
> > > > diff --git a/include/linux/hdmi.h b/include/linux/hdmi.h
> > > > index 9918a6c910c5..afb43efc03e0 100644
> > > > --- a/include/linux/hdmi.h
> > > > +++ b/include/linux/hdmi.h
> > > > @@ -219,6 +219,8 @@ ssize_t hdmi_drm_infoframe_pack(struct
> > > > hdmi_drm_infoframe *frame, void *buffer,
> > > >  ssize_t hdmi_drm_infoframe_pack_only(const struct
> > > > hdmi_drm_infoframe *frame,
> > > >  				     void *buffer, size_t
> > > > size);
> > > >  int hdmi_drm_infoframe_check(struct hdmi_drm_infoframe
> > > > *frame);
> > > > +int hdmi_drm_infoframe_unpack_only(struct hdmi_drm_infoframe
> > > > *frame,
> > > > +				   const void *buffer, size_t
> > > > size);
> > > >  
> > > >  enum hdmi_spd_sdi {
> > > >  	HDMI_SPD_SDI_UNKNOWN,
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
