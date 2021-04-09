Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C02C3590E9
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 02:31:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F0CC6E42C;
	Fri,  9 Apr 2021 00:31:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E9286E42C
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 00:31:33 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id j18so6956374lfg.5
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Apr 2021 17:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/ThjHaZh4WPNgcMTwl7Cj5D13AI/YpRBLjW7hgiMLjM=;
 b=Btq4qaWvlWrg9d0EZNBtqWQg3oj9P9bhm+BWgJ6g5Dn+V6PPTA1/09t6QiBLbly3J/
 3loYBB5veCZT6ifqsuBDy9h9Abw4aSYal4yM68PFm+FFNoY63G/q8kZ04Deb8FlFZ2hG
 6ZXkfScjrB0RGIMFqG247FtqS06zu5AAQnI68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/ThjHaZh4WPNgcMTwl7Cj5D13AI/YpRBLjW7hgiMLjM=;
 b=jY4OQt3OyfEpq0aDZ07nFBxOjN0kM9FTPnKLQsjn/3107cU1+5dxCa0/AJEup3kP3H
 nQu/ld8vmz9V19Nrzgt7eMM18z9vJHCoEpM51OpiF1QXlgjDg3be5uTVAKRjikWJU9OJ
 akDiDGvxo/Fb2q8rrfhXCPqwSZ2lDzYKyJLIhATBYkbjPTMw8pMz28JFSslgp63Cdctb
 7ZYvBIJx7P4Fpwt7AL1Bcb7GZ4vC6LF3gPdH6Oi2KQv2mvYioBKtQncOW8rxsx3NdxeS
 Q72P2/FMvMUbtjlKiYrpsoYmZr/I/OV0qzCPQ0irwmeBNuw5jz7vLEDb9c1Z6SAGpDvd
 MTJQ==
X-Gm-Message-State: AOAM532C79VnK4ircldSxmKGZ0CHBBVX7E1L+n/EwZIP8qAhTMdRvoms
 KVbEzUjDLZtPwXIPpk5jsaYkQDttoSS7xw==
X-Google-Smtp-Source: ABdhPJzbnRyQAiid5a4RR7FEvH9lbdAR6yu2f4XEDOft0BsLvK3udTIQd63Yjtd+GClTSrQBQOA5WA==
X-Received: by 2002:ac2:5615:: with SMTP id v21mr8437397lfd.212.1617928291527; 
 Thu, 08 Apr 2021 17:31:31 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com.
 [209.85.208.176])
 by smtp.gmail.com with ESMTPSA id b10sm98265lfq.52.2021.04.08.17.31.30
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Apr 2021 17:31:31 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id s17so4397932ljc.5
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Apr 2021 17:31:30 -0700 (PDT)
X-Received: by 2002:a2e:965a:: with SMTP id z26mr7872013ljh.10.1617928290462; 
 Thu, 08 Apr 2021 17:31:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210401065324.vb44nfodohcgrdex@sirius.home.kraxel.org>
 <20210406203625.1727955-1-vivek.kasireddy@intel.com>
 <CAAfnVB=NUjUUUcABQhR3AhQPtdDu9uHZCsi+9Q90babp2AfOpg@mail.gmail.com>
 <20210408092740.c42sp32hku5d66ec@sirius.home.kraxel.org>
In-Reply-To: <20210408092740.c42sp32hku5d66ec@sirius.home.kraxel.org>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Thu, 8 Apr 2021 17:31:18 -0700
X-Gmail-Original-Message-ID: <CAAfnVBkSVnDw23XkeaB-oj-bD5wu_-2rg3F+qMkBMezuD5mCkg@mail.gmail.com>
Message-ID: <CAAfnVBkSVnDw23XkeaB-oj-bD5wu_-2rg3F+qMkBMezuD5mCkg@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============1379272399=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1379272399==
Content-Type: multipart/alternative; boundary="0000000000000710f205bf7f493a"

--0000000000000710f205bf7f493a
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 8, 2021 at 2:27 AM Gerd Hoffmann <kraxel@redhat.com> wrote:

