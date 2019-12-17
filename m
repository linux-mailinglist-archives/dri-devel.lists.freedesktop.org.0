Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBD7123416
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 19:01:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D65426E079;
	Tue, 17 Dec 2019 18:01:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81D786E051
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 18:01:39 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id l8so8817979edw.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 10:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ysq0JiYnnyw8JDm3jEJ1itx35mVDFfz+z5DAE7Tg89k=;
 b=o3UhybvDKUWF+h2eXiWXORUgLbonchniru7qySRmwicGQPz0iXgtzL96k2NkIe7dNl
 ZUHJylnnyEm1eNK5Y/1hHlkjxbGqfwxCdG6KMAZO8UI2Wwr+uo5Kx1oNW0s3U8gfo7Ol
 pUEppB3gw6Ot9+tcGvaOy3ErfWYZMrAc26Mt1xqLATa4FQbjZgadSOO5UVHFO+MtX5+O
 ccF93ky6Rd+2iyMPFLqLXW1K7qEPDv5W8GTYy896rwHFSikEz4e0Yo0GkfOPFWENYgT8
 LGKWZQZn6UmswC7sdMhmp0dbLCnTtJyK4OzksdLkv5SVv6z9nYLeIsld0qbkXwjjmW7c
 /zgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ysq0JiYnnyw8JDm3jEJ1itx35mVDFfz+z5DAE7Tg89k=;
 b=mVi828zhtC6E4d7cEfPySBTeoGNT2LjykK10+XjhNM7z844aL+/BuO52AadqfDGBS7
 bFH9QKEp5NwY+MbzIa1F5VOL2zisgBrSTF7NjvIxOZ/raZXLQdQ8G92npLDwmyjXC3Lw
 42fiAepMKYLVPBx9I8Zbu28ixz755SWnE/046i5TYSOm6Z45q81g6mMzEhvE3sVLElPe
 zNAuKPbvkWEv22FUSrfPKlOuw/0P5CKnedjyHW87hnXDrbQH82fln1HafTX4YE6ojig3
 8po8ej3vfS+NUrw9kZT9kV3JbmrJA1KSAeHnElsatRlJQ6929vM7Kiedm4cbfJS6rXJ0
 5gNw==
X-Gm-Message-State: APjAAAUX1NPJxF+CK0iN1fPUqvsGgvkT0YTZXFEqM6NlLUgt7wI+8y0q
 Pj6yTAuJ77C1AN21PdyNdsxBEcOFCIGiSaT3Qx+bYg==
X-Google-Smtp-Source: APXvYqyVAqQ3V0xWwjEXoADLFWjW3OWOwBuDq+GDpzTJVV0siDLUzcpOT0GtjCH7yjt8BXC0spL20KOWR/fs0J1BrLc=
X-Received: by 2002:a05:6402:355:: with SMTP id
 r21mr6791721edw.60.1576605698035; 
 Tue, 17 Dec 2019 10:01:38 -0800 (PST)
MIME-Version: 1.0
References: <20191213215614.24558-1-niranjana.vishwanathapura@intel.com>
 <20191213215614.24558-3-niranjana.vishwanathapura@intel.com>
 <CAOFGe95rC8A4SuwWtd1tbikw8HGm-TU52_O8iBSJKpDyY0gWNw@mail.gmail.com>
 <20191213231322.GS14488@nvishwa1-DESK.sc.intel.com>
 <CAOFGe97yh5CGTwoP-f3wRGWoTLuWMvMwYFc5Hx3KOkT9XkOxkw@mail.gmail.com>
 <157631949753.7535.12359359451927943176@skylake-alporthouse-com>
 <20191216041326.GT14488@nvishwa1-DESK.sc.intel.com>
In-Reply-To: <20191216041326.GT14488@nvishwa1-DESK.sc.intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Tue, 17 Dec 2019 12:01:26 -0600
Message-ID: <CAOFGe94gcWzbizCO9N1DmV-2joXwUF-ri5f7=PTg-VJuQ9Ljtg@mail.gmail.com>
Subject: Re: [Intel-gfx] [RFC v2 02/12] drm/i915/svm: Runtime (RT) allocator
 support
To: Niranjan Vishwanathapura <niranjana.vishwanathapura@intel.com>
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
Cc: "Graunke, Kenneth W" <kenneth.w.graunke@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>, sanjay.k.kumar@intel.com,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason.ekstrand@intel.com>, dave.hansen@intel.com,
 jglisse@redhat.com, jgg@mellanox.com, Daniel Vetter <daniel.vetter@intel.com>,
 dan.j.williams@intel.com, ira.weiny@intel.com
