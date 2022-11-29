Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4301963C744
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 19:37:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF9BD10E0BA;
	Tue, 29 Nov 2022 18:37:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1700F10E0BA
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 18:37:20 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 675F34E6;
 Tue, 29 Nov 2022 19:37:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1669747038;
 bh=3C282rs/M6cufMmFfreJo8WgpZ1XT79xEF6JkXEVIyE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FgWj6JiSG3T7+Ibw4+2mMAFWesaGtmwnKq2dIILWeB9WCJ6AYhqSpVt/6DsE/STvp
 Mfwm38iXFg51VJhaL5cjRsQoK/YxUDhoZKlpxUm1AqaUhwsM4WWw7LsG2I5udQ4sw3
 TUeo+XK20rcY+u9QRKqC0ChbV+lhvdosB5WUxkIo=
Date: Tue, 29 Nov 2022 20:37:02 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: =?utf-8?B?SsO2cmc=?= Quinten <abugsworstnightmare@gmail.com>
Subject: Re: [PATCH v2 3/7] media: uapi: add MEDIA_BUS_FMT_BGR666_1X24_CPADHI
Message-ID: <Y4ZRTjeoMbKnDP3u@pendragon.ideasonboard.com>
References: <20221013-rpi-dpi-improvements-v2-0-7691903fb9c8@cerno.tech>
 <20221013-rpi-dpi-improvements-v2-3-7691903fb9c8@cerno.tech>
 <Y4X9KY5ZqRUOGnJE@pendragon.ideasonboard.com>
 <CACfkkaMX8jVU1OJNCwYKWWHRuXpAXNauZ8OvZs6d1ty24K+8kA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACfkkaMX8jVU1OJNCwYKWWHRuXpAXNauZ8OvZs6d1ty24K+8kA@mail.gmail.com>
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
Cc: Chris Morgan <macromorgan@hotmail.com>, Emma Anholt <emma@anholt.net>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Eric Anholt <eric@anholt.net>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jörg,

On Tue, Nov 29, 2022 at 03:52:45PM +0100, Jörg Quinten wrote:
> Hi Laurent,
> 
> looks like linux/Documentation/userspace-api/media/v4l/subdev-formats.rst
> doesn't correlate at all to the arrangement and numbering in
> linux/include/uapi/linux/media-bus-format.h .

Looking at the RGB group in include/uapi/linux/media-bus-format.h in the
mainline kernel, if you exclude the LVDS formats that are documented
separately, and the MEDIA_BUS_FMT_RGB888_3X8_DELTA format that appears
to be undocumented, the formats are ordered in the same way as in
subdev-formats.rst (see
https://linuxtv.org/downloads/v4l-dvb-apis/userspace-api/v4l/subdev-formats.html#v4l2-mbus-pixelcode for an HTML version).

> Which sources do you want me to check?
> 
> Looking at https://github.com/raspberrypi/linux/tree/rpi-6.1.y btw.
> 
> Rgds
> Joerg
> 
> 
> 
> 
> Am Di., 29. Nov. 2022 um 13:38 Uhr schrieb Laurent Pinchart <
> laurent.pinchart@ideasonboard.com>:
> 
> > Hi Maxime and Joerg,
> >
> > Thank you for the patch.
> >
> > On Thu, Oct 20, 2022 at 10:30:47AM +0200, Maxime Ripard wrote:
> > > From: Joerg Quinten <aBUGSworstnightmare@gmail.com>
> > >
> > > Add the BGR666 format MEDIA_BUS_FMT_BGR666_1X24_CPADHI supported by the
> > > RaspberryPi.
> > >
> > > Signed-off-by: Joerg Quinten <aBUGSworstnightmare@gmail.com>
> > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > ---
> > >  .../userspace-api/media/v4l/subdev-formats.rst     | 37
> > ++++++++++++++++++++++
> > >  include/uapi/linux/media-bus-format.h              |  3 +-
> > >  2 files changed, 39 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > > index 68f8d7d37984..604a30e2f890 100644
> > > --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > > +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > > @@ -1023,6 +1023,43 @@ The following tables list existing packed RGB
> > formats.
> > >        - g\ :sub:`2`
> > >        - g\ :sub:`1`
> > >        - g\ :sub:`0`
> > > +    * .. _MEDIA-BUS-FMT-BGR666-1X24_CPADHI:
> >
> > I would move this just below MEDIA_BUS_FMT_RGB565_1X24_CPADHI. Actually,
> > could you check 1/7 and 2/7 to make sure the formats are sorted in the
> > documentation in the same order as in the header ?
> >
> > > +
> > > +      - MEDIA_BUS_FMT_BGR666_1X24_CPADHI
> > > +      - 0x1024
> > > +      -
> > > +      -
> > > +      -
> > > +      -
> > > +      -
> > > +      -
> > > +      -
> > > +      -
> > > +      -
> > > +      - 0
> > > +      - 0
> > > +      - b\ :sub:`5`
> > > +      - b\ :sub:`4`
> > > +      - b\ :sub:`3`
> > > +      - b\ :sub:`2`
> > > +      - b\ :sub:`1`
> > > +      - b\ :sub:`0`
> > > +      - 0
> > > +      - 0
> > > +      - g\ :sub:`5`
> > > +      - g\ :sub:`4`
> > > +      - g\ :sub:`3`
> > > +      - g\ :sub:`2`
> > > +      - g\ :sub:`1`
> > > +      - g\ :sub:`0`
> > > +      - 0
> > > +      - 0
> > > +      - r\ :sub:`5`
> > > +      - r\ :sub:`4`
> > > +      - r\ :sub:`3`
> > > +      - r\ :sub:`2`
> > > +      - r\ :sub:`1`
> > > +      - r\ :sub:`0`
> > >      * .. _MEDIA-BUS-FMT-RGB565-1X24_CPADHI:
> > >
> > >        - MEDIA_BUS_FMT_RGB565_1X24_CPADHI
> > > diff --git a/include/uapi/linux/media-bus-format.h
> > b/include/uapi/linux/media-bus-format.h
> > > index 2ee0b38c0a71..d4228d038b54 100644
> > > --- a/include/uapi/linux/media-bus-format.h
> > > +++ b/include/uapi/linux/media-bus-format.h
> > > @@ -34,7 +34,7 @@
> > >
> > >  #define MEDIA_BUS_FMT_FIXED                  0x0001
> > >
> > > -/* RGB - next is     0x1024 */
> > > +/* RGB - next is     0x1025 */
> > >  #define MEDIA_BUS_FMT_RGB444_1X12            0x1016
> > >  #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE    0x1001
> > >  #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE    0x1002
> > > @@ -49,6 +49,7 @@
> > >  #define MEDIA_BUS_FMT_BGR666_1X18            0x1023
> > >  #define MEDIA_BUS_FMT_RGB666_1X18            0x1009
> > >  #define MEDIA_BUS_FMT_RBG888_1X24            0x100e
> > > +#define MEDIA_BUS_FMT_BGR666_1X24_CPADHI     0x1024
> > >  #define MEDIA_BUS_FMT_RGB666_1X24_CPADHI     0x1015
> > >  #define MEDIA_BUS_FMT_RGB666_1X7X3_SPWG              0x1010
> > >  #define MEDIA_BUS_FMT_BGR888_1X24            0x1013
> > >

-- 
Regards,

Laurent Pinchart
