Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1974E9F88
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 21:08:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB7F710ED1E;
	Mon, 28 Mar 2022 19:08:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com
 [IPv6:2607:f8b0:4864:20::92e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0E3010E966;
 Mon, 28 Mar 2022 19:07:55 +0000 (UTC)
Received: by mail-ua1-x92e.google.com with SMTP id j20so362923uan.1;
 Mon, 28 Mar 2022 12:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CCKplzUskEQ9PwRTyuFUMJADGXMGT+3wuQ0LIFqQJTA=;
 b=iVLFo3/Wbarqi1Gy59ZX3ni8OxRbwnW/akTYc6RfW1m8CgbjSSyNDMtRp1RVi7Tejz
 b8YQxZyK2jg/JAPh9AsJ0u4zLhoff1XDlf7NrWZEhJegte0LIdZ4IU6PC0WYwSjaHDjG
 RFgv7u7HdAtOW66kFkWDiyk0LYdF9Ihm9DpHuX+mloqKl0secFILqUdD6yRMndKNIzGN
 EFEJJBx6HsqPkivC5Zr9d/3RQqo6iWX2oenhxT7GQSq58SPUyBmNv6jwsg86dQzXeyE3
 A3TdXe+MnA71RRcWLkbZ3wp8uGAphDzGldReYbNgQVUH49wE9PBm9VkLo0ky5A2w1yNh
 1p9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CCKplzUskEQ9PwRTyuFUMJADGXMGT+3wuQ0LIFqQJTA=;
 b=PxW0umZHFyC2tNQLS7vYMYywuhPlOipIPm0bI5ezF/naYnezBP4IYk8wXiM8Uk/ZWi
 ec5V3ZYzgFjOXXozq3dS/U1PS/jS4ofJRZvS3XuN5lLDwH74AV4mSTjOd1jbA3w3XFz6
 Wsh0FfqdZdKpniygPAisr2qVztyMSpBqfqwpRwf2Ja+E9CX4eX5QLn2CjfFWkq6kpMpt
 7OZkdO0bPc6j7hagp2oswBrhBBBTyJMAyzZQJ/n8UT9Qg9f8ux6f0Sv3jKcq31VVzyc+
 jNywgomYTzC554wVKaML5wpnyCePcAtYXqzDhdvPijr6vE8fAuNbR2BpC8pJasbVoPqr
 I9aA==
X-Gm-Message-State: AOAM533ByzerHIBaVh5ncdvgaOTYpwdruIDxvvYoDuSgvITA/3YuDc06
 XRjoUiLYw44txbbAMzxBnS6sSe/L26Zzb+qptS0=
X-Google-Smtp-Source: ABdhPJyeB+4PzruoBESQc2VKSlA60X+ybn+mXU9Z41UctfcgMdS1JkVl9uLoW0REsYsj4gV+ulwXOYj02EGWedpRbnw=
X-Received: by 2002:ab0:4ac1:0:b0:351:ed7d:e65c with SMTP id
 t1-20020ab04ac1000000b00351ed7de65cmr12559304uae.36.1648494474130; Mon, 28
 Mar 2022 12:07:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220311044756.425777-1-jim.cromie@gmail.com>
 <20220311044756.425777-3-jim.cromie@gmail.com>
 <823e51e6-2af4-7854-9428-697a2af12488@akamai.com>
 <CAJfuBxxVti_pa1YPmas=Ub28yWUFFGeR13wxveLvPCYS61NxuA@mail.gmail.com>
 <0d00c529-3bac-f09f-e07c-584194251a06@akamai.com>
In-Reply-To: <0d00c529-3bac-f09f-e07c-584194251a06@akamai.com>
From: jim.cromie@gmail.com
Date: Mon, 28 Mar 2022 13:07:27 -0600
Message-ID: <CAJfuBxwxA-9EwBaEow2UTBXD5-iER03+f5=D1zCUjTUut_bQaw@mail.gmail.com>
Subject: Re: [PATCH 2/5] dyndbg: add class_id field and query support
To: Jason Baron <jbaron@akamai.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Greg KH <gregkh@linuxfoundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Joe Perches <joe@perches.com>,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 14, 2022 at 3:30 PM Jason Baron <jbaron@akamai.com> wrote:
>
>
>
> On 3/11/22 20:06, jim.cromie@gmail.com wrote:
> > On Fri, Mar 11, 2022 at 12:06 PM Jason Baron <jbaron@akamai.com> wrote:
> >>
> >>
> >>
> >> On 3/10/22 23:47, Jim Cromie wrote:
> >>>
> >>> With the patch, one can enable current/unclassed callsites by:
> >>>
> >>>   #> echo drm class 15 +p > /proc/dynamic_debug/control
> >>>
> >>
> >> To me, this is hard to read, what the heck is '15'? I have to go look it
> >> up in the control file and it's not descriptive. I think that using
> >> classes/categories makes sense but I'm wondering if it can be a bit more
> >> user friendly? Perhaps, we can pass an array of strings that is indexed
> >> by the class id to each pr_debug() site that wants to use class. So
> >> something like:

hi Jason,
Im now in basically full agreement with you

1.   .class_id  is a "global" space, in that all callsites have one.
2.    0-15 is an exceedingly small range for a global space

Fix that by
3. make it private (by removing "class N" parsing)
   now nobody can do
   echo module * class N +p >control

4. add private/per-module "string" -> class_id map
    each module will have to declare the class-strings they use/accept
    opt-in - want coordinated / shared names for DRM_UT_KMS etc.

5. validate input using the known class_string -> class_id

then, this is knowably right or wrong, depending on DRM_FOO:
     echo module drm class DRM_FOO +p > control

it also means that
     echo class DRM_UT_KMS +p >control
is both wellformed and minimal;
any module that has DRM_UT_KMS defined will know which class_id *they*
have mapped it to.
theres no global "DRM_UT_KMS" to be abused.

So Ive been working towards that..
Heres my current biggest roadblock

DEFINE_DYNAMIC_DEBUG_CLASSBITS
creates the class-strings[] array declaratively, at compile-time.
This array is attached to the kernel-param.args,
so it can be used by the callbacks (to construct the command)

But its not obviously available from outside the sysfs knob
that its attached to, as is needed to apply command >control generally.

If I can attach the class-strings[]  to struct ddebug_table,
then ddebug_change() can use it to validate >control input.

So, how to attach ?
its got to work for both builtin & loadable modules.
(which precludes something in struct module ?)

I looked for a kernel_param_register callback, came up empty.
Trying to add it feels invasive / imposing.


> >
> > If that works, its cuz DEFINE_DYNAMIC_DEBUG_CLASSBITS()
> > plucks class symbols out of its __VA_ARGS__, and #stringifes them.
> > So that macro could then build the 1-per-module static constant string array
> > and (only) the callbacks would be able to use it.
> >

So Ive been tinkering hard on this macro, since its pretty central to
the interface defn.
heres some choices:

this is what Ive been working towards.
using enum symbols directly like this associates them by grep,
in contrast, class-strings are mealy-mouthed, milquetoast.

DEFINE_DYNAMIC_DEBUG_CLASSBITS(debug, __drm_debug, "p",
        "enable drm.debug categories - 1 bit per category",
        DRM_UT_CORE,
        DRM_UT_DRIVER,
        DRM_UT_KMS,
        DRM_UT_PRIME,
        DRM_UT_ATOMIC,
        DRM_UT_VBL,
        DRM_UT_STATE,
        DRM_UT_LEASE,
        DRM_UT_DP,
        DRM_UT_DRMRES);

 I found a slick MAP ( ) macro to do this:

#define DEFINE_DYNAMIC_DEBUG_CLASSBITS(fsname, _var, _flgs, desc, ...) \
  MODULE_PARM_DESC(fsname, desc); \
  static struct dyndbg_classbits_param ddcats_##_var = { \
    .bits = &(_var), \
    .flags = _flgs, \
    .classes = { __VA_ARGS__, _DPRINTK_CLASS_DFLT }, \
    .class_names = { mgMAP(__stringify, sCOMMA, \
                                                __VA_ARGS__,
_DPRINTK_CLASS_DFLT) } \
}; \
module_param_cb(fsname, &param_ops_dyndbg_classbits, \
&ddcats_##_var, 0644)

 __VA_ARGS__   is used 2x
.class_names is available for validating command >control

As much as I like the above, the MAP macro has a longer, more risky
path to the kernel

so a more modest alternative: module user defines class-strings in interface,
but they *must* align manually with the enum values they correspond to;
the order determines the bit-pos in the sysfs node,
since the interface no longer provides the enum values themselves.

DEFINE_DYNAMIC_DEBUG_CLASS_STRINGS(debug, __drm_debug, "p",
        "enable drm.debug categories - 1 bit per category",
        "DRM_UT_CORE",
        "DRM_UT_DRIVER",
        "DRM_UT_KMS",

different name allows CLASSBITs or similar in future, if MAP works out.
class-strings are completely defined by users, drm can drop UT naming

TLDR: FWIW

iSTM that  the same macro will support the coordinated use of class-strings
across multiple modules.

drm_print.c - natural home for exposed sysfs node

amdgpu/, drm_helper/ i915/  nouveau/  will all need a DEFINE_DD added,
so that ddebug_change() can allow those .class_ids to be controlled.
sysfs perm inits can disable their nodes, since theyre coordinated.

> >
>
> Ok, yeah so I guess I'm thinking about the 'class' more as global namespace,
> so that for example, it could span modules, or be specific to certain modules.
> I'm also thinking of it as a 'string' which is maybe hierarchical, so that it's
> clear what sub-system, or sub-sub-system it belongs to. So for DRM for example,
> it could be a string like "DRM:CORE". The index num I think is still helpful for
> implementation so we don't have to store a pointer size, but I don't think it's
> really exposed (except perhaps in module params b/c drm is doing that already?).
>

So what Ive got here is as described above,
I just need a few bright ideas,
then I can bring it together.
got a spare tuit?

Jim
