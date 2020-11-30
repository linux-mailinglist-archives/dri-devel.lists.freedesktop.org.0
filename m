Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7325F2C838A
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 12:53:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31A3F6E463;
	Mon, 30 Nov 2020 11:53:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FBF86E463
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 11:53:36 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AUBrTwT079126;
 Mon, 30 Nov 2020 05:53:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606737209;
 bh=3MK1qYmSJ5zXrbqSvbmV/BvL0DhbrGdkIEARlh5HYZo=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=nljOttgfl+K5hkaSgGYKTqwnb9HFDEUa8I3JThqkpx+rq4aG0YD68BemfdaaI+OeF
 5AdwJ5r74tWVG79MSVZ4zj5eslGRlqArlIS4d5mh4YreVnFQvH7plJHanhRBFVpn67
 9oABw46iLwjdqNgOs19MIWLLBMZu0EYArXTWzpSc=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AUBrSXf071030
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 30 Nov 2020 05:53:28 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 30
 Nov 2020 05:53:28 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 30 Nov 2020 05:53:28 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AUBrQXd016069;
 Mon, 30 Nov 2020 05:53:26 -0600
Subject: Re: [PATCH v2 5/5] drm/omap: Enable COLOR_ENCODING and COLOR_RANGE
 properties for planes
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20201103080310.164453-1-tomi.valkeinen@ti.com>
 <20201103080310.164453-6-tomi.valkeinen@ti.com>
 <20201130105038.GU4141@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <762454cd-56e5-bcb7-cef0-f4fa3833591f@ti.com>
