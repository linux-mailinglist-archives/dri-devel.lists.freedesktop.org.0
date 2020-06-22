Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B52A203355
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 11:29:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA4246E131;
	Mon, 22 Jun 2020 09:29:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC8F56E159
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 09:29:37 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id l17so14184907wmj.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 02:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=KDcE4Ir6+23od4kjjxVOUpl21xdXNZXgYHzf6+7rLfo=;
 b=eqnQEdMxMw4E0E1UAUQe7HgMBwxAjmUtluQHBl8v56PXohEET2Ff0e+RUqUdzJhsV8
 7vgtNSbD44CBQDP9gLMJr6/uZjcU7lKINoYae6ppGHUT7EmrnokfMNl5UgPt0ZS3QJpw
 D3MXgkdsXKKy/C73Ox6MwFaluCKeVTr8NJ1ME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=KDcE4Ir6+23od4kjjxVOUpl21xdXNZXgYHzf6+7rLfo=;
 b=sR7puE5nisYsyVq4utzzXqLfZ3R0eNwofLROShqzckB2Edb753KILSts4CBXsiYmEC
 zWI/irovTPLl8Xj5yrzMnoWNgh8asautQmhmk0XuQojTH7n5lYyK+HCXPRHZ4fg5Vl7Z
 ZPkz39KQhOkzBibNgkZdPjxOeXETfad+m8wN3TLnCODZVmJhLiYxTcYvB7XPaLQxpz7f
 cFfam9bEoKA5OyhGZN6YmULFg3SNztr1+cTa7cw7HNCOVShxI9iA0mkgA/06wt/QCqci
 xZ4yYwFOYKV8bpr7+EHlETi5ode3aiU417UBbH+sjIYJyn8QDgVl6Tw7ieYRacwv01ob
 4ZiA==
X-Gm-Message-State: AOAM530na919oJ75JXG35qDQBVUEvlbAnEayV0J2h8930g/k7+TX9V+Z
 IOpcWILoVmyXAAui7/5Ns4S07A==
X-Google-Smtp-Source: ABdhPJzDdRT68EDEwj3BGsSxuL9NZ+PfsYprTXzcMD60c8xCqddtmm9PqPaTzQGtfWDNXSzZqRBdXQ==
X-Received: by 2002:a7b:c186:: with SMTP id y6mr18348926wmi.82.1592818176056; 
 Mon, 22 Jun 2020 02:29:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z1sm3306753wrh.14.2020.06.22.02.29.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 02:29:35 -0700 (PDT)
Date: Mon, 22 Jun 2020 11:29:33 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 2/3] drm: uapi: Use SPDX in DRM drivers uAPI headers
Message-ID: <20200622092933.GY20149@phenom.ffwll.local>
References: <20200621020703.864-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200621020703.864-2-laurent.pinchart+renesas@ideasonboard.com>
 <1e5f7ae2-8b41-dcda-4306-7751e8fbf02b@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1e5f7ae2-8b41-dcda-4306-7751e8fbf02b@amd.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: Sean Paul <sean@poorly.run>, Thomas Hellstrom <thellstrom@vmware.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Thomas Gleixner <tglx@linutronix.de>, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 22, 2020 at 09:58:44AM +0200, Christian K=F6nig wrote:
> Am 21.06.20 um 04:07 schrieb Laurent Pinchart:
> > Most of the DRM drivers uAPI headers are licensed under the MIT license,
> > and carry copies of the license with slight variations. Replace them
> > with SPDX headers.
> =

> My personal opinion is that this is a really good idea, but my profession=
al
> is that we need the acknowledgment from our legal department for this.

I think official ack from amd on first patch, especially the .rst snippet,
would be really good indeed.

> Please separate that change into one for each driver/company/maintainer.
> Amdgpu, radeon, r128 can be one for example.

You can leave all the other legacy drivers in one patch (mga, savage, sis,
via), since there's likely no one around anymore and will just boil down
to drm maintainer ack from Dave&me.
-Daniel

> =

> Thanks,
> Christian.
> =