> > > +
> > > +       if (vgdev->has_resource_blob) {
> > > +               params.blob_mem = VIRTGPU_BLOB_MEM_GUEST;
> > > +               params.blob_flags = VIRTGPU_BLOB_FLAG_USE_SHAREABLE;
> > >
> >
> > This creates some log spam with crosvm + virgl_3d + vanilla linux, since
> > transfers don't work for guest blobs.  Two options:
> >
> > a) Add vgdev->has_virgl_3d check and don't create a guest blob in that
> case.
> > b) The interactions between TRANSFER_TO_HOST_2D and
> VIRTGPU_BLOB_MEM_GUEST
> > are a bit under-defined in the spec.
>
> Indeed.
>
> > Though since you don't have a host
> > side resource, you can safely skip the transfer and crosvm can be
> modified
> > to do the right thing in case of RESOURCE_FLUSH.
>
> IIRC the VIRTGPU_BLOB_FLAG_USE_SHAREABLE flag means that the host *can*
> create a shared mapping (i.e. the host seeing guest-side changes without
> explicit transfer doesn't cause problems for the guest).  It doesn not
> mean the host *must* create a shared mapping (note that there is no
> negotiation whenever the host supports shared mappings or not).
>

VIRTGPU_BLOB_FLAG_USE_SHAREABLE means guest userspace intends to share the
blob resource with another virtgpu driver instance via drmPrimeHandleToFd.
It's a rough analogue to VkExportMemoryAllocateInfoKHR or
PIPE_BIND_USE_SHARED.

The dumb case is a bit interesting because there is no userspace to provide
that information.  Though I think even VIRTGPU_BLOB_FLAG_USE_MAPPABLE is
fine, since for my vanilla Linux setup, I'm seeing the guest blob is mapped
only and drmPrimeHandleToFd(..) isn't called on it.  We can also modify the
virtio-gpu spec to say "blob_flags may be undefined/zero for BLOB_MEM_GUEST
when 3D mode is not on".

Though all options work for me.  The implicit dumb blob udmabuf case for me
is more about advancing blob development rather than being super rigorous.


>
> So the transfer calls are still needed, and the host can decide to
> shortcut them in case it can create a shared mapping.  In case there is
> no shared mapping (say due to missing udmabuf support) the host can
> fallback to copying.
>

Transfers are a bit under-defined for BLOB_MEM_GUEST.  Even without udmabuf
on the host, there is no host side resource for guest-only blobs?  Before
blob resources, the dumb flow was:

1) update guest side resource
2) TRANSFER_TO_HOST_2D to copy guest side contents to host side private
resource [Pixman??]
3) RESOURCE_FLUSH to copy the host-side contents to the framebuffer and
page-flip

At least for crosvm, this is possible:

1) update guest side resource
2) RESOURCE_FLUSH to copy the guest-side contents to the framebuffer and
pageflip

With implicit udmabuf, it may be possible to do this:

1) update guest side resource
2) RESOURCE_FLUSH to page-flip

So I think crosvm should be fixed to not consider transfer commands for
> VIRTGPU_BLOB_MEM_GUEST resources an error.
>

It's a simple change to make and we can definitely do it, if TRANSFER_2D is
helpful for the QEMU case.  I haven't looked at the QEMU side patches.


> > It makes a ton of sense to have a explicit udmabuf-like flag
> > ("BLOB_FLAG_CREATE_GUEST_HANDLE" or "BLOB_FLAG_HANDLE_FROM_GUEST" -- want
> > to host OS agnostic -- any other ideas?), especially with 3d mode.
>
> Why?  Can't this be simply an host implementation detail which the guest
> doesn't need to worry about?
>

For 3D mode, it's desirable to create an {EGL image}/{VkDeviceMemory} from
guest memory for certain zero-copy use cases.  If no explicit
guarantee exists for the paravirtualized user-space that there will be a
host side OS-specific handle associated with guest memory, then guest user
space must fall-back to old-style transfers.

