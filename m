Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5FF585C93
	for <lists+dri-devel@lfdr.de>; Sun, 31 Jul 2022 00:48:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3B3A10E31B;
	Sat, 30 Jul 2022 22:48:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F20210E63F
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Jul 2022 22:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1659221316;
 bh=VPydKylDuMLpiU0t4utwHYO2mBX2WLZmDgbApr7nSjk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=gav46qacDwkgGk5e5cLdMUR61U9+0d51h9YGelpNAzHFjpelceg4uHPEit+0GSmdU
 Z/WXwHfLrIH3sEjNwj8I9bAe6X/61CmXfscVTGPMlhwRc7wQ0fzxJzfQFD/uEUAtAy
 2vhukJp5qQaMmrMhXs4M0sVsf7fxnJ7m5mE56De0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [68.251.140.185] ([68.251.140.185]) by web-mail.gmx.net
 (3c-app-mailcom-bs07.server.lan [172.19.170.175]) (via HTTP); Sun, 31 Jul
 2022 00:48:36 +0200
MIME-Version: 1.0
Message-ID: <trinity-e1f9136b-24dd-44ed-861b-a0735c91422e-1659221316349@3c-app-mailcom-bs07>
From: Kevin Brace <kevinbrace@gmx.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 26/32] drm/via: Add via_drm.h
Content-Type: text/plain; charset=UTF-8
Date: Sun, 31 Jul 2022 00:48:36 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <f7a47d59-d4d2-61fb-4e42-1decff2e7d62@suse.de>
References: <20220725235359.20516-1-kevinbrace@gmx.com>
 <20220725235359.20516-7-kevinbrace@gmx.com>
 <f7a47d59-d4d2-61fb-4e42-1decff2e7d62@suse.de>
Content-Transfer-Encoding: quoted-printable
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:uSqljgKVr9r4wsUVSs2VMD+OQOl1bcLFtWb+aEG2SNaBz8Wf5I028CSebtKLXWmmVG6Uw
 iAA2zKerLwjyypdwP6Ay+F6ZjShosg90MD7/T3/u3CCdxkTPVRPO7AUghan/ObmCpMzCn74A3NOc
 sfxZ5WdxFvFPi2l7nVeYBnl3ccN1gkAvLY466R3EFLglhCFajya04anHRMBJJ/RzIQyAMSYwc0SB
 NrfkRWoh5kH2VLw2B9PtRhVJBZWSwujKOY810jTc3AA8374tBajOZgVr4RIpS4fjh5uQgiYmbikp
 gA=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:G2ny3wWHnBQ=:XOwQrO5NOAIKdo4ilvOlvt
 atloJENfheX+UEHRxJPqJg9zdClOR74KxKRxFsttSY3nQJIPmx9ZKBl2i/4E1UEKzLTKg0WBe
 g0xWW62R8vKLlcbCLbp8HFBKOPa8Vv23y+OVeJG6zMvHg69Z++8Z3nS2sB2ti/Heo2P0cCE/m
 wUHMUwy6dO1hU19vk5nEYGSZLtNOGbyfvWqE1sP3kWaLj4koDRqCSaekhviGB7Wu6reRDODoL
 KiPAOKLgPrNakRQGxGBbeqbR7oDTP4S0Ls5cINVYBwH7G+paTGuExqLgQs77drHzg6MSlUtas
 XYMm1UzhvPHp7yddrHqQ78ewuh6UEpRGpwRimX7gfo/DL8dWj7WQ2RJP8LS5Pb6udvoNML1kN
 mcaSQj139wX2OeO/zpg/AhrrXTT2kj0NjDlMCzYx7y4Fskh+1SgySfkZG399ioHSdrNGy5o+o
 4IigaZYpjmgSMP9KtA9Leu4OsV/6Ip1hrB8IdYDIOfKVwfuSqNbhaOHScFEQjSQ3D544WMvA4
 Mz8WyXY+2Cir+QSBExMr03VJgVSX1WrfusyHE/UZLjap1bGI3lrDqxWtJrDvnnqzNB4MODGlc
 newtkSFvxLD6EQwc7OWOmq1Dcl7/qzXHaBzcn31bgylvIvv02e7wcB8ZQvgiJo0kKdrh86xqq
 nZuImwf358viVHp32+82WwNyOMk7Xtt1R79znG5EKBXaYQSsnuaG2PYJIxT4WCPHjv3bo4R+Y
 b6W6u9ZbaFvQPcvbFmh1TdSEW/emgoHPFgLmghlXaIUz4QL2vA8BBQCtzKnJmAejD0JMQMzGy
 uSatClp
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

