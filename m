Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3784D58858A
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 03:50:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E43E996CA;
	Wed,  3 Aug 2022 01:49:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28565996CC
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Aug 2022 01:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1659491389;
 bh=uTsAZoJTmF3l5oRRsE8qnG2RbuONGK/PvUrBdrMjx2g=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=a7p6I71kjJkldC/C2ycYJUOaWQwaxkl8x9CKy4Er/QQ8rFQrggz9aeynsvutI5SVT
 naw2ZFMZw/2ntcMlUG5T9VfSVDvGuJmtF5ASoK0bDr09tF73PRaeXanzc1D69UZy/P
 y2pgCoe/2MLhizNcGj7smPfSvdvku/5QQaC/80qA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [4.28.11.157] ([4.28.11.157]) by web-mail.gmx.net
 (3c-app-mailcom-bs14.server.lan [172.19.170.182]) (via HTTP); Wed, 3 Aug
 2022 03:49:49 +0200
MIME-Version: 1.0
Message-ID: <trinity-0dcadb0d-103a-403a-a915-02d19e8ba823-1659491389263@3c-app-mailcom-bs14>
From: Kevin Brace <kevinbrace@gmx.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 26/32] drm/via: Add via_drm.h
Content-Type: text/plain; charset=UTF-8
Date: Wed, 3 Aug 2022 03:49:49 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <fdcca10e-1d63-4d00-af03-94ba1b9dab57@suse.de>
References: <20220725235359.20516-1-kevinbrace@gmx.com>
 <20220725235359.20516-7-kevinbrace@gmx.com>
 <f7a47d59-d4d2-61fb-4e42-1decff2e7d62@suse.de>
 <trinity-e1f9136b-24dd-44ed-861b-a0735c91422e-1659221316349@3c-app-mailcom-bs07>
 <43fd433c-f108-d75a-b141-f4ff985455b9@suse.de>
 <trinity-8c70d1f1-fd67-46a1-a84b-7cc771cca62d-1659411946174@3c-app-mailcom-bs03>
 <fdcca10e-1d63-4d00-af03-94ba1b9dab57@suse.de>
Content-Transfer-Encoding: quoted-printable
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:SU7TMpI64Onk+IIYNZCN3uMt3iTPpkJcPXjZdvYwcyQnjKfCh6rH2thd6Phed85HH2sCA
 9kclEntFjxCYwdi7zq99nyvdDp0ZArQJVnn/LjfIXCh9q7QmSHiwa+Rf4EFl6v8lX26kqN4X/znF
 4VPp7TXL19x0LngEl41RMo+bQZYPbIiFGAZpagzmpcyG5C81NPH2gxSXFtmdX9C+bgOC4Df53cFc
 dHZ+uyPtprqIGz1aE4yMk/p7Oy/ix14R1BO3p4SzYW8YKlhxU9FKv9E064v28ab2nKWfa0Ke45Tb
 BM=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1z9g+1m4KgU=:ludhlfuwyxwm4m11wvESvJ
 qfRRd/wHTcg8wD6PeZUXgUlfXDO1CCMEBE0RQ4yM7757TI9rDUgN/2USfRhRtsh/Lk4Q5wHoz
 ZKbp9n4+tM+fZjzzZICfWGmkCN2ZRvV3IWZxPDXCtWwhi2ZKMeLCrWy2UA5QmBbTUfpi2iI79
 pPN0ye1ANDrG7HdvJttb3b43Fp8SkAwesvOFKNJJUKGs2aNlHJ2ySXgmDA9XYWxeufCPwBEB0
 t92279piDXfiBVO2430xQDyPCzEtKjkr/bNUFDpsEATXJ3W+bM10Tcf0fbFrTIhFscfz1Q8Cy
 camZKhGWVlFVBVzDBGJG1SEXLGUtTpdaPGIGuJxeMBsTmITdCopZMu/LjHxZCu32fDtTRdsDP
 P6FN6VWmSYl6lskDDbdoR1XT5OfNYz5rauRo+IUp54gFTO3wRK64O7rchvJEgrw1Vd1w5rnCl
 mXGtqsqH8hQGnNeMyjJE46DsyxC+55aiZTMmAI79LcRm53DhTCfpWIyeaWJ+HVJDj5KqfH30x
 YHonBEF97CTVM8d0L/xIEhY1WFbp0j3hABOE8ry5p9Yaljd5zryCi9kljATLUsjQJpoVYvtaI
 udTvQWQh0TLqRrDeMct6jnTrTQZaPprL8+ByvlyEpUAwzJVWGgPb+IUqCN7GJsPP/lGA6Ebyr
 1ycrgIiOEhqcQS8hh4yr5H/V3TplSJMEDi7YsMV0K5d/MyYwoPzdP1dM/cSL90pEMEZs7UvVf
 fkxC17ZQwsyfLTgDCUp1YtAdiQRuUOLdvKe75orFZAi7STEA8LgxO+I9Q/lXOrZqRYvMuxi8s
 8qolvVm
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

