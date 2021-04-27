Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC56936CE3B
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 23:59:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 452EA6E9EE;
	Tue, 27 Apr 2021 21:59:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C75C89216;
 Tue, 27 Apr 2021 21:59:11 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id t13so5608140pji.4;
 Tue, 27 Apr 2021 14:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wf4X81qR2aiWxM5zUbzpTONU9wKsCdZqn3KtL0vPTV8=;
 b=Mp6lL22nLI6mFgmw5ijRAGBXvnERils3KcPmR06Cxv3IliKr9KSoL8W4nMCYLOH4XA
 AVFo24oTNDXjW6hjDJcPUgmtEgBjo391GVwJKRQKlLfFTg474cHwsTRJwANvFGJu7FFf
 pPEgj9dysNtVy/SpszV1PYmYrG0Ot63G92zknzuWsY6csxAIzv2bOKZg9jgemmCMkidb
 SlOd+oix+xRPjrKKCOaOXu68bAwCWxVeRXR1BBrHnEjcs2sN1T1Sz0ilRnkKB5vNC210
 fvFCCiwCCv5Uom4s75buBsPB9DUUS7jEXxsA43VfXVUthNuX1uwAvVPBjK0HJP7LnUzE
 XgDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wf4X81qR2aiWxM5zUbzpTONU9wKsCdZqn3KtL0vPTV8=;
 b=MHVuCdFD3SCmm5rops1E9J5ReXThSWZKTKiwFTXbjSEYvZTHY3rTzlxYPpNfyFn9ll
 9mVql8r3Xl7Fh7MlNAEevghJxxfMSBHvIX1JMLspz8UKZ54xn9LZ0wEjkBCwddNkCJkO
 U+NhWqZkphbTHskdfbeH4/fDox2uiiVKybErscW697ezZ2ctbUyKTKavDC/RRFen682m
 Ykuca3wUe/nSpPASukc14eCAoj77gEYXvSu+IQqbT8KyXOl4LDCC5wXwDWZiBZdS5Pqz
 MYC1N3SUI0SQSbgp+rVypXcH7MK4eUktbmeiULuo6yaYjnRYOS4hMHf934Hba9Q+WuZV
 oSRA==
X-Gm-Message-State: AOAM533V7n0fn9D/aqEXXAZLeQvTH6BrMXrS9p/efahB94iPMUd8EDXL
 Q89IoReRoaFs2WDFxBqj+jrp9AneJ40VrpZ3Zl5tH3BUFGk=
X-Google-Smtp-Source: ABdhPJw6d7lf2V6XTPIGy50rs0BIGxwQgMhNG7zEmX74Kr3NjAbudMcWYoImVikm5Wv1vGndKOEdlBDu/wQnN9Vpbeg=
X-Received: by 2002:a17:90b:3796:: with SMTP id
 mz22mr450166pjb.80.1619560750730; 
 Tue, 27 Apr 2021 14:59:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAAxE2A4mpapnCE7uw8GNWkaRR4jXeoz9qa9j=9XknjR3yeq3YQ@mail.gmail.com>
 <CAPj87rMn_gabTdZpHGQVa16Log8xFe8fvhcL_WSC6tyOMvmY=w@mail.gmail.com>
 <CAOFGe96c1SxHiUBzapbVFx1h0aOwF=X8hcStVZmrw4OjrrG+Zg@mail.gmail.com>
 <CAPj87rPSW13nxz2n5E+n0JYcwGR3mFWJAG2kYaaoav7A-ZVD2g@mail.gmail.com>
 <CAKMK7uHyTiFWwQWdxVk1am+KoFA9DsTnJ658CAhzBYOyg7AdsA@mail.gmail.com>
 <CAPj87rM=qf78kUvys1irnR8Djh=CLjRdQJt1V4je82-=+yPWYw@mail.gmail.com>
 <CAKMK7uEAu4FgYwN9t9AMCqD2nVbkSRbGP3tST4nY1nKP26+vxA@mail.gmail.com>
 <CAPj87rOfv0w8jF4CO8PUHQXTfq+2GE=BDmRRWjOMkQ0wH3CPAA@mail.gmail.com>
 <CAAxE2A5pJ-D7AFbDJLKPDztr=yzOSDSm=3HrnJOWr3r96_KOQQ@mail.gmail.com>
 <YIfFC3YST0cfzd3l@phenom.ffwll.local>
 <CAAxE2A6APcJBwnbq58HOqc5bkHMsrzpiNnrso85kfBkRowwz+g@mail.gmail.com>
 <fada1543-612d-369e-765c-f90b718c2cfa@gmail.com>
 <CAAxE2A7a5+q2j1txN-FxWBvKOoPSRKAZ9iPPeTSjMZDbgJCU-A@mail.gmail.com>
 <CAKMK7uHXSnDetsK1VG-X4ZwUZdA819wUKd=YMgqF=yvAQ6Y2vw@mail.gmail.com>
 <CAAxE2A4BhDZL2rrV1KEXPzmKnOq4DXmkFm=4K5XZoY-Cj0uT=Q@mail.gmail.com>
 <735e0d2e-f2c9-c546-ea6c-b5bbb0fe03a6@gmail.com>
 <CAAxE2A4FwZ11_opL++TPUViTOD6ZpV5b3MR+rTDUPvzqYz-oeQ@mail.gmail.com>
 <23ea06c825279c7a9f7678b335c7f89437d387ed.camel@pengutronix.de>
 <CAOFGe95C78mqV-8-o7PgZ1RZu-OJATVzK4wsS2k9ojXh6ba-tA@mail.gmail.com>
