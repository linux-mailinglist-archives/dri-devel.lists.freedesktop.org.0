Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98500828351
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 10:37:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF0C110E3BB;
	Tue,  9 Jan 2024 09:36:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAE6810E39E;
 Tue,  9 Jan 2024 09:36:55 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5572a9b3420so6343997a12.1; 
 Tue, 09 Jan 2024 01:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704793014; x=1705397814; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5khl7eHvYhtMQunShJImeBRlHTQllRiWb+J3Qx2ZJG0=;
 b=asZ2zUOGu4HL4iRRlxsFEIWNo6dfvh8IKBk7uL1wbiJco1IL4IVPsgqC5vUK343Id8
 EVpDOwDu/GALdoyAHjZseGz/sTpjfJr/l+gfSK25R6TDwPHbD6Tf1DXM/v1L8sDlgtPL
 yVR+khTo8tEabFLIW9eHtPuHiwgwXB6ydBS0aZQ99zD896X7/onRKdNU1lznxKbZ8eiQ
 0j44CeWWF42wOoRmVHTNALRmcpeKfnVzxhZFeDv94lpMTLMnmIiUUbwUm2Iw+XceWyHo
 p7Y3JQ2nsK0jBM6aqL6vtnFECbfeKzynEi8Njo0v1ovViuOXTkmUCrWJkxEfiog2++Jl
 NP2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704793014; x=1705397814;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5khl7eHvYhtMQunShJImeBRlHTQllRiWb+J3Qx2ZJG0=;
 b=wf6YIkRm9U3xBWCX71wHoJQyHjXUMH3Irrj4+7vvmE72ETMX1+mwVRXUQ0wiZYrj+v
 orM2908yEWMUu1Bf5zWT8KCYeNOochGqW0/yu7h2H0y233ncAU99xvjxJHA6TMFVMiX9
 3dec9Kj28dCpDX4srfo8VYwqIBD9Z+ahsm39FPTvm+pJrAx7AhggRiJeD/TinxNBkfHm
 A7gIr2UAQCStpE4t84VCTRn580Q4oCsKMRtPOoRbaA7Oh9AbkwdpjAF9QC4lqJPjZgC2
 1VT80RODWoc3P9f+zvEh9JCjqW2Ph3H+FAWB/ArZ6bmWlkFRUOtGdf6EMFsTnIvnh8fn
 XwxQ==
X-Gm-Message-State: AOJu0YzTg1SO1CWlct8U+mf5DHP8bAWEAJozPWBS7cz49Pr8UANpEl8l
 16qlycWv1hctrLZDiYQqm3mmGw5lQCr71H8ljQ6r+Gn9
X-Google-Smtp-Source: AGHT+IFaWAEYnoDpHIrilMho1TkbbhYlgOyxQ/ZiSEodAzDz+0qqakOoBHaGayqfShbMpjsUJ09j2+3Jz2x9MfavqYA=
X-Received: by 2002:a17:907:77c1:b0:a2a:19eb:9144 with SMTP id
 kz1-20020a17090777c100b00a2a19eb9144mr475897ejc.1.1704793013950; Tue, 09 Jan
 2024 01:36:53 -0800 (PST)
MIME-Version: 1.0
References: <1uy9gy5eaet-1uyc0ts8e2e@nsmail7.0.0--kylin--1>
 <dd7d81bc-a965-4b44-9884-2d59d4b04103@amd.com>
In-Reply-To: <dd7d81bc-a965-4b44-9884-2d59d4b04103@amd.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Tue, 9 Jan 2024 04:36:42 -0500
Message-ID: <CAAxE2A62piSKzTChujxo0H6zH=6P08+hDx_xientg2+RVum=bA@mail.gmail.com>
Subject: =?UTF-8?B?UmU6IOWbnuWkjTogUmU6IOWbnuWkjTogUmU6IFtQQVRDSCBsaWJkcm0gMS8yXSBhbWRncA==?=
 =?UTF-8?B?dTogZml4IHBhcmFtZXRlciBvZiBhbWRncHVfY3NfY3R4X2NyZWF0ZTI=?=
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: multipart/alternative; boundary="000000000000031a95060e800e34"
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
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Marek Olsak <marek.olsak@amd.com>, amd-gfx <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?B?5p2O55yf6IO9?= <lizhenneng@kylinos.cn>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000031a95060e800e34
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

int p =3D -1.
unsigned u =3D p;
int p2 =3D u;

p2 is -1.

Marek

On Tue, Jan 9, 2024, 03:26 Christian K=C3=B6nig <christian.koenig@amd.com> =
wrote:

> Am 09.01.24 um 09:09 schrieb =E6=9D=8E=E7=9C=9F=E8=83=BD:
>
> Thanks!
>
> What about the second patch?
>
> The second patch:   amdgpu: change proirity value to be consistent with
> kernel.
>
> As I want to pass AMDGPU_CTX_PRIORITY_LOW to kernel module drm-scheduler,
> if these two patches are not applyed,
>
> It can not pass LOW priority to drm-scheduler.
>
> Do you have any other suggestion?
>
>
> Well what exactly is the problem? Just use AMD_PRIORITY=3D-512.
>
> As far as I can see that is how it is supposed to be used.
>
> Regards,
> Christian.
>
>
>
>
>
>
>
>
> ----
>
>
>
>
>
> *=E4=B8=BB =E9=A2=98=EF=BC=9A*Re: =E5=9B=9E=E5=A4=8D: Re: [PATCH libdrm 1=
/2] amdgpu: fix parameter of
> amdgpu_cs_ctx_create2
> *=E6=97=A5 =E6=9C=9F=EF=BC=9A*2024-01-09 15:15
> *=E5=8F=91=E4=BB=B6=E4=BA=BA=EF=BC=9A*Christian K=C3=B6nig
> *=E6=94=B6=E4=BB=B6=E4=BA=BA=EF=BC=9A*=E6=9D=8E=E7=9C=9F=E8=83=BD;Marek O=
lsak;Pierre-Eric Pelloux-Prayer;dri-devel;amd-gfx;
>
> Am 09.01.24 um 02:50 schrieb =E6=9D=8E=E7=9C=9F=E8=83=BD:
>
> When the priority value is passed to the kernel, the kernel compares it
> with the following values:
>
> #define AMDGPU_CTX_PRIORITY_VERY_LOW    -1023
> #define AMDGPU_CTX_PRIORITY_LOW         -512
> #define AMDGPU_CTX_PRIORITY_NORMAL      0
> #define AMDGPU_CTX_PRIORITY_HIGH        512
> #define AMDGPU_CTX_PRIORITY_VERY_HIGH   1023
>
> If priority is uint32_t, we can't set LOW and VERY_LOW value to kernel
> context priority,
>
> Well that's nonsense.
>
> How the kernel handles the values and how userspace handles them are two
> separate things. You just need to make sure that it's always 32 bits.
>
> In other words if you have signed or unsigned data type in userspace is
> irrelevant for the kernel.
>
> You can refer to the kernel function amdgpu_ctx_priority_permit, if
> priority is greater
>
> than 0, and this process has not  CAP_SYS_NICE capibility or DRM_MASTER
> permission,
>
> this process will be exited.
>
> Correct, that's intentional.
>
> Regards,
> Christian.
>
>
>
>
>
>
> ----
>
>
>
>
>
> *=E4=B8=BB =E9=A2=98=EF=BC=9A*Re: [PATCH libdrm 1/2] amdgpu: fix paramete=
r of
> amdgpu_cs_ctx_create2
> *=E6=97=A5 =E6=9C=9F=EF=BC=9A*2024-01-09 00:28
> *=E5=8F=91=E4=BB=B6=E4=BA=BA=EF=BC=9A*Christian K=C3=B6nig
> *=E6=94=B6=E4=BB=B6=E4=BA=BA=EF=BC=9A*=E6=9D=8E=E7=9C=9F=E8=83=BD;Marek O=
lsak;Pierre-Eric Pelloux-Prayer;dri-devel;amd-gfx;
>
> Am 08.01.24 um 10:40 schrieb Zhenneng Li:
> > In order to pass the correct priority parameter to the kernel,
> > we must change priority type from uint32_t to int32_t.
>
> Hui what? Why should it matter if the parameter is signed or not?
>
> That doesn't seem to make sense.
>
> Regards,
> Christian.
>
> >
> > Signed-off-by: Zhenneng Li
> > ---
> > amdgpu/amdgpu.h | 2 +-
> > amdgpu/amdgpu_cs.c | 2 +-
> > 2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/amdgpu/amdgpu.h b/amdgpu/amdgpu.h
> > index 9bdbf366..f46753f3 100644
> > --- a/amdgpu/amdgpu.h
> > +++ b/amdgpu/amdgpu.h
> > @@ -896,7 +896,7 @@ int amdgpu_bo_list_update(amdgpu_bo_list_handle
> handle,
> > *
> > */
> > int amdgpu_cs_ctx_create2(amdgpu_device_handle dev,
> > - uint32_t priority,
> > + int32_t priority,
> > amdgpu_context_handle *context);
> > /**
> > * Create GPU execution Context
> > diff --git a/amdgpu/amdgpu_cs.c b/amdgpu/amdgpu_cs.c
> > index 49fc16c3..eb72c638 100644
> > --- a/amdgpu/amdgpu_cs.c
> > +++ b/amdgpu/amdgpu_cs.c
> > @@ -49,7 +49,7 @@ static int amdgpu_cs_reset_sem(amdgpu_semaphore_handl=
e
> sem);
> > * \return 0 on success otherwise POSIX Error code
> > */
> > drm_public int amdgpu_cs_ctx_create2(amdgpu_device_handle dev,
> > - uint32_t priority,
> > + int32_t priority,
> > amdgpu_context_handle *context)
> > {
> > struct amdgpu_context *gpu_context;
>
>
>

--000000000000031a95060e800e34
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">int p =3D -1.<div dir=3D"auto">unsigned u =3D p;</div><di=
v dir=3D"auto">int p2 =3D u;</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">p2 is -1.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Marek</di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Tue, Jan 9, 2024, 03:26 Christian K=C3=B6nig &lt;<a href=3D"mailto:chr=
istian.koenig@amd.com">christian.koenig@amd.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex"><u></u>

 =20
  <div>
    Am 09.01.24 um 09:09 schrieb =E6=9D=8E=E7=9C=9F=E8=83=BD:<br>
    <blockquote type=3D"cite">
     =20
      <p>Thanks!</p>
      <p>What about the second patch?</p>
      <p>The second patch:=C2=A0=C2=A0 amdgpu: change proirity value to be
        consistent with kernel.</p>
      <p>As I want to pass AMDGPU_CTX_PRIORITY_LOW to kernel module
        drm-scheduler, if these two patches are not applyed,=C2=A0</p>
      <p>It can not pass LOW priority to drm-scheduler.</p>
      <p>Do you have any other suggestion?</p>
    </blockquote>
    <br>
    Well what exactly is the problem? Just use AMD_PRIORITY=3D-512.<br>
    <br>
    As far as I can see that is how it is supposed to be used.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <br>
    <blockquote type=3D"cite">
      <p><br>
        <br>
        <br>
        <br>
        <br>
        <br>
        ----</p>
      <p>=C2=A0</p>
      <div id=3D"m_-4761085421037625214re" style=3D"margin-left:0.5em;paddi=
ng-left:0.5em;border-left:1px solid green"><br>
        <br>
        <br>
        <div style=3D"background-color:#f5f7fa"><strong>=E4=B8=BB=E3=80=80=
=E9=A2=98=EF=BC=9A</strong><span id=3D"m_-4761085421037625214subject">Re: =
=E5=9B=9E=E5=A4=8D: Re: [PATCH libdrm 1/2] amdgpu: fix
            parameter of amdgpu_cs_ctx_create2</span> <br>
          <strong>=E6=97=A5=E3=80=80=E6=9C=9F=EF=BC=9A</strong><span id=3D"=
m_-4761085421037625214date">2024-01-09 15:15</span> <br>
          <strong>=E5=8F=91=E4=BB=B6=E4=BA=BA=EF=BC=9A</strong><span id=3D"=
m_-4761085421037625214from">Christian K=C3=B6nig</span> <br>
          <strong>=E6=94=B6=E4=BB=B6=E4=BA=BA=EF=BC=9A</strong><span id=3D"=
m_-4761085421037625214to" style=3D"word-break:break-all">=E6=9D=8E=E7=9C=9F=
=E8=83=BD;Marek Olsak;Pierre-Eric
            Pelloux-Prayer;dri-devel;amd-gfx;</span></div>
        <br>
        <div id=3D"m_-4761085421037625214content">
          <div>
            <div>Am 09.01.24 um 02:50 schrieb =E6=9D=8E=E7=9C=9F=E8=83=BD:<=
br>
              <p>When the priority value is passed to the kernel, the
                kernel compares it with the following values:</p>
              <p>#define AMDGPU_CTX_PRIORITY_VERY_LOW=C2=A0=C2=A0=C2=A0 -10=
23<br>
                #define AMDGPU_CTX_PRIORITY_LOW=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -512<br>
                #define AMDGPU_CTX_PRIORITY_NORMAL=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0<br>
                #define AMDGPU_CTX_PRIORITY_HIGH=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 512<br>
                #define AMDGPU_CTX_PRIORITY_VERY_HIGH=C2=A0=C2=A0 1023</p>
              <p>If priority is uint32_t, we can&#39;t set LOW and VERY_LOW
                value to kernel context priority,</p>
              <br>
              Well that&#39;s nonsense.<br>
              <br>
              How the kernel handles the values and how userspace
              handles them are two separate things. You just need to
              make sure that it&#39;s always 32 bits.<br>
              <br>
              In other words if you have signed or unsigned data type in
              userspace is irrelevant for the kernel.<br>
              <br>
              <p>You can refer to the kernel function
                amdgpu_ctx_priority_permit, if priority is greater</p>
              <p>than 0, and this process has not=C2=A0 CAP_SYS_NICE
                capibility or DRM_MASTER permission,</p>
              <p>this process will be exited.</p>
              <br>
              Correct, that&#39;s intentional.<br>
              <br>
              Regards,<br>
              Christian.<br>
              <br>
              <p><br>
                <br>
                <br>
                <br>
                <br>
                ----</p>
              <p>=C2=A0</p>
              <div id=3D"m_-4761085421037625214re" style=3D"margin-left:0.5=
em;padding-left:0.5em;border-left:1px solid green"><br>
                <br>
                <br>
                <div style=3D"background-color:#f5f7fa"><strong>=E4=B8=BB=
=E3=80=80=E9=A2=98=EF=BC=9A</strong><span id=3D"m_-4761085421037625214subje=
ct">Re: [PATCH libdrm 1/2] amdgpu: fix
                    parameter of amdgpu_cs_ctx_create2</span> <br>
                  <strong>=E6=97=A5=E3=80=80=E6=9C=9F=EF=BC=9A</strong><spa=
n id=3D"m_-4761085421037625214date">2024-01-09 00:28</span>
                  <br>
                  <strong>=E5=8F=91=E4=BB=B6=E4=BA=BA=EF=BC=9A</strong><spa=
n id=3D"m_-4761085421037625214from">Christian K=C3=B6nig</span>
                  <br>
                  <strong>=E6=94=B6=E4=BB=B6=E4=BA=BA=EF=BC=9A</strong><spa=
n id=3D"m_-4761085421037625214to" style=3D"word-break:break-all">=E6=9D=8E=
=E7=9C=9F=E8=83=BD;Marek
                    Olsak;Pierre-Eric Pelloux-Prayer;dri-devel;amd-gfx;</sp=
an></div>
                <br>
                <div id=3D"m_-4761085421037625214content">
                  <div>
                    <div>Am 08.01.24 um 10:40 schrieb Zhenneng Li:<br>
                      &gt; In order to pass the correct priority
                      parameter to the kernel,<br>
                      &gt; we must change priority type from uint32_t to
                      int32_t.<br>
                      <br>
                      Hui what? Why should it matter if the parameter is
                      signed or not?<br>
                      <br>
                      That doesn&#39;t seem to make sense.<br>
                      <br>
                      Regards,<br>
                      Christian.<br>
                      <br>
                      &gt;<br>
                      &gt; Signed-off-by: Zhenneng Li <br>
                      &gt; ---<br>
                      &gt; amdgpu/amdgpu.h | 2 +-<br>
                      &gt; amdgpu/amdgpu_cs.c | 2 +-<br>
                      &gt; 2 files changed, 2 insertions(+), 2
                      deletions(-)<br>
                      &gt;<br>
                      &gt; diff --git a/amdgpu/amdgpu.h
                      b/amdgpu/amdgpu.h<br>
                      &gt; index 9bdbf366..f46753f3 100644<br>
                      &gt; --- a/amdgpu/amdgpu.h<br>
                      &gt; +++ b/amdgpu/amdgpu.h<br>
                      &gt; @@ -896,7 +896,7 @@ int
                      amdgpu_bo_list_update(amdgpu_bo_list_handle
                      handle,<br>
                      &gt; *<br>
                      &gt; */<br>
                      &gt; int
                      amdgpu_cs_ctx_create2(amdgpu_device_handle dev,<br>
                      &gt; - uint32_t priority,<br>
                      &gt; + int32_t priority,<br>
                      &gt; amdgpu_context_handle *context);<br>
                      &gt; /**<br>
                      &gt; * Create GPU execution Context<br>
                      &gt; diff --git a/amdgpu/amdgpu_cs.c
                      b/amdgpu/amdgpu_cs.c<br>
                      &gt; index 49fc16c3..eb72c638 100644<br>
                      &gt; --- a/amdgpu/amdgpu_cs.c<br>
                      &gt; +++ b/amdgpu/amdgpu_cs.c<br>
                      &gt; @@ -49,7 +49,7 @@ static int
                      amdgpu_cs_reset_sem(amdgpu_semaphore_handle sem);<br>
                      &gt; * \return 0 on success otherwise POSIX Error
                      code<br>
                      &gt; */<br>
                      &gt; drm_public int
                      amdgpu_cs_ctx_create2(amdgpu_device_handle dev,<br>
                      &gt; - uint32_t priority,<br>
                      &gt; + int32_t priority,<br>
                      &gt; amdgpu_context_handle *context)<br>
                      &gt; {<br>
                      &gt; struct amdgpu_context *gpu_context;<br>
                      <br>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
  </div>

</blockquote></div>

--000000000000031a95060e800e34--
