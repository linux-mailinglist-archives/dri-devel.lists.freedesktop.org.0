Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC74F9616F0
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 20:24:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35DC710E3FD;
	Tue, 27 Aug 2024 18:24:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UR8KjGUz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB6DA10E32E
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 18:24:39 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-20212f701c9so4106325ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 11:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724783079; x=1725387879; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9qTdjBHUaLg2M+ojMhlapqSV/dwJ0E+5yybEeSpMDNw=;
 b=UR8KjGUziNcVHxXUES63O550dabd5RkLLxqCFJRUQcsGm4UL45K1IFMZ1/zFsEEUsx
 YDIcCX6LqCubiMZlIc3cT4m1MmVh6b3dq+2yLUsDbLzNhIIXZTr/kV1kek7JQ5sQrdaX
 ACmLetr/5gU7ZoLXKKSz5R5e2hWx2Hu2lDbASwpoGBTkyWCMWkSGzBDDYtk+EKlR46kG
 huhpG7CvczoKqEju7h25O+IfOtruY0l8RF/nYAfwaOyfClTlHB/QJ/LP0KAmj66qWGzZ
 yJLKTr9rgicxl65vYfg9XQzCxtlwZqFsMP2ekmqSb9B+tqCxwrwQII4oIHaCClL3+Pfd
 nfUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724783079; x=1725387879;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9qTdjBHUaLg2M+ojMhlapqSV/dwJ0E+5yybEeSpMDNw=;
 b=Z5QEHcji+Bn3LXBXFowEyj7lVB4vBpAkxH75gVKkMTCEhOtMMrWmrA/23AytN/9u1p
 Sv5DNPGvIWdHyjQhZCuo3OfikoT9doWLkqU4zroKdR5KpsBKWxP1qti5fXfRwxGKgJoN
 LIuv+tjljCN3LINbwlh34XmF4JmkfybgNHlxU/6UZ0uxykHtb/9ytCxYNLqu0OnnTJlq
 H13e/ewxENwwHQcpg2kudA9Q0Ns0qVERqMlsctDQaH8ryj+Z1SLnaZN3box6LH/8YZit
 P/zUjhoTNnxnJA6ecdidg1TBGXwtWTuR8BIMasxUURyzTHfIsDf47GHyDAZ0FcPELvi6
 0lmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUT8sw/K2TQ2F/omQuKUfRC0X6fZv7NAUGjBvhkOsCNPZfrEEIA4OVRW+HTjNB53OxEQJmOFxsxgs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx74alOum+WpC9KhgEZqjJWceDxs7ecdL/zJTDaPYYu5ZoJTZcv
 PJZgXaS/0t3I+4WbqZ6yVM6bWR5IBB7XqqyREpDTp/nCKjVsowcNZq51d4BJm5Xmrv5VGHuEvoy
 K5TqMbnj+50mQq/kd6fFJ267cMiNBiPNb
X-Google-Smtp-Source: AGHT+IEpAM0nXQW+gTvBg98yXjeuUHau+u7bGh149F6r+zMs+u3xS2RDCbsCbj+t6CAefyeXlAWBIiJ0v1ZiHDjDvwo=
X-Received: by 2002:a17:902:d4cb:b0:1fd:a0b9:2be6 with SMTP id
 d9443c01a7336-2039e43ada3mr98693535ad.2.1724783078917; Tue, 27 Aug 2024
 11:24:38 -0700 (PDT)
MIME-Version: 1.0
References: <20bceb24-8cae-4f0a-897e-326dbf8dc186@amd.com>
 <7d3c647a2df19aa0f8a582b7d346ba8014cf6ca3.camel@linux.intel.com>
 <ZsNTTCfBCpZNrSQH@phenom.ffwll.local>
 <440bb9a5-54b8-46ef-b6db-50110af5c02a@amd.com>
 <5a2f24bce352b65a1fb6e933c406b3ab1efa33e3.camel@linux.intel.com>
 <4d4c532a-ff35-4172-9b71-93f5d130711b@amd.com>
 <bb0a31ea3d82ee370873ca5f1c66ec4eeafabffe.camel@linux.intel.com>
 <d065806d-1d72-4707-bc5f-4da311809295@amd.com>
 <ZscDox5KoiNHXxne@phenom.ffwll.local>
 <3afe3ab2-4a58-49a9-acd7-c989980c68f2@amd.com>
 <Zs4EPT1DR7OrE5X-@phenom.ffwll.local>
