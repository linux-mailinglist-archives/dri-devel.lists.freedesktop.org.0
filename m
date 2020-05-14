Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4821D2772
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 08:23:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D56B96E2DE;
	Thu, 14 May 2020 06:23:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC8766E2DE;
 Thu, 14 May 2020 06:23:06 +0000 (UTC)
IronPort-SDR: dx9dxeWyG7ldbRoCj7zt81VK+1eTVsFH/WRTybxxzHuq6OAQE6YIFcNfBhs1gTYDv4Dc7QfW+C
 iuWVK/Uz0TRw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2020 23:23:06 -0700
IronPort-SDR: Re5TikqK9oildC9XKzU6bSlKZTohALoRskbVEl7bh7Utax3pJq2Vj0G81o/viUILA2KuLJqyhj
 xXzjfsLukkRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,390,1583222400"; d="scan'208";a="280751934"
Received: from irsmsx154.ger.corp.intel.com ([163.33.192.96])
 by orsmga002.jf.intel.com with ESMTP; 13 May 2020 23:23:04 -0700
Received: from irsmsx605.ger.corp.intel.com (163.33.146.138) by
 IRSMSX154.ger.corp.intel.com (163.33.192.96) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 14 May 2020 07:23:03 +0100
Received: from irsmsx605.ger.corp.intel.com (163.33.146.138) by
 IRSMSX605.ger.corp.intel.com (163.33.146.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 14 May 2020 07:23:03 +0100
Received: from irsmsx605.ger.corp.intel.com ([163.33.146.138]) by
 IRSMSX605.ger.corp.intel.com ([163.33.146.138]) with mapi id 15.01.1713.004;
 Thu, 14 May 2020 07:23:03 +0100
From: "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>
To: "b.zolnierkie@samsung.com" <b.zolnierkie@samsung.com>
Subject: Re: [Intel-gfx] [PATCH v12 01/14] video/hdmi: Add Unpack only
 function for DRM infoframe
Thread-Topic: [Intel-gfx] [PATCH v12 01/14] video/hdmi: Add Unpack only
 function for DRM infoframe
Thread-Index: AQHWKbYIR9HlBdJRIEedY1yR5TsPB6inDAyA
Date: Thu, 14 May 2020 06:23:03 +0000
Message-ID: <f817b755bbdc20955cddb5b2cddb9a2246570d0e.camel@intel.com>
References: <20200514060732.3378396-1-gwan-gyeong.mun@intel.com>
 <20200514060732.3378396-2-gwan-gyeong.mun@intel.com>
In-Reply-To: <20200514060732.3378396-2-gwan-gyeong.mun@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.252.18.167]
Content-ID: <2F90B705F6013D408CDA33B66DCB72A0@intel.com>
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Bartlomiej and Laurent Pinchart, can I have your ack for merging
this via drm-intel along
with the rest of the series, please?

BR,
G.G. 

