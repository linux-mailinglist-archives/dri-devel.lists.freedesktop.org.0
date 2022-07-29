Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A35458493A
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 03:06:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2753F10FEAE;
	Fri, 29 Jul 2022 01:06:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6296111B3CA
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 01:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1659056780;
 bh=aF/ABl+Ih4ZKaUbHEjptPqaZcMwACEofItxQofKHD9c=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=W2calaNOYIReelgZz6f/nSX2NQCdv/sLMOrKmSuzC5UzYJQq7lg/eWg0CgNqwED4n
 9mfFLYBTjs2/Y8vy85A/TFyfYr+51tbhDBWSkgS6PmIb6VyRKOwBM37uTi/uPU1W1I
 zSBa20oJeZYNC9aRoMnHz9fiIqKUe0ObN0SOt910=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [172.58.35.54] ([172.58.35.54]) by web-mail.gmx.net
 (3c-app-mailcom-bs16.server.lan [172.19.170.184]) (via HTTP); Fri, 29 Jul
 2022 03:06:20 +0200
MIME-Version: 1.0
Message-ID: <trinity-a16031db-8f2d-4a85-93f5-55ae94703c61-1659056780791@3c-app-mailcom-bs16>
From: Kevin Brace <kevinbrace@gmx.com>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH v3 26/32] drm/via: Add via_drm.h
Content-Type: text/plain; charset=UTF-8
Date: Fri, 29 Jul 2022 03:06:20 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <CAPM=9tx9JFVFdBpEkxVF5AjtpBuVcyWY-xA=-u=ZZMemz4jafA@mail.gmail.com>
References: <20220725235359.20516-1-kevinbrace@gmx.com>
 <20220725235359.20516-7-kevinbrace@gmx.com> <YuAnXcz0ImO+cAHu@ravnborg.org>
 <6e3473a8-f668-efdc-92b4-0a085e6531d7@suse.de>
 <CAPM=9tx9JFVFdBpEkxVF5AjtpBuVcyWY-xA=-u=ZZMemz4jafA@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:hY0qzEwPOna8Bo6pzJgW5mhtreVW4cRzld5Vnu7ElLSQAwivKvO5It0W6ilagM6Gg6AL9
 5GMELUEf+rJMexwitNjtM9mQq9SYjUKSWSuFQ23wW+unAGOI1hFao9Kyf5WnxgPbhXCfsa9fg1s3
 deSR4rlgvoS9aRsiBl1M/9Klb5YbONRh4Wv2ltrFlQ17HUpZjHpoqydjbVeklRRi7PqqN1t2NW5k
 VCdf8C0cmlzjmkbe+FXayc3tTtSkBbQNgBrcBodMDwQfRMsmagIUpVseCnYWihHG9uF3IBN6rftp
 bo=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:GMwIloaOCIE=:RIn4uG8ndVUnkW4AgrdogZ
 NLC1rvC5AOpcl8dEXDjhM2qRN6Q50sZtDA6EaTUwz6iUfINHwu1/eiPlo6VlmyCfVJ3PTkQUy
 LE/UU+PzpQZVc7Sl9naaUpfJFacLgaGac3pzPebHxWtPiupmWda3s0uP6pmFuGAKldJEGcwnR
 Z7SxFyK82t5ddt+JELzmLwBhwy+4sIy5m91In205hdfDZpVQm5XlV2leWHMcSlHJZMexQyc3d
 psgvf3X157QY38ELnz/MbDT9BsaRoJdDr/emo27UdyhzKbSwEiFxSUWgwSy+5wfk5+roX0lPK
 ZKCTUnbd2bOzbR2bAk3dJnY2FxcGrOfVqlt29d1Qvzs8G9v6DCgit7geQ14CUaTS3EspNnOi3
 fXnEc6Wv7vsO7+92ROUN+oUATgtFzsToNqvwNF2EKYqqfR7zoBuhCsKJTFDMhCfVYt6a1modU
 rv3249afA6E566thO8x3u3Pn4cvjVF8Da/hls3YyjStFeelgx3oya+aj4Vx3ZgmHtFhlUKtFL
 W3AhvRTB0QALm/BdojEg6iC4aixIJ7nTWPFAfI7BAYHF7fvp8DMJY4BanrJsLJKvy5UFEF1Qv
 Qp4Mf7nM24tKhuCkdghkkiwLVE04m/dJv+OKwI4IZ7LR68ey5hNlnZyVEpqoHuQRCokPgeCID
 ySJZqSNYIYvdVSd3eqWzTN7rI6WNmvzu5HLIrwl/4Aymt8CLLlZTZ8fbhwqdCxw+9vXf2kEV4
 FN5jbITgl8IZ1h05hMYeH00V+ncPPZJd9eV6ftLgWW/UCNtbU9jhvqAJc+ud9IyZI5IJVeMF5
 6I2QNXe
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
Cc: Sam Ravnborg <sam@ravnborg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

