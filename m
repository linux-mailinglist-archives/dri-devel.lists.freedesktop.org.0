Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9321235D498
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 02:58:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D474189CF2;
	Tue, 13 Apr 2021 00:58:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C019A89CF2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 00:58:31 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id u4so17517224ljo.6
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 17:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G54XNfiUa6fmL9xyBH6PE+DJHSrMe5eje68mpIh8/Sw=;
 b=Ue/JycxqjtdpVE8LrjRfP0xpbAJjN0Nmwn4vG5hx7SBTsIufvY0EODYnkG7h5EWGwt
 jxgEzT88x6t9u5UaMyN+c0Qd7Sj4XQjakcIATICuki+TNR3c6EJVWb11TVHJKLotU3xm
 RtgKzQpALMH18QoYPBbB99tjm+6NuPtv6NsIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G54XNfiUa6fmL9xyBH6PE+DJHSrMe5eje68mpIh8/Sw=;
 b=SEq0zOU+Nrq92oQkavHHSYYTX0RzhC+CstCen4sz0uPIKGYCEeeJp4+ib6GKiwS6Kt
 IguesQZUcIb0iYy5s97VBvqVgviW0cRsEinl5tSyQmC6vNoBEn2trjLFgQbPwDkS+lGx
 KIVABj/l8cMvzgcPmP3VuVcjms/3xDCT05yMFroqY09ItKpTV0D2ENi7RjERDtwKNtcx
 VM+YSnk2lATu8oWcyQwufvnA0/hggq7UM9BUApJnzqICzmTk3Q8nWbP01QTwpmRbOg9Q
 dui4iK4dBFHAgFXXcNYKA4V14ZqExGrdyOTR+0ny/8nTRN9cMBWW0mBGM7S1YPZUyNJV
 9EbQ==
X-Gm-Message-State: AOAM531Zlq+IXfRkacdUhJAIOCbPGQTvAzNwxPtuB6NO9zNb8By7uVkn
 7/MwNXVkVG85DPQe8c1yzBUf8wa+sI3m0A==
X-Google-Smtp-Source: ABdhPJypGBJdG3CmlYQSvO43EhRz5ec9+K1n3HIRFFQ1WiIVHtbkL7N9KpvqESEebyq7yxgz0TYfIA==
X-Received: by 2002:a2e:85cb:: with SMTP id h11mr9937361ljj.12.1618275509826; 
 Mon, 12 Apr 2021 17:58:29 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com.
 [209.85.167.45])
 by smtp.gmail.com with ESMTPSA id 17sm2718953lfo.204.2021.04.12.17.58.29
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Apr 2021 17:58:29 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id x13so14341158lfr.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 17:58:29 -0700 (PDT)
X-Received: by 2002:ac2:599c:: with SMTP id w28mr10142882lfn.161.1618275509010; 
 Mon, 12 Apr 2021 17:58:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210401065324.vb44nfodohcgrdex@sirius.home.kraxel.org>
 <20210406203625.1727955-1-vivek.kasireddy@intel.com>
 <CAAfnVB=NUjUUUcABQhR3AhQPtdDu9uHZCsi+9Q90babp2AfOpg@mail.gmail.com>
 <20210408092740.c42sp32hku5d66ec@sirius.home.kraxel.org>
 <CAAfnVBkSVnDw23XkeaB-oj-bD5wu_-2rg3F+qMkBMezuD5mCkg@mail.gmail.com>
 <20210409074840.y3ddwbfanpscgydj@sirius.home.kraxel.org>
In-Reply-To: <20210409074840.y3ddwbfanpscgydj@sirius.home.kraxel.org>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Mon, 12 Apr 2021 17:58:16 -0700
X-Gmail-Original-Message-ID: <CAAfnVBmkEHB=j3rJyLPOixFRfPD=WQGVs85PuS0RYmViOgVAQA@mail.gmail.com>
Message-ID: <CAAfnVBmkEHB=j3rJyLPOixFRfPD=WQGVs85PuS0RYmViOgVAQA@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: Create Dumb BOs as guest Blobs (v2)
To: Gerd Hoffmann <kraxel@redhat.com>
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
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, "Zhang,
 Tina" <tina.zhang@intel.com>
