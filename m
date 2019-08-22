Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 608CB99FDD
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 21:25:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E88046EA51;
	Thu, 22 Aug 2019 19:25:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BCB06EA51
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 19:25:06 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id s15so9601084edx.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 12:25:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fZkQJsq+n1RfedXQDBQyHKnZi1VbIPNeQKk02E606cM=;
 b=Ztw2qVeLdGD7K1wf0H6OjR2ttqgBwWVY6rom1kzOk81RD5qv+fK7vzXMerGc/7/aw9
 BjSlUTtGXMmTT4CVwzsrvqF7t8DAPMtEz9tbtSPT1B36f1k4jkRg2CFAvpTIDIzWaphY
 Y4eeCs2dTpFnXgHNdsy+e7BhRB8p2i/Mjthb02wrU8Z7zRCHZFD5p8YL5ZigstAHGXso
 uLpBpyogBRq1t8idw0+mhUD5HaUycAh6tpuRyaEXzwPOVAyLFJi3kaoIOEN8AD2c+EsU
 jLNB9N33GdLWEHmc4h5KaBJX4u7eoMl4B+x+jaOixx6PTdboyiMNE1HpWPrmH7jOcwek
 oUzQ==
X-Gm-Message-State: APjAAAXkRTxaV20tpBuV3lC/dzzKa52d29mULmU2XGK7fn9Mx2hZlKmv
 E4GnHTdNv0UTUyHEgbM1i93Q0cSUuXCjDAXWWtHPg5uLPBU=
X-Google-Smtp-Source: APXvYqzj7wj+betofAU2jlmCxOs7ylg1bb+GVPk/FDGmXekHL3upHIC80z0CL5J/VZrXP+nY+pLCl9+O4Y2e2ctle9Y=
X-Received: by 2002:aa7:c81a:: with SMTP id a26mr560038edt.26.1566501905056;
 Thu, 22 Aug 2019 12:25:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190822145503.24630-1-lionel.g.landwerlin@intel.com>
In-Reply-To: <20190822145503.24630-1-lionel.g.landwerlin@intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 22 Aug 2019 14:24:52 -0500
Message-ID: <CAOFGe96fLwPhmpuh8v2E7rcsrubxW6CA_sbU6yZOVdOQKSw9wQ@mail.gmail.com>
Subject: Re: [PATCH] drm/syncobj: Add documentation for timeline syncobj
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=fZkQJsq+n1RfedXQDBQyHKnZi1VbIPNeQKk02E606cM=;
 b=ixmz4G5cAa5MSHRlgm6ewCDeG6w1cqthL829s5oiVBTR2Ar8ctB4Vx4ZMc6jPmlusg
 uT6swTSiVqZuqbDyD3FFyOHn1cD5xcybQwMMReGn+mkSrmPSkljfTHjqB0qWYw9FfADU
 nklrHw34/MNgCEPxSnAGou7Af85uxVr4lIF/gAL1zSV7ml9UYeuDduqDDGMsCPF9oCqR
 Jqt4/jIZ11dIQV0WcXHd43+Ju/UIjranvwiPZyzRTImi1oLx9qbDkSmEMhpFrIeMFmwD
 4/AiNTFD/JRGP2W7/IGJUx8TWlMsuvIi4Zt96EPkT1vCu8JbiqCXU/qfLZoC0AZajtVD
 4PWg==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Christian Koenig <Christian.Koenig@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1118997530=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1118997530==
Content-Type: multipart/alternative; boundary="000000000000975c010590b9a5e7"

--000000000000975c010590b9a5e7
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 22, 2019 at 9:55 AM Lionel Landwerlin <
lionel.g.landwerlin@intel.com> wrote:

> We've added a set of new APIs to manipulate syncobjs holding timelines
> of dma_fence. This adds a bit of documentation about how this works.
>
> Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Cc: Christian Koenig <Christian.Koenig@amd.com>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Cc: David(ChunMing) Zhou <David1.Zhou@amd.com>
> ---
>  drivers/gpu/drm/drm_syncobj.c | 87 +++++++++++++++++++++++++++++------
>  1 file changed, 74 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index b5ad73330a48..32ffded6d2c0 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -43,27 +43,66 @@
>   *  - Signal a syncobj (set a trivially signaled fence)
>   *  - Wait for a syncobj's fence to appear and be signaled
>   *
> + * The syncobj userspace API also provides operations to manipulate a
> syncobj
> + * in terms of a timeline of struct &dma_fence rather than a single struct
> + * &dma_fence, through the following operations:
> + *
> + *   - Signal a given point on the timeline
> + *   - Wait for a given point to appear and/or be signaled
> + *   - Import and export from/to a given point of a timeline
> + *
>   * At it's core, a syncobj is simply a wrapper around a pointer to a
> struct
>   * &dma_fence which may be NULL.
>   * When a syncobj is first created, its pointer is either NULL or a
> pointer
>   * to an already signaled fence depending on whether the
>   * &DRM_SYNCOBJ_CREATE_SIGNALED flag is passed to
>   * &DRM_IOCTL_SYNCOBJ_CREATE.
> - * When GPU work which signals a syncobj is enqueued in a DRM driver,
> - * the syncobj fence is replaced with a fence which will be signaled by
> the
> - * completion of that work.
> - * When GPU work which waits on a syncobj is enqueued in a DRM driver, the
> - * driver retrieves syncobj's current fence at the time the work is
> enqueued
> - * waits on that fence before submitting the work to hardware.
> - * If the syncobj's fence is NULL, the enqueue operation is expected to
> fail.
> - * All manipulation of the syncobjs's fence happens in terms of the
> current
> - * fence at the time the ioctl is called by userspace regardless of
> whether
> - * that operation is an immediate host-side operation (signal or reset) or
> - * or an operation which is enqueued in some driver queue.
> - * &DRM_IOCTL_SYNCOBJ_RESET and &DRM_IOCTL_SYNCOBJ_SIGNAL can be used to
> - * manipulate a syncobj from the host by resetting its pointer to NULL or
> + *
> + * If the syncobj is considered as a binary (signal/unsignaled) primitive,
>

What does "considered as a binary" mean?  Is it an inherent property of the
syncobj given at create time?  Is it a state the syncobj can be in?  Or is
it a property of how the submit ioctl in the DRM driver references it?  I'm
really hoping it's either 1 or 3....


