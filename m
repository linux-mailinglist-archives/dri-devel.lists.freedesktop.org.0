Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF71A11EF42
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2019 01:36:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A87AA6E0F3;
	Sat, 14 Dec 2019 00:36:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F16F6E113
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Dec 2019 00:36:32 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id dc19so521831edb.10
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 16:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x/criWtzZlOjZheKwE9PCVhsk8+Ysl3vn28deIs8Fmc=;
 b=wIb/dt+LozdXDVD8TP94IBQPkqvX4l04jltprjZhcExPynCppLhFbDrZzDS/8jykVc
 JEe61ZRUSSB6PLMyG41G96JSxR8gYFNENVB3kPkxXuPtQJ1fI7m1bgO55AIoYC2neNlZ
 J4nJ59Bu3B8giBlHmD/+LbONwBHAfL7DqnGSKfNxgQiyvx1Ocn8IHhVcEFfI/fUKV2Az
 jQqYvuOfvnLWFzqpVzkRH+jRbAzGejfpoFuXWdO4PXun2fddqYQdzstEI5VNQotRl9hC
 CmY4eqveMwp4q+vW0KYYiKFEKgmgfv3hvF0dtU6nZqrBdcc7d+H0NKZb1a2fcChVHTCy
 cQ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x/criWtzZlOjZheKwE9PCVhsk8+Ysl3vn28deIs8Fmc=;
 b=KaPfhqo/S9FGIfLGb9M2A4QU3PXneoFmxUs6ak7eiRYZeqy7YThnPKBLH83FaY/L8C
 KvhTGxzyg0kkk34JZSH4mWpibovtLkwvEY8/IL7krwkLu2UuLdZ3AbkMdxNQJ9NqfR7F
 jFkNYneoy9vhWovrPqkEhRXxoAKt8nqZkYjN6NvtbXY/WXaRjAv6IVNlaqdJQ4rIiE2E
 iotSWB13T3MBhMGkCjfb34MugAYLYSu4MS3ETD6MUzryG9kgCufjVDtR3l3AtzoBJGga
 y8sWl5ORGgU7/Q6t0xpKcIWgBWzkAxgLrv7mQ0TsmHWvGbUViz8ZsHJqGsGu1rczXISo
 qAAQ==
X-Gm-Message-State: APjAAAWedA7r9+lbEe6z2FxH8ci0xKjuwa9y9M6oXWl9GsFGD0KrGtmX
 CY7jMUTWG3g0nKzJCX08uGphXqSdO8ajp3p5WyAvog==
X-Google-Smtp-Source: APXvYqwwBg3fUitkYIjnPjCvEQxF9+iANNbWUxw2cSGepuAu2zPYLDHcSR+y5SIZjsSh0lSt0CTVzGVTH4Z3kMqrId8=
X-Received: by 2002:a05:6402:355:: with SMTP id
 r21mr6300220edw.60.1576283790581; 
 Fri, 13 Dec 2019 16:36:30 -0800 (PST)
MIME-Version: 1.0
References: <20191213215614.24558-1-niranjana.vishwanathapura@intel.com>
 <20191213215614.24558-3-niranjana.vishwanathapura@intel.com>
 <CAOFGe95rC8A4SuwWtd1tbikw8HGm-TU52_O8iBSJKpDyY0gWNw@mail.gmail.com>
 <20191213231322.GS14488@nvishwa1-DESK.sc.intel.com>
In-Reply-To: <20191213231322.GS14488@nvishwa1-DESK.sc.intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Fri, 13 Dec 2019 18:36:19 -0600
Message-ID: <CAOFGe97yh5CGTwoP-f3wRGWoTLuWMvMwYFc5Hx3KOkT9XkOxkw@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0960512958=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0960512958==
Content-Type: multipart/alternative; boundary="000000000000673a1905999f2b46"

--000000000000673a1905999f2b46
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 13, 2019 at 5:24 PM Niranjan Vishwanathapura <
niranjana.vishwanathapura@intel.com> wrote:

