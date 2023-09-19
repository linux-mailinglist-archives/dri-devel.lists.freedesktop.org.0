Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9E87A6273
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 14:17:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A49E110E245;
	Tue, 19 Sep 2023 12:17:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22EE510E245
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 12:16:59 +0000 (UTC)
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it
 [93.61.96.190])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 28096B75;
 Tue, 19 Sep 2023 14:15:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1695125721;
 bh=jR781oTeb5vA6megg0isNsXOCMDZITJ2c+o9C0Ohi84=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m0A2AGVWKvK2Wobt1ZR0GYLfNbq/z2Mb/gJRpUWEIMBVLYMrSxjDqMLXHTRrAZCdZ
 30WyJCchanRuUJnxxdnPBhDDYECSB0aNWhlal+HX8RHSeHuW94Da+b1rjs8lnELDLj
 AOJ2YnvJjh7OoDCSM0ePN+orIRm9a4Q9BMEnOep4=
Date: Tue, 19 Sep 2023 14:16:54 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v10 3/4] drm: renesas: Add RZ/G2L DU Support
Message-ID: <txc2agqgm7hdbjhrq7ysmjsyflyjc6cqyvkb2ouzdlpy6qzqkw@cn3ax3bnsytq>
References: <20230704090447.27420-1-biju.das.jz@bp.renesas.com>
 <20230704090447.27420-4-biju.das.jz@bp.renesas.com>
 <6sewdcmxpudtixyqmjnegu5jxv7r7rudmzvesequl5b3zotm4h@3twdl2k553fh>
 <OS0PR01MB592252908516D973497E7BE886EDA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <TYCPR01MB5933534F20B0552AD908855786FBA@TYCPR01MB5933.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <TYCPR01MB5933534F20B0552AD908855786FBA@TYCPR01MB5933.jpnprd01.prod.outlook.com>
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Biju

On Mon, Sep 18, 2023 at 08:09:58AM +0000, Biju Das wrote:
> Hi Jacopo Mondi,
>
> Looks like you are happy with my response for V10. I will send V11 soon.

Sorry for the late reply..

See below, I only see two "controversial" points

>
> Cheers,
> Biju
>
> > -----Original Message-----
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> > Sent: Friday, September 8, 2023 2:24 PM
> > Subject: RE: [PATCH v10 3/4] drm: renesas: Add RZ/G2L DU Support
> >

 [snip]

