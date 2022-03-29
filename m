Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 228564EB1C6
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 18:26:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E67D10F0A8;
	Tue, 29 Mar 2022 16:26:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D30A10EEA5;
 Tue, 29 Mar 2022 16:26:09 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id s8so16308359pfk.12;
 Tue, 29 Mar 2022 09:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z0skRF1cKszdAwdy1NOSSv3UUm0nD3qQztsUo0whUH0=;
 b=gs3P/VA1wMSrmlLQqTdyefKJ1wsKgamxTTBo7ondUp+1V+16YZ+nZ7nVoUQhCXqaaJ
 MIecPjOSf44C4xmChCER16eRimBqIlGIuOctDQ5Om3NGRXs1ikcsoqz1Cxxg5dD0TVnO
 WlJNfiuQtq00Zm3rWGYf8mF06eyKH8VWNLl0BqV98qBy1z7BGPkHDvDK1sp01bGc0/E3
 f9iCZPMI9UGdIssgZdtogEHGuZJD/Rxa37jPR3PsrWLXeTNCuP/IWKhEz0B8Cu5yoZib
 UX5ZNA9UbpUiV/QL358yzZQ4x4H2yKzLTeBccs5gV5PQefBmLF37XeGpkwYmkKQoa+JR
 R5Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z0skRF1cKszdAwdy1NOSSv3UUm0nD3qQztsUo0whUH0=;
 b=jkB8u5ADd/cLutoo3QlQViE2Ndj357iwzTi+ytzllAaSNQPh1ICEYejR+4OM3Tq2ST
 keUW/qOiykZ2jKJHnh3FaD3JwG3wMZxX3I5dAV+Tcnov8sxFVH2OBhxPn2uH9BUpYrvJ
 LZWIki1DGG/6qqg5ZeSgwELaY7A8wdYxADtGvv0zABMGHQjo1MavwT4lgNPx1CSfzloC
 CgVQTXx5OUhhhxy6jCgBaIVMcFHnSXC413Vt0yY2gkfOf7l5r9RfvZ9eT485krmFJ+Mp
 k59Jv6HiXn6Cmpw+dCtfGr4eJrdhAJPXiJVqfdydro1V6N9S6JfozYqrCsiL2QR55m2/
 3ZlQ==
X-Gm-Message-State: AOAM531iIX22UlEj8G0B0Z5yJWwceUHNsOokW3EX7u5cuYJ32If7qaMi
 SaKHM+vEKZKnSv/WYZ4XNZ14cDLSj5GB6hes1y0=
X-Google-Smtp-Source: ABdhPJysE+9H0hza9pZhskjC9tzJEAaXgLsh1EbWM02LLxXwFuF8gBb3kw8eAjzu71AIlVh0FD4t+sz96gFETHV8wPE=
X-Received: by 2002:a63:d149:0:b0:384:b288:8704 with SMTP id
 c9-20020a63d149000000b00384b2888704mr2532675pgj.112.1648571168736; Tue, 29
 Mar 2022 09:26:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220311102709.225616cf@eldfell> <20220316104815.11ec2e6c@eldfell>
 <CADnq5_MbOLaZGaQ8fYW_ZL3+gssu3cq7QbzByOWdLuvbdfSAAg@mail.gmail.com>
 <CAF6AEGvoqJmXs0KxXGN4qKD4U6Yeo4gDq6sVxm=noY-TwFoj4w@mail.gmail.com>
 <5e246eb8-0256-c40e-40ea-d865bf99c003@gmail.com>
 <YjL/k6kh+5RihGIV@phenom.ffwll.local>
 <CAF6AEGu79jDW1xqJOaNCB=jAxhKiCRFJwoCNiC9ye97KvpWEtQ@mail.gmail.com>
 <YjNvYmcuDKiIneDx@phenom.ffwll.local>
 <CAF6AEGvuMfKtf_aweai6y4oHghArE95uhR2X0f9h_9w4Bk_6VQ@mail.gmail.com>
 <19a67000-d1e5-0582-c6de-07d9988b1735@amd.com>
 <CAF6AEGvDjw6zq3yiorhOc+vp2US+Jso9tF74=8gyJMTm=K5FVQ@mail.gmail.com>
 <3f0b7273-4562-7a55-e52a-bd64334886fd@amd.com>
 <CAF6AEGu6FabmcWE+NsPgnPU0=MpbA6bmO1KkJ2hrVDBLFY92xA@mail.gmail.com>
 <CAPj87rOx1uogqqKX8XZEnzpcKKY6W9TWHQFr-bgZyEU0-ftjVw@mail.gmail.com>
 <CAKMK7uFMmLLRQeONDOMpOg12p7moyrC-+hxVEqpa4hSFopbGtA@mail.gmail.com>
 <5e7d4b55-99ca-5fa4-2995-5e42d0a29473@amd.com>
 <DM6PR12MB473154C6C678EA97C03979A4F91B9@DM6PR12MB4731.namprd12.prod.outlook.com>
 <5818c2a4-80c4-8af2-9937-d2787054c149@amd.com>