> > =

> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.=
com>
> > ---
> >   include/uapi/drm/amdgpu_drm.h  | 19 +------------------
> >   include/uapi/drm/i915_drm.h    | 22 +---------------------
> >   include/uapi/drm/mga_drm.h     | 20 +-------------------
> >   include/uapi/drm/msm_drm.h     | 20 +-------------------
> >   include/uapi/drm/nouveau_drm.h | 20 +-------------------
> >   include/uapi/drm/qxl_drm.h     | 20 +-------------------
> >   include/uapi/drm/r128_drm.h    | 20 +-------------------
> >   include/uapi/drm/radeon_drm.h  | 20 +-------------------
> >   include/uapi/drm/savage_drm.h  | 20 +-------------------
> >   include/uapi/drm/sis_drm.h     | 21 +--------------------
> >   include/uapi/drm/tegra_drm.h   | 19 +------------------
> >   include/uapi/drm/v3d_drm.h     | 20 +-------------------
> >   include/uapi/drm/vc4_drm.h     | 20 +-------------------
> >   include/uapi/drm/vgem_drm.h    | 22 +---------------------
> >   include/uapi/drm/via_drm.h     | 20 +-------------------
> >   include/uapi/drm/virtgpu_drm.h | 20 +-------------------
> >   include/uapi/drm/vmwgfx_drm.h  | 21 +--------------------
> >   17 files changed, 17 insertions(+), 327 deletions(-)
> > =

> > diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_dr=
m.h
> > index 4e873dcbe68f..c6adda72bec7 100644
> > --- a/include/uapi/drm/amdgpu_drm.h
> > +++ b/include/uapi/drm/amdgpu_drm.h
> > @@ -1,3 +1,4 @@
> > +/* SPDX-License-Identifier: MIT */
> >   /* amdgpu_drm.h -- Public header for the amdgpu driver -*- linux-c -*-
> >    *
> >    * Copyright 2000 Precision Insight, Inc., Cedar Park, Texas.
> > @@ -5,24 +6,6 @@
> >    * Copyright 2002 Tungsten Graphics, Inc., Cedar Park, Texas.
> >    * Copyright 2014 Advanced Micro Devices, Inc.
> >    *
> > - * Permission is hereby granted, free of charge, to any person obtaini=
ng a
> > - * copy of this software and associated documentation files (the "Soft=
ware"),
> > - * to deal in the Software without restriction, including without limi=
tation
> > - * the rights to use, copy, modify, merge, publish, distribute, sublic=
ense,
> > - * and/or sell copies of the Software, and to permit persons to whom t=
he
> > - * Software is furnished to do so, subject to the following conditions:
> > - *
> > - * The above copyright notice and this permission notice shall be incl=
uded in
> > - * all copies or substantial portions of the Software.
> > - *
> > - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXP=
RESS OR
> > - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABI=
LITY,
> > - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT =
SHALL
> > - * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAG=
ES OR
> > - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWIS=
E,
> > - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE =
OR
> > - * OTHER DEALINGS IN THE SOFTWARE.
> > - *
> >    * Authors:
> >    *    Kevin E. Martin <martin@valinux.com>
> >    *    Gareth Hughes <gareth@valinux.com>
> > diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> > index 14b67cd6b54b..c29e3acb3026 100644
> > --- a/include/uapi/drm/i915_drm.h
> > +++ b/include/uapi/drm/i915_drm.h
> > @@ -1,27 +1,7 @@
> > +/* SPDX-License-Identifier: MIT */
> >   /*
> >    * Copyright 2003 Tungsten Graphics, Inc., Cedar Park, Texas.
> >    * All Rights Reserved.
> > - *
> > - * Permission is hereby granted, free of charge, to any person obtaini=
ng a
> > - * copy of this software and associated documentation files (the
> > - * "Software"), to deal in the Software without restriction, including
> > - * without limitation the rights to use, copy, modify, merge, publish,
> > - * distribute, sub license, and/or sell copies of the Software, and to
> > - * permit persons to whom the Software is furnished to do so, subject =
to
> > - * the following conditions:
> > - *
> > - * The above copyright notice and this permission notice (including the
> > - * next paragraph) shall be included in all copies or substantial port=
ions
> > - * of the Software.
> > - *
> > - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXP=
RESS
> > - * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> > - * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEM=
ENT.
> > - * IN NO EVENT SHALL TUNGSTEN GRAPHICS AND/OR ITS SUPPLIERS BE LIABLE =
FOR
> > - * ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONT=
RACT,
> > - * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
> > - * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
> > - *
> >    */
> >   #ifndef _UAPI_I915_DRM_H_
> > diff --git a/include/uapi/drm/mga_drm.h b/include/uapi/drm/mga_drm.h
> > index 8c4337548ab5..4415efefe0cf 100644
> > --- a/include/uapi/drm/mga_drm.h
> > +++ b/include/uapi/drm/mga_drm.h
> > @@ -1,3 +1,4 @@
> > +/* SPDX-License-Identifier: MIT */
> >   /* mga_drm.h -- Public header for the Matrox g200/g400 driver -*- lin=
ux-c -*-
> >    * Created: Tue Jan 25 01:50:01 1999 by jhartmann@precisioninsight.com
> >    *
> > @@ -5,25 +6,6 @@
> >    * Copyright 2000 VA Linux Systems, Inc., Sunnyvale, California.
> >    * All rights reserved.
> >    *
> > - * Permission is hereby granted, free of charge, to any person obtaini=
ng a
> > - * copy of this software and associated documentation files (the "Soft=
ware"),
> > - * to deal in the Software without restriction, including without limi=
tation
> > - * the rights to use, copy, modify, merge, publish, distribute, sublic=
ense,
> > - * and/or sell copies of the Software, and to permit persons to whom t=
he
> > - * Software is furnished to do so, subject to the following conditions:
> > - *
> > - * The above copyright notice and this permission notice (including th=
e next
> > - * paragraph) shall be included in all copies or substantial portions =
of the
> > - * Software.
> > - *
> > - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXP=
RESS OR
> > - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABI=
LITY,
> > - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT =
SHALL
> > - * VA LINUX SYSTEMS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMA=
GES OR
> > - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWIS=
E,
> > - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE =
OR
> > - * OTHER DEALINGS IN THE SOFTWARE.
> > - *
> >    * Authors:
> >    *    Jeff Hartmann <jhartmann@valinux.com>
> >    *    Keith Whitwell <keith@tungstengraphics.com>
> > diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
> > index 0b85ed6a3710..189d1a7f7a7b 100644
> > --- a/include/uapi/drm/msm_drm.h
> > +++ b/include/uapi/drm/msm_drm.h
> > @@ -1,25 +1,7 @@
> > +/* SPDX-License-Identifier: MIT */
> >   /*
> >    * Copyright (C) 2013 Red Hat
> >    * Author: Rob Clark <robdclark@gmail.com>
> > - *
> > - * Permission is hereby granted, free of charge, to any person obtaini=
ng a
> > - * copy of this software and associated documentation files (the "Soft=
ware"),
> > - * to deal in the Software without restriction, including without limi=
tation
> > - * the rights to use, copy, modify, merge, publish, distribute, sublic=
ense,
> > - * and/or sell copies of the Software, and to permit persons to whom t=
he
> > - * Software is furnished to do so, subject to the following conditions:
> > - *
> > - * The above copyright notice and this permission notice (including th=
e next
> > - * paragraph) shall be included in all copies or substantial portions =
of the
> > - * Software.
> > - *
> > - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXP=
RESS OR
> > - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABI=
LITY,
> > - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT =
SHALL
> > - * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES O=
R OTHER
> > - * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARI=
SING FROM,
> > - * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALI=
NGS IN THE
> > - * SOFTWARE.
> >    */
> >   #ifndef __MSM_DRM_H__
> > diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_=
drm.h
> > index 853a327433d3..555283b49080 100644
> > --- a/include/uapi/drm/nouveau_drm.h
> > +++ b/include/uapi/drm/nouveau_drm.h
> > @@ -1,25 +1,7 @@
> > +/* SPDX-License-Identifier: MIT */
> >   /*
> >    * Copyright 2005 Stephane Marchesin.
> >    * All Rights Reserved.
> > - *
> > - * Permission is hereby granted, free of charge, to any person obtaini=
ng a
> > - * copy of this software and associated documentation files (the "Soft=
ware"),
> > - * to deal in the Software without restriction, including without limi=
tation
> > - * the rights to use, copy, modify, merge, publish, distribute, sublic=
ense,
> > - * and/or sell copies of the Software, and to permit persons to whom t=
he
> > - * Software is furnished to do so, subject to the following conditions:
> > - *
> > - * The above copyright notice and this permission notice (including th=
e next
> > - * paragraph) shall be included in all copies or substantial portions =
of the
> > - * Software.
> > - *
> > - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXP=
RESS OR
> > - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABI=
LITY,
> > - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT =
SHALL
> > - * VA LINUX SYSTEMS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMA=
GES OR
> > - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWIS=
E,
> > - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE =
OR
> > - * OTHER DEALINGS IN THE SOFTWARE.
> >    */
> >   #ifndef __NOUVEAU_DRM_H__
> > diff --git a/include/uapi/drm/qxl_drm.h b/include/uapi/drm/qxl_drm.h
> > index 880999d2d863..9fbf97ad7272 100644
> > --- a/include/uapi/drm/qxl_drm.h
> > +++ b/include/uapi/drm/qxl_drm.h
> > @@ -1,25 +1,7 @@
> > +/* SPDX-License-Identifier: MIT */
> >   /*
> >    * Copyright 2013 Red Hat
> >    * All Rights Reserved.
> > - *
> > - * Permission is hereby granted, free of charge, to any person obtaini=
ng a
> > - * copy of this software and associated documentation files (the "Soft=
ware"),
> > - * to deal in the Software without restriction, including without limi=
tation
> > - * the rights to use, copy, modify, merge, publish, distribute, sublic=
ense,
> > - * and/or sell copies of the Software, and to permit persons to whom t=
he
> > - * Software is furnished to do so, subject to the following conditions:
> > - *
> > - * The above copyright notice and this permission notice (including th=
e next
> > - * paragraph) shall be included in all copies or substantial portions =
of the
> > - * Software.
> > - *
> > - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXP=
RESS OR
> > - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABI=
LITY,
> > - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT =
SHALL
> > - * THE AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
> > - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWIS=
E,
> > - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE =
OR
> > - * OTHER DEALINGS IN THE SOFTWARE.
> >    */
> >   #ifndef QXL_DRM_H
> >   #define QXL_DRM_H
> > diff --git a/include/uapi/drm/r128_drm.h b/include/uapi/drm/r128_drm.h
> > index 690e9c62f510..c426e6a1c843 100644
> > --- a/include/uapi/drm/r128_drm.h
> > +++ b/include/uapi/drm/r128_drm.h
> > @@ -1,3 +1,4 @@
> > +/* SPDX-License-Identifier: MIT */
> >   /* r128_drm.h -- Public header for the r128 driver -*- linux-c -*-
> >    * Created: Wed Apr  5 19:24:19 2000 by kevin@precisioninsight.com
> >    */
> > @@ -6,25 +7,6 @@
> >    * Copyright 2000 VA Linux Systems, Inc., Sunnyvale, California.
> >    * All rights reserved.
> >    *
> > - * Permission is hereby granted, free of charge, to any person obtaini=
ng a
> > - * copy of this software and associated documentation files (the "Soft=
ware"),
> > - * to deal in the Software without restriction, including without limi=
tation
> > - * the rights to use, copy, modify, merge, publish, distribute, sublic=
ense,
> > - * and/or sell copies of the Software, and to permit persons to whom t=
he
> > - * Software is furnished to do so, subject to the following conditions:
> > - *
> > - * The above copyright notice and this permission notice (including th=
e next
> > - * paragraph) shall be included in all copies or substantial portions =
of the
> > - * Software.
> > - *
> > - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXP=
RESS OR
> > - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABI=
LITY,
> > - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT =
SHALL
> > - * PRECISION INSIGHT AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAM=
AGES OR
> > - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWIS=
E,
> > - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE =
OR OTHER
> > - * DEALINGS IN THE SOFTWARE.
> > - *
> >    * Authors:
> >    *    Gareth Hughes <gareth@valinux.com>
> >    *    Kevin E. Martin <martin@valinux.com>
> > diff --git a/include/uapi/drm/radeon_drm.h b/include/uapi/drm/radeon_dr=
m.h
> > index 490a59cc4532..b5c4ef813a9e 100644
> > --- a/include/uapi/drm/radeon_drm.h
> > +++ b/include/uapi/drm/radeon_drm.h
> > @@ -1,3 +1,4 @@
> > +/* SPDX-License-Identifier: MIT */
> >   /* radeon_drm.h -- Public header for the radeon driver -*- linux-c -*-
> >    *
> >    * Copyright 2000 Precision Insight, Inc., Cedar Park, Texas.
> > @@ -5,25 +6,6 @@
> >    * Copyright 2002 Tungsten Graphics, Inc., Cedar Park, Texas.
> >    * All rights reserved.
> >    *
> > - * Permission is hereby granted, free of charge, to any person obtaini=
ng a
> > - * copy of this software and associated documentation files (the "Soft=
ware"),
> > - * to deal in the Software without restriction, including without limi=
tation
> > - * the rights to use, copy, modify, merge, publish, distribute, sublic=
ense,
> > - * and/or sell copies of the Software, and to permit persons to whom t=
he
> > - * Software is furnished to do so, subject to the following conditions:
> > - *
> > - * The above copyright notice and this permission notice (including th=
e next
> > - * paragraph) shall be included in all copies or substantial portions =
of the
> > - * Software.
> > - *
> > - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXP=
RESS OR
> > - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABI=
LITY,
> > - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT =
SHALL
> > - * PRECISION INSIGHT AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAM=
AGES OR
> > - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWIS=
E,
> > - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE =
OR OTHER
> > - * DEALINGS IN THE SOFTWARE.
> > - *
> >    * Authors:
> >    *    Kevin E. Martin <martin@valinux.com>
> >    *    Gareth Hughes <gareth@valinux.com>
> > diff --git a/include/uapi/drm/savage_drm.h b/include/uapi/drm/savage_dr=
m.h
> > index 0f6eddef74aa..bd5e74348db4 100644
> > --- a/include/uapi/drm/savage_drm.h
> > +++ b/include/uapi/drm/savage_drm.h
> > @@ -1,26 +1,8 @@
> > +/* SPDX-License-Identifier: MIT */
> >   /* savage_drm.h -- Public header for the savage driver
> >    *
> >    * Copyright 2004  Felix Kuehling
> >    * All Rights Reserved.
> > - *
> > - * Permission is hereby granted, free of charge, to any person obtaini=
ng a
> > - * copy of this software and associated documentation files (the "Soft=
ware"),
> > - * to deal in the Software without restriction, including without limi=
tation
> > - * the rights to use, copy, modify, merge, publish, distribute, sub li=
cense,
> > - * and/or sell copies of the Software, and to permit persons to whom t=
he
> > - * Software is furnished to do so, subject to the following conditions:
> > - *
> > - * The above copyright notice and this permission notice (including the
> > - * next paragraph) shall be included in all copies or substantial port=
ions
> > - * of the Software.
> > - *
> > - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> > - * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> > - * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> > - * NON-INFRINGEMENT. IN NO EVENT SHALL FELIX KUEHLING BE LIABLE FOR
> > - * ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
> > - * CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
> > - * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
> >    */
> >   #ifndef __SAVAGE_DRM_H__
> > diff --git a/include/uapi/drm/sis_drm.h b/include/uapi/drm/sis_drm.h
> > index 3e3f7e989e0b..9f7eb13b1975 100644
> > --- a/include/uapi/drm/sis_drm.h
> > +++ b/include/uapi/drm/sis_drm.h
> > @@ -1,27 +1,8 @@
> > +/* SPDX-License-Identifier: MIT */
> >   /* sis_drv.h -- Private header for sis driver -*- linux-c -*- */
> >   /*
> >    * Copyright 2005 Eric Anholt
> >    * All Rights Reserved.
> > - *
> > - * Permission is hereby granted, free of charge, to any person obtaini=
ng a
> > - * copy of this software and associated documentation files (the "Soft=
ware"),
> > - * to deal in the Software without restriction, including without limi=
tation
> > - * the rights to use, copy, modify, merge, publish, distribute, sublic=
ense,
> > - * and/or sell copies of the Software, and to permit persons to whom t=
he
> > - * Software is furnished to do so, subject to the following conditions:
> > - *
> > - * The above copyright notice and this permission notice (including th=
e next
> > - * paragraph) shall be included in all copies or substantial portions =
of the
> > - * Software.
> > - *
> > - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXP=
RESS OR
> > - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABI=
LITY,
> > - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT =
SHALL
> > - * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES O=
R OTHER
> > - * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARI=
SING FROM,
> > - * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALI=
NGS IN THE
> > - * SOFTWARE.
> > - *
> >    */
> >   #ifndef __SIS_DRM_H__
> > diff --git a/include/uapi/drm/tegra_drm.h b/include/uapi/drm/tegra_drm.h
> > index c4df3c3668b3..98c2f17aa7de 100644
> > --- a/include/uapi/drm/tegra_drm.h
> > +++ b/include/uapi/drm/tegra_drm.h
> > @@ -1,23 +1,6 @@
> > +/* SPDX-License-Identifier: MIT */
> >   /*
> >    * Copyright (c) 2012-2013, NVIDIA CORPORATION.  All rights reserved.
> > - *
> > - * Permission is hereby granted, free of charge, to any person obtaini=
ng a
> > - * copy of this software and associated documentation files (the "Soft=
ware"),
> > - * to deal in the Software without restriction, including without limi=
tation
> > - * the rights to use, copy, modify, merge, publish, distribute, sublic=
ense,
> > - * and/or sell copies of the Software, and to permit persons to whom t=
he
> > - * Software is furnished to do so, subject to the following conditions:
> > - *
> > - * The above copyright notice and this permission notice shall be incl=
uded in
> > - * all copies or substantial portions of the Software.
> > - *
> > - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXP=
RESS OR
> > - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABI=
LITY,
> > - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT =
SHALL
> > - * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAG=
ES OR
> > - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWIS=
E,
> > - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE =
OR
> > - * OTHER DEALINGS IN THE SOFTWARE.
> >    */
> >   #ifndef _UAPI_TEGRA_DRM_H_
> > diff --git a/include/uapi/drm/v3d_drm.h b/include/uapi/drm/v3d_drm.h
> > index 1ce746e228d9..7895fb9bc018 100644
> > --- a/include/uapi/drm/v3d_drm.h
> > +++ b/include/uapi/drm/v3d_drm.h
> > @@ -1,24 +1,6 @@
> > +/* SPDX-License-Identifier: MIT */
> >   /*
> >    * Copyright =A9 2014-2018 Broadcom
> > - *
> > - * Permission is hereby granted, free of charge, to any person obtaini=
ng a
> > - * copy of this software and associated documentation files (the "Soft=
ware"),
> > - * to deal in the Software without restriction, including without limi=
tation
> > - * the rights to use, copy, modify, merge, publish, distribute, sublic=
ense,
> > - * and/or sell copies of the Software, and to permit persons to whom t=
he
> > - * Software is furnished to do so, subject to the following conditions:
> > - *
> > - * The above copyright notice and this permission notice (including th=
e next
> > - * paragraph) shall be included in all copies or substantial portions =
of the
> > - * Software.
> > - *
> > - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXP=
RESS OR
> > - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABI=
LITY,
> > - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT =
SHALL
> > - * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES O=
R OTHER
> > - * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARI=
SING
> > - * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER=
 DEALINGS
> > - * IN THE SOFTWARE.
> >    */
> >   #ifndef _V3D_DRM_H_
> > diff --git a/include/uapi/drm/vc4_drm.h b/include/uapi/drm/vc4_drm.h
> > index 2cac6277a1d7..14b9a2186eae 100644
> > --- a/include/uapi/drm/vc4_drm.h
> > +++ b/include/uapi/drm/vc4_drm.h
> > @@ -1,24 +1,6 @@
> > +/* SPDX-License-Identifier: MIT */
> >   /*
> >    * Copyright =A9 2014-2015 Broadcom
> > - *
> > - * Permission is hereby granted, free of charge, to any person obtaini=
ng a
> > - * copy of this software and associated documentation files (the "Soft=
ware"),
> > - * to deal in the Software without restriction, including without limi=
tation
> > - * the rights to use, copy, modify, merge, publish, distribute, sublic=
ense,
> > - * and/or sell copies of the Software, and to permit persons to whom t=
he
> > - * Software is furnished to do so, subject to the following conditions:
> > - *
> > - * The above copyright notice and this permission notice (including th=
e next
> > - * paragraph) shall be included in all copies or substantial portions =
of the
> > - * Software.
> > - *
> > - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXP=
RESS OR
> > - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABI=
LITY,
> > - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT =
SHALL
> > - * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES O=
R OTHER
> > - * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARI=
SING
> > - * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER=
 DEALINGS
> > - * IN THE SOFTWARE.
> >    */
> >   #ifndef _UAPI_VC4_DRM_H_
> > diff --git a/include/uapi/drm/vgem_drm.h b/include/uapi/drm/vgem_drm.h
> > index bf66f5db6da8..965e1ad00dcb 100644
> > --- a/include/uapi/drm/vgem_drm.h
> > +++ b/include/uapi/drm/vgem_drm.h
> > @@ -1,27 +1,7 @@
> > +/* SPDX-License-Identifier: MIT */
> >   /*
> >    * Copyright 2016 Intel Corporation
> >    * All Rights Reserved.
> > - *
> > - * Permission is hereby granted, free of charge, to any person obtaini=
ng a
> > - * copy of this software and associated documentation files (the
> > - * "Software"), to deal in the Software without restriction, including
> > - * without limitation the rights to use, copy, modify, merge, publish,
> > - * distribute, sub license, and/or sell copies of the Software, and to
> > - * permit persons to whom the Software is furnished to do so, subject =
to
> > - * the following conditions:
> > - *
> > - * The above copyright notice and this permission notice (including the
> > - * next paragraph) shall be included in all copies or substantial port=
ions
> > - * of the Software.
> > - *
> > - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXP=
RESS
> > - * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> > - * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEM=
ENT.
> > - * IN NO EVENT SHALL TUNGSTEN GRAPHICS AND/OR ITS SUPPLIERS BE LIABLE =
FOR
> > - * ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONT=
RACT,
> > - * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
> > - * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
> > - *
> >    */
> >   #ifndef _UAPI_VGEM_DRM_H_
> > diff --git a/include/uapi/drm/via_drm.h b/include/uapi/drm/via_drm.h
> > index a1e125d42208..d77a21e7eb70 100644
> > --- a/include/uapi/drm/via_drm.h
> > +++ b/include/uapi/drm/via_drm.h
> > @@ -1,25 +1,7 @@
> > +/* SPDX-License-Identifier: MIT */
> >   /*
> >    * Copyright 1998-2003 VIA Technologies, Inc. All Rights Reserved.
> >    * Copyright 2001-2003 S3 Graphics, Inc. All Rights Reserved.
> > - *
> > - * Permission is hereby granted, free of charge, to any person obtaini=
ng a
> > - * copy of this software and associated documentation files (the "Soft=
ware"),
> > - * to deal in the Software without restriction, including without limi=
tation
> > - * the rights to use, copy, modify, merge, publish, distribute, sub li=
cense,
> > - * and/or sell copies of the Software, and to permit persons to whom t=
he
> > - * Software is furnished to do so, subject to the following conditions:
> > - *
> > - * The above copyright notice and this permission notice (including the
> > - * next paragraph) shall be included in all copies or substantial port=
ions
> > - * of the Software.
> > - *
> > - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXP=
RESS OR
> > - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABI=
LITY,
> > - * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT =
SHALL
> > - * VIA, S3 GRAPHICS, AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAM=
AGES OR
> > - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWIS=
E,
> > - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE =
OR OTHER
> > - * DEALINGS IN THE SOFTWARE.
> >    */
> >   #ifndef _VIA_DRM_H_
> >   #define _VIA_DRM_H_
> > diff --git a/include/uapi/drm/virtgpu_drm.h b/include/uapi/drm/virtgpu_=
drm.h
> > index f06a789f34cd..cea0352bc319 100644
> > --- a/include/uapi/drm/virtgpu_drm.h
> > +++ b/include/uapi/drm/virtgpu_drm.h
> > @@ -1,25 +1,7 @@
> > +/* SPDX-License-Identifier: MIT */
> >   /*
> >    * Copyright 2013 Red Hat
> >    * All Rights Reserved.
> > - *
> > - * Permission is hereby granted, free of charge, to any person obtaini=
ng a
> > - * copy of this software and associated documentation files (the "Soft=
ware"),
> > - * to deal in the Software without restriction, including without limi=
tation
> > - * the rights to use, copy, modify, merge, publish, distribute, sublic=
ense,
> > - * and/or sell copies of the Software, and to permit persons to whom t=
he
> > - * Software is furnished to do so, subject to the following conditions:
> > - *
> > - * The above copyright notice and this permission notice (including th=
e next
> > - * paragraph) shall be included in all copies or substantial portions =
of the
> > - * Software.
> > - *
> > - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXP=
RESS OR
> > - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABI=
LITY,
> > - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT =
SHALL
> > - * THE AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
> > - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWIS=
E,
> > - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE =
OR
> > - * OTHER DEALINGS IN THE SOFTWARE.
> >    */
> >   #ifndef VIRTGPU_DRM_H
> >   #define VIRTGPU_DRM_H
> > diff --git a/include/uapi/drm/vmwgfx_drm.h b/include/uapi/drm/vmwgfx_dr=
m.h
> > index 02e917507479..728e432f09a1 100644
> > --- a/include/uapi/drm/vmwgfx_drm.h
> > +++ b/include/uapi/drm/vmwgfx_drm.h
> > @@ -1,28 +1,9 @@
> > +/* SPDX-License-Identifier: MIT */
> >   /********************************************************************=
******
> >    *
> >    * Copyright =A9 2009-2015 VMware, Inc., Palo Alto, CA., USA
> >    * All Rights Reserved.
> >    *
> > - * Permission is hereby granted, free of charge, to any person obtaini=
ng a
> > - * copy of this software and associated documentation files (the
> > - * "Software"), to deal in the Software without restriction, including
> > - * without limitation the rights to use, copy, modify, merge, publish,
> > - * distribute, sub license, and/or sell copies of the Software, and to
> > - * permit persons to whom the Software is furnished to do so, subject =
to
> > - * the following conditions:
> > - *
> > - * The above copyright notice and this permission notice (including the
> > - * next paragraph) shall be included in all copies or substantial port=
ions
> > - * of the Software.
> > - *
> > - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXP=
RESS OR
> > - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABI=
LITY,
> > - * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT =
SHALL
> > - * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR A=
NY CLAIM,
> > - * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT =
OR
> > - * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE =
OR THE
> > - * USE OR OTHER DEALINGS IN THE SOFTWARE.
> > - *
> >    ********************************************************************=
******/
> >   #ifndef __VMWGFX_DRM_H__
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
