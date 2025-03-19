Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1766A69AE0
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 22:32:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E81A10E052;
	Wed, 19 Mar 2025 21:32:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="I9UuLrf9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EC3610E00B;
 Wed, 19 Mar 2025 21:31:56 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id
 ca18e2360f4ac-85517db52a2so2450939f.3; 
 Wed, 19 Mar 2025 14:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742419915; x=1743024715; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eGXYnVlo4fA0RFIIo/kNFkQOG0FR1x2vD9pp9kcKWLQ=;
 b=I9UuLrf9DfcQUoFG9+Bgp42ijMIOPSSNTpsiY0zrooNrFDKdGjH1f1nqf4zs8Bng2K
 i/eLFK+TNwA4DnCt3rkSRFHkKKYyosIMgjmDAI3VwLPC00WMPSXfzoVWk/VeQMb7C6bO
 1oans9TEBN1jkfeb3CQUUf+Q5IhbuwszOKEDOVtqsJARfuDAWE1d4mHE7xz9S6ocxUzp
 TiG7olXKvdu23NvYZnpQnCfxr1lGC24teODpLoivxynyyq+4lo5j5dxcCZ+IEoiqZIXS
 zMRdTeGOVpKkR0FFNB1zeRl4KnrOjj3Tz325O+6B51wpm0XNmmqOJomih/F18O39WSht
 HhaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742419915; x=1743024715;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eGXYnVlo4fA0RFIIo/kNFkQOG0FR1x2vD9pp9kcKWLQ=;
 b=G6TJoVp+7GuinmXwcwS51PusgsTWQ6vgSmb6A5E0LuHtHYhIKjTvhj4MVGv8/zEN6x
 OlLiqOpGEz6QSxG/jShp0VECNFA3+mVlAGQYdZbLzK4SoVgNHZbtRYCp8344p+EIJ+JC
 I3c4bQcdln3fA9XnaX3UnFjWCqocNNN0Gmo9Tj5kr7sCTLAtVyYnH+MFp1XAQe0t2XRM
 0UqIW4/4CjtbfPWW/UoFKrIHuRfv6ug6uYLO1lis1BFPjMKN7acmD3a2T7JdP7OAjZXN
 CmY9oLFbXLORBvC9Uin0VKHhHmK4mCDTST625QWr4YqANVXj1T2V27tSkLzPvIen27rZ
 X0wQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCmw+6o1YyyvyfcAo8CkUqlvbY+fmM0UgnfUQQATJ1Wj4ohjjqb5SixznicrKU+FW6x37fhFo8rYk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwuE8Xnf7CSspWcfHx7KdzPX9ATs5h36QYs6CHXVAqGWwii8jYU
 esiS1QVjAuANvFI42MVjOW570/UBgXLt6zsnKmdWyVUjAQ3pfzZeIyOJh8Va6C0FKbkgpbmiLAa
 5eHYB4C7ZM63aPQDRVvXzYJ2d30VWjQ==
X-Gm-Gg: ASbGncvXKF2V29ragv/T40mSvAUjd9Zak3EtSnEYAU5bxam2gXXMXpXfLxB3u33ziVT
 QnknBZEpsWODU0zJQ7wVRa8o/3p/LmSxNrMi++EF0NftuRC8ktTklWd4TLvYmU+u1XrMVLPc1Lo
 xC0zguBOPx179EfeKXmHbyzCPsSy8UktS9VIh9uWwMfYZROP9sRKhHAqLkbdguWN9dxKULjBs=
X-Google-Smtp-Source: AGHT+IG6eJdQijicuz0JhXeewGnZhBud8RVqN+j9v9xBQdOBT2axAWMn8vRd7OQcpT6RTCan1DoKTU3vvrEEu2tAwIQ=
X-Received: by 2002:a05:6e02:1a47:b0:3d3:ff09:432c with SMTP id
 e9e14a558f8ab-3d586b24451mr38482965ab.4.1742419915226; Wed, 19 Mar 2025
 14:31:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250319145425.51935-1-robdclark@gmail.com>
 <20250319145425.51935-17-robdclark@gmail.com>
 <CACu1E7FduhsXY22BKpjt5WcnAcVtGu01eUiLc9T47OUR+yp_0Q@mail.gmail.com>