In-Reply-To: <5818c2a4-80c4-8af2-9937-d2787054c149@amd.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Tue, 29 Mar 2022 12:25:55 -0400
Message-ID: <CAAxE2A642QK0NFRLYsq5PuossG_mLExiJD8SzipVc4xVp_V=tw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: multipart/alternative; boundary="000000000000e64c9105db5de273"
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
Cc: Rob Clark <robdclark@chromium.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Sharma,
 Shashank" <Shashank.Sharma@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, "Olsak,
 Marek" <Marek.Olsak@amd.com>, "Somalapuram,
 Amaranath" <Amaranath.Somalapuram@amd.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Shashank Sharma <contactshashanksharma@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000e64c9105db5de273
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I don't know what iris does, but I would guess that the same problems as
with AMD GPUs apply, making GPUs resets very fragile.

Marek

On Tue., Mar. 29, 2022, 08:14 Christian K=C3=B6nig, <christian.koenig@amd.c=
om>
wrote:

> My main question is what does the iris driver better than radeonsi when
> the client doesn't support the robustness extension?
>
> From Daniels description it sounds like they have at least a partial
> recovery mechanism in place.
>
> Apart from that I completely agree to what you said below.
>
> Christian.
>
> Am 26.03.22 um 01:53 schrieb Olsak, Marek:
>
> [AMD Official Use Only]
>
> amdgpu has 2 resets: soft reset and hard reset.
>
> The soft reset is able to recover from an infinite loop and even some GPU
> hangs due to bad shaders or bad states. The soft reset uses a signal that
> kills all currently-running shaders of a certain process (VM context),
> which unblocks the graphics pipeline, so draws and command buffers finish
> but are not correctly. This can then cause a hard hang if the shader was
> supposed to signal work completion through a shader store instruction and=
 a