In-Reply-To: <Zs4EPT1DR7OrE5X-@phenom.ffwll.local>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 27 Aug 2024 14:24:27 -0400
Message-ID: <CADnq5_OD-eiuS38ePYErOUyUN1LcUjvyKPbQdoXjrGHNt8juRg@mail.gmail.com>
Subject: Re: [PATCH 4/7] drm/ttm: move LRU walk defines into new internal
 header
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
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

On Tue, Aug 27, 2024 at 12:58=E2=80=AFPM Daniel Vetter <daniel.vetter@ffwll=
.ch> wrote:
>
> [machine died, new one working now, I can read complicated mails again an
> answer.]
>
> On Thu, Aug 22, 2024 at 03:19:29PM +0200, Christian K=C3=B6nig wrote:
> > Am 22.08.24 um 11:23 schrieb Daniel Vetter:
> > > On Wed, Aug 21, 2024 at 10:14:34AM +0200, Christian K=C3=B6nig wrote:
> > > > Am 20.08.24 um 18:00 schrieb Thomas Hellstr=C3=B6m:
> > > > > > Or why exactly should shrinking fail?
> > > > > A common example would be not having runtime pm and the particula=
r bo
> > > > > needs it to unbind, we want to try the next bo. Example: i915 GGT=
T
> > > > > bound bos and Lunar Lake PL_TT bos.
> > > > WHAT? So you basically block shrinking BOs because you can't unbind=
 them
> > > > because the device is powered down?
> > > Yes. amdgpu does the same btw :-)
> >
> > Well, amdgpu wouldn't block shrinking as far as I know.
> >
> > When the GPU is powered down all fences are signaled and things like GA=
RT
> > unbinding is just postponed until the GPU wakes up again.
> >
> > > It's a fairly fundamental issue of rpm on discrete gpus, or anything =
that
> > > looks a lot like a discrete gpu. The deadlock scenario is roughly:
> > >
> > > - In runtime suspend you need to copy any bo out of vram into system =
ram
> > >    before you power the gpu. This requires bo and ttm locks.
> > >
> > > - You can't just avoid this by holding an rpm reference as long as an=
y bo
> > >    is still in vram, because that defacto means you'll never autosusp=
end at
> > >    runtime. Plus most real hw is complex enough that you have some dr=
iver
> > >    objects that you need to throw out or recreate, so in practice no =
way to
> > >    avoid all this.
> > >
> > > - runtime resume tends to be easier and mostly doable without taking =
bo
> > >    and ttm locks, because by design you know no one else can possibly=
 have
> > >    any need to get at the gpu hw - it was all powered off after all. =
It's
> > >    still messy, but doable.
> > >
> > > - Unfortunately this doesn't help, because your runtime resume might =
need
> > >    to wait for a in-progress suspend operation to complete. Which mea=
ns you
> > >    still deadlock even if your resume path has entirely reasonable lo=
cking.
> >
> > Uff, yeah that totally confirms my gut feeling that this looked really
> > questionable.
> >
> > > On integrated you can mostly avoid this all because there's no need t=
o
> > > swap out bo to system memory, they're there already. Exceptions like =
the
> > > busted coherency stuff on LNL aside.
> > >
> > > But on discrete it's just suck.
> >
> > Mhm, I never worked with pure integrated devices but at least radeon, a=
mdgpu
> > and nouveau seems to have a solution which would work as far as I can t=
ell.
>
> Yeah integrated is easy (if you don't do silly stuff like intel on their
> latest).
>
> > Basically on suspend you make sure that everything necessary for shrink=
ing
> > is done, e.g. waiting for fences, evacuating VRAM etc...
>
> This is the hard part, or the "evacuating VRAM" part at least. My proposa=
l
> is that essentially the runtime_suspend_prepare hook does that. Imo the
> clean design is that we wait for rpm autosuspend, and only then start to
> evacuate VRAM. Otherwise you need to hold a rpm reference if there's
> anything in VRAM, which kinda defeats the point of runtime pm ...
>
> Or you have your own runtime pm refcount that tracks whether anyone uses
> the gpu, and if that drops to 0 for long enough you evacuate VRAM, and
> then drop the rpm reference. Which is just implementing the idea I've
> typed up, except hand-rolled in driver code and with a rpm refcount that'=
s
> entirely driver internal.
>
> And at least last time I checked, amdgpu does the VRAM evacuation in the
> runtime pm suspend callback, which is why all your runtime_pm_get calls
> are outside of the big bo/ttm locks.