Content-Type: multipart/mixed; boundary="===============1679861700=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1679861700==
Content-Type: multipart/alternative; boundary="000000000000dd453305bfd02083"

--000000000000dd453305bfd02083
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 9, 2021 at 12:48 AM Gerd Hoffmann <kraxel@redhat.com> wrote:

>   Hi,
>
> > > IIRC the VIRTGPU_BLOB_FLAG_USE_SHAREABLE flag means that the host *can*
> > > create a shared mapping (i.e. the host seeing guest-side changes
> without
> > > explicit transfer doesn't cause problems for the guest).  It doesn not
> > > mean the host *must* create a shared mapping (note that there is no
> > > negotiation whenever the host supports shared mappings or not).
> > >
> >
> > VIRTGPU_BLOB_FLAG_USE_SHAREABLE means guest userspace intends to share
> the
> > blob resource with another virtgpu driver instance via
> drmPrimeHandleToFd.
> > It's a rough analogue to VkExportMemoryAllocateInfoKHR or
> > PIPE_BIND_USE_SHARED.
>
> Oh.  My memory was failing me then.  We should *really* clarify the spec
> for BLOB_MEM_GUEST.


> So shared mappings are allowed for all BLOB_MEM_GUEST resources, right?
>

The guest iovecs are always shared with the host, so they may be copied
to/from directly depending on the operation.  In the case of RESOURCE_FLUSH
+ BLOB_MEM_GUEST, it could be a copy from the guest iovecs to the host
framebuffer [host framebuffer != host shadow memory].


>
> > > So the transfer calls are still needed, and the host can decide to
> > > shortcut them in case it can create a shared mapping.  In case there is
> > > no shared mapping (say due to missing udmabuf support) the host can
> > > fallback to copying.
> >
> > Transfers are a bit under-defined for BLOB_MEM_GUEST.  Even without
> udmabuf
> > on the host, there is no host side resource for guest-only blobs?  Before
> > blob resources, the dumb flow was:
> >
> > 1) update guest side resource
> > 2) TRANSFER_TO_HOST_2D to copy guest side contents to host side private
> > resource [Pixman??]
> > 3) RESOURCE_FLUSH to copy the host-side contents to the framebuffer and
> > page-flip
>
> Yes.
>
> > At least for crosvm, this is possible:
> >
> > 1) update guest side resource
> > 2) RESOURCE_FLUSH to copy the guest-side contents to the framebuffer and
> > pageflip
> >
> > With implicit udmabuf, it may be possible to do this:
> >
> > 1) update guest side resource
> > 2) RESOURCE_FLUSH to page-flip
> >
> > > So I think crosvm should be fixed to not consider transfer commands for
> > > VIRTGPU_BLOB_MEM_GUEST resources an error.
> >
> > It's a simple change to make and we can definitely do it, if TRANSFER_2D
> is
> > helpful for the QEMU case.  I haven't looked at the QEMU side patches.
>
> Well, we have two different cases:
>
>   (1) No udmabuf available.  qemu will have a host-side shadow then and
>       the workflow will be largely identical to the non-blob resource
>       workflow.
>

I think this is the key difference.  With BLOB_MEM_GUEST, crosvm can only
have a guest side iovecs and no host-side shadow memory.  With
BLOB_MEM_GUEST_HOST3D, host-side shadow memory will exist.

I guess it boils down the Pixman dependency.  crosvm sits right on top of
display APIs (X, wayland) rather than having intermediary layers.  Adding a
new Pixman API takes time too.

There's a bunch of options:

1) Don't use BLOB_MEM_GUEST dumb buffers in 3D mode.
2) virglrenderer or crosvm modified to implicitly ignore
TRANSFER_TO_HOST_2D for BLOB_MEM_GUEST when in 3D mode.
3) It's probably possible to create an implicit udmabuf
for RESOURCE_CREATE_2D resources and ignore the transfer there too.  The
benefit of this is TRANSFER_TO_HOST_2D makes a ton of sense for non-blob
resources.  No kernel side change needed here, just QEMU.
4) modify QEMU display integration