> non-shader consumer is waiting for it (skipping the store instruction by
> killing the shader won't signal the work, and thus the consumer will be
> stuck, requiring a hard reset).
>
> The hard reset can recover from other hangs, which is great, but it may
> use a PCI reset, which erases VRAM on dGPUs. APUs don't lose memory
> contents, but we should assume that any process that had running jobs on
> the GPU during a GPU reset has its memory resources in an inconsistent
> state, and thus following command buffers can cause another GPU hang. The
> shader store example above is enough to cause another hard hang due to
> incorrect content in memory resources, which can contain synchronization
> primitives that are used internally by the hardware.
>
> Asking the driver to replay a command buffer that caused a hang is a sure
> way to hang it again. Unrelated processes can be affected due to lost VRA=
M
> or the misfortune of using the GPU while the GPU hang occurred. The windo=
w
> system should recreate GPU resources and redraw everything without
> affecting applications. If apps use GL, they should do the same. Processe=
s
> that can't recover by redrawing content can be terminated or left alone,
> but they shouldn't be allowed to submit work to the GPU anymore.
>
> dEQP only exercises the soft reset. I think WebGL is only able to trigger
> a soft reset at this point, but Vulkan can also trigger a hard reset.
>
> Marek
> ------------------------------
> *From:* Koenig, Christian <Christian.Koenig@amd.com>
> <Christian.Koenig@amd.com>
> *Sent:* March 23, 2022 11:25
> *To:* Daniel Vetter <daniel@ffwll.ch> <daniel@ffwll.ch>; Daniel Stone
> <daniel@fooishbar.org> <daniel@fooishbar.org>; Olsak, Marek
> <Marek.Olsak@amd.com> <Marek.Olsak@amd.com>; Grodzovsky, Andrey
> <Andrey.Grodzovsky@amd.com> <Andrey.Grodzovsky@amd.com>
> *Cc:* Rob Clark <robdclark@gmail.com> <robdclark@gmail.com>; Rob Clark
> <robdclark@chromium.org> <robdclark@chromium.org>; Sharma, Shashank
> <Shashank.Sharma@amd.com> <Shashank.Sharma@amd.com>; Christian K=C3=B6nig
> <ckoenig.leichtzumerken@gmail.com> <ckoenig.leichtzumerken@gmail.com>;
> Somalapuram, Amaranath <Amaranath.Somalapuram@amd.com>
> <Amaranath.Somalapuram@amd.com>; Abhinav Kumar <quic_abhinavk@quicinc.com=
>
> <quic_abhinavk@quicinc.com>; dri-devel <dri-devel@lists.freedesktop.org>
> <dri-devel@lists.freedesktop.org>; amd-gfx list
> <amd-gfx@lists.freedesktop.org> <amd-gfx@lists.freedesktop.org>; Deucher,
> Alexander <Alexander.Deucher@amd.com> <Alexander.Deucher@amd.com>;
> Shashank Sharma <contactshashanksharma@gmail.com>
> <contactshashanksharma@gmail.com>
> *Subject:* Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event
>
> [Adding Marek and Andrey as well]
>
> Am 23.03.22 um 16:14 schrieb Daniel Vetter:
> > On Wed, 23 Mar 2022 at 15:07, Daniel Stone <daniel@fooishbar.org>
> <daniel@fooishbar.org> wrote:
> >> Hi,
> >>
> >> On Mon, 21 Mar 2022 at 16:02, Rob Clark <robdclark@gmail.com>
> <robdclark@gmail.com> wrote:
> >>> On Mon, Mar 21, 2022 at 2:30 AM Christian K=C3=B6nig
> >>> <christian.koenig@amd.com> <christian.koenig@amd.com> wrote:
> >>>> Well you can, it just means that their contexts are lost as well.
> >>> Which is rather inconvenient when deqp-egl reset tests, for example,
> >>> take down your compositor ;-)
> >> Yeah. Or anything WebGL.
> >>
> >> System-wide collateral damage is definitely a non-starter. If that
> >> means that the userspace driver has to do what iris does and ensure
> >> everything's recreated and resubmitted, that works too, just as long
> >> as the response to 'my adblocker didn't detect a crypto miner ad'  is
> >> something better than 'shoot the entire user session'.
> > Not sure where that idea came from, I thought at least I made it clear
> > that legacy gl _has_ to recover. It's only vk and arb_robustness gl
> > which should die without recovery attempt.
> >
> > The entire discussion here is who should be responsible for replay and
> > at least if you can decide the uapi, then punting that entirely to
> > userspace is a good approach.
>
> Yes, completely agree. We have the approach of re-submitting things in
> the kernel and that failed quite miserable.
>
> In other words currently a GPU reset has something like a 99% chance to
> get down your whole desktop.
>
> Daniel can you briefly explain what exactly iris does when a lost
> context is detected without gl robustness?
>
> It sounds like you guys got that working quite well.
>
> Thanks,
> Christian.
>
> >
> > Ofc it'd be nice if the collateral damage is limited, i.e. requests
> > not currently on the gpu, or on different engines and all that
> > shouldn't be nuked, if possible.
> >
> > Also ofc since msm uapi is that the kernel tries to recover there's
> > not much we can do there, contexts cannot be shot. But still trying to
> > replay them as much as possible feels a bit like overkill.
> > -Daniel
> >
> >> Cheers,
> >> Daniel
> >
> >
>
>
>