In-Reply-To: <CAOFGe95C78mqV-8-o7PgZ1RZu-OJATVzK4wsS2k9ojXh6ba-tA@mail.gmail.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Tue, 27 Apr 2021 17:58:40 -0400
Message-ID: <CAAxE2A7EwWqOVhKGEMhA3tvSUH-_J=tKf97kHa2VDEaRTfOxTA@mail.gmail.com>
Subject: Re: [Mesa-dev] [RFC] Linux Graphics Next: Explicit fences everywhere
 and no BO fences - initial proposal
To: Jason Ekstrand <jason@jlekstrand.net>
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0581931641=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0581931641==
Content-Type: multipart/alternative; boundary="0000000000003d514905c0fb5f40"

--0000000000003d514905c0fb5f40
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jason, both memory-based signalling as well as interrupt-based signalling
to the CPU would be supported by amdgpu. External devices don't need to
support memory-based sync objects. The only limitation is that they can't
convert amdgpu sync objects to dma_fence.

The sad thing is that "external -> amdgpu" dependencies are really
"external <-> amdgpu" dependencies due to mutually-exclusive access
required by non-explicitly-sync'd buffers, so amdgpu-amdgpu interop is the
only interop that would initially work with those buffers. Explicitly
sync'd buffers also won't work if other drivers convert explicit fences to
dma_fence. Thus, both implicit sync and explicit sync might not work with
other drivers at all. The only interop that would initially work is
explicit fences with memory-based waiting and signalling on the external
device to keep the kernel out of the picture.

Marek


On Tue, Apr 27, 2021 at 3:41 PM Jason Ekstrand <jason@jlekstrand.net> wrote=
:

> Trying to figure out which e-mail in this mess is the right one to reply
> to....
>
> On Tue, Apr 27, 2021 at 12:31 PM Lucas Stach <l.stach@pengutronix.de>
> wrote:
> >
> > Hi,
> >
> > Am Dienstag, dem 27.04.2021 um 09:26 -0400 schrieb Marek Ol=C5=A1=C3=A1=
k:
> > > Ok. So that would only make the following use cases broken for now:
> > > - amd render -> external gpu
>
> Assuming said external GPU doesn't support memory fences.  If we do
> amdgpu and i915 at the same time, that covers basically most of the
> external GPU use-cases.  Of course, we'd want to convert nouveau as
> well for the rest.
>
> > > - amd video encode -> network device
> >
> > FWIW, "only" breaking amd render -> external gpu will make us pretty
> > unhappy, as we have some cases where we are combining an AMD APU with a
> > FPGA based graphics card. I can't go into the specifics of this use-
> > case too much but basically the AMD graphics is rendering content that
> > gets composited on top of a live video pipeline running through the
> > FPGA.
>
> I think it's worth taking a step back and asking what's being here
> before we freak out too much.  If we do go this route, it doesn't mean
> that your FPGA use-case can't work, it just means it won't work
> out-of-the box anymore.  You'll have to separate execution and memory
> dependencies inside your FPGA driver.  That's still not great but it's
> not as bad as you maybe made it sound.
>
> > > What about the case when we get a buffer from an external device and
> > > we're supposed to make it "busy" when we are using it, and the
> > > external device wants to wait until we stop using it? Is it something
> > > that can happen, thus turning "external -> amd" into "external <->
> > > amd"?
> >
> > Zero-copy texture sampling from a video input certainly appreciates
> > this very much. Trying to pass the render fence through the various
> > layers of userspace to be able to tell when the video input can reuse a
> > buffer is a great experience in yak shaving. Allowing the video input
> > to reuse the buffer as soon as the read dma_fence from the GPU is
> > signaled is much more straight forward.
>
> Oh, it's definitely worse than that.  Every window system interaction
> is bi-directional.  The X server has to wait on the client before
> compositing from it and the client has to wait on X before re-using
> that back-buffer.  Of course, we can break that later dependency by
> doing a full CPU wait but that's going to mean either more latency or
> reserving more back buffers.  There's no good clean way to claim that
> any of this is one-directional.
>
> --Jason
>