I cannot drop the older DRI1 based uAPI calls=2E
This is because include/uapi/drm/via_drm=2Eh needs to retain backward comp=
atibility with the existing OpenChrome DDX's XvMC library (it gets compiled=
 when OpenChrome DDX is built) and likely with the existing DDX Xv code as =
well=2E
If I remove the DRI1 based uAPI calls, the XvMC library will not get compi=
led (compile error will occur since the XvMC library assumes the presence o=
f DRI1 based uAPI), and I assume the same for the DDX Xv code (I cannot eve=
n reach here since the XvMC library is compiled first)=2E
Although the v3 patch does not contain it, v4 patch will utilize drm_inval=
id_op() for the discontinued (not deprecated since OpenChrome DRM does not =
support the older DRI1 based uAPI at all) DRI1 based uAPI=2E

https://cgit=2Efreedesktop=2Eorg/openchrome/drm-openchrome/commit/?h=3Ddrm=
-next-5=2E20&id=3D16b3d68f95c9ccd15b7a3310e5d752fabbc76518

drm_invalid_op() is related to drm_ioctl=2Ec, and is meant for legacy DRMs=
 like Radeon, i915, etc=2E
Since OpenChrome DRM is not a clean sheet design (related to VIA DRM to so=
me extent), I will use this function for properly handling discontinued leg=
acy uAPI calls=2E
I hope this explanation / reasoning is okay with you=2E

Regards,

Kevin Brace
Brace Computer Laboratory blog
https://bracecomputerlab=2Ecom