--000000000000e64c9105db5de273
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I don&#39;t know what iris does, but I would guess that t=
he same problems as with AMD GPUs apply, making GPUs resets very fragile.<d=
iv dir=3D"auto"><br></div><div dir=3D"auto">Marek</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue., Mar. 29, 20=
22, 08:14 Christian K=C3=B6nig, &lt;<a href=3D"mailto:christian.koenig@amd.=
com">christian.koenig@amd.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">

 =20
  <div>
    My main question is what does the iris driver better than radeonsi
    when the client doesn&#39;t support the robustness extension?<br>
    <br>
    From Daniels description it sounds like they have at least a partial
    recovery mechanism in place.<br>
    <br>
    Apart from that I completely agree to what you said below.<br>
    <br>
    Christian.<br>
    <br>
    <div>Am 26.03.22 um 01:53 schrieb Olsak,
      Marek:<br>
    </div>
    <blockquote type=3D"cite">
     =20
     =20
      <p style=3D"font-family:Arial;font-size:10pt;color:#0000ff;margin:5pt=
" align=3D"Left">
        [AMD Official Use Only]<br>
      </p>
      <br>
      <div>
        <div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-s=
ize:12pt;color:rgb(0,0,0)">
          amdgpu has 2 resets: soft reset and hard reset.<br>
        </div>
        <div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-s=
ize:12pt;color:rgb(0,0,0)">
          <br>
        </div>
        <div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-s=
ize:12pt;color:rgb(0,0,0)">
          The soft reset is able to recover from an infinite loop and
          even some GPU hangs due to bad shaders or bad states. The soft
          reset uses a signal that kills all currently-running shaders
          of a certain process (VM context), which unblocks the graphics
          pipeline, so draws and command buffers finish but are not
          correctly. This can then cause a hard hang if the shader was
          supposed to signal work completion through a shader store
          instruction and a non-shader consumer is waiting for it
          (skipping the store instruction by killing the shader won&#39;t
          signal the work, and thus the consumer will be stuck,
          requiring a hard reset).<br>
        </div>
        <div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-s=
ize:12pt;color:rgb(0,0,0)">
          <br>
        </div>
        <div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-s=
ize:12pt;color:rgb(0,0,0)">
          <span style=3D"font-size:12pt">The hard reset can recover from
            other hangs, which is great, but it may use a PCI reset,
            which erases VRAM on dGPUs. APUs don&#39;t lose memory contents=
,
            but we should assume that any process that had running jobs
            on the GPU during a GPU reset has its memory resources in an
            inconsistent state, and thus following command buffers can
            cause another GPU hang. The shader store example above is
            enough to cause another hard hang due to incorrect content
            in memory resources, which can contain synchronization
            primitives that are used internally by the hardware.</span><br>
          <span style=3D"font-size:12pt"></span></div>
        <div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-s=
ize:12pt;color:rgb(0,0,0)">
          <br>
        </div>
        <div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-s=
ize:12pt;color:rgb(0,0,0)">
          <span style=3D"font-size:12pt">Asking the driver to replay a
            command buffer that caused a hang is a sure way to hang it
            again. Unrelated processes can be affected due to lost VRAM
            or the misfortune of using the GPU while the GPU hang
            occurred. The window system should recreate GPU resources
            and redraw everything without affecting applications. If
            apps use GL, they should do the same. Processes that can&#39;t
            recover by redrawing content can be terminated or left
            alone, but they shouldn&#39;t be allowed to submit work to the
            GPU anymore.</span><br>
          <span style=3D"font-size:12pt"></span><br>
        </div>
        <div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-s=
ize:12pt;color:rgb(0,0,0)">
          dEQP only exercises the soft reset. I think WebGL is only able
          to trigger a soft reset at this point, but Vulkan can also
          trigger a hard reset.<br>
        </div>
        <div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-s=