I would choose (1) since it solves the log spam problem and it advances
blob support in QEMU.  Though I leave the decision to QEMU devs.


>
>   (2) With udmabuf support.  qemu can create udmabufs for the resources,
>       mmap() the dmabuf to get a linear mapping, create a pixman buffer
>       backed by that dmabuf (no copying needed then).  Depending on
>       capabilities pass either the pixman image (gl=off) or the dmabuf
>       handle (gl=on) to the UI code to actually show the guest display.
>
> The guest doesn't need to know any of this, it'll just send transfer and
> flush commands.  In case (1) qemu must process the transfer commands and
> for case (2) qemu can simply ignore them.
>
> > For the PCI-passthrough + guest blob case, the end goal is to share it
> with
> > the host compositor.  If there is no guarantee the guest memory can be
> > converted to an OS-handle (to share with the host compositor), then I
> think
> > the guest user space should fallback to another technique involving
> > memcpy() to share the memory.
>
> This is what happens today (using non-blob resources).
>
> > So essentially, thinking for two new protocol additions:
> >
> > F_CREATE_GUEST_HANDLE (or F_HANDLE_FROM_GUEST) --> means an OS-specific
> > udmabuf-like mechanism exists on the host.
> >
> > BLOB_FLAG_CREATE_GUEST_HANDLE (or BLOB_FLAG_HANDLE_FROM_GUEST)--> tells
> > host userspace "you must create a udmabuf" [or OS-specific equivalent]
> upon
> > success
>
> Again:  Why do we actually need that?  Is there any benefit other than
> the guest knowing it doesn't need to send transfer commands?

I see the whole udmabuf thing as a host-side performance optimization
> and I think this should be fully transparent to the guest as the host
> can easily just ignore the transfer commands.


So the use case I'm most interested in (and Vivek/Tina?) is
tiled/compressed udmabufs, so they may be eventually shared with the host
compositor via the DRM modifier API.

Transfers to linear udmabufs make sense.  Maybe transfers to
tiled/compressed udmabufs shouldn't even be attempted.

It's a complicated case with many ambiguities, especially with PCI
passthrough involved.  Explicit tiled/compressed udmabufs are just an idea,
will have to think more about it / have some proof of concept [with virgl
and PCI passthrough], before making any concrete proposals.  Will keep your
idea of just ignoring transfers on the host in mind.


> Given we batch commands
> the extra commands don't lead to extra context switches, so there
> shouldn't be much overhead.
>
> If we really want make the guest aware of the hosts udmabuf state I
> think this should be designed the other way around:  Add some way for
> the host to tell the guest transfer commands are not needed for a
> specific BLOB_MEM_GUEST resource.
>
> take care,
>   Gerd
>
>

--000000000000dd453305bfd02083
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 9, 2021 at 12:48 AM Gerd =
Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0 H=
i,<br>
<br>
&gt; &gt; IIRC the VIRTGPU_BLOB_FLAG_USE_SHAREABLE flag means that the host=
 *can*<br>