Content-Type: multipart/mixed; boundary="===============1616392302=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1616392302==
Content-Type: multipart/alternative; boundary="000000000000952b1c0599ea1e57"

--000000000000952b1c0599ea1e57
Content-Type: text/plain; charset="UTF-8"

On Sun, Dec 15, 2019 at 10:24 PM Niranjan Vishwanathapura <
niranjana.vishwanathapura@intel.com> wrote:

> On Sat, Dec 14, 2019 at 10:31:37AM +0000, Chris Wilson wrote:
> >Quoting Jason Ekstrand (2019-12-14 00:36:19)
> >> On Fri, Dec 13, 2019 at 5:24 PM Niranjan Vishwanathapura <
> >> niranjana.vishwanathapura@intel.com> wrote:
> >>
> >>     On Fri, Dec 13, 2019 at 04:58:42PM -0600, Jason Ekstrand wrote:
> >>     >
> >>     >     +/**
> >>     >     + * struct drm_i915_gem_vm_bind
> >>     >     + *
> >>     >     + * Bind an object in a vm's page table.
> >>     >
> >>     >   First off, this is something I've wanted for a while for
> Vulkan, it's
> >>     just
> >>     >   never made its way high enough up the priority list.  However,
> it's
> >>     going
> >>     >   to have to come one way or another soon.  I'm glad to see
> kernel API
> >>     for
> >>     >   this being proposed.
> >>     >   I do, however, have a few high-level comments/questions about
> the API:
> >>     >    1. In order to be useful for sparse memory support, the API
> has to go
> >>     the
> >>     >   other way around so that it binds a VA range to a range within
> the BO.
> >>     It
> >>     >   also needs to be able to handle overlapping where two different
> VA
> >>     ranges
> >>     >   may map to the same underlying bytes in the BO.  This likely
> means that
> >>     >   unbind needs to also take a VA range and only unbind that range.
> >>     >    2. If this is going to be useful for managing GL's address
> space where
> >>     we
> >>     >   have lots of BOs, we probably want it to take a list of ranges
> so we
> >>     >   aren't making one ioctl for each thing we want to bind.
> >>
> >>     Hi Jason,
> >>
> >>     Yah, some of these requirements came up.
> >>
> >>
> >> Yes, I have raised them every single time an API like this has come
> across my
> >> e-mail inbox for years and they continue to get ignored.  Why are we
> landing an
> >> API that we know isn't the API we want especially when it's pretty
> obvious
> >> roughly what the API we want is?  It may be less time in the short
> term, but
> >> long-term it means two ioctls and two implementations in i915, IGT
> tests for
> >> both code paths, and code in all UMDs to call one or the other
> depending on
> >> what kernel you're running on, and we have to maintain all that code
> going
> >> forward forever.  Sure, that's a price we pay today for a variety of
> things but
> >> that's because they all seemed like the right thing at the time.
> Landing the
> >> wrong API when we know it's the wrong API seems foolish.
> >
> >Exactly. This is not even close to the uAPI we need. Reposting an RFC
> >without taking in the concerns last time (or the time before that, or
> >the time before that...) suggests that you aren't really requesting for
> >comments at all.
>
> Thanks Jason for detailed exlanation.
> Chris, all comments and guidance are much appreciated :)
>
> I haven't looked in detail, but my concern is that implementing
> partial object binding (offset, lenght) from vma down to [un]binding
> in ppgtt might be a lot of work to include in this SVM patch series.
> I believe we need the partial object binding in non-SVM scenario
> as well?
>

Yes, the Vulkan APIs require both partial binding and aliasing.

It may be worth pointing out that we're already doing some of this stuff
today, although in a rather backwards way.  Our non-softpin model for
Vulkan uses a memfd which we then map in userspace and turn into a BO via
userptr.  Due to the way we handle threading in the driver, we end up with
multiple BOs pointing to the same overlapping range in the memfd and hence
the same pages.  That doesn't mean that everything in the path is already
set up for what you need but the VA -> page mappings should be.  Also,
avoiding these kinds of shinanigans is exactly why we want a "real" kernel
API for this. :-)


> Ok, let me change the interface as below.
>
> struct drm_i915_gem_vm_bind_va
> {
>         /** VA start to bind **/
>         __u64 start;
>
>         /** Offset in Object to bind for I915_GEM_VM_BIND_SVM_OBJ type **/
>         __u64 offset;
>
>         /** VA length to [un]bind **/
>         __u64 length;
>
>         /** Type of memory to [un]bind **/
>         __u32 type;
> #define I915_GEM_VM_BIND_SVM_OBJ      0
> #define I915_GEM_VM_BIND_SVM_BUFFER   1
>
>         /** Object handle to [un]bind for I915_GEM_VM_BIND_SVM_OBJ type **/
>         __u32 handle;
>
>         /** Flags **/
>         __u32 flags;
> #define I915_GEM_VM_BIND_UNBIND      (1 << 0)
> #define I915_GEM_VM_BIND_READONLY    (1 << 1)
> }
>
> struct drm_i915_gem_vm_bind {
>         /** vm to [un]bind **/
>         __u32 vm_id;
>
>         /** number of VAs to bind **/
>         __u32 num_vas;
>
>         /** Array of VAs to bind **/
>         struct drm_i915_gem_vm_bind_va *bind_vas;
>
>         /** User extensions **/
>         __u64 extensions;
> };
>
> When synchronization control is added as extension, it applies to all VAs
> in the array.
> Does this looks good?
>

