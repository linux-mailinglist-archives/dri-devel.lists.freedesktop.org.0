Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A34B279ED
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 09:17:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47C3C10E8E1;
	Fri, 15 Aug 2025 07:17:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fYS1utHz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 152B110E892
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 13:57:36 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-6188b5b113eso1421461a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 06:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755179854; x=1755784654; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P94hL6/90e3+28QNpj11e+0q2vMCRXYIp3czZWFEZg4=;
 b=fYS1utHzAhE/b8fWga4VOkwzCoPVsqeEmLOXWh3Qid+HxRMmiwC6jYFsBKUW8+cgfS
 iZL9v5EwB5T+89isd+sPOA66q13cVwH0+00lakudw4lTtP8tdOj7fiDCglM6kk5Xdyqx
 pBXkczvpD14i3DZdcMt/Hd/eaaM8JlJn3c1wUM7qQJvz6Rdci0M7NLHS8oh7+DnSt4Hk
 jacdat5we6dcSIFPPVZwlPToV0qDA+QK0GvNc8wwFI7wXLeBXhBMBxgnJLSpYv3gNHkC
 GD71+z22tLU7Yyiwn1obvOMhuVzjJdH4bGEmMQT7WpvxOqxX7cKPgv0+OZrqVammkiM0
 LhRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755179854; x=1755784654;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P94hL6/90e3+28QNpj11e+0q2vMCRXYIp3czZWFEZg4=;
 b=LZk3cfa/JUhDh9aW7jOT32tqKHHtRo+0jjN9pu0TbrFl2UOZiAeHf1H4t0v/I/g2c9
 IZ6YmXOKImrSbFqmeLj9ZtVvw6GzbhG09UkiGsbHG1Bb8DhHA+5rf3vxHTkVK81Of0en
 n/N3G9os9DBwqEO9JR53ViBXPPGIBtNhIcASk8BA1QSdT02mGymYIcdZmF4jam3WHPbG
 al0em08U+R54VQLU9az2sA9nO12kIWb5oMpPezB1Mn4JczpHpUGZz4Z0hpgH1eMkNW8P
 Tl1Kj3uc5bqQDxgvCpEadUw93zNKBIPqYwISv+yC9kt++6zKPa9xOB8gmSVPLMqZCfL6
 pdwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8R1lK16TvYqZWlSr5bkRlxTWlDP/LkX9STfGFbQH6L+BOCyixsdtLEeJlWbGjJFxP6UXs2MaCxkI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsJD3Z0DxDxErVC5fNSWM/i5gGbkZx/PJHUDYn+ebV6yDf9ra2
 1jej2+poC2I6pGLn/UnDVTBjEfI2NuM54N6tNxfjQWyoEr0mYswvfjKKpw+Z5hOrBRqPgZTzfqx
 sMsoFkJdnj1+AkXkjJ17XJRLQvU3DBqk=
X-Gm-Gg: ASbGncu33HLNK2ttw04EdAao8cllLR00YEgdq4k3e49rDZI2erlQwk93bccVquzaUSV
 49/4Fo9RnPus/9Mnh/UzgJ/FLjNGl2S8vAsIoJXWcShR9YkiwIjxztGE+p0ljUAQ737CV6LYrRp
 FxtY3bGMoVEoU7k7roPA8Yk04xC9ffPxDoPbw+eWjWqLi6tPNB4LywJBzH6Xgt0ShuT6GOlBCeV
 cf+c1063jlmV9eu/3qOz9vkuG+vIAlQ1ryXzKfwiJhiNVUJSjAl
X-Google-Smtp-Source: AGHT+IE2BtP0uxmv9gagtkgliCRrsKglGNGzSs55Lyjx3vBTnxurnmkuYnrmpXjEs1XgEdpsGffGhuRRQFngzHKnn+k=
X-Received: by 2002:a05:6402:440b:b0:615:c767:5ba1 with SMTP id
 4fb4d7f45d1cf-6188b915be1mr2904801a12.3.1755179854308; Thu, 14 Aug 2025
 06:57:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAJE-K+BcU2vQPXyK9bdWTkRD_jreEcmD6zmnKrwut_7mCNv7bw@mail.gmail.com>
 <854286215216fe5242f3232032625b4fbe62074e@intel.com>
 <CAJE-K+Ca95Qx_6sbj2S=PfwXbMoaK5A97yWqQutTVN4aKQdu+Q@mail.gmail.com>
