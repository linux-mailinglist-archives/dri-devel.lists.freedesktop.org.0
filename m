Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCD8587613
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 05:46:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A65611A6C4;
	Tue,  2 Aug 2022 03:45:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06A7810E0EC
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Aug 2022 03:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1659411946;
 bh=EY99ct+ucmAkvup3sp4GfL2sDRDfSGvg847KYshcAqI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=StyXYpAF38FJk3Goee7NevM2OiUU5cYwDCNX5S+tfbaw3xG1TjoQUkG/qmiPrkR5H
 8Tm86u81DmVaYew1zyUozXBIFbv6IS67aqFilXLfEDy2ydjcIKGM8mwisECp11TooJ
 2k1NKL3Ck17Icqe5Ta9vFELprhXZRmB6en6XVaxI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [23.24.200.25] ([23.24.200.25]) by web-mail.gmx.net
 (3c-app-mailcom-bs03.server.lan [172.19.170.169]) (via HTTP); Tue, 2 Aug
 2022 05:45:46 +0200
MIME-Version: 1.0
Message-ID: <trinity-8c70d1f1-fd67-46a1-a84b-7cc771cca62d-1659411946174@3c-app-mailcom-bs03>
From: Kevin Brace <kevinbrace@gmx.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 26/32] drm/via: Add via_drm.h
Content-Type: text/plain; charset=UTF-8
Date: Tue, 2 Aug 2022 05:45:46 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <43fd433c-f108-d75a-b141-f4ff985455b9@suse.de>
References: <20220725235359.20516-1-kevinbrace@gmx.com>
 <20220725235359.20516-7-kevinbrace@gmx.com>
 <f7a47d59-d4d2-61fb-4e42-1decff2e7d62@suse.de>
 <trinity-e1f9136b-24dd-44ed-861b-a0735c91422e-1659221316349@3c-app-mailcom-bs07>
 <43fd433c-f108-d75a-b141-f4ff985455b9@suse.de>
Content-Transfer-Encoding: quoted-printable
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:KGCLMyQTE27UEagfuB5XrBHe31e82pEUxgZu2YpOIzbwmKKvqxpNlB7unMb+SyjCg9r5Z
 Cyea+TEJnY9Cecaq2U78fb91e1EQeQMVhYOGpXM5E+J010QBZYzlXKRY+/Ip6T/RjprElhUR3pAM
 HQ4i5i2Kx8i+ntHarMdg4ivanlAmFQBWdGs9wt0qq33mkxrKs6tR/hfZS+B0uLaVF9adbi6YXPfh
 mNE8u0MteAB5js/6Ww2NrE/jWd04SGjHsN3t1+vFUoyWoamNhZkLuVwh6Jv5K+dEYbYuoEXwIV7k
 qY=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:zI3JiCdR6TY=:x8wDvjNxqnUoE91DZ0kQqo
 wlUjIqb/1d0OhdSjCnd2LPa/otHpJZctlV5eY+eu5qSIgWUfWHGLf8D+veMgI8EddwJnQhtQS
 XgZu1JUkllpIib19yUmkG9TP0yNfz7yhvWaKYLMlefjpFNtNhIDYybVPoGpuKtkILa/oickT+
 Xfs6RoEBJX9GtNuVN47kJ/1G4CwaJvFNc7RJ2S8E8Uv6A4hKP9AF3oAtOYymmBxm8d6ilfoz2
 lMijYPab2G7JmZO7cpg9uraXbseaJMzbe/ZyCzD0I1P+h5vbchcAbExMoFYUK+PBxIG8lPOs/
 Ih0S/0pYTdouVgfEJ3mQzUxOflTI/kXKLtlzUk8WmFd8Eyf1YEbcto//zT9rTHadGyqSbGnea
 mgPSKifdo/uBoXRHIqoLWs4Eb272gJuOFaZpvmfYL6iLT2IOUmOja0NthsqbKhxjH2I2m11ds
 F6xzsC68m7Na5x+wDhW9PwsR8vFvUIXF6AAiiAU7kUIzp6nyK+BKbb/HFlI8mb30vmcPf/51N
 bKYdnvmPFGJ0Js8a+KvJ69ThximF6LbLwf14MHxbIL6ATtn4MFnqiL36wcVXY8NWHsqo7EYJO
 4tIhxrD3F1z9V2oj7OrOhouiwvX2j7vvET8Pdms/FA/iLnkIpDhN8L1UdmRyo9fhDLBEWUslG
 wVkn935Df5gSTctvnI+3Oc0KIv2MTzZs8FVusz20v1Mcmwg2oWSFPLW820YESkrWwv0ePNPLD
 wD+hsny8Fz+sLfMFgS7VFRgBjjxmoMFTeHZ9ShPGOByJlyGuVSKoXa9wcd8W6WTHT0TJiqorQ
 QnAVLu+
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

I hope I am comprehending this right=2E
Yes, I am adding 3 new uAPI calls, not 6 of them=2E
Correspondingly, there are 3 new structs added=2E
While I may drop one (unmap uAPI), I personally do not wish to drop the ot=
her two at this point=2E
Instead, I may need to add setparam and / or getparam uAPI to pass PCI Dev=
ice ID back to the userspace=2E
This is mainly needed by Mesa, although there is no code for Mesa at this =
point=2E
I fear dropping the remaining two will require substantial redesign, and I=
 will like to avoid this since the code is already working=2E