&gt; &gt; create a shared mapping (i.e. the host seeing guest-side changes =
without<br>
&gt; &gt; explicit transfer doesn&#39;t cause problems for the guest).=C2=
=A0 It doesn not<br>
&gt; &gt; mean the host *must* create a shared mapping (note that there is =
no<br>
&gt; &gt; negotiation whenever the host supports shared mappings or not).<b=
r>
&gt; &gt;<br>
&gt; <br>
&gt; VIRTGPU_BLOB_FLAG_USE_SHAREABLE means guest userspace intends to share=
 the<br>
&gt; blob resource with another virtgpu driver instance via drmPrimeHandleT=
oFd.<br>
&gt; It&#39;s a rough analogue to VkExportMemoryAllocateInfoKHR or<br>
&gt; PIPE_BIND_USE_SHARED.<br>
<br>
Oh.=C2=A0 My memory was failing me then.=C2=A0 We should *really* clarify t=
he spec<br>
for BLOB_MEM_GUEST.=C2=A0</blockquote><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
<br>
So shared mappings are allowed for all BLOB_MEM_GUEST resources, right?<br>=
</blockquote><div><br></div><div><div>The guest iovecs are always shared wi=
th the host, so they may be copied to/from directly depending on the operat=
ion.=C2=A0 In the case of RESOURCE_FLUSH + BLOB_MEM_GUEST, it could be a co=
py from the guest iovecs to the host framebuffer [host framebuffer !=3D hos=
t shadow memory].</div><div></div></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
&gt; &gt; So the transfer calls are still needed, and the host can decide t=
o<br>
&gt; &gt; shortcut them in case it can create a shared mapping.=C2=A0 In ca=
se there is<br>
&gt; &gt; no shared mapping (say due to missing udmabuf support) the host c=
an<br>
&gt; &gt; fallback to copying.<br>
&gt; <br>
&gt; Transfers are a bit under-defined for BLOB_MEM_GUEST.=C2=A0 Even witho=
ut udmabuf<br>
&gt; on the host, there is no host side resource for guest-only blobs?=C2=
=A0 Before<br>
&gt; blob resources, the dumb flow was:<br>
&gt; <br>
&gt; 1) update guest side resource<br>
&gt; 2) TRANSFER_TO_HOST_2D to copy guest side contents to host side privat=
e<br>
&gt; resource [Pixman??]<br>
&gt; 3) RESOURCE_FLUSH to copy the host-side contents to the framebuffer an=
d<br>
&gt; page-flip<br>
<br>
Yes.<br>
<br>
&gt; At least for crosvm, this is possible:<br>
&gt; <br>
&gt; 1) update guest side resource<br>
&gt; 2) RESOURCE_FLUSH to copy the guest-side contents to the framebuffer a=
nd<br>
&gt; pageflip<br>
&gt; <br>
&gt; With implicit udmabuf, it may be possible to do this:<br>
&gt; <br>
&gt; 1) update guest side resource<br>
&gt; 2) RESOURCE_FLUSH to page-flip<br>
&gt; <br>
&gt; &gt; So I think crosvm should be fixed to not consider transfer comman=
ds for<br>
&gt; &gt; VIRTGPU_BLOB_MEM_GUEST resources an error.<br>
&gt; <br>
&gt; It&#39;s a simple change to make and we can definitely do it, if TRANS=
FER_2D is<br>
&gt; helpful for the QEMU case.=C2=A0 I haven&#39;t looked at the QEMU side=
 patches.<br>
<br>
Well, we have two different cases:<br>
<br>
=C2=A0 (1) No udmabuf available.=C2=A0 qemu will have a host-side shadow th=
en and<br>
=C2=A0 =C2=A0 =C2=A0 the workflow will be largely identical to the non-blob=
 resource<br>
=C2=A0 =C2=A0 =C2=A0 workflow.<br></blockquote><div><br></div><div><div>I t=
hink this is the key difference.=C2=A0 With BLOB_MEM_GUEST, crosvm can only=
 have a guest side iovecs and no host-side shadow memory.=C2=A0 With BLOB_M=
EM_GUEST_HOST3D, host-side shadow memory will exist.<br></div><div><br></di=
v><div>I guess it boils down the Pixman dependency.=C2=A0 crosvm sits right=
 on top of display APIs (X, wayland) rather than having intermediary=C2=A0l=
ayers.=C2=A0 Adding a new Pixman API takes time too.</div><div><br></div><d=
iv>There&#39;s a bunch of options:</div><div><br></div><div>1) Don&#39;t us=
e BLOB_MEM_GUEST dumb buffers in 3D mode.</div><div>2) virglrenderer or cro=
svm modified to implicitly ignore TRANSFER_TO_HOST_2D for=C2=A0BLOB_MEM_GUE=
ST when in 3D mode.</div><div>3) It&#39;s probably possible to create an im=
plicit udmabuf for=C2=A0RESOURCE_CREATE_2D resources and ignore the transfe=
r there too.=C2=A0 The benefit of this is TRANSFER_TO_HOST_2D makes a ton o=
f sense for non-blob resources.=C2=A0 No kernel side change needed here, ju=
st QEMU.</div><div>4) modify QEMU display integration</div><div><br></div><=
div>I would choose (1) since it solves the log spam problem and it advances=
 blob support in QEMU.=C2=A0 Though I leave the decision to QEMU devs.</div=
