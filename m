Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12310366025
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 21:20:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02FC06E8AD;
	Tue, 20 Apr 2021 19:20:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A62AA6E8AC;
 Tue, 20 Apr 2021 19:20:46 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id d124so26222285pfa.13;
 Tue, 20 Apr 2021 12:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FLOvafCk5IPNxLxmN7K5BPOmmyGvxBREL2PFyeVR5Y8=;
 b=byG6YcNkCR19pC1CnP/hRPPjdAYAd5wSy7F8G4Xl8K8pUyhPKEJi99/RX+T+4+CxZ9
 g4Azc3Xb15VNY98AtrrrfZDyhkKTfG/J9R4qsXtVIVcR+erRV7U/H7l9g5RkE+T59tNR
 vAXx2DytMYIBT7vWThSMdKt5sLldNDX5imOfbx4Accb4ngisG+JikeGljIArm9EsgfEy
 WGSHGnUqMf48vwp2BUaxXiOqLhf++1dNd0r1ws25txQRW/hAQ2rAFZ1jFrXycAEEVvj1
 yuwNOsEhQsQ/yElBlRM+PP6rNLOnyO0/LuXMMZY01rsof4Gpc0x8rmKoovJHs7vQmY9N
 WbXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FLOvafCk5IPNxLxmN7K5BPOmmyGvxBREL2PFyeVR5Y8=;
 b=OoGk7m1vVReb9SRkPhrL8nNwED4lte8Gbnx2iRZwWQyFOua6dwnl/yVI2imdSVdRGR
 rEj0d1cVC2xkZZ9dwZjVd4t0+7fHHZf9sKoD9zOzDztYBkrzzEs91J0IcQwqN3QuPzsp
 mmzQqHu+/7kH6FpBhsb+sc17I44O8ZZz83pm3piukxCb+yHgEnPk7Xi/zxCm1jjOeCt9
 JkNc6/xtWgXLmXM6SVzgaDMVRYeSt9S8N5r8FhAkR+BBo/QH3FsfcfiKQRHULAnHeTSp
 NBkDT4b55jZWueLTwycHC+8ZDMNF3IiW3Ne4XE0c+7LClMcDePwdmSA9P4qsBS1lUTpV
 nivA==
X-Gm-Message-State: AOAM532xcNpbZkxgjq+WnKglCtJNlU+zPJAdnZ/I7/1Z24fwiwFQqILA
 KbK4U/h8HTwp06BwdXJtHMqhlSzDl8Of3qcwCzw=
X-Google-Smtp-Source: ABdhPJzfu/v3tm46fJf/Cnu9KUyHCkxRITjNJi3e6KCOdD+VhBOE5kKPUlbb9clPLums3yIrzj34bpTHL++7gh35xiM=
X-Received: by 2002:a17:90b:1b4a:: with SMTP id
 nv10mr6931365pjb.75.1618946446290; 
 Tue, 20 Apr 2021 12:20:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAAxE2A4mpapnCE7uw8GNWkaRR4jXeoz9qa9j=9XknjR3yeq3YQ@mail.gmail.com>
 <CAPj87rO7_Q2L0PogryGmuxLJk-DA3ckM+6vmDioErZ3_6s0iRQ@mail.gmail.com>
 <136d3b55-ff1e-c47b-d443-22bd27427956@gmail.com>
 <CAPj87rMSk+SgCBfrcQTEvppp=qQv4MRdeHRKAOUn5pZAEhh9mg@mail.gmail.com>
 <8e5026aa-599e-52d0-4959-6c3bcc16cb76@gmail.com>
 <CAPj87rMzFfouhv89-Vj3jDsH8JB5NFiyv+yV07KvJZaa2rB7Kw@mail.gmail.com>
 <CAAxE2A442Rkn5RfU9KH4cBzURZxqHgCX73-GVYrR+8u1cPXowg@mail.gmail.com>
 <CAKMK7uGpvgEKcaNpFKQ=D4cPH1vbWnQR8m-xV2Ek_goDQfcGUg@mail.gmail.com>
In-Reply-To: <CAKMK7uGpvgEKcaNpFKQ=D4cPH1vbWnQR8m-xV2Ek_goDQfcGUg@mail.gmail.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Tue, 20 Apr 2021 15:20:10 -0400
Message-ID: <CAAxE2A5ZC=97Ab4ZL-ds0WnEDOL=B7RigxBLBUz2a6FL1Bdudw@mail.gmail.com>
Subject: Re: [Mesa-dev] [RFC] Linux Graphics Next: Explicit fences everywhere
 and no BO fences - initial proposal
