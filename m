Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F4F581AED
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 22:21:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E669714BA13;
	Tue, 26 Jul 2022 20:20:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com
 [IPv6:2607:f8b0:4864:20::e34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C424F14BA01
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 20:20:45 +0000 (UTC)
Received: by mail-vs1-xe34.google.com with SMTP id o4so11554439vsc.12
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 13:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=8DDlw71kxuBNkD9T0+gU1qa+/EtuUrX8WQJVRQDRunA=;
 b=SLRXRgb/dzHxWC6l0k2a5904De1ayFwuNW9plYECY1XNqMpp1qU3ulm1DZaskHagsQ
 +IZUJfweEFIhfqiJtefcUvaYUt9dyg2470s9lxhKlN+U7hDPP0Gw/WHkC4CUrxGXIQm4
 rGwlGAPH0FWwwe9E/WiGUGAW5oGhZ8SaZ9rsYCszqnEDq4cotN2XDSg8K5rz91LorKev
 u+vaIzvNQj/lcOvVPxDJi2axk5nKJiTsBQ9Lq3AMzE1QrB3pri6H6HqgJbt0Q0FjqkJt
 X911KR7A9/CslQ47AAXcEbMDpr29X4CceEk4dg2xPH3jicspRqw01htNF05va+MMtzSs
 2IaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=8DDlw71kxuBNkD9T0+gU1qa+/EtuUrX8WQJVRQDRunA=;
 b=AdRI+XSWipjlQHhep/TDDyMJo4SF4Zej+w74FUOJ1dnPHVZ4BaeXqyvDqVcv1iQ4rL
 zcAKI8lOkzOBdTITV5oCXp/Sm2eoiO5io+0K8ucL+v3zGzpXclF0D9y+sfGXsINo+7Sl
 FABlrxigSZNBfx1urpIgw6eEz7s0QTsKOQp/fi9jJOiS6UixCb744Dyj3ddNzNqnhb9F
 0TN7xVq4+JpffGMHlLNwF44QLisHXukxPHQ5/hgA9g/vo3RTznr3Ym9uDg0JTdMgBPz+
 RvgIKTHy+aDfbOK7s4h1uhi7uM7QMtkF7++yqUTN+pLdFsM6IlTZyiKyeKfyOQcLDe2K
 QpbA==
X-Gm-Message-State: AJIora8dkDWeoSfGAoZ4uVt9aOr/AHZkmCdO0BzlcTjNAC0nc5Fc5vd8
 nb5J+qgxYFLJQhGNwOWq83KI74UEYDU4UfB2MAc=
X-Google-Smtp-Source: AGRyM1uiY6NDNq26gqpKgwpjS+y+MAMPG8Zqjsx1beVfaYFfn2Z7o14G8iRg8KM2Uqztq1Mpibah3mBEOwLEaPwBwKs=
X-Received: by 2002:a05:6102:7b7:b0:358:5255:5cb8 with SMTP id
 x23-20020a05610207b700b0035852555cb8mr4439170vsg.24.1658866844723; Tue, 26
 Jul 2022 13:20:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220725235359.20516-1-kevinbrace@gmx.com>
 <20220725235359.20516-7-kevinbrace@gmx.com>
 <YuAnXcz0ImO+cAHu@ravnborg.org> <6e3473a8-f668-efdc-92b4-0a085e6531d7@suse.de>
In-Reply-To: <6e3473a8-f668-efdc-92b4-0a085e6531d7@suse.de>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 27 Jul 2022 06:20:33 +1000
Message-ID: <CAPM=9tx9JFVFdBpEkxVF5AjtpBuVcyWY-xA=-u=ZZMemz4jafA@mail.gmail.com>
Subject: Re: [PATCH v3 26/32] drm/via: Add via_drm.h
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Kevin Brace <kevinbrace@gmx.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 27 Jul 2022 at 04:18, Thomas Zimmermann <tzimmermann@suse.de> wrote=
:
>
> Hi
>
> Am 26.07.22 um 19:41 schrieb Sam Ravnborg:
> > Hi Kevin.
> >
> > On Mon, Jul 25, 2022 at 04:53:53PM -0700, Kevin Brace wrote:
> >> From: Kevin Brace <kevinbrace@bracecomputerlab.com>
> >>
> >> Changed the uAPI.
> >>
> >> Signed-off-by: Kevin Brace <kevinbrace@bracecomputerlab.com>
> >
> > It would be great to have the new extensions to the UAPI documented
> > using kernel-doc.
> > As an example see: vc4_drm.h
> >
> > There are a lot of UAPI that is missing documentation, but if we do not
> > add it for new UAPI then this situation never improves.
> >
> > Please use __u32, __u64 like you see in other drm UAPI files.
> >
> > PS. If you reply to this mail, then please keep the full mail as
> > usually my mails to Kevin bounces (something with STARTTLS).
> >
> >       Sam
> >
> >> ---
> >>   include/uapi/drm/via_drm.h | 35 +++++++++++++++++++++++++++++++----
> >>   1 file changed, 31 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/include/uapi/drm/via_drm.h b/include/uapi/drm/via_drm.h
> >> index a1e125d42208..e9da45ce130a 100644
> >> --- a/include/uapi/drm/via_drm.h
> >> +++ b/include/uapi/drm/via_drm.h
> >> @@ -1,4 +1,5 @@
> >>   /*
> >> + * Copyright =C2=A9 2020 Kevin Brace
> >>    * Copyright 1998-2003 VIA Technologies, Inc. All Rights Reserved.
> >>    * Copyright 2001-2003 S3 Graphics, Inc. All Rights Reserved.
> >>    *
> >> @@ -16,10 +17,10 @@
> >>    * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, E=
XPRESS OR
> >>    * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTA=
BILITY,
> >>    * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVEN=
T SHALL
> >> - * VIA, S3 GRAPHICS, AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DA=
MAGES OR
> >> - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWI=
SE,
> >> - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE=
 OR OTHER
> >> - * DEALINGS IN THE SOFTWARE.
> >> + * THE AUTHORS, COPYRIGHT HOLDERS, AND/OR ITS SUPPLIERS BE LIABLE FOR=
 ANY
> >> + * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRAC=
T, TORT
> >> + * OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTW=
ARE OR
> >> + * THE USE OR OTHER DEALINGS IN THE SOFTWARE.
> >>    */
> > Do not mix license changes with other changes - and use SPDX tag if
> > possible for the updated license.
> > See other drm UAPI files for examples.
> >
> >
> >>   #ifndef _VIA_DRM_H_
> >>   #define _VIA_DRM_H_
> >> @@ -81,6 +82,11 @@ extern "C" {
> >>   #define DRM_VIA_DMA_BLIT        0x0e
> >>   #define DRM_VIA_BLIT_SYNC       0x0f
> >>
> >> +#define     DRM_VIA_GEM_CREATE      0x10
> >> +#define     DRM_VIA_GEM_MAP         0x11
> >> +#define     DRM_VIA_GEM_UNMAP       0x12
> >> +
> > Use the same alignment as the previous lines.
> >> +
> > Drop extra empty line.
> >
> >>   #define DRM_IOCTL_VIA_ALLOCMEM       DRM_IOWR(DRM_COMMAND_BASE + DRM=
_VIA_ALLOCMEM, drm_via_mem_t)
> >>   #define DRM_IOCTL_VIA_FREEMEM        DRM_IOW( DRM_COMMAND_BASE + DRM=
_VIA_FREEMEM, drm_via_mem_t)
> >>   #define DRM_IOCTL_VIA_AGP_INIT       DRM_IOWR(DRM_COMMAND_BASE + DRM=
_VIA_AGP_INIT, drm_via_agp_t)
> >> @@ -97,6 +103,10 @@ extern "C" {
> >>   #define DRM_IOCTL_VIA_DMA_BLIT    DRM_IOW(DRM_COMMAND_BASE + DRM_VIA=
_DMA_BLIT, drm_via_dmablit_t)
> >>   #define DRM_IOCTL_VIA_BLIT_SYNC   DRM_IOW(DRM_COMMAND_BASE + DRM_VIA=
_BLIT_SYNC, drm_via_blitsync_t)
> >>
> >> +#define     DRM_IOCTL_VIA_GEM_CREATE        DRM_IOWR(DRM_COMMAND_BASE=
 + DRM_VIA_GEM_CREATE, struct drm_via_gem_create)
