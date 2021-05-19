Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAEC388FAB
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 15:57:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB22F6EDC0;
	Wed, 19 May 2021 13:57:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AD126EDBA;
 Wed, 19 May 2021 13:57:24 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id y14so12051141wrm.13;
 Wed, 19 May 2021 06:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=L6xdZs0pS9+2EayO49Gy0OeHUs5jU/+uf3iWDxviq6o=;
 b=vXYRWzrWWIoj6FYkL1x3+BxtHZy3ERHQTstAEAP2BMM5O7n8zJ6/bizwfwpCR0r27h
 3DnEAyLv+/4Jn3i55RRyuZ4eL7rLPrcZ3Aj5Ks2QbysX9UogQbDhI7LNaMXk5AMpWCm+
 rOJ56K5tVyq9XWa5szidn/nkiss/VlfV8p+tvcFqIyTpqvRdTta18VnVN5OKo1tzudbI
 7JNfbXuwmobZPEmJ+qr/Uv+SE9QahagMZQt3bxeeQ9StSVBlH8WpeqgDObSUltlft35c
 g30MzewR3xxXQInAnIW8TD6cN5abA9sXG/XqUaHd1qlbq6QPPP54V9LebCEKQPDE4xFi
 oI7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=L6xdZs0pS9+2EayO49Gy0OeHUs5jU/+uf3iWDxviq6o=;
 b=s4AxFNO2Jbtlx6+XlytHUWgs2GF26FHUKKoa6cm/+AG8kAmHtEyxoNnMtaVtuOFiro
 BYlopja9JzsJYLaVtjTyUbTnklZhF0eEq0W0CXGNliQlOXBqw8GQl+oPolTMy2jPyUhn
 rWPSUKcgmmYtPmkqKRCSO9WzR60XjLa8T88AM43DLZ1Etx/dHJGORyrEN0CSjZ1YYh3s
 Mgz5OhBSgOtXAJRELFJ7Qc0jUgXTeLmZa03MCPGYoiCdyWNYJ6czodJ2T6arS+CsWTvD
 tB6wXVs5ilPcR2rLbmpAg5kGl4Y9TpxrhC7KIaoD9A0eLBLNhmvpKrH5YylvtZNxt7g+
 uivA==
X-Gm-Message-State: AOAM533m375R+lk5ZCgeuWhHtcJn+qgFXvhCyrXOdMKpnYG1NYcGY3M4
 KFfbFqmvyei7Ng9nI0Nd+/toZFjeLbaC5peJD0Y=
X-Google-Smtp-Source: ABdhPJzRhbsIRCUDk4iLOjhEQfCTx2t++MHHuG9yzIiWXLYvrI4KaiiTBeU3N6EwnqDz5dHFUotB2lrhBQQAeteQPCk=
X-Received: by 2002:a5d:678c:: with SMTP id v12mr15214508wru.246.1621432642647; 
 Wed, 19 May 2021 06:57:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210518235830.133834-1-matthew.brost@intel.com>
 <20210518235830.133834-3-matthew.brost@intel.com>
In-Reply-To: <20210518235830.133834-3-matthew.brost@intel.com>
From: =?UTF-8?Q?Marcin_=C5=9Alusarz?= <marcin.slusarz@gmail.com>
Date: Wed, 19 May 2021 15:57:04 +0200
Message-ID: <CA+GA0_sWQ100mOpOxBKcXH4iSKKjnJfr-x=Kidr6d3-hJnKXeQ@mail.gmail.com>
Subject: Re: [Mesa-dev] [RFC 2/2] drm/doc/rfc: i915 new parallel submission
 uAPI plan
To: Matthew Brost <matthew.brost@intel.com>
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
Cc: tony.ye@intel.com, tvrtko.ursulin@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 jason.ekstrand@intel.com, michal.mrozek@intel.com,
 daniele.ceraolospurio@intel.com, jon.bloomfield@intel.com,
 daniel.vetter@intel.com, ML mesa-dev <mesa-dev@lists.freedesktop.org>,
 karl@freedesktop.org, christian.koenig@amd.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