> + * when GPU work is enqueued in a DRM driver to signal the syncobj, the
> fence
> + * is replaced with a fence which will be signaled by the completion of
> that
> + * work.
> + * If the syncobj is considered as a timeline primitive, when GPU work is
> + * enqueued in a DRM driver to signal the a given point of the syncobj, a
> new
> + * struct &dma_fence_chain pointing to the DRM driver's fence and also
> + * pointing to the previous fence that was in the syncobj. The new struct
> + * &dma_fence_chain fence put into the syncobj will be signaled by
> completion
> + * of the DRM driver's work and also any work associated with the fence
> + * previously in the syncobj.
> + *
> + * When GPU work which waits on a syncobj is enqueued in a DRM driver, at
> the
> + * time the work is enqueued, it waits on the fence coming from the
> syncobj
> + * before submitting the work to hardware. That fence is either :
> + *
> + *    - The syncobj's current fence if the syncobj is considered as a
> binary
> + *      primitive.
> + *    - The struct &dma_fence associated with a given point if the
> syncobj is
> + *      considered as a timeline primitive.
> + *
> + * If the syncobj's fence is NULL or not present in the syncobj's
> timeline,
> + * the enqueue operation is expected to fail.
> + *
> + * With binary syncobj, all manipulation of the syncobjs's fence happens
> in
> + * terms of the current fence at the time the ioctl is called by userspace
> + * regardless of whether that operation is an immediate host-side
> operation
> + * (signal or reset) or or an operation which is enqueued in some driver
> + * queue. &DRM_IOCTL_SYNCOBJ_RESET and &DRM_IOCTL_SYNCOBJ_SIGNAL can be
> used
> + * to manipulate a syncobj from the host by resetting its pointer to NULL
> or
>   * setting its pointer to a fence which is already signaled.
>   *
> + * With timeline syncobj, all manipulation of the timeline fences happens
> in
> + * terms of the fence referred to in the timeline. See
> + * dma_fence_chain_find_seqno() to see how a given point is found in the
> + * timeline.
> + *
> + * Note that applications should be careful to always use timeline set of
> + * ioctl() when dealing with syncobj considered as timeline. Using a
> binary
> + * set of ioctl() with a syncobj considered as timeline could result
> incorrect
> + * synchronization. The use of binary syncobj is supported through the
> + * timeline set of ioctl() by using a point value of 0, this will
> reproduce
> + * the behavior of the binary set of ioctl() (for example replace the
> + * syncobj's fence when signaling).
>

I know I've asked this before but I feel compelled to ask it again.  Why do
we allow them to mix and match?  Why not just have a create flag and
enforce meaningful behavior?  I'm a bit concerned that userspace is going
to start relying on the subtlties of the interaction between timeline and
binary syncobjs which are neither documented nor properly tested in IGT.

+ *
>   *
>   * Host-side wait on syncobjs
>   * --------------------------
> @@ -87,6 +126,16 @@
>   * synchronize between the two.
>   * This requirement is inherited from the Vulkan fence API.
>   *
> + * Similarly, &DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT takes an array of syncobj
> + * handles as well as an array of u64 points and does a host-side wait on
> all
> + * of syncobj fences at the given points simultaneously.
> + *
> + * &DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT also adds the ability to wait for a
> given
> + * fence to materialize on the timeline without waiting for the fence to
> be
> + * signaled by using the &DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE flag. This
> + * requirement is inherited from the wait-before-signal behavior required
> by
> + * the Vulkan timeline semaphore API.
> + *
>   *
>   * Import/export of syncobjs
>   * -------------------------
> @@ -120,6 +169,18 @@
>   * Because sync files are immutable, resetting or signaling the syncobj
>   * will not affect any sync files whose fences have been imported into the
>   * syncobj.
> + *
> + *
> + * Import/export of timeline points in timeline syncobjs
> + * -----------------------------------------------------
> + *
> + * &DRM_IOCTL_SYNCOBJ_TRANSFER provides a mechanism to transfer a struct
> + * &dma_fence of at a given point from a timeline syncobj to another point
> + * into another timeline syncobj.
> + *
> + * Note that if you want to transfer a struct &dma_fence from a given
> point on
> + * a timeline syncobj from/into a binary syncobj, you can use the point 0
> to
> + * mean take/replace the fence in the syncobj.
>   */
>
>  #include <linux/anon_inodes.h>
> --
> 2.23.0
>
>

--000000000000975c010590b9a5e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, Aug 22, 2019 at 9:55 AM Lionel Landwerlin &lt;<a href=3D"mai=
lto:lionel.g.landwerlin@intel.com">lionel.g.landwerlin@intel.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">We&#39;ve a=
dded a set of new APIs to manipulate syncobjs holding timelines<br>
of dma_fence. This adds a bit of documentation about how this works.<br>
<br>
Signed-off-by: Lionel Landwerlin &lt;<a href=3D"mailto:lionel.g.landwerlin@=
intel.com" target=3D"_blank">lionel.g.landwerlin@intel.com</a>&gt;<br>
Cc: Christian Koenig &lt;<a href=3D"mailto:Christian.Koenig@amd.com" target=
=3D"_blank">Christian.Koenig@amd.com</a>&gt;<br>
Cc: Jason Ekstrand &lt;<a href=3D"mailto:jason@jlekstrand.net" target=3D"_b=
lank">jason@jlekstrand.net</a>&gt;<br>
Cc: David(ChunMing) Zhou &lt;<a href=3D"mailto:David1.Zhou@amd.com" target=
=3D"_blank">David1.Zhou@amd.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/drm_syncobj.c | 87 +++++++++++++++++++++++++++++-----=
-<br>
=C2=A01 file changed, 74 insertions(+), 13 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c<=
br>
index b5ad73330a48..32ffded6d2c0 100644<br>
--- a/drivers/gpu/drm/drm_syncobj.c<br>
+++ b/drivers/gpu/drm/drm_syncobj.c<br>
@@ -43,27 +43,66 @@<br>
=C2=A0 *=C2=A0 - Signal a syncobj (set a trivially signaled fence)<br>
=C2=A0 *=C2=A0 - Wait for a syncobj&#39;s fence to appear and be signaled<b=
r>
=C2=A0 *<br>
+ * The syncobj userspace API also provides operations to manipulate a sync=
obj<br>
+ * in terms of a timeline of struct &amp;dma_fence rather than a single st=
ruct<br>
+ * &amp;dma_fence, through the following operations:<br>
+ *<br>
+ *=C2=A0 =C2=A0- Signal a given point on the timeline<br>
+ *=C2=A0 =C2=A0- Wait for a given point to appear and/or be signaled<br>
+ *=C2=A0 =C2=A0- Import and export from/to a given point of a timeline<br>
+ *<br>
=C2=A0 * At it&#39;s core, a syncobj is simply a wrapper around a pointer t=
o a struct<br>
=C2=A0 * &amp;dma_fence which may be NULL.<br>
=C2=A0 * When a syncobj is first created, its pointer is either NULL or a p=
ointer<br>
=C2=A0 * to an already signaled fence depending on whether the<br>
=C2=A0 * &amp;DRM_SYNCOBJ_CREATE_SIGNALED flag is passed to<br>
=C2=A0 * &amp;DRM_IOCTL_SYNCOBJ_CREATE.<br>
- * When GPU work which signals a syncobj is enqueued in a DRM driver,<br>
- * the syncobj fence is replaced with a fence which will be signaled by th=
e<br>
- * completion of that work.<br>
- * When GPU work which waits on a syncobj is enqueued in a DRM driver, the=
<br>
- * driver retrieves syncobj&#39;s current fence at the time the work is en=
queued<br>
- * waits on that fence before submitting the work to hardware.<br>
- * If the syncobj&#39;s fence is NULL, the enqueue operation is expected t=
o fail.<br>
- * All manipulation of the syncobjs&#39;s fence happens in terms of the cu=
rrent<br>
- * fence at the time the ioctl is called by userspace regardless of whethe=
r<br>
- * that operation is an immediate host-side operation (signal or reset) or=
<br>
- * or an operation which is enqueued in some driver queue.<br>
- * &amp;DRM_IOCTL_SYNCOBJ_RESET and &amp;DRM_IOCTL_SYNCOBJ_SIGNAL can be u=
sed to<br>
- * manipulate a syncobj from the host by resetting its pointer to NULL or<=
br>
+ *<br>
+ * If the syncobj is considered as a binary (signal/unsignaled) primitive,=
<br></blockquote><div><br></div><div>What does &quot;considered as a binary=
&quot; mean?=C2=A0 Is it an inherent property of the syncobj given at creat=
e time?=C2=A0 Is it a state the syncobj can be in?=C2=A0 Or is it a propert=
y of how the submit ioctl in the DRM driver references it?=C2=A0 I&#39;m re=
ally hoping it&#39;s either 1 or 3....<br></div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
+ * when GPU work is enqueued in a DRM driver to signal the syncobj, the fe=
nce<br>
+ * is replaced with a fence which will be signaled by the completion of th=
at<br>
+ * work.<br>
+ * If the syncobj is considered as a timeline primitive, when GPU work is<=
br>
+ * enqueued in a DRM driver to signal the a given point of the syncobj, a =
new<br>
+ * struct &amp;dma_fence_chain pointing to the DRM driver&#39;s fence and =
also<br>
+ * pointing to the previous fence that was in the syncobj. The new struct<=
br>
+ * &amp;dma_fence_chain fence put into the syncobj will be signaled by com=
pletion<br>
+ * of the DRM driver&#39;s work and also any work associated with the fenc=
e<br>
+ * previously in the syncobj.<br>
+ *<br>
+ * When GPU work which waits on a syncobj is enqueued in a DRM driver, at =
the<br>
+ * time the work is enqueued, it waits on the fence coming from the syncob=
j<br>
+ * before submitting the work to hardware. That fence is either :<br>
+ *<br>
+ *=C2=A0 =C2=A0 - The syncobj&#39;s current fence if the syncobj is consid=
ered as a binary<br>
+ *=C2=A0 =C2=A0 =C2=A0 primitive.<br>
+ *=C2=A0 =C2=A0 - The struct &amp;dma_fence associated with a given point =
if the syncobj is<br>
+ *=C2=A0 =C2=A0 =C2=A0 considered as a timeline primitive.<br>
+ *<br>
+ * If the syncobj&#39;s fence is NULL or not present in the syncobj&#39;s =
timeline,<br>
+ * the enqueue operation is expected to fail.<br>
+ *<br>
+ * With binary syncobj, all manipulation of the syncobjs&#39;s fence happe=
ns in<br>
+ * terms of the current fence at the time the ioctl is called by userspace=
<br>
+ * regardless of whether that operation is an immediate host-side operatio=
n<br>
+ * (signal or reset) or or an operation which is enqueued in some driver<b=
r>
+ * queue. &amp;DRM_IOCTL_SYNCOBJ_RESET and &amp;DRM_IOCTL_SYNCOBJ_SIGNAL c=
an be used<br>
+ * to manipulate a syncobj from the host by resetting its pointer to NULL =
or<br>
=C2=A0 * setting its pointer to a fence which is already signaled.<br>
=C2=A0 *<br>
+ * With timeline syncobj, all manipulation of the timeline fences happens =
in<br>
+ * terms of the fence referred to in the timeline. See<br>
+ * dma_fence_chain_find_seqno() to see how a given point is found in the<b=
r>
+ * timeline.<br>
+ *<br>
+ * Note that applications should be careful to always use timeline set of<=
br>
+ * ioctl() when dealing with syncobj considered as timeline. Using a binar=
y<br>
+ * set of ioctl() with a syncobj considered as timeline could result incor=
rect<br>
+ * synchronization. The use of binary syncobj is supported through the<br>
+ * timeline set of ioctl() by using a point value of 0, this will reproduc=
e<br>
+ * the behavior of the binary set of ioctl() (for example replace the<br>
+ * syncobj&#39;s fence when signaling).<br></blockquote><div>=C2=A0</div><=
div>I know I&#39;ve asked this before but I feel compelled to ask it again.=
=C2=A0 Why do we allow them to mix and match?=C2=A0 Why not just have a cre=
ate flag and enforce meaningful behavior?=C2=A0 I&#39;m a bit concerned tha=
t userspace is going to start relying on the subtlties of the interaction b=
etween timeline and binary syncobjs which are neither documented nor proper=
ly tested in IGT.<br></div><div> <br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
+ *<br>
=C2=A0 *<br>
=C2=A0 * Host-side wait on syncobjs<br>
=C2=A0 * --------------------------<br>
@@ -87,6 +126,16 @@<br>
=C2=A0 * synchronize between the two.<br>
=C2=A0 * This requirement is inherited from the Vulkan fence API.<br>
=C2=A0 *<br>
+ * Similarly, &amp;DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT takes an array of synco=
bj<br>
+ * handles as well as an array of u64 points and does a host-side wait on =
all<br>
+ * of syncobj fences at the given points simultaneously.<br>
+ *<br>
+ * &amp;DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT also adds the ability to wait for =
a given<br>
+ * fence to materialize on the timeline without waiting for the fence to b=
e<br>
+ * signaled by using the &amp;DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE flag. =
This<br>
+ * requirement is inherited from the wait-before-signal behavior required =
by<br>
+ * the Vulkan timeline semaphore API.<br>
+ *<br>
=C2=A0 *<br>
=C2=A0 * Import/export of syncobjs<br>
=C2=A0 * -------------------------<br>
@@ -120,6 +169,18 @@<br>
=C2=A0 * Because sync files are immutable, resetting or signaling the synco=
bj<br>
=C2=A0 * will not affect any sync files whose fences have been imported int=
o the<br>
=C2=A0 * syncobj.<br>
+ *<br>
+ *<br>
+ * Import/export of timeline points in timeline syncobjs<br>
+ * -----------------------------------------------------<br>
+ *<br>
+ * &amp;DRM_IOCTL_SYNCOBJ_TRANSFER provides a mechanism to transfer a stru=
ct<br>
+ * &amp;dma_fence of at a given point from a timeline syncobj to another p=
oint<br>
+ * into another timeline syncobj.<br>
+ *<br>
+ * Note that if you want to transfer a struct &amp;dma_fence from a given =
point on<br>
+ * a timeline syncobj from/into a binary syncobj, you can use the point 0 =
to<br>
+ * mean take/replace the fence in the syncobj.<br>
=C2=A0 */<br>
<br>
=C2=A0#include &lt;linux/anon_inodes.h&gt;<br>
-- <br>
2.23.0<br>
<br>
</blockquote></div></div>

--000000000000975c010590b9a5e7--

--===============1118997530==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1118997530==--