Thanks for pointing out the blog written by Daniel=2E
I was thinking that I will need to make refinements to OpenChrome DRM uAPI=
, so I will rework the uAPI=2E
I also plan to discontinue old VIA DRM uAPI by using drm_invalid_op()=2E
No one pointed this out, but I was thinking that something like this had t=
o be done=2E
I will work on these, and post the updated code soon with taking into cons=
ideration the VIA DRM DRI1 compaction work done by Sam / Thomas=2E

Regards,

Kevin Brace
Brace Computer Laboratory blog
https://bracecomputerlab=2Ecom


> Sent: Tuesday, July 26, 2022 at 1:20 PM
> From: "Dave Airlie" <airlied@gmail=2Ecom>
> To: "Thomas Zimmermann" <tzimmermann@suse=2Ede>
> Cc: "Sam Ravnborg" <sam@ravnborg=2Eorg>, "Kevin Brace" <kevinbrace@gmx=
=2Ecom>, "Kevin Brace" <kevinbrace@bracecomputerlab=2Ecom>, "dri-devel" <dr=
i-devel@lists=2Efreedesktop=2Eorg>
> Subject: Re: [PATCH v3 26/32] drm/via: Add via_drm=2Eh
>
> On Wed, 27 Jul 2022 at 04:18, Thomas Zimmermann <tzimmermann@suse=2Ede> =
wrote:
> >
> > Hi
> >
> > Am 26=2E07=2E22 um 19:41 schrieb Sam Ravnborg:
> > > Hi Kevin=2E
> > >
> > > On Mon, Jul 25, 2022 at 04:53:53PM -0700, Kevin Brace wrote:
> > >> From: Kevin Brace <kevinbrace@bracecomputerlab=2Ecom>
> > >>
> > >> Changed the uAPI=2E
> > >>
> > >> Signed-off-by: Kevin Brace <kevinbrace@bracecomputerlab=2Ecom>
> > >
> > > It would be great to have the new extensions to the UAPI documented
> > > using kernel-doc=2E
> > > As an example see: vc4_drm=2Eh
> > >
> > > There are a lot of UAPI that is missing documentation, but if we do =
not
> > > add it for new UAPI then this situation never improves=2E
> > >
> > > Please use __u32, __u64 like you see in other drm UAPI files=2E
> > >
> > > PS=2E If you reply to this mail, then please keep the full mail as
> > > usually my mails to Kevin bounces (something with STARTTLS)=2E
> > >
> > >       Sam
> > >
> > >> ---
> > >>   include/uapi/drm/via_drm=2Eh | 35 +++++++++++++++++++++++++++++++=
----
> > >>   1 file changed, 31 insertions(+), 4 deletions(-)
> > >>
> > >> diff --git a/include/uapi/drm/via_drm=2Eh b/include/uapi/drm/via_dr=
m=2Eh
> > >> index a1e125d42208=2E=2Ee9da45ce130a 100644
> > >> --- a/include/uapi/drm/via_drm=2Eh
> > >> +++ b/include/uapi/drm/via_drm=2Eh
> > >> @@ -1,4 +1,5 @@
> > >>   /*
> > >> + * Copyright =C2=A9 2020 Kevin Brace
> > >>    * Copyright 1998-2003 VIA Technologies, Inc=2E All Rights Reserv=
ed=2E
> > >>    * Copyright 2001-2003 S3 Graphics, Inc=2E All Rights Reserved=2E
> > >>    *
> > >> @@ -16,10 +17,10 @@
> > >>    * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND=
, EXPRESS OR
> > >>    * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHA=
NTABILITY,
> > >>    * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT=2E IN NO=
 EVENT SHALL
> > >> - * VIA, S3 GRAPHICS, AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,=
 DAMAGES OR
> > >> - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHE=
RWISE,
> > >> - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE =
USE OR OTHER
> > >> - * DEALINGS IN THE SOFTWARE=2E
> > >> + * THE AUTHORS, COPYRIGHT HOLDERS, AND/OR ITS SUPPLIERS BE LIABLE =
FOR ANY
> > >> + * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONT=
RACT, TORT
> > >> + * OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SO=
FTWARE OR
> > >> + * THE USE OR OTHER DEALINGS IN THE SOFTWARE=2E
> > >>    */
> > > Do not mix license changes with other changes - and use SPDX tag if
> > > possible for the updated license=2E
> > > See other drm UAPI files for examples=2E
> > >
> > >
> > >>   #ifndef _VIA_DRM_H_
> > >>   #define _VIA_DRM_H_
> > >> @@ -81,6 +82,11 @@ extern "C" {
> > >>   #define DRM_VIA_DMA_BLIT        0x0e
> > >>   #define DRM_VIA_BLIT_SYNC       0x0f
> > >>
> > >> +#define     DRM_VIA_GEM_CREATE      0x10
> > >> +#define     DRM_VIA_GEM_MAP         0x11
> > >> +#define     DRM_VIA_GEM_UNMAP       0x12
> > >> +
> > > Use the same alignment as the previous lines=2E
> > >> +
> > > Drop extra empty line=2E
> > >
> > >>   #define DRM_IOCTL_VIA_ALLOCMEM       DRM_IOWR(DRM_COMMAND_BASE + =
DRM_VIA_ALLOCMEM, drm_via_mem_t)
> > >>   #define DRM_IOCTL_VIA_FREEMEM        DRM_IOW( DRM_COMMAND_BASE + =
DRM_VIA_FREEMEM, drm_via_mem_t)
> > >>   #define DRM_IOCTL_VIA_AGP_INIT       DRM_IOWR(DRM_COMMAND_BASE + =
DRM_VIA_AGP_INIT, drm_via_agp_t)
> > >> @@ -97,6 +103,10 @@ extern "C" {
> > >>   #define DRM_IOCTL_VIA_DMA_BLIT    DRM_IOW(DRM_COMMAND_BASE + DRM_=
VIA_DMA_BLIT, drm_via_dmablit_t)
> > >>   #define DRM_IOCTL_VIA_BLIT_SYNC   DRM_IOW(DRM_COMMAND_BASE + DRM_=
VIA_BLIT_SYNC, drm_via_blitsync_t)
> > >>
> > >> +#define     DRM_IOCTL_VIA_GEM_CREATE        DRM_IOWR(DRM_COMMAND_B=
ASE + DRM_VIA_GEM_CREATE, struct drm_via_gem_create)
> > >> +#define     DRM_IOCTL_VIA_GEM_MAP           DRM_IOWR(DRM_COMMAND_B=
ASE + DRM_VIA_GEM_MAP, struct drm_via_gem_map)
> > >> +#define     DRM_IOCTL_VIA_GEM_UNMAP         DRM_IOR(DRM_COMMAND_BA=
SE + DRM_VIA_GEM_UNMAP, struct drm_via_gem_unmap)
> > >> +
> > > Use same alignment as previous lines=2E
> > >
> > >>   /* Indices into buf=2ESetup where various bits of state are mirro=
red per
> > >>    * context and per buffer=2E  These can be fired at the card as a=
 unit,
> > >>    * or in a piecewise fashion as required=2E
> > >> @@ -275,6 +285,23 @@ typedef struct drm_via_dmablit {
> > >>      drm_via_blitsync_t sync;
> > >>   } drm_via_dmablit_t;
> > >>
> > >> +struct drm_via_gem_create {
> > >> +    uint64_t size;
> > >> +    uint32_t alignment;
> > >> +    uint32_t domain;
> > >> +    uint32_t handle;
> > >> +    uint64_t offset;
> > >> +};
> > > I do not know if this is relevant, but adding a 64 bit parameter
> > > (offset) that is only 32 bit aligned looks like trouble to me=2E
> > > I hope others that knows this better can comment here=2E
> >
> > The compiler will leave a 4-byte gap between handle and offset=2E
> > Structure allocation guarantees a minimal alignment of 8 bytes, so the
> > field alignment will be correct=2E It's all dependend on architecture,
> > platofrm, calling convention, but that's the rule of thumb=2E
> >
> > Have a look at the tool 'pahole' to inspect data-structure alignment i=
n
> > object files=2E You'll find plenty of gaps in compiled structure=2E
> >
> > It's still questionable to leave the gap there=2E Either declare it
> > explicity (e=2Eg=2E, __u32 empty0; )  or declare the structure with
> > __attribute__((__packed__))=2E  Personally, I'd use the former=2E
>=20
> It's not allowed at all to use packed or leave the gap=2E
>=20
> https://www=2Ekernel=2Eorg/doc/html/latest/process/botching-up-ioctls=2E=
html
>=20
> The 2nd prereq covers this=2E
>=20
> Dave=2E
>
