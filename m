Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A23CBBEB1
	for <lists+dri-devel@lfdr.de>; Sun, 14 Dec 2025 19:25:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F9D410E086;
	Sun, 14 Dec 2025 18:25:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VfFCG1/v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com
 [74.125.224.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52EFD10E086
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Dec 2025 18:25:01 +0000 (UTC)
Received: by mail-yx1-f52.google.com with SMTP id
 956f58d0204a3-6442e2dd8bbso3408582d50.0
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Dec 2025 10:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765736700; x=1766341500; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TuAQPLUSZ3+VSUKeXDxPvsUvNNE1ZJMqRxyNlR1GlTY=;
 b=VfFCG1/viwlktzwtoutH/oxHc85gRnvnAeX3bMg8VRlfdWBs2L2U/1JP0svN2QRLer
 HEO5wtxUdn+bHJ3ScrSFeJCS8uWIgHAq51CTIKEoNEPzjO3Bfrr0jFzMiup/H3OVdfw6
 noTchFP7fqsdoOcfON3kJioCuMhB2WXX5P+Tg8ph7yAo3cnX5DQ2GvDi55lCEKfnxpx3
 Wz0ZccyzOaDAzPyg+BS6lEc249X42qhXc0plpjJzAUt4sidgDbMcgZxfHMaaX0foBCIT
 fHlH9Jo2hqVMJg5oLIykAn9K8up7UnEG3i0Z5KhAYfaj2/vIuRGH19UT8MR1GlUNOAfw
 a1XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765736700; x=1766341500;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TuAQPLUSZ3+VSUKeXDxPvsUvNNE1ZJMqRxyNlR1GlTY=;
 b=h5mEXV1TbcwH8XXPV0qSTMt7Jpg97zK0n6O7N4rpq6dvX6ryo+590r7NAcYpV3P0hl
 NXmbl6Bk1DpzP6rWiKualILW1Z5uoJoO/Dpz9hxXjCGUMmJ9ruNgx/b+DpLZqH3h3Nke
 TKRHe7s/ZWYjv/juls1INTlDknGLhx27l9UsMXYxQRyy9muyRu8FwgE5tgji5C4zJ2L6
 RjeiPzIETnWUDJklRDJxrP/X9zHceR2VyvhQJU8fimXspquWLv9ytV8SpS9pPbX1tF6Q
 xkfkL35cdn4ikNZQOeRZJAXf4w/4TAtkSmKTv/QnFd1AxYgtq0YBmsFuNxDBfQpi6PWP
 v6pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjmvRc98GXOCnQ/uWKE3+q0xLIIZGoHY3qydsywiDD0LDY6U7hH4B8IAfvP/yJ/LVGbdFR/DTJT+U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYmlqmb7CuEtgqA9/a/C/wZ0McjYD7dMFy2w/WFhWrFO+YKpLk
 bOJQv/4J7WbIaKAFvOSLaq87Jiop0WlqPxue5bjhqbdzk5XBNOfKtJZdIFkVLNGKmEy6n4R45Ka
 KPgLgELC2n+gQPjNjj7LllKswBOhTihBaFDeWeznnCA==
X-Gm-Gg: AY/fxX6LePyFEA2v7Ll57M2+dQQgtR+SbziyXe0lBJe/6d0o2PXl2c0SnzkiUGFRLNS
 j66iz9EYQjg1VF6WHHt1u/V+jY1SrUn4D7Ne2+XNGrQKyn1wUd1VhGRtqsUCRBQTm+tm6mP0NH7
 MSvmpYdMSkkTs+2tWsC7s4tv8ZH8TaDT7/tm+HTcAIS5ZxVqimgSk4sXVUd0BAgk1hiYjS8NDrq
 Hh8H9sOGRMkKn34g6WOcFgjZ7/Y6EJzLl73kxt7Khpobj1SYTGwFcUHVIdaPlwCD72NKJy0hlrz
 977Asw==
X-Google-Smtp-Source: AGHT+IF/A/NCCXYbr4rTXKqs1aT87DG/QcCSsU5m5Juc/qR3uYYgnUberRojjzO8dxfqmF1ZnxBYio1mcpyV6dcIfGw=
X-Received: by 2002:a05:690e:1187:b0:63f:31f7:b956 with SMTP id
 956f58d0204a3-645555e8e2cmr6427288d50.27.1765736700223; Sun, 14 Dec 2025
 10:25:00 -0800 (PST)
MIME-Version: 1.0
References: <20251118201842.1447666-1-jim.cromie@gmail.com>
 <76038c97-39ca-4672-adc0-4e8fe0e39fc8@akamai.com>
 <CAJfuBxxFWD0rEjm-va+Bjmf-m2nfOD_+ZEqKy22WX6QdugQCUw@mail.gmail.com>
 <5b3d492c-7037-45a5-a001-0064f14d5f81@akamai.com>
In-Reply-To: <5b3d492c-7037-45a5-a001-0064f14d5f81@akamai.com>
From: jim.cromie@gmail.com
Date: Mon, 15 Dec 2025 07:24:34 +1300
X-Gm-Features: AQt7F2qR7epCcPZPFyfS31ZMn7q415nXmBzUWk-f7hwRotzggU7ovP6q9koFi7U
Message-ID: <CAJfuBxzW6TMmdS74ZPfPSe1w6S=oO17WYZc-Jgn_et=-Muw05A@mail.gmail.com>
Subject: Re: [PATCH v6 00/31] drm/dyndbg: Fix dynamic debug classmap regression
To: Jason Baron <jbaron@akamai.com>, git@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

for some reason I cannot grasp,
git am fails to process this mbox.

It entirely misses 13/31,
then fails to apply 14, which needs 13

Im able to cherry-pick 13,
but then I cannot --continue with 14,
even after bumping .git/rebase-apply/next (iirc)

jimc@frodo:~/projects/lx/linux.git$ git am --empty=3Ddrop
~/Downloads/PATCH-v6-00-31-drm-dyndbg-Fix-dynamic-debug-classmap-regression=
.mbox
Skipping: drm/dyndbg: Fix dynamic debug classmap regression
Applying: dyndbg: factor ddebug_match_desc out from ddebug_change
Applying: dyndbg: add stub macro for DECLARE_DYNDBG_CLASSMAP
Applying: docs/dyndbg: update examples \012 to \n
Applying: test-dyndbg: fixup CLASSMAP usage error
Applying: dyndbg: reword "class unknown," to "class:_UNKNOWN_"
Applying: docs/dyndbg: explain flags parse 1st
Applying: dyndbg: make ddebug_class_param union members same size
Applying: dyndbg: drop NUM_TYPE_ARRAY
Applying: dyndbg: tweak pr_fmt to avoid expansion conflicts
Applying: dyndbg: reduce verbose/debug clutter
Applying: dyndbg: refactor param_set_dyndbg_classes and below
Applying: dyndbg: tighten fn-sig of ddebug_apply_class_bitmap
Applying: dyndbg: macrofy a 2-index for-loop pattern
error: patch failed: lib/dynamic_debug.c:155
error: lib/dynamic_debug.c: patch does not apply
Patch failed at 0014 dyndbg: macrofy a 2-index for-loop pattern
hint: Use 'git am --show-current-patch=3Ddiff' to see the failed patch
hint: When you have resolved this problem, run "git am --continue".
hint: If you prefer to skip this patch, run "git am --skip" instead.
hint: To restore the original branch and stop patching, run "git am --abort=
".
hint: Disable this message with "git config set advice.mergeConflict false"
jimc@frodo:~/projects/lx/linux.git$ git help am

IOW 1st below fails cuz 2nd was missed.

9d3217b82474 dyndbg: macrofy a 2-index for-loop pattern
0181185c3e75 dyndbg: replace classmap list with a vector
ef6ee2b321ce dyndbg: tighten fn-sig of ddebug_apply_class_bitmap
804e6a0d59b6 dyndbg: refactor param_set_dyndbg_classes and below
039806bc83dd dyndbg: reduce verbose/debug clutter
162a0398fae9 dyndbg: tweak pr_fmt to avoid expansion conflicts
d5524fc1ef31 dyndbg: drop NUM_TYPE_ARRAY
a6e1e7f4da90 dyndbg: make ddebug_class_param union members same size
a1d3e32dd906 dyndbg: reword "class unknown," to "class:_UNKNOWN_"
5692e955f0ce test-dyndbg: fixup CLASSMAP usage error
3ee7e303e78e docs/dyndbg: explain flags parse 1st
2f33390837fb docs/dyndbg: update examples \012 to \n
256317aa5996 dyndbg: add stub macro for DECLARE_DYNDBG_CLASSMAP
37bad039f6c7 dyndbg: factor ddebug_match_desc out from ddebug_change
7d0a66e4bb90 (tag: v6.18, master) Linux 6.18

On Sat, Dec 13, 2025 at 4:57=E2=80=AFAM Jason Baron <jbaron@akamai.com> wro=
te:
>
>
>
> On 12/10/25 4:12 PM, jim.cromie@gmail.com wrote:
> > !-------------------------------------------------------------------|
> >    This Message Is From an External Sender
> >    This message came from outside your organization.
> > |-------------------------------------------------------------------!
> >
> > On Thu, Dec 11, 2025 at 8:09=E2=80=AFAM Jason Baron <jbaron@akamai.com>=
 wrote:
> >>
> >>
> >>
> >> On 11/18/25 3:18 PM, Jim Cromie wrote:
> >>> !-------------------------------------------------------------------|
> >>>     This Message Is From an External Sender
> >>>     This message came from outside your organization.
> >>> |-------------------------------------------------------------------!
> >>>
> >>> hello all,
> >>>
> >>> commit aad0214f3026 ("dyndbg: add DECLARE_DYNDBG_CLASSMAP macro")
> >>>
> >>> added dyndbg's "classmaps" feature, which brought dyndbg's 0-off-cost
> >>> debug to DRM.  Dyndbg wired to /sys/module/drm/parameters/debug,
> >>> mapped its bits to classes named "DRM_UT_*", and effected the callsit=
e
> >>> enablements only on updates to the sys-node (and underlying >control)=
.
> >>>
> >>> Sadly, it hit a CI failure, resulting in:
> >>> commit bb2ff6c27bc9 ("drm: Disable dynamic debug as broken")
> >>>
> >>> The regression was that drivers, when modprobed, did not get the
> >>> drm.debug=3D0xff turn-on action, because that had already been done f=
or
> >>> drm.ko itself.
> >>>
> >>> The core design bug is in the DECLARE_DYNDBG_CLASSMAP macro.  Its use
> >>> in both drm.ko (ie core) and all drivers.ko meant that they couldn't
> >>> fundamentally distinguish their respective roles.  They each
> >>> "re-defined" the classmap separately, breaking K&R-101.
> >>>
> >>> My ad-hoc test scripting helped to hide the error from me, by 1st
> >>> testing various combos of boot-time module.dyndbg=3D... and
> >>> drm.debug=3D... configurations, and then inadvertently relying upon
> >>> those initializations.
> >>>
> >>> This series addresses both failings:
> >>>
> >>> It replaces DECLARE_DYNDBG_CLASSMAP with
> >>>
> >>> - `DYNAMIC_DEBUG_CLASSMAP_DEFINE`: Used by core modules (e.g.,
> >>>     `drm.ko`) to define their classmaps.  Based upon DECLARE, it expo=
rts
> >>>     the classmap so USE can use it.
> >>>
> >>> - `DYNAMIC_DEBUG_CLASSMAP_USE`: this lets other "subsystem" users
> >>>     create a linkage to the classmap defined elsewhere (ie drm.ko).
> >>>     These users can then find their "parent" and apply its settings.
> >>>
> >>> It adds a selftest script, and a 2nd "sub-module" to recapitulate
> >>> DRM's multi-module "subsystem" use-case, including the specific
> >>> failure scenario.
> >>>
> >>> It also adds minor parsing enhancements, allowing easier construction
> >>> of multi-part debug configurations.  These enhancements are used to
> >>> test classmaps in particular, but are not otherwize required.
> >>>
> >>> Thank you for your review.
> >>>
> >>> P.S. Id also like to "tease" some other work:
> >>>
> >>> 1. patchset to send pr_debugs to tracefs on +T flag
> >>>
> >>>      allows 63 "private" tracebufs, 1 "common" one (at 0)
> >>>      "drm.debug_2trace=3D0x1ff" is possible
> >>>      from Lukas Bartoski
> >>>
> >>> 2. patchset to save 40% of DATA_DATA footprint
> >>>
> >>>      move (modname,filename,function) to struct _ddebug_site
> >>>      save their descriptor intervals to 3 maple-trees
> >>>      3 accessors fetch on descriptor, from trees
> >>>      move __dyndbg_sites __section to INIT_DATA
> >>>
> >>> 3. patchset to cache dynamic-prefixes
> >>>      should hide 2.s cost increase.
> >>>
> >>>
> >>
> >> Hi Jim,
> >>
> >> I just wanted to confirm my understanding that the class names here ar=
e
> >> 'global'. That is if say two different modules both used say the name
> >> "core" in their DYNAMIC_DEBUG_CLASSMAP_DEFINE() name array, then if th=
e
> >> user did: echo "class core +p > control", then that would enable all t=
he
> >> sites that had the class name "core" in both modules. One could add th=
e
> >> "module" modifier to the request if needed.
> >>
> >> One could prepend the module name to the class names to make them uniq=
ue
> >> but it's not much different from adding a separate 'module blah' in th=
e
> >> request. So probably fine as is, but maybe worth calling out in the do=
cs
> >> a bit?
> >>
> >
> > Yes. that is correct. class CORE is global.
> > If 2 different DEFINE()s give that classname,
> > the defining modules will both respond to `class CORE +p > control`
> > but they will get independent int values (which could be the same, but
> > dont have to be)
> >
> > DRM is our case in point.
> > I reused DRM_UT_CORE...
> > because I didnt have a good reason to change it
> > that said, Daniel Vetter noted that the _UT_ part doesnt have a real re=
ason.
> > So theres some space for a discussion, when I resend that patchset.
> >
> > `module drm class DRM_UT_CORE +p > control`
> > will narrow the query and avoid all the drivers/helpers,
> > which could be what someone wants.
> > class DRM_UT_CORE would select drivers and helpers too,
> > so the DRM_UT_  disambiguation is appropriate.
> >
> > I'll reread the docs to see if theres a bit more I can add to further
> > explain this.
> > Do you have any suggestions for wording to achieve this ?
> >
>
>
> Ok, so sounds like DRM_ prefix is already adding some scoping vs. just
> the simple 'CORE' name. So maybe just something like:
>
> Note that class names exist in a 'global' namespace. Thus, if two
> different modules share a common class name such as 'core' both modules
> will have sites enabled via: echo 'class core +p > control'. Thus, you
> may wish to scope any new class names to a specific use-case or module.
> For example, drm uses the 'DRM_' prefix, as in 'DRM_CORE'.
>
> Thanks,
>
> -Jason