><div></div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
=C2=A0 (2) With udmabuf support.=C2=A0 qemu can create udmabufs for the res=
ources,<br>
=C2=A0 =C2=A0 =C2=A0 mmap() the dmabuf to get a linear mapping, create a pi=
xman buffer<br>
=C2=A0 =C2=A0 =C2=A0 backed by that dmabuf (no copying needed then).=C2=A0 =
Depending on<br>
=C2=A0 =C2=A0 =C2=A0 capabilities pass either the pixman image (gl=3Doff) o=
r the dmabuf<br>
=C2=A0 =C2=A0 =C2=A0 handle (gl=3Don) to the UI code to actually show the g=
uest display.<br>
<br>
The guest doesn&#39;t need to know any of this, it&#39;ll just send transfe=
r and<br>
flush commands.=C2=A0 In case (1) qemu must process the transfer commands a=
nd<br>
for case (2) qemu can simply ignore them.<br>
<br>
&gt; For the PCI-passthrough + guest blob case, the end goal is to share it=
 with<br>
&gt; the host compositor.=C2=A0 If there is no guarantee the guest memory c=
an be<br>
&gt; converted to an OS-handle (to share with the host compositor), then I =
think<br>
&gt; the guest user space should fallback to another technique involving<br=
>
&gt; memcpy() to share the memory.<br>
<br>
This is what happens today (using non-blob resources).<br>
<br>
&gt; So essentially, thinking for two new protocol additions:<br>
&gt; <br>
&gt; F_CREATE_GUEST_HANDLE (or F_HANDLE_FROM_GUEST) --&gt; means an OS-spec=
ific<br>
&gt; udmabuf-like mechanism exists on the host.<br>
&gt; <br>
&gt; BLOB_FLAG_CREATE_GUEST_HANDLE (or BLOB_FLAG_HANDLE_FROM_GUEST)--&gt; t=
ells<br>
&gt; host userspace &quot;you must create a udmabuf&quot; [or OS-specific e=
quivalent] upon<br>
&gt; success<br>
<br>
Again:=C2=A0 Why do we actually need that?=C2=A0 Is there any benefit other=
 than<br>
the guest knowing it doesn&#39;t need to send transfer commands?</blockquot=
e><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
I see the whole udmabuf thing as a host-side performance optimization<br>
and I think this should be fully transparent to the guest as the host<br>
can easily just ignore the transfer commands.=C2=A0 </blockquote><div><br><=
/div><div>So the use case I&#39;m most interested in (and Vivek/Tina?) is t=
iled/compressed udmabufs, so they may be eventually shared with the host co=
mpositor via the DRM=C2=A0modifier=C2=A0API.<div><br></div><div>Transfers t=
o linear udmabufs make sense.=C2=A0 Maybe transfers to tiled/compressed udm=
abufs=C2=A0shouldn&#39;t even be attempted.=C2=A0=C2=A0</div><div><br></div=
><div>It&#39;s a complicated case with many ambiguities, especially with PC=
I passthrough involved.=C2=A0 Explicit tiled/compressed udmabufs are just a=
n idea, will have to think more about it / have some proof of concept [with=
 virgl and PCI passthrough], before making any concrete proposals.=C2=A0 Wi=
ll keep your idea of just ignoring transfers on the host=C2=A0in mind.</div=
></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">G=
iven we batch commands<br>
the extra commands don&#39;t lead to extra context switches, so there<br>
shouldn&#39;t be much overhead.<br>
<br>
If we really want make the guest aware of the hosts udmabuf state I<br>
think this should be designed the other way around:=C2=A0 Add some way for<=
br>
the host to tell the guest transfer commands are not needed for a<br>
specific BLOB_MEM_GUEST resource.<br>
<br>
take care,<br>
=C2=A0 Gerd<br>
<br>
</blockquote></div></div>

--000000000000dd453305bfd02083--

--===============1679861700==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1679861700==--