Yes, I think that header looks good.  It's probably fine if synchronization
comes later.

I have two more questions (more for my own education than anything):

 1. What is the difference between a SVM object and a buffer?

 2. I see a vm_id but there is no context.  What (if any) are the
synchronization guarantees between the VM_BIND ioctl and EXECBUF?  If I
VM_BIND followed by EXECBUF is it guaranteed to happen in that order?  What
if I EXECBUF and then VM_BIND to unbind something?  If I VM_BIND while an
execbuf is happening but I have some way of delaying the GPU work from the
CPU and I unblock it once the VM_BIND comes back, is that ok?

If those questions are answered by other patches, feel free to just point
me at them instead of answering in detail here.

--Jason

--000000000000952b1c0599ea1e57
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Sun, Dec 15, 2019 at 10:24 PM Niranjan Vishwanathapura &lt;<a hre=
f=3D"mailto:niranjana.vishwanathapura@intel.com">niranjana.vishwanathapura@=
intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Sat, Dec 14, 2019 at 10:31:37AM +0000, Chris Wilson wrote:<br=
>
&gt;Quoting Jason Ekstrand (2019-12-14 00:36:19)<br>
&gt;&gt; On Fri, Dec 13, 2019 at 5:24 PM Niranjan Vishwanathapura &lt;<br>
&gt;&gt; <a href=3D"mailto:niranjana.vishwanathapura@intel.com" target=3D"_=
blank">niranjana.vishwanathapura@intel.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0On Fri, Dec 13, 2019 at 04:58:42PM -0600, Jason=
 Ekstrand wrote:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+/**<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+ * struct drm_i915_gem=
_vm_bind<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+ *<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+ * Bind an object in a=
 vm&#39;s page table.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0First off, this is something I=
&#39;ve wanted for a while for Vulkan, it&#39;s<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0just<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0never made its way high enough=
 up the priority list.=C2=A0 However, it&#39;s<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0going<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0to have to come one way or ano=
ther soon.=C2=A0 I&#39;m glad to see kernel API<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0for<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0this being proposed.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0I do, however, have a few high=
-level comments/questions about the API:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 1. In order to be useful for =
sparse memory support, the API has to go<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0the<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0other way around so that it bi=
nds a VA range to a range within the BO.=C2=A0<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0It<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0also needs to be able to handl=
e overlapping where two different VA<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0ranges<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0may map to the same underlying=
 bytes in the BO.=C2=A0 This likely means that<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0unbind needs to also take a VA=
 range and only unbind that range.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 2. If this is going to be use=
ful for managing GL&#39;s address space where<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0we<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0have lots of BOs, we probably =
want it to take a list of ranges so we<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0aren&#39;t making one ioctl fo=
r each thing we want to bind.<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0Hi Jason,<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0Yah, some of these requirements came up.<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0<br>
&gt;&gt; Yes, I have raised them every single time an API like this has com=
e across my<br>
&gt;&gt; e-mail inbox for years and they continue to get ignored.=C2=A0 Why=
 are we landing an<br>
&gt;&gt; API that we know isn&#39;t the API we want especially when it&#39;=
s pretty obvious<br>
&gt;&gt; roughly what the API we want is?=C2=A0 It may be less time in the =
short term, but<br>
&gt;&gt; long-term it means two ioctls and two implementations in i915, IGT=
 tests for<br>
&gt;&gt; both code paths, and code in all UMDs to call one or the other dep=
ending on<br>
&gt;&gt; what kernel you&#39;re running on, and we have to maintain all tha=
t code going<br>
&gt;&gt; forward forever.=C2=A0 Sure, that&#39;s a price we pay today for a=
 variety of things but<br>
&gt;&gt; that&#39;s because they all seemed like the right thing at the tim=
e.=C2=A0 Landing the<br>
&gt;&gt; wrong API when we know it&#39;s the wrong API seems foolish.<br>
&gt;<br>
&gt;Exactly. This is not even close to the uAPI we need. Reposting an RFC<b=
r>
&gt;without taking in the concerns last time (or the time before that, or<b=
r>
&gt;the time before that...) suggests that you aren&#39;t really requesting=
 for<br>
&gt;comments at all.<br>
<br>
Thanks Jason for detailed exlanation.<br>
Chris, all comments and guidance are much appreciated :)<br>
<br>
I haven&#39;t looked in detail, but my concern is that implementing<br>
partial object binding (offset, lenght) from vma down to [un]binding<br>
in ppgtt might be a lot of work to include in this SVM patch series.<br>
I believe we need the partial object binding in non-SVM scenario<br>
as well?<br></blockquote><div><br></div><div>Yes, the Vulkan APIs require b=
oth partial binding and aliasing.</div><div><br></div><div>It may be worth =
pointing out that we&#39;re already doing some of this stuff today, althoug=
h in a rather backwards way.=C2=A0 Our non-softpin model for Vulkan uses a =
memfd which we then map in userspace and turn into a BO via userptr.=C2=A0 =
Due to the way we handle threading in the driver, we end up with multiple B=
Os pointing to the same overlapping range in the memfd and hence the same p=
ages.=C2=A0 That doesn&#39;t mean that everything in the path is already se=
t up for what you need but the VA -&gt; page mappings should be.=C2=A0 Also=
, avoiding these kinds of shinanigans is exactly why we want a &quot;real&q=
uot; kernel API for this. :-)<br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
Ok, let me change the interface as below.<br>
<br>
struct drm_i915_gem_vm_bind_va<br>
{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /** VA start to bind **/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 __u64 start;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /** Offset in Object to bind for I915_GEM_VM_BI=
ND_SVM_OBJ type **/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 __u64 offset;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /** VA length to [un]bind **/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 __u64 length;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /** Type of memory to [un]bind **/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 __u32 type;<br>
#define I915_GEM_VM_BIND_SVM_OBJ=C2=A0 =C2=A0 =C2=A0 0<br>
#define I915_GEM_VM_BIND_SVM_BUFFER=C2=A0 =C2=A01<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /** Object handle to [un]bind for I915_GEM_VM_B=
IND_SVM_OBJ type **/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 __u32 handle;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /** Flags **/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 __u32 flags;<br>
#define I915_GEM_VM_BIND_UNBIND=C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; 0)<br>
#define I915_GEM_VM_BIND_READONLY=C2=A0 =C2=A0 (1 &lt;&lt; 1)<br>
}<br>
<br>
struct drm_i915_gem_vm_bind {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /** vm to [un]bind **/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 __u32 vm_id;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /** number of VAs to bind **/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 __u32 num_vas;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /** Array of VAs to bind **/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_i915_gem_vm_bind_va *bind_vas;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /** User extensions **/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 __u64 extensions;<br>
};<br>
<br>
When synchronization control is added as extension, it applies to all VAs i=
n the array.<br>
Does this looks good?<br></blockquote><div><br></div><div>Yes, I think that=
 header looks good.=C2=A0 It&#39;s probably fine if synchronization comes l=
ater.</div><div><br></div><div>I have two more questions (more for my own e=
ducation than anything):</div><div><br></div><div>=C2=A01. What is the diff=
erence between a SVM object and a buffer?</div><div><br></div><div>=C2=A02.=
 I see a vm_id but there is no context.=C2=A0 What (if any) are the synchro=
nization guarantees between the VM_BIND ioctl and EXECBUF?=C2=A0 If I VM_BI=
ND followed by EXECBUF is it guaranteed to happen in that order?=C2=A0 What=
 if I EXECBUF and then VM_BIND to unbind something?=C2=A0 If I VM_BIND whil=
e an execbuf is happening but I have some way of delaying the GPU work from=
 the CPU and I unblock it once the VM_BIND comes back, is that ok?</div><di=
v><br></div><div>If those questions are answered by other patches, feel fre=
e to just point me at them instead of answering in detail here.</div><div><=
br></div><div>--Jason<br></div></div></div>

--000000000000952b1c0599ea1e57--

--===============1616392302==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1616392302==--