It is my plan to proceed to adding acceleration after the code is added to=
 the mainline kernel tree, so I will like to do it the way it is set up now=
=2E

Regards,

Kevin Brace
Brace Computer Laboratory blog
https://bracecomputerlab=2Ecom


> Sent: Monday, August 01, 2022 at 11:49 AM
> From: "Thomas Zimmermann" <tzimmermann@suse=2Ede>
> To: "Kevin Brace" <kevinbrace@gmx=2Ecom>
> Cc: dri-devel@lists=2Efreedesktop=2Eorg
> Subject: Re: [PATCH v3 26/32] drm/via: Add via_drm=2Eh
>
> Hi Kevin
>=20
> Am 31=2E07=2E22 um 00:48 schrieb Kevin Brace:
> > Hi Thomas,
> >=20
> > I cannot drop the older DRI1 based uAPI calls=2E
> > This is because include/uapi/drm/via_drm=2Eh needs to retain backward =
compatibility with the existing OpenChrome DDX's XvMC library (it gets comp=
iled when OpenChrome DDX is built) and likely with the existing DDX Xv code=
 as well=2E
> > If I remove the DRI1 based uAPI calls, the XvMC library will not get c=
ompiled (compile error will occur since the XvMC library assumes the presen=
ce of DRI1 based uAPI), and I assume the same for the DDX Xv code (I cannot=
 even reach here since the XvMC library is compiled first)=2E
> > Although the v3 patch does not contain it, v4 patch will utilize drm_i=
nvalid_op() for the discontinued (not deprecated since OpenChrome DRM does =
not support the older DRI1 based uAPI at all) DRI1 based uAPI=2E
> >=20
> > https://cgit=2Efreedesktop=2Eorg/openchrome/drm-openchrome/commit/?h=
=3Ddrm-next-5=2E20&id=3D16b3d68f95c9ccd15b7a3310e5d752fabbc76518
> >=20
> > drm_invalid_op() is related to drm_ioctl=2Ec, and is meant for legacy =
DRMs like Radeon, i915, etc=2E
> > Since OpenChrome DRM is not a clean sheet design (related to VIA DRM t=
o some extent), I will use this function for properly handling discontinued=
 legacy uAPI calls=2E
