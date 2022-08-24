Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C963359FF46
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 18:16:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78ECEBA454;
	Wed, 24 Aug 2022 16:15:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C664BA2A2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 16:14:39 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-33dac4c9cbcso24332937b3.12
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 09:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=M1NEKLWYlD60T2oO9DhA7GbtucrnvL+YucZJBJRq5Wc=;
 b=Gn3CKz/JXI9QUA5qALBQHH05g1gwErSm1mA8MjSAw7/tiYYxpdxf5j0qEQio+xv9Nd
 KgwjhN3Drcg+tU38g2bd613NqmRId/wcwkfQ4Tu/zbTo5S714Y+HIrlHh3GbuvnzG2eT
 7+4J3MezfAkLHGWUQfpJb8KkNPV933rXqo5RffMefuVtbWPci501kily7lFg4nhUFOZh
 2mCb87oTo0bb7WWTQizLcu5DxLNaEUclg/l+bmr9Mo8e7Az70OM58L1HJle9OymuE7Ld
 wE8+maqRTl2/ndDXUpg5vaWNNjLMbkjTjN+y5CLB35Kk04XVhhhxaa/iwdtUXUGR0qLY
 WgPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=M1NEKLWYlD60T2oO9DhA7GbtucrnvL+YucZJBJRq5Wc=;
 b=fSNTun2zFDxMjTt3MUnSCiseaFMzXgIM2gqLWlObAL0BJ99v/pOx5/zknb7CYkJG/Z
 3JFTEpYYU8zILAQiBoy2JX97VGLsOAnEeAf7Ce+O9OR+lWxvNMSMlc35Uqo5nAy0E9Nb
 n3KJ5QBYhlfC8TQF6sJSlDskdDi9j6fZn8/KSurxN3ODuYV0lY8ehXCIQNBQYeCJGv0q
 w4ZYsWmm867541d9MIhncGypztEbhsCWQpHyObp/kUVxpTa5uBg9uAnTFXGW2SrfLDSh
 ZtyK7cLa93Vy8Kgujt5ANWV/YGsdlnoc1WOYqFomUzWwUMhRyVL6VC7MeIDG9fMs0s5S
 M6AQ==
X-Gm-Message-State: ACgBeo03vhB3KjfKuVkx2CWs64SNbVHkNeqLbOG3UcFG18uyPnNStNLf
 xIThngHOIzSayQkCSUpAHdzCmrhs4QPcgwP0R4e7uQ==
X-Google-Smtp-Source: AA6agR5kqPYjXcV7ADZpaOYy4zaMGqrRr6MMmbwVHY8Q22vRjvwTRuqrs6VnX+1Q0fRyiR37B0J8A8I/fTF4JXLRG0M=
X-Received: by 2002:a81:1102:0:b0:337:2704:734c with SMTP id
 2-20020a811102000000b003372704734cmr29911073ywr.360.1661357677732; Wed, 24
 Aug 2022 09:14:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzo4n7xKnU+2=gesdLqDJUQ7kBAVCQND6yu5_CTiKo7Cg@mail.gmail.com>
 <CAPM=9twwdeybb_hwvtqbyic3CHYe3+s1LLnT0t_DJAVi9cno4g@mail.gmail.com>
 <CAP+8YyEqdzp3t1ErmpsF_8U1HPRQXoRBd++TjzWCvA5EqbynQA@mail.gmail.com>
 <ad584aeb-bbf4-afcf-daaa-eca8f0e08fe7@amd.com>
In-Reply-To: <ad584aeb-bbf4-afcf-daaa-eca8f0e08fe7@amd.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 24 Aug 2022 11:14:26 -0500
Message-ID: <CAOFGe94xYtVecSWYm5ENF=K826Td5xYNHtyMsgU6HnQvQWkEeA@mail.gmail.com>
Subject: Re: vm binding interfaces and parallel with mmap
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: multipart/alternative; boundary="00000000000039fc7e05e6fefac2"
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
Cc: Matthew Brost <matthew.brost@intel.com>, Ben Skeggs <skeggsb@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000039fc7e05e6fefac2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 22, 2022 at 8:27 AM Christian K=C3=B6nig <christian.koenig@amd.=
com>
wrote:

> Am 22.08.22 um 10:34 schrieb Bas Nieuwenhuizen:
> > On Mon, Aug 22, 2022 at 9:28 AM Dave Airlie <airlied@gmail.com> wrote:
> >> On Mon, 22 Aug 2022 at 17:05, Dave Airlie <airlied@gmail.com> wrote:
> >>> Hey,
> >>>
> >>> I've just been looking at the vm bind type interfaces and wanted to a=
t
> >>> least document how we think the unmapping API should work. I know I'v=
e
> >>> talked on irc before about this, but wanted to solidify things a bit
> >>> more around what is required vs what is a nice to have.
> >>>
> >>> My main concerns/thoughts are around the unbind interfaces and how
> >>> close to munmap they should be.
> >>>
> >>> I think the mapping operation is mostly consistent
> >>> MAP(bo handle, offset into bo, range, VM offset, VM flags)
> >>> which puts the range inside to bo at the offset in the current VM
> >>> (maybe take an optional vm_id).
> >>>
> >>> now the simplest unmap I can see if one that parallel munmap
> >>> UNMAP(vmaddr, range);
> >>>
> >>> But it begs the question on then how much the kernel needs to deal
> >>> with here, if we support random vmaddr,range then we really need to b=
e
> >>> able to do everything munmap does for CPU VMA, which means splitting
> >>> ranges, joining ranges etc.
> >>>
> >>> like
> >>> MAP(1, 0, 0x8000, 0xc0000)
> >>> UNMAP(0xc1000, 0x1000)
> >>> should that be possible?
> >>>
> >>> Do we have any API usage (across Vulkan/CL/CUDA/ROCm etc) that
> >>> requires this sort of control, or should we be fine with only
> >>> unmapping objects exactly like how they were mapped in the first
> >>> place, and not have any splitting/joining?
> > Vulkan allows for this, though I haven't checked to what extent apps us=
e
> it.
>
> This is massively used for partial resident textures under OpenGL as far
> as I know.
>
> E.g. you map a range like 1->10 as PRT and then then map real textures
> at 2, 5 and 7 or something like that.
>
> Saying that a functionality to map/enable PRT for a range is necessary
> as well. On amdgpu we have a special flag for that and in this case the
> BO to map can be NULL.
>

NVIDIA has similar bits.  I don't remember if intel does or not.  Handling
this as a map with BO=3D0 and a PRT flag of some sort seems like a perfectl=
y
reasonable way to handle it.


> > We could technically split all mapping/unmapping to be per single tile
> > in the userspace driver, which avoids the need for splitting/merging,
> > but that could very much be a pessimization.
>
> That would be pretty much a NAK from my side. A couple of hardware
> optimizations require mappings to be as large as possible.
>
> Otherwise we wouldn't be able to use huge/giant (2MiB, 1GiB) pages,
> power of two TLB reach optimizations (8KiB, 16KiB, 32KiB.....) as well
> as texture fetcher optimizations.
>

Agreed.  Intel has such optimizations as well and they really do matter.
IDK about nvidia but I'd be surprised if they don't at least have a 2M
variant or something.  Reducing page-table depth matters a lot for latency.


> >> I suppose it also asks the question around paralleling
> >>
> >> fd =3D open()
> >> ptr =3D mmap(fd,)
> >> close(fd)
> >> the mapping is still valid.
> >>
> >> I suppose our equiv is
> >> handle =3D bo_alloc()
> >> gpu_addr =3D vm_bind(handle,)
> >> gem_close(handle)
> >> is the gpu_addr still valid does the VM hold a reference on the kernel
> >> bo internally.
> > For Vulkan it looks like this is undefined and the above is not
> necessary:
> >
> > "It is important to note that freeing a VkDeviceMemory object with
> > vkFreeMemory will not cause resources (or resource regions) bound to
> > the memory object to become unbound. Applications must not access
> > resources bound to memory that has been freed."
> > (32.7.6)
>

