Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D69B269CE
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 16:43:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F76E10E898;
	Thu, 14 Aug 2025 14:43:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VBBSO794";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC10810E898
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 14:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755182627; x=1786718627;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=ImfWFpqxk78jwCRF3tUjgfT7mMjVQU0+44DPDXfrbiE=;
 b=VBBSO794m4W9FRMLx+1xRKDTYSX4EjeCyF/0jFvJfvepOxzlpmhfJv57
 +q8JpUWGW7TW6K7DzmtLghLnB7ANMR2/+tuhh0AxylRpd1GpUD5RbUOOJ
 VhTEVwU8WcCR+5R070rplwEJ4pIfTOYs+euuNfhY1EgYbIuFD3hngxBgz
 St39VSQDxo/Xfz6tipSbDdHnFqv+6ymlQ1HCwiYCwnCLYBzJoIzgIsXSA
 LtNrQSgwiMOa0GDtFl4U6fg7codWrzlRDF7qA6OSvsFu/XZGWF4QFnvjd
 x2taUFNHXOv0+3+7Hq6UbjQh6pKdG8852s7znQSSOv5mz5fYfkDyqym0u Q==;
X-CSE-ConnectionGUID: 7ky8duTsQaCmsdiqD4h1IQ==
X-CSE-MsgGUID: EvRT4SkYQJ2eY6ixswRI/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="57451145"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="57451145"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 07:43:46 -0700
X-CSE-ConnectionGUID: RtUbSgG0RH+6gccEUxqsJw==
X-CSE-MsgGUID: DHvBsYiUQyeiMeAseRGcvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="203951147"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.100])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 07:43:42 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Sidharth Seela <sidharthseela@gmail.com>
Cc: "dakr@redhat.com" <dakr@redhat.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, "airlied@gmail.com"
 <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: PATCH[1/1] DRM_GPUVM.C : htmldoc error due to multi-line code
 inside comment
In-Reply-To: <CAJE-K+AgxF-n5bg8++NcKphPBb4xHYeg-wBzAYNHUzM+KhpUHA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CAJE-K+BcU2vQPXyK9bdWTkRD_jreEcmD6zmnKrwut_7mCNv7bw@mail.gmail.com>
 <854286215216fe5242f3232032625b4fbe62074e@intel.com>
 <CAJE-K+Ca95Qx_6sbj2S=PfwXbMoaK5A97yWqQutTVN4aKQdu+Q@mail.gmail.com>
 <CAJE-K+AgxF-n5bg8++NcKphPBb4xHYeg-wBzAYNHUzM+KhpUHA@mail.gmail.com>
Date: Thu, 14 Aug 2025 17:43:38 +0300
Message-ID: <ac039b0fc2c59bcd3d313c2fbe014a657d58bbb7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 14 Aug 2025, Sidharth Seela <sidharthseela@gmail.com> wrote:
> [PATCH 2/2] @ drivers/gpu/drm/drm_gpuvm.c :  Used '..' to escape the
> block of comments starting at line 2435.
>
> Changes from 1/2: As the previous patch involved too many line
> changes, this patch keeps it a bit clean by just having 4 changes.
>
> Please Note that I think mentioned in [1] "..code-block :: c" is to be
> used for rst pages, but as we are dealing with a c file,
> we don't want sphinx to parse the comments as c code, we just want the
> comments to be parsed as just comments.
> and hence [1] needs to be disregarded.

Really the only two alternatives here are adding ".. code-block:: c" or
adding double-colon at the end of the "The expected usage is::" as
suggested in [2].

[2] https://lore.kernel.org/r/20250720152401.70720-2-luis.hernandez093@gmai=
l.com

> Refs: [1] https://lore.kernel.org/all/20250810150706.305040-1-rampxxxx@gm=
ail.com/
> signed-off-by:Sidharth Seela<sidharthseela@gmail.com>
> -------------------------------------------------------------------------=
---------------------------------------------------------------------------=
----
> commit 8c6b6943261764bdfeeebfc358aa0f34e30fb6b5
> Author:     Sidharth Seela <sidharthseela@gmail.com>
> AuthorDate: Thu Aug 14 19:11:44 2025 +0530
> Commit:     Sidharth Seela <sidharthseela@gmail.com>
> CommitDate: Thu Aug 14 19:11:44 2025 +0530
>
>     '..' used as escape. New-lines removed to take code as a block.

Please read [3] on how to format and send patches.