I am honestly surprised of the e-mail back and forth regarding the mainlin=
ing of OpenChrome DRM, but let me state my position=2E
Considering the age of the hardware I am dealing with (i=2Ee=2E, pre-OpenG=
L 2=2Ex generation 3D engine), I do not anticipate being able to run OpenCh=
rome on Wayland with acceleration=2E
As a first step after mainlining, I am looking to add uAPI to pass 2D / 3D=
 acceleration commands to the graphics engine, but frankly, I am going to f=
ocus on the 2D acceleration side first=2E
Considering the age of the hardware, I do not think limiting the use to X=
=2EOrg X Server is a bad choice=2E
I do OpenChrome development on Gentoo Linux where 32-bit x86 ISA and X=2EO=
rg X Server are still fully supported=2E
Adding 3D acceleration will likely be done after 2D and video acceleration=
s are mostly working=2E
The proposed OpenChrome uAPI is essentially a cutdown version of the mostl=
y 2D acceleration focused implementation (my opinion) being worked on and o=
ff since 2011=2E
The limited addition of uAPI calls is merely a preparatory step for adding=
 2D acceleration in the near future (I have not started the work yet=2E)=2E
I assume you are aware that OpenChrome DDX is a user of DRM_VIA_GEM_CREATE=
, DRM_VIA_GEM_MAP, and DRM_VIA_GEM_UNMAP uAPIs=2E
For those who still choose to use older generation hardware, I think X=2EO=
rg X Server still has a lot of life left in it, and I plan to continue mode=
rnizing the graphics stack for what I call "underserved" (i=2Ee=2E, neglect=
ed) graphics hardware=2E

Regards,

Kevin Brace
Brace Computer Laboratory blog
https://bracecomputerlab=2Ecom


> Sent: Tuesday, August 02, 2022 at 4:38 AM
> From: "Thomas Zimmermann" <tzimmermann@suse=2Ede>
> To: "Kevin Brace" <kevinbrace@gmx=2Ecom>
> Cc: dri-devel@lists=2Efreedesktop=2Eorg
> Subject: Re: [PATCH v3 26/32] drm/via: Add via_drm=2Eh
>
> Hi
>=20
> Am 02=2E08=2E22 um 05:45 schrieb Kevin Brace:
> > Hi Thomas,
> >=20
> > I hope I am comprehending this right=2E
> > Yes, I am adding 3 new uAPI calls, not 6 of them=2E
> > Correspondingly, there are 3 new structs added=2E
>=20
> That's understood=2E
>=20
> > While I may drop one (unmap uAPI), I personally do not wish to drop th=
e other two at this point=2E
> > Instead, I may need to add setparam and / or getparam uAPI to pass PCI=
 Device ID back to the userspace=2E