> On Fri, Dec 13, 2019 at 04:58:42PM -0600, Jason Ekstrand wrote:
> >
> >     +/**
> >     + * struct drm_i915_gem_vm_bind
> >     + *
> >     + * Bind an object in a vm's page table.
> >
> >   First off, this is something I've wanted for a while for Vulkan, it's
> just
> >   never made its way high enough up the priority list.  However, it's
> going
> >   to have to come one way or another soon.  I'm glad to see kernel API
> for
> >   this being proposed.
> >   I do, however, have a few high-level comments/questions about the API:
> >    1. In order to be useful for sparse memory support, the API has to go
> the
> >   other way around so that it binds a VA range to a range within the
> BO.  It
> >   also needs to be able to handle overlapping where two different VA
> ranges
> >   may map to the same underlying bytes in the BO.  This likely means that
> >   unbind needs to also take a VA range and only unbind that range.
> >    2. If this is going to be useful for managing GL's address space
> where we
> >   have lots of BOs, we probably want it to take a list of ranges so we
> >   aren't making one ioctl for each thing we want to bind.
>
> Hi Jason,
>
> Yah, some of these requirements came up.
>

Yes, I have raised them every single time an API like this has come across
my e-mail inbox for years and they continue to get ignored.  Why are we
landing an API that we know isn't the API we want especially when it's
pretty obvious roughly what the API we want is?  It may be less time in the
short term, but long-term it means two ioctls and two implementations in
i915, IGT tests for both code paths, and code in all UMDs to call one or
the other depending on what kernel you're running on, and we have to
maintain all that code going forward forever.  Sure, that's a price we pay
today for a variety of things but that's because they all seemed like the
right thing at the time.  Landing the wrong API when we know it's the wrong
API seems foolish.

They are not being done here due to time and effort involved in defining
> those requirements, implementing and validating.
>

For #1, yes, it would require more effort but for #2, it really doesn't
take any extra effort to make it take an array...


> However, this ioctl can be extended in a backward compatible way to handle
> those requirements if required.
>
> >    3. Why are there no ways to synchronize this with anything?  For
> binding,
> >   this probably isn't really needed as long as the VA range you're
> binding
> >   is empty.  However, if you want to move bindings around or unbind
> >   something, the only option is to block in userspace and then call
> >   bind/unbind.  This can be done but it means even more threads in the
> UMD
> >   which is unpleasant.  One could argue that that's more or less what the
> >   kernel is going to have to do so we may as well do it in userspace.
> >   However, I'm not 100% convinced that's true.
> >   --Jason
> >
>
> Yah, that is the thought.
> But as SVM feature evolves, I think we can consider handling some such
> cases
> if hadling those in driver does make whole lot sense.
>

Sparse binding exists as a feature.  It's been in D3D for some time and
it's in Vulkan.  We pretty much know what the requirements are.  If you go
look at how it's supposed to work in Vulkan, you have a binding queue and
it waits on semaphores before [un]binding and signals semaphores after
[un]binding.  The biggest problem from an API (as opposed to
implementation) POV with doing that in i915 is that we have too many
synchronization primitives to choose from. :-(

--Jason



> Thanks,
> Niranjana
>
> >
> >     + */
> >     +struct drm_i915_gem_vm_bind {
> >     +       /** VA start to bind **/
> >     +       __u64 start;
> >     +
> >     +       /** Type of memory to [un]bind **/
> >     +       __u32 type;
> >     +#define I915_GEM_VM_BIND_SVM_OBJ      0
> >     +
> >     +       /** Object handle to [un]bind for I915_GEM_VM_BIND_SVM_OBJ
> type
> >     **/
> >     +       __u32 handle;
> >     +
> >     +       /** vm to [un]bind **/
> >     +       __u32 vm_id;
> >     +
> >     +       /** Flags **/
> >     +       __u32 flags;
> >     +#define I915_GEM_VM_BIND_UNBIND      (1 << 0)
> >     +#define I915_GEM_VM_BIND_READONLY    (1 << 1)
> >     +};
> >     +
> >      #if defined(__cplusplus)
> >      }
> >      #endif
> >     --
> >     2.21.0.rc0.32.g243a4c7e27
> >
> >     _______________________________________________
> >     Intel-gfx mailing list
> >     Intel-gfx@lists.freedesktop.org
> >     https://lists.freedesktop.org/mailman/listinfo/intel-gfx
>

--000000000000673a1905999f2b46
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Fri, Dec 13, 2019 at 5:24 PM Niranjan Vishwanathapura &lt;<a href=
=3D"mailto:niranjana.vishwanathapura@intel.com">niranjana.vishwanathapura@i=
ntel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Fri, Dec 13, 2019 at 04:58:42PM -0600, Jason Ekstrand wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * struct drm_i915_gem_vm_bind<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ *<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * Bind an object in a vm&#39;s page table.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0First off, this is something I&#39;ve wanted for a while f=
or Vulkan, it&#39;s just<br>
&gt;=C2=A0 =C2=A0never made its way high enough up the priority list.=C2=A0=
 However, it&#39;s going<br>
&gt;=C2=A0 =C2=A0to have to come one way or another soon.=C2=A0 I&#39;m gla=
d to see kernel API for<br>
&gt;=C2=A0 =C2=A0this being proposed.<br>
&gt;=C2=A0 =C2=A0I do, however, have a few high-level comments/questions ab=
out the API:<br>
&gt;=C2=A0 =C2=A0 1. In order to be useful for sparse memory support, the A=
PI has to go the<br>
&gt;=C2=A0 =C2=A0other way around so that it binds a VA range to a range wi=
thin the BO.=C2=A0 It<br>
&gt;=C2=A0 =C2=A0also needs to be able to handle overlapping where two diff=
erent VA ranges<br>
&gt;=C2=A0 =C2=A0may map to the same underlying bytes in the BO.=C2=A0 This=
 likely means that<br>