--0000000000003d514905c0fb5f40
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Jason, both memory-based signalling as well as interr=
upt-based signalling to the CPU would be supported by amdgpu. External devi=
ces don&#39;t need to support memory-based sync objects. The only limitatio=
n is that they can&#39;t convert amdgpu sync objects to dma_fence.<br></div=
><div><br></div><div>The sad thing is that &quot;external -&gt; amdgpu&quot=
; dependencies are really &quot;external &lt;-&gt; amdgpu&quot; dependencie=
s due to mutually-exclusive access required by non-explicitly-sync&#39;d bu=
ffers, so amdgpu-amdgpu interop is the only interop that would initially wo=
rk with those buffers. Explicitly sync&#39;d buffers also won&#39;t work if=
 other drivers convert explicit fences to dma_fence. Thus, both implicit sy=
nc and explicit sync might not work with other drivers at all. The only int=
erop that would initially work is explicit fences with memory-based waiting=
 and signalling on the external device to keep the kernel out of the pictur=
e.<br></div><div></div><div></div><div><br></div><div>Marek<br></div><br></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Tue, Apr 27, 2021 at 3:41 PM Jason Ekstrand &lt;<a href=3D"mailto:jason@jl=
ekstrand.net">jason@jlekstrand.net</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">Trying to figure out which e-mail in this=
 mess is the right one to reply to....<br>
<br>
On Tue, Apr 27, 2021 at 12:31 PM Lucas Stach &lt;<a href=3D"mailto:l.stach@=
pengutronix.de" target=3D"_blank">l.stach@pengutronix.de</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt; Am Dienstag, dem 27.04.2021 um 09:26 -0400 schrieb Marek Ol=C5=A1=C3=
=A1k:<br>
&gt; &gt; Ok. So that would only make the following use cases broken for no=
w:<br>
&gt; &gt; - amd render -&gt; external gpu<br>
<br>
Assuming said external GPU doesn&#39;t support memory fences.=C2=A0 If we d=
o<br>
amdgpu and i915 at the same time, that covers basically most of the<br>
external GPU use-cases.=C2=A0 Of course, we&#39;d want to convert nouveau a=
s<br>
well for the rest.<br>
<br>
&gt; &gt; - amd video encode -&gt; network device<br>
&gt;<br>
&gt; FWIW, &quot;only&quot; breaking amd render -&gt; external gpu will mak=
e us pretty<br>
&gt; unhappy, as we have some cases where we are combining an AMD APU with =
a<br>
&gt; FPGA based graphics card. I can&#39;t go into the specifics of this us=
e-<br>
&gt; case too much but basically the AMD graphics is rendering content that=
<br>
&gt; gets composited on top of a live video pipeline running through the<br=
>
&gt; FPGA.<br>
<br>
I think it&#39;s worth taking a step back and asking what&#39;s being here<=
br>
before we freak out too much.=C2=A0 If we do go this route, it doesn&#39;t =
mean<br>
that your FPGA use-case can&#39;t work, it just means it won&#39;t work<br>
out-of-the box anymore.=C2=A0 You&#39;ll have to separate execution and mem=
ory<br>
dependencies inside your FPGA driver.=C2=A0 That&#39;s still not great but =
it&#39;s<br>
not as bad as you maybe made it sound.<br>
<br>
&gt; &gt; What about the case when we get a buffer from an external device =
and<br>
&gt; &gt; we&#39;re supposed to make it &quot;busy&quot; when we are using =
it, and the<br>
&gt; &gt; external device wants to wait until we stop using it? Is it somet=
hing<br>
&gt; &gt; that can happen, thus turning &quot;external -&gt; amd&quot; into=
 &quot;external &lt;-&gt;<br>
&gt; &gt; amd&quot;?<br>
&gt;<br>
&gt; Zero-copy texture sampling from a video input certainly appreciates<br=
>
&gt; this very much. Trying to pass the render fence through the various<br=
>
&gt; layers of userspace to be able to tell when the video input can reuse =
a<br>
&gt; buffer is a great experience in yak shaving. Allowing the video input<=
br>
&gt; to reuse the buffer as soon as the read dma_fence from the GPU is<br>
&gt; signaled is much more straight forward.<br>
<br>
Oh, it&#39;s definitely worse than that.=C2=A0 Every window system interact=
ion<br>
is bi-directional.=C2=A0 The X server has to wait on the client before<br>
compositing from it and the client has to wait on X before re-using<br>
that back-buffer.=C2=A0 Of course, we can break that later dependency by<br=
>
doing a full CPU wait but that&#39;s going to mean either more latency or<b=
r>
reserving more back buffers.=C2=A0 There&#39;s no good clean way to claim t=
hat<br>
any of this is one-directional.<br>
<br>
--Jason<br>
</blockquote></div>

--0000000000003d514905c0fb5f40--

--===============0581931641==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0581931641==--
