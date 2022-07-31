Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6524585DF3
	for <lists+dri-devel@lfdr.de>; Sun, 31 Jul 2022 09:40:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9032296DCB;
	Sun, 31 Jul 2022 07:40:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6836A10EEFF
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Jul 2022 00:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1659226392;
 bh=7Y1hKYnhAYLT4puZoLXazfD99PQqmOzEAEnvlkKB+yI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Px65ybM9yEfikBZ1UqI6qksx/ah6jdnalAQrbSi4EKpOyXdJgVrtvL/k9Ir/kV7kI
 3AP9PBnlL5n/KkARAK0J5+0Lq6KDUyoMsJMNw4+i8z/cKRIpvu3MUUypOShAvx1pgX
 qMOsEoTI8IXmRPVdtSq6Xfkxgz++02WsOd8N2DSk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [68.251.140.185] ([68.251.140.185]) by web-mail.gmx.net
 (3c-app-mailcom-bs13.server.lan [172.19.170.181]) (via HTTP); Sun, 31 Jul
 2022 02:13:12 +0200
MIME-Version: 1.0
Message-ID: <trinity-e59d3770-82dd-498b-b846-b96fc51c349c-1659226391952@3c-app-mailcom-bs13>
From: Kevin Brace <kevinbrace@gmx.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 01/32] drm/via: Delete VIA DRM code
Content-Type: text/plain; charset=UTF-8
Date: Sun, 31 Jul 2022 02:13:12 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <29497142-a9fd-beca-e94b-c34646d5008d@suse.de>
References: <20220725235127.20433-1-kevinbrace@gmx.com>
 <20220725235127.20433-2-kevinbrace@gmx.com>
 <29497142-a9fd-beca-e94b-c34646d5008d@suse.de>
Content-Transfer-Encoding: quoted-printable
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:jJ/pLbAcqOWgiZxcQWJIXskqlu+aiMhheKrM5eRRuVq46XIQC7ujWMXY7ksvtUVBw8g5G
 eK/VkfiD38HiEwK3gq1PHNz3RvqEF/HJlclW2oTT1YzZd+v9GAW3L8BGI9KDVC6rFeHVDJxChIEf
 OXwp0AQdgumhAwA34Qjvz/b6p6GChNOgy+143LvEANjK0YS+QEyNEBUZb6B9OSxDytmJv7QoiWz8
 VRXAsEhCBUULJzwrLGrSlGuiW1JXpPqzt+C8j67V126dFSCFu8jNxUavDPD9R66EpGPD7swdR97u
 fc=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:MV+9OI8bX1I=:bY/7ZBMTsj22r52Bt14C1O
 XlHY2mJoWez32qLFLPy231h5F5ZYUYuDEkrwMzljBPOkySfBQ5xJA88HT9a6THqJN5D8Z0pv3
 VdwC0kmLsU1dxPu7o4unGmOleJhFv6+i5iFDPXSRp/jdM0HAIm8HyTWjUVoFsAqiYF4/uoLXf
 fcVR6jrVYBFs6XfGnEdn0eqUBgWHIF3zz07UQ8a/3eS7Z5GjjZRIVIVlWtxOfH1+/GbiZWjF/
 MLRZ+fzYC6EBwNwXkZ9dUME/FKPaImHclwVoOavVTs7cQ944qvPduLC1YZuOkutAhlJwRqEuu
 UNzyKSNLra8Q8FzMCJdk0xYbXzHxK0BbACb4v88JXBImesLXvA9Vdlvtx6uhXAsTS4G8Jlv6v
 Uers+OHmF6aV2GLBGb5H3eOMLGCmo2b1HDLr10+0N/cFC7DgZkmdiLL6BAaKve/UgllhBz3bf
 WBZDh/LZ3JD6db+rZaN4uiVArElQE8nMnTlMUEGH9QNWIHT5OAjiYFJG0vrIGeBM8J84xZ6Aw
 rUL5ADUQ53ENiHwiOfvucZ4QfsJbqoDYgfAzA6Wn7VKlP5PqrCvx2rTrm2sJ4sGCOFN4QmKjm
 mDCuzQHa0ngi5PDdnzu1VFhNOZbXpyb9iqkRv06+rEZbcJSNm8PJsH9/CuHpSLoDWOnopaJKZ
 uhJ2kZNwOPWC4+6tCjeNTuAlrBtrhF6XnbzWSxRrAZ95J23MIdWKS/5BGJ+7r8gzwrvRBeHCp
 YwNxJMRkbF0NeiVOKWYyJu0ZCsvaPvEsXDVmKeeFxi/tOrrf57jR+cpXTjzDIJb1Hhhx+JH6W
 J0YUEzX
X-Mailman-Approved-At: Sun, 31 Jul 2022 07:40:24 +0000
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

Okay, it might take several business days before I can test the code again=
st drm-tip=2E
I will try to incorporate various improvement suggestions made by you, Dav=
e, and Sam=2E

Regards,

Kevin Brace
Brace Computer Laboratory blog
https://bracecomputerlab=2Ecom


> Sent: Tuesday, July 26, 2022 at 12:19 AM
> From: "Thomas Zimmermann" <tzimmermann@suse=2Ede>
> To: "Kevin Brace" <kevinbrace@gmx=2Ecom>, dri-devel@lists=2Efreedesktop=
=2Eorg
> Cc: "Kevin Brace" <kevinbrace@bracecomputerlab=2Ecom>
> Subject: Re: [PATCH v3 01/32] drm/via: Delete VIA DRM code
>
> Hi Kevin
>=20
> Am 26=2E07=2E22 um 01:50 schrieb Kevin Brace:
> > From: Kevin Brace <kevinbrace@bracecomputerlab=2Ecom>
> >=20
> > Signed-off-by: Kevin Brace <kevinbrace@bracecomputerlab=2Ecom>
> > ---
> >   drivers/gpu/drm/Kconfig            |    7 -
> >   drivers/gpu/drm/Makefile           |    1 -
> >   drivers/gpu/drm/via/Makefile       |    8 -
> >   drivers/gpu/drm/via/via_3d_reg=2Eh   | 1650 ------------------------=
----
> >   drivers/gpu/drm/via/via_dma=2Ec      |  744 -------------
> >   drivers/gpu/drm/via/via_dmablit=2Ec  |  807 --------------
> >   drivers/gpu/drm/via/via_dmablit=2Eh  |  140 ---
> >   drivers/gpu/drm/via/via_drv=2Ec      |  124 ---
> >   drivers/gpu/drm/via/via_drv=2Eh      |  229 ----
> >   drivers/gpu/drm/via/via_irq=2Ec      |  388 -------
> >   drivers/gpu/drm/via/via_map=2Ec      |  132 ---
> >   drivers/gpu/drm/via/via_mm=2Ec       |  241 ----
> >   drivers/gpu/drm/via/via_verifier=2Ec | 1110 -------------------
> >   drivers/gpu/drm/via/via_verifier=2Eh |   62 --
> >   drivers/gpu/drm/via/via_video=2Ec    |   94 --
> >   15 files changed, 5737 deletions(-)
> >   delete mode 100644 drivers/gpu/drm/via/Makefile
> >   delete mode 100644 drivers/gpu/drm/via/via_3d_reg=2Eh
> >   delete mode 100644 drivers/gpu/drm/via/via_dma=2Ec
> >   delete mode 100644 drivers/gpu/drm/via/via_dmablit=2Ec
> >   delete mode 100644 drivers/gpu/drm/via/via_dmablit=2Eh
> >   delete mode 100644 drivers/gpu/drm/via/via_drv=2Ec
> >   delete mode 100644 drivers/gpu/drm/via/via_drv=2Eh
> >   delete mode 100644 drivers/gpu/drm/via/via_irq=2Ec
> >   delete mode 100644 drivers/gpu/drm/via/via_map=2Ec
> >   delete mode 100644 drivers/gpu/drm/via/via_mm=2Ec
> >   delete mode 100644 drivers/gpu/drm/via/via_verifier=2Ec
> >   delete mode 100644 drivers/gpu/drm/via/via_verifier=2Eh
> >   delete mode 100644 drivers/gpu/drm/via/via_video=2Ec
>=20
> Sam has meanwhile merged all old source files into a single file named=
=20
> via_dri1=2Ec=2E  You need to rebase onto the latest drm-tip from
>=20
>    https://cgit=2Efreedesktop=2Eorg/drm/drm-tip/
>=20
> The idea is to have a separate option in Kconfig to build the old driver=
=20
> instead of the new one=2E
>=20
> Best regards
> Thomas
>=20
> >=20
> > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> > index e88c497fa010=2E=2E30d5b91b717f 100644
> > --- a/drivers/gpu/drm/Kconfig
> > +++ b/drivers/gpu/drm/Kconfig
> > @@ -460,13 +460,6 @@ config DRM_SIS
> >   	  chipset=2E If M is selected the module will be called sis=2E AGP
> >   	  support is required for this driver to work=2E
> >=20
> > -config DRM_VIA
> > -	tristate "Via unichrome video cards"
> > -	depends on DRM && PCI
> > -	help
> > -	  Choose this option if you have a Via unichrome or compatible video
> > -	  chipset=2E If M is selected the module will be called via=2E
> > -
> >   config DRM_SAVAGE
> >   	tristate "Savage video cards"
> >   	depends on DRM && PCI
> > diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> > index 15fe3163f822=2E=2Ee6d0daca9bc2 100644
> > --- a/drivers/gpu/drm/Makefile
> > +++ b/drivers/gpu/drm/Makefile
> > @@ -97,7 +97,6 @@ obj-$(CONFIG_DRM_VC4)  +=3D vc4/
> >   obj-$(CONFIG_DRM_SIS)   +=3D sis/
> >   obj-$(CONFIG_DRM_SAVAGE)+=3D savage/
> >   obj-$(CONFIG_DRM_VMWGFX)+=3D vmwgfx/
> > -obj-$(CONFIG_DRM_VIA)	+=3Dvia/
> >   obj-$(CONFIG_DRM_VGEM)	+=3D vgem/
> >   obj-$(CONFIG_DRM_VKMS)	+=3D vkms/
> >   obj-$(CONFIG_DRM_NOUVEAU) +=3Dnouveau/
> > diff --git a/drivers/gpu/drm/via/Makefile b/drivers/gpu/drm/via/Makefi=
le
> > deleted file mode 100644
> > index 84db4eee7828=2E=2E000000000000
> > --- a/drivers/gpu/drm/via/Makefile
> > +++ /dev/null
> > @@ -1,8 +0,0 @@
> > -# SPDX-License-Identifier: GPL-2=2E0-only
> > -#
> > -# Makefile for the drm device driver=2E  This driver provides support=
 for the