For the PCI-passthrough + guest blob case, the end goal is to share it with
the host compositor.  If there is no guarantee the guest memory can be
converted to an OS-handle (to share with the host compositor), then I think
the guest user space should fallback to another technique involving
memcpy() to share the memory.

So essentially, thinking for two new protocol additions:

F_CREATE_GUEST_HANDLE (or F_HANDLE_FROM_GUEST) --> means an OS-specific
udmabuf-like mechanism exists on the host.

BLOB_FLAG_CREATE_GUEST_HANDLE (or BLOB_FLAG_HANDLE_FROM_GUEST)--> tells
host userspace "you must create a udmabuf" [or OS-specific equivalent] upon
success

Though much testing/work remains (both with the PCI passthough case +
virgl3d case), could be a good chance to float the nomenclature by
everyone.  Happy to collaborate further with Tina/Vivek on making such a
thing happen.


>
> take care,
>   Gerd
>
>

--0000000000000710f205bf7f493a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 8, 2021 at 2:27 AM Gerd H=
offmann &lt;<a href=3D"mailto:kraxel@redhat.com" target=3D"_blank">kraxel@r=
edhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (vgdev-&gt;has_resource_blob) {<br=
>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0params.bl=
ob_mem =3D VIRTGPU_BLOB_MEM_GUEST;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0params.bl=
ob_flags =3D VIRTGPU_BLOB_FLAG_USE_SHAREABLE;<br>
&gt; &gt;<br>
&gt; <br>
&gt; This creates some log spam with crosvm + virgl_3d + vanilla linux, sin=
ce<br>
&gt; transfers don&#39;t work for guest blobs.=C2=A0 Two options:<br>
&gt; <br>
&gt; a) Add vgdev-&gt;has_virgl_3d check and don&#39;t create a guest blob =
in that case.<br>
&gt; b) The interactions between TRANSFER_TO_HOST_2D and VIRTGPU_BLOB_MEM_G=
UEST<br>
&gt; are a bit under-defined in the spec.<br>
<br>
Indeed.<br>
<br>
&gt; Though since you don&#39;t have a host<br>
&gt; side resource, you can safely skip the transfer and crosvm can be modi=
fied<br>
&gt; to do the right thing in case of RESOURCE_FLUSH.<br>
<br>
IIRC the VIRTGPU_BLOB_FLAG_USE_SHAREABLE flag means that the host *can*<br>
create a shared mapping (i.e. the host seeing guest-side changes without<br=
>
explicit transfer doesn&#39;t cause problems for the guest).=C2=A0 It doesn=
 not<br>
mean the host *must* create a shared mapping (note that there is no<br>
negotiation whenever the host supports shared mappings or not).<br></blockq=
uote><div><br></div><div><div>VIRTGPU_BLOB_FLAG_USE_SHAREABLE means guest u=
serspace intends to share the blob resource with another virtgpu driver ins=
tance via drmPrimeHandleToFd.=C2=A0 It&#39;s a rough analogue to=C2=A0VkExp=
ortMemoryAllocateInfoKHR or PIPE_BIND_USE_SHARED.<br></div><div><br></div><=
div><div>The dumb case is a bit interesting because there is no userspace t=
o provide that information.=C2=A0 Though I think even VIRTGPU_BLOB_FLAG_USE=
_MAPPABLE is fine, since for my vanilla Linux setup, I&#39;m seeing the gue=
st blob is mapped only and drmPrimeHandleToFd(..) isn&#39;t called on it.=
=C2=A0 We can also modify the virtio-gpu spec to say &quot;blob_flags may b=
e undefined/zero for BLOB_MEM_GUEST when 3D mode is not on&quot;.</div><div=
><br></div><div><div>Though all options work for me.=C2=A0 The implicit dum=
b blob udmabuf case for me is more about advancing blob development rather =
than being super rigorous.</div><div></div></div><div></div></div><div></di=
v></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
So the transfer calls are still needed, and the host can decide to<br>
shortcut them in case it can create a shared mapping.=C2=A0 In case there i=
s<br>
no shared mapping (say due to missing udmabuf support) the host can<br>
fallback to copying.<br></blockquote><div><br></div><div>Transfers are a bi=
t under-defined for BLOB_MEM_GUEST.=C2=A0 Even without udmabuf on the host,=
 there is no host side resource for guest-only blobs?=C2=A0 Before blob res=
ources, the dumb flow was:</div><div><br></div><div><div>1) update guest si=
de resource</div><div>2) TRANSFER_TO_HOST_2D to copy guest side contents to=
 host side private resource [Pixman??]</div><div>3) RESOURCE_FLUSH to copy =