=C5=9Br., 19 maj 2021 o 01:41 Matthew Brost <matthew.brost@intel.com> napis=
a=C5=82(a):
>
> Add entry fpr i915 new parallel submission uAPI plan.

s/fpr/for/

>
> v2:
>  (Daniel Vetter):
>   - Expand logical order explaination
>   - Add dummy header
>   - Only allow N BBs in execbuf IOCTL
>   - Configure parallel submission per slot not per gem context
>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Tony Ye <tony.ye@intel.com>
> CC: Carl Zhang <carl.zhang@intel.com>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  Documentation/gpu/rfc/i915_parallel_execbuf.h | 144 ++++++++++++++++++
>  Documentation/gpu/rfc/i915_scheduler.rst      |  53 ++++++-
>  2 files changed, 196 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/gpu/rfc/i915_parallel_execbuf.h
>
> diff --git a/Documentation/gpu/rfc/i915_parallel_execbuf.h b/Documentatio=
n/gpu/rfc/i915_parallel_execbuf.h
> new file mode 100644
> index 000000000000..8c64b983ccad
> --- /dev/null
> +++ b/Documentation/gpu/rfc/i915_parallel_execbuf.h
> @@ -0,0 +1,144 @@
> +#define I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT 2 /* see i915_context_e=
ngines_parallel_submit */
> +
> +/*
> + * i915_context_engines_parallel_submit:
> + *
> + * Setup a slot to allow multiple BBs to be submitted in a single execbu=
f IOCTL.
> + * Those BBs will then be scheduled to run on the GPU in parallel. Multi=
ple
> + * hardware contexts are created internally in the i915 run these BBs. O=
nce a
> + * slot is configured for N BBs only N BBs can be submitted in each exec=
buf
> + * IOCTL and this is implict behavior (e.g. the user doesn't tell the ex=
ecbuf
> + * IOCTL there are N BBs, the execbuf IOCTL know how many BBs there are =
based on
> + * the slots configuration).
> + *
> + * Their are two currently defined ways to control the placement of the

s/Their/There/

> + * hardware contexts on physical engines: default behavior (no flags) an=
d
> + * I915_PARALLEL_IMPLICT_BONDS (a flag). More flags may be added the in =
the

IMPLICIT? This typo is repeated multiple times
s/the in the/in the/

> + * future as new hardware / use cases arise. Details of how to use this
> + * interface below above the flags.

"below above"? :)

> + *
> + * Returns -EINVAL if hardware context placement configuration invalid o=
r if the

is invalid

> + * placement configuration isn't supported on the platform / submission
> + * interface.
> + * Returns -ENODEV if extension isn't supported on the platform / submis=
sion
> + * inteface.
> + */
> +struct i915_context_engines_parallel_submit {
> +       struct i915_user_extension base;
> +
> +       __u16 engine_index;     /* slot for parallel engine */
> +       __u16 width;            /* number of contexts per parallel engine=
 */
> +       __u16 num_siblings;     /* number of siblings per context */
> +       __u16 mbz16;
> +/*
> + * Default placement behvavior (currently unsupported):

behavior

> + *
> + * Rather than restricting parallel submission to a single class with a
> + * logically contiguous placement (I915_PARALLEL_IMPLICT_BONDS), add a m=
ode that
> + * enables parallel submission across multiple engine classes. In this c=
ase each
> + * context's logical engine mask indicates where that context can placed=
. It is

can be placed

> + * implied in this mode that all contexts have mutual exclusive placemen=
t (e.g.
> + * if one context is running CS0 no other contexts can run on CS0).
> + *
> + * Example 1 pseudo code:
> + * CSX[Y] =3D engine class X, logical instance Y
> + * INVALID =3D I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVALID_NONE
> + * set_engines(INVALID)
> + * set_parallel(engine_index=3D0, width=3D2, num_siblings=3D2,
> + *             engines=3DCS0[0],CS0[1],CS1[0],CS1[1])
> + *
> + * Results in the following valid placements:
> + * CS0[0], CS1[0]
> + * CS0[0], CS1[1]
> + * CS0[1], CS1[0]
> + * CS0[1], CS1[1]
> + *
> + * This can also be though of as 2 virtual engines:

thought
(This typo repeats multiple times)

> + * VE[0] =3D CS0[0], CS0[1]
> + * VE[1] =3D CS1[0], CS1[1]
> + *
> + * Example 2 pseudo code:
> + * CS[X] =3D generic engine of same class, logical instance X
> + * INVALID =3D I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVALID_NONE
> + * set_engines(INVALID)
> + * set_parallel(engine_index=3D0, width=3D2, num_siblings=3D3,
> + *             engines=3DCS[0],CS[1],CS[2],CS[0],CS[1],CS[2])
> + *
> + * Results in the following valid placements:
> + * CS[0], CS[1]
> + * CS[0], CS[2]
> + * CS[1], CS[0]
> + * CS[1], CS[2]
> + * CS[2], CS[0]
> + * CS[2], CS[1]
> + *
> + *
> + * This can also be though of as 2 virtual engines:
> + * VE[0] =3D CS[0], CS[1], CS[2]
> + * VE[1] =3D CS[0], CS[1], CS[2]
> +
> + * This enables a use case where all engines are created equally, we don=
't care
> + * where they are scheduled, we just want a certain number of resources,=
 for
> + * those resources to be scheduled in parallel, and possibly across mult=
iple
> + * engine classes.
> + */
> +
> +/*
> + * I915_PARALLEL_IMPLICT_BONDS - Create implict bonds between each conte=
xt.
> + * Each context must have the same number sibling and bonds are implictl=
y create

number of siblings

> + * of the siblings.

"bonds are implictly create of the siblings."
-ENOPARSE

(also typo in implicitly)

> + *
> + * All of the below examples are in logical space.
> + *
> + * Example 1 pseudo code:
> + * CS[X] =3D generic engine of same class, logical instance X
> + * INVALID =3D I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVALID_NONE
> + * set_engines(INVALID)
> + * set_parallel(engine_index=3D0, width=3D2, num_siblings=3D1,
> + *             engines=3DCS[0],CS[1], flags=3DI915_PARALLEL_IMPLICT_BOND=
S)
> + *
> + * Results in the following valid placements:
> + * CS[0], CS[1]
> + *
> + * Example 2 pseudo code:
> + * CS[X] =3D generic engine of same class, logical instance X
> + * INVALID =3D I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVALID_NONE
> + * set_engines(INVALID)
> + * set_parallel(engine_index=3D0, width=3D2, num_siblings=3D2,
> + *             engines=3DCS[0],CS[2],CS[1],CS[3], flags=3DI915_PARALLEL_=
IMPLICT_BONDS)
> + *
> + * Results in the following valid placements:
> + * CS[0], CS[1]
> + * CS[2], CS[3]
> + *
> + * This can also be though of as 2 virtual engines:
> + * VE[0] =3D CS[0], CS[2]
> + * VE[1] =3D CS[1], CS[3]
> + *
> + * This enables a use case where all engines are not equal and certain p=
lacement
> + * rules are required (i.e. split-frame requires all contexts to be plac=
ed in a
> + * logically contiguous order on the VCS engines on gen11+ platforms). T=
his use
> + * case (logically contiguous placement, within a single engine class) i=
s
> + * supported when using GuC submission. Execlist mode could support all =
possible
> + * bonding configurations but currently doesn't support this extension.
> + */
> +#define I915_PARALLEL_IMPLICT_BONDS                    (1<<0)
> +/*
> + * Do not allow BBs to be preempted mid BB rather insert coordinated pre=
emption
> + * points on all hardware contexts between each set of BBs. An example u=
se case
> + * of this feature is split-frame on gen11+ hardware. When using this fe=
ature a
> + * BB must be submitted on each hardware context in the parallel gem con=
text.
> + * The execbuf2 IOCTL enforces the user adheres to policy.
> + */
> +#define I915_PARALLEL_NO_PREEMPT_MID_BATCH             (1<<1)
> +#define __I915_PARALLEL_UNKNOWN_FLAGS  (-(I915_PARALLEL_NO_PREEMPT_MID_B=
ATCH << 1))
> +       __u64 flags;            /* all undefined flags must be zero */
> +       __u64 mbz64[3];         /* reserved for future use; must be zero =
*/
> +
> +       /*
> +        * width (i) * num_siblings (j) in length
> +        * index =3D j + i * num_siblings
> +        */
> +       struct i915_engine_class_instance engines[0];
> +} __attribute__ ((packed));
> +
> diff --git a/Documentation/gpu/rfc/i915_scheduler.rst b/Documentation/gpu=
/rfc/i915_scheduler.rst
> index 7faa46cde088..64c539486ee4 100644
> --- a/Documentation/gpu/rfc/i915_scheduler.rst
> +++ b/Documentation/gpu/rfc/i915_scheduler.rst
> @@ -82,4 +82,55 @@ https://spec.oneapi.com/level-zero/latest/core/api.htm=
l#ze-command-queue-priorit
>
>  New parallel submission uAPI
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> -Details to come in a following patch.
> +The existing bonding uAPI is completely broken with GuC submission becau=
se
> +whether a submission is a single context submit or parallel submit isn't=
 known