To: Daniel Vetter <daniel@ffwll.ch>
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0360702674=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0360702674==
Content-Type: multipart/alternative; boundary="000000000000d7718405c06c57fa"

--000000000000d7718405c06c57fa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 20, 2021 at 2:39 PM Daniel Vetter <daniel@ffwll.ch> wrote:

> On Tue, Apr 20, 2021 at 6:25 PM Marek Ol=C5=A1=C3=A1k <maraeo@gmail.com> =
wrote:
> >
> > Daniel, imagine hardware that can only do what Windows does: future
> fences signalled by userspace whenever userspace wants, and no kernel
> queues like we have today.
> >
> > The only reason why current AMD GPUs work is because they have a ring
> buffer per queue with pointers to userspace command buffers followed by
> fences. What will we do if that ring buffer is removed?
>
> Well this is an entirely different problem than what you set out to
> describe. This is essentially the problem where hw does not have any
> support for priviledged commands and separate priviledges command
> buffer, and direct userspace submit is the only thing that is
> available.
>
> I think if this is your problem, then you get to implement some very
> interesting compat shim. But that's an entirely different problem from
> what you've described in your mail. This pretty much assumes at the hw
> level the only thing that works is ATS/pasid, and vram is managed with
> HMM exclusively. Once you have that pure driver stack you get to fake
> it in the kernel for compat with everything that exists already. How
> exactly that will look and how exactly you best construct your
> dma_fences for compat will depend highly upon how much is still there
> in this hw (e.g. wrt interrupt generation). A lot of the
> infrastructure was also done as part of drm_syncobj. I mean we have
> entirely fake kernel drivers like vgem/vkms that create dma_fence, so
> a hw ringbuffer is really not required.
>
> So ... is this your problem underneath it all, or was that more a wild
> strawman for the discussion?
>

Yes, that's the problem.

Marek

--000000000000d7718405c06c57fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, Apr 20, 2021 at 2:39 PM Daniel Vetter &lt;<a href=3D"mailto:=
daniel@ffwll.ch">daniel@ffwll.ch</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Tue, Apr 20, 2021 at 6:25 PM Marek Ol=
=C5=A1=C3=A1k &lt;<a href=3D"mailto:maraeo@gmail.com" target=3D"_blank">mar=
aeo@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Daniel, imagine hardware that can only do what Windows does: future fe=
nces signalled by userspace whenever userspace wants, and no kernel queues =
like we have today.<br>
&gt;<br>
&gt; The only reason why current AMD GPUs work is because they have a ring =
buffer per queue with pointers to userspace command buffers followed by fen=
ces. What will we do if that ring buffer is removed?<br>
<br>
Well this is an entirely different problem than what you set out to<br>
describe. This is essentially the problem where hw does not have any<br>
support for priviledged commands and separate priviledges command<br>
buffer, and direct userspace submit is the only thing that is<br>
available.<br>
<br>
I think if this is your problem, then you get to implement some very<br>
interesting compat shim. But that&#39;s an entirely different problem from<=
br>
what you&#39;ve described in your mail. This pretty much assumes at the hw<=
br>
level the only thing that works is ATS/pasid, and vram is managed with<br>
HMM exclusively. Once you have that pure driver stack you get to fake<br>
it in the kernel for compat with everything that exists already. How<br>
exactly that will look and how exactly you best construct your<br>
dma_fences for compat will depend highly upon how much is still there<br>
in this hw (e.g. wrt interrupt generation). A lot of the<br>
infrastructure was also done as part of drm_syncobj. I mean we have<br>
entirely fake kernel drivers like vgem/vkms that create dma_fence, so<br>
a hw ringbuffer is really not required.<br>
<br>
So ... is this your problem underneath it all, or was that more a wild<br>
strawman for the discussion?<br></blockquote><div><br></div>Yes, that&#39;s=
 the problem.<br></div><div class=3D"gmail_quote"><br></div><div class=3D"g=
mail_quote">Marek<br></div></div>

--000000000000d7718405c06c57fa--

--===============0360702674==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0360702674==--
