Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDCB3627B8
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 20:29:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 301E86E0D9;
	Fri, 16 Apr 2021 18:29:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F063E6E0D9
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 18:29:28 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id i81so28776467oif.6
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 11:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:date:message-id:in-reply-to:references:user-agent
 :subject:mime-version;
 bh=9jHfRWcvzqD26Kz7IhbTFcrDGlqsShTa4hCU+jIWQMc=;
 b=Ko4pZsZQButOOERjOrOB0pu5samCSMYD3hFBygPh7CF4YvLZdiKaN8JonCvm1ketD5
 Jzmdd1hWNGu3P6wifFwcn/MTOlKhjE8vCzGTxMvU4BfOEYNaovlJuuq6YXevH0TKFs+C
 5SMr98Z21K41WKr/80yFbio/SvRGnuOLETN4gNVqNgjpH4SGA92uEJgVe3UxA3mj5/7a
 8eLHR+cMe0XoYxK4QREfmHV7sCqQ4coHpPmIr9xxo8MeB1a+xqI1gK3IHYy7en2ft2x1
 wvp+CQaWCv1IrbICGgTcrNMPkMWrS2V82gHFv7ZxM1+k9iKB9xT7GaMawJ/OjmiQc7fW
 8aHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
 :references:user-agent:subject:mime-version;
 bh=9jHfRWcvzqD26Kz7IhbTFcrDGlqsShTa4hCU+jIWQMc=;
 b=sljjdxks0lCjvFSby1VzhtmOWrt6s55/AmYtIDzbtYnpT3nZ8ttOfz543YeOCEjyAX
 fjCwEYp3rO89XKg5FO30BDMQ02DBdj3VSFcHHcntK2CMfTugq0oLDxuEnxgyqQomVotX
 JVjGc11fTBfJP+/P0Owsu4D47AOVK0fPebrQsEth32QOuZ5966jg2nzZK0qHjiWjyJCZ
 UK09VCZhBFnzlug8WLK1Y0BZftCuEkElSYKEifk5B/UsZNFSL115MCpyOYG0t2ybqRw9
 Ob8WQdVKnfcUoN76SGTtsY8vBytwfC2ApgRpwdJs0TrES5WEvG5nbGV5Q2dl6ZeD8qIV
 vNpQ==
X-Gm-Message-State: AOAM532vQHLCw3hPjxLQBA2Q1RUuJNdD9V1g8bJEF+p/Meh/IWAsWwru
 IYnlff/e286VegUO9WKas2P1fg==
X-Google-Smtp-Source: ABdhPJwo4vSWdmf9DFUFpXjpcQeRVjlv6elBw9BunLMXru9HiGswVuqmaeFISjCpOXeU2ahb1ukZ1w==
X-Received: by 2002:aca:5ad6:: with SMTP id o205mr7678058oib.128.1618597768100; 
 Fri, 16 Apr 2021 11:29:28 -0700 (PDT)
Received: from [100.68.194.111] ([209.107.186.33])
 by smtp.gmail.com with ESMTPSA id j142sm1586561oih.33.2021.04.16.11.29.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 16 Apr 2021 11:29:27 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: Matthew Auld <matthew.auld@intel.com>, <intel-gfx@lists.freedesktop.org>
Date: Fri, 16 Apr 2021 13:29:24 -0500
Message-ID: <178dbf1dba0.2817.c6988b7ea6112e3e892765a0d4287e0c@jlekstrand.net>
In-Reply-To: <20210416103718.460830-3-matthew.auld@intel.com>
References: <20210416103718.460830-1-matthew.auld@intel.com>
 <20210416103718.460830-3-matthew.auld@intel.com>
User-Agent: AquaMail/1.29.0-1784 (build: 102900003)
Subject: Re: [PATCH 3/4] drm/i915/uapi: convert i915_user_extension to kernel
 doc
MIME-Version: 1.0
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
Cc: Jordan Justen <jordan.l.justen@intel.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Kenneth Graunke <kenneth@whitecape.org>, mesa-dev@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: multipart/mixed; boundary="===============2010108415=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============2010108415==
Content-Type: multipart/alternative; boundary="178dbf1dd2935f82817dad1c52"

This is a multi-part message in MIME format.
--178dbf1dd2935f82817dad1c52
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

