Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A868A0AF
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2019 16:22:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33B406E530;
	Mon, 12 Aug 2019 14:22:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96C206E530
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 14:22:55 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id i11so994889edq.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 07:22:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=61PIMnCMWQg6HutD4pD9UaiNXo01S3vmRM6Rxpqubpg=;
 b=GJtCsr0uo3cTit6rhPfDvJ6XVO1uo0AfRZZJ9T1y02rSz0jZOQ2Le+r2/mlYBEK9YJ
 aUf8LB+K9jT+giNiXsgWbEblvHQJBuDg66KVHZdSatwiCwCsgvO+pa45PdeRuN5GSr2q
 fxPHSSr/g2Q8PoSSwWeqmtDe9Fif9Du0P0GYqNXQamttINCg9OcEszsmG/JlxTN3CLNL
 hPM7cdHwrM6Zn8PnkOOw5OAaHB3NB4H3xSh2yZAc0ZAG9ER/sUi7iic8yriNSplkTcE2
 G/xS+8kV+VHktl8qJ85XsBy57iPtI6vWsVdEMzRXJseEhQrsZ2hauVSaBlam6vf8/p6Q
 Ev1Q==
X-Gm-Message-State: APjAAAXGBcX98n27Ov95ORr4BgAJAvKJMkCHCzAOww0q0O+lPdXicvB1
 I/kbCZGNk7hjSN30d9AUAZeiY1yhvfbai4uUVaa51rbA
X-Google-Smtp-Source: APXvYqxw4ftWfi8939w9CtzIUJYhcLV4SeUVdqTww1zRWwI3nyuVoo3URGOsAcQBSpIKlHMst3fEScI1qqkLXRlfRVI=
X-Received: by 2002:a17:906:6a89:: with SMTP id
 p9mr11479120ejr.44.1565619773827; 
 Mon, 12 Aug 2019 07:22:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190806161905.30769-1-jason@jlekstrand.net>
 <20190812142211.15885-1-jason@jlekstrand.net>
In-Reply-To: <20190812142211.15885-1-jason@jlekstrand.net>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 12 Aug 2019 09:22:42 -0500
Message-ID: <CAOFGe95pMkbGzx58NhqHi9ytnHMDx-8CxPirJ+e0xid5figtjg@mail.gmail.com>
Subject: Re: [PATCH] drm/syncobj: Add better overview documentation for
 syncobj (v2)
To: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=61PIMnCMWQg6HutD4pD9UaiNXo01S3vmRM6Rxpqubpg=;
 b=V/NYknUP1fwlefhMfvAymqohNGCf5b08g9bc6ebZFpgOF/m7/OY1V3FqSns/xe/BGp
 4jk/1i+MDWN5vv3hRcAIXXeU2G+KK8atgQU2sn/BHfGlyDRd5YVMdfgh4Q/EI0SMSllN
 5ATPaO8yKX23bt39fPX2L5xC4EGBb21dp1oocTHePqsn/d/r8luX1QgkD3cXiqek+6qr
 +EHWW8RhdyT1DCUZgyZ7vZh3SJ3nlehG5Zbe6f7AYxAD5ywQOjLeejn/CSt5XgP0FV5n
 A2LHG4zG2KBWA/uNVocjmObmpthwPJ8QJxnfPyUEzZ4QXSjl68kDZEkwDkibHQ6Q7VFc
 Jh0A==
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============2048932886=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2048932886==
Content-Type: multipart/alternative; boundary="000000000000790615058fec4255"

--000000000000790615058fec4255
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Would one of you mind pushing?  I don't have drm-misc commit bits.

On Mon, Aug 12, 2019 at 9:22 AM Jason Ekstrand <jason@jlekstrand.net> wrote=
:

> This patch only brings the syncobj documentation up-to-date for the
> original form of syncobj.  It does not contain any information about the
> design of timeline syncobjs.
>
> v2: Incorporate feedback from Lionel and Christian:
>  - Mention actual ioctl and flag names
>  - Better language around reference counting
>  - Misc. language cleanups
>
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> Reviewed-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/drm_syncobj.c | 98 +++++++++++++++++++++++++++++++----
>  1 file changed, 87 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.=
c
> index 1438dcb3ebb1..4b5c7b0ed714 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -29,21 +29,97 @@
>  /**
>   * DOC: Overview
>   *
> - * DRM synchronisation objects (syncobj, see struct &drm_syncobj) are
> - * persistent objects that contain an optional fence. The fence can be
> updated
> - * with a new fence, or be NULL.
> + * DRM synchronisation objects (syncobj, see struct &drm_syncobj) provid=
e
> a
> + * container for a synchronization primitive which can be used by
> userspace
> + * to explicitly synchronize GPU commands, can be shared between userspa=
ce
> + * processes, and can be shared between different DRM drivers.
> + * Their primary use-case is to implement Vulkan fences and semaphores.
> + * The syncobj userspace API provides ioctls for several operations:
>   *
> - * syncobj's can be waited upon, where it will wait for the underlying
> - * fence.
> + *  - Creation and destruction of syncobjs
> + *  - Import and export of syncobjs to/from a syncobj file descriptor
> + *  - Import and export a syncobj's underlying fence to/from a sync file
> + *  - Reset a syncobj (set its fence to NULL)
> + *  - Signal a syncobj (set a trivially signaled fence)
> + *  - Wait for a syncobj's fence to appear and be signaled
>   *
> - * syncobj's can be export to fd's and back, these fd's are opaque and
> - * have no other use case, except passing the syncobj between processes.
> + * At it's core, a syncobj is simply a wrapper around a pointer to a
> struct
> + * &dma_fence which may be NULL.
> + * When a syncobj is first created, its pointer is either NULL or a
> pointer
> + * to an already signaled fence depending on whether the
> + * &DRM_SYNCOBJ_CREATE_SIGNALED flag is passed to
> + * &DRM_IOCTL_SYNCOBJ_CREATE.
> + * When GPU work which signals a syncobj is enqueued in a DRM driver,
> + * the syncobj fence is replaced with a fence which will be signaled by
> the
> + * completion of that work.
> + * When GPU work which waits on a syncobj is enqueued in a DRM driver, t=
he
> + * driver retrieves syncobj's current fence at the time the work is
> enqueued
> + * waits on that fence before submitting the work to hardware.
> + * If the syncobj's fence is NULL, the enqueue operation is expected to
> fail.
> + * All manipulation of the syncobjs's fence happens in terms of the
> current
> + * fence at the time the ioctl is called by userspace regardless of
> whether
> + * that operation is an immediate host-side operation (signal or reset) =
or
> + * or an operation which is enqueued in some driver queue.
> + * &DRM_IOCTL_SYNCOBJ_RESET and &DRM_IOCTL_SYNCOBJ_SIGNAL can be used to
> + * manipulate a syncobj from the host by resetting its pointer to NULL o=
r
> + * setting its pointer to a fence which is already signaled.
>   *
> - * Their primary use-case is to implement Vulkan fences and semaphores.
>   *
> - * syncobj have a kref reference count, but also have an optional file.
> - * The file is only created once the syncobj is exported.
> - * The file takes a reference on the kref.
> + * Host-side wait on syncobjs
> + * --------------------------
> + *
> + * &DRM_IOCTL_SYNCOBJ_WAIT takes an array of syncobj handles and does a
> + * host-side wait on all of the syncobj fences simultaneously.
> + * If &DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL is set, the wait ioctl will wait =
on
> + * all of the syncobj fences to be signaled before it returns.
> + * Otherwise, it returns once at least one syncobj fence has been signal=
ed
> + * and the index of a signaled fence is written back to the client.
> + *
> + * Unlike the enqueued GPU work dependencies which fail if they see a NU=
LL
> + * fence in a syncobj, if &DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT is set=
,
> + * the host-side wait will first wait for the syncobj to receive a
> non-NULL
> + * fence and then wait on that fence.
> + * If &DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT is not set and any one of
> the
> + * syncobjs in the array has a NULL fence, -EINVAL will be returned.
> + * Assuming the syncobj starts off with a NULL fence, this allows a clie=
nt
> + * to do a host wait in one thread (or process) which waits on GPU work
> + * submitted in another thread (or process) without having to manually
> + * synchronize between the two.
> + * This requirement is inherited from the Vulkan fence API.
> + *
> + *
> + * Import/export of syncobjs
> + * -------------------------
> + *
> + * &DRM_IOCTL_SYNCOBJ_FD_TO_HANDLE and &DRM_IOCTL_SYNCOBJ_HANDLE_TO_FD
> + * provide two mechanisms for import/export of syncobjs.
> + *
> + * The first lets the client import or export an entire syncobj to a fil=
e
> + * descriptor.
> + * These fd's are opaque and have no other use case, except passing the
> + * syncobj between processes.
> + * All exported file descriptors and any syncobj handles created as a
> + * result of importing those file descriptors own a reference to the
> + * same underlying struct &drm_syncobj and the syncobj can be used
> + * persistently across all the processes with which it is shared.
> + * The syncobj is freed only once the last reference is dropped.
> + * Unlike dma-buf, importing a syncobj creates a new handle (with its ow=
n
> + * reference) for every import instead of de-duplicating.
> + * The primary use-case of this persistent import/export is for shared
> + * Vulkan fences and semaphores.
> + *
> + * The second import/export mechanism, which is indicated by
> + * &DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE or
> + * &DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE lets the client
> + * import/export the syncobj's current fence from/to a &sync_file.
> + * When a syncobj is exported to a sync file, that sync file wraps the
> + * sycnobj's fence at the time of export and any later signal or reset
> + * operations on the syncobj will not affect the exported sync file.
> + * When a sync file is imported into a syncobj, the syncobj's fence is s=
et
> + * to the fence wrapped by that sync file.
> + * Because sync files are immutable, resetting or signaling the syncobj
> + * will not affect any sync files whose fences have been imported into t=
he
> + * syncobj.
>   */
>
>  #include <linux/anon_inodes.h>
> --
> 2.21.0
>
>

