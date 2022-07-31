Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BDD585CE2
	for <lists+dri-devel@lfdr.de>; Sun, 31 Jul 2022 04:15:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BC82B3AFB;
	Sun, 31 Jul 2022 02:15:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26FE2A6BC0
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Jul 2022 02:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1659233687;
 bh=8U5SVjzXF+XRHabpANRx+tSjmZLtWKXH9i6Um/MJiy4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=P8OL1ZkWtdYEtgRXpVZ4oPPSWzmN7rcxuSQ+x/vQeyvTfsNx2oGY72DX+2s6zswKd
 tOPAZu9opZm7rmlNeRzqwj5FUukU3bcbJfbFRAWaNT39tmWLDP/WuDEM+DknrxWWhq
 Bu7WuH9rCUt4zrKJZ1QUOOrtJ5+FDr9GcaZOfd34=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [68.251.140.185] ([68.251.140.185]) by web-mail.gmx.net
 (3c-app-mailcom-bs13.server.lan [172.19.170.181]) (via HTTP); Sun, 31 Jul
 2022 04:14:47 +0200
MIME-Version: 1.0
Message-ID: <trinity-23c389fa-8d72-4800-b7c2-957f08501523-1659233687117@3c-app-mailcom-bs13>
From: Kevin Brace <kevinbrace@gmx.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v3 26/32] drm/via: Add via_drm.h
Content-Type: text/plain; charset=UTF-8
Date: Sun, 31 Jul 2022 04:14:47 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <YuAnXcz0ImO+cAHu@ravnborg.org>
References: <20220725235359.20516-1-kevinbrace@gmx.com>
 <20220725235359.20516-7-kevinbrace@gmx.com> <YuAnXcz0ImO+cAHu@ravnborg.org>
Content-Transfer-Encoding: quoted-printable
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:jahOfQfCu7zaKZ6YpaI/Qr+dguISPwVvwx/M6U3lnTfw/mQBmMyp+jnLXlpb37VCViJbf
 wUo3seUN/8zUtCjmc6uAA52/w33BOsQisf7rg1beoNfzJRfagmi1GhEGhJbMiqzWvFZt72aHoe3U
 WKCHLSmxg6JkIscYno0uXgTApg87oOseGECFtXx7Ra2jzR8czdjT0dtm8J1Hp57HAXHzDvIJwhrE
 pZRugYX6+c0bQsrHwkTtRayM9GpvQCa/q5UefaKAo4kVR85aqmRtDzOx+5t6QN6ceIY4ydT0Ar44
 Bg=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:wxhgudMgl1M=:a4dveevf+Wijd/kT7otqjh
 68t2hrhjRu/KGTqd+GTd5+Ps2TUErmYc0sCxiA/nJ3w1eOZ3M88y0j+CdcYEsJWupsPaHYUGQ
 37XFVfOTspT5/siLyFiT0dzg59UeayBvqGBsuJETHYbO9Otn24w9mWNSqmIYcUtSCvJluvcS0
 3ReWLigXGTUlDx65dOAkUtT5GJKXdvjsO0O3N1UDxybYq+UyqD1j107oK2CphR8RQ/oKWD/7X
 sLDgHcPLgEoE3LsALpQmbsvV0vB43uIfC5GHfzitzyrxt+W2fbhV4xgXL4ZaMPutR3cnBx+YR
 xRsygM7sylfa7qwzOgDamyx3nqPY/snlDFxDUa6zDhj81gv7jrLK+WfAU28DKFGE2g+d/S6hp
 s+al9XtzzbnHiKCwRgibPSd0pgcFcqbiqy8rDzuS/3lkqA3dAzGz41nNIk2IsRgb8/VCnM1JW
 rwQpEcIo5UsPopUoG5V66oNVRvk8yDgBQ2GZijnF8GhlQfPeS8DupL5ITZt05tsDsMoy4B37A
 h0LMWcsCBPVMR8znUS4yUAj/yUOO3joaevHDPmT2dTwkkEvXV+crWo3me1f47aXHjzuiDJJqb
 aUgVcoJ382/+g7zT5BfnsOYrYCVr/jtetD6IfstTYcwoLIpC9+LV07D48bwO2MbGRFN8+Q3Mj
 UkrM1WK2HRZhkHWeShiJCYXX/ZVvKZXsoUBBveKNh7MDUtjvY7vaoWnvAB9nLuGi4R8ESblIi
 ZtVZ0vfanFQDPqtPSmlMFg/Qh2om9c2P08BUGB9WlNoZ6N6xCWE/mczUP5FtZ5P3XzUD8JFrL
 LiQ8hU+
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

Hi Sam,

I will study vc4_drm=2Eh and update newer portions (i=2Ee=2E, the section =
I am actively adding to via_drm=2Eh) with new comments that can be converte=
d to kernel-doc automatically=2E
I also plan to rework the uAPI somewhat=2E

- Remove DRM_VIA_GEM_UNMAP
- Revive a uAPI that can pass a PCI Device ID back to userspace=2E

Regards,

Kevin Brace
Brace Computer Laboratory blog
https://bracecomputerlab=2Ecom