ize:12pt;color:rgb(0,0,0)">
          <br>
        </div>
        <div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-s=
ize:12pt;color:rgb(0,0,0)">
          Marek<br>
        </div>
        <hr style=3D"display:inline-block;width:98%">
        <div id=3D"m_7185412060794202476divRplyFwdMsg" dir=3D"ltr"><font st=
yle=3D"font-size:11pt" face=3D"Calibri, sans-serif" color=3D"#000000"><b>Fr=
om:</b>
            Koenig, Christian <a href=3D"mailto:Christian.Koenig@amd.com" t=
arget=3D"_blank" rel=3D"noreferrer">&lt;Christian.Koenig@amd.com&gt;</a><br=
>
            <b>Sent:</b> March 23, 2022 11:25<br>
            <b>To:</b> Daniel Vetter <a href=3D"mailto:daniel@ffwll.ch" tar=
get=3D"_blank" rel=3D"noreferrer">&lt;daniel@ffwll.ch&gt;</a>; Daniel
            Stone <a href=3D"mailto:daniel@fooishbar.org" target=3D"_blank"=
 rel=3D"noreferrer">&lt;daniel@fooishbar.org&gt;</a>; Olsak, Marek
            <a href=3D"mailto:Marek.Olsak@amd.com" target=3D"_blank" rel=3D=
"noreferrer">&lt;Marek.Olsak@amd.com&gt;</a>; Grodzovsky, Andrey
            <a href=3D"mailto:Andrey.Grodzovsky@amd.com" target=3D"_blank" =
rel=3D"noreferrer">&lt;Andrey.Grodzovsky@amd.com&gt;</a><br>
            <b>Cc:</b> Rob Clark <a href=3D"mailto:robdclark@gmail.com" tar=
get=3D"_blank" rel=3D"noreferrer">&lt;robdclark@gmail.com&gt;</a>; Rob Clar=
k
            <a href=3D"mailto:robdclark@chromium.org" target=3D"_blank" rel=
=3D"noreferrer">&lt;robdclark@chromium.org&gt;</a>; Sharma, Shashank
            <a href=3D"mailto:Shashank.Sharma@amd.com" target=3D"_blank" re=
l=3D"noreferrer">&lt;Shashank.Sharma@amd.com&gt;</a>; Christian K=C3=B6nig
            <a href=3D"mailto:ckoenig.leichtzumerken@gmail.com" target=3D"_=
blank" rel=3D"noreferrer">&lt;ckoenig.leichtzumerken@gmail.com&gt;</a>; Som=
alapuram,
            Amaranath <a href=3D"mailto:Amaranath.Somalapuram@amd.com" targ=
et=3D"_blank" rel=3D"noreferrer">&lt;Amaranath.Somalapuram@amd.com&gt;</a>;=
 Abhinav
            Kumar <a href=3D"mailto:quic_abhinavk@quicinc.com" target=3D"_b=
lank" rel=3D"noreferrer">&lt;quic_abhinavk@quicinc.com&gt;</a>; dri-devel
            <a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_b=
lank" rel=3D"noreferrer">&lt;dri-devel@lists.freedesktop.org&gt;</a>; amd-g=
fx list
            <a href=3D"mailto:amd-gfx@lists.freedesktop.org" target=3D"_bla=
nk" rel=3D"noreferrer">&lt;amd-gfx@lists.freedesktop.org&gt;</a>; Deucher, =
Alexander
            <a href=3D"mailto:Alexander.Deucher@amd.com" target=3D"_blank" =
rel=3D"noreferrer">&lt;Alexander.Deucher@amd.com&gt;</a>; Shashank Sharma
            <a href=3D"mailto:contactshashanksharma@gmail.com" target=3D"_b=