> Sent: Tuesday, July 26, 2022 at 11:24 AM
> From: "Thomas Zimmermann" <tzimmermann@suse=2Ede>
> To: "Kevin Brace" <kevinbrace@gmx=2Ecom>, dri-devel@lists=2Efreedesktop=
=2Eorg
> Cc: "Kevin Brace" <kevinbrace@bracecomputerlab=2Ecom>
> Subject: Re: [PATCH v3 26/32] drm/via: Add via_drm=2Eh
>
> Hi
>=20
> Am 26=2E07=2E22 um 01:53 schrieb Kevin Brace:
> > From: Kevin Brace <kevinbrace@bracecomputerlab=2Ecom>
> >=20
> > Changed the uAPI=2E
> >=20
> > Signed-off-by: Kevin Brace <kevinbrace@bracecomputerlab=2Ecom>
> > ---
> >   include/uapi/drm/via_drm=2Eh | 35 +++++++++++++++++++++++++++++++---=
-
> >   1 file changed, 31 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/include/uapi/drm/via_drm=2Eh b/include/uapi/drm/via_drm=
=2Eh
> > index a1e125d42208=2E=2Ee9da45ce130a 100644
> > --- a/include/uapi/drm/via_drm=2Eh
> > +++ b/include/uapi/drm/via_drm=2Eh
> > @@ -1,4 +1,5 @@
> >   /*
> > + * Copyright =C2=A9 2020 Kevin Brace
> >    * Copyright 1998-2003 VIA Technologies, Inc=2E All Rights Reserved=
=2E
> >    * Copyright 2001-2003 S3 Graphics, Inc=2E All Rights Reserved=2E
> >    *
> > @@ -16,10 +17,10 @@
> >    * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, E=
XPRESS OR
> >    * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTA=
BILITY,
> >    * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT=2E IN NO EV=
ENT SHALL
> > - * VIA, S3 GRAPHICS, AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DA=
MAGES OR
> > - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWI=
SE,
> > - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE=
 OR OTHER
> > - * DEALINGS IN THE SOFTWARE=2E
> > + * THE AUTHORS, COPYRIGHT HOLDERS, AND/OR ITS SUPPLIERS BE LIABLE FOR=
 ANY
> > + * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRAC=
T, TORT
> > + * OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTW=
ARE OR
> > + * THE USE OR OTHER DEALINGS IN THE SOFTWARE=2E
> >    */
> >   #ifndef _VIA_DRM_H_
> >   #define _VIA_DRM_H_
> > @@ -81,6 +82,11 @@ extern "C" {
> >   #define DRM_VIA_DMA_BLIT        0x0e
> >   #define DRM_VIA_BLIT_SYNC       0x0f
> >=20
> > +#define	DRM_VIA_GEM_CREATE	0x10
> > +#define	DRM_VIA_GEM_MAP		0x11
> > +#define	DRM_VIA_GEM_UNMAP	0x12
>=20
> This looks a lot like ioctl ops for using accelerated HW buffers=2E But=
=20
> the patch is near the end of the series and you said in the series'=20
> cover letter that there's no acceleration=2E I suspect that these=20
> constants are currently unused?  If so, please drop the patch from the=
=20
> series=2E If can be merged later when something really depends on it=2E
>=20
> Best regards
> Thomas
>=20
> > +
> > +
> >   #define DRM_IOCTL_VIA_ALLOCMEM	  DRM_IOWR(DRM_COMMAND_BASE + DRM_VIA=
_ALLOCMEM, drm_via_mem_t)
> >   #define DRM_IOCTL_VIA_FREEMEM	  DRM_IOW( DRM_COMMAND_BASE + DRM_VIA_=
FREEMEM, drm_via_mem_t)
> >   #define DRM_IOCTL_VIA_AGP_INIT	  DRM_IOWR(DRM_COMMAND_BASE + DRM_VIA=
_AGP_INIT, drm_via_agp_t)
> > @@ -97,6 +103,10 @@ extern "C" {
> >   #define DRM_IOCTL_VIA_DMA_BLIT    DRM_IOW(DRM_COMMAND_BASE + DRM_VIA=
_DMA_BLIT, drm_via_dmablit_t)
> >   #define DRM_IOCTL_VIA_BLIT_SYNC   DRM_IOW(DRM_COMMAND_BASE + DRM_VIA=
_BLIT_SYNC, drm_via_blitsync_t)
> >=20
> > +#define	DRM_IOCTL_VIA_GEM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_VIA_=
GEM_CREATE, struct drm_via_gem_create)
> > +#define	DRM_IOCTL_VIA_GEM_MAP		DRM_IOWR(DRM_COMMAND_BASE + DRM_VIA_GE=
M_MAP, struct drm_via_gem_map)
> > +#define	DRM_IOCTL_VIA_GEM_UNMAP		DRM_IOR(DRM_COMMAND_BASE + DRM_VIA_G=
EM_UNMAP, struct drm_via_gem_unmap)
> > +
> >   /* Indices into buf=2ESetup where various bits of state are mirrored=
 per
> >    * context and per buffer=2E  These can be fired at the card as a un=
it,
> >    * or in a piecewise fashion as required=2E
> > @@ -275,6 +285,23 @@ typedef struct drm_via_dmablit {
> >   	drm_via_blitsync_t sync;
> >   } drm_via_dmablit_t;
> >=20
> > +struct drm_via_gem_create {
> > +	uint64_t size;
> > +	uint32_t alignment;
> > +	uint32_t domain;
> > +	uint32_t handle;
> > +	uint64_t offset;
> > +};
> > +
> > +struct drm_via_gem_map {
> > +	uint32_t handle;
> > +	uint64_t map_offset;
> > +};
> > +
> > +struct drm_via_gem_unmap {
> > +	uint32_t handle;
> > +};
> > +
> >   #if defined(__cplusplus)
> >   }
> >   #endif
> > --
> > 2=2E35=2E1
> >=20
>=20
> --=20
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr=2E 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev
>