> > -# Direct Rendering Infrastructure (DRI) in XFree86 4=2E1=2E0 and high=
er=2E
> > -
> > -via-y    :=3D via_irq=2Eo via_drv=2Eo via_map=2Eo via_mm=2Eo via_dma=
=2Eo via_verifier=2Eo via_video=2Eo via_dmablit=2Eo
> > -
> > -obj-$(CONFIG_DRM_VIA)	+=3Dvia=2Eo
> > diff --git a/drivers/gpu/drm/via/via_3d_reg=2Eh b/drivers/gpu/drm/via/=
via_3d_reg=2Eh
> > deleted file mode 100644
> > index 462375d543b9=2E=2E000000000000
> > --- a/drivers/gpu/drm/via/via_3d_reg=2Eh
> > +++ /dev/null
> > @@ -1,1650 +0,0 @@
> > -/*
> > - * Copyright 1998-2003 VIA Technologies, Inc=2E All Rights Reserved=
=2E
> > - * Copyright 2001-2003 S3 Graphics, Inc=2E All Rights Reserved=2E
> > - *
> > - * Permission is hereby granted, free of charge, to any person obtain=
ing a
> > - * copy of this software and associated documentation files (the "Sof=
tware"),
> > - * to deal in the Software without restriction, including without lim=
itation
> > - * the rights to use, copy, modify, merge, publish, distribute, sub l=
icense,
> > - * and/or sell copies of the Software, and to permit persons to whom =
the
> > - * Software is furnished to do so, subject to the following condition=
s:
> > - *
> > - * The above copyright notice and this permission notice (including t=
he
> > - * next paragraph) shall be included in all copies or substantial por=
tions
> > - * of the Software=2E
> > - *
> > - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EX=
PRESS OR
> > - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTAB=
ILITY,
> > - * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT=2E IN NO EVE=
NT SHALL
> > - * VIA, S3 GRAPHICS, AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DA=
MAGES OR
> > - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWI=
SE,
> > - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE=
 OR OTHER
> > - * DEALINGS IN THE SOFTWARE=2E
> > - */
> > -
> > -#ifndef VIA_3D_REG_H
> > -#define VIA_3D_REG_H
> > -#define HC_REG_BASE             0x0400
> > -
> > -#define HC_REG_TRANS_SPACE      0x0040
> > -
> > -#define HC_ParaN_MASK           0xffffffff
> > -#define HC_Para_MASK            0x00ffffff
> > -#define HC_SubA_MASK            0xff000000
> > -#define HC_SubA_SHIFT           24
> > -/* Transmission Setting
> > - */
> > -#define HC_REG_TRANS_SET        0x003c
> > -#define HC_ParaSubType_MASK     0xff000000
> > -#define HC_ParaType_MASK        0x00ff0000
> > -#define HC_ParaOS_MASK          0x0000ff00
> > -#define HC_ParaAdr_MASK         0x000000ff
> > -#define HC_ParaSubType_SHIFT    24
> > -#define HC_ParaType_SHIFT       16
> > -#define HC_ParaOS_SHIFT         8
> > -#define HC_ParaAdr_SHIFT        0
> > -
> > -#define HC_ParaType_CmdVdata    0x0000
> > -#define HC_ParaType_NotTex      0x0001
> > -#define HC_ParaType_Tex         0x0002
> > -#define HC_ParaType_Palette     0x0003
> > -#define HC_ParaType_PreCR       0x0010
> > -#define HC_ParaType_Auto        0x00fe
> > -
> > -/* Transmission Space
> > - */
> > -#define HC_REG_Hpara0           0x0040
> > -#define HC_REG_HpataAF          0x02fc
> > -
> > -/* Read
> > - */
> > -#define HC_REG_HREngSt          0x0000
> > -#define HC_REG_HRFIFOempty      0x0004
> > -#define HC_REG_HRFIFOfull       0x0008
> > -#define HC_REG_HRErr            0x000c
> > -#define HC_REG_FIFOstatus       0x0010
> > -/* HC_REG_HREngSt          0x0000
> > - */
> > -#define HC_HDASZC_MASK          0x00010000
> > -#define HC_HSGEMI_MASK          0x0000f000
> > -#define HC_HLGEMISt_MASK        0x00000f00
> > -#define HC_HCRSt_MASK           0x00000080
> > -#define HC_HSE0St_MASK          0x00000040
> > -#define HC_HSE1St_MASK          0x00000020
> > -#define HC_HPESt_MASK           0x00000010
> > -#define HC_HXESt_MASK           0x00000008
> > -#define HC_HBESt_MASK           0x00000004
> > -#define HC_HE2St_MASK           0x00000002
> > -#define HC_HE3St_MASK           0x00000001
> > -/* HC_REG_HRFIFOempty      0x0004
> > - */
> > -#define HC_HRZDempty_MASK       0x00000010
> > -#define HC_HRTXAempty_MASK      0x00000008
> > -#define HC_HRTXDempty_MASK      0x00000004
> > -#define HC_HWZDempty_MASK       0x00000002
> > -#define HC_HWCDempty_MASK       0x00000001
> > -/* HC_REG_HRFIFOfull       0x0008
> > - */
> > -#define HC_HRZDfull_MASK        0x00000010
> > -#define HC_HRTXAfull_MASK       0x00000008
> > -#define HC_HRTXDfull_MASK       0x00000004
> > -#define HC_HWZDfull_MASK        0x00000002
> > -#define HC_HWCDfull_MASK        0x00000001
> > -/* HC_REG_HRErr            0x000c
> > - */
> > -#define HC_HAGPCMErr_MASK       0x80000000
> > -#define HC_HAGPCMErrC_MASK      0x70000000
> > -/* HC_REG_FIFOstatus       0x0010
> > - */
> > -#define HC_HRFIFOATall_MASK     0x80000000
> > -#define HC_HRFIFOATbusy_MASK    0x40000000
> > -#define HC_HRATFGMDo_MASK       0x00000100
> > -#define HC_HRATFGMDi_MASK       0x00000080
> > -#define HC_HRATFRZD_MASK        0x00000040
> > -#define HC_HRATFRTXA_MASK       0x00000020
> > -#define HC_HRATFRTXD_MASK       0x00000010
> > -#define HC_HRATFWZD_MASK        0x00000008
> > -#define HC_HRATFWCD_MASK        0x00000004
> > -#define HC_HRATTXTAG_MASK       0x00000002
> > -#define HC_HRATTXCH_MASK        0x00000001
> > -
> > -/* AGP Command Setting
> > - */
> > -#define HC_SubA_HAGPBstL        0x0060
> > -#define HC_SubA_HAGPBendL       0x0061
> > -#define HC_SubA_HAGPCMNT        0x0062
> > -#define HC_SubA_HAGPBpL         0x0063
> > -#define HC_SubA_HAGPBpH         0x0064
> > -/* HC_SubA_HAGPCMNT        0x0062
> > - */
> > -#define HC_HAGPCMNT_MASK        0x00800000
> > -#define HC_HCmdErrClr_MASK      0x00400000
> > -#define HC_HAGPBendH_MASK       0x0000ff00
> > -#define HC_HAGPBstH_MASK        0x000000ff
> > -#define HC_HAGPBendH_SHIFT      8
> > -#define HC_HAGPBstH_SHIFT       0
> > -/* HC_SubA_HAGPBpL         0x0063
> > - */
> > -#define HC_HAGPBpL_MASK         0x00fffffc
> > -#define HC_HAGPBpID_MASK        0x00000003
> > -#define HC_HAGPBpID_PAUSE       0x00000000
> > -#define HC_HAGPBpID_JUMP        0x00000001
> > -#define HC_HAGPBpID_STOP        0x00000002
> > -/* HC_SubA_HAGPBpH         0x0064
> > - */
> > -#define HC_HAGPBpH_MASK         0x00ffffff
> > -
> > -/* Miscellaneous Settings
> > - */
> > -#define HC_SubA_HClipTB         0x0070
> > -#define HC_SubA_HClipLR         0x0071
> > -#define HC_SubA_HFPClipTL       0x0072
> > -#define HC_SubA_HFPClipBL       0x0073
> > -#define HC_SubA_HFPClipLL       0x0074
> > -#define HC_SubA_HFPClipRL       0x0075
> > -#define HC_SubA_HFPClipTBH      0x0076
> > -#define HC_SubA_HFPClipLRH      0x0077
> > -#define HC_SubA_HLP             0x0078
> > -#define HC_SubA_HLPRF           0x0079
> > -#define HC_SubA_HSolidCL        0x007a
> > -#define HC_SubA_HPixGC          0x007b
> > -#define HC_SubA_HSPXYOS         0x007c
> > -#define HC_SubA_HVertexCNT      0x007d
> > -
> > -#define HC_HClipT_MASK          0x00fff000
> > -#define HC_HClipT_SHIFT         12
> > -#define HC_HClipB_MASK          0x00000fff
> > -#define HC_HClipB_SHIFT         0
> > -#define HC_HClipL_MASK          0x00fff000
> > -#define HC_HClipL_SHIFT         12
> > -#define HC_HClipR_MASK          0x00000fff
> > -#define HC_HClipR_SHIFT         0
> > -#define HC_HFPClipBH_MASK       0x0000ff00
> > -#define HC_HFPClipBH_SHIFT      8
> > -#define HC_HFPClipTH_MASK       0x000000ff
> > -#define HC_HFPClipTH_SHIFT      0
> > -#define HC_HFPClipRH_MASK       0x0000ff00
> > -#define HC_HFPClipRH_SHIFT      8
> > -#define HC_HFPClipLH_MASK       0x000000ff
> > -#define HC_HFPClipLH_SHIFT      0
> > -#define HC_HSolidCH_MASK        0x000000ff
> > -#define HC_HPixGC_MASK          0x00800000
> > -#define HC_HSPXOS_MASK          0x00fff000
> > -#define HC_HSPXOS_SHIFT         12
> > -#define HC_HSPYOS_MASK          0x00000fff
> > -
> > -/* Command
> > - * Command A
> > - */
> > -#define HC_HCmdHeader_MASK      0xfe000000	/*0xffe00000 */
> > -#define HC_HE3Fire_MASK         0x00100000
> > -#define HC_HPMType_MASK         0x000f0000
> > -#define HC_HEFlag_MASK          0x0000e000
> > -#define HC_HShading_MASK        0x00001c00
> > -#define HC_HPMValidN_MASK       0x00000200
> > -#define HC_HPLEND_MASK          0x00000100
> > -#define HC_HVCycle_MASK         0x000000ff
> > -#define HC_HVCycle_Style_MASK   0x000000c0
> > -#define HC_HVCycle_ChgA_MASK    0x00000030
> > -#define HC_HVCycle_ChgB_MASK    0x0000000c
> > -#define HC_HVCycle_ChgC_MASK    0x00000003
> > -#define HC_HPMType_Point        0x00000000
> > -#define HC_HPMType_Line         0x00010000
> > -#define HC_HPMType_Tri          0x00020000
> > -#define HC_HPMType_TriWF        0x00040000
> > -#define HC_HEFlag_NoAA          0x00000000
> > -#define HC_HEFlag_ab            0x00008000
> > -#define HC_HEFlag_bc            0x00004000
> > -#define HC_HEFlag_ca            0x00002000
> > -#define HC_HShading_Solid       0x00000000
> > -#define HC_HShading_FlatA       0x00000400
> > -#define HC_HShading_FlatB       0x00000800
> > -#define HC_HShading_FlatC       0x00000c00
> > -#define HC_HShading_Gouraud     0x00001000
> > -#define HC_HVCycle_Full         0x00000000
> > -#define HC_HVCycle_AFP          0x00000040
> > -#define HC_HVCycle_One          0x000000c0
> > -#define HC_HVCycle_NewA         0x00000000
> > -#define HC_HVCycle_AA           0x00000010
> > -#define HC_HVCycle_AB           0x00000020
> > -#define HC_HVCycle_AC           0x00000030
> > -#define HC_HVCycle_NewB         0x00000000
> > -#define HC_HVCycle_BA           0x00000004
> > -#define HC_HVCycle_BB           0x00000008
> > -#define HC_HVCycle_BC           0x0000000c
> > -#define HC_HVCycle_NewC         0x00000000
> > -#define HC_HVCycle_CA           0x00000001
> > -#define HC_HVCycle_CB           0x00000002
> > -#define HC_HVCycle_CC           0x00000003
> > -
> > -/* Command B
> > - */
> > -#define HC_HLPrst_MASK          0x00010000
> > -#define HC_HLLastP_MASK         0x00008000
> > -#define HC_HVPMSK_MASK          0x00007f80
> > -#define HC_HBFace_MASK          0x00000040
> > -#define HC_H2nd1VT_MASK         0x0000003f
> > -#define HC_HVPMSK_X             0x00004000
> > -#define HC_HVPMSK_Y             0x00002000
> > -#define HC_HVPMSK_Z             0x00001000
> > -#define HC_HVPMSK_W             0x00000800
> > -#define HC_HVPMSK_Cd            0x00000400
> > -#define HC_HVPMSK_Cs            0x00000200
> > -#define HC_HVPMSK_S             0x00000100
> > -#define HC_HVPMSK_T             0x00000080
> > -
> > -/* Enable Setting
> > - */
> > -#define HC_SubA_HEnable         0x0000
> > -#define HC_HenTXEnvMap_MASK     0x00200000
> > -#define HC_HenVertexCNT_MASK    0x00100000
> > -#define HC_HenCPUDAZ_MASK       0x00080000
> > -#define HC_HenDASZWC_MASK       0x00040000
> > -#define HC_HenFBCull_MASK       0x00020000
> > -#define HC_HenCW_MASK           0x00010000
> > -#define HC_HenAA_MASK           0x00008000
> > -#define HC_HenST_MASK           0x00004000
> > -#define HC_HenZT_MASK           0x00002000
> > -#define HC_HenZW_MASK           0x00001000
> > -#define HC_HenAT_MASK           0x00000800
> > -#define HC_HenAW_MASK           0x00000400
> > -#define HC_HenSP_MASK           0x00000200
> > -#define HC_HenLP_MASK           0x00000100
> > -#define HC_HenTXCH_MASK         0x00000080
> > -#define HC_HenTXMP_MASK         0x00000040
> > -#define HC_HenTXPP_MASK         0x00000020
> > -#define HC_HenTXTR_MASK         0x00000010
> > -#define HC_HenCS_MASK           0x00000008
> > -#define HC_HenFOG_MASK          0x00000004
> > -#define HC_HenABL_MASK          0x00000002
> > -#define HC_HenDT_MASK           0x00000001
> > -
> > -/* Z Setting
> > - */
> > -#define HC_SubA_HZWBBasL        0x0010
> > -#define HC_SubA_HZWBBasH        0x0011
> > -#define HC_SubA_HZWBType        0x0012
> > -#define HC_SubA_HZBiasL         0x0013
> > -#define HC_SubA_HZWBend         0x0014
> > -#define HC_SubA_HZWTMD          0x0015
> > -#define HC_SubA_HZWCDL          0x0016
> > -#define HC_SubA_HZWCTAGnum      0x0017
> > -#define HC_SubA_HZCYNum         0x0018
> > -#define HC_SubA_HZWCFire        0x0019
> > -/* HC_SubA_HZWBType
> > - */
> > -#define HC_HZWBType_MASK        0x00800000
> > -#define HC_HZBiasedWB_MASK      0x00400000
> > -#define HC_HZONEasFF_MASK       0x00200000
> > -#define HC_HZOONEasFF_MASK      0x00100000
> > -#define HC_HZWBFM_MASK          0x00030000
> > -#define HC_HZWBLoc_MASK         0x0000c000
> > -#define HC_HZWBPit_MASK         0x00003fff
> > -#define HC_HZWBFM_16            0x00000000
> > -#define HC_HZWBFM_32            0x00020000
> > -#define HC_HZWBFM_24            0x00030000
> > -#define HC_HZWBLoc_Local        0x00000000
> > -#define HC_HZWBLoc_SyS          0x00004000
> > -/* HC_SubA_HZWBend
> > - */
> > -#define HC_HZWBend_MASK         0x00ffe000
> > -#define HC_HZBiasH_MASK         0x000000ff
> > -#define HC_HZWBend_SHIFT        10
> > -/* HC_SubA_HZWTMD
> > - */
> > -#define HC_HZWTMD_MASK          0x00070000
> > -#define HC_HEBEBias_MASK        0x00007f00
> > -#define HC_HZNF_MASK            0x000000ff
> > -#define HC_HZWTMD_NeverPass     0x00000000
> > -#define HC_HZWTMD_LT            0x00010000
> > -#define HC_HZWTMD_EQ            0x00020000
> > -#define HC_HZWTMD_LE            0x00030000
> > -#define HC_HZWTMD_GT            0x00040000
> > -#define HC_HZWTMD_NE            0x00050000
> > -#define HC_HZWTMD_GE            0x00060000
> > -#define HC_HZWTMD_AllPass       0x00070000
> > -#define HC_HEBEBias_SHIFT       8
> > -/* HC_SubA_HZWCDL          0x0016
> > - */
> > -#define HC_HZWCDL_MASK          0x00ffffff
> > -/* HC_SubA_HZWCTAGnum      0x0017
> > - */
> > -#define HC_HZWCTAGnum_MASK      0x00ff0000
> > -#define HC_HZWCTAGnum_SHIFT     16
> > -#define HC_HZWCDH_MASK          0x000000ff
> > -#define HC_HZWCDH_SHIFT         0
> > -/* HC_SubA_HZCYNum         0x0018
> > - */
> > -#define HC_HZCYNum_MASK         0x00030000
> > -#define HC_HZCYNum_SHIFT        16
> > -#define HC_HZWCQWnum_MASK       0x00003fff
> > -#define HC_HZWCQWnum_SHIFT      0
> > -/* HC_SubA_HZWCFire        0x0019
> > - */
> > -#define HC_ZWCFire_MASK         0x00010000
> > -#define HC_HZWCQWnumLast_MASK   0x00003fff
> > -#define HC_HZWCQWnumLast_SHIFT  0
> > -
> > -/* Stencil Setting
> > - */
> > -#define HC_SubA_HSTREF          0x0023
> > -#define HC_SubA_HSTMD           0x0024
> > -/* HC_SubA_HSBFM
> > - */
> > -#define HC_HSBFM_MASK           0x00030000
> > -#define HC_HSBLoc_MASK          0x0000c000
> > -#define HC_HSBPit_MASK          0x00003fff
> > -/* HC_SubA_HSTREF
> > - */
> > -#define HC_HSTREF_MASK          0x00ff0000
> > -#define HC_HSTOPMSK_MASK        0x0000ff00
> > -#define HC_HSTBMSK_MASK         0x000000ff
> > -#define HC_HSTREF_SHIFT         16
> > -#define HC_HSTOPMSK_SHIFT       8
> > -/* HC_SubA_HSTMD
> > - */
> > -#define HC_HSTMD_MASK           0x00070000
> > -#define HC_HSTOPSF_MASK         0x000001c0
> > -#define HC_HSTOPSPZF_MASK       0x00000038
> > -#define HC_HSTOPSPZP_MASK       0x00000007
> > -#define HC_HSTMD_NeverPass      0x00000000
> > -#define HC_HSTMD_LT             0x00010000
> > -#define HC_HSTMD_EQ             0x00020000
> > -#define HC_HSTMD_LE             0x00030000
> > -#define HC_HSTMD_GT             0x00040000
> > -#define HC_HSTMD_NE             0x00050000
> > -#define HC_HSTMD_GE             0x00060000
> > -#define HC_HSTMD_AllPass        0x00070000
> > -#define HC_HSTOPSF_KEEP         0x00000000
> > -#define HC_HSTOPSF_ZERO         0x00000040
> > -#define HC_HSTOPSF_REPLACE      0x00000080
> > -#define HC_HSTOPSF_INCRSAT      0x000000c0
> > -#define HC_HSTOPSF_DECRSAT      0x00000100
> > -#define HC_HSTOPSF_INVERT       0x00000140
> > -#define HC_HSTOPSF_INCR         0x00000180
> > -#define HC_HSTOPSF_DECR         0x000001c0
> > -#define HC_HSTOPSPZF_KEEP       0x00000000
> > -#define HC_HSTOPSPZF_ZERO       0x00000008
> > -#define HC_HSTOPSPZF_REPLACE    0x00000010
> > -#define HC_HSTOPSPZF_INCRSAT    0x00000018
> > -#define HC_HSTOPSPZF_DECRSAT    0x00000020
> > -#define HC_HSTOPSPZF_INVERT     0x00000028
> > -#define HC_HSTOPSPZF_INCR       0x00000030
> > -#define HC_HSTOPSPZF_DECR       0x00000038
> > -#define HC_HSTOPSPZP_KEEP       0x00000000
> > -#define HC_HSTOPSPZP_ZERO       0x00000001
> > -#define HC_HSTOPSPZP_REPLACE    0x00000002
> > -#define HC_HSTOPSPZP_INCRSAT    0x00000003
> > -#define HC_HSTOPSPZP_DECRSAT    0x00000004
> > -#define HC_HSTOPSPZP_INVERT     0x00000005
> > -#define HC_HSTOPSPZP_INCR       0x00000006
> > -#define HC_HSTOPSPZP_DECR       0x00000007
> > -
> > -/* Alpha Setting
> > - */
> > -#define HC_SubA_HABBasL         0x0030
> > -#define HC_SubA_HABBasH         0x0031
> > -#define HC_SubA_HABFM           0x0032
> > -#define HC_SubA_HATMD           0x0033
> > -#define HC_SubA_HABLCsat        0x0034
> > -#define HC_SubA_HABLCop         0x0035
> > -#define HC_SubA_HABLAsat        0x0036
> > -#define HC_SubA_HABLAop         0x0037
> > -#define HC_SubA_HABLRCa         0x0038
> > -#define HC_SubA_HABLRFCa        0x0039
> > -#define HC_SubA_HABLRCbias      0x003a
> > -#define HC_SubA_HABLRCb         0x003b
> > -#define HC_SubA_HABLRFCb        0x003c
> > -#define HC_SubA_HABLRAa         0x003d
> > -#define HC_SubA_HABLRAb         0x003e
> > -/* HC_SubA_HABFM
> > - */
> > -#define HC_HABFM_MASK           0x00030000
> > -#define HC_HABLoc_MASK          0x0000c000
> > -#define HC_HABPit_MASK          0x000007ff
> > -/* HC_SubA_HATMD
> > - */
> > -#define HC_HATMD_MASK           0x00000700
> > -#define HC_HATREF_MASK          0x000000ff
> > -#define HC_HATMD_NeverPass      0x00000000
> > -#define HC_HATMD_LT             0x00000100
> > -#define HC_HATMD_EQ             0x00000200
> > -#define HC_HATMD_LE             0x00000300
> > -#define HC_HATMD_GT             0x00000400
> > -#define HC_HATMD_NE             0x00000500
> > -#define HC_HATMD_GE             0x00000600
> > -#define HC_HATMD_AllPass        0x00000700
> > -/* HC_SubA_HABLCsat
> > - */
> > -#define HC_HABLCsat_MASK        0x00010000
> > -#define HC_HABLCa_MASK          0x0000fc00
> > -#define HC_HABLCa_C_MASK        0x0000c000
> > -#define HC_HABLCa_OPC_MASK      0x00003c00
> > -#define HC_HABLFCa_MASK         0x000003f0
> > -#define HC_HABLFCa_C_MASK       0x00000300
> > -#define HC_HABLFCa_OPC_MASK     0x000000f0
> > -#define HC_HABLCbias_MASK       0x0000000f
> > -#define HC_HABLCbias_C_MASK     0x00000008
> > -#define HC_HABLCbias_OPC_MASK   0x00000007
> > -/*-- Define the input color=2E
> > - */
> > -#define HC_XC_Csrc              0x00000000
> > -#define HC_XC_Cdst              0x00000001
> > -#define HC_XC_Asrc              0x00000002
> > -#define HC_XC_Adst              0x00000003
> > -#define HC_XC_Fog               0x00000004
> > -#define HC_XC_HABLRC            0x00000005
> > -#define HC_XC_minSrcDst         0x00000006
> > -#define HC_XC_maxSrcDst         0x00000007
> > -#define HC_XC_mimAsrcInvAdst    0x00000008
> > -#define HC_XC_OPC               0x00000000
> > -#define HC_XC_InvOPC            0x00000010
> > -#define HC_XC_OPCp5             0x00000020
> > -/*-- Define the input Alpha
> > - */
> > -#define HC_XA_OPA               0x00000000
> > -#define HC_XA_InvOPA            0x00000010
> > -#define HC_XA_OPAp5             0x00000020
> > -#define HC_XA_0                 0x00000000
> > -#define HC_XA_Asrc              0x00000001
> > -#define HC_XA_Adst              0x00000002
> > -#define HC_XA_Fog               0x00000003
> > -#define HC_XA_minAsrcFog        0x00000004
> > -#define HC_XA_minAsrcAdst       0x00000005
> > -#define HC_XA_maxAsrcFog        0x00000006
> > -#define HC_XA_maxAsrcAdst       0x00000007
> > -#define HC_XA_HABLRA            0x00000008
> > -#define HC_XA_minAsrcInvAdst    0x00000008
> > -#define HC_XA_HABLFRA           0x00000009
> > -/*--
> > - */
> > -#define HC_HABLCa_OPC           (HC_XC_OPC << 10)
> > -#define HC_HABLCa_InvOPC        (HC_XC_InvOPC << 10)
> > -#define HC_HABLCa_OPCp5         (HC_XC_OPCp5 << 10)
> > -#define HC_HABLCa_Csrc          (HC_XC_Csrc << 10)
> > -#define HC_HABLCa_Cdst          (HC_XC_Cdst << 10)
> > -#define HC_HABLCa_Asrc          (HC_XC_Asrc << 10)
> > -#define HC_HABLCa_Adst          (HC_XC_Adst << 10)
> > -#define HC_HABLCa_Fog           (HC_XC_Fog << 10)
> > -#define HC_HABLCa_HABLRCa       (HC_XC_HABLRC << 10)
> > -#define HC_HABLCa_minSrcDst     (HC_XC_minSrcDst << 10)
> > -#define HC_HABLCa_maxSrcDst     (HC_XC_maxSrcDst << 10)
> > -#define HC_HABLFCa_OPC              (HC_XC_OPC << 4)
> > -#define HC_HABLFCa_InvOPC           (HC_XC_InvOPC << 4)
> > -#define HC_HABLFCa_OPCp5            (HC_XC_OPCp5 << 4)
> > -#define HC_HABLFCa_Csrc             (HC_XC_Csrc << 4)
> > -#define HC_HABLFCa_Cdst             (HC_XC_Cdst << 4)
> > -#define HC_HABLFCa_Asrc             (HC_XC_Asrc << 4)
> > -#define HC_HABLFCa_Adst             (HC_XC_Adst << 4)
> > -#define HC_HABLFCa_Fog              (HC_XC_Fog << 4)
> > -#define HC_HABLFCa_HABLRCa          (HC_XC_HABLRC << 4)
> > -#define HC_HABLFCa_minSrcDst        (HC_XC_minSrcDst << 4)
> > -#define HC_HABLFCa_maxSrcDst        (HC_XC_maxSrcDst << 4)
> > -#define HC_HABLFCa_mimAsrcInvAdst   (HC_XC_mimAsrcInvAdst << 4)
> > -#define HC_HABLCbias_HABLRCbias 0x00000000
> > -#define HC_HABLCbias_Asrc       0x00000001
> > -#define HC_HABLCbias_Adst       0x00000002
> > -#define HC_HABLCbias_Fog        0x00000003
> > -#define HC_HABLCbias_Cin        0x00000004
> > -/* HC_SubA_HABLCop         0x0035
> > - */
> > -#define HC_HABLdot_MASK         0x00010000
> > -#define HC_HABLCop_MASK         0x00004000
> > -#define HC_HABLCb_MASK          0x00003f00
> > -#define HC_HABLCb_C_MASK        0x00003000
> > -#define HC_HABLCb_OPC_MASK      0x00000f00
> > -#define HC_HABLFCb_MASK         0x000000fc
> > -#define HC_HABLFCb_C_MASK       0x000000c0
> > -#define HC_HABLFCb_OPC_MASK     0x0000003c
> > -#define HC_HABLCshift_MASK      0x00000003
> > -#define HC_HABLCb_OPC           (HC_XC_OPC << 8)
> > -#define HC_HABLCb_InvOPC        (HC_XC_InvOPC << 8)
> > -#define HC_HABLCb_OPCp5         (HC_XC_OPCp5 << 8)
> > -#define HC_HABLCb_Csrc          (HC_XC_Csrc << 8)
> > -#define HC_HABLCb_Cdst          (HC_XC_Cdst << 8)
> > -#define HC_HABLCb_Asrc          (HC_XC_Asrc << 8)
> > -#define HC_HABLCb_Adst          (HC_XC_Adst << 8)
> > -#define HC_HABLCb_Fog           (HC_XC_Fog << 8)
> > -#define HC_HABLCb_HABLRCa       (HC_XC_HABLRC << 8)
> > -#define HC_HABLCb_minSrcDst     (HC_XC_minSrcDst << 8)
> > -#define HC_HABLCb_maxSrcDst     (HC_XC_maxSrcDst << 8)
> > -#define HC_HABLFCb_OPC              (HC_XC_OPC << 2)
> > -#define HC_HABLFCb_InvOPC           (HC_XC_InvOPC << 2)
> > -#define HC_HABLFCb_OPCp5            (HC_XC_OPCp5 << 2)
> > -#define HC_HABLFCb_Csrc             (HC_XC_Csrc << 2)
> > -#define HC_HABLFCb_Cdst             (HC_XC_Cdst << 2)
> > -#define HC_HABLFCb_Asrc             (HC_XC_Asrc << 2)
> > -#define HC_HABLFCb_Adst             (HC_XC_Adst << 2)
> > -#define HC_HABLFCb_Fog              (HC_XC_Fog << 2)
> > -#define HC_HABLFCb_HABLRCb          (HC_XC_HABLRC << 2)
> > -#define HC_HABLFCb_minSrcDst        (HC_XC_minSrcDst << 2)
> > -#define HC_HABLFCb_maxSrcDst        (HC_XC_maxSrcDst << 2)
> > -#define HC_HABLFCb_mimAsrcInvAdst   (HC_XC_mimAsrcInvAdst << 2)
> > -/* HC_SubA_HABLAsat        0x0036
> > - */
> > -#define HC_HABLAsat_MASK        0x00010000
> > -#define HC_HABLAa_MASK          0x0000fc00
> > -#define HC_HABLAa_A_MASK        0x0000c000
> > -#define HC_HABLAa_OPA_MASK      0x00003c00
> > -#define HC_HABLFAa_MASK         0x000003f0
> > -#define HC_HABLFAa_A_MASK       0x00000300
> > -#define HC_HABLFAa_OPA_MASK     0x000000f0
> > -#define HC_HABLAbias_MASK       0x0000000f
> > -#define HC_HABLAbias_A_MASK     0x00000008
> > -#define HC_HABLAbias_OPA_MASK   0x00000007
> > -#define HC_HABLAa_OPA           (HC_XA_OPA << 10)
> > -#define HC_HABLAa_InvOPA        (HC_XA_InvOPA << 10)
> > -#define HC_HABLAa_OPAp5         (HC_XA_OPAp5 << 10)
> > -#define HC_HABLAa_0             (HC_XA_0 << 10)
> > -#define HC_HABLAa_Asrc          (HC_XA_Asrc << 10)
> > -#define HC_HABLAa_Adst          (HC_XA_Adst << 10)
> > -#define HC_HABLAa_Fog           (HC_XA_Fog << 10)
> > -#define HC_HABLAa_minAsrcFog    (HC_XA_minAsrcFog << 10)
> > -#define HC_HABLAa_minAsrcAdst   (HC_XA_minAsrcAdst << 10)
> > -#define HC_HABLAa_maxAsrcFog    (HC_XA_maxAsrcFog << 10)
> > -#define HC_HABLAa_maxAsrcAdst   (HC_XA_maxAsrcAdst << 10)
> > -#define HC_HABLAa_HABLRA        (HC_XA_HABLRA << 10)
> > -#define HC_HABLFAa_OPA          (HC_XA_OPA << 4)
> > -#define HC_HABLFAa_InvOPA       (HC_XA_InvOPA << 4)
> > -#define HC_HABLFAa_OPAp5        (HC_XA_OPAp5 << 4)
> > -#define HC_HABLFAa_0            (HC_XA_0 << 4)
> > -#define HC_HABLFAa_Asrc         (HC_XA_Asrc << 4)
> > -#define HC_HABLFAa_Adst         (HC_XA_Adst << 4)
> > -#define HC_HABLFAa_Fog          (HC_XA_Fog << 4)
> > -#define HC_HABLFAa_minAsrcFog   (HC_XA_minAsrcFog << 4)
> > -#define HC_HABLFAa_minAsrcAdst  (HC_XA_minAsrcAdst << 4)
> > -#define HC_HABLFAa_maxAsrcFog   (HC_XA_maxAsrcFog << 4)
> > -#define HC_HABLFAa_maxAsrcAdst  (HC_XA_maxAsrcAdst << 4)
> > -#define HC_HABLFAa_minAsrcInvAdst   (HC_XA_minAsrcInvAdst << 4)
> > -#define HC_HABLFAa_HABLFRA          (HC_XA_HABLFRA << 4)
> > -#define HC_HABLAbias_HABLRAbias 0x00000000
> > -#define HC_HABLAbias_Asrc       0x00000001
> > -#define HC_HABLAbias_Adst       0x00000002
> > -#define HC_HABLAbias_Fog        0x00000003
> > -#define HC_HABLAbias_Aaa        0x00000004
> > -/* HC_SubA_HABLAop         0x0037
> > - */
> > -#define HC_HABLAop_MASK         0x00004000
> > -#define HC_HABLAb_MASK          0x00003f00
> > -#define HC_HABLAb_OPA_MASK      0x00000f00
> > -#define HC_HABLFAb_MASK         0x000000fc
> > -#define HC_HABLFAb_OPA_MASK     0x0000003c
> > -#define HC_HABLAshift_MASK      0x00000003
> > -#define HC_HABLAb_OPA           (HC_XA_OPA << 8)
> > -#define HC_HABLAb_InvOPA        (HC_XA_InvOPA << 8)
> > -#define HC_HABLAb_OPAp5         (HC_XA_OPAp5 << 8)
> > -#define HC_HABLAb_0             (HC_XA_0 << 8)
> > -#define HC_HABLAb_Asrc          (HC_XA_Asrc << 8)
> > -#define HC_HABLAb_Adst          (HC_XA_Adst << 8)
> > -#define HC_HABLAb_Fog           (HC_XA_Fog << 8)
> > -#define HC_HABLAb_minAsrcFog    (HC_XA_minAsrcFog << 8)
> > -#define HC_HABLAb_minAsrcAdst   (HC_XA_minAsrcAdst << 8)
> > -#define HC_HABLAb_maxAsrcFog    (HC_XA_maxAsrcFog << 8)
> > -#define HC_HABLAb_maxAsrcAdst   (HC_XA_maxAsrcAdst << 8)
> > -#define HC_HABLAb_HABLRA        (HC_XA_HABLRA << 8)
> > -#define HC_HABLFAb_OPA          (HC_XA_OPA << 2)
> > -#define HC_HABLFAb_InvOPA       (HC_XA_InvOPA << 2)
> > -#define HC_HABLFAb_OPAp5        (HC_XA_OPAp5 << 2)
> > -#define HC_HABLFAb_0            (HC_XA_0 << 2)
> > -#define HC_HABLFAb_Asrc         (HC_XA_Asrc << 2)
> > -#define HC_HABLFAb_Adst         (HC_XA_Adst << 2)
> > -#define HC_HABLFAb_Fog          (HC_XA_Fog << 2)
> > -#define HC_HABLFAb_minAsrcFog   (HC_XA_minAsrcFog << 2)
> > -#define HC_HABLFAb_minAsrcAdst  (HC_XA_minAsrcAdst << 2)
> > -#define HC_HABLFAb_maxAsrcFog   (HC_XA_maxAsrcFog << 2)
> > -#define HC_HABLFAb_maxAsrcAdst  (HC_XA_maxAsrcAdst << 2)
> > -#define HC_HABLFAb_minAsrcInvAdst   (HC_XA_minAsrcInvAdst << 2)
> > -#define HC_HABLFAb_HABLFRA          (HC_XA_HABLFRA << 2)
> > -/* HC_SubA_HABLRAa         0x003d
> > - */
> > -#define HC_HABLRAa_MASK         0x00ff0000
> > -#define HC_HABLRFAa_MASK        0x0000ff00
> > -#define HC_HABLRAbias_MASK      0x000000ff
> > -#define HC_HABLRAa_SHIFT        16
> > -#define HC_HABLRFAa_SHIFT       8
> > -/* HC_SubA_HABLRAb         0x003e
> > - */
> > -#define HC_HABLRAb_MASK         0x0000ff00
> > -#define HC_HABLRFAb_MASK        0x000000ff
> > -#define HC_HABLRAb_SHIFT        8
> > -
> > -/* Destination Setting
> > - */
> > -#define HC_SubA_HDBBasL         0x0040
> > -#define HC_SubA_HDBBasH         0x0041
> > -#define HC_SubA_HDBFM           0x0042
> > -#define HC_SubA_HFBBMSKL        0x0043
> > -#define HC_SubA_HROP            0x0044
> > -/* HC_SubA_HDBFM           0x0042
> > - */
> > -#define HC_HDBFM_MASK           0x001f0000
> > -#define HC_HDBLoc_MASK          0x0000c000
> > -#define HC_HDBPit_MASK          0x00003fff
> > -#define HC_HDBFM_RGB555         0x00000000
> > -#define HC_HDBFM_RGB565         0x00010000
> > -#define HC_HDBFM_ARGB4444       0x00020000
> > -#define HC_HDBFM_ARGB1555       0x00030000
> > -#define HC_HDBFM_BGR555         0x00040000
> > -#define HC_HDBFM_BGR565         0x00050000
> > -#define HC_HDBFM_ABGR4444       0x00060000
> > -#define HC_HDBFM_ABGR1555       0x00070000
> > -#define HC_HDBFM_ARGB0888       0x00080000
> > -#define HC_HDBFM_ARGB8888       0x00090000
> > -#define HC_HDBFM_ABGR0888       0x000a0000
> > -#define HC_HDBFM_ABGR8888       0x000b0000
> > -#define HC_HDBLoc_Local         0x00000000
> > -#define HC_HDBLoc_Sys           0x00004000
> > -/* HC_SubA_HROP            0x0044
> > - */
> > -#define HC_HROP_MASK            0x00000f00
> > -#define HC_HFBBMSKH_MASK        0x000000ff
> > -#define HC_HROP_BLACK           0x00000000
> > -#define HC_HROP_DPon            0x00000100
> > -#define HC_HROP_DPna            0x00000200
> > -#define HC_HROP_Pn              0x00000300
> > -#define HC_HROP_PDna            0x00000400
> > -#define HC_HROP_Dn              0x00000500
> > -#define HC_HROP_DPx             0x00000600
> > -#define HC_HROP_DPan            0x00000700
> > -#define HC_HROP_DPa             0x00000800
> > -#define HC_HROP_DPxn            0x00000900
> > -#define HC_HROP_D               0x00000a00
> > -#define HC_HROP_DPno            0x00000b00
> > -#define HC_HROP_P               0x00000c00
> > -#define HC_HROP_PDno            0x00000d00
> > -#define HC_HROP_DPo             0x00000e00
> > -#define HC_HROP_WHITE           0x00000f00
> > -
> > -/* Fog Setting
> > - */
> > -#define HC_SubA_HFogLF          0x0050
> > -#define HC_SubA_HFogCL          0x0051
> > -#define HC_SubA_HFogCH          0x0052
> > -#define HC_SubA_HFogStL         0x0053
> > -#define HC_SubA_HFogStH         0x0054
> > -#define HC_SubA_HFogOOdMF       0x0055
> > -#define HC_SubA_HFogOOdEF       0x0056
> > -#define HC_SubA_HFogEndL        0x0057
> > -#define HC_SubA_HFogDenst       0x0058
> > -/* HC_SubA_FogLF           0x0050
> > - */
> > -#define HC_FogLF_MASK           0x00000010
> > -#define HC_FogEq_MASK           0x00000008
> > -#define HC_FogMD_MASK           0x00000007
> > -#define HC_FogMD_LocalFog        0x00000000
> > -#define HC_FogMD_LinearFog       0x00000002
> > -#define HC_FogMD_ExponentialFog  0x00000004
> > -#define HC_FogMD_Exponential2Fog 0x00000005
> > -/* #define HC_FogMD_FogTable       0x00000003 */
> > -
> > -/* HC_SubA_HFogDenst        0x0058
> > - */
> > -#define HC_FogDenst_MASK        0x001fff00
> > -#define HC_FogEndL_MASK         0x000000ff
> > -
> > -/* Texture subtype definitions
> > - */
> > -#define HC_SubType_Tex0         0x00000000
> > -#define HC_SubType_Tex1         0x00000001
> > -#define HC_SubType_TexGeneral   0x000000fe
> > -
> > -/* Attribute of texture n
> > - */
> > -#define HC_SubA_HTXnL0BasL      0x0000
> > -#define HC_SubA_HTXnL1BasL      0x0001
> > -#define HC_SubA_HTXnL2BasL      0x0002
> > -#define HC_SubA_HTXnL3BasL      0x0003
> > -#define HC_SubA_HTXnL4BasL      0x0004
> > -#define HC_SubA_HTXnL5BasL      0x0005
> > -#define HC_SubA_HTXnL6BasL      0x0006
> > -#define HC_SubA_HTXnL7BasL      0x0007
> > -#define HC_SubA_HTXnL8BasL      0x0008
> > -#define HC_SubA_HTXnL9BasL      0x0009
> > -#define HC_SubA_HTXnLaBasL      0x000a
> > -#define HC_SubA_HTXnLbBasL      0x000b
> > -#define HC_SubA_HTXnLcBasL      0x000c
> > -#define HC_SubA_HTXnLdBasL      0x000d
> > -#define HC_SubA_HTXnLeBasL      0x000e
> > -#define HC_SubA_HTXnLfBasL      0x000f
> > -#define HC_SubA_HTXnL10BasL     0x0010
> > -#define HC_SubA_HTXnL11BasL     0x0011
> > -#define HC_SubA_HTXnL012BasH    0x0020
> > -#define HC_SubA_HTXnL345BasH    0x0021
> > -#define HC_SubA_HTXnL678BasH    0x0022
> > -#define HC_SubA_HTXnL9abBasH    0x0023
> > -#define HC_SubA_HTXnLcdeBasH    0x0024
> > -#define HC_SubA_HTXnLf1011BasH  0x0025
> > -#define HC_SubA_HTXnL0Pit       0x002b
> > -#define HC_SubA_HTXnL1Pit       0x002c
> > -#define HC_SubA_HTXnL2Pit       0x002d
> > -#define HC_SubA_HTXnL3Pit       0x002e
> > -#define HC_SubA_HTXnL4Pit       0x002f
> > -#define HC_SubA_HTXnL5Pit       0x0030
> > -#define HC_SubA_HTXnL6Pit       0x0031
> > -#define HC_SubA_HTXnL7Pit       0x0032
> > -#define HC_SubA_HTXnL8Pit       0x0033
> > -#define HC_SubA_HTXnL9Pit       0x0034
> > -#define HC_SubA_HTXnLaPit       0x0035
> > -#define HC_SubA_HTXnLbPit       0x0036
> > -#define HC_SubA_HTXnLcPit       0x0037
> > -#define HC_SubA_HTXnLdPit       0x0038
> > -#define HC_SubA_HTXnLePit       0x0039
> > -#define HC_SubA_HTXnLfPit       0x003a
> > -#define HC_SubA_HTXnL10Pit      0x003b
> > -#define HC_SubA_HTXnL11Pit      0x003c
> > -#define HC_SubA_HTXnL0_5WE      0x004b
> > -#define HC_SubA_HTXnL6_bWE      0x004c
> > -#define HC_SubA_HTXnLc_11WE     0x004d
> > -#define HC_SubA_HTXnL0_5HE      0x0051
> > -#define HC_SubA_HTXnL6_bHE      0x0052
> > -#define HC_SubA_HTXnLc_11HE     0x0053
> > -#define HC_SubA_HTXnL0OS        0x0077
> > -#define HC_SubA_HTXnTB          0x0078
> > -#define HC_SubA_HTXnMPMD        0x0079
> > -#define HC_SubA_HTXnCLODu       0x007a
> > -#define HC_SubA_HTXnFM          0x007b
> > -#define HC_SubA_HTXnTRCH        0x007c
> > -#define HC_SubA_HTXnTRCL        0x007d
> > -#define HC_SubA_HTXnTBC         0x007e
> > -#define HC_SubA_HTXnTRAH        0x007f
> > -#define HC_SubA_HTXnTBLCsat     0x0080
> > -#define HC_SubA_HTXnTBLCop      0x0081
> > -#define HC_SubA_HTXnTBLMPfog    0x0082
> > -#define HC_SubA_HTXnTBLAsat     0x0083
> > -#define HC_SubA_HTXnTBLRCa      0x0085
> > -#define HC_SubA_HTXnTBLRCb      0x0086
> > -#define HC_SubA_HTXnTBLRCc      0x0087
> > -#define HC_SubA_HTXnTBLRCbias   0x0088
> > -#define HC_SubA_HTXnTBLRAa      0x0089
> > -#define HC_SubA_HTXnTBLRFog     0x008a
> > -#define HC_SubA_HTXnBumpM00     0x0090
> > -#define HC_SubA_HTXnBumpM01     0x0091
> > -#define HC_SubA_HTXnBumpM10     0x0092
> > -#define HC_SubA_HTXnBumpM11     0x0093
> > -#define HC_SubA_HTXnLScale      0x0094
> > -#define HC_SubA_HTXSMD          0x0000
> > -/* HC_SubA_HTXnL012BasH    0x0020
> > - */
> > -#define HC_HTXnL0BasH_MASK      0x000000ff
> > -#define HC_HTXnL1BasH_MASK      0x0000ff00
> > -#define HC_HTXnL2BasH_MASK      0x00ff0000
> > -#define HC_HTXnL1BasH_SHIFT     8
> > -#define HC_HTXnL2BasH_SHIFT     16
> > -/* HC_SubA_HTXnL345BasH    0x0021
> > - */
> > -#define HC_HTXnL3BasH_MASK      0x000000ff
> > -#define HC_HTXnL4BasH_MASK      0x0000ff00
> > -#define HC_HTXnL5BasH_MASK      0x00ff0000
> > -#define HC_HTXnL4BasH_SHIFT     8
> > -#define HC_HTXnL5BasH_SHIFT     16
> > -/* HC_SubA_HTXnL678BasH    0x0022
> > - */
> > -#define HC_HTXnL6BasH_MASK      0x000000ff
> > -#define HC_HTXnL7BasH_MASK      0x0000ff00
> > -#define HC_HTXnL8BasH_MASK      0x00ff0000
> > -#define HC_HTXnL7BasH_SHIFT     8
> > -#define HC_HTXnL8BasH_SHIFT     16
> > -/* HC_SubA_HTXnL9abBasH    0x0023
> > - */
> > -#define HC_HTXnL9BasH_MASK      0x000000ff
> > -#define HC_HTXnLaBasH_MASK      0x0000ff00
> > -#define HC_HTXnLbBasH_MASK      0x00ff0000
> > -#define HC_HTXnLaBasH_SHIFT     8
> > -#define HC_HTXnLbBasH_SHIFT     16
> > -/* HC_SubA_HTXnLcdeBasH    0x0024
> > - */
> > -#define HC_HTXnLcBasH_MASK      0x000000ff
> > -#define HC_HTXnLdBasH_MASK      0x0000ff00
> > -#define HC_HTXnLeBasH_MASK      0x00ff0000
> > -#define HC_HTXnLdBasH_SHIFT     8
> > -#define HC_HTXnLeBasH_SHIFT     16
> > -/* HC_SubA_HTXnLcdeBasH    0x0025
> > - */
> > -#define HC_HTXnLfBasH_MASK      0x000000ff
> > -#define HC_HTXnL10BasH_MASK      0x0000ff00
> > -#define HC_HTXnL11BasH_MASK      0x00ff0000
> > -#define HC_HTXnL10BasH_SHIFT     8
> > -#define HC_HTXnL11BasH_SHIFT     16
> > -/* HC_SubA_HTXnL0Pit       0x002b
> > - */
> > -#define HC_HTXnLnPit_MASK       0x00003fff
> > -#define HC_HTXnEnPit_MASK       0x00080000
> > -#define HC_HTXnLnPitE_MASK      0x00f00000
> > -#define HC_HTXnLnPitE_SHIFT     20
> > -/* HC_SubA_HTXnL0_5WE      0x004b
> > - */
> > -#define HC_HTXnL0WE_MASK        0x0000000f
> > -#define HC_HTXnL1WE_MASK        0x000000f0
> > -#define HC_HTXnL2WE_MASK        0x00000f00
> > -#define HC_HTXnL3WE_MASK        0x0000f000
> > -#define HC_HTXnL4WE_MASK        0x000f0000
> > -#define HC_HTXnL5WE_MASK        0x00f00000
> > -#define HC_HTXnL1WE_SHIFT       4
> > -#define HC_HTXnL2WE_SHIFT       8
> > -#define HC_HTXnL3WE_SHIFT       12
> > -#define HC_HTXnL4WE_SHIFT       16
> > -#define HC_HTXnL5WE_SHIFT       20
> > -/* HC_SubA_HTXnL6_bWE      0x004c
> > - */
> > -#define HC_HTXnL6WE_MASK        0x0000000f
> > -#define HC_HTXnL7WE_MASK        0x000000f0
> > -#define HC_HTXnL8WE_MASK        0x00000f00
> > -#define HC_HTXnL9WE_MASK        0x0000f000
> > -#define HC_HTXnLaWE_MASK        0x000f0000
> > -#define HC_HTXnLbWE_MASK        0x00f00000
> > -#define HC_HTXnL7WE_SHIFT       4
> > -#define HC_HTXnL8WE_SHIFT       8
> > -#define HC_HTXnL9WE_SHIFT       12
> > -#define HC_HTXnLaWE_SHIFT       16
> > -#define HC_HTXnLbWE_SHIFT       20
> > -/* HC_SubA_HTXnLc_11WE      0x004d
> > - */
> > -#define HC_HTXnLcWE_MASK        0x0000000f
> > -#define HC_HTXnLdWE_MASK        0x000000f0
> > -#define HC_HTXnLeWE_MASK        0x00000f00
> > -#define HC_HTXnLfWE_MASK        0x0000f000
> > -#define HC_HTXnL10WE_MASK       0x000f0000
> > -#define HC_HTXnL11WE_MASK       0x00f00000
> > -#define HC_HTXnLdWE_SHIFT       4
> > -#define HC_HTXnLeWE_SHIFT       8
> > -#define HC_HTXnLfWE_SHIFT       12
> > -#define HC_HTXnL10WE_SHIFT      16
> > -#define HC_HTXnL11WE_SHIFT      20
> > -/* HC_SubA_HTXnL0_5HE      0x0051
> > - */
> > -#define HC_HTXnL0HE_MASK        0x0000000f
> > -#define HC_HTXnL1HE_MASK        0x000000f0
> > -#define HC_HTXnL2HE_MASK        0x00000f00
> > -#define HC_HTXnL3HE_MASK        0x0000f000
> > -#define HC_HTXnL4HE_MASK        0x000f0000
> > -#define HC_HTXnL5HE_MASK        0x00f00000
> > -#define HC_HTXnL1HE_SHIFT       4
> > -#define HC_HTXnL2HE_SHIFT       8
> > -#define HC_HTXnL3HE_SHIFT       12
> > -#define HC_HTXnL4HE_SHIFT       16
> > -#define HC_HTXnL5HE_SHIFT       20
> > -/* HC_SubA_HTXnL6_bHE      0x0052
> > - */
> > -#define HC_HTXnL6HE_MASK        0x0000000f
> > -#define HC_HTXnL7HE_MASK        0x000000f0
> > -#define HC_HTXnL8HE_MASK        0x00000f00
> > -#define HC_HTXnL9HE_MASK        0x0000f000
> > -#define HC_HTXnLaHE_MASK        0x000f0000
> > -#define HC_HTXnLbHE_MASK        0x00f00000
> > -#define HC_HTXnL7HE_SHIFT       4
> > -#define HC_HTXnL8HE_SHIFT       8
> > -#define HC_HTXnL9HE_SHIFT       12
> > -#define HC_HTXnLaHE_SHIFT       16
> > -#define HC_HTXnLbHE_SHIFT       20
> > -/* HC_SubA_HTXnLc_11HE      0x0053
> > - */
> > -#define HC_HTXnLcHE_MASK        0x0000000f
> > -#define HC_HTXnLdHE_MASK        0x000000f0
> > -#define HC_HTXnLeHE_MASK        0x00000f00
> > -#define HC_HTXnLfHE_MASK        0x0000f000
> > -#define HC_HTXnL10HE_MASK       0x000f0000
> > -#define HC_HTXnL11HE_MASK       0x00f00000
> > -#define HC_HTXnLdHE_SHIFT       4
> > -#define HC_HTXnLeHE_SHIFT       8
> > -#define HC_HTXnLfHE_SHIFT       12
> > -#define HC_HTXnL10HE_SHIFT      16
> > -#define HC_HTXnL11HE_SHIFT      20
> > -/* HC_SubA_HTXnL0OS        0x0077
> > - */
> > -#define HC_HTXnL0OS_MASK        0x003ff000
> > -#define HC_HTXnLVmax_MASK       0x00000fc0
> > -#define HC_HTXnLVmin_MASK       0x0000003f
> > -#define HC_HTXnL0OS_SHIFT       12
> > -#define HC_HTXnLVmax_SHIFT      6
> > -/* HC_SubA_HTXnTB          0x0078
> > - */
> > -#define HC_HTXnTB_MASK          0x00f00000
> > -#define HC_HTXnFLSe_MASK        0x0000e000
> > -#define HC_HTXnFLSs_MASK        0x00001c00
> > -#define HC_HTXnFLTe_MASK        0x00000380
> > -#define HC_HTXnFLTs_MASK        0x00000070
> > -#define HC_HTXnFLDs_MASK        0x0000000f
> > -#define HC_HTXnTB_NoTB          0x00000000
> > -#define HC_HTXnTB_TBC_S         0x00100000
> > -#define HC_HTXnTB_TBC_T         0x00200000
> > -#define HC_HTXnTB_TB_S          0x00400000
> > -#define HC_HTXnTB_TB_T          0x00800000
> > -#define HC_HTXnFLSe_Nearest     0x00000000
> > -#define HC_HTXnFLSe_Linear      0x00002000
> > -#define HC_HTXnFLSe_NonLinear   0x00004000
> > -#define HC_HTXnFLSe_Sharp       0x00008000
> > -#define HC_HTXnFLSe_Flat_Gaussian_Cubic 0x0000c000
> > -#define HC_HTXnFLSs_Nearest     0x00000000
> > -#define HC_HTXnFLSs_Linear      0x00000400
> > -#define HC_HTXnFLSs_NonLinear   0x00000800
> > -#define HC_HTXnFLSs_Flat_Gaussian_Cubic 0x00001800
> > -#define HC_HTXnFLTe_Nearest     0x00000000
> > -#define HC_HTXnFLTe_Linear      0x00000080
> > -#define HC_HTXnFLTe_NonLinear   0x00000100
> > -#define HC_HTXnFLTe_Sharp       0x00000180
> > -#define HC_HTXnFLTe_Flat_Gaussian_Cubic 0x00000300
> > -#define HC_HTXnFLTs_Nearest     0x00000000
> > -#define HC_HTXnFLTs_Linear      0x00000010
> > -#define HC_HTXnFLTs_NonLinear   0x00000020
> > -#define HC_HTXnFLTs_Flat_Gaussian_Cubic 0x00000060
> > -#define HC_HTXnFLDs_Tex0        0x00000000
> > -#define HC_HTXnFLDs_Nearest     0x00000001
> > -#define HC_HTXnFLDs_Linear      0x00000002
> > -#define HC_HTXnFLDs_NonLinear   0x00000003
> > -#define HC_HTXnFLDs_Dither      0x00000004
> > -#define HC_HTXnFLDs_ConstLOD    0x00000005
> > -#define HC_HTXnFLDs_Ani         0x00000006
> > -#define HC_HTXnFLDs_AniDither   0x00000007
> > -/* HC_SubA_HTXnMPMD        0x0079
> > - */
> > -#define HC_HTXnMPMD_SMASK       0x00070000
> > -#define HC_HTXnMPMD_TMASK       0x00380000
> > -#define HC_HTXnLODDTf_MASK      0x00000007
> > -#define HC_HTXnXY2ST_MASK       0x00000008
> > -#define HC_HTXnMPMD_Tsingle     0x00000000
> > -#define HC_HTXnMPMD_Tclamp      0x00080000
> > -#define HC_HTXnMPMD_Trepeat     0x00100000
> > -#define HC_HTXnMPMD_Tmirror     0x00180000
> > -#define HC_HTXnMPMD_Twrap       0x00200000
> > -#define HC_HTXnMPMD_Ssingle     0x00000000
> > -#define HC_HTXnMPMD_Sclamp      0x00010000
> > -#define HC_HTXnMPMD_Srepeat     0x00020000
> > -#define HC_HTXnMPMD_Smirror     0x00030000
> > -#define HC_HTXnMPMD_Swrap       0x00040000
> > -/* HC_SubA_HTXnCLODu       0x007a
> > - */
> > -#define HC_HTXnCLODu_MASK       0x000ffc00
> > -#define HC_HTXnCLODd_MASK       0x000003ff
> > -#define HC_HTXnCLODu_SHIFT      10
> > -/* HC_SubA_HTXnFM          0x007b
> > - */
> > -#define HC_HTXnFM_MASK          0x00ff0000
> > -#define HC_HTXnLoc_MASK         0x00000003
> > -#define HC_HTXnFM_INDEX         0x00000000
> > -#define HC_HTXnFM_Intensity     0x00080000
> > -#define HC_HTXnFM_Lum           0x00100000
> > -#define HC_HTXnFM_Alpha         0x00180000
> > -#define HC_HTXnFM_DX            0x00280000
> > -#define HC_HTXnFM_ARGB16        0x00880000
> > -#define HC_HTXnFM_ARGB32        0x00980000
> > -#define HC_HTXnFM_ABGR16        0x00a80000
> > -#define HC_HTXnFM_ABGR32        0x00b80000
> > -#define HC_HTXnFM_RGBA16        0x00c80000
> > -#define HC_HTXnFM_RGBA32        0x00d80000
> > -#define HC_HTXnFM_BGRA16        0x00e80000
> > -#define HC_HTXnFM_BGRA32        0x00f80000
> > -#define HC_HTXnFM_BUMPMAP       0x00380000
> > -#define HC_HTXnFM_Index1        (HC_HTXnFM_INDEX     | 0x00000000)
> > -#define HC_HTXnFM_Index2        (HC_HTXnFM_INDEX     | 0x00010000)
> > -#define HC_HTXnFM_Index4        (HC_HTXnFM_INDEX     | 0x00020000)
> > -#define HC_HTXnFM_Index8        (HC_HTXnFM_INDEX     | 0x00030000)
> > -#define HC_HTXnFM_T1            (HC_HTXnFM_Intensity | 0x00000000)
> > -#define HC_HTXnFM_T2            (HC_HTXnFM_Intensity | 0x00010000)
> > -#define HC_HTXnFM_T4            (HC_HTXnFM_Intensity | 0x00020000)
> > -#define HC_HTXnFM_T8            (HC_HTXnFM_Intensity | 0x00030000)
> > -#define HC_HTXnFM_L1            (HC_HTXnFM_Lum       | 0x00000000)
> > -#define HC_HTXnFM_L2            (HC_HTXnFM_Lum       | 0x00010000)
> > -#define HC_HTXnFM_L4            (HC_HTXnFM_Lum       | 0x00020000)
> > -#define HC_HTXnFM_L8            (HC_HTXnFM_Lum       | 0x00030000)
> > -#define HC_HTXnFM_AL44          (HC_HTXnFM_Lum       | 0x00040000)
> > -#define HC_HTXnFM_AL88          (HC_HTXnFM_Lum       | 0x00050000)
> > -#define HC_HTXnFM_A1            (HC_HTXnFM_Alpha     | 0x00000000)
> > -#define HC_HTXnFM_A2            (HC_HTXnFM_Alpha     | 0x00010000)
> > -#define HC_HTXnFM_A4            (HC_HTXnFM_Alpha     | 0x00020000)
> > -#define HC_HTXnFM_A8            (HC_HTXnFM_Alpha     | 0x00030000)
> > -#define HC_HTXnFM_DX1           (HC_HTXnFM_DX        | 0x00010000)
> > -#define HC_HTXnFM_DX23          (HC_HTXnFM_DX        | 0x00020000)
> > -#define HC_HTXnFM_DX45          (HC_HTXnFM_DX        | 0x00030000)
> > -#define HC_HTXnFM_RGB555        (HC_HTXnFM_ARGB16    | 0x00000000)
> > -#define HC_HTXnFM_RGB565        (HC_HTXnFM_ARGB16    | 0x00010000)
> > -#define HC_HTXnFM_ARGB1555      (HC_HTXnFM_ARGB16    | 0x00020000)
> > -#define HC_HTXnFM_ARGB4444      (HC_HTXnFM_ARGB16    | 0x00030000)
> > -#define HC_HTXnFM_ARGB0888      (HC_HTXnFM_ARGB32    | 0x00000000)
> > -#define HC_HTXnFM_ARGB8888      (HC_HTXnFM_ARGB32    | 0x00010000)
> > -#define HC_HTXnFM_BGR555        (HC_HTXnFM_ABGR16    | 0x00000000)
> > -#define HC_HTXnFM_BGR565        (HC_HTXnFM_ABGR16    | 0x00010000)
> > -#define HC_HTXnFM_ABGR1555      (HC_HTXnFM_ABGR16    | 0x00020000)
> > -#define HC_HTXnFM_ABGR4444      (HC_HTXnFM_ABGR16    | 0x00030000)
> > -#define HC_HTXnFM_ABGR0888      (HC_HTXnFM_ABGR32    | 0x00000000)
> > -#define HC_HTXnFM_ABGR8888      (HC_HTXnFM_ABGR32    | 0x00010000)
> > -#define HC_HTXnFM_RGBA5550      (HC_HTXnFM_RGBA16    | 0x00000000)
> > -#define HC_HTXnFM_RGBA5551      (HC_HTXnFM_RGBA16    | 0x00020000)
> > -#define HC_HTXnFM_RGBA4444      (HC_HTXnFM_RGBA16    | 0x00030000)
> > -#define HC_HTXnFM_RGBA8880      (HC_HTXnFM_RGBA32    | 0x00000000)
> > -#define HC_HTXnFM_RGBA8888      (HC_HTXnFM_RGBA32    | 0x00010000)
> > -#define HC_HTXnFM_BGRA5550      (HC_HTXnFM_BGRA16    | 0x00000000)
> > -#define HC_HTXnFM_BGRA5551      (HC_HTXnFM_BGRA16    | 0x00020000)
> > -#define HC_HTXnFM_BGRA4444      (HC_HTXnFM_BGRA16    | 0x00030000)
> > -#define HC_HTXnFM_BGRA8880      (HC_HTXnFM_BGRA32    | 0x00000000)
> > -#define HC_HTXnFM_BGRA8888      (HC_HTXnFM_BGRA32    | 0x00010000)
> > -#define HC_HTXnFM_VU88          (HC_HTXnFM_BUMPMAP   | 0x00000000)
> > -#define HC_HTXnFM_LVU655        (HC_HTXnFM_BUMPMAP   | 0x00010000)
> > -#define HC_HTXnFM_LVU888        (HC_HTXnFM_BUMPMAP   | 0x00020000)
> > -#define HC_HTXnLoc_Local        0x00000000
> > -#define HC_HTXnLoc_Sys          0x00000002
> > -#define HC_HTXnLoc_AGP          0x00000003
> > -/* HC_SubA_HTXnTRAH        0x007f
> > - */
> > -#define HC_HTXnTRAH_MASK        0x00ff0000
> > -#define HC_HTXnTRAL_MASK        0x0000ff00
> > -#define HC_HTXnTBA_MASK         0x000000ff
> > -#define HC_HTXnTRAH_SHIFT       16
> > -#define HC_HTXnTRAL_SHIFT       8
> > -/* HC_SubA_HTXnTBLCsat     0x0080
> > - *-- Define the input texture=2E
> > - */
> > -#define HC_XTC_TOPC             0x00000000
> > -#define HC_XTC_InvTOPC          0x00000010
> > -#define HC_XTC_TOPCp5           0x00000020
> > -#define HC_XTC_Cbias            0x00000000
> > -#define HC_XTC_InvCbias         0x00000010
> > -#define HC_XTC_0                0x00000000
> > -#define HC_XTC_Dif              0x00000001
> > -#define HC_XTC_Spec             0x00000002
> > -#define HC_XTC_Tex              0x00000003
> > -#define HC_XTC_Cur              0x00000004
> > -#define HC_XTC_Adif             0x00000005
> > -#define HC_XTC_Fog              0x00000006
> > -#define HC_XTC_Atex             0x00000007
> > -#define HC_XTC_Acur             0x00000008
> > -#define HC_XTC_HTXnTBLRC        0x00000009
> > -#define HC_XTC_Ctexnext         0x0000000a
> > -/*--
> > - */
> > -#define HC_HTXnTBLCsat_MASK     0x00800000
> > -#define HC_HTXnTBLCa_MASK       0x000fc000
> > -#define HC_HTXnTBLCb_MASK       0x00001f80
> > -#define HC_HTXnTBLCc_MASK       0x0000003f
> > -#define HC_HTXnTBLCa_TOPC       (HC_XTC_TOPC << 14)
> > -#define HC_HTXnTBLCa_InvTOPC    (HC_XTC_InvTOPC << 14)
> > -#define HC_HTXnTBLCa_TOPCp5     (HC_XTC_TOPCp5 << 14)
> > -#define HC_HTXnTBLCa_0          (HC_XTC_0 << 14)
> > -#define HC_HTXnTBLCa_Dif        (HC_XTC_Dif << 14)
> > -#define HC_HTXnTBLCa_Spec       (HC_XTC_Spec << 14)
> > -#define HC_HTXnTBLCa_Tex        (HC_XTC_Tex << 14)
> > -#define HC_HTXnTBLCa_Cur        (HC_XTC_Cur << 14)
> > -#define HC_HTXnTBLCa_Adif       (HC_XTC_Adif << 14)
> > -#define HC_HTXnTBLCa_Fog        (HC_XTC_Fog << 14)
> > -#define HC_HTXnTBLCa_Atex       (HC_XTC_Atex << 14)
> > -#define HC_HTXnTBLCa_Acur       (HC_XTC_Acur << 14)
> > -#define HC_HTXnTBLCa_HTXnTBLRC  (HC_XTC_HTXnTBLRC << 14)
> > -#define HC_HTXnTBLCa_Ctexnext   (HC_XTC_Ctexnext << 14)
> > -#define HC_HTXnTBLCb_TOPC       (HC_XTC_TOPC << 7)
> > -#define HC_HTXnTBLCb_InvTOPC    (HC_XTC_InvTOPC << 7)
> > -#define HC_HTXnTBLCb_TOPCp5     (HC_XTC_TOPCp5 << 7)
> > -#define HC_HTXnTBLCb_0          (HC_XTC_0 << 7)
> > -#define HC_HTXnTBLCb_Dif        (HC_XTC_Dif << 7)
> > -#define HC_HTXnTBLCb_Spec       (HC_XTC_Spec << 7)
> > -#define HC_HTXnTBLCb_Tex        (HC_XTC_Tex << 7)
> > -#define HC_HTXnTBLCb_Cur        (HC_XTC_Cur << 7)
> > -#define HC_HTXnTBLCb_Adif       (HC_XTC_Adif << 7)
> > -#define HC_HTXnTBLCb_Fog        (HC_XTC_Fog << 7)
> > -#define HC_HTXnTBLCb_Atex       (HC_XTC_Atex << 7)
> > -#define HC_HTXnTBLCb_Acur       (HC_XTC_Acur << 7)
> > -#define HC_HTXnTBLCb_HTXnTBLRC  (HC_XTC_HTXnTBLRC << 7)
> > -#define HC_HTXnTBLCb_Ctexnext   (HC_XTC_Ctexnext << 7)
> > -#define HC_HTXnTBLCc_TOPC       (HC_XTC_TOPC << 0)
> > -#define HC_HTXnTBLCc_InvTOPC    (HC_XTC_InvTOPC << 0)
> > -#define HC_HTXnTBLCc_TOPCp5     (HC_XTC_TOPCp5 << 0)
> > -#define HC_HTXnTBLCc_0          (HC_XTC_0 << 0)
> > -#define HC_HTXnTBLCc_Dif        (HC_XTC_Dif << 0)
> > -#define HC_HTXnTBLCc_Spec       (HC_XTC_Spec << 0)
> > -#define HC_HTXnTBLCc_Tex        (HC_XTC_Tex << 0)
> > -#define HC_HTXnTBLCc_Cur        (HC_XTC_Cur << 0)
> > -#define HC_HTXnTBLCc_Adif       (HC_XTC_Adif << 0)
> > -#define HC_HTXnTBLCc_Fog        (HC_XTC_Fog << 0)
> > -#define HC_HTXnTBLCc_Atex       (HC_XTC_Atex << 0)
> > -#define HC_HTXnTBLCc_Acur       (HC_XTC_Acur << 0)
> > -#define HC_HTXnTBLCc_HTXnTBLRC  (HC_XTC_HTXnTBLRC << 0)
> > -#define HC_HTXnTBLCc_Ctexnext   (HC_XTC_Ctexnext << 0)
> > -/* HC_SubA_HTXnTBLCop      0x0081
> > - */
> > -#define HC_HTXnTBLdot_MASK      0x00c00000
> > -#define HC_HTXnTBLCop_MASK      0x00380000
> > -#define HC_HTXnTBLCbias_MASK    0x0007c000
> > -#define HC_HTXnTBLCshift_MASK   0x00001800
> > -#define HC_HTXnTBLAop_MASK      0x00000380
> > -#define HC_HTXnTBLAbias_MASK    0x00000078
> > -#define HC_HTXnTBLAshift_MASK   0x00000003
> > -#define HC_HTXnTBLCop_Add       0x00000000
> > -#define HC_HTXnTBLCop_Sub       0x00080000
> > -#define HC_HTXnTBLCop_Min       0x00100000
> > -#define HC_HTXnTBLCop_Max       0x00180000
> > -#define HC_HTXnTBLCop_Mask      0x00200000
> > -#define HC_HTXnTBLCbias_Cbias           (HC_XTC_Cbias << 14)
> > -#define HC_HTXnTBLCbias_InvCbias        (HC_XTC_InvCbias << 14)
> > -#define HC_HTXnTBLCbias_0               (HC_XTC_0 << 14)
> > -#define HC_HTXnTBLCbias_Dif             (HC_XTC_Dif << 14)
> > -#define HC_HTXnTBLCbias_Spec            (HC_XTC_Spec << 14)
> > -#define HC_HTXnTBLCbias_Tex             (HC_XTC_Tex << 14)
> > -#define HC_HTXnTBLCbias_Cur             (HC_XTC_Cur << 14)
> > -#define HC_HTXnTBLCbias_Adif            (HC_XTC_Adif << 14)
> > -#define HC_HTXnTBLCbias_Fog             (HC_XTC_Fog << 14)
> > -#define HC_HTXnTBLCbias_Atex            (HC_XTC_Atex << 14)
> > -#define HC_HTXnTBLCbias_Acur            (HC_XTC_Acur << 14)
> > -#define HC_HTXnTBLCbias_HTXnTBLRC       (HC_XTC_HTXnTBLRC << 14)
> > -#define HC_HTXnTBLCshift_1      0x00000000
> > -#define HC_HTXnTBLCshift_2      0x00000800
> > -#define HC_HTXnTBLCshift_No     0x00001000
> > -#define HC_HTXnTBLCshift_DotP   0x00001800
> > -/*=3D* John Sheng [2003=2E7=2E18] texture combine *=3D*/
> > -#define HC_HTXnTBLDOT3   0x00080000
> > -#define HC_HTXnTBLDOT4   0x000C0000
> > -
> > -#define HC_HTXnTBLAop_Add       0x00000000
> > -#define HC_HTXnTBLAop_Sub       0x00000080
> > -#define HC_HTXnTBLAop_Min       0x00000100
> > -#define HC_HTXnTBLAop_Max       0x00000180
> > -#define HC_HTXnTBLAop_Mask      0x00000200
> > -#define HC_HTXnTBLAbias_Inv             0x00000040
> > -#define HC_HTXnTBLAbias_Adif            0x00000000
> > -#define HC_HTXnTBLAbias_Fog             0x00000008
> > -#define HC_HTXnTBLAbias_Acur            0x00000010
> > -#define HC_HTXnTBLAbias_HTXnTBLRAbias   0x00000018
> > -#define HC_HTXnTBLAbias_Atex            0x00000020
> > -#define HC_HTXnTBLAshift_1      0x00000000
> > -#define HC_HTXnTBLAshift_2      0x00000001
> > -#define HC_HTXnTBLAshift_No     0x00000002
> > -/* #define HC_HTXnTBLAshift_DotP   0x00000003 */
> > -/* HC_SubA_HTXnTBLMPFog    0x0082
> > - */
> > -#define HC_HTXnTBLMPfog_MASK    0x00e00000
> > -#define HC_HTXnTBLMPfog_0       0x00000000
> > -#define HC_HTXnTBLMPfog_Adif    0x00200000
> > -#define HC_HTXnTBLMPfog_Fog     0x00400000
> > -#define HC_HTXnTBLMPfog_Atex    0x00600000
> > -#define HC_HTXnTBLMPfog_Acur    0x00800000
> > -#define HC_HTXnTBLMPfog_GHTXnTBLRFog    0x00a00000
> > -/* HC_SubA_HTXnTBLAsat     0x0083
> > - *-- Define the texture alpha input=2E
> > - */
> > -#define HC_XTA_TOPA             0x00000000
> > -#define HC_XTA_InvTOPA          0x00000008
> > -#define HC_XTA_TOPAp5           0x00000010
> > -#define HC_XTA_Adif             0x00000000
> > -#define HC_XTA_Fog              0x00000001
> > -#define HC_XTA_Acur             0x00000002
> > -#define HC_XTA_HTXnTBLRA        0x00000003
> > -#define HC_XTA_Atex             0x00000004
> > -#define HC_XTA_Atexnext         0x00000005
> > -/*--
> > - */
> > -#define HC_HTXnTBLAsat_MASK     0x00800000
> > -#define HC_HTXnTBLAMB_MASK      0x00700000
> > -#define HC_HTXnTBLAa_MASK       0x0007c000
> > -#define HC_HTXnTBLAb_MASK       0x00000f80
> > -#define HC_HTXnTBLAc_MASK       0x0000001f
> > -#define HC_HTXnTBLAMB_SHIFT     20
> > -#define HC_HTXnTBLAa_TOPA       (HC_XTA_TOPA << 14)
> > -#define HC_HTXnTBLAa_InvTOPA    (HC_XTA_InvTOPA << 14)
> > -#define HC_HTXnTBLAa_TOPAp5     (HC_XTA_TOPAp5 << 14)
> > -#define HC_HTXnTBLAa_Adif       (HC_XTA_Adif << 14)
> > -#define HC_HTXnTBLAa_Fog        (HC_XTA_Fog << 14)
> > -#define HC_HTXnTBLAa_Acur       (HC_XTA_Acur << 14)
> > -#define HC_HTXnTBLAa_HTXnTBLRA  (HC_XTA_HTXnTBLRA << 14)
> > -#define HC_HTXnTBLAa_Atex       (HC_XTA_Atex << 14)
> > -#define HC_HTXnTBLAa_Atexnext   (HC_XTA_Atexnext << 14)
> > -#define HC_HTXnTBLAb_TOPA       (HC_XTA_TOPA << 7)
> > -#define HC_HTXnTBLAb_InvTOPA    (HC_XTA_InvTOPA << 7)
> > -#define HC_HTXnTBLAb_TOPAp5     (HC_XTA_TOPAp5 << 7)
> > -#define HC_HTXnTBLAb_Adif       (HC_XTA_Adif << 7)
> > -#define HC_HTXnTBLAb_Fog        (HC_XTA_Fog << 7)
> > -#define HC_HTXnTBLAb_Acur       (HC_XTA_Acur << 7)
> > -#define HC_HTXnTBLAb_HTXnTBLRA  (HC_XTA_HTXnTBLRA << 7)
> > -#define HC_HTXnTBLAb_Atex       (HC_XTA_Atex << 7)
> > -#define HC_HTXnTBLAb_Atexnext   (HC_XTA_Atexnext << 7)
> > -#define HC_HTXnTBLAc_TOPA       (HC_XTA_TOPA << 0)
> > -#define HC_HTXnTBLAc_InvTOPA    (HC_XTA_InvTOPA << 0)
> > -#define HC_HTXnTBLAc_TOPAp5     (HC_XTA_TOPAp5 << 0)
> > -#define HC_HTXnTBLAc_Adif       (HC_XTA_Adif << 0)
> > -#define HC_HTXnTBLAc_Fog        (HC_XTA_Fog << 0)
> > -#define HC_HTXnTBLAc_Acur       (HC_XTA_Acur << 0)
> > -#define HC_HTXnTBLAc_HTXnTBLRA  (HC_XTA_HTXnTBLRA << 0)
> > -#define HC_HTXnTBLAc_Atex       (HC_XTA_Atex << 0)
> > -#define HC_HTXnTBLAc_Atexnext   (HC_XTA_Atexnext << 0)
> > -/* HC_SubA_HTXnTBLRAa      0x0089
> > - */
> > -#define HC_HTXnTBLRAa_MASK      0x00ff0000
> > -#define HC_HTXnTBLRAb_MASK      0x0000ff00
> > -#define HC_HTXnTBLRAc_MASK      0x000000ff
> > -#define HC_HTXnTBLRAa_SHIFT     16
> > -#define HC_HTXnTBLRAb_SHIFT     8
> > -#define HC_HTXnTBLRAc_SHIFT     0
> > -/* HC_SubA_HTXnTBLRFog     0x008a
> > - */
> > -#define HC_HTXnTBLRFog_MASK     0x0000ff00
> > -#define HC_HTXnTBLRAbias_MASK   0x000000ff
> > -#define HC_HTXnTBLRFog_SHIFT    8
> > -#define HC_HTXnTBLRAbias_SHIFT  0
> > -/* HC_SubA_HTXnLScale      0x0094
> > - */
> > -#define HC_HTXnLScale_MASK      0x0007fc00
> > -#define HC_HTXnLOff_MASK        0x000001ff
> > -#define HC_HTXnLScale_SHIFT     10
> > -/* HC_SubA_HTXSMD          0x0000
> > - */
> > -#define HC_HTXSMD_MASK          0x00000080
> > -#define HC_HTXTMD_MASK          0x00000040
> > -#define HC_HTXNum_MASK          0x00000038
> > -#define HC_HTXTRMD_MASK         0x00000006
> > -#define HC_HTXCHCLR_MASK        0x00000001
> > -#define HC_HTXNum_SHIFT         3
> > -
> > -/* Texture Palette n
> > - */
> > -#define HC_SubType_TexPalette0  0x00000000
> > -#define HC_SubType_TexPalette1  0x00000001
> > -#define HC_SubType_FogTable     0x00000010
> > -#define HC_SubType_Stipple      0x00000014
> > -/* HC_SubA_TexPalette0     0x0000
> > - */
> > -#define HC_HTPnA_MASK           0xff000000
> > -#define HC_HTPnR_MASK           0x00ff0000
> > -#define HC_HTPnG_MASK           0x0000ff00
> > -#define HC_HTPnB_MASK           0x000000ff
> > -/* HC_SubA_FogTable        0x0010
> > - */
> > -#define HC_HFPn3_MASK           0xff000000
> > -#define HC_HFPn2_MASK           0x00ff0000
> > -#define HC_HFPn1_MASK           0x0000ff00
> > -#define HC_HFPn_MASK            0x000000ff
> > -#define HC_HFPn3_SHIFT          24
> > -#define HC_HFPn2_SHIFT          16
> > -#define HC_HFPn1_SHIFT          8
> > -
> > -/* Auto Testing & Security
> > - */
> > -#define HC_SubA_HenFIFOAT       0x0000
> > -#define HC_SubA_HFBDrawFirst    0x0004
> > -#define HC_SubA_HFBBasL         0x0005
> > -#define HC_SubA_HFBDst          0x0006
> > -/* HC_SubA_HenFIFOAT       0x0000
> > - */
> > -#define HC_HenFIFOAT_MASK       0x00000020
> > -#define HC_HenGEMILock_MASK     0x00000010
> > -#define HC_HenFBASwap_MASK      0x00000008
> > -#define HC_HenOT_MASK           0x00000004
> > -#define HC_HenCMDQ_MASK         0x00000002
> > -#define HC_HenTXCTSU_MASK       0x00000001
> > -/* HC_SubA_HFBDrawFirst    0x0004
> > - */
> > -#define HC_HFBDrawFirst_MASK    0x00000800
> > -#define HC_HFBQueue_MASK        0x00000400
> > -#define HC_HFBLock_MASK         0x00000200
> > -#define HC_HEOF_MASK            0x00000100
> > -#define HC_HFBBasH_MASK         0x000000ff
> > -
> > -/* GEMI Setting
> > - */
> > -#define HC_SubA_HTArbRCM        0x0008
> > -#define HC_SubA_HTArbRZ         0x000a
> > -#define HC_SubA_HTArbWZ         0x000b
> > -#define HC_SubA_HTArbRTX        0x000c
> > -#define HC_SubA_HTArbRCW        0x000d
> > -#define HC_SubA_HTArbE2         0x000e
> > -#define HC_SubA_HArbRQCM        0x0010
> > -#define HC_SubA_HArbWQCM        0x0011
> > -#define HC_SubA_HGEMITout       0x0020
> > -#define HC_SubA_HFthRTXD        0x0040
> > -#define HC_SubA_HFthRTXA        0x0044
> > -#define HC_SubA_HCMDQstL        0x0050
> > -#define HC_SubA_HCMDQendL       0x0051
> > -#define HC_SubA_HCMDQLen        0x0052
> > -/* HC_SubA_HTArbRCM        0x0008
> > - */
> > -#define HC_HTArbRCM_MASK        0x0000ffff
> > -/* HC_SubA_HTArbRZ         0x000a
> > - */
> > -#define HC_HTArbRZ_MASK         0x0000ffff
> > -/* HC_SubA_HTArbWZ         0x000b
> > - */
> > -#define HC_HTArbWZ_MASK         0x0000ffff
> > -/* HC_SubA_HTArbRTX        0x000c
> > - */
> > -#define HC_HTArbRTX_MASK        0x0000ffff
> > -/* HC_SubA_HTArbRCW        0x000d
> > - */
> > -#define HC_HTArbRCW_MASK        0x0000ffff
> > -/* HC_SubA_HTArbE2         0x000e
> > - */
> > -#define HC_HTArbE2_MASK         0x0000ffff
> > -/* HC_SubA_HArbRQCM        0x0010
> > - */
> > -#define HC_HTArbRQCM_MASK       0x0000ffff
> > -/* HC_SubA_HArbWQCM        0x0011
> > - */
> > -#define HC_HArbWQCM_MASK        0x0000ffff
> > -/* HC_SubA_HGEMITout       0x0020
> > - */
> > -#define HC_HGEMITout_MASK       0x000f0000
> > -#define HC_HNPArbZC_MASK        0x0000ffff
> > -#define HC_HGEMITout_SHIFT      16
> > -/* HC_SubA_HFthRTXD        0x0040
> > - */
> > -#define HC_HFthRTXD_MASK        0x00ff0000
> > -#define HC_HFthRZD_MASK         0x0000ff00
> > -#define HC_HFthWZD_MASK         0x000000ff
> > -#define HC_HFthRTXD_SHIFT       16
> > -#define HC_HFthRZD_SHIFT        8
> > -/* HC_SubA_HFthRTXA        0x0044
> > - */
> > -#define HC_HFthRTXA_MASK        0x000000ff
> > -
> > -/********************************************************************=
**********
> > -** Define the Halcyon Internal register access constants=2E For simul=
ator only=2E
> > -*********************************************************************=
*********/
> > -#define HC_SIMA_HAGPBstL        0x0000
> > -#define HC_SIMA_HAGPBendL       0x0001
> > -#define HC_SIMA_HAGPCMNT        0x0002
> > -#define HC_SIMA_HAGPBpL         0x0003
> > -#define HC_SIMA_HAGPBpH         0x0004
> > -#define HC_SIMA_HClipTB         0x0005
> > -#define HC_SIMA_HClipLR         0x0006
> > -#define HC_SIMA_HFPClipTL       0x0007
> > -#define HC_SIMA_HFPClipBL       0x0008
> > -#define HC_SIMA_HFPClipLL       0x0009
> > -#define HC_SIMA_HFPClipRL       0x000a
> > -#define HC_SIMA_HFPClipTBH      0x000b
> > -#define HC_SIMA_HFPClipLRH      0x000c
> > -#define HC_SIMA_HLP             0x000d
> > -#define HC_SIMA_HLPRF           0x000e
> > -#define HC_SIMA_HSolidCL        0x000f
> > -#define HC_SIMA_HPixGC          0x0010
> > -#define HC_SIMA_HSPXYOS         0x0011
> > -#define HC_SIMA_HCmdA           0x0012
> > -#define HC_SIMA_HCmdB           0x0013
> > -#define HC_SIMA_HEnable         0x0014
> > -#define HC_SIMA_HZWBBasL        0x0015
> > -#define HC_SIMA_HZWBBasH        0x0016
> > -#define HC_SIMA_HZWBType        0x0017
> > -#define HC_SIMA_HZBiasL         0x0018
> > -#define HC_SIMA_HZWBend         0x0019
> > -#define HC_SIMA_HZWTMD          0x001a
> > -#define HC_SIMA_HZWCDL          0x001b
> > -#define HC_SIMA_HZWCTAGnum      0x001c
> > -#define HC_SIMA_HZCYNum         0x001d
> > -#define HC_SIMA_HZWCFire        0x001e
> > -/* #define HC_SIMA_HSBBasL         0x001d */
> > -/* #define HC_SIMA_HSBBasH         0x001e */
> > -/* #define HC_SIMA_HSBFM           0x001f */
> > -#define HC_SIMA_HSTREF          0x0020
> > -#define HC_SIMA_HSTMD           0x0021
> > -#define HC_SIMA_HABBasL         0x0022
> > -#define HC_SIMA_HABBasH         0x0023
> > -#define HC_SIMA_HABFM           0x0024
> > -#define HC_SIMA_HATMD           0x0025
> > -#define HC_SIMA_HABLCsat        0x0026
> > -#define HC_SIMA_HABLCop         0x0027
> > -#define HC_SIMA_HABLAsat        0x0028
> > -#define HC_SIMA_HABLAop         0x0029
> > -#define HC_SIMA_HABLRCa         0x002a
> > -#define HC_SIMA_HABLRFCa        0x002b
> > -#define HC_SIMA_HABLRCbias      0x002c
> > -#define HC_SIMA_HABLRCb         0x002d
> > -#define HC_SIMA_HABLRFCb        0x002e
> > -#define HC_SIMA_HABLRAa         0x002f
> > -#define HC_SIMA_HABLRAb         0x0030
> > -#define HC_SIMA_HDBBasL         0x0031
> > -#define HC_SIMA_HDBBasH         0x0032
> > -#define HC_SIMA_HDBFM           0x0033
> > -#define HC_SIMA_HFBBMSKL        0x0034
> > -#define HC_SIMA_HROP            0x0035
> > -#define HC_SIMA_HFogLF          0x0036
> > -#define HC_SIMA_HFogCL          0x0037
> > -#define HC_SIMA_HFogCH          0x0038
> > -#define HC_SIMA_HFogStL         0x0039
> > -#define HC_SIMA_HFogStH         0x003a
> > -#define HC_SIMA_HFogOOdMF       0x003b
> > -#define HC_SIMA_HFogOOdEF       0x003c
> > -#define HC_SIMA_HFogEndL        0x003d
> > -#define HC_SIMA_HFogDenst       0x003e
> > -/*---- start of texture 0 setting ----
> > - */
> > -#define HC_SIMA_HTX0L0BasL      0x0040
> > -#define HC_SIMA_HTX0L1BasL      0x0041
> > -#define HC_SIMA_HTX0L2BasL      0x0042
> > -#define HC_SIMA_HTX0L3BasL      0x0043
> > -#define HC_SIMA_HTX0L4BasL      0x0044
> > -#define HC_SIMA_HTX0L5BasL      0x0045
> > -#define HC_SIMA_HTX0L6BasL      0x0046
> > -#define HC_SIMA_HTX0L7BasL      0x0047
> > -#define HC_SIMA_HTX0L8BasL      0x0048
> > -#define HC_SIMA_HTX0L9BasL      0x0049
> > -#define HC_SIMA_HTX0LaBasL      0x004a
> > -#define HC_SIMA_HTX0LbBasL      0x004b
> > -#define HC_SIMA_HTX0LcBasL      0x004c
> > -#define HC_SIMA_HTX0LdBasL      0x004d
> > -#define HC_SIMA_HTX0LeBasL      0x004e
> > -#define HC_SIMA_HTX0LfBasL      0x004f
> > -#define HC_SIMA_HTX0L10BasL     0x0050
> > -#define HC_SIMA_HTX0L11BasL     0x0051
> > -#define HC_SIMA_HTX0L012BasH    0x0052
> > -#define HC_SIMA_HTX0L345BasH    0x0053
> > -#define HC_SIMA_HTX0L678BasH    0x0054
> > -#define HC_SIMA_HTX0L9abBasH    0x0055
> > -#define HC_SIMA_HTX0LcdeBasH    0x0056
> > -#define HC_SIMA_HTX0Lf1011BasH  0x0057
> > -#define HC_SIMA_HTX0L0Pit       0x0058
> > -#define HC_SIMA_HTX0L1Pit       0x0059
> > -#define HC_SIMA_HTX0L2Pit       0x005a
> > -#define HC_SIMA_HTX0L3Pit       0x005b
> > -#define HC_SIMA_HTX0L4Pit       0x005c
> > -#define HC_SIMA_HTX0L5Pit       0x005d
> > -#define HC_SIMA_HTX0L6Pit       0x005e
> > -#define HC_SIMA_HTX0L7Pit       0x005f
> > -#define HC_SIMA_HTX0L8Pit       0x0060
> > -#define HC_SIMA_HTX0L9Pit       0x0061
> > -#define HC_SIMA_HTX0LaPit       0x0062
> > -#define HC_SIMA_HTX0LbPit       0x0063
> > -#define HC_SIMA_HTX0LcPit       0x0064
> > -#define HC_SIMA_HTX0LdPit       0x0065
> > -#define HC_SIMA_HTX0LePit       0x0066
> > -#define HC_SIMA_HTX0LfPit       0x0067
> > -#define HC_SIMA_HTX0L10Pit      0x0068
> > -#define HC_SIMA_HTX0L11Pit      0x0069
> > -#define HC_SIMA_HTX0L0_5WE      0x006a
> > -#define HC_SIMA_HTX0L6_bWE      0x006b
> > -#define HC_SIMA_HTX0Lc_11WE     0x006c
> > -#define HC_SIMA_HTX0L0_5HE      0x006d
> > -#define HC_SIMA_HTX0L6_bHE      0x006e
> > -#define HC_SIMA_HTX0Lc_11HE     0x006f
> > -#define HC_SIMA_HTX0L0OS        0x0070
> > -#define HC_SIMA_HTX0TB          0x0071
> > -#define HC_SIMA_HTX0MPMD        0x0072
> > -#define HC_SIMA_HTX0CLODu       0x0073
> > -#define HC_SIMA_HTX0FM          0x0074
> > -#define HC_SIMA_HTX0TRCH        0x0075
> > -#define HC_SIMA_HTX0TRCL        0x0076
> > -#define HC_SIMA_HTX0TBC         0x0077
> > -#define HC_SIMA_HTX0TRAH        0x0078
> > -#define HC_SIMA_HTX0TBLCsat     0x0079
> > -#define HC_SIMA_HTX0TBLCop      0x007a
> > -#define HC_SIMA_HTX0TBLMPfog    0x007b
> > -#define HC_SIMA_HTX0TBLAsat     0x007c
> > -#define HC_SIMA_HTX0TBLRCa      0x007d
> > -#define HC_SIMA_HTX0TBLRCb      0x007e
> > -#define HC_SIMA_HTX0TBLRCc      0x007f
> > -#define HC_SIMA_HTX0TBLRCbias   0x0080
> > -#define HC_SIMA_HTX0TBLRAa      0x0081
> > -#define HC_SIMA_HTX0TBLRFog     0x0082
> > -#define HC_SIMA_HTX0BumpM00     0x0083
> > -#define HC_SIMA_HTX0BumpM01     0x0084
> > -#define HC_SIMA_HTX0BumpM10     0x0085
> > -#define HC_SIMA_HTX0BumpM11     0x0086
> > -#define HC_SIMA_HTX0LScale      0x0087
> > -/*---- end of texture 0 setting ----      0x008f
> > - */
> > -#define HC_SIMA_TX0TX1_OFF      0x0050
> > -/*---- start of texture 1 setting ----
> > - */
> > -#define HC_SIMA_HTX1L0BasL      (HC_SIMA_HTX0L0BasL + HC_SIMA_TX0TX1_=
OFF)
> > -#define HC_SIMA_HTX1L1BasL      (HC_SIMA_HTX0L1BasL + HC_SIMA_TX0TX1_=
OFF)
> > -#define HC_SIMA_HTX1L2BasL      (HC_SIMA_HTX0L2BasL + HC_SIMA_TX0TX1_=
OFF)
> > -#define HC_SIMA_HTX1L3BasL      (HC_SIMA_HTX0L3BasL + HC_SIMA_TX0TX1_=
OFF)
> > -#define HC_SIMA_HTX1L4BasL      (HC_SIMA_HTX0L4BasL + HC_SIMA_TX0TX1_=
OFF)
> > -#define HC_SIMA_HTX1L5BasL      (HC_SIMA_HTX0L5BasL + HC_SIMA_TX0TX1_=
OFF)
> > -#define HC_SIMA_HTX1L6BasL      (HC_SIMA_HTX0L6BasL + HC_SIMA_TX0TX1_=
OFF)
> > -#define HC_SIMA_HTX1L7BasL      (HC_SIMA_HTX0L7BasL + HC_SIMA_TX0TX1_=
OFF)
> > -#define HC_SIMA_HTX1L8BasL      (HC_SIMA_HTX0L8BasL + HC_SIMA_TX0TX1_=
OFF)
> > -#define HC_SIMA_HTX1L9BasL      (HC_SIMA_HTX0L9BasL + HC_SIMA_TX0TX1_=
OFF)
> > -#define HC_SIMA_HTX1LaBasL      (HC_SIMA_HTX0LaBasL + HC_SIMA_TX0TX1_=
OFF)
> > -#define HC_SIMA_HTX1LbBasL      (HC_SIMA_HTX0LbBasL + HC_SIMA_TX0TX1_=
OFF)
> > -#define HC_SIMA_HTX1LcBasL      (HC_SIMA_HTX0LcBasL + HC_SIMA_TX0TX1_=
OFF)
> > -#define HC_SIMA_HTX1LdBasL      (HC_SIMA_HTX0LdBasL + HC_SIMA_TX0TX1_=
OFF)
> > -#define HC_SIMA_HTX1LeBasL      (HC_SIMA_HTX0LeBasL + HC_SIMA_TX0TX1_=
OFF)
> > -#define HC_SIMA_HTX1LfBasL      (HC_SIMA_HTX0LfBasL + HC_SIMA_TX0TX1_=
OFF)
> > -#define HC_SIMA_HTX1L10BasL     (HC_SIMA_HTX0L10BasL + HC_SIMA_TX0TX1=
_OFF)
> > -#define HC_SIMA_HTX1L11BasL     (HC_SIMA_HTX0L11BasL + HC_SIMA_TX0TX1=
_OFF)
> > -#define HC_SIMA_HTX1L012BasH    (HC_SIMA_HTX0L012BasH + HC_SIMA_TX0TX=
1_OFF)
> > -#define HC_SIMA_HTX1L345BasH    (HC_SIMA_HTX0L345BasH + HC_SIMA_TX0TX=
1_OFF)
> > -#define HC_SIMA_HTX1L678BasH    (HC_SIMA_HTX0L678BasH + HC_SIMA_TX0TX=
1_OFF)
> > -#define HC_SIMA_HTX1L9abBasH    (HC_SIMA_HTX0L9abBasH + HC_SIMA_TX0TX=
1_OFF)
> > -#define HC_SIMA_HTX1LcdeBasH    (HC_SIMA_HTX0LcdeBasH + HC_SIMA_TX0TX=
1_OFF)
> > -#define HC_SIMA_HTX1Lf1011BasH  (HC_SIMA_HTX0Lf1011BasH + HC_SIMA_TX0=
TX1_OFF)
> > -#define HC_SIMA_HTX1L0Pit       (HC_SIMA_HTX0L0Pit + HC_SIMA_TX0TX1_O=
FF)
> > -#define HC_SIMA_HTX1L1Pit       (HC_SIMA_HTX0L1Pit + HC_SIMA_TX0TX1_O=
FF)
> > -#define HC_SIMA_HTX1L2Pit       (HC_SIMA_HTX0L2Pit + HC_SIMA_TX0TX1_O=
FF)
> > -#define HC_SIMA_HTX1L3Pit       (HC_SIMA_HTX0L3Pit + HC_SIMA_TX0TX1_O=
FF)
> > -#define HC_SIMA_HTX1L4Pit       (HC_SIMA_HTX0L4Pit + HC_SIMA_TX0TX1_O=
FF)
> > -#define HC_SIMA_HTX1L5Pit       (HC_SIMA_HTX0L5Pit + HC_SIMA_TX0TX1_O=
FF)
> > -#define HC_SIMA_HTX1L6Pit       (HC_SIMA_HTX0L6Pit + HC_SIMA_TX0TX1_O=
FF)
> > -#define HC_SIMA_HTX1L7Pit       (HC_SIMA_HTX0L7Pit + HC_SIMA_TX0TX1_O=
FF)
> > -#define HC_SIMA_HTX1L8Pit       (HC_SIMA_HTX0L8Pit + HC_SIMA_TX0TX1_O=
FF)
> > -#define HC_SIMA_HTX1L9Pit       (HC_SIMA_HTX0L9Pit + HC_SIMA_TX0TX1_O=
FF)
> > -#define HC_SIMA_HTX1LaPit       (HC_SIMA_HTX0LaPit + HC_SIMA_TX0TX1_O=
FF)
> > -#define HC_SIMA_HTX1LbPit       (HC_SIMA_HTX0LbPit + HC_SIMA_TX0TX1_O=
FF)
> > -#define HC_SIMA_HTX1LcPit       (HC_SIMA_HTX0LcPit + HC_SIMA_TX0TX1_O=
FF)
> > -#define HC_SIMA_HTX1LdPit       (HC_SIMA_HTX0LdPit + HC_SIMA_TX0TX1_O=
FF)
> > -#define HC_SIMA_HTX1LePit       (HC_SIMA_HTX0LePit + HC_SIMA_TX0TX1_O=
FF)
> > -#define HC_SIMA_HTX1LfPit       (HC_SIMA_HTX0LfPit + HC_SIMA_TX0TX1_O=
FF)
> > -#define HC_SIMA_HTX1L10Pit      (HC_SIMA_HTX0L10Pit + HC_SIMA_TX0TX1_=
OFF)
> > -#define HC_SIMA_HTX1L11Pit      (HC_SIMA_HTX0L11Pit + HC_SIMA_TX0TX1_=
OFF)
> > -#define HC_SIMA_HTX1L0_5WE      (HC_SIMA_HTX0L0_5WE + HC_SIMA_TX0TX1_=
OFF)
> > -#define HC_SIMA_HTX1L6_bWE      (HC_SIMA_HTX0L6_bWE + HC_SIMA_TX0TX1_=
OFF)
> > -#define HC_SIMA_HTX1Lc_11WE     (HC_SIMA_HTX0Lc_11WE + HC_SIMA_TX0TX1=
_OFF)
> > -#define HC_SIMA_HTX1L0_5HE      (HC_SIMA_HTX0L0_5HE + HC_SIMA_TX0TX1_=
OFF)
> > -#define HC_SIMA_HTX1L6_bHE      (HC_SIMA_HTX0L6_bHE + HC_SIMA_TX0TX1_=
OFF)
> > -#define HC_SIMA_HTX1Lc_11HE      (HC_SIMA_HTX0Lc_11HE + HC_SIMA_TX0TX=
1_OFF)
> > -#define HC_SIMA_HTX1L0OS        (HC_SIMA_HTX0L0OS + HC_SIMA_TX0TX1_OF=
F)
> > -#define HC_SIMA_HTX1TB          (HC_SIMA_HTX0TB + HC_SIMA_TX0TX1_OFF)
> > -#define HC_SIMA_HTX1MPMD        (HC_SIMA_HTX0MPMD + HC_SIMA_TX0TX1_OF=
F)
> > -#define HC_SIMA_HTX1CLODu       (HC_SIMA_HTX0CLODu + HC_SIMA_TX0TX1_O=
FF)
> > -#define HC_SIMA_HTX1FM          (HC_SIMA_HTX0FM + HC_SIMA_TX0TX1_OFF)
> > -#define HC_SIMA_HTX1TRCH        (HC_SIMA_HTX0TRCH + HC_SIMA_TX0TX1_OF=
F)
> > -#define HC_SIMA_HTX1TRCL        (HC_SIMA_HTX0TRCL + HC_SIMA_TX0TX1_OF=
F)
> > -#define HC_SIMA_HTX1TBC         (HC_SIMA_HTX0TBC + HC_SIMA_TX0TX1_OFF=
)
> > -#define HC_SIMA_HTX1TRAH        (HC_SIMA_HTX0TRAH + HC_SIMA_TX0TX1_OF=
F)
> > -#define HC_SIMA_HTX1LTC         (HC_SIMA_HTX0LTC + HC_SIMA_TX0TX1_OFF=
)
> > -#define HC_SIMA_HTX1LTA         (HC_SIMA_HTX0LTA + HC_SIMA_TX0TX1_OFF=
)
> > -#define HC_SIMA_HTX1TBLCsat     (HC_SIMA_HTX0TBLCsat + HC_SIMA_TX0TX1=
_OFF)
> > -#define HC_SIMA_HTX1TBLCop      (HC_SIMA_HTX0TBLCop + HC_SIMA_TX0TX1_=
OFF)
> > -#define HC_SIMA_HTX1TBLMPfog    (HC_SIMA_HTX0TBLMPfog + HC_SIMA_TX0TX=
1_OFF)
> > -#define HC_SIMA_HTX1TBLAsat     (HC_SIMA_HTX0TBLAsat + HC_SIMA_TX0TX1=
_OFF)
> > -#define HC_SIMA_HTX1TBLRCa      (HC_SIMA_HTX0TBLRCa + HC_SIMA_TX0TX1_=
OFF)
> > -#define HC_SIMA_HTX1TBLRCb      (HC_SIMA_HTX0TBLRCb + HC_SIMA_TX0TX1_=
OFF)
> > -#define HC_SIMA_HTX1TBLRCc      (HC_SIMA_HTX0TBLRCc + HC_SIMA_TX0TX1_=
OFF)
> > -#define HC_SIMA_HTX1TBLRCbias   (HC_SIMA_HTX0TBLRCbias + HC_SIMA_TX0T=
X1_OFF)
> > -#define HC_SIMA_HTX1TBLRAa      (HC_SIMA_HTX0TBLRAa + HC_SIMA_TX0TX1_=
OFF)
> > -#define HC_SIMA_HTX1TBLRFog     (HC_SIMA_HTX0TBLRFog + HC_SIMA_TX0TX1=
_OFF)
> > -#define HC_SIMA_HTX1BumpM00     (HC_SIMA_HTX0BumpM00 + HC_SIMA_TX0TX1=
_OFF)
> > -#define HC_SIMA_HTX1BumpM01     (HC_SIMA_HTX0BumpM01 + HC_SIMA_TX0TX1=
_OFF)
> > -#define HC_SIMA_HTX1BumpM10     (HC_SIMA_HTX0BumpM10 + HC_SIMA_TX0TX1=
_OFF)
> > -#define HC_SIMA_HTX1BumpM11     (HC_SIMA_HTX0BumpM11 + HC_SIMA_TX0TX1=
_OFF)
> > -#define HC_SIMA_HTX1LScale      (HC_SIMA_HTX0LScale + HC_SIMA_TX0TX1_=
OFF)
> > -/*---- end of texture 1 setting ---- 0xaf
> > - */
> > -#define HC_SIMA_HTXSMD          0x00b0
> > -#define HC_SIMA_HenFIFOAT       0x00b1
> > -#define HC_SIMA_HFBDrawFirst    0x00b2
> > -#define HC_SIMA_HFBBasL         0x00b3
> > -#define HC_SIMA_HTArbRCM        0x00b4
> > -#define HC_SIMA_HTArbRZ         0x00b5
> > -#define HC_SIMA_HTArbWZ         0x00b6
> > -#define HC_SIMA_HTArbRTX        0x00b7
> > -#define HC_SIMA_HTArbRCW        0x00b8
> > -#define HC_SIMA_HTArbE2         0x00b9
> > -#define HC_SIMA_HGEMITout       0x00ba
> > -#define HC_SIMA_HFthRTXD        0x00bb
> > -#define HC_SIMA_HFthRTXA        0x00bc
> > -/* Define the texture palette 0
> > - */
> > -#define HC_SIMA_HTP0            0x0100
> > -#define HC_SIMA_HTP1            0x0200
> > -#define HC_SIMA_FOGTABLE        0x0300
> > -#define HC_SIMA_STIPPLE         0x0400
> > -#define HC_SIMA_HE3Fire         0x0440
> > -#define HC_SIMA_TRANS_SET       0x0441
> > -#define HC_SIMA_HREngSt         0x0442
> > -#define HC_SIMA_HRFIFOempty     0x0443
> > -#define HC_SIMA_HRFIFOfull      0x0444
> > -#define HC_SIMA_HRErr           0x0445
> > -#define HC_SIMA_FIFOstatus      0x0446
> > -
> > -/********************************************************************=
**********
> > -** Define the AGP command header=2E
> > -*********************************************************************=
*********/
> > -#define HC_ACMD_MASK            0xfe000000
> > -#define HC_ACMD_SUB_MASK        0x0c000000
> > -#define HC_ACMD_HCmdA           0xee000000
> > -#define HC_ACMD_HCmdB           0xec000000
> > -#define HC_ACMD_HCmdC           0xea000000
> > -#define HC_ACMD_H1              0xf0000000
> > -#define HC_ACMD_H2              0xf2000000
> > -#define HC_ACMD_H3              0xf4000000
> > -#define HC_ACMD_H4              0xf6000000
> > -
> > -#define HC_ACMD_H1IO_MASK       0x000001ff
> > -#define HC_ACMD_H2IO1_MASK      0x001ff000
> > -#define HC_ACMD_H2IO2_MASK      0x000001ff
> > -#define HC_ACMD_H2IO1_SHIFT     12
> > -#define HC_ACMD_H2IO2_SHIFT     0
> > -#define HC_ACMD_H3IO_MASK       0x000001ff
> > -#define HC_ACMD_H3COUNT_MASK    0x01fff000
> > -#define HC_ACMD_H3COUNT_SHIFT   12
> > -#define HC_ACMD_H4ID_MASK       0x000001ff
> > -#define HC_ACMD_H4COUNT_MASK    0x01fffe00
> > -#define HC_ACMD_H4COUNT_SHIFT   9
> > -
> > -/********************************************************************=
************
> > -** Define Header
> > -*********************************************************************=
***********/
> > -#define HC_HEADER2		0xF210F110
> > -
> > -/********************************************************************=
************
> > -** Define Dummy Value
> > -*********************************************************************=
***********/
> > -#define HC_DUMMY		0xCCCCCCCC
> > -/********************************************************************=
************
> > -** Define for DMA use
> > -*********************************************************************=
***********/
> > -#define HALCYON_HEADER2     0XF210F110
> > -#define HALCYON_FIRECMD     0XEE100000
> > -#define HALCYON_FIREMASK    0XFFF00000
> > -#define HALCYON_CMDB        0XEC000000
> > -#define HALCYON_CMDBMASK    0XFFFE0000
> > -#define HALCYON_SUB_ADDR0   0X00000000
> > -#define HALCYON_HEADER1MASK 0XFFFFFC00
> > -#define HALCYON_HEADER1     0XF0000000
> > -#define HC_SubA_HAGPBstL        0x0060
> > -#define HC_SubA_HAGPBendL       0x0061
> > -#define HC_SubA_HAGPCMNT        0x0062
> > -#define HC_SubA_HAGPBpL         0x0063
> > -#define HC_SubA_HAGPBpH         0x0064
> > -#define HC_HAGPCMNT_MASK        0x00800000
> > -#define HC_HCmdErrClr_MASK      0x00400000
> > -#define HC_HAGPBendH_MASK       0x0000ff00
> > -#define HC_HAGPBstH_MASK        0x000000ff
> > -#define HC_HAGPBendH_SHIFT      8
> > -#define HC_HAGPBstH_SHIFT       0
> > -#define HC_HAGPBpL_MASK         0x00fffffc
> > -#define HC_HAGPBpID_MASK        0x00000003
> > -#define HC_HAGPBpID_PAUSE       0x00000000
> > -#define HC_HAGPBpID_JUMP        0x00000001
> > -#define HC_HAGPBpID_STOP        0x00000002
> > -#define HC_HAGPBpH_MASK         0x00ffffff
> > -
> > -#define VIA_VIDEO_HEADER5       0xFE040000
> > -#define VIA_VIDEO_HEADER6       0xFE050000
> > -#define VIA_VIDEO_HEADER7       0xFE060000
> > -#define VIA_VIDEOMASK           0xFFFF0000
> > -#endif
> > diff --git a/drivers/gpu/drm/via/via_dma=2Ec b/drivers/gpu/drm/via/via=
_dma=2Ec
> > deleted file mode 100644
> > index 177b0499abf1=2E=2E000000000000
> > --- a/drivers/gpu/drm/via/via_dma=2Ec
> > +++ /dev/null
> > @@ -1,744 +0,0 @@
> > -/* via_dma=2Ec -- DMA support for the VIA Unichrome/Pro
> > - *
> > - * Copyright 2003 Tungsten Graphics, Inc=2E, Cedar Park, Texas=2E
> > - * All Rights Reserved=2E
> > - *
> > - * Copyright 2004 Digeo, Inc=2E, Palo Alto, CA, U=2ES=2EA=2E
> > - * All Rights Reserved=2E
> > - *
> > - * Copyright 2004 The Unichrome project=2E
> > - * All Rights Reserved=2E
> > - *
> > - * Permission is hereby granted, free of charge, to any person obtain=
ing a
> > - * copy of this software and associated documentation files (the "Sof=
tware"),
> > - * to deal in the Software without restriction, including without lim=
itation
> > - * the rights to use, copy, modify, merge, publish, distribute, sub l=
icense,
> > - * and/or sell copies of the Software, and to permit persons to whom =
the
> > - * Software is furnished to do so, subject to the following condition=
s:
> > - *
> > - * The above copyright notice and this permission notice (including t=
he
> > - * next paragraph) shall be included in all copies or substantial por=
tions
> > - * of the Software=2E
> > - *
> > - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EX=
PRESS OR
> > - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTAB=
ILITY,
> > - * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT=2E IN NO EVE=
NT SHALL
> > - * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR =
ANY CLAIM,
> > - * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT=
 OR
> > - * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE=
 OR THE
> > - * USE OR OTHER DEALINGS IN THE SOFTWARE=2E
> > - *
> > - * Authors:
> > - *    Tungsten Graphics,
> > - *    Erdi Chen,
> > - *    Thomas Hellstrom=2E
> > - */
> > -
> > -#include <linux/delay=2Eh>
> > -#include <linux/uaccess=2Eh>
> > -
> > -#include <drm/drm=2Eh>
> > -#include <drm/drm_device=2Eh>
> > -#include <drm/drm_file=2Eh>
> > -#include <drm/via_drm=2Eh>
> > -
> > -#include "via_drv=2Eh"
> > -#include "via_3d_reg=2Eh"
> > -
> > -#define CMDBUF_ALIGNMENT_SIZE   (0x100)
> > -#define CMDBUF_ALIGNMENT_MASK   (0x0ff)
> > -
> > -/* defines for VIA 3D registers */
> > -#define VIA_REG_STATUS          0x400
> > -#define VIA_REG_TRANSET         0x43C
> > -#define VIA_REG_TRANSPACE       0x440
> > -
> > -/* VIA_REG_STATUS(0x400): Engine Status */
> > -#define VIA_CMD_RGTR_BUSY       0x00000080	/* Command Regulator is bu=
sy */
> > -#define VIA_2D_ENG_BUSY         0x00000001	/* 2D Engine is busy */
> > -#define VIA_3D_ENG_BUSY         0x00000002	/* 3D Engine is busy */
> > -#define VIA_VR_QUEUE_BUSY       0x00020000	/* Virtual Queue is busy *=
/
> > -
> > -#define SetReg2DAGP(nReg, nData) {				\
> > -	*((uint32_t *)(vb)) =3D ((nReg) >> 2) | HALCYON_HEADER1;	\
> > -	*((uint32_t *)(vb) + 1) =3D (nData);			\
> > -	vb =3D ((uint32_t *)vb) + 2;				\
> > -	dev_priv->dma_low +=3D 8;					\
> > -}
> > -
> > -#define via_flush_write_combine() mb()
> > -
> > -#define VIA_OUT_RING_QW(w1, w2)	do {		\
> > -	*vb++ =3D (w1);				\
> > -	*vb++ =3D (w2);				\
> > -	dev_priv->dma_low +=3D 8;			\
> > -} while (0)
> > -
> > -static void via_cmdbuf_start(drm_via_private_t *dev_priv);
> > -static void via_cmdbuf_pause(drm_via_private_t *dev_priv);
> > -static void via_cmdbuf_reset(drm_via_private_t *dev_priv);
> > -static void via_cmdbuf_rewind(drm_via_private_t *dev_priv);
> > -static int via_wait_idle(drm_via_private_t *dev_priv);
> > -static void via_pad_cache(drm_via_private_t *dev_priv, int qwords);
> > -
> > -/*
> > - * Free space in command buffer=2E
> > - */
> > -
> > -static uint32_t via_cmdbuf_space(drm_via_private_t *dev_priv)
> > -{
> > -	uint32_t agp_base =3D dev_priv->dma_offset + (uint32_t) dev_priv->ag=
pAddr;
> > -	uint32_t hw_addr =3D *(dev_priv->hw_addr_ptr) - agp_base;
> > -
> > -	return ((hw_addr <=3D dev_priv->dma_low) ?
> > -		(dev_priv->dma_high + hw_addr - dev_priv->dma_low) :
> > -		(hw_addr - dev_priv->dma_low));
> > -}
> > -
> > -/*
> > - * How much does the command regulator lag behind?
> > - */
> > -
> > -static uint32_t via_cmdbuf_lag(drm_via_private_t *dev_priv)
> > -{
> > -	uint32_t agp_base =3D dev_priv->dma_offset + (uint32_t) dev_priv->ag=
pAddr;
> > -	uint32_t hw_addr =3D *(dev_priv->hw_addr_ptr) - agp_base;
> > -
> > -	return ((hw_addr <=3D dev_priv->dma_low) ?
> > -		(dev_priv->dma_low - hw_addr) :
> > -		(dev_priv->dma_wrap + dev_priv->dma_low - hw_addr));
> > -}
> > -
> > -/*
> > - * Check that the given size fits in the buffer, otherwise wait=2E
> > - */
> > -
> > -static inline int
> > -via_cmdbuf_wait(drm_via_private_t *dev_priv, unsigned int size)
> > -{
> > -	uint32_t agp_base =3D dev_priv->dma_offset + (uint32_t) dev_priv->ag=
pAddr;
> > -	uint32_t cur_addr, hw_addr, next_addr;
> > -	volatile uint32_t *hw_addr_ptr;
> > -	uint32_t count;
> > -	hw_addr_ptr =3D dev_priv->hw_addr_ptr;
> > -	cur_addr =3D dev_priv->dma_low;
> > -	next_addr =3D cur_addr + size + 512 * 1024;
> > -	count =3D 1000000;
> > -	do {
> > -		hw_addr =3D *hw_addr_ptr - agp_base;
> > -		if (count-- =3D=3D 0) {
> > -			DRM_ERROR
> > -			    ("via_cmdbuf_wait timed out hw %x cur_addr %x next_addr %x\n",
> > -			     hw_addr, cur_addr, next_addr);
> > -			return -1;
> > -		}
> > -		if  ((cur_addr < hw_addr) && (next_addr >=3D hw_addr))
> > -			msleep(1);
> > -	} while ((cur_addr < hw_addr) && (next_addr >=3D hw_addr));
> > -	return 0;
> > -}
> > -
> > -/*
> > - * Checks whether buffer head has reach the end=2E Rewind the ring bu=
ffer
> > - * when necessary=2E
> > - *
> > - * Returns virtual pointer to ring buffer=2E
> > - */
> > -
> > -static inline uint32_t *via_check_dma(drm_via_private_t * dev_priv,
> > -				      unsigned int size)
> > -{
> > -	if ((dev_priv->dma_low + size + 4 * CMDBUF_ALIGNMENT_SIZE) >
> > -	    dev_priv->dma_high) {
> > -		via_cmdbuf_rewind(dev_priv);
> > -	}
> > -	if (via_cmdbuf_wait(dev_priv, size) !=3D 0)
> > -		return NULL;
> > -
> > -	return (uint32_t *) (dev_priv->dma_ptr + dev_priv->dma_low);
> > -}
> > -
> > -int via_dma_cleanup(struct drm_device *dev)
> > -{
> > -	if (dev->dev_private) {
> > -		drm_via_private_t *dev_priv =3D
> > -		    (drm_via_private_t *) dev->dev_private;
> > -
> > -		if (dev_priv->ring=2Evirtual_start) {
> > -			via_cmdbuf_reset(dev_priv);
> > -
> > -			drm_legacy_ioremapfree(&dev_priv->ring=2Emap, dev);
> > -			dev_priv->ring=2Evirtual_start =3D NULL;
> > -		}
> > -
> > -	}
> > -
> > -	return 0;
> > -}
> > -
> > -static int via_initialize(struct drm_device *dev,
> > -			  drm_via_private_t *dev_priv,
> > -			  drm_via_dma_init_t *init)
> > -{
> > -	if (!dev_priv || !dev_priv->mmio) {
> > -		DRM_ERROR("via_dma_init called before via_map_init\n");
> > -		return -EFAULT;
> > -	}
> > -
> > -	if (dev_priv->ring=2Evirtual_start !=3D NULL) {
> > -		DRM_ERROR("called again without calling cleanup\n");
> > -		return -EFAULT;
> > -	}
> > -
> > -	if (!dev->agp || !dev->agp->base) {
> > -		DRM_ERROR("called with no agp memory available\n");
> > -		return -EFAULT;
> > -	}
> > -
> > -	if (dev_priv->chipset =3D=3D VIA_DX9_0) {
> > -		DRM_ERROR("AGP DMA is not supported on this chip\n");
> > -		return -EINVAL;
> > -	}
> > -
> > -	dev_priv->ring=2Emap=2Eoffset =3D dev->agp->base + init->offset;
> > -	dev_priv->ring=2Emap=2Esize =3D init->size;
> > -	dev_priv->ring=2Emap=2Etype =3D 0;
> > -	dev_priv->ring=2Emap=2Eflags =3D 0;
> > -	dev_priv->ring=2Emap=2Emtrr =3D 0;
> > -
> > -	drm_legacy_ioremap(&dev_priv->ring=2Emap, dev);
> > -
> > -	if (dev_priv->ring=2Emap=2Ehandle =3D=3D NULL) {
> > -		via_dma_cleanup(dev);
> > -		DRM_ERROR("can not ioremap virtual address for"
> > -			  " ring buffer\n");
> > -		return -ENOMEM;
> > -	}
> > -
> > -	dev_priv->ring=2Evirtual_start =3D dev_priv->ring=2Emap=2Ehandle;
> > -
> > -	dev_priv->dma_ptr =3D dev_priv->ring=2Evirtual_start;
> > -	dev_priv->dma_low =3D 0;
> > -	dev_priv->dma_high =3D init->size;
> > -	dev_priv->dma_wrap =3D init->size;
> > -	dev_priv->dma_offset =3D init->offset;
> > -	dev_priv->last_pause_ptr =3D NULL;
> > -	dev_priv->hw_addr_ptr =3D
> > -		(volatile uint32_t *)((char *)dev_priv->mmio->handle +
> > -		init->reg_pause_addr);
> > -
> > -	via_cmdbuf_start(dev_priv);
> > -
> > -	return 0;
> > -}
> > -
> > -static int via_dma_init(struct drm_device *dev, void *data, struct dr=
m_file *file_priv)
> > -{
> > -	drm_via_private_t *dev_priv =3D (drm_via_private_t *) dev->dev_priva=
te;
> > -	drm_via_dma_init_t *init =3D data;
> > -	int retcode =3D 0;
> > -
> > -	switch (init->func) {
> > -	case VIA_INIT_DMA:
> > -		if (!capable(CAP_SYS_ADMIN))
> > -			retcode =3D -EPERM;
> > -		else
> > -			retcode =3D via_initialize(dev, dev_priv, init);
> > -		break;
> > -	case VIA_CLEANUP_DMA:
> > -		if (!capable(CAP_SYS_ADMIN))
> > -			retcode =3D -EPERM;
> > -		else
> > -			retcode =3D via_dma_cleanup(dev);
> > -		break;
> > -	case VIA_DMA_INITIALIZED:
> > -		retcode =3D (dev_priv->ring=2Evirtual_start !=3D NULL) ?
> > -			0 : -EFAULT;
> > -		break;
> > -	default:
> > -		retcode =3D -EINVAL;
> > -		break;
> > -	}
> > -
> > -	return retcode;
> > -}
> > -
> > -static int via_dispatch_cmdbuffer(struct drm_device *dev, drm_via_cmd=
buffer_t *cmd)
> > -{
> > -	drm_via_private_t *dev_priv;
> > -	uint32_t *vb;
> > -	int ret;
> > -
> > -	dev_priv =3D (drm_via_private_t *) dev->dev_private;
> > -
> > -	if (dev_priv->ring=2Evirtual_start =3D=3D NULL) {
> > -		DRM_ERROR("called without initializing AGP ring buffer=2E\n");
> > -		return -EFAULT;
> > -	}
> > -
> > -	if (cmd->size > VIA_PCI_BUF_SIZE)
> > -		return -ENOMEM;
> > -
> > -	if (copy_from_user(dev_priv->pci_buf, cmd->buf, cmd->size))
> > -		return -EFAULT;
> > -
> > -	/*
> > -	 * Running this function on AGP memory is dead slow=2E Therefore
> > -	 * we run it on a temporary cacheable system memory buffer and
> > -	 * copy it to AGP memory when ready=2E
> > -	 */
> > -
> > -	if ((ret =3D
> > -	     via_verify_command_stream((uint32_t *) dev_priv->pci_buf,
> > -				       cmd->size, dev, 1))) {
> > -		return ret;
> > -	}
> > -
> > -	vb =3D via_check_dma(dev_priv, (cmd->size < 0x100) ? 0x102 : cmd->si=
ze);
> > -	if (vb =3D=3D NULL)
> > -		return -EAGAIN;
> > -
> > -	memcpy(vb, dev_priv->pci_buf, cmd->size);
> > -
> > -	dev_priv->dma_low +=3D cmd->size;
> > -
> > -	/*
> > -	 * Small submissions somehow stalls the CPU=2E (AGP cache effects?)
> > -	 * pad to greater size=2E
> > -	 */
> > -
> > -	if (cmd->size < 0x100)
> > -		via_pad_cache(dev_priv, (0x100 - cmd->size) >> 3);
> > -	via_cmdbuf_pause(dev_priv);
> > -
> > -	return 0;
> > -}
> > -
> > -int via_driver_dma_quiescent(struct drm_device *dev)
> > -{
> > -	drm_via_private_t *dev_priv =3D dev->dev_private;
> > -
> > -	if (!via_wait_idle(dev_priv))
> > -		return -EBUSY;
> > -	return 0;
> > -}
> > -
> > -static int via_flush_ioctl(struct drm_device *dev, void *data, struct=
 drm_file *file_priv)