> > This is mainly needed by Mesa, although there is no code for Mesa at t=
his point=2E
>=20
> Exactly my point! There's no userspace for it=2E That's why Sam and me a=
re=20
> asking you to remove all kinds if uapi changes or ioctls from the=20
> patchset until Mesa (or some other component) requires it=2E
>=20
> > I fear dropping the remaining two will require substantial redesign, a=
nd I will like to avoid this since the code is already working=2E
>=20
> No, it won't require a redesign=2E You'll have to remove the changes to=
=20
> the uapi header and any new ioctls that are in the patchset=2E Userspace=
=20
> programs; such as X11's modesetting driver, Weston or Gnome; will use=20
> the kernel's dumb-buffer ioctls to create unaccelerated buffers=2E  You=
=20
> won't need any via-specific code in userspace=2E It's all there already=
=20
> and fully driver independent=2E Mesa will do software rendering=2E  For =
the=20
> kernel's dumb buffers, please see [1]=2E
>=20
> > It is my plan to proceed to adding acceleration after the code is adde=
d to the mainline kernel tree, so I will like to do it the way it is set up=
 now=2E
>=20
> You can still send the current uapi changes when you add 3d acceleration=
=20
> to the kernel and Mesa=2E  But once these interfaces have been added to=
=20
> the kernel, they are nearly impossible to change or remove=2E That's why=
=20
> we don't want to do this now=2E
>=20
> Best regards
> Thomas
>=20
> [1]=20
> https://www=2Ekernel=2Eorg/doc/html/latest/gpu/drm-kms=2Ehtml#dumb-buffe=
r-objects
>=20
> >=20
> > Regards,
> >=20
> > Kevin Brace
> > Brace Computer Laboratory blog
> > https://bracecomputerlab=2Ecom
> >=20
> >=20
> >> Sent: Monday, August 01, 2022 at 11:49 AM
> >> From: "Thomas Zimmermann" <tzimmermann@suse=2Ede>
> >> To: "Kevin Brace" <kevinbrace@gmx=2Ecom>
> >> Cc: dri-devel@lists=2Efreedesktop=2Eorg
> >> Subject: Re: [PATCH v3 26/32] drm/via: Add via_drm=2Eh
> >>
> >> Hi Kevin
> >>
> >> Am 31=2E07=2E22 um 00:48 schrieb Kevin Brace:
> >>> Hi Thomas,
> >>>
> >>> I cannot drop the older DRI1 based uAPI calls=2E
> >>> This is because include/uapi/drm/via_drm=2Eh needs to retain backwar=
d compatibility with the existing OpenChrome DDX's XvMC library (it gets co=
mpiled when OpenChrome DDX is built) and likely with the existing DDX Xv co=
de as well=2E
> >>> If I remove the DRI1 based uAPI calls, the XvMC library will not get=
 compiled (compile error will occur since the XvMC library assumes the pres=
ence of DRI1 based uAPI), and I assume the same for the DDX Xv code (I cann=
ot even reach here since the XvMC library is compiled first)=2E
> >>> Although the v3 patch does not contain it, v4 patch will utilize drm=
_invalid_op() for the discontinued (not deprecated since OpenChrome DRM doe=
s not support the older DRI1 based uAPI at all) DRI1 based uAPI=2E
> >>>
> >>> https://cgit=2Efreedesktop=2Eorg/openchrome/drm-openchrome/commit/?h=
=3Ddrm-next-5=2E20&id=3D16b3d68f95c9ccd15b7a3310e5d752fabbc76518
> >>>
> >>> drm_invalid_op() is related to drm_ioctl=2Ec, and is meant for legac=
y DRMs like Radeon, i915, etc=2E
> >>> Since OpenChrome DRM is not a clean sheet design (related to VIA DRM=
 to some extent), I will use this function for properly handling discontinu=
ed legacy uAPI calls=2E
> >>> I hope this explanation / reasoning is okay with you=2E
> >>
> >> I'm not sure I understand your reply ormaybe I'm just missing somethi=
ng
> >> here=2E
> >>
> >> I'm not asking you to remove the existing DRI1 uapi=2E I'm just askin=
g to
> >> not add the 6 new _GEM_ defines and 3 new _gem_ structures now=2E  Yo=
u
> >> mentioned that the driver does not yet support acceleration of any ki=
nd=2E
> >> So there should be no need to extend to uapi now=2E  You can still do=
 this