Date: Mon, 30 Nov 2020 13:53:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201130105038.GU4141@pendragon.ideasonboard.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Sekhar Nori <nsekhar@ti.com>, Jyri Sarha <jsarha@ti.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/11/2020 12:50, Laurent Pinchart wrote:
> Hi Tomi and Jyri,
> 
> Thank you for the patch.
> 
> On Tue, Nov 03, 2020 at 10:03:10AM +0200, Tomi Valkeinen wrote:
>> From: Jyri Sarha <jsarha@ti.com>
>>
>> Adds support for COLOR_ENCODING and COLOR_RANGE properties to
>> omap_plane.c and dispc.c. The supported encodings and ranges are
>> presets are:
>>
>> For COLOR_ENCODING:
>> - YCbCr BT.601 (default)
>> - YCbCr BT.709
>>
>> For COLOR_RANGE:
>> - YCbCr limited range
>> - YCbCr full range (default)
>>
>> Signed-off-by: Jyri Sarha <jsarha@ti.com>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
>> ---
>>  drivers/gpu/drm/omapdrm/dss/dispc.c   | 104 ++++++++++++++++----------
>>  drivers/gpu/drm/omapdrm/dss/omapdss.h |   4 +
>>  drivers/gpu/drm/omapdrm/omap_plane.c  |  30 ++++++++
>>  3 files changed, 97 insertions(+), 41 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdrm/dss/dispc.c
>> index 48593932bddf..bf0c9d293077 100644
>> --- a/drivers/gpu/drm/omapdrm/dss/dispc.c
>> +++ b/drivers/gpu/drm/omapdrm/dss/dispc.c
>> @@ -874,50 +874,67 @@ static void dispc_ovl_write_color_conv_coef(struct dispc_device *dispc,
>>  #undef CVAL
>>  }
>>  
>> -static void dispc_wb_write_color_conv_coef(struct dispc_device *dispc,
>> -					   const struct csc_coef_rgb2yuv *ct)
>> -{
>> -	const enum omap_plane_id plane = OMAP_DSS_WB;
>> -
>> -#define CVAL(x, y) (FLD_VAL(x, 26, 16) | FLD_VAL(y, 10, 0))
>> +/* YUV -> RGB, ITU-R BT.601, full range */
>> +static const struct csc_coef_yuv2rgb coefs_yuv2rgb_bt601_full = {
>> +	256,   0,  358,		/* ry, rcb, rcr |1.000  0.000  1.402|*/
>> +	256, -88, -182,		/* gy, gcb, gcr |1.000 -0.344 -0.714|*/
>> +	256, 452,    0,		/* by, bcb, bcr |1.000  1.772  0.000|*/
>> +	true,			/* full range */
>> +};
>>  
>> -	dispc_write_reg(dispc, DISPC_OVL_CONV_COEF(plane, 0), CVAL(ct->yg,  ct->yr));
>> -	dispc_write_reg(dispc, DISPC_OVL_CONV_COEF(plane, 1), CVAL(ct->crr, ct->yb));
>> -	dispc_write_reg(dispc, DISPC_OVL_CONV_COEF(plane, 2), CVAL(ct->crb, ct->crg));
>> -	dispc_write_reg(dispc, DISPC_OVL_CONV_COEF(plane, 3), CVAL(ct->cbg, ct->cbr));
>> -	dispc_write_reg(dispc, DISPC_OVL_CONV_COEF(plane, 4), CVAL(0, ct->cbb));
>> +/* YUV -> RGB, ITU-R BT.601, limited range */
>> +static const struct csc_coef_yuv2rgb coefs_yuv2rgb_bt601_lim = {
>> +	298,    0,  409,	/* ry, rcb, rcr |1.164  0.000  1.596|*/
>> +	298, -100, -208,	/* gy, gcb, gcr |1.164 -0.392 -0.813|*/
>> +	298,  516,    0,	/* by, bcb, bcr |1.164  2.017  0.000|*/
>> +	false,			/* limited range */
>> +};
>>  
>> -	REG_FLD_MOD(dispc, DISPC_OVL_ATTRIBUTES(plane), ct->full_range, 11, 11);
>> +/* YUV -> RGB, ITU-R BT.709, full range */
>> +static const struct csc_coef_yuv2rgb coefs_yuv2rgb_bt709_full = {
>> +	256,    0,  402,        /* ry, rcb, rcr |1.000  0.000  1.570|*/
>> +	256,  -48, -120,        /* gy, gcb, gcr |1.000 -0.187 -0.467|*/
>> +	256,  475,    0,        /* by, bcb, bcr |1.000  1.856  0.000|*/
>> +	true,                   /* full range */
>> +};
>>  
>> -#undef CVAL
>> -}
>> +/* YUV -> RGB, ITU-R BT.709, limited range */
>> +static const struct csc_coef_yuv2rgb coefs_yuv2rgb_bt709_lim = {
>> +	298,    0,  459,	/* ry, rcb, rcr |1.164  0.000  1.793|*/
>> +	298,  -55, -136,	/* gy, gcb, gcr |1.164 -0.213 -0.533|*/
>> +	298,  541,    0,	/* by, bcb, bcr |1.164  2.112  0.000|*/
>> +	false,			/* limited range */
>> +};
>>  
>> -static void dispc_setup_color_conv_coef(struct dispc_device *dispc)
>> +static int dispc_ovl_set_csc(struct dispc_device *dispc,
>> +			     enum omap_plane_id plane,
>> +			     enum drm_color_encoding color_encoding,
>> +			     enum drm_color_range color_range)
>>  {
>> -	int i;
>> -	int num_ovl = dispc_get_num_ovls(dispc);
>> -
>> -	/* YUV -> RGB, ITU-R BT.601, limited range */
>> -	const struct csc_coef_yuv2rgb coefs_yuv2rgb_bt601_lim = {
>> -		298,    0,  409,	/* ry, rcb, rcr */
>> -		298, -100, -208,	/* gy, gcb, gcr */
>> -		298,  516,    0,	/* by, bcb, bcr */
>> -		false,			/* limited range */
>> -	};
>> +	const struct csc_coef_yuv2rgb *csc;
>>  
>> -	/* RGB -> YUV, ITU-R BT.601, limited range */
>> -	const struct csc_coef_rgb2yuv coefs_rgb2yuv_bt601_lim = {
>> -		 66, 129,  25,		/* yr,   yg,  yb */
>> -		-38, -74, 112,		/* cbr, cbg, cbb */
>> -		112, -94, -18,		/* crr, crg, crb */
>> -		false,			/* limited range */
>> -	};
>> +	switch (color_encoding) {
>> +	case DRM_COLOR_YCBCR_BT601:
>> +		if (color_range == DRM_COLOR_YCBCR_FULL_RANGE)
>> +			csc = &coefs_yuv2rgb_bt601_full;
>> +		else
>> +			csc = &coefs_yuv2rgb_bt601_lim;
>> +		break;
>> +	case DRM_COLOR_YCBCR_BT709:
>> +		if (color_range == DRM_COLOR_YCBCR_FULL_RANGE)
>> +			csc = &coefs_yuv2rgb_bt709_full;
>> +		else
>> +			csc = &coefs_yuv2rgb_bt709_lim;
>> +		break;
>> +	default:
>> +		DSSERR("Unsupported CSC mode %d for plane %d\n",
>> +		       color_encoding, plane);
>> +		return -EINVAL;
> 
> Can this happen, given that the properties are created with only the
> above four combinations being allowed ?

No, it shouldn't happen. Are you just asking, or are you suggesting that we shouldn't check if
color_encoding is valid here?

I don't usually check parameters which we can expect to be correct, but with we use switch/if with
the parameter, we have to deal with the "else" case too.

>> +	}
>>  
>> -	for (i = 1; i < num_ovl; i++)
>> -		dispc_ovl_write_color_conv_coef(dispc, i, &coefs_yuv2rgb_bt601_lim);
>> +	dispc_ovl_write_color_conv_coef(dispc, plane, csc);
>>  
>> -	if (dispc->feat->has_writeback)
>> -		dispc_wb_write_color_conv_coef(dispc, &coefs_rgb2yuv_bt601_lim);
> 
> Unless I'm mistaken, the writeback plane doesn't have the CSC matrix
> configured anymore. Is that intentional ?

It's intentional. I should add it to the description.

The driver doesn't support writeback, even if we have bits and pieces of writeback code in the
dispc.c. I've been hoping to add WB support, so I haven't just removed them. However, here I didn't
want to add new code for WB that I can't test, so I decided to just drop the WB case.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