Use git send-email possibly with git format-patch. The AuthorDate and
CommitDate stuff from --pretty=3Dfuller do not belong here.

Separate mailing list discussions from patch emails. Possibly add a
cover letter for the explanatory texts.

Use 'git commit -s' to add the Signed-off-by trailer properly.

Please look at git log for proper Subject prefix, subject, and commit
message formatting.

[3] https://docs.kernel.org/process/submitting-patches.html

> ---
>  drivers/gpu/drm/drm_gpuvm.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index bbc7fecb6f4a..d01eaa353f72 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -2432,12 +2432,10 @@ static const struct drm_gpuvm_ops lock_ops =3D {
>   *
>   * The expected usage is:
>   *
> - *    vm_bind {
> + *..  vm_bind {

This won't do what we want.

>   *        struct drm_exec exec;
> - *

We'll want to keep the newlines.

BR,
Jani.

>   *        // IGNORE_DUPLICATES is required, INTERRUPTIBLE_WAIT is recomm=
ended:
>   *        drm_exec_init(&exec, IGNORE_DUPLICATES | INTERRUPTIBLE_WAIT, 0=
);
> - *
>   *        drm_exec_until_all_locked (&exec) {
>   *            for_each_vm_bind_operation {
>   *                switch (op->op) {
> @@ -2450,7 +2448,6 @@ static const struct drm_gpuvm_ops lock_ops =3D {
>   *                                                     obj, op->obj_offs=
et);
>   *                    break;
>   *                }
> - *
>   *                drm_exec_retry_on_contention(&exec);
>   *                if (ret)
>   *                    return ret;
> --
> 2.39.5 (Apple Git-154)
>
>
> On Thu, Aug 14, 2025 at 6:02=E2=80=AFPM Sidharth Seela <sidharthseela@gma=
il.com> wrote:
>>
>> Thank you Jani
>> [BUG: Comment parsing error]
>> What I did -> Applied the patch, you referred [1]
>> https://lore.kernel.org/r/20250810150706.305040-1-rampxxxx@gmail.com.
>> What I got-> error message pasted below.
>> What I think might be the problem -> I believe ampersand's are being
>> parsed as ':c:type:' while document generation
>>
>> --------ERROR MESSAGE START:---------
>> linux/Documentation/gpu/drm-mm:506:
>> ./drivers/gpu/drm/drm_gpuvm.c:2434: WARNING: Lexing literal_block
>> 'vm_bind {\n    struct drm_exec exec;\n\n    // IGNORE_DUPLICATES is
>> required, INTERRUPTIBLE_WAIT is recommended:\n
>> drm_exec_init(:c:type:`exec`, IGNORE_DUPLICATES | INTERRUPTIBLE_WAIT,
>> 0);\n\n    drm_exec_until_all_locked (:c:type:`exec`) {\n
>> for_each_vm_bind_operation {\n            switch (op->op) {\n
>>   case DRIVER_OP_UNMAP:\n                ret =3D
>> drm_gpuvm_sm_unmap_exec_lock(gpuvm, :c:type:`exec`, op->addr,
>> op->range);\n                break;\n            case DRIVER_OP_MAP:\n
>>                ret =3D drm_gpuvm_sm_map_exec_lock(gpuvm, :c:type:`exec`,
>> num_fences,\n
>> op->addr, op->range,\n
>> obj, op->obj_offset);\n                break;\n            }\n\n
>>      drm_exec_retry_on_contention(:c:type:`exec`);\n            if
>> (ret)\n                return ret;\n        }\n    }\n}' as "c"
>> resulted in an error at token: '`'. Retrying in relaxed mode.
>> [misc.highlighting_failure]
>> --------ERROR MESSAGE END:---------
>> PS: reporting this first, to give heads up, parallely trying to debug.
>>
>>
>> On Wed, Aug 13, 2025 at 4:00=E2=80=AFPM Jani Nikula <jani.nikula@linux.i=
ntel.com> wrote:
>> >
>> > On Tue, 12 Aug 2025, Sidharth Seela <sidharthseela@gmail.com> wrote:
>> > > Dear Maintainers,
>> > > This is my first patch, please bear with me.
>> > > I request you to suggest if it can be better.
>> > > Your time is appreciated.
>> >
>> > A simpler fix is already on the list [1].
>> >
>> > BR,
>> > Jani.
>> >
>> >
>> > [1] https://lore.kernel.org/r/20250810150706.305040-1-rampxxxx@gmail.c=
om
>> >
>> > > --------------------------------------------------------------------=
-------
>> > > commit 4ed9c00376c616cdbfb978b5fd76911cccd63b26
>> > > Author:     Sidharth Seela <sid@y740.local>
>> > > AuthorDate: Tue Aug 12 15:56:03 2025 +0530
>> > > Commit:     Sidharth Seela <sid@y740.local>
>> > > CommitDate: Tue Aug 12 15:56:03 2025 +0530
>> > >
>> > >     cleaned up errors stemming for multiline text
>> > > ---
>> > >  drivers/gpu/drm/drm_gpuvm.c | 50 ++++++++++++++++++----------------=
---
>> > >  1 file changed, 25 insertions(+), 25 deletions(-)
>> > >
>> > > diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm=
.c
>> > > index bbc7fecb6f4a..cf49dbfcec91 100644
>> > > --- a/drivers/gpu/drm/drm_gpuvm.c
>> > > +++ b/drivers/gpu/drm/drm_gpuvm.c
>> > > @@ -2432,31 +2432,31 @@ static const struct drm_gpuvm_ops lock_ops =
=3D {
>> > >   *
>> > >   * The expected usage is:
>> > >   *
>> > > - *    vm_bind {
>> > > - *        struct drm_exec exec;
>> > > - *
>> > > - *        // IGNORE_DUPLICATES is required, INTERRUPTIBLE_WAIT is r=
ecommended:
>> > > - *        drm_exec_init(&exec, IGNORE_DUPLICATES | INTERRUPTIBLE_WA=
IT, 0);
>> > > - *
>> > > - *        drm_exec_until_all_locked (&exec) {
>> > > - *            for_each_vm_bind_operation {
>> > > - *                switch (op->op) {
>> > > - *                case DRIVER_OP_UNMAP:
>> > > - *                    ret =3D drm_gpuvm_sm_unmap_exec_lock(gpuvm,
>> > > &exec, op->addr, op->range);
>> > > - *                    break;
>> > > - *                case DRIVER_OP_MAP:
>> > > - *                    ret =3D drm_gpuvm_sm_map_exec_lock(gpuvm, &ex=
ec,
>> > > num_fences,
>> > > - *                                                     op->addr, op=
->range,
>> > > - *                                                     obj, op->obj=
_offset);
>> > > - *                    break;
>> > > - *                }
>> > > - *
>> > > - *                drm_exec_retry_on_contention(&exec);
>> > > - *                if (ret)
>> > > - *                    return ret;
>> > > - *            }
>> > > - *        }
>> > > - *    }
>> > > + * *   vm_bind {
>> > > + * *       struct drm_exec exec;
>> > > + * *
>> > > + * *       // IGNORE_DUPLICATES is required, INTERRUPTIBLE_WAIT is =
recommended:
>> > > + * *       drm_exec_init(&exec, IGNORE_DUPLICATES | INTERRUPTIBLE_W=
AIT, 0);
>> > > + * *
>> > > + * *       drm_exec_until_all_locked (&exec) {
>> > > + * *           for_each_vm_bind_operation {
>> > > + * *               switch (op->op) {
>> > > + * *               case DRIVER_OP_UNMAP:
>> > > + * *                   ret =3D drm_gpuvm_sm_unmap_exec_lock(gpuvm,
>> > > &exec, op->addr, op->range);
>> > > + * *                   break;
>> > > + * *               case DRIVER_OP_MAP:
>> > > + * *                   ret =3D drm_gpuvm_sm_map_exec_lock(gpuvm, &e=
xec,
>> > > num_fences,
>> > > + * *                                                    op->addr, o=
p->range,
>> > > + * *                                                    obj, op->ob=
j_offset);
>> > > + * *                   break;
>> > > + * *               }
>> > > + * *
>> > > + * *               drm_exec_retry_on_contention(&exec);
>> > > + * *               if (ret)
>> > > + * *                   return ret;
>> > > + * *           }
>> > > + * *       }
>> > > + * *   }
>> > >   *
>> > >   * This enables all locking to be performed before the driver begin=
s modifying
>> > >   * the VM.  This is safe to do in the case of overlapping DRIVER_VM=
_BIND_OPs,
>> > > --
>> > > 2.39.5
>> > > signed-off-by:Sidharth Seela<sidharthseela@gmail.com>
>> >
>> > --
>> > Jani Nikula, Intel
>>
>>
>>
>> --
>> Thanks,
>> Sidharth Seela
>> +91 - 8826248419
>> www.realtimedesign.org

--=20
Jani Nikula, Intel
