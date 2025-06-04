Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F052ACE230
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 18:26:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 860B610E157;
	Wed,  4 Jun 2025 16:26:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="xU25q/Zs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C1AB10E157
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 16:26:48 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id
 46e09a7af769-735ae79a44bso5786373a34.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jun 2025 09:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1749054407; x=1749659207;
 darn=lists.freedesktop.org; 
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=ll3GQZZx1aAM5fgTmVcrO9i0nGXI4VPhhW9oOfi4ATE=;
 b=xU25q/ZsGVA5q1D+V5kn52ZOEhW2Z9qEqBCkD7DhNfsezOcTThl7M5MMsglVaiWuML
 1htmKLVJSgnhqS44kvJHmHI9cwDmxp3Xsyezrrbs7X26FJNmIvryRs56CQZyXYcW4Qtx
 Jj76GdQwQf0FKB5EHMeTRAkX+YAnY0toZs5gr1F1S0LMW8PjpWACFleqQ0/Lj6JdUE0u
 wi8YCYnbqkbtzmO4dRc4dyqGGSjPE0FHFppoBg1ttn0pJYZzVz9A1cj+Tdesi6cS+xVF
 mhH05PglLsEUQWamFmIoW1bZwRBWiRhkoS+S0XUQ9urzXgILOEkYZlxwc1acdy29eg9d
 2zyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749054407; x=1749659207;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ll3GQZZx1aAM5fgTmVcrO9i0nGXI4VPhhW9oOfi4ATE=;
 b=qQmVJgqkTVL4CKpseZY38YP+V+ncfALq0lvxw6FSJ6wpYaNKZOUpeVWrHdUuGGzsAT
 VoOHNyHVA44oHeQJLzHhAP7eje10gUnj7zTdRIRRTF25jjsbyiAqdSRe6aqXd6KhpnQZ
 wF3pTT99VDLhxf03YXWBS1jT7zb3F7Ci7HLCvbiEza2J553jeaVw9kWxsdhJDI3HBE13
 vlv011ZDMzpuVboX80ywxA2dK2oQsSINOatig7UCEZ0rpUijuiHTxQAqV7BbEJrtA967
 dLlQKQP8qVjNF5sLK+QKkWBtYVs9MljkYu4FBbNw9//cUns5n919MPxhlE3aeYYnCQcO
 /ngg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJgbB7cjwbr1qDS1u53OjwiN+61ZwQLpOQDsbXHlk2wfFhw+AeqzcnNpU6EIud5WcCyHgFoys1WQw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywh9Zd79TIqKkCh/VYBY9YJFvZbfHdAupA3iPWVuYEBlcGcLEX6
 76yLB/x5Syx7kDFb100uS7IG2gybcR/jRJUdmAyEjQ6SGxHU0+WPGFQ34iYbKfeVMBXBiBK/7dY
 N235LOg==
X-Gm-Gg: ASbGncs1++y+eDribwjeOtVuasgKDyFJR+B6c1hwa9EKa3mLyuZuSa7WJyndAb4olGl
 ib4ZyttHtbH23D2oqTOxE14MyfyILwj13SEZ3UmtEDzIT8OyB2BYbp4z2iG34l/JH6bVrIpTYhi
 89cAJbUzwa5ckXoHlc1teMFaWwnUorEbyJ+5wmXbbniOgkFOKhon62ditzA3hdzyXM/W8bbi0+K
 uWWiRsCjSKfOqAK/Q12/zg14LHbE6w1Kx2Pu4LklcObsBOIPJbVmLsnvDz+IFAtWDjldrpZaw5D
 wGY5k9bYwK6vbAFUVWIRUPug0h7aSHbbbHIC6cdgGRPI8MwHl0YSPd4TZm8xBWWc3ODenadmLY7
 dQjCLpMdwkm1eR3gBGt4X14GDKVmBE2DdFUdVqtbfYyfccDxLrumvA0vJ
X-Google-Smtp-Source: AGHT+IGSJuYZ5PsSec3GKgHBhYBIFvpgIeA062k15kkewiYaZixAYmRU9waq5Y86IJBjw0vOZ1huZA==
X-Received: by 2002:a05:6808:99a:b0:408:e711:9a8 with SMTP id
 5614622812f47-408f0f68e39mr2160313b6e.15.1749054396518; 
 Wed, 04 Jun 2025 09:26:36 -0700 (PDT)