On Thu, 2020-05-14 at 09:07 +0300, Gwan-gyeong Mun wrote:
> It adds an unpack only function for DRM infoframe for dynamic range
> and
> mastering infoframe readout.
> It unpacks the information data block contained in the binary buffer
> into
> a structured frame of the HDMI Dynamic Range and Mastering (DRM)
> information frame.
> 
> In contrast to hdmi_drm_infoframe_unpack() function, it does not
> verify
> a checksum.
> 
> It can be used for unpacking a DP HDR Metadata Infoframe SDP case.
> DP HDR Metadata Infoframe SDP uses the same Dynamic Range and
> Mastering
> (DRM) information (CTA-861-G spec.) such as HDMI DRM infoframe.
> But DP SDP header and payload structure are different from HDMI DRM
> Infoframe. Therefore unpacking DRM infoframe for DP requires skipping
> of
> a verifying checksum.
> 
> v9: Add clear comments to hdmi_drm_infoframe_unpack_only() and
>     hdmi_drm_infoframe_unpack() (Laurent Pinchart)
> 
> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Reviewed-by: Uma Shankar <uma.shankar@intel.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> ---
>  drivers/video/hdmi.c | 65 +++++++++++++++++++++++++++++++-----------
> --
>  include/linux/hdmi.h |  2 ++
>  2 files changed, 48 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/video/hdmi.c b/drivers/video/hdmi.c
> index 856a8c4e84a2..e70792b3e367 100644
> --- a/drivers/video/hdmi.c
> +++ b/drivers/video/hdmi.c
> @@ -1768,20 +1768,21 @@ hdmi_vendor_any_infoframe_unpack(union
> hdmi_vendor_any_infoframe *frame,
>  }
>  
>  /**
> - * hdmi_drm_infoframe_unpack() - unpack binary buffer to a HDMI DRM
> infoframe
> + * hdmi_drm_infoframe_unpack_only() - unpack binary buffer of CTA-
> 861-G DRM
> + *                                    infoframe DataBytes to a HDMI
> DRM
> + *                                    infoframe
>   * @frame: HDMI DRM infoframe
>   * @buffer: source buffer
>   * @size: size of buffer
>   *
> - * Unpacks the information contained in binary @buffer into a
> structured
> - * @frame of the HDMI Dynamic Range and Mastering (DRM) information
> frame.
> - * Also verifies the checksum as required by section 5.3.5 of the
> HDMI 1.4
> - * specification.
> + * Unpacks CTA-861-G DRM infoframe DataBytes contained in the binary
> @buffer
> + * into a structured @frame of the HDMI Dynamic Range and Mastering
> (DRM)
> + * infoframe.
>   *
>   * Returns 0 on success or a negative error code on failure.
>   */
> -static int hdmi_drm_infoframe_unpack(struct hdmi_drm_infoframe
> *frame,
> -				     const void *buffer, size_t size)
> +int hdmi_drm_infoframe_unpack_only(struct hdmi_drm_infoframe *frame,
> +				   const void *buffer, size_t size)
>  {
>  	const u8 *ptr = buffer;
>  	const u8 *temp;
> @@ -1790,23 +1791,13 @@ static int hdmi_drm_infoframe_unpack(struct
> hdmi_drm_infoframe *frame,
>  	int ret;
>  	int i;
>  
> -	if (size < HDMI_INFOFRAME_SIZE(DRM))
> -		return -EINVAL;
> -
> -	if (ptr[0] != HDMI_INFOFRAME_TYPE_DRM ||
> -	    ptr[1] != 1 ||
> -	    ptr[2] != HDMI_DRM_INFOFRAME_SIZE)
> -		return -EINVAL;
> -
> -	if (hdmi_infoframe_checksum(buffer, HDMI_INFOFRAME_SIZE(DRM))
> != 0)
> +	if (size < HDMI_DRM_INFOFRAME_SIZE)
>  		return -EINVAL;
>  
>  	ret = hdmi_drm_infoframe_init(frame);
>  	if (ret)
>  		return ret;
>  
> -	ptr += HDMI_INFOFRAME_HEADER_SIZE;
> -
>  	frame->eotf = ptr[0] & 0x7;
>  	frame->metadata_type = ptr[1] & 0x7;
>  
> @@ -1814,7 +1805,7 @@ static int hdmi_drm_infoframe_unpack(struct
> hdmi_drm_infoframe *frame,
>  	for (i = 0; i < 3; i++) {
>  		x_lsb = *temp++;
>  		x_msb = *temp++;
> -		frame->display_primaries[i].x =  (x_msb << 8) | x_lsb;
> +		frame->display_primaries[i].x = (x_msb << 8) | x_lsb;
>  		y_lsb = *temp++;
>  		y_msb = *temp++;
>  		frame->display_primaries[i].y = (y_msb << 8) | y_lsb;
> @@ -1830,6 +1821,42 @@ static int hdmi_drm_infoframe_unpack(struct
> hdmi_drm_infoframe *frame,
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL(hdmi_drm_infoframe_unpack_only);
> +
> +/**
> + * hdmi_drm_infoframe_unpack() - unpack binary buffer to a HDMI DRM
> infoframe
> + * @frame: HDMI DRM infoframe
> + * @buffer: source buffer
> + * @size: size of buffer
> + *
> + * Unpacks the CTA-861-G DRM infoframe contained in the binary
> @buffer into
> + * a structured @frame of the HDMI Dynamic Range and Mastering (DRM)
> + * infoframe. It also verifies the checksum as required by section
> 5.3.5 of
> + * the HDMI 1.4 specification.
> + *
> + * Returns 0 on success or a negative error code on failure.
> + */
> +static int hdmi_drm_infoframe_unpack(struct hdmi_drm_infoframe
> *frame,
> +				     const void *buffer, size_t size)
> +{
> +	const u8 *ptr = buffer;
> +	int ret;
> +
> +	if (size < HDMI_INFOFRAME_SIZE(DRM))
> +		return -EINVAL;
> +
> +	if (ptr[0] != HDMI_INFOFRAME_TYPE_DRM ||
> +	    ptr[1] != 1 ||
> +	    ptr[2] != HDMI_DRM_INFOFRAME_SIZE)
> +		return -EINVAL;
> +
> +	if (hdmi_infoframe_checksum(buffer, HDMI_INFOFRAME_SIZE(DRM))
> != 0)
> +		return -EINVAL;
> +
> +	ret = hdmi_drm_infoframe_unpack_only(frame, ptr +
> HDMI_INFOFRAME_HEADER_SIZE,
> +					     size -
> HDMI_INFOFRAME_HEADER_SIZE);
> +	return ret;
> +}
>  
>  /**
>   * hdmi_infoframe_unpack() - unpack binary buffer to a HDMI
> infoframe
> diff --git a/include/linux/hdmi.h b/include/linux/hdmi.h
> index 9613d796cfb1..50c31f1a0a2d 100644
> --- a/include/linux/hdmi.h
> +++ b/include/linux/hdmi.h
> @@ -219,6 +219,8 @@ ssize_t hdmi_drm_infoframe_pack(struct
> hdmi_drm_infoframe *frame, void *buffer,
>  ssize_t hdmi_drm_infoframe_pack_only(const struct hdmi_drm_infoframe
> *frame,
>  				     void *buffer, size_t size);
>  int hdmi_drm_infoframe_check(struct hdmi_drm_infoframe *frame);
> +int hdmi_drm_infoframe_unpack_only(struct hdmi_drm_infoframe *frame,
> +				   const void *buffer, size_t size);
>  
>  enum hdmi_spd_sdi {
>  	HDMI_SPD_SDI_UNKNOWN,
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