I'm not sure about this particular question.  We need to be sure that maps
get cleaned up eventually.  On the one hand, I think it's probably a valid
API implementation to have each mapped page hold a reference similar to
mmap and have vkDestroyImage or vkDestroyBuffer do an unmap to clean up the
range.  However, clients may be surprised when they destroy a large memory
object and can't reap the memory because of extra BO references they don't
know about.  If BOs unmap themselves on close or if we had a way to take a
VM+BO and say "unmap this BO from everywhere, please", we can clean up the
memory pretty easily.  Without that, it's a giant PITA to do entirely
inside the userspace driver because it requires us to globally track every
mapping and that means data structures and locks.  Yes, such an ioctl would
require the kernel to track things but the kernel is already tracking
everything that's bound, so hopefully it doesn't add much.

--Jason


> Additional to what was discussed here so far we need an array on in and
> out drm_syncobj for both map as well as unmap.
>
> E.g. when the mapping/unmapping should happen and when it is completed
> etc...
>
> Christian.
>
> >
> >
> >> Dave.
> >>> Dave.
>
>

--00000000000039fc7e05e6fefac2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, Aug 22, 2022 at 8:27 AM Christian K=C3=B6nig &lt;<a href=3D"=
mailto:christian.koenig@amd.com">christian.koenig@amd.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">Am 22.08.22 um 10:=
34 schrieb Bas Nieuwenhuizen:<br>
&gt; On Mon, Aug 22, 2022 at 9:28 AM Dave Airlie &lt;<a href=3D"mailto:airl=
ied@gmail.com" target=3D"_blank">airlied@gmail.com</a>&gt; wrote:<br>
&gt;&gt; On Mon, 22 Aug 2022 at 17:05, Dave Airlie &lt;<a href=3D"mailto:ai=
rlied@gmail.com" target=3D"_blank">airlied@gmail.com</a>&gt; wrote:<br>
&gt;&gt;&gt; Hey,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I&#39;ve just been looking at the vm bind type interfaces and =
wanted to at<br>
&gt;&gt;&gt; least document how we think the unmapping API should work. I k=
now I&#39;ve<br>
&gt;&gt;&gt; talked on irc before about this, but wanted to solidify things=
 a bit<br>
&gt;&gt;&gt; more around what is required vs what is a nice to have.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; My main concerns/thoughts are around the unbind interfaces and=
 how<br>
&gt;&gt;&gt; close to munmap they should be.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I think the mapping operation is mostly consistent<br>
&gt;&gt;&gt; MAP(bo handle, offset into bo, range, VM offset, VM flags)<br>
&gt;&gt;&gt; which puts the range inside to bo at the offset in the current=
 VM<br>
&gt;&gt;&gt; (maybe take an optional vm_id).<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; now the simplest unmap I can see if one that parallel munmap<b=
r>
&gt;&gt;&gt; UNMAP(vmaddr, range);<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; But it begs the question on then how much the kernel needs to =
deal<br>
&gt;&gt;&gt; with here, if we support random vmaddr,range then we really ne=
ed to be<br>
&gt;&gt;&gt; able to do everything munmap does for CPU VMA, which means spl=
itting<br>
&gt;&gt;&gt; ranges, joining ranges etc.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; like<br>
&gt;&gt;&gt; MAP(1, 0, 0x8000, 0xc0000)<br>
&gt;&gt;&gt; UNMAP(0xc1000, 0x1000)<br>
&gt;&gt;&gt; should that be possible?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Do we have any API usage (across Vulkan/CL/CUDA/ROCm etc) that=
<br>
&gt;&gt;&gt; requires this sort of control, or should we be fine with only<=
br>
&gt;&gt;&gt; unmapping objects exactly like how they were mapped in the fir=
st<br>
&gt;&gt;&gt; place, and not have any splitting/joining?<br>
&gt; Vulkan allows for this, though I haven&#39;t checked to what extent ap=
ps use it.<br>
<br>
This is massively used for partial resident textures under OpenGL as far <b=
r>
as I know.<br>
<br>
E.g. you map a range like 1-&gt;10 as PRT and then then map real textures <=
br>
at 2, 5 and 7 or something like that.<br>
<br>
Saying that a functionality to map/enable PRT for a range is necessary <br>
as well. On amdgpu we have a special flag for that and in this case the <br=
>
BO to map can be NULL.<br></blockquote><div><br></div><div>NVIDIA has simil=
ar bits.=C2=A0 I don&#39;t remember if intel does or not.=C2=A0 Handling th=
is as a map with BO=3D0 and a PRT flag of some sort seems like a perfectly =
reasonable way to handle it.<br></div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
&gt; We could technically split all mapping/unmapping to be per single tile=
<br>
&gt; in the userspace driver, which avoids the need for splitting/merging,<=
br>
&gt; but that could very much be a pessimization.<br>
<br>
That would be pretty much a NAK from my side. A couple of hardware <br>
optimizations require mappings to be as large as possible.<br>
<br>
Otherwise we wouldn&#39;t be able to use huge/giant (2MiB, 1GiB) pages, <br=
>
power of two TLB reach optimizations (8KiB, 16KiB, 32KiB.....) as well <br>
as texture fetcher optimizations.<br></blockquote><div><br></div><div>Agree=
d.=C2=A0 Intel has such optimizations as well and they really do matter.=C2=
=A0 IDK about nvidia but I&#39;d be surprised if they don&#39;t at least ha=
ve a 2M variant or something.=C2=A0 Reducing page-table depth matters a lot=
 for latency.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