> > -{
> > -
> > -	LOCK_TEST_WITH_RETURN(dev, file_priv);
> > -
> > -	return via_driver_dma_quiescent(dev);
> > -}
> > -
> > -static int via_cmdbuffer(struct drm_device *dev, void *data, struct d=
rm_file *file_priv)
> > -{
> > -	drm_via_cmdbuffer_t *cmdbuf =3D data;
> > -	int ret;
> > -
> > -	LOCK_TEST_WITH_RETURN(dev, file_priv);
> > -
> > -	DRM_DEBUG("buf %p size %lu\n", cmdbuf->buf, cmdbuf->size);
> > -
> > -	ret =3D via_dispatch_cmdbuffer(dev, cmdbuf);
> > -	return ret;
> > -}
> > -
> > -static int via_dispatch_pci_cmdbuffer(struct drm_device *dev,
> > -				      drm_via_cmdbuffer_t *cmd)
> > -{
> > -	drm_via_private_t *dev_priv =3D dev->dev_private;
> > -	int ret;
> > -
> > -	if (cmd->size > VIA_PCI_BUF_SIZE)
> > -		return -ENOMEM;
> > -	if (copy_from_user(dev_priv->pci_buf, cmd->buf, cmd->size))
> > -		return -EFAULT;
> > -
> > -	if ((ret =3D
> > -	     via_verify_command_stream((uint32_t *) dev_priv->pci_buf,
> > -				       cmd->size, dev, 0))) {
> > -		return ret;
> > -	}
> > -
> > -	ret =3D
> > -	    via_parse_command_stream(dev, (const uint32_t *)dev_priv->pci_bu=
f,
> > -				     cmd->size);
> > -	return ret;
> > -}
> > -
> > -static int via_pci_cmdbuffer(struct drm_device *dev, void *data, stru=
ct drm_file *file_priv)
> > -{
> > -	drm_via_cmdbuffer_t *cmdbuf =3D data;
> > -	int ret;
> > -
> > -	LOCK_TEST_WITH_RETURN(dev, file_priv);
> > -
> > -	DRM_DEBUG("buf %p size %lu\n", cmdbuf->buf, cmdbuf->size);
> > -
> > -	ret =3D via_dispatch_pci_cmdbuffer(dev, cmdbuf);
> > -	return ret;
> > -}
> > -
> > -static inline uint32_t *via_align_buffer(drm_via_private_t *dev_priv,
> > -					 uint32_t * vb, int qw_count)
> > -{
> > -	for (; qw_count > 0; --qw_count)
> > -		VIA_OUT_RING_QW(HC_DUMMY, HC_DUMMY);
> > -	return vb;
> > -}
> > -
> > -/*
> > - * This function is used internally by ring buffer management code=2E
> > - *
> > - * Returns virtual pointer to ring buffer=2E
> > - */
> > -static inline uint32_t *via_get_dma(drm_via_private_t *dev_priv)
> > -{
> > -	return (uint32_t *) (dev_priv->dma_ptr + dev_priv->dma_low);
> > -}
> > -
> > -/*
> > - * Hooks a segment of data into the tail of the ring-buffer by
> > - * modifying the pause address stored in the buffer itself=2E If
> > - * the regulator has already paused, restart it=2E
> > - */
> > -static int via_hook_segment(drm_via_private_t *dev_priv,
> > -			    uint32_t pause_addr_hi, uint32_t pause_addr_lo,
> > -			    int no_pci_fire)
> > -{
> > -	int paused, count;
> > -	volatile uint32_t *paused_at =3D dev_priv->last_pause_ptr;
> > -	uint32_t reader, ptr;
> > -	uint32_t diff;
> > -
> > -	paused =3D 0;
> > -	via_flush_write_combine();
> > -	(void) *(volatile uint32_t *)(via_get_dma(dev_priv) - 1);
> > -
> > -	*paused_at =3D pause_addr_lo;
> > -	via_flush_write_combine();
> > -	(void) *paused_at;
> > -
> > -	reader =3D *(dev_priv->hw_addr_ptr);
> > -	ptr =3D ((volatile char *)paused_at - dev_priv->dma_ptr) +
> > -		dev_priv->dma_offset + (uint32_t) dev_priv->agpAddr + 4;
> > -
> > -	dev_priv->last_pause_ptr =3D via_get_dma(dev_priv) - 1;
> > -
> > -	/*
> > -	 * If there is a possibility that the command reader will
> > -	 * miss the new pause address and pause on the old one,
> > -	 * In that case we need to program the new start address
> > -	 * using PCI=2E
> > -	 */
> > -
> > -	diff =3D (uint32_t) (ptr - reader) - dev_priv->dma_diff;
> > -	count =3D 10000000;
> > -	while (diff =3D=3D 0 && count--) {
> > -		paused =3D (via_read(dev_priv, 0x41c) & 0x80000000);
> > -		if (paused)
> > -			break;
> > -		reader =3D *(dev_priv->hw_addr_ptr);
> > -		diff =3D (uint32_t) (ptr - reader) - dev_priv->dma_diff;
> > -	}
> > -
> > -	paused =3D via_read(dev_priv, 0x41c) & 0x80000000;
> > -
> > -	if (paused && !no_pci_fire) {
> > -		reader =3D *(dev_priv->hw_addr_ptr);
> > -		diff =3D (uint32_t) (ptr - reader) - dev_priv->dma_diff;
> > -		diff &=3D (dev_priv->dma_high - 1);
> > -		if (diff !=3D 0 && diff < (dev_priv->dma_high >> 1)) {
> > -			DRM_ERROR("Paused at incorrect address=2E "
> > -				  "0x%08x, 0x%08x 0x%08x\n",
> > -				  ptr, reader, dev_priv->dma_diff);
> > -		} else if (diff =3D=3D 0) {
> > -			/*
> > -			 * There is a concern that these writes may stall the PCI bus
> > -			 * if the GPU is not idle=2E However, idling the GPU first
> > -			 * doesn't make a difference=2E
> > -			 */
> > -
> > -			via_write(dev_priv, VIA_REG_TRANSET, (HC_ParaType_PreCR << 16));
> > -			via_write(dev_priv, VIA_REG_TRANSPACE, pause_addr_hi);
> > -			via_write(dev_priv, VIA_REG_TRANSPACE, pause_addr_lo);
> > -			via_read(dev_priv, VIA_REG_TRANSPACE);
> > -		}
> > -	}
> > -	return paused;
> > -}
> > -
> > -static int via_wait_idle(drm_via_private_t *dev_priv)
> > -{
> > -	int count =3D 10000000;
> > -
> > -	while (!(via_read(dev_priv, VIA_REG_STATUS) & VIA_VR_QUEUE_BUSY) && =
--count)
> > -		;
> > -
> > -	while (count && (via_read(dev_priv, VIA_REG_STATUS) &
> > -			   (VIA_CMD_RGTR_BUSY | VIA_2D_ENG_BUSY |
> > -			    VIA_3D_ENG_BUSY)))
> > -		--count;
> > -	return count;
> > -}
> > -
> > -static uint32_t *via_align_cmd(drm_via_private_t *dev_priv, uint32_t =
cmd_type,
> > -			       uint32_t addr, uint32_t *cmd_addr_hi,
> > -			       uint32_t *cmd_addr_lo, int skip_wait)
> > -{
> > -	uint32_t agp_base;
> > -	uint32_t cmd_addr, addr_lo, addr_hi;
> > -	uint32_t *vb;
> > -	uint32_t qw_pad_count;
> > -
> > -	if (!skip_wait)
> > -		via_cmdbuf_wait(dev_priv, 2 * CMDBUF_ALIGNMENT_SIZE);
> > -
> > -	vb =3D via_get_dma(dev_priv);
> > -	VIA_OUT_RING_QW(HC_HEADER2 | ((VIA_REG_TRANSET >> 2) << 12) |
> > -			(VIA_REG_TRANSPACE >> 2), HC_ParaType_PreCR << 16);
> > -	agp_base =3D dev_priv->dma_offset + (uint32_t) dev_priv->agpAddr;
> > -	qw_pad_count =3D (CMDBUF_ALIGNMENT_SIZE >> 3) -
> > -	    ((dev_priv->dma_low & CMDBUF_ALIGNMENT_MASK) >> 3);
> > -
> > -	cmd_addr =3D (addr) ? addr :
> > -	    agp_base + dev_priv->dma_low - 8 + (qw_pad_count << 3);
> > -	addr_lo =3D ((HC_SubA_HAGPBpL << 24) | (cmd_type & HC_HAGPBpID_MASK)=
 |
> > -		   (cmd_addr & HC_HAGPBpL_MASK));
> > -	addr_hi =3D ((HC_SubA_HAGPBpH << 24) | (cmd_addr >> 24));
> > -
> > -	vb =3D via_align_buffer(dev_priv, vb, qw_pad_count - 1);
> > -	VIA_OUT_RING_QW(*cmd_addr_hi =3D addr_hi, *cmd_addr_lo =3D addr_lo);
> > -	return vb;
> > -}
> > -
> > -static void via_cmdbuf_start(drm_via_private_t *dev_priv)
> > -{
> > -	uint32_t pause_addr_lo, pause_addr_hi;
> > -	uint32_t start_addr, start_addr_lo;
> > -	uint32_t end_addr, end_addr_lo;
> > -	uint32_t command;
> > -	uint32_t agp_base;
> > -	uint32_t ptr;
> > -	uint32_t reader;
> > -	int count;
> > -
> > -	dev_priv->dma_low =3D 0;
> > -
> > -	agp_base =3D dev_priv->dma_offset + (uint32_t) dev_priv->agpAddr;
> > -	start_addr =3D agp_base;
> > -	end_addr =3D agp_base + dev_priv->dma_high;
> > -
> > -	start_addr_lo =3D ((HC_SubA_HAGPBstL << 24) | (start_addr & 0xFFFFFF=
));
> > -	end_addr_lo =3D ((HC_SubA_HAGPBendL << 24) | (end_addr & 0xFFFFFF));
> > -	command =3D ((HC_SubA_HAGPCMNT << 24) | (start_addr >> 24) |
> > -		   ((end_addr & 0xff000000) >> 16));
> > -
> > -	dev_priv->last_pause_ptr =3D
> > -	    via_align_cmd(dev_priv, HC_HAGPBpID_PAUSE, 0,
> > -			  &pause_addr_hi, &pause_addr_lo, 1) - 1;
> > -
> > -	via_flush_write_combine();
> > -	(void) *(volatile uint32_t *)dev_priv->last_pause_ptr;
> > -
> > -	via_write(dev_priv, VIA_REG_TRANSET, (HC_ParaType_PreCR << 16));
> > -	via_write(dev_priv, VIA_REG_TRANSPACE, command);
> > -	via_write(dev_priv, VIA_REG_TRANSPACE, start_addr_lo);
> > -	via_write(dev_priv, VIA_REG_TRANSPACE, end_addr_lo);
> > -
> > -	via_write(dev_priv, VIA_REG_TRANSPACE, pause_addr_hi);
> > -	via_write(dev_priv, VIA_REG_TRANSPACE, pause_addr_lo);
> > -	wmb();
> > -	via_write(dev_priv, VIA_REG_TRANSPACE, command | HC_HAGPCMNT_MASK);
> > -	via_read(dev_priv, VIA_REG_TRANSPACE);
> > -
> > -	dev_priv->dma_diff =3D 0;
> > -
> > -	count =3D 10000000;
> > -	while (!(via_read(dev_priv, 0x41c) & 0x80000000) && count--);
> > -
> > -	reader =3D *(dev_priv->hw_addr_ptr);
> > -	ptr =3D ((volatile char *)dev_priv->last_pause_ptr - dev_priv->dma_p=
tr) +
> > -	    dev_priv->dma_offset + (uint32_t) dev_priv->agpAddr + 4;
> > -
> > -	/*
> > -	 * This is the difference between where we tell the
> > -	 * command reader to pause and where it actually pauses=2E
> > -	 * This differs between hw implementation so we need to
> > -	 * detect it=2E
> > -	 */
> > -
> > -	dev_priv->dma_diff =3D ptr - reader;
> > -}
> > -
> > -static void via_pad_cache(drm_via_private_t *dev_priv, int qwords)
> > -{
> > -	uint32_t *vb;
> > -
> > -	via_cmdbuf_wait(dev_priv, qwords + 2);
> > -	vb =3D via_get_dma(dev_priv);
> > -	VIA_OUT_RING_QW(HC_HEADER2, HC_ParaType_NotTex << 16);
> > -	via_align_buffer(dev_priv, vb, qwords);
> > -}
> > -
> > -static inline void via_dummy_bitblt(drm_via_private_t *dev_priv)
> > -{
> > -	uint32_t *vb =3D via_get_dma(dev_priv);
> > -	SetReg2DAGP(0x0C, (0 | (0 << 16)));
> > -	SetReg2DAGP(0x10, 0 | (0 << 16));
> > -	SetReg2DAGP(0x0, 0x1 | 0x2000 | 0xAA000000);
> > -}
> > -
> > -static void via_cmdbuf_jump(drm_via_private_t *dev_priv)
> > -{
> > -	uint32_t pause_addr_lo, pause_addr_hi;
> > -	uint32_t jump_addr_lo, jump_addr_hi;
> > -	volatile uint32_t *last_pause_ptr;
> > -	uint32_t dma_low_save1, dma_low_save2;
> > -
> > -	via_align_cmd(dev_priv, HC_HAGPBpID_JUMP, 0, &jump_addr_hi,
> > -		      &jump_addr_lo, 0);
> > -
> > -	dev_priv->dma_wrap =3D dev_priv->dma_low;
> > -
> > -	/*
> > -	 * Wrap command buffer to the beginning=2E
> > -	 */
> > -
> > -	dev_priv->dma_low =3D 0;
> > -	if (via_cmdbuf_wait(dev_priv, CMDBUF_ALIGNMENT_SIZE) !=3D 0)
> > -		DRM_ERROR("via_cmdbuf_jump failed\n");
> > -
> > -	via_dummy_bitblt(dev_priv);
> > -	via_dummy_bitblt(dev_priv);
> > -
> > -	last_pause_ptr =3D
> > -	    via_align_cmd(dev_priv, HC_HAGPBpID_PAUSE, 0, &pause_addr_hi,
> > -			  &pause_addr_lo, 0) - 1;
> > -	via_align_cmd(dev_priv, HC_HAGPBpID_PAUSE, 0, &pause_addr_hi,
> > -		      &pause_addr_lo, 0);
> > -
> > -	*last_pause_ptr =3D pause_addr_lo;
> > -	dma_low_save1 =3D dev_priv->dma_low;
> > -
> > -	/*
> > -	 * Now, set a trap that will pause the regulator if it tries to reru=
n the old
> > -	 * command buffer=2E (Which may happen if via_hook_segment detecs a =
command regulator pause
> > -	 * and reissues the jump command over PCI, while the regulator has a=
lready taken the jump
> > -	 * and actually paused at the current buffer end)=2E
> > -	 * There appears to be no other way to detect this condition, since =
the hw_addr_pointer
> > -	 * does not seem to get updated immediately when a jump occurs=2E
> > -	 */
> > -
> > -	last_pause_ptr =3D
> > -		via_align_cmd(dev_priv, HC_HAGPBpID_PAUSE, 0, &pause_addr_hi,
> > -			      &pause_addr_lo, 0) - 1;
> > -	via_align_cmd(dev_priv, HC_HAGPBpID_PAUSE, 0, &pause_addr_hi,
> > -		      &pause_addr_lo, 0);
> > -	*last_pause_ptr =3D pause_addr_lo;
> > -
> > -	dma_low_save2 =3D dev_priv->dma_low;
> > -	dev_priv->dma_low =3D dma_low_save1;
> > -	via_hook_segment(dev_priv, jump_addr_hi, jump_addr_lo, 0);
> > -	dev_priv->dma_low =3D dma_low_save2;
> > -	via_hook_segment(dev_priv, pause_addr_hi, pause_addr_lo, 0);
> > -}
> > -
> > -
> > -static void via_cmdbuf_rewind(drm_via_private_t *dev_priv)
> > -{
> > -	via_cmdbuf_jump(dev_priv);
> > -}
> > -
> > -static void via_cmdbuf_flush(drm_via_private_t *dev_priv, uint32_t cm=
d_type)
> > -{
> > -	uint32_t pause_addr_lo, pause_addr_hi;
> > -
> > -	via_align_cmd(dev_priv, cmd_type, 0, &pause_addr_hi, &pause_addr_lo,=
 0);
> > -	via_hook_segment(dev_priv, pause_addr_hi, pause_addr_lo, 0);
> > -}
> > -
> > -static void via_cmdbuf_pause(drm_via_private_t *dev_priv)
> > -{
> > -	via_cmdbuf_flush(dev_priv, HC_HAGPBpID_PAUSE);
> > -}
> > -
> > -static void via_cmdbuf_reset(drm_via_private_t *dev_priv)
> > -{
> > -	via_cmdbuf_flush(dev_priv, HC_HAGPBpID_STOP);
> > -	via_wait_idle(dev_priv);
> > -}
> > -
> > -/*
> > - * User interface to the space and lag functions=2E
> > - */
> > -
> > -static int via_cmdbuf_size(struct drm_device *dev, void *data, struct=
 drm_file *file_priv)