Received: from darker.attlocal.net
 (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-40678d038c0sm2244681b6e.46.2025.06.04.09.26.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 09:26:35 -0700 (PDT)
Date: Wed, 4 Jun 2025 09:26:21 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
cc: Steven Rostedt <rostedt@goodmis.org>, LKML <linux-kernel@vger.kernel.org>, 
 Linus Torvalds <torvalds@linux-foundation.org>, 
 Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>, 
 Matthew Auld <matthew.auld@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v2] drm/ttm: Fix compile error when CONFIG_SHMEM is not set
In-Reply-To: <6b3a37712330ec4b17968075f71296717db54046.camel@linux.intel.com>
Message-ID: <d996ffad-42f1-1643-e44e-e837b2e3949d@google.com>
References: <20250604085121.324be8c1@gandalf.local.home>
 <6b3a37712330ec4b17968075f71296717db54046.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="-1463770367-1698767313-1749054395=:6218"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463770367-1698767313-1749054395=:6218
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 4 Jun 2025, Thomas Hellstr=C3=B6m wrote:
> On Wed, 2025-06-04 at 08:51 -0400, Steven Rostedt wrote:
> > From: Steven Rostedt <rostedt@goodmis.org>
> >=20
> > When CONFIG_SHMEM is not set, the following compiler error occurs:
> >=20
> > ld: vmlinux.o: in function `ttm_backup_backup_page':
> > (.text+0x10363bc): undefined reference to `shmem_writeout'
> > make[3]: ***
> > [/work/build/trace/nobackup/linux.git/scripts/Makefile.vmlinux:91:
> > vmlinux.unstripped] Error 1
> > make[2]: *** [/work/build/trace/nobackup/linux.git/Makefile:1241:
> > vmlinux] Error 2
> > make[1]: *** [/work/build/trace/nobackup/linux.git/Makefile:248:
> > __sub-make] Error 2
> > make[1]: Leaving directory '/work/build/nobackup/tracetest'
> > make: *** [Makefile:248: __sub-make] Error 2
> >=20
> > This is due to the replacement of writepage and calling
> > swap_writeout()
> > and shmem_writeout() directly. The issue is that when CONFIG_SHMEM is
> > not
> > defined, shmem_writeout() is also not defined.
> >=20
> > The function ttm_backup_backup_page() called mapping->a_ops-
> > >writepage()
> > which was then changed to call shmem_writeout() directly.
> >=20
> > Even before commit 84798514db50 ("mm: Remove swap_writepage() and
> > shmem_writepage()"), it didn't make sense to call anything other than
> > shmem_writeout() as the ttm_backup deals only with shmem folios.
> >=20
> > Have DRM_TTM config option select SHMEM to guarantee that
> > shmem_writeout()
> > is available.
> >=20
> > Link:
> > https://lore.kernel.org/all/20250602170500.48713a2b@gandalf.local.home/
> >=20
> > Suggested-by: Hugh Dickins <hughd@google.com>
> > Fixes: 84798514db50 ("mm: Remove swap_writepage() and
> > shmem_writepage()")
> > Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> > ---
> > Changes since v1:
> > https://lore.kernel.org/all/20250602170500.48713a2b@gandalf.local.home/
> >=20
> > - Instead of adding a shmem_writeout() stub, just make CONFIG_DRM_TTM
> > =C2=A0 select CONFIG_SHMEM (Hugh Dickins)
> >=20
> > =C2=A0drivers/gpu/drm/Kconfig | 1 +
> > =C2=A01 file changed, 1 insertion(+)
> >=20
> > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> > index f094797f3b2b..ded28c71d89c 100644
> > --- a/drivers/gpu/drm/Kconfig
> > +++ b/drivers/gpu/drm/Kconfig
> > @@ -188,6 +188,7 @@ source "drivers/gpu/drm/display/Kconfig"
> > =C2=A0config DRM_TTM
> > =C2=A0=09tristate
> > =C2=A0=09depends on DRM && MMU
> > +=09select SHMEM
> > =C2=A0=09help
> > =C2=A0=09=C2=A0 GPU memory management subsystem for devices with multip=
le
> > =C2=A0=09=C2=A0 GPU memory types. Will be enabled automatically if a
> > device driver
>=20
> Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

Acked-by: Hugh Dickins <hughd@google.com>

Thanks a lot!
---1463770367-1698767313-1749054395=:6218--