> > >
> > > > +
> > > > +	ditr0 = (DU_DITR0_DEMD_HIGH
> > >
> > > I see most registers definition in rzg2l_du_regs.h being only used by
> > > the crtc driver (some of them are not even used). Why a separate
> > > header file ?
> >
> > For consistency I added header file similar to R-Car. Please let me know
> > this to be added in .c ?
> >


I would say up to you, as R-Car does the same. In general, if a symbol
doesn't need to be exported to any other file, it could very well live
in the .c file.

> > >
> > > > +	      | ((mode->flags & DRM_MODE_FLAG_PVSYNC) ? DU_DITR0_VSPOL : 0)
> > > > +	      | ((mode->flags & DRM_MODE_FLAG_PHSYNC) ? DU_DITR0_HSPOL :

[snip]

> > > ---------
> > > > + * Format helpers
> > > > + */
> > > > +
> > > > +static const struct rzg2l_du_format_info rzg2l_du_format_infos[] = {
> > > > +	{
> > > > +		.fourcc = DRM_FORMAT_RGB565,
> > > > +		.v4l2 = V4L2_PIX_FMT_RGB565,
> > > > +		.bpp = 16,
> > > > +		.planes = 1,
> > > > +		.hsub = 1,
> > > > +	}, {
> > > > +		.fourcc = DRM_FORMAT_ARGB1555,
> > > > +		.v4l2 = V4L2_PIX_FMT_ARGB555,
> > > > +		.bpp = 16,
> > > > +		.planes = 1,
> > > > +		.hsub = 1,
> > > > +	}, {
> > > > +		.fourcc = DRM_FORMAT_XRGB1555,
> > > > +		.v4l2 = V4L2_PIX_FMT_XRGB555,
> > > > +		.bpp = 16,
> > > > +		.planes = 1,
> > > > +	}, {
> > > > +		.fourcc = DRM_FORMAT_XRGB8888,
> > > > +		.v4l2 = V4L2_PIX_FMT_XBGR32,
> > > > +		.bpp = 32,
> > > > +		.planes = 1,
> > > > +		.hsub = 1,
> > > > +	}, {
> > > > +		.fourcc = DRM_FORMAT_ARGB8888,
> > > > +		.v4l2 = V4L2_PIX_FMT_ABGR32,
> > > > +		.bpp = 32,
> > > > +		.planes = 1,
> > > > +		.hsub = 1,
> > > > +	}, {
> > > > +		.fourcc = DRM_FORMAT_UYVY,
> > > > +		.v4l2 = V4L2_PIX_FMT_UYVY,
> > > > +		.bpp = 16,
> > > > +		.planes = 1,
> > > > +		.hsub = 2,
> > > > +	}, {
> > > > +		.fourcc = DRM_FORMAT_YUYV,
> > > > +		.v4l2 = V4L2_PIX_FMT_YUYV,
> > > > +		.bpp = 16,
> > > > +		.planes = 1,
> > > > +		.hsub = 2,
> > > > +	}, {
> > > > +		.fourcc = DRM_FORMAT_NV12,
> > > > +		.v4l2 = V4L2_PIX_FMT_NV12M,
> > > > +		.bpp = 12,
> > > > +		.planes = 2,
> > > > +		.hsub = 2,
> > > > +	}, {
> > > > +		.fourcc = DRM_FORMAT_NV21,
> > > > +		.v4l2 = V4L2_PIX_FMT_NV21M,
> > > > +		.bpp = 12,
> > > > +		.planes = 2,
> > > > +		.hsub = 2,
> > > > +	}, {
> > > > +		.fourcc = DRM_FORMAT_NV16,
> > > > +		.v4l2 = V4L2_PIX_FMT_NV16M,
> > > > +		.bpp = 16,
> > > > +		.planes = 2,
> > > > +		.hsub = 2,
> > > > +	},
> > > > +	{
> > > > +		.fourcc = DRM_FORMAT_RGB332,
> > > > +		.v4l2 = V4L2_PIX_FMT_RGB332,
> > > > +		.bpp = 8,
> > > > +		.planes = 1,
> > > > +		.hsub = 1,
> > > > +	}, {
> > > > +		.fourcc = DRM_FORMAT_ARGB4444,
> > > > +		.v4l2 = V4L2_PIX_FMT_ARGB444,
> > > > +		.bpp = 16,
> > > > +		.planes = 1,
> > > > +		.hsub = 1,
> > > > +	}, {
> > > > +		.fourcc = DRM_FORMAT_XRGB4444,
> > > > +		.v4l2 = V4L2_PIX_FMT_XRGB444,
> > > > +		.bpp = 16,
> > > > +		.planes = 1,
> > > > +		.hsub = 1,
> > > > +	}, {
> > > > +		.fourcc = DRM_FORMAT_RGBA4444,
> > > > +		.v4l2 = V4L2_PIX_FMT_RGBA444,
> > > > +		.bpp = 16,
> > > > +		.planes = 1,
> > > > +		.hsub = 1,
> > > > +	}, {
> > > > +		.fourcc = DRM_FORMAT_RGBX4444,
> > > > +		.v4l2 = V4L2_PIX_FMT_RGBX444,
> > > > +		.bpp = 16,
> > > > +		.planes = 1,
> > > > +		.hsub = 1,
> > > > +	}, {
> > > > +		.fourcc = DRM_FORMAT_ABGR4444,
> > > > +		.v4l2 = V4L2_PIX_FMT_ABGR444,
> > > > +		.bpp = 16,
> > > > +		.planes = 1,
> > > > +		.hsub = 1,
> > > > +	}, {
> > > > +		.fourcc = DRM_FORMAT_XBGR4444,
> > > > +		.v4l2 = V4L2_PIX_FMT_XBGR444,
> > > > +		.bpp = 16,
> > > > +		.planes = 1,
> > > > +		.hsub = 1,
> > > > +	}, {
> > > > +		.fourcc = DRM_FORMAT_BGRA4444,
> > > > +		.v4l2 = V4L2_PIX_FMT_BGRA444,
> > > > +		.bpp = 16,
> > > > +		.planes = 1,
> > > > +		.hsub = 1,
> > > > +	}, {
> > > > +		.fourcc = DRM_FORMAT_BGRX4444,
> > > > +		.v4l2 = V4L2_PIX_FMT_BGRX444,
> > > > +		.bpp = 16,
> > > > +		.planes = 1,
> > > > +		.hsub = 1,
> > > > +	}, {
> > > > +		.fourcc = DRM_FORMAT_RGBA5551,
> > > > +		.v4l2 = V4L2_PIX_FMT_RGBA555,
> > > > +		.bpp = 16,
> > > > +		.planes = 1,
> > > > +		.hsub = 1,
> > > > +	}, {
> > > > +		.fourcc = DRM_FORMAT_RGBX5551,
> > > > +		.v4l2 = V4L2_PIX_FMT_RGBX555,
> > > > +		.bpp = 16,
> > > > +		.planes = 1,
> > > > +		.hsub = 1,
> > > > +	}, {
> > > > +		.fourcc = DRM_FORMAT_ABGR1555,
> > > > +		.v4l2 = V4L2_PIX_FMT_ABGR555,
> > > > +		.bpp = 16,
> > > > +		.planes = 1,
> > > > +		.hsub = 1,
> > > > +	}, {
> > > > +		.fourcc = DRM_FORMAT_XBGR1555,
> > > > +		.v4l2 = V4L2_PIX_FMT_XBGR555,
> > > > +		.bpp = 16,
> > > > +		.planes = 1,
> > > > +		.hsub = 1,
> > > > +	}, {
> > > > +		.fourcc = DRM_FORMAT_BGRA5551,
> > > > +		.v4l2 = V4L2_PIX_FMT_BGRA555,
> > > > +		.bpp = 16,
> > > > +		.planes = 1,
> > > > +		.hsub = 1,
> > > > +	}, {
> > > > +		.fourcc = DRM_FORMAT_BGRX5551,
> > > > +		.v4l2 = V4L2_PIX_FMT_BGRX555,
> > > > +		.bpp = 16,
> > > > +		.planes = 1,
> > > > +		.hsub = 1,
> > > > +	}, {
> > > > +		.fourcc = DRM_FORMAT_BGR888,
> > > > +		.v4l2 = V4L2_PIX_FMT_RGB24,
> > > > +		.bpp = 24,
> > > > +		.planes = 1,
> > > > +		.hsub = 1,
> > > > +	}, {
> > > > +		.fourcc = DRM_FORMAT_RGB888,
> > > > +		.v4l2 = V4L2_PIX_FMT_BGR24,
> > > > +		.bpp = 24,
> > > > +		.planes = 1,
> > > > +		.hsub = 1,
> > > > +	}, {
> > > > +		.fourcc = DRM_FORMAT_RGBA8888,
> > > > +		.v4l2 = V4L2_PIX_FMT_BGRA32,
> > > > +		.bpp = 32,
> > > > +		.planes = 1,
> > > > +		.hsub = 1,
> > > > +	}, {
> > > > +		.fourcc = DRM_FORMAT_RGBX8888,
> > > > +		.v4l2 = V4L2_PIX_FMT_BGRX32,
> > > > +		.bpp = 32,
> > > > +		.planes = 1,
> > > > +		.hsub = 1,
> > > > +	}, {
> > > > +		.fourcc = DRM_FORMAT_ABGR8888,
> > > > +		.v4l2 = V4L2_PIX_FMT_RGBA32,
> > > > +		.bpp = 32,
> > > > +		.planes = 1,
> > > > +		.hsub = 1,
> > > > +	}, {
> > > > +		.fourcc = DRM_FORMAT_XBGR8888,
> > > > +		.v4l2 = V4L2_PIX_FMT_RGBX32,
> > > > +		.bpp = 32,
> > > > +		.planes = 1,
> > > > +		.hsub = 1,
> > > > +	}, {
> > > > +		.fourcc = DRM_FORMAT_BGRA8888,
> > > > +		.v4l2 = V4L2_PIX_FMT_ARGB32,
> > > > +		.bpp = 32,
> > > > +		.planes = 1,
> > > > +		.hsub = 1,
> > > > +	}, {
> > > > +		.fourcc = DRM_FORMAT_BGRX8888,
> > > > +		.v4l2 = V4L2_PIX_FMT_XRGB32,
> > > > +		.bpp = 32,
> > > > +		.planes = 1,
> > > > +		.hsub = 1,
> > > > +	}, {
> > > > +		.fourcc = DRM_FORMAT_RGBX1010102,
> > > > +		.v4l2 = V4L2_PIX_FMT_RGBX1010102,
> > > > +		.bpp = 32,
> > > > +		.planes = 1,
> > > > +		.hsub = 1,
> > > > +	}, {
> > > > +		.fourcc = DRM_FORMAT_RGBA1010102,
> > > > +		.v4l2 = V4L2_PIX_FMT_RGBA1010102,
> > > > +		.bpp = 32,
> > > > +		.planes = 1,
> > > > +		.hsub = 1,
> > > > +	}, {
> > > > +		.fourcc = DRM_FORMAT_ARGB2101010,
> > > > +		.v4l2 = V4L2_PIX_FMT_ARGB2101010,
> > > > +		.bpp = 32,
> > > > +		.planes = 1,
> > > > +		.hsub = 1,
> > > > +	}, {
> > > > +		.fourcc = DRM_FORMAT_YVYU,
> > > > +		.v4l2 = V4L2_PIX_FMT_YVYU,
> > > > +		.bpp = 16,
> > > > +		.planes = 1,
> > > > +		.hsub = 2,
> > > > +	}, {
> > > > +		.fourcc = DRM_FORMAT_NV61,
> > > > +		.v4l2 = V4L2_PIX_FMT_NV61M,
> > > > +		.bpp = 16,
> > > > +		.planes = 2,
> > > > +		.hsub = 2,
> > > > +	}, {
> > > > +		.fourcc = DRM_FORMAT_YUV420,
> > > > +		.v4l2 = V4L2_PIX_FMT_YUV420M,
> > > > +		.bpp = 12,
> > > > +		.planes = 3,
> > > > +		.hsub = 2,
> > > > +	}, {
> > > > +		.fourcc = DRM_FORMAT_YVU420,
> > > > +		.v4l2 = V4L2_PIX_FMT_YVU420M,
> > > > +		.bpp = 12,
> > > > +		.planes = 3,
> > > > +		.hsub = 2,
> > > > +	}, {
> > > > +		.fourcc = DRM_FORMAT_YUV422,
> > > > +		.v4l2 = V4L2_PIX_FMT_YUV422M,
> > > > +		.bpp = 16,
> > > > +		.planes = 3,
> > > > +		.hsub = 2,
> > > > +	}, {
> > > > +		.fourcc = DRM_FORMAT_YVU422,
> > > > +		.v4l2 = V4L2_PIX_FMT_YVU422M,
> > > > +		.bpp = 16,
> > > > +		.planes = 3,
> > > > +		.hsub = 2,
> > > > +	}, {
> > > > +		.fourcc = DRM_FORMAT_YUV444,
> > > > +		.v4l2 = V4L2_PIX_FMT_YUV444M,
> > > > +		.bpp = 24,
> > > > +		.planes = 3,
> > > > +		.hsub = 1,
> > > > +	}, {
> > > > +		.fourcc = DRM_FORMAT_YVU444,
> > > > +		.v4l2 = V4L2_PIX_FMT_YVU444M,
> > > > +		.bpp = 24,
> > > > +		.planes = 3,
> > > > +		.hsub = 1,
> > > > +	}, {
> > > > +		.fourcc = DRM_FORMAT_Y210,
> > > > +		.v4l2 = V4L2_PIX_FMT_Y210,
> > > > +		.bpp = 32,
> > > > +		.planes = 1,
> > > > +		.hsub = 2,
> > > > +	}, {
> > > > +		.fourcc = DRM_FORMAT_Y212,
> > > > +		.v4l2 = V4L2_PIX_FMT_Y212,
> > > > +		.bpp = 32,
> > > > +		.planes = 1,
> > > > +		.hsub = 2,
> > > > +	},
> > > > +};
> > >
> > > I see listed as supported formats in the DU features list
> > >
> > > Input data format (from VSPD): RGB888, RGB666 (not supports dithering of
> > > RGB565)
> > > − Output data format: same as Input data format
> > >
> > > Am I missing something ?
> >
> > If you see the pipeline below, the Image buffer is read by RPF and finally
> > rendered to DU as the VSP is the compositor.
> >
> > Imagebuffer (YUV) --> RPF(YUV)-->WPF(YUV)-->LIF(RGB)-->DU(RGB)

I see, aren't RPF/WPF and LIF part of VSP ? Why do you need to list
YUV formats here if the DU only accepts RGB as input ?

> >