the host-side contents to the framebuffer and page-flip</div><div><br></div=
><div>At least for crosvm, this is possible:</div><div><br></div><div><div>=
1) update guest side resource</div><div>2) RESOURCE_FLUSH to copy the guest=
-side contents to the framebuffer and pageflip<br></div><div><br></div><div=
>With implicit udmabuf, it may be possible to do this:</div><div><br></div>=
<div><div>1) update guest side resource</div><div>2) RESOURCE_FLUSH to page=
-flip</div></div></div></div><div><br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
So I think crosvm should be fixed to not consider transfer commands for<br>
VIRTGPU_BLOB_MEM_GUEST resources an error.<br></blockquote><div><br></div><=
div>It&#39;s a simple change to make and we can definitely do it, if TRANSF=
ER_2D is helpful for the QEMU case.=C2=A0 I haven&#39;t looked at the QEMU =
side patches.</div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
&gt; It makes a ton of sense to have a explicit udmabuf-like flag<br>
&gt; (&quot;BLOB_FLAG_CREATE_GUEST_HANDLE&quot; or &quot;BLOB_FLAG_HANDLE_F=
ROM_GUEST&quot; -- want<br>
&gt; to host OS agnostic -- any other ideas?), especially with 3d mode.<br>
<br>
Why?=C2=A0 Can&#39;t this be simply an host implementation detail which the=
 guest<br>
doesn&#39;t need to worry about?<br></blockquote><div><br></div><div><div>F=
or 3D mode, it&#39;s desirable to create an {EGL image}/{VkDeviceMemory} fr=
om guest memory for certain zero-copy use cases.=C2=A0 If no explicit guara=
ntee=C2=A0exists for the paravirtualized user-space that there will be a ho=
st side OS-specific handle associated with guest memory, then guest user sp=
ace must fall-back to old-style transfers.</div><div><br></div><div>For the=
 PCI-passthrough=C2=A0+ guest blob case, the end goal is to share it with t=
he host compositor.=C2=A0 If there is no guarantee the=C2=A0guest memory ca=
n be converted to an OS-handle=C2=A0(to share with the host compositor), th=
en I think the guest user space should fallback to another technique involv=
ing memcpy() to share the memory.</div><div><br></div><div><div>So essentia=
lly, thinking for two new protocol additions:</div><div><br></div><div>F_CR=
EATE_GUEST_HANDLE (or F_HANDLE_FROM_GUEST) --&gt; means an OS-specific udma=
buf-like=C2=A0mechanism exists on the host.<br></div><div><br></div><div>BL=
OB_FLAG_CREATE_GUEST_HANDLE (or BLOB_FLAG_HANDLE_FROM_GUEST)--&gt; tells ho=
st userspace &quot;you must create a udmabuf&quot; [or OS-specific equivale=
nt] upon success</div></div><div><br></div><div>Though much testing/work re=
mains (both with the PCI passthough case + virgl3d case), could be a good c=
hance to float the nomenclature by everyone.=C2=A0 Happy to collaborate fur=
ther with Tina/Vivek on making such a thing happen.</div></div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
take care,<br>
=C2=A0 Gerd<br>
<br>
</blockquote></div></div>

--0000000000000710f205bf7f493a--

--===============1379272399==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1379272399==--