> Sent: Tuesday, July 26, 2022 at 10:41 AM
> From: "Sam Ravnborg" <sam@ravnborg=2Eorg>
> To: "Kevin Brace" <kevinbrace@gmx=2Ecom>
> Cc: dri-devel@lists=2Efreedesktop=2Eorg, "Kevin Brace" <kevinbrace@brace=
computerlab=2Ecom>
> Subject: Re: [PATCH v3 26/32] drm/via: Add via_drm=2Eh
>
> Hi Kevin=2E
>=20
> On Mon, Jul 25, 2022 at 04:53:53PM -0700, Kevin Brace wrote:
> > From: Kevin Brace <kevinbrace@bracecomputerlab=2Ecom>
> >=20
> > Changed the uAPI=2E
> >=20
> > Signed-off-by: Kevin Brace <kevinbrace@bracecomputerlab=2Ecom>
>=20
> It would be great to have the new extensions to the UAPI documented
> using kernel-doc=2E
> As an example see: vc4_drm=2Eh
>=20
> There are a lot of UAPI that is missing documentation, but if we do not
> add it for new UAPI then this situation never improves=2E
>=20
> Please use __u32, __u64 like you see in other drm UAPI files=2E
>=20
> PS=2E If you reply to this mail, then please keep the full mail as
> usually my mails to Kevin bounces (something with STARTTLS)=2E
>=20
> 	Sam
>=20
> > ---
> >  include/uapi/drm/via_drm=2Eh | 35 +++++++++++++++++++++++++++++++----
> >  1 file changed, 31 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/include/uapi/drm/via_drm=2Eh b/include/uapi/drm/via_drm=
=2Eh
> > index a1e125d42208=2E=2Ee9da45ce130a 100644
> > --- a/include/uapi/drm/via_drm=2Eh
> > +++ b/include/uapi/drm/via_drm=2Eh
> > @@ -1,4 +1,5 @@
> >  /*
> > + * Copyright =C2=A9 2020 Kevin Brace
> >   * Copyright 1998-2003 VIA Technologies, Inc=2E All Rights Reserved=
=2E
> >   * Copyright 2001-2003 S3 Graphics, Inc=2E All Rights Reserved=2E
> >   *
> > @@ -16,10 +17,10 @@
> >   * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EX=
PRESS OR
> >   * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTAB=
ILITY,
> >   * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT=2E IN NO EVE=
NT SHALL
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
> >   */
> Do not mix license changes with other changes - and use SPDX tag if
> possible for the updated license=2E
> See other drm UAPI files for examples=2E
>=20
>=20
> >  #ifndef _VIA_DRM_H_
> >  #define _VIA_DRM_H_
> > @@ -81,6 +82,11 @@ extern "C" {
> >  #define DRM_VIA_DMA_BLIT        0x0e
> >  #define DRM_VIA_BLIT_SYNC       0x0f
> >=20
> > +#define	DRM_VIA_GEM_CREATE	0x10
> > +#define	DRM_VIA_GEM_MAP		0x11
> > +#define	DRM_VIA_GEM_UNMAP	0x12
> > +
> Use the same alignment as the previous lines=2E
> > +
> Drop extra empty line=2E
>=20
> >  #define DRM_IOCTL_VIA_ALLOCMEM	  DRM_IOWR(DRM_COMMAND_BASE + DRM_VIA_=
ALLOCMEM, drm_via_mem_t)
> >  #define DRM_IOCTL_VIA_FREEMEM	  DRM_IOW( DRM_COMMAND_BASE + DRM_VIA_F=
REEMEM, drm_via_mem_t)
> >  #define DRM_IOCTL_VIA_AGP_INIT	  DRM_IOWR(DRM_COMMAND_BASE + DRM_VIA_=
AGP_INIT, drm_via_agp_t)
> > @@ -97,6 +103,10 @@ extern "C" {
> >  #define DRM_IOCTL_VIA_DMA_BLIT    DRM_IOW(DRM_COMMAND_BASE + DRM_VIA_=
DMA_BLIT, drm_via_dmablit_t)
> >  #define DRM_IOCTL_VIA_BLIT_SYNC   DRM_IOW(DRM_COMMAND_BASE + DRM_VIA_=
BLIT_SYNC, drm_via_blitsync_t)
> >=20
> > +#define	DRM_IOCTL_VIA_GEM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_VIA_=
GEM_CREATE, struct drm_via_gem_create)
> > +#define	DRM_IOCTL_VIA_GEM_MAP		DRM_IOWR(DRM_COMMAND_BASE + DRM_VIA_GE=
M_MAP, struct drm_via_gem_map)
> > +#define	DRM_IOCTL_VIA_GEM_UNMAP		DRM_IOR(DRM_COMMAND_BASE + DRM_VIA_G=
EM_UNMAP, struct drm_via_gem_unmap)
> > +
> Use same alignment as previous lines=2E
>=20
> >  /* Indices into buf=2ESetup where various bits of state are mirrored =
per
> >   * context and per buffer=2E  These can be fired at the card as a uni=
t,
> >   * or in a piecewise fashion as required=2E
> > @@ -275,6 +285,23 @@ typedef struct drm_via_dmablit {
> >  	drm_via_blitsync_t sync;
> >  } drm_via_dmablit_t;
> >=20
> > +struct drm_via_gem_create {
> > +	uint64_t size;
> > +	uint32_t alignment;
> > +	uint32_t domain;
> > +	uint32_t handle;
> > +	uint64_t offset;
> > +};
> I do not know if this is relevant, but adding a 64 bit parameter
> (offset) that is only 32 bit aligned looks like trouble to me=2E
> I hope others that knows this better can comment here=2E
>=20
> > +
> > +struct drm_via_gem_map {
> > +	uint32_t handle;
> > +	uint64_t map_offset;
> > +};
> Same here with the alignment=2E
>=20
> If drm_via_gem_create=2Eoffset and drm_via_gem_map=2Emap_offset is the s=
ame
> the field should have the same name - to make the API easier to use=2E
>=20
>=20
> > +
> > +struct drm_via_gem_unmap {
> > +	uint32_t handle;
> > +};
> > +
> >  #if defined(__cplusplus)
> >  }
> >  #endif
> > --
> > 2=2E35=2E1
>