> > -{
> > -	drm_via_cmdbuf_size_t *d_siz =3D data;
> > -	int ret =3D 0;
> > -	uint32_t tmp_size, count;
> > -	drm_via_private_t *dev_priv;
> > -
> > -	DRM_DEBUG("\n");
> > -	LOCK_TEST_WITH_RETURN(dev, file_priv);
> > -
> > -	dev_priv =3D (drm_via_private_t *) dev->dev_private;
> > -
> > -	if (dev_priv->ring=2Evirtual_start =3D=3D NULL) {
> > -		DRM_ERROR("called without initializing AGP ring buffer=2E\n");
> > -		return -EFAULT;
> > -	}
> > -
> > -	count =3D 1000000;
> > -	tmp_size =3D d_siz->size;
> > -	switch (d_siz->func) {
> > -	case VIA_CMDBUF_SPACE:
> > -		while (((tmp_size =3D via_cmdbuf_space(dev_priv)) < d_siz->size)
> > -		       && --count) {
> > -			if (!d_siz->wait)
> > -				break;
> > -		}
> > -		if (!count) {
> > -			DRM_ERROR("VIA_CMDBUF_SPACE timed out=2E\n");
> > -			ret =3D -EAGAIN;
> > -		}
> > -		break;
> > -	case VIA_CMDBUF_LAG:
> > -		while (((tmp_size =3D via_cmdbuf_lag(dev_priv)) > d_siz->size)
> > -		       && --count) {
> > -			if (!d_siz->wait)
> > -				break;
> > -		}
> > -		if (!count) {
> > -			DRM_ERROR("VIA_CMDBUF_LAG timed out=2E\n");
> > -			ret =3D -EAGAIN;
> > -		}
> > -		break;
> > -	default:
> > -		ret =3D -EFAULT;
> > -	}
> > -	d_siz->size =3D tmp_size;
> > -
> > -	return ret;
> > -}
> > -
> > -const struct drm_ioctl_desc via_ioctls[] =3D {
> > -	DRM_IOCTL_DEF_DRV(VIA_ALLOCMEM, via_mem_alloc, DRM_AUTH),
> > -	DRM_IOCTL_DEF_DRV(VIA_FREEMEM, via_mem_free, DRM_AUTH),
> > -	DRM_IOCTL_DEF_DRV(VIA_AGP_INIT, via_agp_init, DRM_AUTH|DRM_MASTER),
> > -	DRM_IOCTL_DEF_DRV(VIA_FB_INIT, via_fb_init, DRM_AUTH|DRM_MASTER),
> > -	DRM_IOCTL_DEF_DRV(VIA_MAP_INIT, via_map_init, DRM_AUTH|DRM_MASTER),
> > -	DRM_IOCTL_DEF_DRV(VIA_DEC_FUTEX, via_decoder_futex, DRM_AUTH),
> > -	DRM_IOCTL_DEF_DRV(VIA_DMA_INIT, via_dma_init, DRM_AUTH),
> > -	DRM_IOCTL_DEF_DRV(VIA_CMDBUFFER, via_cmdbuffer, DRM_AUTH),
> > -	DRM_IOCTL_DEF_DRV(VIA_FLUSH, via_flush_ioctl, DRM_AUTH),
> > -	DRM_IOCTL_DEF_DRV(VIA_PCICMD, via_pci_cmdbuffer, DRM_AUTH),
> > -	DRM_IOCTL_DEF_DRV(VIA_CMDBUF_SIZE, via_cmdbuf_size, DRM_AUTH),
> > -	DRM_IOCTL_DEF_DRV(VIA_WAIT_IRQ, via_wait_irq, DRM_AUTH),
> > -	DRM_IOCTL_DEF_DRV(VIA_DMA_BLIT, via_dma_blit, DRM_AUTH),
> > -	DRM_IOCTL_DEF_DRV(VIA_BLIT_SYNC, via_dma_blit_sync, DRM_AUTH)
> > -};
> > -
> > -int via_max_ioctl =3D ARRAY_SIZE(via_ioctls);
> > diff --git a/drivers/gpu/drm/via/via_dmablit=2Ec b/drivers/gpu/drm/via=
/via_dmablit=2Ec
> > deleted file mode 100644
> > index e016a4d62090=2E=2E000000000000
> > --- a/drivers/gpu/drm/via/via_dmablit=2Ec
> > +++ /dev/null
> > @@ -1,807 +0,0 @@
> > -/* via_dmablit=2Ec -- PCI DMA BitBlt support for the VIA Unichrome/Pr=
o
> > - *
> > - * Copyright (C) 2005 Thomas Hellstrom, All Rights Reserved=2E
> > - *
> > - * Permission is hereby granted, free of charge, to any person obtain=
ing a
> > - * copy of this software and associated documentation files (the "Sof=
tware"),
> > - * to deal in the Software without restriction, including without lim=
itation
> > - * the rights to use, copy, modify, merge, publish, distribute, sub l=
icense,
> > - * and/or sell copies of the Software, and to permit persons to whom =
the
> > - * Software is furnished to do so, subject to the following condition=
s:
> > - *
> > - * The above copyright notice and this permission notice (including t=
he
> > - * next paragraph) shall be included in all copies or substantial por=
tions
> > - * of the Software=2E
> > - *
> > - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EX=
PRESS OR
> > - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTAB=
ILITY,
> > - * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT=2E IN NO EVE=
NT SHALL
> > - * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR =
ANY CLAIM,
> > - * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT=
 OR
> > - * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE=
 OR THE
> > - * USE OR OTHER DEALINGS IN THE SOFTWARE=2E
> > - *
> > - * Authors:
> > - *    Thomas Hellstrom=2E
> > - *    Partially based on code obtained from Digeo Inc=2E
> > - */
> > -
> > -
> > -/*
> > - * Unmaps the DMA mappings=2E
> > - * FIXME: Is this a NoOp on x86? Also
> > - * FIXME: What happens if this one is called and a pending blit has p=
reviously done
> > - * the same DMA mappings?
> > - */
> > -
> > -#include <linux/pagemap=2Eh>
> > -#include <linux/pci=2Eh>
> > -#include <linux/slab=2Eh>
> > -#include <linux/vmalloc=2Eh>
> > -
> > -#include <drm/drm_device=2Eh>
> > -#include <drm/via_drm=2Eh>
> > -
> > -#include "via_dmablit=2Eh"
> > -#include "via_drv=2Eh"
> > -
> > -#define VIA_PGDN(x)	     (((unsigned long)(x)) & PAGE_MASK)
> > -#define VIA_PGOFF(x)	    (((unsigned long)(x)) & ~PAGE_MASK)
> > -#define VIA_PFN(x)	      ((unsigned long)(x) >> PAGE_SHIFT)
> > -
> > -typedef struct _drm_via_descriptor {
> > -	uint32_t mem_addr;
> > -	uint32_t dev_addr;
> > -	uint32_t size;
> > -	uint32_t next;
> > -} drm_via_descriptor_t;
> > -
> > -
> > -/*
> > - * Unmap a DMA mapping=2E
> > - */
> > -
> > -
> > -
> > -static void
> > -via_unmap_blit_from_device(struct pci_dev *pdev, drm_via_sg_info_t *v=
sg)
> > -{
> > -	int num_desc =3D vsg->num_desc;
> > -	unsigned cur_descriptor_page =3D num_desc / vsg->descriptors_per_pag=
e;
> > -	unsigned descriptor_this_page =3D num_desc % vsg->descriptors_per_pa=
ge;
> > -	drm_via_descriptor_t *desc_ptr =3D vsg->desc_pages[cur_descriptor_pa=
ge] +
> > -		descriptor_this_page;
> > -	dma_addr_t next =3D vsg->chain_start;
> > -
> > -	while (num_desc--) {
> > -		if (descriptor_this_page-- =3D=3D 0) {
> > -			cur_descriptor_page--;
> > -			descriptor_this_page =3D vsg->descriptors_per_page - 1;
> > -			desc_ptr =3D vsg->desc_pages[cur_descriptor_page] +
> > -				descriptor_this_page;
> > -		}
> > -		dma_unmap_single(&pdev->dev, next, sizeof(*desc_ptr), DMA_TO_DEVICE=
);
> > -		dma_unmap_page(&pdev->dev, desc_ptr->mem_addr, desc_ptr->size, vsg-=
>direction);
> > -		next =3D (dma_addr_t) desc_ptr->next;
> > -		desc_ptr--;
> > -	}
> > -}
> > -
> > -/*
> > - * If mode =3D 0, count how many descriptors are needed=2E
> > - * If mode =3D 1, Map the DMA pages for the device, put together and =
map also the descriptors=2E
> > - * Descriptors are run in reverse order by the hardware because we ar=
e not allowed to update the
> > - * 'next' field without syncing calls when the descriptor is already =
mapped=2E
> > - */
> > -
> > -static void
> > -via_map_blit_for_device(struct pci_dev *pdev,
> > -		   const drm_via_dmablit_t *xfer,
> > -		   drm_via_sg_info_t *vsg,
> > -		   int mode)
> > -{
> > -	unsigned cur_descriptor_page =3D 0;
> > -	unsigned num_descriptors_this_page =3D 0;
> > -	unsigned char *mem_addr =3D xfer->mem_addr;
> > -	unsigned char *cur_mem;
> > -	unsigned char *first_addr =3D (unsigned char *)VIA_PGDN(mem_addr);
> > -	uint32_t fb_addr =3D xfer->fb_addr;
> > -	uint32_t cur_fb;
> > -	unsigned long line_len;
> > -	unsigned remaining_len;
> > -	int num_desc =3D 0;
> > -	int cur_line;
> > -	dma_addr_t next =3D 0 | VIA_DMA_DPR_EC;
> > -	drm_via_descriptor_t *desc_ptr =3D NULL;
> > -
> > -	if (mode =3D=3D 1)
> > -		desc_ptr =3D vsg->desc_pages[cur_descriptor_page];
> > -
> > -	for (cur_line =3D 0; cur_line < xfer->num_lines; ++cur_line) {
> > -
> > -		line_len =3D xfer->line_length;
> > -		cur_fb =3D fb_addr;
> > -		cur_mem =3D mem_addr;
> > -
> > -		while (line_len > 0) {
> > -
> > -			remaining_len =3D min(PAGE_SIZE-VIA_PGOFF(cur_mem), line_len);
> > -			line_len -=3D remaining_len;
> > -
> > -			if (mode =3D=3D 1) {
> > -				desc_ptr->mem_addr =3D
> > -					dma_map_page(&pdev->dev,
> > -						     vsg->pages[VIA_PFN(cur_mem) -
> > -								VIA_PFN(first_addr)],
> > -						     VIA_PGOFF(cur_mem), remaining_len,
> > -						     vsg->direction);
> > -				desc_ptr->dev_addr =3D cur_fb;
> > -
> > -				desc_ptr->size =3D remaining_len;
> > -				desc_ptr->next =3D (uint32_t) next;
> > -				next =3D dma_map_single(&pdev->dev, desc_ptr, sizeof(*desc_ptr),
> > -						      DMA_TO_DEVICE);
> > -				desc_ptr++;
> > -				if (++num_descriptors_this_page >=3D vsg->descriptors_per_page) {
> > -					num_descriptors_this_page =3D 0;
> > -					desc_ptr =3D vsg->desc_pages[++cur_descriptor_page];
> > -				}
> > -			}
> > -
> > -			num_desc++;
> > -			cur_mem +=3D remaining_len;
> > -			cur_fb +=3D remaining_len;
> > -		}
> > -
> > -		mem_addr +=3D xfer->mem_stride;
> > -		fb_addr +=3D xfer->fb_stride;
> > -	}
> > -
> > -	if (mode =3D=3D 1) {
> > -		vsg->chain_start =3D next;
> > -		vsg->state =3D dr_via_device_mapped;
> > -	}
> > -	vsg->num_desc =3D num_desc;
> > -}
> > -
> > -/*
> > - * Function that frees up all resources for a blit=2E It is usable ev=
en if the
> > - * blit info has only been partially built as long as the status enum=
 is consistent
> > - * with the actual status of the used resources=2E
> > - */
> > -
> > -
> > -static void
> > -via_free_sg_info(struct pci_dev *pdev, drm_via_sg_info_t *vsg)
> > -{
> > -	int i;
> > -
> > -	switch (vsg->state) {
> > -	case dr_via_device_mapped:
> > -		via_unmap_blit_from_device(pdev, vsg);
> > -		fallthrough;
> > -	case dr_via_desc_pages_alloc:
> > -		for (i =3D 0; i < vsg->num_desc_pages; ++i) {
> > -			if (vsg->desc_pages[i] !=3D NULL)
> > -				free_page((unsigned long)vsg->desc_pages[i]);
> > -		}
> > -		kfree(vsg->desc_pages);
> > -		fallthrough;
> > -	case dr_via_pages_locked:
> > -		unpin_user_pages_dirty_lock(vsg->pages, vsg->num_pages,
> > -					   (vsg->direction =3D=3D DMA_FROM_DEVICE));
> > -		fallthrough;
> > -	case dr_via_pages_alloc:
> > -		vfree(vsg->pages);
> > -		fallthrough;
> > -	default:
> > -		vsg->state =3D dr_via_sg_init;
> > -	}
> > -	vfree(vsg->bounce_buffer);
> > -	vsg->bounce_buffer =3D NULL;
> > -	vsg->free_on_sequence =3D 0;
> > -}
> > -
> > -/*
> > - * Fire a blit engine=2E
> > - */
> > -
> > -static void
> > -via_fire_dmablit(struct drm_device *dev, drm_via_sg_info_t *vsg, int =
engine)
> > -{
> > -	drm_via_private_t *dev_priv =3D (drm_via_private_t *)dev->dev_privat=
e;
> > -
> > -	via_write(dev_priv, VIA_PCI_DMA_MAR0 + engine*0x10, 0);
> > -	via_write(dev_priv, VIA_PCI_DMA_DAR0 + engine*0x10, 0);
> > -	via_write(dev_priv, VIA_PCI_DMA_CSR0 + engine*0x04, VIA_DMA_CSR_DD |=
 VIA_DMA_CSR_TD |
> > -		  VIA_DMA_CSR_DE);
> > -	via_write(dev_priv, VIA_PCI_DMA_MR0  + engine*0x04, VIA_DMA_MR_CM | =
VIA_DMA_MR_TDIE);
> > -	via_write(dev_priv, VIA_PCI_DMA_BCR0 + engine*0x10, 0);
> > -	via_write(dev_priv, VIA_PCI_DMA_DPR0 + engine*0x10, vsg->chain_start=
);
> > -	wmb();
> > -	via_write(dev_priv, VIA_PCI_DMA_CSR0 + engine*0x04, VIA_DMA_CSR_DE |=
 VIA_DMA_CSR_TS);
> > -	via_read(dev_priv, VIA_PCI_DMA_CSR0 + engine*0x04);
> > -}
> > -
> > -/*
> > - * Obtain a page pointer array and lock all pages into system memory=
=2E A segmentation violation will
> > - * occur here if the calling user does not have access to the submitt=
ed address=2E
> > - */
> > -
> > -static int
> > -via_lock_all_dma_pages(drm_via_sg_info_t *vsg,  drm_via_dmablit_t *xf=
er)
> > -{
> > -	int ret;
> > -	unsigned long first_pfn =3D VIA_PFN(xfer->mem_addr);
> > -	vsg->num_pages =3D VIA_PFN(xfer->mem_addr + (xfer->num_lines * xfer-=
>mem_stride - 1)) -
> > -		first_pfn + 1;
> > -
> > -	vsg->pages =3D vzalloc(array_size(sizeof(struct page *), vsg->num_pa=
ges));
> > -	if (NULL =3D=3D vsg->pages)
> > -		return -ENOMEM;
> > -	ret =3D pin_user_pages_fast((unsigned long)xfer->mem_addr,
> > -			vsg->num_pages,
> > -			vsg->direction =3D=3D DMA_FROM_DEVICE ? FOLL_WRITE : 0,
> > -			vsg->pages);
> > -	if (ret !=3D vsg->num_pages) {
> > -		if (ret < 0)
> > -			return ret;
> > -		vsg->state =3D dr_via_pages_locked;
> > -		return -EINVAL;
> > -	}
> > -	vsg->state =3D dr_via_pages_locked;
> > -	DRM_DEBUG("DMA pages locked\n");
> > -	return 0;
> > -}
> > -
> > -/*
> > - * Allocate DMA capable memory for the blit descriptor chain, and an =
array that keeps track of the
> > - * pages we allocate=2E We don't want to use kmalloc for the descript=
or chain because it may be
> > - * quite large for some blits, and pages don't need to be contiguous=
=2E
> > - */
> > -
> > -static int
> > -via_alloc_desc_pages(drm_via_sg_info_t *vsg)
> > -{
> > -	int i;
> > -
> > -	vsg->descriptors_per_page =3D PAGE_SIZE / sizeof(drm_via_descriptor_=
t);
> > -	vsg->num_desc_pages =3D (vsg->num_desc + vsg->descriptors_per_page -=
 1) /
> > -		vsg->descriptors_per_page;
> > -
> > -	if (NULL =3D=3D  (vsg->desc_pages =3D kcalloc(vsg->num_desc_pages, s=
izeof(void *), GFP_KERNEL)))
> > -		return -ENOMEM;
> > -
> > -	vsg->state =3D dr_via_desc_pages_alloc;
> > -	for (i =3D 0; i < vsg->num_desc_pages; ++i) {
> > -		if (NULL =3D=3D (vsg->desc_pages[i] =3D
> > -			     (drm_via_descriptor_t *) __get_free_page(GFP_KERNEL)))
> > -			return -ENOMEM;
> > -	}
> > -	DRM_DEBUG("Allocated %d pages for %d descriptors=2E\n", vsg->num_des=
c_pages,
> > -		  vsg->num_desc);
> > -	return 0;
> > -}
> > -
> > -static void
> > -via_abort_dmablit(struct drm_device *dev, int engine)
> > -{
> > -	drm_via_private_t *dev_priv =3D (drm_via_private_t *)dev->dev_privat=
e;
> > -
> > -	via_write(dev_priv, VIA_PCI_DMA_CSR0 + engine*0x04, VIA_DMA_CSR_TA);
> > -}
> > -
> > -static void
> > -via_dmablit_engine_off(struct drm_device *dev, int engine)
> > -{
> > -	drm_via_private_t *dev_priv =3D (drm_via_private_t *)dev->dev_privat=
e;
> > -
> > -	via_write(dev_priv, VIA_PCI_DMA_CSR0 + engine*0x04, VIA_DMA_CSR_TD |=
 VIA_DMA_CSR_DD);
> > -}
> > -
> > -
> > -
> > -/*
> > - * The dmablit part of the IRQ handler=2E Trying to do only reasonabl=
y fast things here=2E
> > - * The rest, like unmapping and freeing memory for done blits is done=
 in a separate workqueue
> > - * task=2E Basically the task of the interrupt handler is to submit a=
 new blit to the engine, while
> > - * the workqueue task takes care of processing associated with the ol=
d blit=2E
> > - */
> > -
> > -void
> > -via_dmablit_handler(struct drm_device *dev, int engine, int from_irq)
> > -{
> > -	drm_via_private_t *dev_priv =3D (drm_via_private_t *)dev->dev_privat=
e;
> > -	drm_via_blitq_t *blitq =3D dev_priv->blit_queues + engine;
> > -	int cur;
> > -	int done_transfer;
> > -	unsigned long irqsave =3D 0;
> > -	uint32_t status =3D 0;
> > -
> > -	DRM_DEBUG("DMA blit handler called=2E engine =3D %d, from_irq =3D %d=
, blitq =3D 0x%lx\n",
> > -		  engine, from_irq, (unsigned long) blitq);
> > -
> > -	if (from_irq)
> > -		spin_lock(&blitq->blit_lock);
> > -	else
> > -		spin_lock_irqsave(&blitq->blit_lock, irqsave);
> > -
> > -	done_transfer =3D blitq->is_active &&
> > -	  ((status =3D via_read(dev_priv, VIA_PCI_DMA_CSR0 + engine*0x04)) &=
 VIA_DMA_CSR_TD);
> > -	done_transfer =3D done_transfer || (blitq->aborting && !(status & VI=
A_DMA_CSR_DE));
> > -
> > -	cur =3D blitq->cur;
> > -	if (done_transfer) {
> > -
> > -		blitq->blits[cur]->aborted =3D blitq->aborting;
> > -		blitq->done_blit_handle++;
> > -		wake_up(blitq->blit_queue + cur);
> > -
> > -		cur++;
> > -		if (cur >=3D VIA_NUM_BLIT_SLOTS)
> > -			cur =3D 0;
> > -		blitq->cur =3D cur;
> > -
> > -		/*
> > -		 * Clear transfer done flag=2E
> > -		 */
> > -
> > -		via_write(dev_priv, VIA_PCI_DMA_CSR0 + engine*0x04,  VIA_DMA_CSR_TD=
);
> > -
> > -		blitq->is_active =3D 0;
> > -		blitq->aborting =3D 0;
> > -		schedule_work(&blitq->wq);
> > -
> > -	} else if (blitq->is_active && time_after_eq(jiffies, blitq->end)) {
> > -
> > -		/*
> > -		 * Abort transfer after one second=2E
> > -		 */
> > -
> > -		via_abort_dmablit(dev, engine);
> > -		blitq->aborting =3D 1;
> > -		blitq->end =3D jiffies + HZ;
> > -	}
> > -
> > -	if (!blitq->is_active) {
> > -		if (blitq->num_outstanding) {
> > -			via_fire_dmablit(dev, blitq->blits[cur], engine);
> > -			blitq->is_active =3D 1;
> > -			blitq->cur =3D cur;
> > -			blitq->num_outstanding--;
> > -			blitq->end =3D jiffies + HZ;
> > -			if (!timer_pending(&blitq->poll_timer))
> > -				mod_timer(&blitq->poll_timer, jiffies + 1);
> > -		} else {
> > -			if (timer_pending(&blitq->poll_timer))
> > -				del_timer(&blitq->poll_timer);
> > -			via_dmablit_engine_off(dev, engine);
> > -		}
> > -	}
> > -
> > -	if (from_irq)
> > -		spin_unlock(&blitq->blit_lock);
> > -	else
> > -		spin_unlock_irqrestore(&blitq->blit_lock, irqsave);
> > -}
> > -
> > -
> > -
> > -/*
> > - * Check whether this blit is still active, performing necessary lock=
ing=2E
> > - */
> > -
> > -static int
> > -via_dmablit_active(drm_via_blitq_t *blitq, int engine, uint32_t handl=
e, wait_queue_head_t **queue)
> > -{
> > -	unsigned long irqsave;
> > -	uint32_t slot;
> > -	int active;
> > -
> > -	spin_lock_irqsave(&blitq->blit_lock, irqsave);
> > -
> > -	/*
> > -	 * Allow for handle wraparounds=2E
> > -	 */
> > -
> > -	active =3D ((blitq->done_blit_handle - handle) > (1 << 23)) &&
> > -		((blitq->cur_blit_handle - handle) <=3D (1 << 23));
> > -
> > -	if (queue && active) {
> > -		slot =3D handle - blitq->done_blit_handle + blitq->cur - 1;
> > -		if (slot >=3D VIA_NUM_BLIT_SLOTS)
> > -			slot -=3D VIA_NUM_BLIT_SLOTS;
> > -		*queue =3D blitq->blit_queue + slot;
> > -	}
> > -
> > -	spin_unlock_irqrestore(&blitq->blit_lock, irqsave);
> > -
> > -	return active;
> > -}
> > -
> > -/*
> > - * Sync=2E Wait for at least three seconds for the blit to be perform=
ed=2E
> > - */
> > -
> > -static int
> > -via_dmablit_sync(struct drm_device *dev, uint32_t handle, int engine)
> > -{
> > -
> > -	drm_via_private_t *dev_priv =3D (drm_via_private_t *)dev->dev_privat=
e;
> > -	drm_via_blitq_t *blitq =3D dev_priv->blit_queues + engine;
> > -	wait_queue_head_t *queue;
> > -	int ret =3D 0;
> > -
> > -	if (via_dmablit_active(blitq, engine, handle, &queue)) {
> > -		VIA_WAIT_ON(ret, *queue, 3 * HZ,
> > -			    !via_dmablit_active(blitq, engine, handle, NULL));
> > -	}
> > -	DRM_DEBUG("DMA blit sync handle 0x%x engine %d returned %d\n",
> > -		  handle, engine, ret);
> > -
> > -	return ret;
> > -}
> > -
> > -
> > -/*
> > - * A timer that regularly polls the blit engine in cases where we don=
't have interrupts:
> > - * a) Broken hardware (typically those that don't have any video capt=
ure facility)=2E
> > - * b) Blit abort=2E The hardware doesn't send an interrupt when a bli=
t is aborted=2E
> > - * The timer and hardware IRQ's can and do work in parallel=2E If the=
 hardware has
> > - * irqs, it will shorten the latency somewhat=2E
> > - */
> > -
> > -
> > -
> > -static void
> > -via_dmablit_timer(struct timer_list *t)
> > -{
> > -	drm_via_blitq_t *blitq =3D from_timer(blitq, t, poll_timer);
> > -	struct drm_device *dev =3D blitq->dev;
> > -	int engine =3D (int)
> > -		(blitq - ((drm_via_private_t *)dev->dev_private)->blit_queues);
> > -
> > -	DRM_DEBUG("Polling timer called for engine %d, jiffies %lu\n", engin=
e,
> > -		  (unsigned long) jiffies);
> > -
> > -	via_dmablit_handler(dev, engine, 0);
> > -
> > -	if (!timer_pending(&blitq->poll_timer)) {
> > -		mod_timer(&blitq->poll_timer, jiffies + 1);
> > -
> > -	       /*
> > -		* Rerun handler to delete timer if engines are off, and
> > -		* to shorten abort latency=2E This is a little nasty=2E
> > -		*/
> > -
> > -	       via_dmablit_handler(dev, engine, 0);
> > -
> > -	}
> > -}
> > -
> > -
> > -
> > -
> > -/*
> > - * Workqueue task that frees data and mappings associated with a blit=
=2E
> > - * Also wakes up waiting processes=2E Each of these tasks handles one
> > - * blit engine only and may not be called on each interrupt=2E
> > - */
> > -
> > -
> > -static void
> > -via_dmablit_workqueue(struct work_struct *work)
> > -{
> > -	drm_via_blitq_t *blitq =3D container_of(work, drm_via_blitq_t, wq);
> > -	struct drm_device *dev =3D blitq->dev;
> > -	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
> > -	unsigned long irqsave;
> > -	drm_via_sg_info_t *cur_sg;
> > -	int cur_released;
> > -
> > -
> > -	DRM_DEBUG("Workqueue task called for blit engine %ld\n", (unsigned l=
ong)
> > -		  (blitq - ((drm_via_private_t *)dev->dev_private)->blit_queues));
> > -
> > -	spin_lock_irqsave(&blitq->blit_lock, irqsave);
> > -
> > -	while (blitq->serviced !=3D blitq->cur) {
> > -
> > -		cur_released =3D blitq->serviced++;
> > -
> > -		DRM_DEBUG("Releasing blit slot %d\n", cur_released);
> > -
> > -		if (blitq->serviced >=3D VIA_NUM_BLIT_SLOTS)
> > -			blitq->serviced =3D 0;
> > -
> > -		cur_sg =3D blitq->blits[cur_released];
> > -		blitq->num_free++;
> > -
> > -		spin_unlock_irqrestore(&blitq->blit_lock, irqsave);
> > -
> > -		wake_up(&blitq->busy_queue);
> > -
> > -		via_free_sg_info(pdev, cur_sg);
> > -		kfree(cur_sg);
> > -
> > -		spin_lock_irqsave(&blitq->blit_lock, irqsave);
> > -	}
> > -
> > -	spin_unlock_irqrestore(&blitq->blit_lock, irqsave);
> > -}
> > -
> > -
> > -/*
> > - * Init all blit engines=2E Currently we use two, but some hardware h=
ave 4=2E
> > - */
> > -
> > -
> > -void
> > -via_init_dmablit(struct drm_device *dev)
> > -{
> > -	int i, j;
> > -	drm_via_private_t *dev_priv =3D (drm_via_private_t *)dev->dev_privat=
e;
> > -	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
> > -	drm_via_blitq_t *blitq;
> > -
> > -	pci_set_master(pdev);
> > -
> > -	for (i =3D 0; i < VIA_NUM_BLIT_ENGINES; ++i) {
> > -		blitq =3D dev_priv->blit_queues + i;
> > -		blitq->dev =3D dev;
> > -		blitq->cur_blit_handle =3D 0;
> > -		blitq->done_blit_handle =3D 0;
> > -		blitq->head =3D 0;
> > -		blitq->cur =3D 0;
> > -		blitq->serviced =3D 0;
> > -		blitq->num_free =3D VIA_NUM_BLIT_SLOTS - 1;
> > -		blitq->num_outstanding =3D 0;
> > -		blitq->is_active =3D 0;
> > -		blitq->aborting =3D 0;
> > -		spin_lock_init(&blitq->blit_lock);
> > -		for (j =3D 0; j < VIA_NUM_BLIT_SLOTS; ++j)
> > -			init_waitqueue_head(blitq->blit_queue + j);
> > -		init_waitqueue_head(&blitq->busy_queue);
> > -		INIT_WORK(&blitq->wq, via_dmablit_workqueue);
> > -		timer_setup(&blitq->poll_timer, via_dmablit_timer, 0);
> > -	}
> > -}
> > -
> > -/*
> > - * Build all info and do all mappings required for a blit=2E
> > - */
> > -
> > -
> > -static int
> > -via_build_sg_info(struct drm_device *dev, drm_via_sg_info_t *vsg, drm=
_via_dmablit_t *xfer)
> > -{
> > -	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
> > -	int draw =3D xfer->to_fb;
> > -	int ret =3D 0;
> > -
> > -	vsg->direction =3D (draw) ? DMA_TO_DEVICE : DMA_FROM_DEVICE;
> > -	vsg->bounce_buffer =3D NULL;
> > -
> > -	vsg->state =3D dr_via_sg_init;
> > -
> > -	if (xfer->num_lines <=3D 0 || xfer->line_length <=3D 0) {
> > -		DRM_ERROR("Zero size bitblt=2E\n");
> > -		return -EINVAL;
> > -	}
> > -
> > -	/*
> > -	 * Below check is a driver limitation, not a hardware one=2E We
> > -	 * don't want to lock unused pages, and don't want to incoporate the
> > -	 * extra logic of avoiding them=2E Make sure there are no=2E
> > -	 * (Not a big limitation anyway=2E)
> > -	 */
> > -
> > -	if ((xfer->mem_stride - xfer->line_length) > 2*PAGE_SIZE) {
> > -		DRM_ERROR("Too large system memory stride=2E Stride: %d, "
> > -			  "Length: %d\n", xfer->mem_stride, xfer->line_length);
> > -		return -EINVAL;
> > -	}
> > -
> > -	if ((xfer->mem_stride =3D=3D xfer->line_length) &&
> > -	   (xfer->fb_stride =3D=3D xfer->line_length)) {
> > -		xfer->mem_stride *=3D xfer->num_lines;
> > -		xfer->line_length =3D xfer->mem_stride;
> > -		xfer->fb_stride =3D xfer->mem_stride;
> > -		xfer->num_lines =3D 1;
> > -	}
> > -
> > -	/*
> > -	 * Don't lock an arbitrary large number of pages, since that causes =
a
> > -	 * DOS security hole=2E
> > -	 */
> > -
> > -	if (xfer->num_lines > 2048 || (xfer->num_lines*xfer->mem_stride > (2=
048*2048*4))) {
> > -		DRM_ERROR("Too large PCI DMA bitblt=2E\n");
> > -		return -EINVAL;
> > -	}
> > -
> > -	/*
> > -	 * we allow a negative fb stride to allow flipping of images in
> > -	 * transfer=2E
> > -	 */
> > -
> > -	if (xfer->mem_stride < xfer->line_length ||
> > -		abs(xfer->fb_stride) < xfer->line_length) {
> > -		DRM_ERROR("Invalid frame-buffer / memory stride=2E\n");
> > -		return -EINVAL;
> > -	}
> > -
> > -	/*
> > -	 * A hardware bug seems to be worked around if system memory address=
es start on
> > -	 * 16 byte boundaries=2E This seems a bit restrictive however=2E VIA=
 is contacted
> > -	 * about this=2E Meanwhile, impose the following restrictions:
> > -	 */
> > -
> > -#ifdef VIA_BUGFREE
> > -	if ((((unsigned long)xfer->mem_addr & 3) !=3D ((unsigned long)xfer->=
fb_addr & 3)) ||
> > -	    ((xfer->num_lines > 1) && ((xfer->mem_stride & 3) !=3D (xfer->fb=
_stride & 3)))) {
> > -		DRM_ERROR("Invalid DRM bitblt alignment=2E\n");
> > -		return -EINVAL;
> > -	}
> > -#else
> > -	if ((((unsigned long)xfer->mem_addr & 15) ||
> > -	      ((unsigned long)xfer->fb_addr & 3)) ||
> > -	   ((xfer->num_lines > 1) &&
> > -	   ((xfer->mem_stride & 15) || (xfer->fb_stride & 3)))) {
> > -		DRM_ERROR("Invalid DRM bitblt alignment=2E\n");
> > -		return -EINVAL;
> > -	}
> > -#endif
> > -
> > -	if (0 !=3D (ret =3D via_lock_all_dma_pages(vsg, xfer))) {
> > -		DRM_ERROR("Could not lock DMA pages=2E\n");
> > -		via_free_sg_info(pdev, vsg);
> > -		return ret;
> > -	}
> > -
> > -	via_map_blit_for_device(pdev, xfer, vsg, 0);
> > -	if (0 !=3D (ret =3D via_alloc_desc_pages(vsg))) {
> > -		DRM_ERROR("Could not allocate DMA descriptor pages=2E\n");
> > -		via_free_sg_info(pdev, vsg);
> > -		return ret;
> > -	}
> > -	via_map_blit_for_device(pdev, xfer, vsg, 1);
> > -
> > -	return 0;
> > -}
> > -
> > -
> > -/*
> > - * Reserve one free slot in the blit queue=2E Will wait for one secon=
d for one
> > - * to become available=2E Otherwise -EBUSY is returned=2E
> > - */
> > -
> > -static int
> > -via_dmablit_grab_slot(drm_via_blitq_t *blitq, int engine)
> > -{
> > -	int ret =3D 0;
> > -	unsigned long irqsave;
> > -
> > -	DRM_DEBUG("Num free is %d\n", blitq->num_free);
> > -	spin_lock_irqsave(&blitq->blit_lock, irqsave);
> > -	while (blitq->num_free =3D=3D 0) {
> > -		spin_unlock_irqrestore(&blitq->blit_lock, irqsave);
> > -
> > -		VIA_WAIT_ON(ret, blitq->busy_queue, HZ, blitq->num_free > 0);
> > -		if (ret)
> > -			return (-EINTR =3D=3D ret) ? -EAGAIN : ret;
> > -
> > -		spin_lock_irqsave(&blitq->blit_lock, irqsave);
> > -	}
> > -
> > -	blitq->num_free--;
> > -	spin_unlock_irqrestore(&blitq->blit_lock, irqsave);
> > -
> > -	return 0;
> > -}
> > -
> > -/*
> > - * Hand back a free slot if we changed our mind=2E
> > - */
> > -
> > -static void
> > -via_dmablit_release_slot(drm_via_blitq_t *blitq)
> > -{
> > -	unsigned long irqsave;
> > -
> > -	spin_lock_irqsave(&blitq->blit_lock, irqsave);
> > -	blitq->num_free++;
> > -	spin_unlock_irqrestore(&blitq->blit_lock, irqsave);
> > -	wake_up(&blitq->busy_queue);
> > -}
> > -
> > -/*
> > - * Grab a free slot=2E Build blit info and queue a blit=2E
> > - */
> > -
> > -
> > -static int
> > -via_dmablit(struct drm_device *dev, drm_via_dmablit_t *xfer)
> > -{
> > -	drm_via_private_t *dev_priv =3D (drm_via_private_t *)dev->dev_privat=
e;
> > -	drm_via_sg_info_t *vsg;
> > -	drm_via_blitq_t *blitq;
> > -	int ret;
> > -	int engine;
> > -	unsigned long irqsave;
> > -
> > -	if (dev_priv =3D=3D NULL) {
> > -		DRM_ERROR("Called without initialization=2E\n");
> > -		return -EINVAL;
> > -	}
> > -
> > -	engine =3D (xfer->to_fb) ? 0 : 1;
> > -	blitq =3D dev_priv->blit_queues + engine;
> > -	if (0 !=3D (ret =3D via_dmablit_grab_slot(blitq, engine)))
> > -		return ret;
> > -	if (NULL =3D=3D (vsg =3D kmalloc(sizeof(*vsg), GFP_KERNEL))) {
> > -		via_dmablit_release_slot(blitq);
> > -		return -ENOMEM;
> > -	}
> > -	if (0 !=3D (ret =3D via_build_sg_info(dev, vsg, xfer))) {
> > -		via_dmablit_release_slot(blitq);
> > -		kfree(vsg);
> > -		return ret;
> > -	}
> > -	spin_lock_irqsave(&blitq->blit_lock, irqsave);
> > -
> > -	blitq->blits[blitq->head++] =3D vsg;
> > -	if (blitq->head >=3D VIA_NUM_BLIT_SLOTS)
> > -		blitq->head =3D 0;
> > -	blitq->num_outstanding++;
> > -	xfer->sync=2Esync_handle =3D ++blitq->cur_blit_handle;
> > -
> > -	spin_unlock_irqrestore(&blitq->blit_lock, irqsave);
> > -	xfer->sync=2Eengine =3D engine;
> > -
> > -	via_dmablit_handler(dev, engine, 0);
> > -
> > -	return 0;
> > -}
> > -
> > -/*
> > - * Sync on a previously submitted blit=2E Note that the X server use =
signals extensively, and
> > - * that there is a very big probability that this IOCTL will be inter=
rupted by a signal=2E In that
> > - * case it returns with -EAGAIN for the signal to be delivered=2E
> > - * The caller should then reissue the IOCTL=2E This is similar to wha=
t is being done for drmGetLock()=2E
> > - */
> > -
> > -int
> > -via_dma_blit_sync(struct drm_device *dev, void *data, struct drm_file=
 *file_priv)