> >> +#define     DRM_IOCTL_VIA_GEM_MAP           DRM_IOWR(DRM_COMMAND_BASE=
 + DRM_VIA_GEM_MAP, struct drm_via_gem_map)
> >> +#define     DRM_IOCTL_VIA_GEM_UNMAP         DRM_IOR(DRM_COMMAND_BASE =
+ DRM_VIA_GEM_UNMAP, struct drm_via_gem_unmap)
> >> +
> > Use same alignment as previous lines.
> >
> >>   /* Indices into buf.Setup where various bits of state are mirrored p=
er
> >>    * context and per buffer.  These can be fired at the card as a unit=
,
> >>    * or in a piecewise fashion as required.
> >> @@ -275,6 +285,23 @@ typedef struct drm_via_dmablit {
> >>      drm_via_blitsync_t sync;
> >>   } drm_via_dmablit_t;
> >>
> >> +struct drm_via_gem_create {
> >> +    uint64_t size;
> >> +    uint32_t alignment;
> >> +    uint32_t domain;
> >> +    uint32_t handle;
> >> +    uint64_t offset;
> >> +};
> > I do not know if this is relevant, but adding a 64 bit parameter
> > (offset) that is only 32 bit aligned looks like trouble to me.
> > I hope others that knows this better can comment here.
>
> The compiler will leave a 4-byte gap between handle and offset.
> Structure allocation guarantees a minimal alignment of 8 bytes, so the
> field alignment will be correct. It's all dependend on architecture,
> platofrm, calling convention, but that's the rule of thumb.
>
> Have a look at the tool 'pahole' to inspect data-structure alignment in
> object files. You'll find plenty of gaps in compiled structure.
>
> It's still questionable to leave the gap there. Either declare it
> explicity (e.g., __u32 empty0; )  or declare the structure with
> __attribute__((__packed__)).  Personally, I'd use the former.

It's not allowed at all to use packed or leave the gap.

https://www.kernel.org/doc/html/latest/process/botching-up-ioctls.html

The 2nd prereq covers this.

Dave.