> +until execbuf time activated via the I915_SUBMIT_FENCE. To submit multip=
le
> +contexts in parallel with the GuC the context must be explictly register=
ed with

explicitly

> +N contexts and all N contexts must be submitted in a single command to t=
he GuC.
> +These interfaces doesn't support dynamically changing between N contexts=
 as the

"this interface" or "don't support", I'm not sure what "these" refers to...

"changing" what? maybe "swapping"?

> +bonding uAPI does. Hence the need for a new parallel submission interfac=
e. Also
> +the legacy bonding uAPI is quite confusing and not intuitive at all.
> +
> +The new parallel submission uAPI consists of 3 parts:
> +
> +* Export engines logical mapping
> +* A 'set_parallel' extension to configure contexts for parallel
> +  submission
> +* Extend execbuf2 IOCTL to support submitting N BBs in a single IOCTL
> +
> +Export engines logical mapping
> +------------------------------
> +Certain use cases require BBs to be placed on engine instances in logica=
l order
> +(e.g. split-frame on gen11+). The logical mapping of engine instances ca=
n change
> +based on fusing. Rather than making UMDs be aware of fusing, simply expo=
se the
> +logical mapping with the existing query engine info IOCTL. Also the GuC
> +submission interface currently only supports submitting multiple context=
s to
> +engines in logical order which is a new requirement compared to execlist=
s.
> +Lastly, all current platforms have at most 2 instances and the logical o=
rder is