> > -{
> > -	drm_via_blitsync_t *sync =3D data;
> > -	int err;
> > -
> > -	if (sync->engine >=3D VIA_NUM_BLIT_ENGINES)
> > -		return -EINVAL;
> > -
> > -	err =3D via_dmablit_sync(dev, sync->sync_handle, sync->engine);
> > -
> > -	if (-EINTR =3D=3D err)
> > -		err =3D -EAGAIN;
> > -
> > -	return err;
> > -}
> > -
> > -
> > -/*
> > - * Queue a blit and hand back a handle to be used for sync=2E This IO=
CTL may be interrupted by a signal
> > - * while waiting for a free slot in the blit queue=2E In that case it=
 returns with -EAGAIN and should
> > - * be reissued=2E See the above IOCTL code=2E
> > - */
> > -
> > -int
> > -via_dma_blit(struct drm_device *dev, void *data, struct drm_file *fil=
e_priv)
> > -{
> > -	drm_via_dmablit_t *xfer =3D data;
> > -	int err;
> > -
> > -	err =3D via_dmablit(dev, xfer);
> > -
> > -	return err;
> > -}
> > diff --git a/drivers/gpu/drm/via/via_dmablit=2Eh b/drivers/gpu/drm/via=
/via_dmablit=2Eh
> > deleted file mode 100644
> > index 9b662a327cef=2E=2E000000000000
> > --- a/drivers/gpu/drm/via/via_dmablit=2Eh
> > +++ /dev/null
> > @@ -1,140 +0,0 @@
> > -/* via_dmablit=2Eh -- PCI DMA BitBlt support for the VIA Unichrome/Pr=
o
> > - *
> > - * Copyright 2005 Thomas Hellstrom=2E
> > - * All Rights Reserved=2E
> > - *
> > - * Permission is hereby granted, free of charge, to any person obtain=
ing a
> > - * copy of this software and associated documentation files (the "Sof=
tware"),
> > - * to deal in the Software without restriction, including without lim=
itation
> > - * the rights to use, copy, modify, merge, publish, distribute, sub l=
icense,
> > - * and/or sell copies of the Software, and to permit persons to whom =
the
> > - * Software is furnished to do so, subject to the following condition=
s:
> > - *
> > - * The above copyright notice and this permission notice (including t=
he
> > - * next paragraph) shall be included in all copies or substantial por=
tions
> > - * of the Software=2E
> > - *
> > - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EX=
PRESS OR
> > - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTAB=
ILITY,
> > - * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT=2E IN NO EVE=
NT SHALL
> > - * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR =
ANY CLAIM,
> > - * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT=
 OR
> > - * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE=
 OR THE
> > - * USE OR OTHER DEALINGS IN THE SOFTWARE=2E
> > - *
> > - * Authors:
> > - *    Thomas Hellstrom=2E
> > - *    Register info from Digeo Inc=2E
> > - */
> > -
> > -#ifndef _VIA_DMABLIT_H
> > -#define _VIA_DMABLIT_H
> > -
> > -#include <linux/dma-mapping=2Eh>
> > -
> > -#define VIA_NUM_BLIT_ENGINES 2
> > -#define VIA_NUM_BLIT_SLOTS 8
> > -
> > -struct _drm_via_descriptor;
> > -
> > -typedef struct _drm_via_sg_info {
> > -	struct page **pages;
> > -	unsigned long num_pages;
> > -	struct _drm_via_descriptor **desc_pages;
> > -	int num_desc_pages;
> > -	int num_desc;
> > -	enum dma_data_direction direction;
> > -	unsigned char *bounce_buffer;
> > -	dma_addr_t chain_start;
> > -	uint32_t free_on_sequence;
> > -	unsigned int descriptors_per_page;
> > -	int aborted;
> > -	enum {
> > -		dr_via_device_mapped,
> > -		dr_via_desc_pages_alloc,
> > -		dr_via_pages_locked,
> > -		dr_via_pages_alloc,
> > -		dr_via_sg_init
> > -	} state;
> > -} drm_via_sg_info_t;
> > -
> > -typedef struct _drm_via_blitq {
> > -	struct drm_device *dev;
> > -	uint32_t cur_blit_handle;
> > -	uint32_t done_blit_handle;
> > -	unsigned serviced;
> > -	unsigned head;
> > -	unsigned cur;
> > -	unsigned num_free;
> > -	unsigned num_outstanding;
> > -	unsigned long end;
> > -	int aborting;
> > -	int is_active;
> > -	drm_via_sg_info_t *blits[VIA_NUM_BLIT_SLOTS];
> > -	spinlock_t blit_lock;
> > -	wait_queue_head_t blit_queue[VIA_NUM_BLIT_SLOTS];
> > -	wait_queue_head_t busy_queue;
> > -	struct work_struct wq;
> > -	struct timer_list poll_timer;
> > -} drm_via_blitq_t;
> > -
> > -
> > -/*
> > - *  PCI DMA Registers
> > - *  Channels 2 & 3 don't seem to be implemented in hardware=2E
> > - */
> > -
> > -#define VIA_PCI_DMA_MAR0            0xE40   /* Memory Address Registe=
r of Channel 0 */
> > -#define VIA_PCI_DMA_DAR0            0xE44   /* Device Address Registe=
r of Channel 0 */
> > -#define VIA_PCI_DMA_BCR0            0xE48   /* Byte Count Register of=
 Channel 0 */
