Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B3582356
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 19:01:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24D046E506;
	Mon,  5 Aug 2019 17:01:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC3016E506
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 17:01:20 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id k8so79404419eds.7
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 10:01:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l71Pq8IsUjgCreMzvT1JWIyJnmf5XkHGARngn3KgVss=;
 b=XCABpeY6tSVE5TDRNZFz6oI+V3SXvVBT1xdD+px1+aS4v+MSL4d/ZTpMyDr31wLG8A
 Ii6XYkQ2x8Zx1v3cNqhnwbjT5gz5tJozoo1vWDQzzEYHZlshBukJVFA+oLkdn43fgHlo
 0ncXtFldKapwILu/UX0e9zAV4ridq1s8PJ3jVTQAX9ql0dof6O7XBmmGfkIWJCHSoYhD
 57FsE6WdlhfLuR3JBjHC2ZQeSYjCq3q/DpOv6muH0a0H0Yp7Jcn33K9YiP8JxRB4zfgT
 L5Z8SyCCR+CElgw6HyGST1PzSvyerJbQit0nQCWwHWQxnEyXH68eyLvmQc5SDioYuhXo
 o/tA==
X-Gm-Message-State: APjAAAWDpcbycqNmG7Q7J2sB8Bi1XqlvkvMUbJ4iAu4Lu6pSgqgEZUaI
 mRBpr63/ZzmHwsxszdVChAlZjMavULHvdObGzjs=
X-Google-Smtp-Source: APXvYqwGFQeipsEn71DURI5xq85upyB5JoWAfydm1amZvcNtoMy1X4+SxjReGPeDGf4pGMNGKN0I85/FKUMDV3X9UE8=
X-Received: by 2002:a17:906:5042:: with SMTP id
 e2mr116223677ejk.220.1565024479379; 
 Mon, 05 Aug 2019 10:01:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190802174033.10505-1-jason@jlekstrand.net>
 <f06de0f5-2eaf-6ac9-803b-890d4f0a972c@intel.com>
In-Reply-To: <f06de0f5-2eaf-6ac9-803b-890d4f0a972c@intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 5 Aug 2019 12:01:08 -0500
Message-ID: <CAOFGe97AVw0U5NV0xa=G5+aj5HSr5gnC9TN0vm1MKaA6P08wJg@mail.gmail.com>
Subject: Re: [PATCH] drm/syncobj: Add better overview documentation for syncobj
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=l71Pq8IsUjgCreMzvT1JWIyJnmf5XkHGARngn3KgVss=;
 b=AFOCODOn0rh5JW9NDnHBY2/LC5RogVmdCWHvCtGIn6wuedk7q/5sWOkIT420Arm3Q4
 9+f2h9u3z8VR6WvlB2UiMcfo/SKdYhLvCNSzCJLNqZBYVcSi1i8sQ+EMpVunKEGQ3E7p
 XU7xKFSv7Zs+r96oj9etFAGlnt0bfavdRAgChCb6XUtLLskTWGD7+V9XYuD88w+UhGRX
 D9uK2s1zNozE+Hd1CE3mtueA7pwn7wxnRjuPMjNlzwJyF/0rqy55Oepq4EBEQTWFSVf8
 EUY+n4SAjGX2F+obq+UL03JfoD3ML58lfV4LAO22o/USOgeDDVJCK+vsbYrntPdMKCZG
 CbCw==
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
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0134192232=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0134192232==
Content-Type: multipart/alternative; boundary="000000000000289ea5058f61a8b8"

--000000000000289ea5058f61a8b8
Content-Type: text/plain; charset="UTF-8"

On Sat, Aug 3, 2019 at 3:19 AM Lionel Landwerlin <
lionel.g.landwerlin@intel.com> wrote:

> Thanks a lot for writing this :)
> I now have a canvas to add stuff on!
>
> Just a couple of questions below.
>
> -Lionel
>
> On 02/08/2019 20:40, Jason Ekstrand wrote:
> > This patch only brings the syncobj documentation up-to-date for the
> > original form of syncobj.  It does not contain any information about the
> > design of timeline syncobjs.
> > ---
> >   drivers/gpu/drm/drm_syncobj.c | 81 +++++++++++++++++++++++++++++++----
> >   1 file changed, 73 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_syncobj.c
> b/drivers/gpu/drm/drm_syncobj.c
> > index 1438dcb3ebb1..03cc888744fb 100644
> > --- a/drivers/gpu/drm/drm_syncobj.c
> > +++ b/drivers/gpu/drm/drm_syncobj.c
> > @@ -29,17 +29,82 @@
> >   /**
> >    * DOC: Overview
> >    *
> > - * DRM synchronisation objects (syncobj, see struct &drm_syncobj) are
> > - * persistent objects that contain an optional fence. The fence can be
> updated
> > - * with a new fence, or be NULL.
> > + * DRM synchronisation objects (syncobj, see struct &drm_syncobj)
> provide a
> > + * synchronization primitive which can be used by userspace to
> explicitly
> > + * synchronize GPU commands, can be shared between userspace processes,
> and
> > + * can be shared between different DRM drivers.
>
>
> I've been wondering whether we should call it a container for a
> synchronization primitive rather than a primitive itself.
>
> Sync files are also a container, just we fewer features (no host
> operations).
>
> It's not really important :)
>

That's a fun philosophical question and I think the answer entirely depends
on which side of the ioctl you're on. :-)


> > + * Their primary use-case is to implement Vulkan fences and semaphores.
> > + * The syncobj userspace API provides ioctls for several operations:
> >    *
> > - * syncobj's can be waited upon, where it will wait for the underlying
> > - * fence.
> > + *  - Creation and destruction of syncobjs
> > + *  - Import and export of syncobjs to/from a syncobj file descriptor
> > + *  - Import and export a syncobj's underlying fence to/from a sync file
> > + *  - Reset a syncobj (set its fence to NULL)
> > + *  - Signal a syncobj (set a trivially signaled fence)
> > + *  - Wait a syncobj's fence to be signaled
> >    *
> > - * syncobj's can be export to fd's and back, these fd's are opaque and
> > - * have no other use case, except passing the syncobj between processes.
> > + * At it's core, a syncobj simply a wrapper around a pointer to a struct
> > + * &dma_fence which may be NULL.
> > + * When GPU work which signals a syncobj is enqueued in a DRM driver,
> > + * the syncobj fence is replaced with a fence which will be signaled by
> the
> > + * completion of that work.
> > + * When GPU work which waits on a syncobj is enqueued in a DRM driver,
> the
> > + * driver retrieves syncobj's current fence at the time the work is
> enqueued
> > + * waits on that fence before submitting the work to hardware.
> > + * If the syncobj's fence is NULL, the enqueue operation is expected to
> fail.
> > + * All manipulation of the syncobjs's fence happens in terms of the
> current
> > + * fence at the time the ioctl is called by userspace regardless of
> whether
> > + * that operation is an immediate host-side operation (signal or reset)
> or
> > + * or an operation which is enqueued in some driver queue.
> >    *
> > - * Their primary use-case is to implement Vulkan fences and semaphores.
>
>
> Maybe add a line about creation (and its signaled flag)?
>

Sure, I'll also make a comment about reset and signal.


> > + *
> > + * Host-side wait on syncobjs
> > + * --------------------------
> > + *
> > + * The userspace syncobj API provides an ioctl for waiting on a set of
> > + * syncobjs.
> > + * The wait ioctl takes an array of syncobj handles and a flag
> indicating
> > + * whether it should return immediately once one syncobj has been
> signaled
> > + * or if it should wait for all the syncobjs to be signaled.
> > + * Unlike the enqueued GPU work dependencies, the host-side wait ioctl
> > + * will also optionally wait for the syncobj to first receive a fence
> and
> > + * then wait on that fence.
> > + * Assuming the syncobj starts off with a NULL fence, this allows a
> client
> > + * to do a host wait in one thread (or process) which waits on GPU work
> > + * submitted in another thread (or process) without having to manually
> > + * synchronize between the two.
> > + * This requirement is inherited from the Vulkan fence API.
>
>
> Should we list the flags & ioctl names?
>

I don't know.  Maybe Dave or Daniel can tell me how these things are
usually done?


> > + *
> > + *
> > + * Import/export of syncobjs
> > + * -------------------------
> > + *
> > + * The userspace syncobj API provides two mechanisms for import/export
> of
> > + * syncobjs.
> > + *
> > + * The first lets the client import or export an entire syncobj to a
> file
> > + * descriptor.
> > + * These fd's are opaque and have no other use case, except passing the
> > + * syncobj between processes.
> > + * All syncobj handles which are created as the result of such an import
> > + * operation refer to the same underlying syncobj as was used for the
> > + * export and the syncobj can be used persistently across all the
> processes
> > + * with which it is shared.
> > + * Unlike dma-buf, importing a syncobj creates a new handle for every
> > + * import instead of de-duplicating.
> > + * The primary use-case of this persistent import/export is for shared
> > + * Vulkan fences and semaphores.
> > + *
> > + * The second import/export mechanism lets the client export the
> syncobj's
> > + * current fence to/from a &sync_file.
> > + * When a syncobj is exported to a sync file, that sync file wraps the
> > + * sycnobj's fence at the time of export and any later signal or reset
> > + * operations on the syncobj will not affect the exported sync file.
> > + * When a sync file is imported into a syncobj, the syncobj's fence is
> set
> > + * to the fence wrapped by that sync file.
> > + * Because sync files are immutable, resetting or signaling the syncobj
> > + * will not affect any sync files whose fences have been imported into
> the
> > + * syncobj.
> >    *
>
>
> This 3 lines below seem to be redundant now?
>

Which three lines are you referring to?  The thing about krefs?  I agree
that it feels a bit odd with the rest of the documentation because it's a
very internal detail and the rest of what I've written is an overview.
Maybe the bit about krefs should go in the top section and the bit about
the file should stay here?


> Maybe rephrase with something like :
>
>
> "Sharing a syncobj increases its refcount. The syncobj is destroyed when
> a client release the last reference."
>

I don't think we need to describe how reference counting works.


> >    * syncobj have a kref reference count, but also have an optional file.
> >    * The file is only created once the syncobj is exported.
>
>
>

--000000000000289ea5058f61a8b8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Sat, Aug 3, 2019 at 3:19 AM Lionel Landwerlin &lt;<a href=3D"=
mailto:lionel.g.landwerlin@intel.com">lionel.g.landwerlin@intel.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Thanks a=
 lot for writing this :)<br>
I now have a canvas to add stuff on!<br>
<br>
Just a couple of questions below.<br>
<br>
-Lionel<br>
<br>
On 02/08/2019 20:40, Jason Ekstrand wrote:<br>
&gt; This patch only brings the syncobj documentation up-to-date for the<br=
>
&gt; original form of syncobj.=C2=A0 It does not contain any information ab=
out the<br>
&gt; design of timeline syncobjs.<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/drm_syncobj.c | 81 +++++++++++++++++++++++=
++++++++----<br>
&gt;=C2=A0 =C2=A01 file changed, 73 insertions(+), 8 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_synco=
bj.c<br>
&gt; index 1438dcb3ebb1..03cc888744fb 100644<br>
&gt; --- a/drivers/gpu/drm/drm_syncobj.c<br>
&gt; +++ b/drivers/gpu/drm/drm_syncobj.c<br>
&gt; @@ -29,17 +29,82 @@<br>
&gt;=C2=A0 =C2=A0/**<br>
&gt;=C2=A0 =C2=A0 * DOC: Overview<br>
&gt;=C2=A0 =C2=A0 *<br>
&gt; - * DRM synchronisation objects (syncobj, see struct &amp;drm_syncobj)=
 are<br>
&gt; - * persistent objects that contain an optional fence. The fence can b=
e updated<br>
&gt; - * with a new fence, or be NULL.<br>
&gt; + * DRM synchronisation objects (syncobj, see struct &amp;drm_syncobj)=
 provide a<br>
&gt; + * synchronization primitive which can be used by userspace to explic=
itly<br>
&gt; + * synchronize GPU commands, can be shared between userspace processe=
s, and<br>
&gt; + * can be shared between different DRM drivers.<br>
<br>
<br>
I&#39;ve been wondering whether we should call it a container for a <br>
synchronization primitive rather than a primitive itself.<br>
<br>
Sync files are also a container, just we fewer features (no host <br>
operations).<br>
<br>
It&#39;s not really important :)<br></blockquote><div><br></div><div>That&#=
39;s a fun philosophical question and I think the answer entirely depends o=
n which side of the ioctl you&#39;re on. :-)<br></div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
&gt; + * Their primary use-case is to implement Vulkan fences and semaphore=
s.<br>
&gt; + * The syncobj userspace API provides ioctls for several operations:<=
br>
&gt;=C2=A0 =C2=A0 *<br>
&gt; - * syncobj&#39;s can be waited upon, where it will wait for the under=
lying<br>
&gt; - * fence.<br>
&gt; + *=C2=A0 - Creation and destruction of syncobjs<br>
&gt; + *=C2=A0 - Import and export of syncobjs to/from a syncobj file descr=
iptor<br>
&gt; + *=C2=A0 - Import and export a syncobj&#39;s underlying fence to/from=
 a sync file<br>
&gt; + *=C2=A0 - Reset a syncobj (set its fence to NULL)<br>
&gt; + *=C2=A0 - Signal a syncobj (set a trivially signaled fence)<br>
&gt; + *=C2=A0 - Wait a syncobj&#39;s fence to be signaled<br>
&gt;=C2=A0 =C2=A0 *<br>
&gt; - * syncobj&#39;s can be export to fd&#39;s and back, these fd&#39;s a=
re opaque and<br>
&gt; - * have no other use case, except passing the syncobj between process=
es.<br>
&gt; + * At it&#39;s core, a syncobj simply a wrapper around a pointer to a=
 struct<br>
&gt; + * &amp;dma_fence which may be NULL.<br>
&gt; + * When GPU work which signals a syncobj is enqueued in a DRM driver,=
<br>
&gt; + * the syncobj fence is replaced with a fence which will be signaled =
by the<br>
&gt; + * completion of that work.<br>
&gt; + * When GPU work which waits on a syncobj is enqueued in a DRM driver=
, the<br>
&gt; + * driver retrieves syncobj&#39;s current fence at the time the work =
is enqueued<br>
&gt; + * waits on that fence before submitting the work to hardware.<br>
&gt; + * If the syncobj&#39;s fence is NULL, the enqueue operation is expec=
ted to fail.<br>
&gt; + * All manipulation of the syncobjs&#39;s fence happens in terms of t=
he current<br>
&gt; + * fence at the time the ioctl is called by userspace regardless of w=
hether<br>
&gt; + * that operation is an immediate host-side operation (signal or rese=
t) or<br>
&gt; + * or an operation which is enqueued in some driver queue.<br>
&gt;=C2=A0 =C2=A0 *<br>
&gt; - * Their primary use-case is to implement Vulkan fences and semaphore=
s.<br>
<br>
<br>
Maybe add a line about creation (and its signaled flag)?<br></blockquote><d=
iv><br></div><div>Sure, I&#39;ll also make a comment about reset and signal=
.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
&gt; + *<br>
&gt; + * Host-side wait on syncobjs<br>
&gt; + * --------------------------<br>
&gt; + *<br>
&gt; + * The userspace syncobj API provides an ioctl for waiting on a set o=
f<br>
&gt; + * syncobjs.<br>
&gt; + * The wait ioctl takes an array of syncobj handles and a flag indica=
ting<br>
&gt; + * whether it should return immediately once one syncobj has been sig=
naled<br>
&gt; + * or if it should wait for all the syncobjs to be signaled.<br>
&gt; + * Unlike the enqueued GPU work dependencies, the host-side wait ioct=
l<br>
&gt; + * will also optionally wait for the syncobj to first receive a fence=
 and<br>
&gt; + * then wait on that fence.<br>
&gt; + * Assuming the syncobj starts off with a NULL fence, this allows a c=
lient<br>
&gt; + * to do a host wait in one thread (or process) which waits on GPU wo=
rk<br>
&gt; + * submitted in another thread (or process) without having to manuall=
y<br>
&gt; + * synchronize between the two.<br>
&gt; + * This requirement is inherited from the Vulkan fence API.<br>
<br>
<br>
Should we list the flags &amp; ioctl names?<br></blockquote><div><br></div>=
<div>I don&#39;t know.=C2=A0 Maybe Dave or Daniel can tell me how these thi=
ngs are usually done?<br></div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
&gt; + *<br>
&gt; + *<br>
&gt; + * Import/export of syncobjs<br>
&gt; + * -------------------------<br>
&gt; + *<br>
&gt; + * The userspace syncobj API provides two mechanisms for import/expor=
t of<br>
&gt; + * syncobjs.<br>
&gt; + *<br>
&gt; + * The first lets the client import or export an entire syncobj to a =
file<br>
&gt; + * descriptor.<br>
&gt; + * These fd&#39;s are opaque and have no other use case, except passi=
ng the<br>
&gt; + * syncobj between processes.<br>
&gt; + * All syncobj handles which are created as the result of such an imp=
ort<br>
&gt; + * operation refer to the same underlying syncobj as was used for the=
<br>
&gt; + * export and the syncobj can be used persistently across all the pro=
cesses<br>
&gt; + * with which it is shared.<br>
&gt; + * Unlike dma-buf, importing a syncobj creates a new handle for every=
<br>
&gt; + * import instead of de-duplicating.<br>
&gt; + * The primary use-case of this persistent import/export is for share=
d<br>
&gt; + * Vulkan fences and semaphores.<br>
&gt; + *<br>
&gt; + * The second import/export mechanism lets the client export the sync=
obj&#39;s<br>
&gt; + * current fence to/from a &amp;sync_file.<br>
&gt; + * When a syncobj is exported to a sync file, that sync file wraps th=
e<br>
&gt; + * sycnobj&#39;s fence at the time of export and any later signal or =
reset<br>
&gt; + * operations on the syncobj will not affect the exported sync file.<=
br>
&gt; + * When a sync file is imported into a syncobj, the syncobj&#39;s fen=
ce is set<br>
&gt; + * to the fence wrapped by that sync file.<br>
&gt; + * Because sync files are immutable, resetting or signaling the synco=
bj<br>
&gt; + * will not affect any sync files whose fences have been imported int=
o the<br>
&gt; + * syncobj.<br>
&gt;=C2=A0 =C2=A0 *<br>
<br>
<br>
This 3 lines below seem to be redundant now?<br></blockquote><div><br></div=
><div>Which three lines are you referring to?=C2=A0 The thing about krefs?=
=C2=A0 I agree that it feels a bit odd with the rest of the documentation b=
ecause it&#39;s a very internal detail and the rest of what I&#39;ve writte=
n is an overview.=C2=A0 Maybe the bit about krefs should go in the top sect=
ion and the bit about the file should stay here?<br></div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
Maybe rephrase with something like :<br>
<br>
<br>
&quot;Sharing a syncobj increases its refcount. The syncobj is destroyed wh=
en <br>
a client release the last reference.&quot;<br></blockquote><div><br></div><=
div>I don&#39;t think we need to describe how reference counting works.<br>=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;=C2=A0 =C2=A0 * syncobj have a kref reference count, but also have an o=
ptional file.<br>
&gt;=C2=A0 =C2=A0 * The file is only created once the syncobj is exported.<=
br>
<br>
<br>
</blockquote></div></div>

--000000000000289ea5058f61a8b8--

--===============0134192232==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0134192232==--