In-Reply-To: <CAJE-K+Ca95Qx_6sbj2S=PfwXbMoaK5A97yWqQutTVN4aKQdu+Q@mail.gmail.com>
From: Sidharth Seela <sidharthseela@gmail.com>
Date: Thu, 14 Aug 2025 19:27:21 +0530
X-Gm-Features: Ac12FXw1gXjcGSUVGljl_Gq_NXdRXU6dbC20fle1Ek7pTT_zQT7Ae_pWeZRn2tE
Message-ID: <CAJE-K+AgxF-n5bg8++NcKphPBb4xHYeg-wBzAYNHUzM+KhpUHA@mail.gmail.com>
Subject: Re: PATCH[1/1] DRM_GPUVM.C : htmldoc error due to multi-line code
 inside comment
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: "dakr@redhat.com" <dakr@redhat.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, 
 tzimmermann@suse.de, "airlied@gmail.com" <airlied@gmail.com>, 
 "simona@ffwll.ch" <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 15 Aug 2025 07:17:25 +0000
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

[PATCH 2/2] @ drivers/gpu/drm/drm_gpuvm.c :  Used '..' to escape the
block of comments starting at line 2435.

Changes from 1/2: As the previous patch involved too many line
changes, this patch keeps it a bit clean by just having 4 changes.

Please Note that I think mentioned in [1] "..code-block :: c" is to be
used for rst pages, but as we are dealing with a c file,
we don't want sphinx to parse the comments as c code, we just want the
comments to be parsed as just comments.
and hence [1] needs to be disregarded.

Refs: [1] https://lore.kernel.org/all/20250810150706.305040-1-rampxxxx@gmai=
l.com/
signed-off-by:Sidharth Seela<sidharthseela@gmail.com>
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
--
commit 8c6b6943261764bdfeeebfc358aa0f34e30fb6b5
Author:     Sidharth Seela <sidharthseela@gmail.com>
AuthorDate: Thu Aug 14 19:11:44 2025 +0530
Commit:     Sidharth Seela <sidharthseela@gmail.com>
CommitDate: Thu Aug 14 19:11:44 2025 +0530

    '..' used as escape. New-lines removed to take code as a block.