> > -#define VIA_PCI_DMA_DPR0            0xE4C   /* Descriptor Pointer Reg=
ister of Channel 0 */
> > -
> > -#define VIA_PCI_DMA_MAR1            0xE50   /* Memory Address Registe=
r of Channel 1 */
> > -#define VIA_PCI_DMA_DAR1            0xE54   /* Device Address Registe=
r of Channel 1 */
> > -#define VIA_PCI_DMA_BCR1            0xE58   /* Byte Count Register of=
 Channel 1 */
> > -#define VIA_PCI_DMA_DPR1            0xE5C   /* Descriptor Pointer Reg=
ister of Channel 1 */
> > -
> > -#define VIA_PCI_DMA_MAR2            0xE60   /* Memory Address Registe=
r of Channel 2 */
> > -#define VIA_PCI_DMA_DAR2            0xE64   /* Device Address Registe=
r of Channel 2 */
> > -#define VIA_PCI_DMA_BCR2            0xE68   /* Byte Count Register of=
 Channel 2 */
> > -#define VIA_PCI_DMA_DPR2            0xE6C   /* Descriptor Pointer Reg=
ister of Channel 2 */
> > -
> > -#define VIA_PCI_DMA_MAR3            0xE70   /* Memory Address Registe=
r of Channel 3 */
> > -#define VIA_PCI_DMA_DAR3            0xE74   /* Device Address Registe=
r of Channel 3 */
> > -#define VIA_PCI_DMA_BCR3            0xE78   /* Byte Count Register of=
 Channel 3 */
> > -#define VIA_PCI_DMA_DPR3            0xE7C   /* Descriptor Pointer Reg=
ister of Channel 3 */
> > -
> > -#define VIA_PCI_DMA_MR0             0xE80   /* Mode Register of Chann=
el 0 */
> > -#define VIA_PCI_DMA_MR1             0xE84   /* Mode Register of Chann=
el 1 */
> > -#define VIA_PCI_DMA_MR2             0xE88   /* Mode Register of Chann=
el 2 */
> > -#define VIA_PCI_DMA_MR3             0xE8C   /* Mode Register of Chann=
el 3 */
> > -
> > -#define VIA_PCI_DMA_CSR0            0xE90   /* Command/Status Registe=
r of Channel 0 */
> > -#define VIA_PCI_DMA_CSR1            0xE94   /* Command/Status Registe=
r of Channel 1 */
> > -#define VIA_PCI_DMA_CSR2            0xE98   /* Command/Status Registe=
r of Channel 2 */
> > -#define VIA_PCI_DMA_CSR3            0xE9C   /* Command/Status Registe=
r of Channel 3 */
> > -
> > -#define VIA_PCI_DMA_PTR             0xEA0   /* Priority Type Register=
 */