> > I hope this explanation / reasoning is okay with you=2E
>=20
> I'm not sure I understand your reply ormaybe I'm just missing something=
=20
> here=2E
>=20
> I'm not asking you to remove the existing DRI1 uapi=2E I'm just asking t=
o=20
> not add the 6 new _GEM_ defines and 3 new _gem_ structures now=2E  You=
=20
> mentioned that the driver does not yet support acceleration of any kind=
=2E=20
> So there should be no need to extend to uapi now=2E  You can still do th=
is=20
> when you add acceleration to the driver=2E
>=20
> Until then, the Xorg modesetting driver or any Compositor can use the=20
> generic dumb-buffer ioctls that create buffers with no acceleration=2E
>=20
> Best regards
> Thomas
>=20
> >=20
> > Regards,
> >=20
> > Kevin Brace
> > Brace Computer Laboratory blog
> > https://bracecomputerlab=2Ecom
> >=20
> >> Sent: Tuesday, July 26, 2022 at 11:24 AM
> >> From: "Thomas Zimmermann" <tzimmermann@suse=2Ede>
> >> To: "Kevin Brace" <kevinbrace@gmx=2Ecom>, dri-devel@lists=2Efreedeskt=
op=2Eorg
> >> Cc: "Kevin Brace" <kevinbrace@bracecomputerlab=2Ecom>
> >> Subject: Re: [PATCH v3 26/32] drm/via: Add via_drm=2Eh
> >>
> >> Hi
> >>
> >> Am 26=2E07=2E22 um 01:53 schrieb Kevin Brace:
> >>> From: Kevin Brace <kevinbrace@bracecomputerlab=2Ecom>
> >>>
> >>> Changed the uAPI=2E
> >>>
> >>> Signed-off-by: Kevin Brace <kevinbrace@bracecomputerlab=2Ecom>
> >>> ---
> >>>    include/uapi/drm/via_drm=2Eh | 35 +++++++++++++++++++++++++++++++=
----
> >>>    1 file changed, 31 insertions(+), 4 deletions(-)
> >>>
> >>> diff --git a/include/uapi/drm/via_drm=2Eh b/include/uapi/drm/via_drm=
=2Eh
> >>> index a1e125d42208=2E=2Ee9da45ce130a 100644
> >>> --- a/include/uapi/drm/via_drm=2Eh
> >>> +++ b/include/uapi/drm/via_drm=2Eh
> >>> @@ -1,4 +1,5 @@
> >>>    /*
> >>> + * Copyright =C2=A9 2020 Kevin Brace
> >>>     * Copyright 1998-2003 VIA Technologies, Inc=2E All Rights Reserv=
ed=2E
> >>>     * Copyright 2001-2003 S3 Graphics, Inc=2E All Rights Reserved=2E
> >>>     *
> >>> @@ -16,10 +17,10 @@
> >>>     * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND=
, EXPRESS OR
> >>>     * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHA=
NTABILITY,
> >>>     * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT=2E IN NO=
 EVENT SHALL
> >>> - * VIA, S3 GRAPHICS, AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, =
DAMAGES OR
> >>> - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHER=
WISE,
> >>> - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE U=
SE OR OTHER
> >>> - * DEALINGS IN THE SOFTWARE=2E
> >>> + * THE AUTHORS, COPYRIGHT HOLDERS, AND/OR ITS SUPPLIERS BE LIABLE F=
OR ANY
> >>> + * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTR=
ACT, TORT
> >>> + * OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOF=
TWARE OR
> >>> + * THE USE OR OTHER DEALINGS IN THE SOFTWARE=2E
> >>>     */
> >>>    #ifndef _VIA_DRM_H_
> >>>    #define _VIA_DRM_H_
> >>> @@ -81,6 +82,11 @@ extern "C" {
> >>>    #define DRM_VIA_DMA_BLIT        0x0e
> >>>    #define DRM_VIA_BLIT_SYNC       0x0f
> >>>
> >>> +#define	DRM_VIA_GEM_CREATE	0x10
> >>> +#define	DRM_VIA_GEM_MAP		0x11
> >>> +#define	DRM_VIA_GEM_UNMAP	0x12
> >>
> >> This looks a lot like ioctl ops for using accelerated HW buffers=2E B=
ut
> >> the patch is near the end of the series and you said in the series'
> >> cover letter that there's no acceleration=2E I suspect that these
> >> constants are currently unused?  If so, please drop the patch from th=
e
> >> series=2E If can be merged later when something really depends on it=
=2E
> >>
> >> Best regards
> >> Thomas
> >>
> >>> +
> >>> +
> >>>    #define DRM_IOCTL_VIA_ALLOCMEM	  DRM_IOWR(DRM_COMMAND_BASE + DRM_=
VIA_ALLOCMEM, drm_via_mem_t)
> >>>    #define DRM_IOCTL_VIA_FREEMEM	  DRM_IOW( DRM_COMMAND_BASE + DRM_V=
IA_FREEMEM, drm_via_mem_t)
> >>>    #define DRM_IOCTL_VIA_AGP_INIT	  DRM_IOWR(DRM_COMMAND_BASE + DRM_=
VIA_AGP_INIT, drm_via_agp_t)
> >>> @@ -97,6 +103,10 @@ extern "C" {
> >>>    #define DRM_IOCTL_VIA_DMA_BLIT    DRM_IOW(DRM_COMMAND_BASE + DRM_=
VIA_DMA_BLIT, drm_via_dmablit_t)
> >>>    #define DRM_IOCTL_VIA_BLIT_SYNC   DRM_IOW(DRM_COMMAND_BASE + DRM_=
VIA_BLIT_SYNC, drm_via_blitsync_t)
> >>>
> >>> +#define	DRM_IOCTL_VIA_GEM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_VI=
A_GEM_CREATE, struct drm_via_gem_create)
> >>> +#define	DRM_IOCTL_VIA_GEM_MAP		DRM_IOWR(DRM_COMMAND_BASE + DRM_VIA_=
GEM_MAP, struct drm_via_gem_map)
> >>> +#define	DRM_IOCTL_VIA_GEM_UNMAP		DRM_IOR(DRM_COMMAND_BASE + DRM_VIA=
_GEM_UNMAP, struct drm_via_gem_unmap)
> >>> +
> >>>    /* Indices into buf=2ESetup where various bits of state are mirro=
red per
> >>>     * context and per buffer=2E  These can be fired at the card as a=
 unit,
> >>>     * or in a piecewise fashion as required=2E
> >>> @@ -275,6 +285,23 @@ typedef struct drm_via_dmablit {
> >>>    	drm_via_blitsync_t sync;
> >>>    } drm_via_dmablit_t;
> >>>
> >>> +struct drm_via_gem_create {
> >>> +	uint64_t size;
> >>> +	uint32_t alignment;
> >>> +	uint32_t domain;
> >>> +	uint32_t handle;
> >>> +	uint64_t offset;
> >>> +};
> >>> +
> >>> +struct drm_via_gem_map {
> >>> +	uint32_t handle;
> >>> +	uint64_t map_offset;
> >>> +};
> >>> +
> >>> +struct drm_via_gem_unmap {
> >>> +	uint32_t handle;
> >>> +};
> >>> +
> >>>    #if defined(__cplusplus)
> >>>    }
> >>>    #endif
> >>> --
> >>> 2=2E35=2E1
> >>>
> >>
> >> --=20
> >> Thomas Zimmermann
> >> Graphics Driver Developer
> >> SUSE Software Solutions Germany GmbH
> >> Maxfeldstr=2E 5, 90409 N=C3=BCrnberg, Germany
> >> (HRB 36809, AG N=C3=BCrnberg)
> >> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev
> >>
>=20
> --=20
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr=2E 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev
>