lank" rel=3D"noreferrer">&lt;contactshashanksharma@gmail.com&gt;</a><br>
            <b>Subject:</b> Re: [PATCH v2 1/2] drm: Add GPU reset sysfs
            event</font>
          <div>=C2=A0</div>
        </div>
        <div><font size=3D"2"><span style=3D"font-size:11pt">
              <div>[Adding Marek and Andrey as well]<br>
                <br>
                Am 23.03.22 um 16:14 schrieb Daniel Vetter:<br>
                &gt; On Wed, 23 Mar 2022 at 15:07, Daniel Stone
                <a href=3D"mailto:daniel@fooishbar.org" target=3D"_blank" r=
el=3D"noreferrer">&lt;daniel@fooishbar.org&gt;</a> wrote:<br>
                &gt;&gt; Hi,<br>
                &gt;&gt;<br>
                &gt;&gt; On Mon, 21 Mar 2022 at 16:02, Rob Clark
                <a href=3D"mailto:robdclark@gmail.com" target=3D"_blank" re=
l=3D"noreferrer">&lt;robdclark@gmail.com&gt;</a> wrote:<br>
                &gt;&gt;&gt; On Mon, Mar 21, 2022 at 2:30 AM Christian
                K=C3=B6nig<br>
                &gt;&gt;&gt; <a href=3D"mailto:christian.koenig@amd.com" ta=
rget=3D"_blank" rel=3D"noreferrer">&lt;christian.koenig@amd.com&gt;</a> wro=
te:<br>
                &gt;&gt;&gt;&gt; Well you can, it just means that their
                contexts are lost as well.<br>
                &gt;&gt;&gt; Which is rather inconvenient when deqp-egl
                reset tests, for example,<br>
                &gt;&gt;&gt; take down your compositor ;-)<br>
                &gt;&gt; Yeah. Or anything WebGL.<br>
                &gt;&gt;<br>
                &gt;&gt; System-wide collateral damage is definitely a
                non-starter. If that<br>
                &gt;&gt; means that the userspace driver has to do what
                iris does and ensure<br>
                &gt;&gt; everything&#39;s recreated and resubmitted, that
                works too, just as long<br>
                &gt;&gt; as the response to &#39;my adblocker didn&#39;t de=
tect
                a crypto miner ad&#39;=C2=A0 is<br>
                &gt;&gt; something better than &#39;shoot the entire user
                session&#39;.<br>
                &gt; Not sure where that idea came from, I thought at
                least I made it clear<br>
                &gt; that legacy gl _has_ to recover. It&#39;s only vk and
                arb_robustness gl<br>
                &gt; which should die without recovery attempt.<br>
                &gt;<br>
                &gt; The entire discussion here is who should be
                responsible for replay and<br>
                &gt; at least if you can decide the uapi, then punting
                that entirely to<br>
                &gt; userspace is a good approach.<br>
                <br>
                Yes, completely agree. We have the approach of
                re-submitting things in <br>
                the kernel and that failed quite miserable.<br>
                <br>
                In other words currently a GPU reset has something like
                a 99% chance to <br>
                get down your whole desktop.<br>
                <br>
                Daniel can you briefly explain what exactly iris does
                when a lost <br>
                context is detected without gl robustness?<br>
                <br>
                It sounds like you guys got that working quite well.<br>
                <br>
                Thanks,<br>
                Christian.<br>
                <br>
                &gt;<br>
                &gt; Ofc it&#39;d be nice if the collateral damage is
                limited, i.e. requests<br>
                &gt; not currently on the gpu, or on different engines
                and all that<br>
                &gt; shouldn&#39;t be nuked, if possible.<br>
                &gt;<br>
                &gt; Also ofc since msm uapi is that the kernel tries to
                recover there&#39;s<br>
                &gt; not much we can do there, contexts cannot be shot.
                But still trying to<br>
                &gt; replay them as much as possible feels a bit like
                overkill.<br>
                &gt; -Daniel<br>
                &gt;<br>
                &gt;&gt; Cheers,<br>
                &gt;&gt; Daniel<br>
                &gt;<br>
                &gt;<br>
                <br>
              </div>
            </span></font></div>
      </div>
    </blockquote>
    <br>
  </div>

</blockquote></div>

--000000000000e64c9105db5de273--