In-Reply-To: <CACu1E7FduhsXY22BKpjt5WcnAcVtGu01eUiLc9T47OUR+yp_0Q@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 19 Mar 2025 14:31:43 -0700
X-Gm-Features: AQ5f1JoLQDinqTeGHJh8TxkwUkgoOW697Nl89kftPZ83P_IL6WWPoVNwetQQV1s
Message-ID: <CAF6AEGvkKhx2JLpNsDgYigX41QhbhXt4VvSP9n-QmO=cAvTxHw@mail.gmail.com>
Subject: Re: [PATCH v2 16/34] drm/msm: Mark VM as unusable on faults
To: Connor Abbott <cwabbott0@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 19, 2025 at 9:15=E2=80=AFAM Connor Abbott <cwabbott0@gmail.com>=
 wrote:
>
> On Wed, Mar 19, 2025 at 10:55=E2=80=AFAM Rob Clark <robdclark@gmail.com> =
wrote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > If userspace has opted-in to VM_BIND, then GPU faults and VM_BIND error=
s
> > will mark the VM as unusable.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/msm/msm_gem.h        | 17 +++++++++++++++++
> >  drivers/gpu/drm/msm/msm_gem_submit.c |  3 +++
> >  drivers/gpu/drm/msm/msm_gpu.c        | 16 ++++++++++++++--
> >  3 files changed, 34 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_ge=
m.h
> > index acb976722580..7cb720137548 100644
> > --- a/drivers/gpu/drm/msm/msm_gem.h
> > +++ b/drivers/gpu/drm/msm/msm_gem.h
> > @@ -82,6 +82,23 @@ struct msm_gem_vm {
> >
> >         /** @managed: is this a kernel managed VM? */
> >         bool managed;
> > +
> > +       /**
> > +        * @unusable: True if the VM has turned unusable because someth=
ing
> > +        * bad happened during an asynchronous request.
> > +        *
> > +        * We don't try to recover from such failures, because this imp=
lies
> > +        * informing userspace about the specific operation that failed=
, and
> > +        * hoping the userspace driver can replay things from there. Th=
is all
> > +        * sounds very complicated for little gain.
> > +        *
> > +        * Instead, we should just flag the VM as unusable, and fail an=
y
> > +        * further request targeting this VM.
> > +        *
> > +        * As an analogy, this would be mapped to a VK_ERROR_DEVICE_LOS=
T
> > +        * situation, where the logical device needs to be re-created.
> > +        */
> > +       bool unusable;
> >  };
> >  #define to_msm_vm(x) container_of(x, struct msm_gem_vm, base)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm=
/msm_gem_submit.c
> > index 9731ad7993cf..9cef308a0ad1 100644
> > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > @@ -668,6 +668,9 @@ int msm_ioctl_gem_submit(struct drm_device *dev, vo=
id *data,
> >         if (args->pad)
> >                 return -EINVAL;
> >
> > +       if (to_msm_vm(ctx->vm)->unusable)
> > +               return UERR(EPIPE, dev, "context is unusable");
> > +
> >         /* for now, we just have 3d pipe.. eventually this would need t=
o
> >          * be more clever to dispatch to appropriate gpu module:
> >          */
> > diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gp=
u.c
> > index 503e4dcc5a6f..4831f4e42fd9 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu.c
> > +++ b/drivers/gpu/drm/msm/msm_gpu.c
> > @@ -386,8 +386,20 @@ static void recover_worker(struct kthread_work *wo=
rk)
> >
> >         /* Increment the fault counts */
> >         submit->queue->faults++;
> > -       if (submit->vm)
> > -               to_msm_vm(submit->vm)->faults++;
> > +       if (submit->vm) {
> > +               struct msm_gem_vm *vm =3D to_msm_vm(submit->vm);
> > +
> > +               vm->faults++;
> > +
> > +               /*
> > +                * If userspace has opted-in to VM_BIND (and therefore =
userspace
> > +                * management of the VM), faults mark the VM as unusuab=
le.  This
> > +                * matches vulkan expectations (vulkan is the main targ=
et for
> > +                * VM_BIND)
>
> The bit about this matching Vulkan expectations isn't exactly true.
> Some Vulkan implementations do do this, but many will also just ignore
> the fault and try to continue going, and the spec allows either. It's
> a choice that we're making.

As mentioned on IRC, this is actually about GPU hangs rather then smmu
faults.   I guess the $subject is a bit misleading.

BR,
-R

> Connor
>
> > +                */
> > +               if (!vm->managed)
> > +                       vm->unusable =3D true;
> > +       }
> >
> >         get_comm_cmdline(submit, &comm, &cmd);
> >
> > --
> > 2.48.1
> >