&gt;&gt; I suppose it also asks the question around paralleling<br>
&gt;&gt;<br>
&gt;&gt; fd =3D open()<br>
&gt;&gt; ptr =3D mmap(fd,)<br>
&gt;&gt; close(fd)<br>
&gt;&gt; the mapping is still valid.<br>
&gt;&gt;<br>
&gt;&gt; I suppose our equiv is<br>
&gt;&gt; handle =3D bo_alloc()<br>
&gt;&gt; gpu_addr =3D vm_bind(handle,)<br>
&gt;&gt; gem_close(handle)<br>
&gt;&gt; is the gpu_addr still valid does the VM hold a reference on the ke=
rnel<br>
&gt;&gt; bo internally.<br>
&gt; For Vulkan it looks like this is undefined and the above is not necess=
ary:<br>
&gt;<br>
&gt; &quot;It is important to note that freeing a VkDeviceMemory object wit=
h<br>
&gt; vkFreeMemory will not cause resources (or resource regions) bound to<b=
r>
&gt; the memory object to become unbound. Applications must not access<br>
&gt; resources bound to memory that has been freed.&quot;<br>
&gt; (32.7.6)<br></blockquote><div><br></div><div>I&#39;m not sure about th=
is particular question.=C2=A0 We need to be sure that maps get cleaned up e=
ventually.=C2=A0 On the one hand, I think it&#39;s probably a valid API imp=
lementation to have each mapped page hold a reference similar to mmap and h=
ave vkDestroyImage or vkDestroyBuffer do an unmap to clean up the range.=C2=
=A0 However, clients may be surprised when they destroy a large memory obje=
ct and can&#39;t reap the memory because of extra BO references they don&#3=
9;t know about.=C2=A0 If BOs unmap themselves on close or if we had a way t=
o take a VM+BO and say &quot;unmap this BO from everywhere, please&quot;, w=
e can clean up the memory pretty easily.=C2=A0 Without that, it&#39;s a gia=
nt PITA to do entirely inside the userspace driver because it requires us t=
o globally track every mapping and that means data structures and locks.=C2=
=A0 Yes, such an ioctl would require the kernel to track things but the ker=
nel is already tracking everything that&#39;s bound, so hopefully it doesn&=
#39;t add much.</div><div><br></div><div>--Jason<br></div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
Additional to what was discussed here so far we need an array on in and <br=
>
out drm_syncobj for both map as well as unmap.<br>
<br>
E.g. when the mapping/unmapping should happen and when it is completed <br>
etc...<br>
<br>
Christian.<br>
<br>
&gt;<br>
&gt;<br>
&gt;&gt; Dave.<br>
&gt;&gt;&gt; Dave.<br>
<br>
</blockquote></div></div>

--00000000000039fc7e05e6fefac2--