> > -
> > -/* Define for DMA engine */
> > -/* DPR */
> > -#define VIA_DMA_DPR_EC		(1<<1)	/* end of chain */
> > -#define VIA_DMA_DPR_DDIE	(1<<2)	/* descriptor done interrupt enable *=
/
> > -#define VIA_DMA_DPR_DT		(1<<3)	/* direction of transfer (RO) */
> > -
> > -/* MR */
> > -#define VIA_DMA_MR_CM		(1<<0)	/* chaining mode */
> > -#define VIA_DMA_MR_TDIE		(1<<1)	/* transfer done interrupt enable */
> > -#define VIA_DMA_MR_HENDMACMD		(1<<7) /* ? */
> > -
> > -/* CSR */
> > -#define VIA_DMA_CSR_DE		(1<<0)	/* DMA enable */
> > -#define VIA_DMA_CSR_TS		(1<<1)	/* transfer start */
> > -#define VIA_DMA_CSR_TA		(1<<2)	/* transfer abort */
> > -#define VIA_DMA_CSR_TD		(1<<3)	/* transfer done */
> > -#define VIA_DMA_CSR_DD		(1<<4)	/* descriptor done */
> > -#define VIA_DMA_DPR_EC          (1<<1)  /* end of chain */
> > -
> > -
> > -
> > -#endif
> > diff --git a/drivers/gpu/drm/via/via_drv=2Ec b/drivers/gpu/drm/via/via=
_drv=2Ec
> > deleted file mode 100644
> > index 5da38082821f=2E=2E000000000000
> > --- a/drivers/gpu/drm/via/via_drv=2Ec
> > +++ /dev/null
> > @@ -1,124 +0,0 @@
> > -/*
> > - * Copyright 1998-2003 VIA Technologies, Inc=2E All Rights Reserved=
=2E
> > - * Copyright 2001-2003 S3 Graphics, Inc=2E All Rights Reserved=2E
> > - *
> > - * Permission is hereby granted, free of charge, to any person obtain=
ing a
> > - * copy of this software and associated documentation files (the "Sof=
tware"),
> > - * to deal in the Software without restriction, including without lim=
itation
> > - * the rights to use, copy, modify, merge, publish, distribute, sub l=
icense,
> > - * and/or sell copies of the Software, and to permit persons to whom =
the
> > - * Software is furnished to do so, subject to the following condition=
s:
> > - *
> > - * The above copyright notice and this permission notice (including t=
he
> > - * next paragraph) shall be included in all copies or substantial por=
tions
> > - * of the Software=2E
> > - *
> > - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EX=
PRESS OR
> > - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTAB=
ILITY,
> > - * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT=2E IN NO EVE=
NT SHALL
> > - * VIA, S3 GRAPHICS, AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DA=
MAGES OR
> > - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWI=
SE,
> > - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE=
 OR OTHER
> > - * DEALINGS IN THE SOFTWARE=2E
> > - */
> > -
> > -#include <linux/module=2Eh>
> > -#include <linux/pci=2Eh>
> > -
> > -#include <drm/drm_drv=2Eh>
> > -#include <drm/drm_file=2Eh>
> > -#include <drm/drm_pciids=2Eh>
> > -#include <drm/via_drm=2Eh>
> > -
> > -#include "via_drv=2Eh"
> > -
> > -
> > -static int via_driver_open(struct drm_device *dev, struct drm_file *f=
ile)
> > -{
> > -	struct via_file_private *file_priv;
> > -
> > -	DRM_DEBUG_DRIVER("\n");
> > -	file_priv =3D kmalloc(sizeof(*file_priv), GFP_KERNEL);
> > -	if (!file_priv)
> > -		return -ENOMEM;
> > -
> > -	file->driver_priv =3D file_priv;
> > -
> > -	INIT_LIST_HEAD(&file_priv->obj_list);
> > -
> > -	return 0;
> > -}
> > -
> > -static void via_driver_postclose(struct drm_device *dev, struct drm_f=
ile *file)
> > -{
> > -	struct via_file_private *file_priv =3D file->driver_priv;
> > -
> > -	kfree(file_priv);
> > -}
> > -
> > -static struct pci_device_id pciidlist[] =3D {
> > -	viadrv_PCI_IDS
> > -};
> > -
> > -static const struct file_operations via_driver_fops =3D {
> > -	=2Eowner =3D THIS_MODULE,
> > -	=2Eopen =3D drm_open,
> > -	=2Erelease =3D drm_release,
> > -	=2Eunlocked_ioctl =3D drm_ioctl,
> > -	=2Emmap =3D drm_legacy_mmap,
> > -	=2Epoll =3D drm_poll,
> > -	=2Ecompat_ioctl =3D drm_compat_ioctl,
> > -	=2Ellseek =3D noop_llseek,
> > -};
> > -
> > -static struct drm_driver driver =3D {
> > -	=2Edriver_features =3D
> > -	    DRIVER_USE_AGP | DRIVER_HAVE_IRQ | DRIVER_LEGACY,
> > -	=2Eload =3D via_driver_load,
> > -	=2Eunload =3D via_driver_unload,
> > -	=2Eopen =3D via_driver_open,
> > -	=2Epreclose =3D via_reclaim_buffers_locked,
> > -	=2Epostclose =3D via_driver_postclose,
> > -	=2Econtext_dtor =3D via_final_context,
> > -	=2Eget_vblank_counter =3D via_get_vblank_counter,
> > -	=2Eenable_vblank =3D via_enable_vblank,
> > -	=2Edisable_vblank =3D via_disable_vblank,
> > -	=2Eirq_preinstall =3D via_driver_irq_preinstall,
> > -	=2Eirq_postinstall =3D via_driver_irq_postinstall,
> > -	=2Eirq_uninstall =3D via_driver_irq_uninstall,
> > -	=2Eirq_handler =3D via_driver_irq_handler,
> > -	=2Edma_quiescent =3D via_driver_dma_quiescent,
> > -	=2Elastclose =3D via_lastclose,
> > -	=2Eioctls =3D via_ioctls,
> > -	=2Efops =3D &via_driver_fops,
> > -	=2Ename =3D DRIVER_NAME,
> > -	=2Edesc =3D DRIVER_DESC,
> > -	=2Edate =3D DRIVER_DATE,
> > -	=2Emajor =3D DRIVER_MAJOR,
> > -	=2Eminor =3D DRIVER_MINOR,
> > -	=2Epatchlevel =3D DRIVER_PATCHLEVEL,
> > -};
> > -
> > -static struct pci_driver via_pci_driver =3D {
> > -	=2Ename =3D DRIVER_NAME,
> > -	=2Eid_table =3D pciidlist,
> > -};
> > -
> > -static int __init via_init(void)
> > -{
> > -	driver=2Enum_ioctls =3D via_max_ioctl;
> > -	via_init_command_verifier();
> > -	return drm_legacy_pci_init(&driver, &via_pci_driver);
> > -}
> > -
> > -static void __exit via_exit(void)
> > -{
> > -	drm_legacy_pci_exit(&driver, &via_pci_driver);
> > -}
> > -
> > -module_init(via_init);
> > -module_exit(via_exit);
> > -
> > -MODULE_AUTHOR(DRIVER_AUTHOR);
> > -MODULE_DESCRIPTION(DRIVER_DESC);
> > -MODULE_LICENSE("GPL and additional rights");
> > diff --git a/drivers/gpu/drm/via/via_drv=2Eh b/drivers/gpu/drm/via/via=
_drv=2Eh
> > deleted file mode 100644
> > index d5ad1b05bf77=2E=2E000000000000
> > --- a/drivers/gpu/drm/via/via_drv=2Eh
> > +++ /dev/null
> > @@ -1,229 +0,0 @@
> > -/*
> > - * Copyright 1998-2003 VIA Technologies, Inc=2E All Rights Reserved=
=2E
> > - * Copyright 2001-2003 S3 Graphics, Inc=2E All Rights Reserved=2E
> > - *
> > - * Permission is hereby granted, free of charge, to any person obtain=
ing a
> > - * copy of this software and associated documentation files (the "Sof=
tware"),
> > - * to deal in the Software without restriction, including without lim=
itation
> > - * the rights to use, copy, modify, merge, publish, distribute, sub l=
icense,
> > - * and/or sell copies of the Software, and to permit persons to whom =
the
> > - * Software is furnished to do so, subject to the following condition=
s:
> > - *
> > - * The above copyright notice and this permission notice (including t=
he
> > - * next paragraph) shall be included in all copies or substantial por=
tions
> > - * of the Software=2E
> > - *
> > - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EX=
PRESS OR
> > - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTAB=
ILITY,
> > - * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT=2E IN NO EVE=
NT SHALL
> > - * VIA, S3 GRAPHICS, AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DA=
MAGES OR
> > - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWI=
SE,
> > - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE=
 OR OTHER
> > - * DEALINGS IN THE SOFTWARE=2E
> > - */
> > -#ifndef _VIA_DRV_H_
> > -#define _VIA_DRV_H_
> > -
> > -#include <linux/irqreturn=2Eh>
> > -#include <linux/jiffies=2Eh>
> > -#include <linux/sched=2Eh>
> > -#include <linux/sched/signal=2Eh>
> > -#include <linux/wait=2Eh>
> > -
> > -#include <drm/drm_ioctl=2Eh>
> > -#include <drm/drm_legacy=2Eh>
> > -#include <drm/drm_mm=2Eh>
> > -#include <drm/via_drm=2Eh>
> > -
> > -#define DRIVER_AUTHOR	"Various"
> > -
> > -#define DRIVER_NAME		"via"
> > -#define DRIVER_DESC		"VIA Unichrome / Pro"
> > -#define DRIVER_DATE		"20070202"
> > -
> > -#define DRIVER_MAJOR		2
> > -#define DRIVER_MINOR		11
> > -#define DRIVER_PATCHLEVEL	1
> > -
> > -#include "via_verifier=2Eh"
> > -
> > -#include "via_dmablit=2Eh"
> > -
> > -#define VIA_PCI_BUF_SIZE 60000
> > -#define VIA_FIRE_BUF_SIZE  1024
> > -#define VIA_NUM_IRQS 4
> > -
> > -typedef struct drm_via_ring_buffer {
> > -	drm_local_map_t map;
> > -	char *virtual_start;
> > -} drm_via_ring_buffer_t;
> > -
> > -typedef uint32_t maskarray_t[5];
> > -
> > -typedef struct drm_via_irq {
> > -	atomic_t irq_received;
> > -	uint32_t pending_mask;
> > -	uint32_t enable_mask;
> > -	wait_queue_head_t irq_queue;
> > -} drm_via_irq_t;
> > -
> > -typedef struct drm_via_private {
> > -	drm_via_sarea_t *sarea_priv;
> > -	drm_local_map_t *sarea;
> > -	drm_local_map_t *fb;
> > -	drm_local_map_t *mmio;
> > -	unsigned long agpAddr;
> > -	wait_queue_head_t decoder_queue[VIA_NR_XVMC_LOCKS];
> > -	char *dma_ptr;
> > -	unsigned int dma_low;
> > -	unsigned int dma_high;
> > -	unsigned int dma_offset;
> > -	uint32_t dma_wrap;
> > -	volatile uint32_t *last_pause_ptr;
> > -	volatile uint32_t *hw_addr_ptr;
> > -	drm_via_ring_buffer_t ring;
> > -	ktime_t last_vblank;
> > -	int last_vblank_valid;
> > -	ktime_t nsec_per_vblank;
> > -	atomic_t vbl_received;
> > -	drm_via_state_t hc_state;
> > -	char pci_buf[VIA_PCI_BUF_SIZE];
> > -	const uint32_t *fire_offsets[VIA_FIRE_BUF_SIZE];
> > -	uint32_t num_fire_offsets;
> > -	int chipset;
> > -	drm_via_irq_t via_irqs[VIA_NUM_IRQS];
> > -	unsigned num_irqs;
> > -	maskarray_t *irq_masks;
> > -	uint32_t irq_enable_mask;
> > -	uint32_t irq_pending_mask;
> > -	int *irq_map;
> > -	unsigned int idle_fault;
> > -	int vram_initialized;
> > -	struct drm_mm vram_mm;
> > -	int agp_initialized;
> > -	struct drm_mm agp_mm;
> > -	/** Mapping of userspace keys to mm objects */
> > -	struct idr object_idr;
> > -	unsigned long vram_offset;
> > -	unsigned long agp_offset;
> > -	drm_via_blitq_t blit_queues[VIA_NUM_BLIT_ENGINES];
> > -	uint32_t dma_diff;
> > -} drm_via_private_t;
> > -
> > -struct via_file_private {
> > -	struct list_head obj_list;
> > -};
> > -
> > -enum via_family {
> > -  VIA_OTHER =3D 0,     /* Baseline */
> > -  VIA_PRO_GROUP_A,   /* Another video engine and DMA commands */
> > -  VIA_DX9_0          /* Same video as pro_group_a, but 3D is unsuppor=
ted */
> > -};
> > -
> > -/* VIA MMIO register access */
> > -static inline u32 via_read(struct drm_via_private *dev_priv, u32 reg)
> > -{
> > -	return readl((void __iomem *)(dev_priv->mmio->handle + reg));
> > -}
> > -
> > -static inline void via_write(struct drm_via_private *dev_priv, u32 re=
g,
> > -			     u32 val)
> > -{
> > -	writel(val, (void __iomem *)(dev_priv->mmio->handle + reg));
> > -}
> > -
> > -static inline void via_write8(struct drm_via_private *dev_priv, u32 r=
eg,
> > -			      u32 val)
> > -{
> > -	writeb(val, (void __iomem *)(dev_priv->mmio->handle + reg));
> > -}
> > -
> > -static inline void via_write8_mask(struct drm_via_private *dev_priv,
> > -				   u32 reg, u32 mask, u32 val)
> > -{
> > -	u32 tmp;
> > -
> > -	tmp =3D readb((void __iomem *)(dev_priv->mmio->handle + reg));
> > -	tmp =3D (tmp & ~mask) | (val & mask);
> > -	writeb(tmp, (void __iomem *)(dev_priv->mmio->handle + reg));
> > -}
> > -
> > -/*
> > - * Poll in a loop waiting for 'contidition' to be true=2E
> > - * Note: A direct replacement with wait_event_interruptible_timeout()
> > - *       will not work unless driver is updated to emit wake_up()
> > - *       in relevant places that can impact the 'condition'
> > - *
> > - * Returns:
> > - *   ret keeps current value if 'condition' becomes true
> > - *   ret =3D -BUSY if timeout happens
> > - *   ret =3D -EINTR if a signal interrupted the waiting period
> > - */
> > -#define VIA_WAIT_ON( ret, queue, timeout, condition )		\
> > -do {								\
> > -	DECLARE_WAITQUEUE(entry, current);			\
> > -	unsigned long end =3D jiffies + (timeout);		\
> > -	add_wait_queue(&(queue), &entry);			\
> > -								\
> > -	for (;;) {						\
> > -		__set_current_state(TASK_INTERRUPTIBLE);	\
> > -		if (condition)					\
> > -			break;					\
> > -		if (time_after_eq(jiffies, end)) {		\
> > -			ret =3D -EBUSY;				\
> > -			break;					\
> > -		}						\
> > -		schedule_timeout((HZ/100 > 1) ? HZ/100 : 1);	\
> > -		if (signal_pending(current)) {			\
> > -			ret =3D -EINTR;				\
> > -			break;					\
> > -		}						\
> > -	}							\
> > -	__set_current_state(TASK_RUNNING);			\
> > -	remove_wait_queue(&(queue), &entry);			\
> > -} while (0)
> > -
> > -extern const struct drm_ioctl_desc via_ioctls[];
> > -extern int via_max_ioctl;
> > -
> > -extern int via_fb_init(struct drm_device *dev, void *data, struct drm=
_file *file_priv);
> > -extern int via_mem_alloc(struct drm_device *dev, void *data, struct d=
rm_file *file_priv);
> > -extern int via_mem_free(struct drm_device *dev, void *data, struct dr=
m_file *file_priv);
> > -extern int via_agp_init(struct drm_device *dev, void *data, struct dr=
m_file *file_priv);
> > -extern int via_map_init(struct drm_device *dev, void *data, struct dr=
m_file *file_priv);
> > -extern int via_decoder_futex(struct drm_device *dev, void *data, stru=
ct drm_file *file_priv);
> > -extern int via_wait_irq(struct drm_device *dev, void *data, struct dr=
m_file *file_priv);
> > -extern int via_dma_blit_sync(struct drm_device *dev, void *data, stru=
ct drm_file *file_priv);
> > -extern int via_dma_blit(struct drm_device *dev, void *data, struct dr=
m_file *file_priv);
> > -
> > -extern int via_driver_load(struct drm_device *dev, unsigned long chip=
set);
> > -extern void via_driver_unload(struct drm_device *dev);
> > -
> > -extern int via_init_context(struct drm_device *dev, int context);
> > -extern int via_final_context(struct drm_device *dev, int context);
> > -
> > -extern int via_do_cleanup_map(struct drm_device *dev);
> > -extern u32 via_get_vblank_counter(struct drm_device *dev, unsigned in=
t pipe);
> > -extern int via_enable_vblank(struct drm_device *dev, unsigned int pip=
e);
> > -extern void via_disable_vblank(struct drm_device *dev, unsigned int p=
ipe);
> > -
> > -extern irqreturn_t via_driver_irq_handler(int irq, void *arg);
> > -extern void via_driver_irq_preinstall(struct drm_device *dev);
> > -extern int via_driver_irq_postinstall(struct drm_device *dev);
> > -extern void via_driver_irq_uninstall(struct drm_device *dev);
> > -
> > -extern int via_dma_cleanup(struct drm_device *dev);
> > -extern void via_init_command_verifier(void);
> > -extern int via_driver_dma_quiescent(struct drm_device *dev);
> > -extern void via_init_futex(drm_via_private_t *dev_priv);
> > -extern void via_cleanup_futex(drm_via_private_t *dev_priv);
> > -extern void via_release_futex(drm_via_private_t *dev_priv, int contex=
t);
> > -
> > -extern void via_reclaim_buffers_locked(struct drm_device *dev,
> > -				       struct drm_file *file_priv);
> > -extern void via_lastclose(struct drm_device *dev);
> > -
> > -extern void via_dmablit_handler(struct drm_device *dev, int engine, i=
nt from_irq);
> > -extern void via_init_dmablit(struct drm_device *dev);
> > -
> > -#endif
> > diff --git a/drivers/gpu/drm/via/via_irq=2Ec b/drivers/gpu/drm/via/via=
_irq=2Ec
> > deleted file mode 100644
> > index faeae5d881fb=2E=2E000000000000
> > --- a/drivers/gpu/drm/via/via_irq=2Ec
> > +++ /dev/null
> > @@ -1,388 +0,0 @@
> > -/* via_irq=2Ec
> > - *
> > - * Copyright 2004 BEAM Ltd=2E
> > - * Copyright 2002 Tungsten Graphics, Inc=2E
> > - * Copyright 2005 Thomas Hellstrom=2E
> > - * All Rights Reserved=2E
> > - *
> > - * Permission is hereby granted, free of charge, to any person obtain=
ing a
> > - * copy of this software and associated documentation files (the "Sof=
tware"),
> > - * to deal in the Software without restriction, including without lim=
itation
> > - * the rights to use, copy, modify, merge, publish, distribute, subli=
cense,
> > - * and/or sell copies of the Software, and to permit persons to whom =
the
> > - * Software is furnished to do so, subject to the following condition=
s:
> > - *
> > - * The above copyright notice and this permission notice (including t=
he next
> > - * paragraph) shall be included in all copies or substantial portions=
 of the
> > - * Software=2E
> > - *
> > - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EX=
PRESS OR
> > - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTAB=
ILITY,
> > - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT=2E  IN NO EVE=
NT SHALL
> > - * BEAM LTD, TUNGSTEN GRAPHICS  AND/OR ITS SUPPLIERS BE LIABLE FOR AN=
Y CLAIM,
> > - * DAMAGES OR
> > - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWI=
SE,
> > - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE=
 OR OTHER
> > - * DEALINGS IN THE SOFTWARE=2E
> > - *
> > - * Authors:
> > - *    Terry Barnaby <terry1@beam=2Eltd=2Euk>
> > - *    Keith Whitwell <keith@tungstengraphics=2Ecom>
> > - *    Thomas Hellstrom <unichrome@shipmail=2Eorg>
> > - *
> > - * This code provides standard DRM access to the Via Unichrome / Pro =
Vertical blank
> > - * interrupt, as well as an infrastructure to handle other interrupts=
 of the chip=2E
> > - * The refresh rate is also calculated for video playback sync purpos=
es=2E
> > - */
> > -
> > -#include <drm/drm_device=2Eh>
> > -#include <drm/drm_vblank=2Eh>
> > -#include <drm/via_drm=2Eh>
> > -
> > -#include "via_drv=2Eh"
> > -
> > -#define VIA_REG_INTERRUPT       0x200
> > -
> > -/* VIA_REG_INTERRUPT */
> > -#define VIA_IRQ_GLOBAL	  (1 << 31)
> > -#define VIA_IRQ_VBLANK_ENABLE   (1 << 19)
> > -#define VIA_IRQ_VBLANK_PENDING  (1 << 3)
> > -#define VIA_IRQ_HQV0_ENABLE     (1 << 11)
> > -#define VIA_IRQ_HQV1_ENABLE     (1 << 25)
> > -#define VIA_IRQ_HQV0_PENDING    (1 << 9)
> > -#define VIA_IRQ_HQV1_PENDING    (1 << 10)
> > -#define VIA_IRQ_DMA0_DD_ENABLE  (1 << 20)
> > -#define VIA_IRQ_DMA0_TD_ENABLE  (1 << 21)
> > -#define VIA_IRQ_DMA1_DD_ENABLE  (1 << 22)
> > -#define VIA_IRQ_DMA1_TD_ENABLE  (1 << 23)
> > -#define VIA_IRQ_DMA0_DD_PENDING (1 << 4)
> > -#define VIA_IRQ_DMA0_TD_PENDING (1 << 5)
> > -#define VIA_IRQ_DMA1_DD_PENDING (1 << 6)
> > -#define VIA_IRQ_DMA1_TD_PENDING (1 << 7)
> > -
> > -
> > -/*
> > - * Device-specific IRQs go here=2E This type might need to be extende=
d with
> > - * the register if there are multiple IRQ control registers=2E
> > - * Currently we activate the HQV interrupts of  Unichrome Pro group A=
=2E
> > - */
> > -
> > -static maskarray_t via_pro_group_a_irqs[] =3D {
> > -	{VIA_IRQ_HQV0_ENABLE, VIA_IRQ_HQV0_PENDING, 0x000003D0, 0x00008010,
> > -	 0x00000000 },
> > -	{VIA_IRQ_HQV1_ENABLE, VIA_IRQ_HQV1_PENDING, 0x000013D0, 0x00008010,
> > -	 0x00000000 },
> > -	{VIA_IRQ_DMA0_TD_ENABLE, VIA_IRQ_DMA0_TD_PENDING, VIA_PCI_DMA_CSR0,
> > -	 VIA_DMA_CSR_TA | VIA_DMA_CSR_TD, 0x00000008},
> > -	{VIA_IRQ_DMA1_TD_ENABLE, VIA_IRQ_DMA1_TD_PENDING, VIA_PCI_DMA_CSR1,
> > -	 VIA_DMA_CSR_TA | VIA_DMA_CSR_TD, 0x00000008},
> > -};
> > -static int via_num_pro_group_a =3D ARRAY_SIZE(via_pro_group_a_irqs);
> > -static int via_irqmap_pro_group_a[] =3D {0, 1, -1, 2, -1, 3};
> > -
> > -static maskarray_t via_unichrome_irqs[] =3D {
> > -	{VIA_IRQ_DMA0_TD_ENABLE, VIA_IRQ_DMA0_TD_PENDING, VIA_PCI_DMA_CSR0,
> > -	 VIA_DMA_CSR_TA | VIA_DMA_CSR_TD, 0x00000008},
> > -	{VIA_IRQ_DMA1_TD_ENABLE, VIA_IRQ_DMA1_TD_PENDING, VIA_PCI_DMA_CSR1,
> > -	 VIA_DMA_CSR_TA | VIA_DMA_CSR_TD, 0x00000008}
> > -};
> > -static int via_num_unichrome =3D ARRAY_SIZE(via_unichrome_irqs);
> > -static int via_irqmap_unichrome[] =3D {-1, -1, -1, 0, -1, 1};
> > -
> > -
> > -u32 via_get_vblank_counter(struct drm_device *dev, unsigned int pipe)
> > -{
> > -	drm_via_private_t *dev_priv =3D dev->dev_private;
> > -
> > -	if (pipe !=3D 0)
> > -		return 0;
> > -
> > -	return atomic_read(&dev_priv->vbl_received);
> > -}
> > -
> > -irqreturn_t via_driver_irq_handler(int irq, void *arg)
> > -{
> > -	struct drm_device *dev =3D (struct drm_device *) arg;
> > -	drm_via_private_t *dev_priv =3D (drm_via_private_t *) dev->dev_priva=
te;
> > -	u32 status;
> > -	int handled =3D 0;
> > -	ktime_t cur_vblank;
> > -	drm_via_irq_t *cur_irq =3D dev_priv->via_irqs;
> > -	int i;
> > -
> > -	status =3D via_read(dev_priv, VIA_REG_INTERRUPT);
> > -	if (status & VIA_IRQ_VBLANK_PENDING) {
> > -		atomic_inc(&dev_priv->vbl_received);
> > -		if (!(atomic_read(&dev_priv->vbl_received) & 0x0F)) {
> > -			cur_vblank =3D ktime_get();
> > -			if (dev_priv->last_vblank_valid) {
> > -				dev_priv->nsec_per_vblank =3D
> > -					ktime_sub(cur_vblank,
> > -						dev_priv->last_vblank) >> 4;
> > -			}
> > -			dev_priv->last_vblank =3D cur_vblank;
> > -			dev_priv->last_vblank_valid =3D 1;
> > -		}
> > -		if (!(atomic_read(&dev_priv->vbl_received) & 0xFF)) {
> > -			DRM_DEBUG("nsec per vblank is: %llu\n",
> > -				  ktime_to_ns(dev_priv->nsec_per_vblank));
> > -		}
> > -		drm_handle_vblank(dev, 0);
> > -		handled =3D 1;
> > -	}
> > -
> > -	for (i =3D 0; i < dev_priv->num_irqs; ++i) {
> > -		if (status & cur_irq->pending_mask) {
> > -			atomic_inc(&cur_irq->irq_received);
> > -			wake_up(&cur_irq->irq_queue);
> > -			handled =3D 1;
> > -			if (dev_priv->irq_map[drm_via_irq_dma0_td] =3D=3D i)
> > -				via_dmablit_handler(dev, 0, 1);
> > -			else if (dev_priv->irq_map[drm_via_irq_dma1_td] =3D=3D i)
> > -				via_dmablit_handler(dev, 1, 1);
> > -		}
> > -		cur_irq++;
> > -	}
> > -
> > -	/* Acknowledge interrupts */
> > -	via_write(dev_priv, VIA_REG_INTERRUPT, status);
> > -
> > -
> > -	if (handled)
> > -		return IRQ_HANDLED;
> > -	else
> > -		return IRQ_NONE;
> > -}
> > -
> > -static __inline__ void viadrv_acknowledge_irqs(drm_via_private_t *dev=
_priv)
> > -{
> > -	u32 status;
> > -
> > -	if (dev_priv) {
> > -		/* Acknowledge interrupts */
> > -		status =3D via_read(dev_priv, VIA_REG_INTERRUPT);
> > -		via_write(dev_priv, VIA_REG_INTERRUPT, status |
> > -			  dev_priv->irq_pending_mask);
> > -	}
> > -}
> > -
> > -int via_enable_vblank(struct drm_device *dev, unsigned int pipe)
> > -{
> > -	drm_via_private_t *dev_priv =3D dev->dev_private;
> > -	u32 status;
> > -
> > -	if (pipe !=3D 0) {
> > -		DRM_ERROR("%s:  bad crtc %u\n", __func__, pipe);
> > -		return -EINVAL;
> > -	}
> > -
> > -	status =3D via_read(dev_priv, VIA_REG_INTERRUPT);
> > -	via_write(dev_priv, VIA_REG_INTERRUPT, status | VIA_IRQ_VBLANK_ENABL=
E);
> > -
> > -	via_write8(dev_priv, 0x83d4, 0x11);
> > -	via_write8_mask(dev_priv, 0x83d5, 0x30, 0x30);
> > -
> > -	return 0;
> > -}
> > -
> > -void via_disable_vblank(struct drm_device *dev, unsigned int pipe)
> > -{
> > -	drm_via_private_t *dev_priv =3D dev->dev_private;
> > -	u32 status;
> > -
> > -	status =3D via_read(dev_priv, VIA_REG_INTERRUPT);
> > -	via_write(dev_priv, VIA_REG_INTERRUPT, status & ~VIA_IRQ_VBLANK_ENAB=
LE);
> > -
> > -	via_write8(dev_priv, 0x83d4, 0x11);
> > -	via_write8_mask(dev_priv, 0x83d5, 0x30, 0);
> > -
> > -	if (pipe !=3D 0)
> > -		DRM_ERROR("%s:  bad crtc %u\n", __func__, pipe);
> > -}
> > -
> > -static int
> > -via_driver_irq_wait(struct drm_device *dev, unsigned int irq, int for=
ce_sequence,
> > -		    unsigned int *sequence)
> > -{
> > -	drm_via_private_t *dev_priv =3D (drm_via_private_t *) dev->dev_priva=
te;
> > -	unsigned int cur_irq_sequence;
> > -	drm_via_irq_t *cur_irq;
> > -	int ret =3D 0;
> > -	maskarray_t *masks;
> > -	int real_irq;
> > -
> > -	DRM_DEBUG("\n");
> > -
> > -	if (!dev_priv) {
> > -		DRM_ERROR("called with no initialization\n");
> > -		return -EINVAL;
> > -	}
> > -
> > -	if (irq >=3D drm_via_irq_num) {
> > -		DRM_ERROR("Trying to wait on unknown irq %d\n", irq);
> > -		return -EINVAL;
> > -	}
> > -
> > -	real_irq =3D dev_priv->irq_map[irq];
> > -
> > -	if (real_irq < 0) {
> > -		DRM_ERROR("Video IRQ %d not available on this hardware=2E\n",
> > -			  irq);
> > -		return -EINVAL;
> > -	}
> > -
> > -	masks =3D dev_priv->irq_masks;
> > -	cur_irq =3D dev_priv->via_irqs + real_irq;
> > -
> > -	if (masks[real_irq][2] && !force_sequence) {
> > -		VIA_WAIT_ON(ret, cur_irq->irq_queue, 3 * HZ,
> > -			    ((via_read(dev_priv, masks[irq][2]) & masks[irq][3]) =3D=3D
> > -			     masks[irq][4]));
> > -		cur_irq_sequence =3D atomic_read(&cur_irq->irq_received);
> > -	} else {
> > -		VIA_WAIT_ON(ret, cur_irq->irq_queue, 3 * HZ,
> > -			    (((cur_irq_sequence =3D
> > -			       atomic_read(&cur_irq->irq_received)) -
> > -			      *sequence) <=3D (1 << 23)));
> > -	}
> > -	*sequence =3D cur_irq_sequence;
> > -	return ret;
> > -}
> > -
> > -
> > -/*
> > - * drm_dma=2Eh hooks
> > - */
> > -
> > -void via_driver_irq_preinstall(struct drm_device *dev)
> > -{
> > -	drm_via_private_t *dev_priv =3D (drm_via_private_t *) dev->dev_priva=
te;
> > -	u32 status;
> > -	drm_via_irq_t *cur_irq;
> > -	int i;
> > -
> > -	DRM_DEBUG("dev_priv: %p\n", dev_priv);
> > -	if (dev_priv) {
> > -		cur_irq =3D dev_priv->via_irqs;
> > -
> > -		dev_priv->irq_enable_mask =3D VIA_IRQ_VBLANK_ENABLE;
> > -		dev_priv->irq_pending_mask =3D VIA_IRQ_VBLANK_PENDING;
> > -
> > -		if (dev_priv->chipset =3D=3D VIA_PRO_GROUP_A ||
> > -		    dev_priv->chipset =3D=3D VIA_DX9_0) {
> > -			dev_priv->irq_masks =3D via_pro_group_a_irqs;
> > -			dev_priv->num_irqs =3D via_num_pro_group_a;
> > -			dev_priv->irq_map =3D via_irqmap_pro_group_a;
> > -		} else {
> > -			dev_priv->irq_masks =3D via_unichrome_irqs;
> > -			dev_priv->num_irqs =3D via_num_unichrome;
> > -			dev_priv->irq_map =3D via_irqmap_unichrome;
> > -		}
> > -
> > -		for (i =3D 0; i < dev_priv->num_irqs; ++i) {
> > -			atomic_set(&cur_irq->irq_received, 0);
> > -			cur_irq->enable_mask =3D dev_priv->irq_masks[i][0];
> > -			cur_irq->pending_mask =3D dev_priv->irq_masks[i][1];
> > -			init_waitqueue_head(&cur_irq->irq_queue);
> > -			dev_priv->irq_enable_mask |=3D cur_irq->enable_mask;
> > -			dev_priv->irq_pending_mask |=3D cur_irq->pending_mask;
> > -			cur_irq++;
> > -
> > -			DRM_DEBUG("Initializing IRQ %d\n", i);
> > -		}
> > -
> > -		dev_priv->last_vblank_valid =3D 0;
> > -
> > -		/* Clear VSync interrupt regs */
> > -		status =3D via_read(dev_priv, VIA_REG_INTERRUPT);
> > -		via_write(dev_priv, VIA_REG_INTERRUPT, status &
> > -			  ~(dev_priv->irq_enable_mask));
> > -
> > -		/* Clear bits if they're already high */
> > -		viadrv_acknowledge_irqs(dev_priv);
> > -	}
> > -}
> > -
> > -int via_driver_irq_postinstall(struct drm_device *dev)
> > -{
> > -	drm_via_private_t *dev_priv =3D (drm_via_private_t *) dev->dev_priva=
te;
> > -	u32 status;
> > -
> > -	DRM_DEBUG("fun: %s\n", __func__);
> > -	if (!dev_priv)
> > -		return -EINVAL;
> > -
> > -	status =3D via_read(dev_priv, VIA_REG_INTERRUPT);
> > -	via_write(dev_priv, VIA_REG_INTERRUPT, status | VIA_IRQ_GLOBAL
> > -		  | dev_priv->irq_enable_mask);
> > -
> > -	/* Some magic, oh for some data sheets ! */
> > -	via_write8(dev_priv, 0x83d4, 0x11);
> > -	via_write8_mask(dev_priv, 0x83d5, 0x30, 0x30);
> > -
> > -	return 0;
> > -}
> > -
> > -void via_driver_irq_uninstall(struct drm_device *dev)
> > -{
> > -	drm_via_private_t *dev_priv =3D (drm_via_private_t *) dev->dev_priva=
te;
> > -	u32 status;
> > -
> > -	DRM_DEBUG("\n");
> > -	if (dev_priv) {
> > -
> > -		/* Some more magic, oh for some data sheets ! */
> > -
> > -		via_write8(dev_priv, 0x83d4, 0x11);
> > -		via_write8_mask(dev_priv, 0x83d5, 0x30, 0);
> > -
> > -		status =3D via_read(dev_priv, VIA_REG_INTERRUPT);
> > -		via_write(dev_priv, VIA_REG_INTERRUPT, status &
> > -			  ~(VIA_IRQ_VBLANK_ENABLE | dev_priv->irq_enable_mask));
> > -	}
> > -}
> > -
> > -int via_wait_irq(struct drm_device *dev, void *data, struct drm_file =
*file_priv)
> > -{
> > -	drm_via_irqwait_t *irqwait =3D data;
> > -	struct timespec64 now;
> > -	int ret =3D 0;
> > -	drm_via_private_t *dev_priv =3D (drm_via_private_t *) dev->dev_priva=
te;
> > -	drm_via_irq_t *cur_irq =3D dev_priv->via_irqs;
> > -	int force_sequence;
> > -
> > -	if (irqwait->request=2Eirq >=3D dev_priv->num_irqs) {
> > -		DRM_ERROR("Trying to wait on unknown irq %d\n",
> > -			  irqwait->request=2Eirq);
> > -		return -EINVAL;
> > -	}
> > -
> > -	cur_irq +=3D irqwait->request=2Eirq;
> > -
> > -	switch (irqwait->request=2Etype & ~VIA_IRQ_FLAGS_MASK) {
> > -	case VIA_IRQ_RELATIVE:
> > -		irqwait->request=2Esequence +=3D
> > -			atomic_read(&cur_irq->irq_received);
> > -		irqwait->request=2Etype &=3D ~_DRM_VBLANK_RELATIVE;
> > -		break;
> > -	case VIA_IRQ_ABSOLUTE:
> > -		break;
> > -	default:
> > -		return -EINVAL;
> > -	}
> > -
> > -	if (irqwait->request=2Etype & VIA_IRQ_SIGNAL) {
> > -		DRM_ERROR("Signals on Via IRQs not implemented yet=2E\n");
> > -		return -EINVAL;
> > -	}
> > -
> > -	force_sequence =3D (irqwait->request=2Etype & VIA_IRQ_FORCE_SEQUENCE=
);
> > -
> > -	ret =3D via_driver_irq_wait(dev, irqwait->request=2Eirq, force_seque=
nce,
> > -				  &irqwait->request=2Esequence);
> > -	ktime_get_ts64(&now);
> > -	irqwait->reply=2Etval_sec =3D now=2Etv_sec;
> > -	irqwait->reply=2Etval_usec =3D now=2Etv_nsec / NSEC_PER_USEC;
> > -
> > -	return ret;
> > -}
> > diff --git a/drivers/gpu/drm/via/via_map=2Ec b/drivers/gpu/drm/via/via=
_map=2Ec
> > deleted file mode 100644
> > index a9f6b0c11966=2E=2E000000000000
> > --- a/drivers/gpu/drm/via/via_map=2Ec
> > +++ /dev/null
> > @@ -1,132 +0,0 @@
> > -/*
> > - * Copyright 1998-2003 VIA Technologies, Inc=2E All Rights Reserved=
=2E
> > - * Copyright 2001-2003 S3 Graphics, Inc=2E All Rights Reserved=2E
> > - *
> > - * Permission is hereby granted, free of charge, to any person obtain=
ing a
> > - * copy of this software and associated documentation files (the "Sof=
tware"),
> > - * to deal in the Software without restriction, including without lim=
itation
> > - * the rights to use, copy, modify, merge, publish, distribute, sub l=
icense,
> > - * and/or sell copies of the Software, and to permit persons to whom =
the
> > - * Software is furnished to do so, subject to the following condition=
s:
> > - *
> > - * The above copyright notice and this permission notice (including t=
he
> > - * next paragraph) shall be included in all copies or substantial por=
tions
> > - * of the Software=2E
> > - *
> > - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EX=
PRESS OR
> > - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTAB=
ILITY,
> > - * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT=2E IN NO EVE=
NT SHALL
> > - * VIA, S3 GRAPHICS, AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DA=
MAGES OR
> > - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWI=
SE,
> > - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE=
 OR OTHER
> > - * DEALINGS IN THE SOFTWARE=2E
> > - */
> > -
> > -#include <linux/pci=2Eh>
> > -
> > -#include <drm/drm_device=2Eh>
> > -#include <drm/drm_vblank=2Eh>
> > -#include <drm/via_drm=2Eh>
> > -
> > -#include "via_drv=2Eh"
> > -
> > -static int via_do_init_map(struct drm_device *dev, drm_via_init_t *in=
it)
> > -{
> > -	drm_via_private_t *dev_priv =3D dev->dev_private;
> > -
> > -	DRM_DEBUG("\n");
> > -
> > -	dev_priv->sarea =3D drm_legacy_getsarea(dev);
> > -	if (!dev_priv->sarea) {
> > -		DRM_ERROR("could not find sarea!\n");
> > -		dev->dev_private =3D (void *)dev_priv;
> > -		via_do_cleanup_map(dev);
> > -		return -EINVAL;
> > -	}
> > -
> > -	dev_priv->fb =3D drm_legacy_findmap(dev, init->fb_offset);
> > -	if (!dev_priv->fb) {
> > -		DRM_ERROR("could not find framebuffer!\n");
> > -		dev->dev_private =3D (void *)dev_priv;
> > -		via_do_cleanup_map(dev);
> > -		return -EINVAL;
> > -	}
> > -	dev_priv->mmio =3D drm_legacy_findmap(dev, init->mmio_offset);
> > -	if (!dev_priv->mmio) {
> > -		DRM_ERROR("could not find mmio region!\n");
> > -		dev->dev_private =3D (void *)dev_priv;
> > -		via_do_cleanup_map(dev);
> > -		return -EINVAL;
> > -	}
> > -
> > -	dev_priv->sarea_priv =3D
> > -	    (drm_via_sarea_t *) ((u8 *) dev_priv->sarea->handle +
> > -				 init->sarea_priv_offset);
> > -
> > -	dev_priv->agpAddr =3D init->agpAddr;
> > -
> > -	via_init_futex(dev_priv);
> > -
> > -	via_init_dmablit(dev);
> > -
> > -	dev->dev_private =3D (void *)dev_priv;
> > -	return 0;
> > -}
> > -
> > -int via_do_cleanup_map(struct drm_device *dev)
> > -{
> > -	via_dma_cleanup(dev);
> > -
> > -	return 0;
> > -}
> > -
> > -int via_map_init(struct drm_device *dev, void *data, struct drm_file =
*file_priv)
> > -{
> > -	drm_via_init_t *init =3D data;
> > -
> > -	DRM_DEBUG("\n");
> > -
> > -	switch (init->func) {
> > -	case VIA_INIT_MAP:
> > -		return via_do_init_map(dev, init);
> > -	case VIA_CLEANUP_MAP:
> > -		return via_do_cleanup_map(dev);
> > -	}
> > -
> > -	return -EINVAL;
> > -}
> > -
> > -int via_driver_load(struct drm_device *dev, unsigned long chipset)
> > -{
> > -	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
> > -	drm_via_private_t *dev_priv;
> > -	int ret =3D 0;
> > -
> > -	dev_priv =3D kzalloc(sizeof(drm_via_private_t), GFP_KERNEL);
> > -	if (dev_priv =3D=3D NULL)
> > -		return -ENOMEM;
> > -
> > -	idr_init(&dev_priv->object_idr);
> > -	dev->dev_private =3D (void *)dev_priv;
> > -
> > -	dev_priv->chipset =3D chipset;
> > -
> > -	pci_set_master(pdev);
> > -
> > -	ret =3D drm_vblank_init(dev, 1);
> > -	if (ret) {
> > -		kfree(dev_priv);
> > -		return ret;
> > -	}
> > -
> > -	return 0;
> > -}
> > -
> > -void via_driver_unload(struct drm_device *dev)
> > -{
> > -	drm_via_private_t *dev_priv =3D dev->dev_private;
> > -
> > -	idr_destroy(&dev_priv->object_idr);
> > -
> > -	kfree(dev_priv);
> > -}
> > diff --git a/drivers/gpu/drm/via/via_mm=2Ec b/drivers/gpu/drm/via/via_=
mm=2Ec
> > deleted file mode 100644
> > index c9afa1a51f23=2E=2E000000000000
> > --- a/drivers/gpu/drm/via/via_mm=2Ec
> > +++ /dev/null
> > @@ -1,241 +0,0 @@
> > -/*
> > - * Copyright 2006 Tungsten Graphics Inc=2E, Bismarck, ND=2E, USA=2E
> > - * All rights reserved=2E
> > - *
> > - * Permission is hereby granted, free of charge, to any person obtain=
ing a
> > - * copy of this software and associated documentation files (the "Sof=
tware"),
> > - * to deal in the Software without restriction, including without lim=
itation
> > - * the rights to use, copy, modify, merge, publish, distribute, sub l=
icense,
> > - * and/or sell copies of the Software, and to permit persons to whom =
the
> > - * Software is furnished to do so, subject to the following condition=
s:
> > - *
> > - * The above copyright notice and this permission notice (including t=
he
> > - * next paragraph) shall be included in all copies or substantial por=
tions
> > - * of the Software=2E
> > - *
> > - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EX=
PRESS OR
> > - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTAB=
ILITY,
> > - * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT=2E IN NO EVE=
NT SHALL
> > - * THE AUTHORS OR COPYRIGHT HOLDERS AND/OR THEIR SUPPLIERS BE LIABLE =
FOR ANY CLAIM,
> > - * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT=
 OR OTHERWISE,
> > - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE=
 OR OTHER
> > - * DEALINGS IN THE SOFTWARE=2E
> > - */
> > -/*
> > - * Authors: Thomas Hellstr=C3=B6m <thomas-at-tungstengraphics-dot-com=
>
> > - */
> > -
> > -#include <linux/slab=2Eh>
> > -
> > -#include <drm/drm_device=2Eh>
> > -#include <drm/drm_file=2Eh>
> > -#include <drm/via_drm=2Eh>
> > -
> > -#include "via_drv=2Eh"
> > -
> > -#define VIA_MM_ALIGN_SHIFT 4
> > -#define VIA_MM_ALIGN_MASK ((1 << VIA_MM_ALIGN_SHIFT) - 1)
> > -
> > -struct via_memblock {
> > -	struct drm_mm_node mm_node;
> > -	struct list_head owner_list;
> > -};
> > -
> > -int via_agp_init(struct drm_device *dev, void *data, struct drm_file =
*file_priv)
> > -{
> > -	drm_via_agp_t *agp =3D data;
> > -	drm_via_private_t *dev_priv =3D (drm_via_private_t *) dev->dev_priva=
te;
> > -
> > -	mutex_lock(&dev->struct_mutex);
> > -	drm_mm_init(&dev_priv->agp_mm, 0, agp->size >> VIA_MM_ALIGN_SHIFT);
> > -
> > -	dev_priv->agp_initialized =3D 1;
> > -	dev_priv->agp_offset =3D agp->offset;
> > -	mutex_unlock(&dev->struct_mutex);
> > -
> > -	DRM_DEBUG("offset =3D %u, size =3D %u\n", agp->offset, agp->size);
> > -	return 0;
> > -}
> > -
> > -int via_fb_init(struct drm_device *dev, void *data, struct drm_file *=
file_priv)
> > -{
> > -	drm_via_fb_t *fb =3D data;
> > -	drm_via_private_t *dev_priv =3D (drm_via_private_t *) dev->dev_priva=
te;
> > -
> > -	mutex_lock(&dev->struct_mutex);
> > -	drm_mm_init(&dev_priv->vram_mm, 0, fb->size >> VIA_MM_ALIGN_SHIFT);
> > -
> > -	dev_priv->vram_initialized =3D 1;
> > -	dev_priv->vram_offset =3D fb->offset;
> > -
> > -	mutex_unlock(&dev->struct_mutex);
> > -	DRM_DEBUG("offset =3D %u, size =3D %u\n", fb->offset, fb->size);
> > -
> > -	return 0;
> > -
> > -}
> > -
> > -int via_final_context(struct drm_device *dev, int context)
> > -{
> > -	drm_via_private_t *dev_priv =3D (drm_via_private_t *) dev->dev_priva=
te;
> > -
> > -	via_release_futex(dev_priv, context);
> > -
> > -	/* Linux specific until context tracking code gets ported to BSD */
> > -	/* Last context, perform cleanup */
> > -	if (list_is_singular(&dev->ctxlist)) {
> > -		DRM_DEBUG("Last Context\n");
> > -		drm_legacy_irq_uninstall(dev);
> > -		via_cleanup_futex(dev_priv);
> > -		via_do_cleanup_map(dev);
> > -	}
> > -	return 1;
> > -}
> > -
> > -void via_lastclose(struct drm_device *dev)
> > -{
> > -	drm_via_private_t *dev_priv =3D (drm_via_private_t *) dev->dev_priva=
te;
> > -
> > -	if (!dev_priv)
> > -		return;
> > -
> > -	mutex_lock(&dev->struct_mutex);
> > -	if (dev_priv->vram_initialized) {
> > -		drm_mm_takedown(&dev_priv->vram_mm);
> > -		dev_priv->vram_initialized =3D 0;
> > -	}
> > -	if (dev_priv->agp_initialized) {
> > -		drm_mm_takedown(&dev_priv->agp_mm);
> > -		dev_priv->agp_initialized =3D 0;
> > -	}
> > -	mutex_unlock(&dev->struct_mutex);
> > -}
> > -
> > -int via_mem_alloc(struct drm_device *dev, void *data,
> > -		  struct drm_file *file)
> > -{
> > -	drm_via_mem_t *mem =3D data;
> > -	int retval =3D 0, user_key;
> > -	struct via_memblock *item;
> > -	drm_via_private_t *dev_priv =3D (drm_via_private_t *) dev->dev_priva=
te;
> > -	struct via_file_private *file_priv =3D file->driver_priv;
> > -	unsigned long tmpSize;
> > -
> > -	if (mem->type > VIA_MEM_AGP) {
> > -		DRM_ERROR("Unknown memory type allocation\n");
> > -		return -EINVAL;
> > -	}
> > -	mutex_lock(&dev->struct_mutex);
> > -	if (0 =3D=3D ((mem->type =3D=3D VIA_MEM_VIDEO) ? dev_priv->vram_init=
ialized :
> > -		      dev_priv->agp_initialized)) {
> > -		mutex_unlock(&dev->struct_mutex);
> > -		DRM_ERROR
> > -		    ("Attempt to allocate from uninitialized memory manager=2E\n");
> > -		return -EINVAL;
> > -	}
> > -
> > -	item =3D kzalloc(sizeof(*item), GFP_KERNEL);
> > -	if (!item) {
> > -		retval =3D -ENOMEM;
> > -		goto fail_alloc;
> > -	}
> > -
> > -	tmpSize =3D (mem->size + VIA_MM_ALIGN_MASK) >> VIA_MM_ALIGN_SHIFT;
> > -	if (mem->type =3D=3D VIA_MEM_AGP)
> > -		retval =3D drm_mm_insert_node(&dev_priv->agp_mm,
> > -					    &item->mm_node,
> > -					    tmpSize);
> > -	else
> > -		retval =3D drm_mm_insert_node(&dev_priv->vram_mm,
> > -					    &item->mm_node,
> > -					    tmpSize);
> > -	if (retval)
> > -		goto fail_alloc;
> > -
> > -	retval =3D idr_alloc(&dev_priv->object_idr, item, 1, 0, GFP_KERNEL);
> > -	if (retval < 0)
> > -		goto fail_idr;
> > -	user_key =3D retval;
> > -
> > -	list_add(&item->owner_list, &file_priv->obj_list);
> > -	mutex_unlock(&dev->struct_mutex);
> > -
> > -	mem->offset =3D ((mem->type =3D=3D VIA_MEM_VIDEO) ?
> > -		      dev_priv->vram_offset : dev_priv->agp_offset) +
> > -	    ((item->mm_node=2Estart) << VIA_MM_ALIGN_SHIFT);
> > -	mem->index =3D user_key;
> > -
> > -	return 0;
> > -
> > -fail_idr:
> > -	drm_mm_remove_node(&item->mm_node);
> > -fail_alloc:
> > -	kfree(item);
> > -	mutex_unlock(&dev->struct_mutex);
> > -
> > -	mem->offset =3D 0;
> > -	mem->size =3D 0;
> > -	mem->index =3D 0;
> > -	DRM_DEBUG("Video memory allocation failed\n");
> > -
> > -	return retval;
> > -}
> > -
> > -int via_mem_free(struct drm_device *dev, void *data, struct drm_file =
*file_priv)
> > -{
> > -	drm_via_private_t *dev_priv =3D dev->dev_private;
> > -	drm_via_mem_t *mem =3D data;
> > -	struct via_memblock *obj;
> > -
> > -	mutex_lock(&dev->struct_mutex);
> > -	obj =3D idr_find(&dev_priv->object_idr, mem->index);
> > -	if (obj =3D=3D NULL) {
> > -		mutex_unlock(&dev->struct_mutex);
> > -		return -EINVAL;
> > -	}
> > -
> > -	idr_remove(&dev_priv->object_idr, mem->index);
> > -	list_del(&obj->owner_list);
> > -	drm_mm_remove_node(&obj->mm_node);
> > -	kfree(obj);
> > -	mutex_unlock(&dev->struct_mutex);
> > -
> > -	DRM_DEBUG("free =3D 0x%lx\n", mem->index);
> > -
> > -	return 0;
> > -}
> > -
> > -
> > -void via_reclaim_buffers_locked(struct drm_device *dev,
> > -				struct drm_file *file)
> > -{
> > -	struct via_file_private *file_priv =3D file->driver_priv;
> > -	struct via_memblock *entry, *next;
> > -
> > -	if (!(dev->master && file->master->lock=2Ehw_lock))
> > -		return;
> > -
> > -	drm_legacy_idlelock_take(&file->master->lock);
> > -
> > -	mutex_lock(&dev->struct_mutex);
> > -	if (list_empty(&file_priv->obj_list)) {
> > -		mutex_unlock(&dev->struct_mutex);
> > -		drm_legacy_idlelock_release(&file->master->lock);
> > -
> > -		return;
> > -	}
> > -
> > -	via_driver_dma_quiescent(dev);
> > -
> > -	list_for_each_entry_safe(entry, next, &file_priv->obj_list,
> > -				 owner_list) {
> > -		list_del(&entry->owner_list);
> > -		drm_mm_remove_node(&entry->mm_node);
> > -		kfree(entry);
> > -	}
> > -	mutex_unlock(&dev->struct_mutex);
> > -
> > -	drm_legacy_idlelock_release(&file->master->lock);
> > -
> > -	return;
> > -}
> > diff --git a/drivers/gpu/drm/via/via_verifier=2Ec b/drivers/gpu/drm/vi=
a/via_verifier=2Ec
> > deleted file mode 100644
> > index 3d6e3a70f318=2E=2E000000000000
> > --- a/drivers/gpu/drm/via/via_verifier=2Ec
> > +++ /dev/null
> > @@ -1,1110 +0,0 @@
> > -/*
> > - * Copyright 2004 The Unichrome Project=2E All Rights Reserved=2E
> > - * Copyright 2005 Thomas Hellstrom=2E All Rights Reserved=2E
> > - *
> > - * Permission is hereby granted, free of charge, to any person obtain=
ing a
> > - * copy of this software and associated documentation files (the "Sof=
tware"),
> > - * to deal in the Software without restriction, including without lim=
itation
> > - * the rights to use, copy, modify, merge, publish, distribute, sub l=
icense,
> > - * and/or sell copies of the Software, and to permit persons to whom =
the
> > - * Software is furnished to do so, subject to the following condition=
s:
> > - *
> > - * The above copyright notice and this permission notice (including t=
he
> > - * next paragraph) shall be included in all copies or substantial por=
tions
> > - * of the Software=2E
> > - *
> > - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EX=
PRESS OR
> > - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTAB=
ILITY,
> > - * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT=2E IN NO EVE=
NT SHALL
> > - * THE AUTHOR(S), AND/OR THE COPYRIGHT HOLDER(S) BE LIABLE FOR ANY CL=
AIM, DAMAGES OR
> > - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWI=
SE,
> > - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE=
 OR OTHER
> > - * DEALINGS IN THE SOFTWARE=2E
> > - *
> > - * Author: Thomas Hellstrom 2004, 2005=2E
> > - * This code was written using docs obtained under NDA from VIA Inc=
=2E
> > - *
> > - * Don't run this code directly on an AGP buffer=2E Due to cache prob=
lems it will
> > - * be very slow=2E
> > - */
> > -
> > -#include <drm/drm_device=2Eh>
> > -#include <drm/drm_legacy=2Eh>
> > -#include <drm/via_drm=2Eh>
> > -
> > -#include "via_3d_reg=2Eh"
> > -#include "via_drv=2Eh"
> > -#include "via_verifier=2Eh"
> > -
> > -typedef enum {
> > -	state_command,
> > -	state_header2,
> > -	state_header1,
> > -	state_vheader5,
> > -	state_vheader6,
> > -	state_error
> > -} verifier_state_t;
> > -
> > -typedef enum {
> > -	no_check =3D 0,
> > -	check_for_header2,
> > -	check_for_header1,
> > -	check_for_header2_err,
> > -	check_for_header1_err,
> > -	check_for_fire,
> > -	check_z_buffer_addr0,
> > -	check_z_buffer_addr1,
> > -	check_z_buffer_addr_mode,
> > -	check_destination_addr0,
> > -	check_destination_addr1,
> > -	check_destination_addr_mode,
> > -	check_for_dummy,
> > -	check_for_dd,
> > -	check_texture_addr0,
> > -	check_texture_addr1,
> > -	check_texture_addr2,
> > -	check_texture_addr3,
> > -	check_texture_addr4,
> > -	check_texture_addr5,
> > -	check_texture_addr6,
> > -	check_texture_addr7,
> > -	check_texture_addr8,
> > -	check_texture_addr_mode,
> > -	check_for_vertex_count,
> > -	check_number_texunits,
> > -	forbidden_command
> > -} hazard_t;
> > -
> > -/*
> > - * Associates each hazard above with a possible multi-command
> > - * sequence=2E For example an address that is split over multiple
> > - * commands and that needs to be checked at the first command
> > - * that does not include any part of the address=2E
> > - */
> > -
> > -static drm_via_sequence_t seqs[] =3D {
> > -	no_sequence,
> > -	no_sequence,
> > -	no_sequence,
> > -	no_sequence,
> > -	no_sequence,
> > -	no_sequence,
> > -	z_address,
> > -	z_address,
> > -	z_address,
> > -	dest_address,
> > -	dest_address,
> > -	dest_address,
> > -	no_sequence,
> > -	no_sequence,
> > -	tex_address,
> > -	tex_address,
> > -	tex_address,
> > -	tex_address,
> > -	tex_address,
> > -	tex_address,
> > -	tex_address,
> > -	tex_address,
> > -	tex_address,
> > -	tex_address,
> > -	no_sequence
> > -};
> > -
> > -typedef struct {
> > -	unsigned int code;
> > -	hazard_t hz;
> > -} hz_init_t;
> > -
> > -static hz_init_t init_table1[] =3D {
> > -	{0xf2, check_for_header2_err},
> > -	{0xf0, check_for_header1_err},
> > -	{0xee, check_for_fire},
> > -	{0xcc, check_for_dummy},
> > -	{0xdd, check_for_dd},
> > -	{0x00, no_check},
> > -	{0x10, check_z_buffer_addr0},
> > -	{0x11, check_z_buffer_addr1},
> > -	{0x12, check_z_buffer_addr_mode},
> > -	{0x13, no_check},
> > -	{0x14, no_check},
> > -	{0x15, no_check},
> > -	{0x23, no_check},
> > -	{0x24, no_check},
> > -	{0x33, no_check},
> > -	{0x34, no_check},
> > -	{0x35, no_check},
> > -	{0x36, no_check},
> > -	{0x37, no_check},
> > -	{0x38, no_check},
> > -	{0x39, no_check},
> > -	{0x3A, no_check},
> > -	{0x3B, no_check},
> > -	{0x3C, no_check},
> > -	{0x3D, no_check},
> > -	{0x3E, no_check},
> > -	{0x40, check_destination_addr0},
> > -	{0x41, check_destination_addr1},
> > -	{0x42, check_destination_addr_mode},
> > -	{0x43, no_check},
> > -	{0x44, no_check},
> > -	{0x50, no_check},
> > -	{0x51, no_check},
> > -	{0x52, no_check},
> > -	{0x53, no_check},
> > -	{0x54, no_check},
> > -	{0x55, no_check},
> > -	{0x56, no_check},
> > -	{0x57, no_check},
> > -	{0x58, no_check},
> > -	{0x70, no_check},
> > -	{0x71, no_check},
> > -	{0x78, no_check},
> > -	{0x79, no_check},
> > -	{0x7A, no_check},
> > -	{0x7B, no_check},
> > -	{0x7C, no_check},
> > -	{0x7D, check_for_vertex_count}
> > -};
> > -
> > -static hz_init_t init_table2[] =3D {
> > -	{0xf2, check_for_header2_err},
> > -	{0xf0, check_for_header1_err},
> > -	{0xee, check_for_fire},
> > -	{0xcc, check_for_dummy},
> > -	{0x00, check_texture_addr0},
> > -	{0x01, check_texture_addr0},
> > -	{0x02, check_texture_addr0},
> > -	{0x03, check_texture_addr0},
> > -	{0x04, check_texture_addr0},
> > -	{0x05, check_texture_addr0},
> > -	{0x06, check_texture_addr0},
> > -	{0x07, check_texture_addr0},
> > -	{0x08, check_texture_addr0},
> > -	{0x09, check_texture_addr0},
> > -	{0x20, check_texture_addr1},
> > -	{0x21, check_texture_addr1},
> > -	{0x22, check_texture_addr1},
> > -	{0x23, check_texture_addr4},
> > -	{0x2B, check_texture_addr3},
> > -	{0x2C, check_texture_addr3},
> > -	{0x2D, check_texture_addr3},
> > -	{0x2E, check_texture_addr3},
> > -	{0x2F, check_texture_addr3},
> > -	{0x30, check_texture_addr3},
> > -	{0x31, check_texture_addr3},
> > -	{0x32, check_texture_addr3},
> > -	{0x33, check_texture_addr3},
> > -	{0x34, check_texture_addr3},
> > -	{0x4B, check_texture_addr5},
> > -	{0x4C, check_texture_addr6},
> > -	{0x51, check_texture_addr7},
> > -	{0x52, check_texture_addr8},
> > -	{0x77, check_texture_addr2},
> > -	{0x78, no_check},
> > -	{0x79, no_check},
> > -	{0x7A, no_check},
> > -	{0x7B, check_texture_addr_mode},
> > -	{0x7C, no_check},
> > -	{0x7D, no_check},
> > -	{0x7E, no_check},
> > -	{0x7F, no_check},
> > -	{0x80, no_check},
> > -	{0x81, no_check},
> > -	{0x82, no_check},
> > -	{0x83, no_check},
> > -	{0x85, no_check},
> > -	{0x86, no_check},
> > -	{0x87, no_check},
> > -	{0x88, no_check},
> > -	{0x89, no_check},
> > -	{0x8A, no_check},
> > -	{0x90, no_check},
> > -	{0x91, no_check},
> > -	{0x92, no_check},
> > -	{0x93, no_check}
> > -};
> > -
> > -static hz_init_t init_table3[] =3D {
> > -	{0xf2, check_for_header2_err},
> > -	{0xf0, check_for_header1_err},
> > -	{0xcc, check_for_dummy},
> > -	{0x00, check_number_texunits}
> > -};
> > -
> > -static hazard_t table1[256];
> > -static hazard_t table2[256];
> > -static hazard_t table3[256];
> > -
> > -static __inline__ int
> > -eat_words(const uint32_t **buf, const uint32_t *buf_end, unsigned num=
_words)
> > -{
> > -	if ((buf_end - *buf) >=3D num_words) {
> > -		*buf +=3D num_words;
> > -		return 0;
> > -	}
> > -	DRM_ERROR("Illegal termination of DMA command buffer\n");
> > -	return 1;
> > -}
> > -
> > -/*
> > - * Partially stolen from drm_memory=2Eh
> > - */
> > -
> > -static __inline__ drm_local_map_t *via_drm_lookup_agp_map(drm_via_sta=
te_t *seq,
> > -						    unsigned long offset,
> > -						    unsigned long size,
> > -						    struct drm_device *dev)
> > -{
> > -	struct drm_map_list *r_list;
> > -	drm_local_map_t *map =3D seq->map_cache;
> > -
> > -	if (map && map->offset <=3D offset
> > -	    && (offset + size) <=3D (map->offset + map->size)) {
> > -		return map;
> > -	}
> > -
> > -	list_for_each_entry(r_list, &dev->maplist, head) {
> > -		map =3D r_list->map;
> > -		if (!map)
> > -			continue;
> > -		if (map->offset <=3D offset
> > -		    && (offset + size) <=3D (map->offset + map->size)
> > -		    && !(map->flags & _DRM_RESTRICTED)
> > -		    && (map->type =3D=3D _DRM_AGP)) {
> > -			seq->map_cache =3D map;
> > -			return map;
> > -		}
> > -	}
> > -	return NULL;
> > -}
> > -
> > -/*
> > - * Require that all AGP texture levels reside in the same AGP map whi=
ch should
> > - * be mappable by the client=2E This is not a big restriction=2E
> > - * FIXME: To actually enforce this security policy strictly, drm_rmma=
p
> > - * would have to wait for dma quiescent before removing an AGP map=2E
> > - * The via_drm_lookup_agp_map call in reality seems to take
> > - * very little CPU time=2E
> > - */
> > -
> > -static __inline__ int finish_current_sequence(drm_via_state_t * cur_s=
eq)
> > -{
> > -	switch (cur_seq->unfinished) {
> > -	case z_address:
> > -		DRM_DEBUG("Z Buffer start address is 0x%x\n", cur_seq->z_addr);
> > -		break;
> > -	case dest_address:
> > -		DRM_DEBUG("Destination start address is 0x%x\n",
> > -			  cur_seq->d_addr);
> > -		break;
> > -	case tex_address:
> > -		if (cur_seq->agp_texture) {
> > -			unsigned start =3D
> > -			    cur_seq->tex_level_lo[cur_seq->texture];
> > -			unsigned end =3D cur_seq->tex_level_hi[cur_seq->texture];
> > -			unsigned long lo =3D ~0, hi =3D 0, tmp;
> > -			uint32_t *addr, *pitch, *height, tex;
> > -			unsigned i;
> > -			int npot;
> > -
> > -			if (end > 9)
> > -				end =3D 9;
> > -			if (start > 9)
> > -				start =3D 9;
> > -
> > -			addr =3D
> > -			    &(cur_seq->t_addr[tex =3D cur_seq->texture][start]);
> > -			pitch =3D &(cur_seq->pitch[tex][start]);
> > -			height =3D &(cur_seq->height[tex][start]);
> > -			npot =3D cur_seq->tex_npot[tex];
> > -			for (i =3D start; i <=3D end; ++i) {
> > -				tmp =3D *addr++;
> > -				if (tmp < lo)
> > -					lo =3D tmp;
> > -				if (i =3D=3D 0 && npot)
> > -					tmp +=3D (*height++ * *pitch++);
> > -				else
> > -					tmp +=3D (*height++ << *pitch++);
> > -				if (tmp > hi)
> > -					hi =3D tmp;
> > -			}
> > -
> > -			if (!via_drm_lookup_agp_map
> > -			    (cur_seq, lo, hi - lo, cur_seq->dev)) {
> > -				DRM_ERROR
> > -				    ("AGP texture is not in allowed map\n");
> > -				return 2;
> > -			}
> > -		}
> > -		break;
> > -	default:
> > -		break;
> > -	}
> > -	cur_seq->unfinished =3D no_sequence;
> > -	return 0;
> > -}
> > -
> > -static __inline__ int
> > -investigate_hazard(uint32_t cmd, hazard_t hz, drm_via_state_t *cur_se=
q)
> > -{
> > -	register uint32_t tmp, *tmp_addr;
> > -
> > -	if (cur_seq->unfinished && (cur_seq->unfinished !=3D seqs[hz])) {
> > -		int ret;
> > -		if ((ret =3D finish_current_sequence(cur_seq)))
> > -			return ret;
> > -	}
> > -
> > -	switch (hz) {
> > -	case check_for_header2:
> > -		if (cmd =3D=3D HALCYON_HEADER2)
> > -			return 1;
> > -		return 0;
> > -	case check_for_header1:
> > -		if ((cmd & HALCYON_HEADER1MASK) =3D=3D HALCYON_HEADER1)
> > -			return 1;
> > -		return 0;
> > -	case check_for_header2_err:
> > -		if (cmd =3D=3D HALCYON_HEADER2)
> > -			return 1;
> > -		DRM_ERROR("Illegal DMA HALCYON_HEADER2 command\n");
> > -		break;
> > -	case check_for_header1_err:
> > -		if ((cmd & HALCYON_HEADER1MASK) =3D=3D HALCYON_HEADER1)
> > -			return 1;
> > -		DRM_ERROR("Illegal DMA HALCYON_HEADER1 command\n");
> > -		break;
> > -	case check_for_fire:
> > -		if ((cmd & HALCYON_FIREMASK) =3D=3D HALCYON_FIRECMD)
> > -			return 1;
> > -		DRM_ERROR("Illegal DMA HALCYON_FIRECMD command\n");
> > -		break;
> > -	case check_for_dummy:
> > -		if (HC_DUMMY =3D=3D cmd)
> > -			return 0;
> > -		DRM_ERROR("Illegal DMA HC_DUMMY command\n");
> > -		break;
> > -	case check_for_dd:
> > -		if (0xdddddddd =3D=3D cmd)
> > -			return 0;
> > -		DRM_ERROR("Illegal DMA 0xdddddddd command\n");
> > -		break;
> > -	case check_z_buffer_addr0:
> > -		cur_seq->unfinished =3D z_address;
> > -		cur_seq->z_addr =3D (cur_seq->z_addr & 0xFF000000) |
> > -		    (cmd & 0x00FFFFFF);
> > -		return 0;
> > -	case check_z_buffer_addr1:
> > -		cur_seq->unfinished =3D z_address;
> > -		cur_seq->z_addr =3D (cur_seq->z_addr & 0x00FFFFFF) |
> > -		    ((cmd & 0xFF) << 24);
> > -		return 0;
> > -	case check_z_buffer_addr_mode:
> > -		cur_seq->unfinished =3D z_address;
> > -		if ((cmd & 0x0000C000) =3D=3D 0)
> > -			return 0;
> > -		DRM_ERROR("Attempt to place Z buffer in system memory\n");
> > -		return 2;
> > -	case check_destination_addr0:
> > -		cur_seq->unfinished =3D dest_address;
> > -		cur_seq->d_addr =3D (cur_seq->d_addr & 0xFF000000) |
> > -		    (cmd & 0x00FFFFFF);
> > -		return 0;
> > -	case check_destination_addr1:
> > -		cur_seq->unfinished =3D dest_address;
> > -		cur_seq->d_addr =3D (cur_seq->d_addr & 0x00FFFFFF) |
> > -		    ((cmd & 0xFF) << 24);
> > -		return 0;
> > -	case check_destination_addr_mode:
> > -		cur_seq->unfinished =3D dest_address;
> > -		if ((cmd & 0x0000C000) =3D=3D 0)
> > -			return 0;
> > -		DRM_ERROR
> > -		    ("Attempt to place 3D drawing buffer in system memory\n");
> > -		return 2;
> > -	case check_texture_addr0:
> > -		cur_seq->unfinished =3D tex_address;
> > -		tmp =3D (cmd >> 24);
> > -		tmp_addr =3D &cur_seq->t_addr[cur_seq->texture][tmp];
> > -		*tmp_addr =3D (*tmp_addr & 0xFF000000) | (cmd & 0x00FFFFFF);
> > -		return 0;
> > -	case check_texture_addr1:
> > -		cur_seq->unfinished =3D tex_address;
> > -		tmp =3D ((cmd >> 24) - 0x20);
> > -		tmp +=3D tmp << 1;
> > -		tmp_addr =3D &cur_seq->t_addr[cur_seq->texture][tmp];
> > -		*tmp_addr =3D (*tmp_addr & 0x00FFFFFF) | ((cmd & 0xFF) << 24);
> > -		tmp_addr++;
> > -		*tmp_addr =3D (*tmp_addr & 0x00FFFFFF) | ((cmd & 0xFF00) << 16);
> > -		tmp_addr++;
> > -		*tmp_addr =3D (*tmp_addr & 0x00FFFFFF) | ((cmd & 0xFF0000) << 8);
> > -		return 0;
> > -	case check_texture_addr2:
> > -		cur_seq->unfinished =3D tex_address;
> > -		cur_seq->tex_level_lo[tmp =3D cur_seq->texture] =3D cmd & 0x3F;
> > -		cur_seq->tex_level_hi[tmp] =3D (cmd & 0xFC0) >> 6;
> > -		return 0;
> > -	case check_texture_addr3:
> > -		cur_seq->unfinished =3D tex_address;
> > -		tmp =3D ((cmd >> 24) - HC_SubA_HTXnL0Pit);
> > -		if (tmp =3D=3D 0 &&
> > -		    (cmd & HC_HTXnEnPit_MASK)) {
> > -			cur_seq->pitch[cur_seq->texture][tmp] =3D
> > -				(cmd & HC_HTXnLnPit_MASK);
> > -			cur_seq->tex_npot[cur_seq->texture] =3D 1;
> > -		} else {
> > -			cur_seq->pitch[cur_seq->texture][tmp] =3D
> > -				(cmd & HC_HTXnLnPitE_MASK) >> HC_HTXnLnPitE_SHIFT;
> > -			cur_seq->tex_npot[cur_seq->texture] =3D 0;
> > -			if (cmd & 0x000FFFFF) {
> > -				DRM_ERROR
> > -					("Unimplemented texture level 0 pitch mode=2E\n");
> > -				return 2;
> > -			}
> > -		}
> > -		return 0;
> > -	case check_texture_addr4:
> > -		cur_seq->unfinished =3D tex_address;
> > -		tmp_addr =3D &cur_seq->t_addr[cur_seq->texture][9];
> > -		*tmp_addr =3D (*tmp_addr & 0x00FFFFFF) | ((cmd & 0xFF) << 24);
> > -		return 0;
> > -	case check_texture_addr5:
> > -	case check_texture_addr6:
> > -		cur_seq->unfinished =3D tex_address;
> > -		/*
> > -		 * Texture width=2E We don't care since we have the pitch=2E
> > -		 */
> > -		return 0;
> > -	case check_texture_addr7:
> > -		cur_seq->unfinished =3D tex_address;
> > -		tmp_addr =3D &(cur_seq->height[cur_seq->texture][0]);
> > -		tmp_addr[5] =3D 1 << ((cmd & 0x00F00000) >> 20);
> > -		tmp_addr[4] =3D 1 << ((cmd & 0x000F0000) >> 16);
> > -		tmp_addr[3] =3D 1 << ((cmd & 0x0000F000) >> 12);
> > -		tmp_addr[2] =3D 1 << ((cmd & 0x00000F00) >> 8);
> > -		tmp_addr[1] =3D 1 << ((cmd & 0x000000F0) >> 4);
> > -		tmp_addr[0] =3D 1 << (cmd & 0x0000000F);
> > -		return 0;
> > -	case check_texture_addr8:
> > -		cur_seq->unfinished =3D tex_address;
> > -		tmp_addr =3D &(cur_seq->height[cur_seq->texture][0]);
> > -		tmp_addr[9] =3D 1 << ((cmd & 0x0000F000) >> 12);
> > -		tmp_addr[8] =3D 1 << ((cmd & 0x00000F00) >> 8);
> > -		tmp_addr[7] =3D 1 << ((cmd & 0x000000F0) >> 4);
> > -		tmp_addr[6] =3D 1 << (cmd & 0x0000000F);
> > -		return 0;
> > -	case check_texture_addr_mode:
> > -		cur_seq->unfinished =3D tex_address;
> > -		if (2 =3D=3D (tmp =3D cmd & 0x00000003)) {
> > -			DRM_ERROR
> > -			    ("Attempt to fetch texture from system memory=2E\n");
> > -			return 2;
> > -		}
> > -		cur_seq->agp_texture =3D (tmp =3D=3D 3);
> > -		cur_seq->tex_palette_size[cur_seq->texture] =3D
> > -		    (cmd >> 16) & 0x000000007;
> > -		return 0;
> > -	case check_for_vertex_count:
> > -		cur_seq->vertex_count =3D cmd & 0x0000FFFF;
> > -		return 0;
> > -	case check_number_texunits:
> > -		cur_seq->multitex =3D (cmd >> 3) & 1;
> > -		return 0;
> > -	default:
> > -		DRM_ERROR("Illegal DMA data: 0x%x\n", cmd);
> > -		return 2;
> > -	}
> > -	return 2;
> > -}
> > -
> > -static __inline__ int
> > -via_check_prim_list(uint32_t const **buffer, const uint32_t * buf_end=
,
> > -		    drm_via_state_t *cur_seq)
> > -{
> > -	drm_via_private_t *dev_priv =3D
> > -	    (drm_via_private_t *) cur_seq->dev->dev_private;
> > -	uint32_t a_fire, bcmd, dw_count;
> > -	int ret =3D 0;
> > -	int have_fire;
> > -	const uint32_t *buf =3D *buffer;
> > -
> > -	while (buf < buf_end) {
> > -		have_fire =3D 0;
> > -		if ((buf_end - buf) < 2) {
> > -			DRM_ERROR
> > -			    ("Unexpected termination of primitive list=2E\n");
> > -			ret =3D 1;
> > -			break;
> > -		}
> > -		if ((*buf & HC_ACMD_MASK) !=3D HC_ACMD_HCmdB)
> > -			break;
> > -		bcmd =3D *buf++;
> > -		if ((*buf & HC_ACMD_MASK) !=3D HC_ACMD_HCmdA) {
> > -			DRM_ERROR("Expected Vertex List A command, got 0x%x\n",
> > -				  *buf);
> > -			ret =3D 1;
> > -			break;
> > -		}
> > -		a_fire =3D
> > -		    *buf++ | HC_HPLEND_MASK | HC_HPMValidN_MASK |
> > -		    HC_HE3Fire_MASK;
> > -
> > -		/*
> > -		 * How many dwords per vertex ?
> > -		 */
> > -
> > -		if (cur_seq->agp && ((bcmd & (0xF << 11)) =3D=3D 0)) {
> > -			DRM_ERROR("Illegal B command vertex data for AGP=2E\n");
> > -			ret =3D 1;
> > -			break;
> > -		}
> > -
> > -		dw_count =3D 0;
> > -		if (bcmd & (1 << 7))
> > -			dw_count +=3D (cur_seq->multitex) ? 2 : 1;
> > -		if (bcmd & (1 << 8))
> > -			dw_count +=3D (cur_seq->multitex) ? 2 : 1;
> > -		if (bcmd & (1 << 9))
> > -			dw_count++;
> > -		if (bcmd & (1 << 10))
> > -			dw_count++;
> > -		if (bcmd & (1 << 11))
> > -			dw_count++;
> > -		if (bcmd & (1 << 12))
> > -			dw_count++;
> > -		if (bcmd & (1 << 13))
> > -			dw_count++;
> > -		if (bcmd & (1 << 14))
> > -			dw_count++;
> > -
> > -		while (buf < buf_end) {
> > -			if (*buf =3D=3D a_fire) {
> > -				if (dev_priv->num_fire_offsets >=3D
> > -				    VIA_FIRE_BUF_SIZE) {
> > -					DRM_ERROR("Fire offset buffer full=2E\n");
> > -					ret =3D 1;
> > -					break;
> > -				}
> > -				dev_priv->fire_offsets[dev_priv->
> > -						       num_fire_offsets++] =3D
> > -				    buf;
> > -				have_fire =3D 1;
> > -				buf++;
> > -				if (buf < buf_end && *buf =3D=3D a_fire)
> > -					buf++;
> > -				break;
> > -			}
> > -			if ((*buf =3D=3D HALCYON_HEADER2) ||
> > -			    ((*buf & HALCYON_FIREMASK) =3D=3D HALCYON_FIRECMD)) {
> > -				DRM_ERROR("Missing Vertex Fire command, "
> > -					  "Stray Vertex Fire command  or verifier "
> > -					  "lost sync=2E\n");
> > -				ret =3D 1;
> > -				break;
> > -			}
> > -			if ((ret =3D eat_words(&buf, buf_end, dw_count)))
> > -				break;
> > -		}
> > -		if (buf >=3D buf_end && !have_fire) {
> > -			DRM_ERROR("Missing Vertex Fire command or verifier "
> > -				  "lost sync=2E\n");
> > -			ret =3D 1;
> > -			break;
> > -		}
> > -		if (cur_seq->agp && ((buf - cur_seq->buf_start) & 0x01)) {
> > -			DRM_ERROR("AGP Primitive list end misaligned=2E\n");
> > -			ret =3D 1;
> > -			break;
> > -		}
> > -	}
> > -	*buffer =3D buf;
> > -	return ret;
> > -}
> > -
> > -static __inline__ verifier_state_t
> > -via_check_header2(uint32_t const **buffer, const uint32_t *buf_end,
> > -		  drm_via_state_t *hc_state)
> > -{
> > -	uint32_t cmd;
> > -	int hz_mode;
> > -	hazard_t hz;
> > -	const uint32_t *buf =3D *buffer;
> > -	const hazard_t *hz_table;
> > -
> > -	if ((buf_end - buf) < 2) {
> > -		DRM_ERROR
> > -		    ("Illegal termination of DMA HALCYON_HEADER2 sequence=2E\n");
> > -		return state_error;
> > -	}
> > -	buf++;
> > -	cmd =3D (*buf++ & 0xFFFF0000) >> 16;
> > -
> > -	switch (cmd) {
> > -	case HC_ParaType_CmdVdata:
> > -		if (via_check_prim_list(&buf, buf_end, hc_state))
> > -			return state_error;
> > -		*buffer =3D buf;
> > -		return state_command;
> > -	case HC_ParaType_NotTex:
> > -		hz_table =3D table1;
> > -		break;
> > -	case HC_ParaType_Tex:
> > -		hc_state->texture =3D 0;
> > -		hz_table =3D table2;
> > -		break;
> > -	case (HC_ParaType_Tex | (HC_SubType_Tex1 << 8)):
> > -		hc_state->texture =3D 1;
> > -		hz_table =3D table2;
> > -		break;
> > -	case (HC_ParaType_Tex | (HC_SubType_TexGeneral << 8)):
> > -		hz_table =3D table3;
> > -		break;
> > -	case HC_ParaType_Auto:
> > -		if (eat_words(&buf, buf_end, 2))
> > -			return state_error;
> > -		*buffer =3D buf;
> > -		return state_command;
> > -	case (HC_ParaType_Palette | (HC_SubType_Stipple << 8)):
> > -		if (eat_words(&buf, buf_end, 32))
> > -			return state_error;
> > -		*buffer =3D buf;
> > -		return state_command;
> > -	case (HC_ParaType_Palette | (HC_SubType_TexPalette0 << 8)):
> > -	case (HC_ParaType_Palette | (HC_SubType_TexPalette1 << 8)):
> > -		DRM_ERROR("Texture palettes are rejected because of "
> > -			  "lack of info how to determine their size=2E\n");
> > -		return state_error;
> > -	case (HC_ParaType_Palette | (HC_SubType_FogTable << 8)):
> > -		DRM_ERROR("Fog factor palettes are rejected because of "
> > -			  "lack of info how to determine their size=2E\n");
> > -		return state_error;
> > -	default:
> > -
> > -		/*
> > -		 * There are some unimplemented HC_ParaTypes here, that
> > -		 * need to be implemented if the Mesa driver is extended=2E
> > -		 */
> > -
> > -		DRM_ERROR("Invalid or unimplemented HALCYON_HEADER2 "
> > -			  "DMA subcommand: 0x%x=2E Previous dword: 0x%x\n",
> > -			  cmd, *(buf - 2));
> > -		*buffer =3D buf;
> > -		return state_error;
> > -	}
> > -
> > -	while (buf < buf_end) {
> > -		cmd =3D *buf++;
> > -		if ((hz =3D hz_table[cmd >> 24])) {
> > -			if ((hz_mode =3D investigate_hazard(cmd, hz, hc_state))) {
> > -				if (hz_mode =3D=3D 1) {
> > -					buf--;
> > -					break;
> > -				}
> > -				return state_error;
> > -			}
> > -		} else if (hc_state->unfinished &&
> > -			   finish_current_sequence(hc_state)) {
> > -			return state_error;
> > -		}
> > -	}
> > -	if (hc_state->unfinished && finish_current_sequence(hc_state))
> > -		return state_error;
> > -	*buffer =3D buf;
> > -	return state_command;
> > -}
> > -
> > -static __inline__ verifier_state_t
> > -via_parse_header2(drm_via_private_t *dev_priv, uint32_t const **buffe=
r,
> > -		  const uint32_t *buf_end, int *fire_count)
> > -{
> > -	uint32_t cmd;
> > -	const uint32_t *buf =3D *buffer;
> > -	const uint32_t *next_fire;
> > -	int burst =3D 0;
> > -
> > -	next_fire =3D dev_priv->fire_offsets[*fire_count];
> > -	buf++;
> > -	cmd =3D (*buf & 0xFFFF0000) >> 16;
> > -	via_write(dev_priv, HC_REG_TRANS_SET + HC_REG_BASE, *buf++);
> > -	switch (cmd) {
> > -	case HC_ParaType_CmdVdata:
> > -		while ((buf < buf_end) &&
> > -		       (*fire_count < dev_priv->num_fire_offsets) &&
> > -		       (*buf & HC_ACMD_MASK) =3D=3D HC_ACMD_HCmdB) {
> > -			while (buf <=3D next_fire) {
> > -				via_write(dev_priv, HC_REG_TRANS_SPACE + HC_REG_BASE +
> > -					  (burst & 63), *buf++);
> > -				burst +=3D 4;
> > -			}
> > -			if ((buf < buf_end)
> > -			    && ((*buf & HALCYON_FIREMASK) =3D=3D HALCYON_FIRECMD))
> > -				buf++;
> > -
> > -			if (++(*fire_count) < dev_priv->num_fire_offsets)
> > -				next_fire =3D dev_priv->fire_offsets[*fire_count];
> > -		}
> > -		break;
> > -	default:
> > -		while (buf < buf_end) {
> > -
> > -			if (*buf =3D=3D HC_HEADER2 ||
> > -			    (*buf & HALCYON_HEADER1MASK) =3D=3D HALCYON_HEADER1 ||
> > -			    (*buf & VIA_VIDEOMASK) =3D=3D VIA_VIDEO_HEADER5 ||
> > -			    (*buf & VIA_VIDEOMASK) =3D=3D VIA_VIDEO_HEADER6)
> > -				break;
> > -
> > -			via_write(dev_priv, HC_REG_TRANS_SPACE + HC_REG_BASE +
> > -				  (burst & 63), *buf++);
> > -			burst +=3D 4;
> > -		}
> > -	}
> > -	*buffer =3D buf;
> > -	return state_command;
> > -}
> > -
> > -static __inline__ int verify_mmio_address(uint32_t address)
> > -{
> > -	if ((address > 0x3FF) && (address < 0xC00)) {
> > -		DRM_ERROR("Invalid VIDEO DMA command=2E "
> > -			  "Attempt to access 3D- or command burst area=2E\n");
> > -		return 1;
> > -	} else if ((address > 0xCFF) && (address < 0x1300)) {
> > -		DRM_ERROR("Invalid VIDEO DMA command=2E "
> > -			  "Attempt to access PCI DMA area=2E\n");
> > -		return 1;
> > -	} else if (address > 0x13FF) {
> > -		DRM_ERROR("Invalid VIDEO DMA command=2E "
> > -			  "Attempt to access VGA registers=2E\n");
> > -		return 1;
> > -	}
> > -	return 0;
> > -}
> > -
> > -static __inline__ int
> > -verify_video_tail(uint32_t const **buffer, const uint32_t * buf_end,
> > -		  uint32_t dwords)
> > -{
> > -	const uint32_t *buf =3D *buffer;
> > -
> > -	if (buf_end - buf < dwords) {
> > -		DRM_ERROR("Illegal termination of video command=2E\n");
> > -		return 1;
> > -	}
> > -	while (dwords--) {
> > -		if (*buf++) {
> > -			DRM_ERROR("Illegal video command tail=2E\n");
> > -			return 1;
> > -		}
> > -	}
> > -	*buffer =3D buf;
> > -	return 0;
> > -}
> > -
> > -static __inline__ verifier_state_t
> > -via_check_header1(uint32_t const **buffer, const uint32_t * buf_end)
> > -{
> > -	uint32_t cmd;
> > -	const uint32_t *buf =3D *buffer;
> > -	verifier_state_t ret =3D state_command;
> > -
> > -	while (buf < buf_end) {
> > -		cmd =3D *buf;
> > -		if ((cmd > ((0x3FF >> 2) | HALCYON_HEADER1)) &&
> > -		    (cmd < ((0xC00 >> 2) | HALCYON_HEADER1))) {
> > -			if ((cmd & HALCYON_HEADER1MASK) !=3D HALCYON_HEADER1)
> > -				break;
> > -			DRM_ERROR("Invalid HALCYON_HEADER1 command=2E "
> > -				  "Attempt to access 3D- or command burst area=2E\n");
> > -			ret =3D state_error;
> > -			break;
> > -		} else if (cmd > ((0xCFF >> 2) | HALCYON_HEADER1)) {
> > -			if ((cmd & HALCYON_HEADER1MASK) !=3D HALCYON_HEADER1)
> > -				break;
> > -			DRM_ERROR("Invalid HALCYON_HEADER1 command=2E "
> > -				  "Attempt to access VGA registers=2E\n");
> > -			ret =3D state_error;
> > -			break;
> > -		} else {
> > -			buf +=3D 2;
> > -		}
> > -	}
> > -	*buffer =3D buf;
> > -	return ret;
> > -}
> > -
> > -static __inline__ verifier_state_t
> > -via_parse_header1(drm_via_private_t *dev_priv, uint32_t const **buffe=
r,
> > -		  const uint32_t *buf_end)
> > -{
> > -	register uint32_t cmd;
> > -	const uint32_t *buf =3D *buffer;
> > -
> > -	while (buf < buf_end) {
> > -		cmd =3D *buf;
> > -		if ((cmd & HALCYON_HEADER1MASK) !=3D HALCYON_HEADER1)
> > -			break;
> > -		via_write(dev_priv, (cmd & ~HALCYON_HEADER1MASK) << 2, *++buf);
> > -		buf++;
> > -	}
> > -	*buffer =3D buf;
> > -	return state_command;
> > -}
> > -
> > -static __inline__ verifier_state_t
> > -via_check_vheader5(uint32_t const **buffer, const uint32_t *buf_end)
> > -{
> > -	uint32_t data;
> > -	const uint32_t *buf =3D *buffer;
> > -
> > -	if (buf_end - buf < 4) {
> > -		DRM_ERROR("Illegal termination of video header5 command\n");
> > -		return state_error;
> > -	}
> > -
> > -	data =3D *buf++ & ~VIA_VIDEOMASK;
> > -	if (verify_mmio_address(data))
> > -		return state_error;
> > -
> > -	data =3D *buf++;
> > -	if (*buf++ !=3D 0x00F50000) {
> > -		DRM_ERROR("Illegal header5 header data\n");
> > -		return state_error;
> > -	}
> > -	if (*buf++ !=3D 0x00000000) {
> > -		DRM_ERROR("Illegal header5 header data\n");
> > -		return state_error;
> > -	}
> > -	if (eat_words(&buf, buf_end, data))
> > -		return state_error;
> > -	if ((data & 3) && verify_video_tail(&buf, buf_end, 4 - (data & 3)))
> > -		return state_error;
> > -	*buffer =3D buf;
> > -	return state_command;
> > -
> > -}
> > -
> > -static __inline__ verifier_state_t
> > -via_parse_vheader5(drm_via_private_t *dev_priv, uint32_t const **buff=
er,
> > -		   const uint32_t *buf_end)
> > -{
> > -	uint32_t addr, count, i;
> > -	const uint32_t *buf =3D *buffer;
> > -
> > -	addr =3D *buf++ & ~VIA_VIDEOMASK;
> > -	i =3D count =3D *buf;
> > -	buf +=3D 3;
> > -	while (i--)
> > -		via_write(dev_priv, addr, *buf++);
> > -	if (count & 3)
> > -		buf +=3D 4 - (count & 3);
> > -	*buffer =3D buf;
> > -	return state_command;
> > -}
> > -
> > -static __inline__ verifier_state_t
> > -via_check_vheader6(uint32_t const **buffer, const uint32_t * buf_end)
> > -{
> > -	uint32_t data;
> > -	const uint32_t *buf =3D *buffer;
> > -	uint32_t i;
> > -
> > -	if (buf_end - buf < 4) {
> > -		DRM_ERROR("Illegal termination of video header6 command\n");
> > -		return state_error;
> > -	}
> > -	buf++;
> > -	data =3D *buf++;
> > -	if (*buf++ !=3D 0x00F60000) {
> > -		DRM_ERROR("Illegal header6 header data\n");
> > -		return state_error;
> > -	}
> > -	if (*buf++ !=3D 0x00000000) {
> > -		DRM_ERROR("Illegal header6 header data\n");
> > -		return state_error;
> > -	}
> > -	if ((buf_end - buf) < (data << 1)) {
> > -		DRM_ERROR("Illegal termination of video header6 command\n");
> > -		return state_error;
> > -	}
> > -	for (i =3D 0; i < data; ++i) {
> > -		if (verify_mmio_address(*buf++))
> > -			return state_error;
> > -		buf++;
> > -	}
> > -	data <<=3D 1;
> > -	if ((data & 3) && verify_video_tail(&buf, buf_end, 4 - (data & 3)))
> > -		return state_error;
> > -	*buffer =3D buf;
> > -	return state_command;
> > -}
> > -
> > -static __inline__ verifier_state_t
> > -via_parse_vheader6(drm_via_private_t *dev_priv, uint32_t const **buff=
er,
> > -		   const uint32_t *buf_end)
> > -{
> > -
> > -	uint32_t addr, count, i;
> > -	const uint32_t *buf =3D *buffer;
> > -
> > -	i =3D count =3D *++buf;
> > -	buf +=3D 3;
> > -	while (i--) {
> > -		addr =3D *buf++;
> > -		via_write(dev_priv, addr, *buf++);
> > -	}
> > -	count <<=3D 1;
> > -	if (count & 3)
> > -		buf +=3D 4 - (count & 3);
> > -	*buffer =3D buf;
> > -	return state_command;
> > -}
> > -
> > -int
> > -via_verify_command_stream(const uint32_t * buf, unsigned int size,
> > -			  struct drm_device * dev, int agp)
> > -{
> > -
> > -	drm_via_private_t *dev_priv =3D (drm_via_private_t *) dev->dev_priva=
te;
> > -	drm_via_state_t *hc_state =3D &dev_priv->hc_state;
> > -	drm_via_state_t saved_state =3D *hc_state;
> > -	uint32_t cmd;
> > -	const uint32_t *buf_end =3D buf + (size >> 2);
> > -	verifier_state_t state =3D state_command;
> > -	int cme_video;
> > -	int supported_3d;
> > -
> > -	cme_video =3D (dev_priv->chipset =3D=3D VIA_PRO_GROUP_A ||
> > -		     dev_priv->chipset =3D=3D VIA_DX9_0);
> > -
> > -	supported_3d =3D dev_priv->chipset !=3D VIA_DX9_0;
> > -
> > -	hc_state->dev =3D dev;
> > -	hc_state->unfinished =3D no_sequence;
> > -	hc_state->map_cache =3D NULL;
> > -	hc_state->agp =3D agp;
> > -	hc_state->buf_start =3D buf;
> > -	dev_priv->num_fire_offsets =3D 0;
> > -
> > -	while (buf < buf_end) {
> > -
> > -		switch (state) {
> > -		case state_header2:
> > -			state =3D via_check_header2(&buf, buf_end, hc_state);
> > -			break;
> > -		case state_header1:
> > -			state =3D via_check_header1(&buf, buf_end);
> > -			break;
> > -		case state_vheader5:
> > -			state =3D via_check_vheader5(&buf, buf_end);
> > -			break;
> > -		case state_vheader6:
> > -			state =3D via_check_vheader6(&buf, buf_end);
> > -			break;
> > -		case state_command:
> > -			cmd =3D *buf;
> > -			if ((cmd =3D=3D HALCYON_HEADER2) && supported_3d)
> > -				state =3D state_header2;
> > -			else if ((cmd & HALCYON_HEADER1MASK) =3D=3D HALCYON_HEADER1)
> > -				state =3D state_header1;
> > -			else if (cme_video
> > -				 && (cmd & VIA_VIDEOMASK) =3D=3D VIA_VIDEO_HEADER5)
> > -				state =3D state_vheader5;
> > -			else if (cme_video
> > -				 && (cmd & VIA_VIDEOMASK) =3D=3D VIA_VIDEO_HEADER6)
> > -				state =3D state_vheader6;
> > -			else if ((cmd =3D=3D HALCYON_HEADER2) && !supported_3d) {
> > -				DRM_ERROR("Accelerated 3D is not supported on this chipset yet=2E=
\n");
> > -				state =3D state_error;
> > -			} else {
> > -				DRM_ERROR
> > -				    ("Invalid / Unimplemented DMA HEADER command=2E 0x%x\n",
> > -				     cmd);
> > -				state =3D state_error;
> > -			}
> > -			break;
> > -		case state_error:
> > -		default:
> > -			*hc_state =3D saved_state;
> > -			return -EINVAL;
> > -		}
> > -	}
> > -	if (state =3D=3D state_error) {
> > -		*hc_state =3D saved_state;
> > -		return -EINVAL;
> > -	}
> > -	return 0;
> > -}
> > -
> > -int
> > -via_parse_command_stream(struct drm_device *dev, const uint32_t *buf,
> > -			 unsigned int size)
> > -{
> > -
> > -	drm_via_private_t *dev_priv =3D (drm_via_private_t *) dev->dev_priva=
te;
> > -	uint32_t cmd;
> > -	const uint32_t *buf_end =3D buf + (size >> 2);
> > -	verifier_state_t state =3D state_command;
> > -	int fire_count =3D 0;
> > -
> > -	while (buf < buf_end) {
> > -
> > -		switch (state) {
> > -		case state_header2:
> > -			state =3D
> > -			    via_parse_header2(dev_priv, &buf, buf_end,
> > -					      &fire_count);
> > -			break;
> > -		case state_header1:
> > -			state =3D via_parse_header1(dev_priv, &buf, buf_end);
> > -			break;
> > -		case state_vheader5:
> > -			state =3D via_parse_vheader5(dev_priv, &buf, buf_end);
> > -			break;
> > -		case state_vheader6:
> > -			state =3D via_parse_vheader6(dev_priv, &buf, buf_end);
> > -			break;
> > -		case state_command:
> > -			cmd =3D *buf;
> > -			if (cmd =3D=3D HALCYON_HEADER2)
> > -				state =3D state_header2;
> > -			else if ((cmd & HALCYON_HEADER1MASK) =3D=3D HALCYON_HEADER1)
> > -				state =3D state_header1;
> > -			else if ((cmd & VIA_VIDEOMASK) =3D=3D VIA_VIDEO_HEADER5)
> > -				state =3D state_vheader5;
> > -			else if ((cmd & VIA_VIDEOMASK) =3D=3D VIA_VIDEO_HEADER6)
> > -				state =3D state_vheader6;
> > -			else {
> > -				DRM_ERROR
> > -				    ("Invalid / Unimplemented DMA HEADER command=2E 0x%x\n",
> > -				     cmd);
> > -				state =3D state_error;
> > -			}
> > -			break;
> > -		case state_error:
> > -		default:
> > -			return -EINVAL;
> > -		}
> > -	}
> > -	if (state =3D=3D state_error)
> > -		return -EINVAL;
> > -	return 0;
> > -}
> > -
> > -static void
> > -setup_hazard_table(hz_init_t init_table[], hazard_t table[], int size=
)
> > -{
> > -	int i;
> > -
> > -	for (i =3D 0; i < 256; ++i)
> > -		table[i] =3D forbidden_command;
> > -
> > -	for (i =3D 0; i < size; ++i)
> > -		table[init_table[i]=2Ecode] =3D init_table[i]=2Ehz;
> > -}
> > -
> > -void via_init_command_verifier(void)
> > -{
> > -	setup_hazard_table(init_table1, table1, ARRAY_SIZE(init_table1));
> > -	setup_hazard_table(init_table2, table2, ARRAY_SIZE(init_table2));
> > -	setup_hazard_table(init_table3, table3, ARRAY_SIZE(init_table3));
> > -}
> > diff --git a/drivers/gpu/drm/via/via_verifier=2Eh b/drivers/gpu/drm/vi=
a/via_verifier=2Eh
> > deleted file mode 100644
> > index 26b6d361ab95=2E=2E000000000000
> > --- a/drivers/gpu/drm/via/via_verifier=2Eh
> > +++ /dev/null
> > @@ -1,62 +0,0 @@
> > -/*
> > - * Copyright 2004 The Unichrome Project=2E All Rights Reserved=2E
> > - *
> > - * Permission is hereby granted, free of charge, to any person obtain=
ing a
> > - * copy of this software and associated documentation files (the "Sof=
tware"),
> > - * to deal in the Software without restriction, including without lim=
itation
> > - * the rights to use, copy, modify, merge, publish, distribute, sub l=
icense,
> > - * and/or sell copies of the Software, and to permit persons to whom =
the
> > - * Software is furnished to do so, subject to the following condition=
s:
> > - *
> > - * The above copyright notice and this permission notice (including t=
he
> > - * next paragraph) shall be included in all copies or substantial por=
tions
> > - * of the Software=2E
> > - *
> > - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EX=
PRESS OR
> > - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTAB=
ILITY,
> > - * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT=2E IN NO EVE=
NT SHALL
> > - * THE UNICHROME PROJECT, AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAI=
M, DAMAGES OR
> > - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWI=
SE,
> > - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE=
 OR OTHER
> > - * DEALINGS IN THE SOFTWARE=2E
> > - *
> > - * Author: Thomas Hellstr=C3=B6m 2004=2E
> > - */
> > -
> > -#ifndef _VIA_VERIFIER_H_
> > -#define _VIA_VERIFIER_H_
> > -
> > -typedef enum {
> > -	no_sequence =3D 0,
> > -	z_address,
> > -	dest_address,
> > -	tex_address
> > -} drm_via_sequence_t;
> > -
> > -typedef struct {
> > -	unsigned texture;
> > -	uint32_t z_addr;
> > -	uint32_t d_addr;
> > -	uint32_t t_addr[2][10];
> > -	uint32_t pitch[2][10];
> > -	uint32_t height[2][10];
> > -	uint32_t tex_level_lo[2];
> > -	uint32_t tex_level_hi[2];
> > -	uint32_t tex_palette_size[2];
> > -	uint32_t tex_npot[2];
> > -	drm_via_sequence_t unfinished;
> > -	int agp_texture;
> > -	int multitex;
> > -	struct drm_device *dev;
> > -	drm_local_map_t *map_cache;
> > -	uint32_t vertex_count;
> > -	int agp;
> > -	const uint32_t *buf_start;
> > -} drm_via_state_t;
> > -
> > -extern int via_verify_command_stream(const uint32_t *buf, unsigned in=
t size,
> > -				     struct drm_device *dev, int agp);
> > -extern int via_parse_command_stream(struct drm_device *dev, const uin=
t32_t *buf,
> > -				    unsigned int size);
> > -
> > -#endif
> > diff --git a/drivers/gpu/drm/via/via_video=2Ec b/drivers/gpu/drm/via/v=
ia_video=2Ec
> > deleted file mode 100644
> > index 53b1f58f99b4=2E=2E000000000000
> > --- a/drivers/gpu/drm/via/via_video=2Ec
> > +++ /dev/null
> > @@ -1,94 +0,0 @@
> > -/*
> > - * Copyright 2005 Thomas Hellstrom=2E All Rights Reserved=2E
> > - *
> > - * Permission is hereby granted, free of charge, to any person obtain=
ing a
> > - * copy of this software and associated documentation files (the "Sof=
tware"),
> > - * to deal in the Software without restriction, including without lim=
itation
> > - * the rights to use, copy, modify, merge, publish, distribute, sub l=
icense,
> > - * and/or sell copies of the Software, and to permit persons to whom =
the
> > - * Software is furnished to do so, subject to the following condition=
s:
> > - *
> > - * The above copyright notice and this permission notice (including t=
he
> > - * next paragraph) shall be included in all copies or substantial por=
tions
> > - * of the Software=2E
> > - *
> > - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EX=
PRESS OR
> > - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTAB=
ILITY,
> > - * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT=2E IN NO EVE=
NT SHALL
> > - * THE AUTHOR(S), AND/OR THE COPYRIGHT HOLDER(S) BE LIABLE FOR ANY CL=
AIM, DAMAGES OR
> > - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWI=
SE,
> > - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE=
 OR OTHER
> > - * DEALINGS IN THE SOFTWARE=2E
> > - *
> > - * Author: Thomas Hellstrom 2005=2E
> > - *
> > - * Video and XvMC related functions=2E
> > - */
> > -
> > -#include <drm/drm_device=2Eh>
> > -#include <drm/via_drm=2Eh>
> > -
> > -#include "via_drv=2Eh"
> > -
> > -void via_init_futex(drm_via_private_t *dev_priv)
> > -{
> > -	unsigned int i;
> > -
> > -	DRM_DEBUG("\n");
> > -
> > -	for (i =3D 0; i < VIA_NR_XVMC_LOCKS; ++i) {
> > -		init_waitqueue_head(&(dev_priv->decoder_queue[i]));
> > -		XVMCLOCKPTR(dev_priv->sarea_priv, i)->lock =3D 0;
> > -	}
> > -}
> > -
> > -void via_cleanup_futex(drm_via_private_t *dev_priv)
> > -{
> > -}
> > -
> > -void via_release_futex(drm_via_private_t *dev_priv, int context)
> > -{
> > -	unsigned int i;
> > -	volatile int *lock;
> > -
> > -	if (!dev_priv->sarea_priv)
> > -		return;
> > -
> > -	for (i =3D 0; i < VIA_NR_XVMC_LOCKS; ++i) {
> > -		lock =3D (volatile int *)XVMCLOCKPTR(dev_priv->sarea_priv, i);
> > -		if ((_DRM_LOCKING_CONTEXT(*lock) =3D=3D context)) {
> > -			if (_DRM_LOCK_IS_HELD(*lock)
> > -			    && (*lock & _DRM_LOCK_CONT)) {
> > -				wake_up(&(dev_priv->decoder_queue[i]));
> > -			}
> > -			*lock =3D 0;
> > -		}
> > -	}
> > -}
> > -
> > -int via_decoder_futex(struct drm_device *dev, void *data, struct drm_=
file *file_priv)
> > -{
> > -	drm_via_futex_t *fx =3D data;
> > -	volatile int *lock;
> > -	drm_via_private_t *dev_priv =3D (drm_via_private_t *) dev->dev_priva=
te;
> > -	drm_via_sarea_t *sAPriv =3D dev_priv->sarea_priv;
> > -	int ret =3D 0;
> > -
> > -	DRM_DEBUG("\n");
> > -
> > -	if (fx->lock >=3D VIA_NR_XVMC_LOCKS)
> > -		return -EFAULT;
> > -
> > -	lock =3D (volatile int *)XVMCLOCKPTR(sAPriv, fx->lock);
> > -
> > -	switch (fx->func) {
> > -	case VIA_FUTEX_WAIT:
> > -		VIA_WAIT_ON(ret, dev_priv->decoder_queue[fx->lock],
> > -			    (fx->ms / 10) * (HZ / 100), *lock !=3D fx->val);
> > -		return ret;
> > -	case VIA_FUTEX_WAKE:
> > -		wake_up(&(dev_priv->decoder_queue[fx->lock]));
> > -		return 0;
> > -	}
> > -	return 0;
> > -}
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