On April 16, 2021 05:37:52 Matthew Auld <matthew.auld@intel.com> wrote:

> Add some example usage for the extension chaining also, which is quite
> nifty.
>
> v2: (Daniel)
>  - clarify that the name is just some integer, also document that the
>    name space is not global
>
> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Jordan Justen <jordan.l.justen@intel.com>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Kenneth Graunke <kenneth@whitecape.org>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: mesa-dev@lists.freedesktop.org
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
> include/uapi/drm/i915_drm.h | 54 ++++++++++++++++++++++++++++++++++---
> 1 file changed, 50 insertions(+), 4 deletions(-)
>
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index 92da48e935d1..d79b51c12ff2 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -62,8 +62,8 @@ extern "C" {
> #define I915_ERROR_UEVENT "ERROR"
> #define I915_RESET_UEVENT "RESET"
>
> -/*
> - * i915_user_extension: Base class for defining a chain of extensions
> +/**
> + * struct i915_user_extension - Base class for defining a chain of extensions
>  *
>  * Many interfaces need to grow over time. In most cases we can simply
>  * extend the struct and have userspace pass in more data. Another option,
> @@ -76,12 +76,58 @@ extern "C" {
>  * increasing complexity, and for large parts of that interface to be
>  * entirely optional. The downside is more pointer chasing; chasing across
>  * the __user boundary with pointers encapsulated inside u64.
> + *
> + * Example chaining:
> + *
> + * .. code-block:: C
> + *
> + * struct i915_user_extension ext3 {
> + * .next_extension = 0, // end
> + * .name = ...,
> + * };
> + * struct i915_user_extension ext2 {
> + * .next_extension = (uintptr_t)&ext3,
> + * .name = ...,
> + * };
> + * struct i915_user_extension ext1 {
> + * .next_extension = (uintptr_t)&ext2,
> + * .name = ...,
> + * };
> + *
> + * Typically the i915_user_extension would be embedded in some uAPI 
> struct, and
> + * in this case we would feed it the head of the chain(i.e ext1), which would
> + * then apply all of the above extensions.
> + *
>  */
> struct i915_user_extension {
> + /**
> + * @next_extension:
> + *
> + * Pointer to the next struct i915_user_extension, or zero if the end.
> + */
>  __u64 next_extension;
> + /**
> + * @name: Name of the extension.
> + *
> + * Note that the name here is just some integer.
> + *
> + * Also note that the name space for this is not global for the whole
> + * driver, but rather its scope/meaning is limited to the specific piece
> + * of uAPI which has embedded the struct i915_user_extension.

We may want to rethink this decision. In Vulkan, we have several cases 
where we use the same extension multiple places.  Given that the only 
extensible thing currently landed is context creation, we still could make 
this global.  Then again, forcing us to go through the exercise of 
redefining every time has its advantages too.

In any case, this is a correct description of the current state of affairs, so

Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>


> + */
>  __u32 name;
> - __u32 flags; /* All undefined bits must be zero. */
> - __u32 rsvd[4]; /* Reserved for future use; must be zero. */
> + /**
> + * @flags: MBZ
> + *
> + * All undefined bits must be zero.
> + */
> + __u32 flags;
> + /**
> + * @rsvd: MBZ
> + *
> + * Reserved for future use; must be zero.
> + */
> + __u32 rsvd[4];
> };
>
> /*
> --
> 2.26.3


--178dbf1dd2935f82817dad1c52
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.=
w3.org/TR/html4/loose.dtd">
<html>
<body>
<div dir=3D"auto">
<div dir=3D"auto"><span style=3D"font-size: 12pt;">On April 16, 2021 05:37:=
52 Matthew Auld &lt;matthew.auld@intel.com&gt; wrote:</span></div><div id=
=3D"aqm-original" style=3D"color: black;">
<div><br></div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #808080; padding-left: 0.75ex;">
<div dir=3D"auto">Add some example usage for the extension chaining also, w=
hich is quite</div>
<div dir=3D"auto">nifty.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">v2: (Daniel)</div>
<div dir=3D"auto">&nbsp; - clarify that the name is just some integer, also=
 document that the</div>
<div dir=3D"auto">&nbsp; &nbsp; name space is not global</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Suggested-by: Daniel Vetter &lt;daniel@ffwll.ch&gt;</div>
<div dir=3D"auto">Signed-off-by: Matthew Auld &lt;matthew.auld@intel.com&gt=
;</div>
<div dir=3D"auto">Cc: Joonas Lahtinen &lt;joonas.lahtinen@linux.intel.com&g=
t;</div>
<div dir=3D"auto">Cc: Jordan Justen &lt;jordan.l.justen@intel.com&gt;</div>
<div dir=3D"auto">Cc: Daniel Vetter &lt;daniel.vetter@intel.com&gt;</div>
<div dir=3D"auto">Cc: Kenneth Graunke &lt;kenneth@whitecape.org&gt;</div>
<div dir=3D"auto">Cc: Jason Ekstrand &lt;jason@jlekstrand.net&gt;</div>
<div dir=3D"auto">Cc: Dave Airlie &lt;airlied@gmail.com&gt;</div>
<div dir=3D"auto">Cc: dri-devel@lists.freedesktop.org</div>
<div dir=3D"auto">Cc: mesa-dev@lists.freedesktop.org</div>
<div dir=3D"auto">Reviewed-by: Daniel Vetter &lt;daniel.vetter@ffwll.ch&gt;=
</div>
<div dir=3D"auto">---</div>
<div dir=3D"auto">&nbsp;include/uapi/drm/i915_drm.h | 54 ++++++++++++++++++=
++++++++++++++++---</div>
<div dir=3D"auto">&nbsp;1 file changed, 50 insertions(+), 4 deletions(-)</d=
iv>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/d=
rm/i915_drm.h</div>
<div dir=3D"auto">index 92da48e935d1..d79b51c12ff2 100644</div>
<div dir=3D"auto">--- a/include/uapi/drm/i915_drm.h</div>
<div dir=3D"auto">+++ b/include/uapi/drm/i915_drm.h</div>
<div dir=3D"auto">@@ -62,8 +62,8 @@ extern "C" {</div>
<div dir=3D"auto">&nbsp;#define I915_ERROR_UEVENT=09=09"ERROR"</div>
<div dir=3D"auto">&nbsp;#define I915_RESET_UEVENT=09=09"RESET"</div>
<div dir=3D"auto">&nbsp;</div>
<div dir=3D"auto">-/*</div>
<div dir=3D"auto">- * i915_user_extension: Base class for defining a chain =
of extensions</div>
<div dir=3D"auto">+/**</div>
<div dir=3D"auto">+ * struct i915_user_extension - Base class for defining =
a chain of extensions</div>
<div dir=3D"auto">&nbsp; *</div>
<div dir=3D"auto">&nbsp; * Many interfaces need to grow over time. In most =
cases we can simply</div>
<div dir=3D"auto">&nbsp; * extend the struct and have userspace pass in mor=
e data. Another option,</div>
<div dir=3D"auto">@@ -76,12 +76,58 @@ extern "C" {</div>
<div dir=3D"auto">&nbsp; * increasing complexity, and for large parts of th=
at interface to be</div>
<div dir=3D"auto">&nbsp; * entirely optional. The downside is more pointer =
chasing; chasing across</div>
<div dir=3D"auto">&nbsp; * the __user boundary with pointers encapsulated i=
nside u64.</div>
<div dir=3D"auto">+ *</div>
<div dir=3D"auto">+ * Example chaining:</div>
<div dir=3D"auto">+ *</div>
<div dir=3D"auto">+ * .. code-block:: C</div>
<div dir=3D"auto">+ *</div>
<div dir=3D"auto">+ *=09struct i915_user_extension ext3 {</div>
<div dir=3D"auto">+ *=09=09.next_extension =3D 0, // end</div>
<div dir=3D"auto">+ *=09=09.name =3D ...,</div>
<div dir=3D"auto">+ *=09};</div>
<div dir=3D"auto">+ *=09struct i915_user_extension ext2 {</div>
<div dir=3D"auto">+ *=09=09.next_extension =3D (uintptr_t)&amp;ext3,</div>
<div dir=3D"auto">+ *=09=09.name =3D ...,</div>
<div dir=3D"auto">+ *=09};</div>
<div dir=3D"auto">+ *=09struct i915_user_extension ext1 {</div>
<div dir=3D"auto">+ *=09=09.next_extension =3D (uintptr_t)&amp;ext2,</div>
<div dir=3D"auto">+ *=09=09.name =3D ...,</div>
<div dir=3D"auto">+ *=09};</div>
<div dir=3D"auto">+ *</div>
<div dir=3D"auto">+ * Typically the i915_user_extension would be embedded i=
n some uAPI struct, and</div>
<div dir=3D"auto">+ * in this case we would feed it the head of the chain(i=
.e ext1), which would</div>
<div dir=3D"auto">+ * then apply all of the above extensions.</div>
<div dir=3D"auto">+ *</div>
<div dir=3D"auto">&nbsp; */</div>
<div dir=3D"auto">&nbsp;struct i915_user_extension {</div>
<div dir=3D"auto">+=09/**</div>
<div dir=3D"auto">+=09 * @next_extension:</div>
<div dir=3D"auto">+=09 *</div>
<div dir=3D"auto">+=09 * Pointer to the next struct i915_user_extension, or=
 zero if the end.</div>
<div dir=3D"auto">+=09 */</div>
<div dir=3D"auto">&nbsp;=09__u64 next_extension;</div>
<div dir=3D"auto">+=09/**</div>
<div dir=3D"auto">+=09 * @name: Name of the extension.</div>
<div dir=3D"auto">+=09 *</div>
<div dir=3D"auto">+=09 * Note that the name here is just some integer.</div=
>
<div dir=3D"auto">+=09 *</div>
<div dir=3D"auto">+=09 * Also note that the name space for this is not glob=
al for the whole</div>
<div dir=3D"auto">+=09 * driver, but rather its scope/meaning is limited to=
 the specific piece</div>
<div dir=3D"auto">+=09 * of uAPI which has embedded the struct i915_user_ex=
tension.</div></blockquote></div><div dir=3D"auto"><br></div><div dir=3D"au=
to">We may want to rethink this decision. In Vulkan, we have several cases =
where we use the same extension multiple places.&nbsp; Given that the only =
extensible thing currently landed is context creation, we still could make =
this global.&nbsp; Then again, forcing us to go through the exercise of red=
efining every time has its advantages too.</div><div dir=3D"auto"><br></div=
><div dir=3D"auto">In any case, this is a correct description of the curren=
t state of affairs, so</div><div dir=3D"auto"><br></div><div dir=3D"auto">R=
eviewed-by: Jason Ekstrand &lt;jason@jlekstrand.net&gt;</div><div dir=3D"au=
to"><br></div><div dir=3D"auto"><br></div><div id=3D"aqm-original" style=3D=
"color: black;" dir=3D"auto"><blockquote type=3D"cite" class=3D"gmail_quote=
" style=3D"margin: 0 0 0 0.75ex; border-left: 1px solid #808080; padding-le=
ft: 0.75ex;"><div dir=3D"auto"></div>
<div dir=3D"auto">+=09 */</div>
<div dir=3D"auto">&nbsp;=09__u32 name;</div>
<div dir=3D"auto">-=09__u32 flags; /* All undefined bits must be zero. */</=
div>
<div dir=3D"auto">-=09__u32 rsvd[4]; /* Reserved for future use; must be ze=
ro. */</div>
<div dir=3D"auto">+=09/**</div>
<div dir=3D"auto">+=09 * @flags: MBZ</div>
<div dir=3D"auto">+=09 *</div>
<div dir=3D"auto">+=09 * All undefined bits must be zero.</div>
<div dir=3D"auto">+=09 */</div>
<div dir=3D"auto">+=09__u32 flags;</div>
<div dir=3D"auto">+=09/**</div>
<div dir=3D"auto">+=09 * @rsvd: MBZ</div>
<div dir=3D"auto">+=09 *</div>
<div dir=3D"auto">+=09 * Reserved for future use; must be zero.</div>
<div dir=3D"auto">+=09 */</div>
<div dir=3D"auto">+=09__u32 rsvd[4];</div>
<div dir=3D"auto">&nbsp;};</div>
<div dir=3D"auto">&nbsp;</div>
<div dir=3D"auto">&nbsp;/*</div>
<div dir=3D"auto">--&nbsp;</div>
<div dir=3D"auto">2.26.3</div>
</blockquote>
</div><div dir=3D"auto"><br></div>
</div></body>
</html>

--178dbf1dd2935f82817dad1c52--


--===============2010108415==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2010108415==--

