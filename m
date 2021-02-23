Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C30322DCD
	for <lists+dri-devel@lfdr.de>; Tue, 23 Feb 2021 16:45:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1B8B6E9C4;
	Tue, 23 Feb 2021 15:45:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 548 seconds by postgrey-1.36 at gabe;
 Tue, 23 Feb 2021 15:45:55 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 895AF6E9C4;
 Tue, 23 Feb 2021 15:45:55 +0000 (UTC)
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M5gAG-1lCxBL1zPW-007Dru; Tue, 23 Feb 2021 16:36:33 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
 by mail.cetitecgmbh.com (Postfix) with ESMTP id 92CFB1E01E7;
 Tue, 23 Feb 2021 15:36:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
 by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com
 [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id blSB3nUsz-cE; Tue, 23 Feb 2021 16:36:32 +0100 (CET)
Received: from pflmari.corp.cetitec.com (2-usr-pf-main.vpn.it.cetitec.com
 [10.8.5.2])
 by mail.cetitecgmbh.com (Postfix) with ESMTPSA id 3F9B51E01E6;
 Tue, 23 Feb 2021 16:36:32 +0100 (CET)
Received: by pflmari.corp.cetitec.com (Postfix, from local account)
Date: Tue, 23 Feb 2021 16:36:31 +0100
From: Alex Riesen <alexander.riesen@cetitec.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [PATCH 2/3] drm/nouveau/kms/nv50-: Report max cursor size to
 userspace
Message-ID: <YDUg/9fjsvTkRUqr@pflmari>
References: <20210119015415.2511028-1-lyude@redhat.com>
 <20210119015415.2511028-2-lyude@redhat.com>
 <YDUN+Re/alMVL0Zn@pflmari>
 <CAKb7UvhFkw23so-a4JKLzpQLhphzjzarOy-9h+FiKP-aAC=4xw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKb7UvhFkw23so-a4JKLzpQLhphzjzarOy-9h+FiKP-aAC=4xw@mail.gmail.com>
X-Provags-ID: V03:K1:lLfiHh+wAU5dx6w2wtMoChBxn+RUn1NPTqMejn0E5YxvkGIR5C7
 T/ocA7y4+SV4umv5AYaWXbtoiI04JxTxRQyXnS5A5TN+Ey+EqY1H5nL19RGjrJyFGdRBynt
 bKPDnBpiqfV282AW5wOnWm26A0+NwhDq/puB793Ygpd0zuN+qZgQxfnFLwTF5ddKAFMP8w1
 apOtnKnNM1j+zfAPQW+Bw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Bv5rWH9T7NQ=:R4YKxD1vUCvKsLHSpatmlM
 5RYVodJf6RNTarfWPc/mI0t6joh6TYTng9UhC4DvB8brSsXW+NR06UM3Ni+HedW/gm21Ew/jF
 lCZ9xF1QfkX2Hb4e0BNLImD3mJ5brLM4LEhXSZEkzA5dnlzGLS8kqJC/Fnv34cTJAatnB9Eed
 vwQo3VlYefm+ff556yHV0H8cUnVsY1ovENYG3DSdlPFsiUG7+ZufKJjcioEKTxIZKj5L6wYLl
 kiU1v2jQUvJg9iAUl790zcDLZfP35GtCOGWSDssMM1Uu7UtyZkqLBapm42B8HUZd8JePUy4aN
 w9Iu9sNcBcljpduvtQzA04aZBxC7Bx77FM+7xPT3fJ0ieT+SMsRxVCjswEvv4KzCJGFfU6Y5N
 2SQKJfcsDeDEDrACB5pOfn9S2ivX4T2DB0GZzMOMUsJOqfc7+WyehoUBLOyugbPqodcZ3OIaK
 pvXV5zxPlg==
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
Cc: David Airlie <airlied@linux.ie>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 James Jones <jajones@nvidia.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jeremy Cline <jcline@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, nouveau <nouveau@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ilia Mirkin, Tue, Feb 23, 2021 15:56:21 +0100:
> On Tue, Feb 23, 2021 at 9:26 AM Alex Riesen <alexander.riesen@cetitec.com> wrote:
> > Lyude Paul, Tue, Jan 19, 2021 02:54:13 +0100:
> > > diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > > index c6367035970e..5f4f09a601d4 100644
> > > --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > > +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > > @@ -2663,6 +2663,14 @@ nv50_display_create(struct drm_device *dev)
> > >       else
> > >               nouveau_display(dev)->format_modifiers = disp50xx_modifiers;
> > >
> > > +     if (disp->disp->object.oclass >= GK104_DISP) {
> > > +             dev->mode_config.cursor_width = 256;
> > > +             dev->mode_config.cursor_height = 256;
> > > +     } else {
> > > +             dev->mode_config.cursor_width = 64;
> > > +             dev->mode_config.cursor_height = 64;
> > > +     }
> > > +
> > >       /* create crtc objects to represent the hw heads */
> > >       if (disp->disp->object.oclass >= GV100_DISP)
> > >               crtcs = nvif_rd32(&device->object, 0x610060) & 0xff;
> >
> > This change broke X cursor in my setup, and reverting the commit restores it.
> >
> > Dell Precision M4800, issue ~2014 with GK106GLM [Quadro K2100M] (rev a1).
> > libdrm 2.4.91-1 (Debian 10.8 stable).
> > There are no errors or warnings in Xorg logs nor in the kernel log.
> 
> Could you confirm which ddx is driving the nvidia hw? You can find
> this out by running "xrandr --listproviders", or also in the xorg log.

xrandr(1) does not seem to list much:

$ xrandr --listproviders
Providers: number : 1
Provider 0: id: 0x48 cap: 0xf, Source Output, Sink Output, Source Offload, Sink Offload crtcs: 4 outputs: 5 associated providers: 0 name:modesetting

I failed to find a DDX in Xorg.0.log. Both Xorg.0.log and dmesg can be seen here:

    https://gist.github.com/ar-cetitec/68c27551d9a59b89dc73bffe0456bbef


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