&gt;=C2=A0 =C2=A0unbind needs to also take a VA range and only unbind that =
range.<br>
&gt;=C2=A0 =C2=A0 2. If this is going to be useful for managing GL&#39;s ad=
dress space where we<br>
&gt;=C2=A0 =C2=A0have lots of BOs, we probably want it to take a list of ra=
nges so we<br>
&gt;=C2=A0 =C2=A0aren&#39;t making one ioctl for each thing we want to bind=
.<br>
<br>
Hi Jason,<br>
<br>
Yah, some of these requirements came up.<br></blockquote><div>=C2=A0</div><=
div>Yes, I have raised them every single time an API like this has come acr=
oss my e-mail inbox for years and they continue to get ignored.=C2=A0 Why a=
re we landing an API that we know isn&#39;t the API we want especially when=
 it&#39;s pretty obvious roughly what the API we want is?=C2=A0 It may be l=
ess time in the short term, but long-term it means two ioctls and two imple=
mentations in i915, IGT tests for both code paths, and code in all UMDs to =
call one or the other depending on what kernel you&#39;re running on, and w=
e have to maintain all that code going forward forever.=C2=A0 Sure, that&#3=
9;s a price we pay today for a variety of things but that&#39;s because the=
y all seemed like the right thing at the time.=C2=A0 Landing the wrong API =
when we know it&#39;s the wrong API seems foolish.<br></div><div><br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
They are not being done here due to time and effort involved in defining<br=
>
those requirements, implementing and validating.<br></blockquote><div><br><=
/div><div>For #1, yes, it would require more effort but for #2, it really d=
oesn&#39;t take any extra effort to make it take an array...<br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
However, this ioctl can be extended in a backward compatible way to handle<=
br>
those requirements if required.<br>
<br>
&gt;=C2=A0 =C2=A0 3. Why are there no ways to synchronize this with anythin=
g?=C2=A0 For binding,<br>
&gt;=C2=A0 =C2=A0this probably isn&#39;t really needed as long as the VA ra=
nge you&#39;re binding<br>
&gt;=C2=A0 =C2=A0is empty.=C2=A0 However, if you want to move bindings arou=
nd or unbind<br>
&gt;=C2=A0 =C2=A0something, the only option is to block in userspace and th=
en call<br>
&gt;=C2=A0 =C2=A0bind/unbind.=C2=A0 This can be done but it means even more=
 threads in the UMD<br>
&gt;=C2=A0 =C2=A0which is unpleasant.=C2=A0 One could argue that that&#39;s=
 more or less what the<br>
&gt;=C2=A0 =C2=A0kernel is going to have to do so we may as well do it in u=
serspace. <br>
&gt;=C2=A0 =C2=A0However, I&#39;m not 100% convinced that&#39;s true.<br>
&gt;=C2=A0 =C2=A0--Jason<br>
&gt;<br>
<br>
Yah, that is the thought.<br>
But as SVM feature evolves, I think we can consider handling some such case=
s<br>
if hadling those in driver does make whole lot sense. <br></blockquote><div=
><br></div><div>Sparse binding exists as a feature.=C2=A0 It&#39;s been in =
D3D for some time and it&#39;s in Vulkan.=C2=A0 We pretty much know what th=
e requirements are.=C2=A0 If you go look at how it&#39;s supposed to work i=
n Vulkan, you have a binding queue and it waits on semaphores before [un]bi=
nding and signals semaphores after [un]binding.=C2=A0 The biggest problem f=
rom an API (as opposed to implementation) POV with doing that in i915 is th=
at we have too many synchronization primitives to choose from. :-(</div><di=
v><br></div><div>--Jason<br></div><div><br></div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
Thanks,<br>
Niranjana<br>
<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+struct drm_i915_gem_vm_bind {<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** VA start to bind **=
/<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 start;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** Type of memory to [=
un]bind **/<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 type;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+#define I915_GEM_VM_BIND_SVM_OBJ=C2=A0 =C2=A0 =C2=
=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** Object handle to [u=
n]bind for I915_GEM_VM_BIND_SVM_OBJ type<br>
&gt;=C2=A0 =C2=A0 =C2=A0**/<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 handle;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** vm to [un]bind **/<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 vm_id;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** Flags **/<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 flags;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+#define I915_GEM_VM_BIND_UNBIND=C2=A0 =C2=A0 =C2=
=A0 (1 &lt;&lt; 0)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+#define I915_GEM_VM_BIND_READONLY=C2=A0 =C2=A0 (1 =
&lt;&lt; 1)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+};<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0 #if defined(__cplusplus)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 #endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0--<br>
&gt;=C2=A0 =C2=A0 =C2=A02.21.0.rc0.32.g243a4c7e27<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0_______________________________________________<br>
&gt;=C2=A0 =C2=A0 =C2=A0Intel-gfx mailing list<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:Intel-gfx@lists.freedesktop.org" =
target=3D"_blank">Intel-gfx@lists.freedesktop.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://lists.freedesktop.org/mailman/li=
stinfo/intel-gfx" rel=3D"noreferrer" target=3D"_blank">https://lists.freede=
sktop.org/mailman/listinfo/intel-gfx</a><br>
</blockquote></div></div>

--000000000000673a1905999f2b46--

--===============0960512958==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0960512958==--