> >> when you add acceleration to the driver=2E
> >>
> >> Until then, the Xorg modesetting driver or any Compositor can use the
> >> generic dumb-buffer ioctls that create buffers with no acceleration=
=2E
> >>
> >> Best regards
> >> Thomas
> >>
> >>>
> >>> Regards,
> >>>
> >>> Kevin Brace
> >>> Brace Computer Laboratory blog
> >>> https://bracecomputerlab=2Ecom
> >>>
> >>>> Sent: Tuesday, July 26, 2022 at 11:24 AM
> >>>> From: "Thomas Zimmermann" <tzimmermann@suse=2Ede>
> >>>> To: "Kevin Brace" <kevinbrace@gmx=2Ecom>, dri-devel@lists=2Efreedes=
ktop=2Eorg
> >>>> Cc: "Kevin Brace" <kevinbrace@bracecomputerlab=2Ecom>
> >>>> Subject: Re: [PATCH v3 26/32] drm/via: Add via_drm=2Eh
> >>>>
> >>>> Hi
> >>>>
> >>>> Am 26=2E07=2E22 um 01:53 schrieb Kevin Brace:
> >>>>> From: Kevin Brace <kevinbrace@bracecomputerlab=2Ecom>
> >>>>>
> >>>>> Changed the uAPI=2E
> >>>>>
> >>>>> Signed-off-by: Kevin Brace <kevinbrace@bracecomputerlab=2Ecom>
> >>>>> ---
> >>>>>     include/uapi/drm/via_drm=2Eh | 35 ++++++++++++++++++++++++++++=
+++----
> >>>>>     1 file changed, 31 insertions(+), 4 deletions(-)
> >>>>>
> >>>>> diff --git a/include/uapi/drm/via_drm=2Eh b/include/uapi/drm/via_d=
rm=2Eh
> >>>>> index a1e125d42208=2E=2Ee9da45ce130a 100644
> >>>>> --- a/include/uapi/drm/via_drm=2Eh
> >>>>> +++ b/include/uapi/drm/via_drm=2Eh
> >>>>> @@ -1,4 +1,5 @@
> >>>>>     /*
> >>>>> + * Copyright =C2=A9 2020 Kevin Brace
> >>>>>      * Copyright 1998-2003 VIA Technologies, Inc=2E All Rights Res=
erved=2E
> >>>>>      * Copyright 2001-2003 S3 Graphics, Inc=2E All Rights Reserved=
=2E
> >>>>>      *
> >>>>> @@ -16,10 +17,10 @@
> >>>>>      * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY K=
IND, EXPRESS OR
> >>>>>      * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MER=
CHANTABILITY,
> >>>>>      * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT=2E IN=
 NO EVENT SHALL
> >>>>> - * VIA, S3 GRAPHICS, AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM=
, DAMAGES OR
> >>>>> - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTH=
ERWISE,
> >>>>> - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE=
 USE OR OTHER
> >>>>> - * DEALINGS IN THE SOFTWARE=2E
> >>>>> + * THE AUTHORS, COPYRIGHT HOLDERS, AND/OR ITS SUPPLIERS BE LIABLE=
 FOR ANY
> >>>>> + * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CON=
TRACT, TORT
> >>>>> + * OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE S=
OFTWARE OR
> >>>>> + * THE USE OR OTHER DEALINGS IN THE SOFTWARE=2E
> >>>>>      */
> >>>>>     #ifndef _VIA_DRM_H_
> >>>>>     #define _VIA_DRM_H_
> >>>>> @@ -81,6 +82,11 @@ extern "C" {
> >>>>>     #define DRM_VIA_DMA_BLIT        0x0e
> >>>>>     #define DRM_VIA_BLIT_SYNC       0x0f
> >>>>>
> >>>>> +#define	DRM_VIA_GEM_CREATE	0x10
> >>>>> +#define	DRM_VIA_GEM_MAP		0x11
> >>>>> +#define	DRM_VIA_GEM_UNMAP	0x12
> >>>>
> >>>> This looks a lot like ioctl ops for using accelerated HW buffers=2E=
 But
> >>>> the patch is near the end of the series and you said in the series'
> >>>> cover letter that there's no acceleration=2E I suspect that these
> >>>> constants are currently unused?  If so, please drop the patch from =
the
> >>>> series=2E If can be merged later when something really depends on i=
t=2E
> >>>>
> >>>> Best regards
> >>>> Thomas
> >>>>
> >>>>> +
> >>>>> +
> >>>>>     #define DRM_IOCTL_VIA_ALLOCMEM	  DRM_IOWR(DRM_COMMAND_BASE + D=
RM_VIA_ALLOCMEM, drm_via_mem_t)
> >>>>>     #define DRM_IOCTL_VIA_FREEMEM	  DRM_IOW( DRM_COMMAND_BASE + DR=
M_VIA_FREEMEM, drm_via_mem_t)
> >>>>>     #define DRM_IOCTL_VIA_AGP_INIT	  DRM_IOWR(DRM_COMMAND_BASE + D=
RM_VIA_AGP_INIT, drm_via_agp_t)
> >>>>> @@ -97,6 +103,10 @@ extern "C" {
> >>>>>     #define DRM_IOCTL_VIA_DMA_BLIT    DRM_IOW(DRM_COMMAND_BASE + D=
RM_VIA_DMA_BLIT, drm_via_dmablit_t)
> >>>>>     #define DRM_IOCTL_VIA_BLIT_SYNC   DRM_IOW(DRM_COMMAND_BASE + D=
RM_VIA_BLIT_SYNC, drm_via_blitsync_t)
> >>>>>
> >>>>> +#define	DRM_IOCTL_VIA_GEM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_=
VIA_GEM_CREATE, struct drm_via_gem_create)
> >>>>> +#define	DRM_IOCTL_VIA_GEM_MAP		DRM_IOWR(DRM_COMMAND_BASE + DRM_VI=
A_GEM_MAP, struct drm_via_gem_map)
> >>>>> +#define	DRM_IOCTL_VIA_GEM_UNMAP		DRM_IOR(DRM_COMMAND_BASE + DRM_V=
IA_GEM_UNMAP, struct drm_via_gem_unmap)
> >>>>> +
> >>>>>     /* Indices into buf=2ESetup where various bits of state are mi=
rrored per
> >>>>>      * context and per buffer=2E  These can be fired at the card a=
s a unit,
> >>>>>      * or in a piecewise fashion as required=2E
> >>>>> @@ -275,6 +285,23 @@ typedef struct drm_via_dmablit {
> >>>>>     	drm_via_blitsync_t sync;
> >>>>>     } drm_via_dmablit_t;
> >>>>>
> >>>>> +struct drm_via_gem_create {
> >>>>> +	uint64_t size;
> >>>>> +	uint32_t alignment;
> >>>>> +	uint32_t domain;
> >>>>> +	uint32_t handle;
> >>>>> +	uint64_t offset;
> >>>>> +};
> >>>>> +
> >>>>> +struct drm_via_gem_map {
> >>>>> +	uint32_t handle;
> >>>>> +	uint64_t map_offset;
> >>>>> +};
> >>>>> +
> >>>>> +struct drm_via_gem_unmap {
> >>>>> +	uint32_t handle;
> >>>>> +};
> >>>>> +
> >>>>>     #if defined(__cplusplus)
> >>>>>     }
> >>>>>     #endif
> >>>>> --
> >>>>> 2=2E35=2E1
> >>>>>
> >>>>
> >>>> --=20
> >>>> Thomas Zimmermann
> >>>> Graphics Driver Developer
> >>>> SUSE Software Solutions Germany GmbH
> >>>> Maxfeldstr=2E 5, 90409 N=C3=BCrnberg, Germany
> >>>> (HRB 36809, AG N=C3=BCrnberg)
> >>>> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev
> >>>>
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