--000000000000790615058fec4255
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Would one of you mind pushing?=C2=A0 I don&#39;t have drm-=
misc commit bits.<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, Aug 12, 2019 at 9:22 AM Jason Ekstrand &lt;<a =
href=3D"mailto:jason@jlekstrand.net">jason@jlekstrand.net</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">This patch only br=
ings the syncobj documentation up-to-date for the<br>
original form of syncobj.=C2=A0 It does not contain any information about t=
he<br>
design of timeline syncobjs.<br>
<br>
v2: Incorporate feedback from Lionel and Christian:<br>
=C2=A0- Mention actual ioctl and flag names<br>
=C2=A0- Better language around reference counting<br>
=C2=A0- Misc. language cleanups<br>
<br>
Signed-off-by: Jason Ekstrand &lt;<a href=3D"mailto:jason@jlekstrand.net" t=
arget=3D"_blank">jason@jlekstrand.net</a>&gt;<br>
Reviewed-by: Lionel Landwerlin &lt;<a href=3D"mailto:lionel.g.landwerlin@in=
tel.com" target=3D"_blank">lionel.g.landwerlin@intel.com</a>&gt;<br>
Acked-by: Christian K=C3=B6nig &lt;<a href=3D"mailto:christian.koenig@amd.c=
om" target=3D"_blank">christian.koenig@amd.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/drm_syncobj.c | 98 +++++++++++++++++++++++++++++++---=
-<br>
=C2=A01 file changed, 87 insertions(+), 11 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c<=
br>
index 1438dcb3ebb1..4b5c7b0ed714 100644<br>
--- a/drivers/gpu/drm/drm_syncobj.c<br>
+++ b/drivers/gpu/drm/drm_syncobj.c<br>
@@ -29,21 +29,97 @@<br>
=C2=A0/**<br>
=C2=A0 * DOC: Overview<br>
=C2=A0 *<br>
- * DRM synchronisation objects (syncobj, see struct &amp;drm_syncobj) are<=
br>
- * persistent objects that contain an optional fence. The fence can be upd=
ated<br>
- * with a new fence, or be NULL.<br>
+ * DRM synchronisation objects (syncobj, see struct &amp;drm_syncobj) prov=
ide a<br>
+ * container for a synchronization primitive which can be used by userspac=
e<br>
+ * to explicitly synchronize GPU commands, can be shared between userspace=
<br>
+ * processes, and can be shared between different DRM drivers.<br>
+ * Their primary use-case is to implement Vulkan fences and semaphores.<br=
>
+ * The syncobj userspace API provides ioctls for several operations:<br>
=C2=A0 *<br>
- * syncobj&#39;s can be waited upon, where it will wait for the underlying=
<br>
- * fence.<br>
+ *=C2=A0 - Creation and destruction of syncobjs<br>
+ *=C2=A0 - Import and export of syncobjs to/from a syncobj file descriptor=
<br>
+ *=C2=A0 - Import and export a syncobj&#39;s underlying fence to/from a sy=
nc file<br>
+ *=C2=A0 - Reset a syncobj (set its fence to NULL)<br>
+ *=C2=A0 - Signal a syncobj (set a trivially signaled fence)<br>
+ *=C2=A0 - Wait for a syncobj&#39;s fence to appear and be signaled<br>
=C2=A0 *<br>
- * syncobj&#39;s can be export to fd&#39;s and back, these fd&#39;s are op=
aque and<br>
- * have no other use case, except passing the syncobj between processes.<b=
r>
+ * At it&#39;s core, a syncobj is simply a wrapper around a pointer to a s=
truct<br>
+ * &amp;dma_fence which may be NULL.<br>
+ * When a syncobj is first created, its pointer is either NULL or a pointe=
r<br>
+ * to an already signaled fence depending on whether the<br>
+ * &amp;DRM_SYNCOBJ_CREATE_SIGNALED flag is passed to<br>
+ * &amp;DRM_IOCTL_SYNCOBJ_CREATE.<br>
+ * When GPU work which signals a syncobj is enqueued in a DRM driver,<br>
+ * the syncobj fence is replaced with a fence which will be signaled by th=
e<br>
+ * completion of that work.<br>
+ * When GPU work which waits on a syncobj is enqueued in a DRM driver, the=
<br>
+ * driver retrieves syncobj&#39;s current fence at the time the work is en=
queued<br>
+ * waits on that fence before submitting the work to hardware.<br>
+ * If the syncobj&#39;s fence is NULL, the enqueue operation is expected t=
o fail.<br>
+ * All manipulation of the syncobjs&#39;s fence happens in terms of the cu=
rrent<br>
+ * fence at the time the ioctl is called by userspace regardless of whethe=
r<br>
+ * that operation is an immediate host-side operation (signal or reset) or=
<br>
+ * or an operation which is enqueued in some driver queue.<br>
+ * &amp;DRM_IOCTL_SYNCOBJ_RESET and &amp;DRM_IOCTL_SYNCOBJ_SIGNAL can be u=
sed to<br>
+ * manipulate a syncobj from the host by resetting its pointer to NULL or<=
br>
+ * setting its pointer to a fence which is already signaled.<br>
=C2=A0 *<br>
- * Their primary use-case is to implement Vulkan fences and semaphores.<br=
>
=C2=A0 *<br>
- * syncobj have a kref reference count, but also have an optional file.<br=
>
- * The file is only created once the syncobj is exported.<br>
- * The file takes a reference on the kref.<br>
+ * Host-side wait on syncobjs<br>
+ * --------------------------<br>
+ *<br>
+ * &amp;DRM_IOCTL_SYNCOBJ_WAIT takes an array of syncobj handles and does =
a<br>
+ * host-side wait on all of the syncobj fences simultaneously.<br>
+ * If &amp;DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL is set, the wait ioctl will wai=
t on<br>
+ * all of the syncobj fences to be signaled before it returns.<br>
+ * Otherwise, it returns once at least one syncobj fence has been signaled=
<br>
+ * and the index of a signaled fence is written back to the client.<br>
+ *<br>
+ * Unlike the enqueued GPU work dependencies which fail if they see a NULL=
<br>
+ * fence in a syncobj, if &amp;DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT is s=
et,<br>
+ * the host-side wait will first wait for the syncobj to receive a non-NUL=
L<br>
+ * fence and then wait on that fence.<br>
+ * If &amp;DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT is not set and any one o=
f the<br>
+ * syncobjs in the array has a NULL fence, -EINVAL will be returned.<br>
+ * Assuming the syncobj starts off with a NULL fence, this allows a client=
<br>
+ * to do a host wait in one thread (or process) which waits on GPU work<br=
>
+ * submitted in another thread (or process) without having to manually<br>
+ * synchronize between the two.<br>
+ * This requirement is inherited from the Vulkan fence API.<br>
+ *<br>
+ *<br>
+ * Import/export of syncobjs<br>
+ * -------------------------<br>
+ *<br>
+ * &amp;DRM_IOCTL_SYNCOBJ_FD_TO_HANDLE and &amp;DRM_IOCTL_SYNCOBJ_HANDLE_T=
O_FD<br>
+ * provide two mechanisms for import/export of syncobjs.<br>
+ *<br>
+ * The first lets the client import or export an entire syncobj to a file<=
br>
+ * descriptor.<br>
+ * These fd&#39;s are opaque and have no other use case, except passing th=
e<br>
+ * syncobj between processes.<br>
+ * All exported file descriptors and any syncobj handles created as a<br>
+ * result of importing those file descriptors own a reference to the<br>
+ * same underlying struct &amp;drm_syncobj and the syncobj can be used<br>
+ * persistently across all the processes with which it is shared.<br>
+ * The syncobj is freed only once the last reference is dropped.<br>
+ * Unlike dma-buf, importing a syncobj creates a new handle (with its own<=
br>
+ * reference) for every import instead of de-duplicating.<br>
+ * The primary use-case of this persistent import/export is for shared<br>
+ * Vulkan fences and semaphores.<br>
+ *<br>
+ * The second import/export mechanism, which is indicated by<br>
+ * &amp;DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE or<br>
+ * &amp;DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE lets the client<br=
>
+ * import/export the syncobj&#39;s current fence from/to a &amp;sync_file.=
<br>
+ * When a syncobj is exported to a sync file, that sync file wraps the<br>
+ * sycnobj&#39;s fence at the time of export and any later signal or reset=
<br>
+ * operations on the syncobj will not affect the exported sync file.<br>
+ * When a sync file is imported into a syncobj, the syncobj&#39;s fence is=
 set<br>
+ * to the fence wrapped by that sync file.<br>
+ * Because sync files are immutable, resetting or signaling the syncobj<br=
>
+ * will not affect any sync files whose fences have been imported into the=
<br>
+ * syncobj.<br>
=C2=A0 */<br>
<br>
=C2=A0#include &lt;linux/anon_inodes.h&gt;<br>
-- <br>
2.21.0<br>
<br>
</blockquote></div>

--000000000000790615058fec4255--

--===============2048932886==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2048932886==--