2 instances of what?

> +the same a uABI order. This will change on platforms with more than 2 in=
stances.

probably s/a uABI/as uAPI/ (note: 2 typos)

> +
> +A single bit will be added to drm_i915_engine_info.flags indicating that=
 the
> +logical instance has been returned and a new field,
> +drm_i915_engine_info.logical_instance, returns the logical instance.
> +
> +A 'set_parallel' extension to configure contexts for parallel submission
> +------------------------------------------------------------------------
> +The 'set_parallel' extension configures a slot for parallel submission o=
f N BBs.
> +It is setup step that should be called before using any of the contexts.=
 See
> +I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE or I915_CONTEXT_ENGINES_EXT_BOND f=
or
> +similar existing examples. Once a slot is configured for parallel submis=
sion the
> +execbuf2 IOCTL can be called submiting N BBs in a single IOCTL. Initiall=
y only

submitting

> +support GuC submission. Execlist support can be added later if needed.
> +
> +Add I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT and
> +i915_context_engines_parallel_submit to the uAPI to implement this exten=
sion.
> +
> +Extend execbuf2 IOCTL to support submitting N BBs in a single IOCTL
> +-------------------------------------------------------------------
> +Contexts that have been configured with the 'set_parallel' extension are=
 allowed
> +to submit N BBs in a single execbuf2 IOCTL. The BBs are either the last =
N
> +objects in the drm_i915_gem_exec_object2 list or the first N if
> +I915_EXEC_BATCH_FIRST is set. The number of BBs is implict based on the =
slot
> +submitted and how it has been configured by 'set_parallel' or other exte=
nsions.
> +No uAPI changes in the execbuf IOCTL but worth mentioning the new behavi=
or of
> +the IOCTL.

worth mentioning where? :)

> --
> 2.28.0