It used to do the eviction in the runtime_suspend callback, but we ran
into problems where eviction would sometimes fail if there was too
much memory pressure during suspend.  Moving it to prepare made things
fail earlier.  Ultimately, I think the problem is that runtime pm
disables swap during runtime pm. See:
https://gitlab.freedesktop.org/drm/amd/-/issues/2362#note_2111666

Alex

>
> > Hardware specific updates like GART while the device is suspended are
> > postponed until resume.
>
> Yeah GART shouldn't be the issue, except when you're racing.
>
> > > TTM discrete gpu drivers avoided all that by simply not having a shri=
nker
> > > where you need to runtime pm get, instead all runtime pm gets are out=
most,
> > > without holding any ttm or bo locks.
> >
> > Yes, exactly that.
> >
> > > > I would say that this is a serious NO-GO. It basically means that p=
owered
> > > > down devices can lock down system memory for undefined amount of ti=
me.
> > > >
> > > > In other words an application can allocate memory, map it into GGTT=
 and then
> > > > suspend or even get killed and we are not able to recover the memor=
y because
> > > > there is no activity on the GPU any more?
> > > >
> > > > That really sounds like a bug in the driver design to me.
> > > It's a bug in the runtime pm core imo. I think interim what Thomas la=
id
> > > out is the best solution, since in practice when the gpu is off you r=
eally
> > > shouldn't need to wake it up. Except when you're unlucky and racing a
> > > runtime suspend against a shrinker activity (like runtime suspend thr=
ows a
> > > bo into system memory, and the shrinker then immediately wants to swa=
p it
> > > out).
> >
> > Mhm, why exactly is that problematic?
> >
> > Wouldn't pm_runtime_get_if_in_use() just return 0 in this situation and=
 we
> > postpone any hw activity?
>
> So when you're runtime suspend, you need to evacuate VRAM. Which means
> potentially a lot needs to be moved into system memory. Which means it's
> likely the shrinker gets active. Also, it's the point where
> pm_runtime_get_if_in_use() will consistently fail, so right when you need
> the shrinker to be reliable it will fail the most.
>
> > > I've been pondering this mess for a few months, and I think I have a
> > > solution. But it's a lot of work in core pm code unfortunately:
> > >
> > > I think we need to split the runtime_suspend callback into two halfes=
:
> > >
> > > ->runtime_suspend_prepare
> > >
> > > This would be run by the rpm core code from a worker without holding =
any
> > > locks at all. Also, any runtime_pm_get call will not wait on this pre=
pare
> > > callback to finish, so it's up to the driver to make sure all the loc=
king
> > > is there. Synchronous suspend calls obviously have to wait for this t=
o
> > > finish, but that should only happen during system suspend or driver
> > > unload, where we don't have these deadlock issues.
> > >
> > > Drivers can use this callback for any non-destructive prep work
> > > (non-destructive aside from the copy engine time wasted if it fails) =
like
> > > swapping bo from vram to system memory. Drivers must not actually shu=
t
> > > down the hardware because a runtime_pm_get call must succeed without
> > > waiting for this callback to finish.
> > >
> > > If any runtime_pm_get call happens while the suspend attempt will be
> > > aborted without further action.
> > >
> > > ->runtime_suspend
> > >
> > > This does the actual hw power-off. The power core must guarantee that=
 the
> > > ->runtime_suspend_prepare has successfully completed at least once wi=
thout
> > > the rpm refcount being elevated from 0 to 1 again.
> > >
> > > This way drivers can assume that all bo have been swapped out from vr=
am
> > > already, and there's no need to acquire bo or ttm locks in the suspen=
d
> > > path that could block the resume path.
> > >
> > > Which would then allow unconditional runtime_pm_get in the shrinker p=
aths.
> > >
> > > Unfortunately this will be all really tricky to implement and I think
> > > needs to be done in the rumtime pm core.
> >
> > Completely agree that this is complicated, but I still don't see the ne=
ed
> > for it.
> >
> > Drivers just need to use pm_runtime_get_if_in_use() inside the shrinker=
 and
> > postpone all hw activity until resume.
>
> Not good enough, at least long term I think. Also postponing hw activity
> to resume doesn't solve the deadlock issue, if you still need to grab ttm
> locks on resume.
>
> > At least for amdgpu that shouldn't be a problem at all.
>
> Yeah, because atm amdgpu has the rpm_get calls outside of ttm locks, whic=
h
> is exactly the inversion you've complained about as being broken driver
> design.
> -Sima
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