---
 drivers/gpu/drm/drm_gpuvm.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index bbc7fecb6f4a..d01eaa353f72 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -2432,12 +2432,10 @@ static const struct drm_gpuvm_ops lock_ops =3D {
  *
  * The expected usage is:
  *
- *    vm_bind {
+ *..  vm_bind {
  *        struct drm_exec exec;
- *
  *        // IGNORE_DUPLICATES is required, INTERRUPTIBLE_WAIT is recommen=
ded:
  *        drm_exec_init(&exec, IGNORE_DUPLICATES | INTERRUPTIBLE_WAIT, 0);
- *
  *        drm_exec_until_all_locked (&exec) {
  *            for_each_vm_bind_operation {
  *                switch (op->op) {
@@ -2450,7 +2448,6 @@ static const struct drm_gpuvm_ops lock_ops =3D {
  *                                                     obj, op->obj_offset=
);
  *                    break;
  *                }
- *
  *                drm_exec_retry_on_contention(&exec);
  *                if (ret)
  *                    return ret;
--
2.39.5 (Apple Git-154)


On Thu, Aug 14, 2025 at 6:02=E2=80=AFPM Sidharth Seela <sidharthseela@gmail=
.com> wrote:
>
> Thank you Jani
> [BUG: Comment parsing error]
> What I did -> Applied the patch, you referred [1]
> https://lore.kernel.org/r/20250810150706.305040-1-rampxxxx@gmail.com.
> What I got-> error message pasted below.
> What I think might be the problem -> I believe ampersand's are being
> parsed as ':c:type:' while document generation
>
> --------ERROR MESSAGE START:---------
> linux/Documentation/gpu/drm-mm:506:
> ./drivers/gpu/drm/drm_gpuvm.c:2434: WARNING: Lexing literal_block
> 'vm_bind {\n    struct drm_exec exec;\n\n    // IGNORE_DUPLICATES is
> required, INTERRUPTIBLE_WAIT is recommended:\n
> drm_exec_init(:c:type:`exec`, IGNORE_DUPLICATES | INTERRUPTIBLE_WAIT,
> 0);\n\n    drm_exec_until_all_locked (:c:type:`exec`) {\n
> for_each_vm_bind_operation {\n            switch (op->op) {\n
>   case DRIVER_OP_UNMAP:\n                ret =3D
> drm_gpuvm_sm_unmap_exec_lock(gpuvm, :c:type:`exec`, op->addr,
> op->range);\n                break;\n            case DRIVER_OP_MAP:\n
>                ret =3D drm_gpuvm_sm_map_exec_lock(gpuvm, :c:type:`exec`,
> num_fences,\n
> op->addr, op->range,\n
> obj, op->obj_offset);\n                break;\n            }\n\n
>      drm_exec_retry_on_contention(:c:type:`exec`);\n            if
> (ret)\n                return ret;\n        }\n    }\n}' as "c"
> resulted in an error at token: '`'. Retrying in relaxed mode.
> [misc.highlighting_failure]
> --------ERROR MESSAGE END:---------
> PS: reporting this first, to give heads up, parallely trying to debug.
>
>
> On Wed, Aug 13, 2025 at 4:00=E2=80=AFPM Jani Nikula <jani.nikula@linux.in=
tel.com> wrote:
> >
> > On Tue, 12 Aug 2025, Sidharth Seela <sidharthseela@gmail.com> wrote:
> > > Dear Maintainers,
> > > This is my first patch, please bear with me.
> > > I request you to suggest if it can be better.
> > > Your time is appreciated.
> >
> > A simpler fix is already on the list [1].
> >
> > BR,
> > Jani.
> >
> >
> > [1] https://lore.kernel.org/r/20250810150706.305040-1-rampxxxx@gmail.co=
m
> >
> > > ---------------------------------------------------------------------=
------
> > > commit 4ed9c00376c616cdbfb978b5fd76911cccd63b26
> > > Author:     Sidharth Seela <sid@y740.local>
> > > AuthorDate: Tue Aug 12 15:56:03 2025 +0530
> > > Commit:     Sidharth Seela <sid@y740.local>
> > > CommitDate: Tue Aug 12 15:56:03 2025 +0530
> > >
> > >     cleaned up errors stemming for multiline text
> > > ---
> > >  drivers/gpu/drm/drm_gpuvm.c | 50 ++++++++++++++++++-----------------=
--
> > >  1 file changed, 25 insertions(+), 25 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.=
c
> > > index bbc7fecb6f4a..cf49dbfcec91 100644
> > > --- a/drivers/gpu/drm/drm_gpuvm.c
> > > +++ b/drivers/gpu/drm/drm_gpuvm.c
> > > @@ -2432,31 +2432,31 @@ static const struct drm_gpuvm_ops lock_ops =
=3D {
> > >   *
> > >   * The expected usage is:
> > >   *
> > > - *    vm_bind {
> > > - *        struct drm_exec exec;
> > > - *
> > > - *        // IGNORE_DUPLICATES is required, INTERRUPTIBLE_WAIT is re=
commended:
> > > - *        drm_exec_init(&exec, IGNORE_DUPLICATES | INTERRUPTIBLE_WAI=
T, 0);
> > > - *
> > > - *        drm_exec_until_all_locked (&exec) {
> > > - *            for_each_vm_bind_operation {
> > > - *                switch (op->op) {
> > > - *                case DRIVER_OP_UNMAP:
> > > - *                    ret =3D drm_gpuvm_sm_unmap_exec_lock(gpuvm,
> > > &exec, op->addr, op->range);
> > > - *                    break;
> > > - *                case DRIVER_OP_MAP:
> > > - *                    ret =3D drm_gpuvm_sm_map_exec_lock(gpuvm, &exe=
c,
> > > num_fences,
> > > - *                                                     op->addr, op-=
>range,
> > > - *                                                     obj, op->obj_=
offset);
> > > - *                    break;
> > > - *                }
> > > - *
> > > - *                drm_exec_retry_on_contention(&exec);
> > > - *                if (ret)
> > > - *                    return ret;
> > > - *            }
> > > - *        }
> > > - *    }
> > > + * *   vm_bind {
> > > + * *       struct drm_exec exec;
> > > + * *
> > > + * *       // IGNORE_DUPLICATES is required, INTERRUPTIBLE_WAIT is r=
ecommended:
> > > + * *       drm_exec_init(&exec, IGNORE_DUPLICATES | INTERRUPTIBLE_WA=
IT, 0);
> > > + * *
> > > + * *       drm_exec_until_all_locked (&exec) {
> > > + * *           for_each_vm_bind_operation {
> > > + * *               switch (op->op) {
> > > + * *               case DRIVER_OP_UNMAP:
> > > + * *                   ret =3D drm_gpuvm_sm_unmap_exec_lock(gpuvm,
> > > &exec, op->addr, op->range);
> > > + * *                   break;
> > > + * *               case DRIVER_OP_MAP:
> > > + * *                   ret =3D drm_gpuvm_sm_map_exec_lock(gpuvm, &ex=
ec,
> > > num_fences,
> > > + * *                                                    op->addr, op=
->range,
> > > + * *                                                    obj, op->obj=
_offset);
> > > + * *                   break;
> > > + * *               }
> > > + * *
> > > + * *               drm_exec_retry_on_contention(&exec);
> > > + * *               if (ret)
> > > + * *                   return ret;
> > > + * *           }
> > > + * *       }
> > > + * *   }
> > >   *
> > >   * This enables all locking to be performed before the driver begins=
 modifying
> > >   * the VM.  This is safe to do in the case of overlapping DRIVER_VM_=
BIND_OPs,
> > > --
> > > 2.39.5
> > > signed-off-by:Sidharth Seela<sidharthseela@gmail.com>
> >
> > --
> > Jani Nikula, Intel
>
>
>
> --
> Thanks,
> Sidharth Seela
> +91 - 8826248419
> www.realtimedesign.org



--=20
Thanks,
Sidharth Seela
+91 - 8826248419
www.realtimedesign.org
