Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB18A5A6A8
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 23:03:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAF9D10E02C;
	Mon, 10 Mar 2025 22:03:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PozoV5Xf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 343B310E02C;
 Mon, 10 Mar 2025 22:03:39 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-2fd02536660so1296300a91.2; 
 Mon, 10 Mar 2025 15:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741644219; x=1742249019; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YYzg/u2IpcqWvAcuNVD136LsSFWdWQJXt/YKMQFKRsA=;
 b=PozoV5XfJB2yOt4faBYUjROSZ6NUHXx+xQwoCJxxwncp5OiHzvwppss2ObfKeCo+J+
 EuqwWdzsvOctDNAnqSPU2BpFONp5TNFRsXke/M/vhSGXauCUQDK8z0TcRmmC8VIKFMw5
 CBlzWCwTX6+rn0M3BlfMYCnclSGgAgKI+VmfOwkXXytP3rjjkdWlYqnW37m6d8bOdA5E
 WaaaPTpNrv/F46/DtNIMip7hXW0/mYL3OjLOjpZCXAXh0g4L0ceaBkMHChY12BM7VeF7
 ckG6gzXgrPwdDWRIn/+nPYZSw1uL0BV8QXcHa+8OWr1U52HI/p/z0vw4i6yzYuKLYbhW
 oIww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741644219; x=1742249019;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YYzg/u2IpcqWvAcuNVD136LsSFWdWQJXt/YKMQFKRsA=;
 b=mfYa0QlvpoMen4LMXlZRHwxB2f6MsrtLFQ/WEMB/fUVd2KvIii7vQaQlpmi55fiuef
 nUs0xIGanC/t7JulW9YE8T8bEGv7AQBTiLpQu6s9wq2MGkOdyc0GYwXJBN5k3LklXCBH
 6ogCR5nqowzZjdgppQapxAk8jQfZU0ZDw8A+JlVAHb+HNmaNfxOl3KJJsgf1Yv702NOf
 sVlsi+6IjU7XzTg/lIIb0dw5WfSj0MDFKSJHo8FXYAnrEdzlfeI9eb1HWkfvRyDXfF6u
 rooOcePxiVocSMsulVKf/EEgwvl85eD6l8f1o79rSRecbikhcu3fIG+rr4n+fVb7+yeK
 vrpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdhA6P6mPL7CYLUHXG4xn/xUhrbfXVPSAYbwedYBC9vhfcQ6n8E+1J9DeXcFgeL7zN/HDnESGzZ2ir@lists.freedesktop.org,
 AJvYcCWEjDLYjnLqN4LmB+N7FfwHyU8iWKBsjmKU5AVx0lqBtYBLZo3J0C/Y0DHVXq/mz/QinqOcn9yMmGOH@lists.freedesktop.org,
 AJvYcCXO2tKaL00rISJP29YEg33HTgdbSJ6ZVvtQCrE9iTmByRVz9naQRFtB+S8vwfEEXzCLWA2heNZG@lists.freedesktop.org,
 AJvYcCXjzfFOzBLGlptnqpqoqMjt4neXdQa9LOXh5Vn4jUs/kmBfvKutBoxDlVhhIchN+r98/CDqJHADRuw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxiXHiHbg8i8rt1oRNVGav1w6WpHE7cYbtpR5le0SJbfwpC4oq8
 hs6CUfKX/Gm3+nu6uLkZsPbz16P5uGCcNj0y6hV+jPDhytZPLlpDswXon9YNRSXuHFbz5oq51LG
 CFRWeMNkivL27lBx07iTD9TW8WDs=
X-Gm-Gg: ASbGncs1+hG48TnQQ0CJFomCyqGq70eCasbA5rzsuDG+AXLC2GwCM6eD9DYgf8eOuCd
 GesnDQlrWzBwlkpR0uSX09q+QYRYsEBD0yJAwc3IhlPL42nAatOB3xhElVSoMUSLD8WDOzvnK8s
 1lzDku988nWl/1q0KH7GkyjLZPfQ==
X-Google-Smtp-Source: AGHT+IGytwiODt/P/QUDHtvcJD/CRyXbk3Tc1Som0tCe+NbmcvRB49qV/HyZx+UPOyGDO/3B+jWcxbX7Hk7kj/LDsN8=
X-Received: by 2002:a17:90b:1b52:b0:2ff:7b67:2358 with SMTP id
 98e67ed59e1d1-300ff724c14mr648392a91.2.1741644218723; Mon, 10 Mar 2025
 15:03:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250228121353.1442591-1-andrealmeid@igalia.com>
 <20250228121353.1442591-3-andrealmeid@igalia.com>
 <Z8HO-s_otb2u44V7@black.fi.intel.com>
 <38b9cc8b-2a55-4815-a19f-f5bdf0f7687c@igalia.com>
 <Z8KjZfLYjH6ehYwy@black.fi.intel.com>
 <73602c9b-74f6-4b4a-82c6-918292b13cf7@igalia.com>
In-Reply-To: <73602c9b-74f6-4b4a-82c6-918292b13cf7@igalia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 10 Mar 2025 18:03:27 -0400
X-Gm-Features: AQ5f1JoHIt6Gv797OLqVVuaE_80ofmAmIRgK8qcq7RMDPVr8YwLqNekcRumjzU8
Message-ID: <CADnq5_PbZUoyxyqweqa=kUNsSXanjY=5mUJrn03aY3je6rER+w@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amdgpu: Make use of drm_wedge_app_info
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: Raag Jadav <raag.jadav@intel.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com, 
 amd-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 siqueira@igalia.com, airlied@gmail.com, simona@ffwll.ch, 
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com, 
 Xaver Hugl <xaver.hugl@kde.org>
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

On Mon, Mar 10, 2025 at 5:54=E2=80=AFPM Andr=C3=A9 Almeida <andrealmeid@iga=
lia.com> wrote:
>
> Em 01/03/2025 03:04, Raag Jadav escreveu:
> > On Fri, Feb 28, 2025 at 06:49:43PM -0300, Andr=C3=A9 Almeida wrote:
> >> Hi Raag,
> >>
> >> On 2/28/25 11:58, Raag Jadav wrote:
> >>> On Fri, Feb 28, 2025 at 09:13:53AM -0300, Andr=C3=A9 Almeida wrote:
> >>>> To notify userspace about which app (if any) made the device get in =
a
> >>>> wedge state, make use of drm_wedge_app_info parameter, filling it wi=
th
> >>>> the app PID and name.
> >>>>
> >>>> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> >>>> ---
> >>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 19 +++++++++++++++++=
--
> >>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  6 +++++-
> >>>>    2 files changed, 22 insertions(+), 3 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gp=
u/drm/amd/amdgpu/amdgpu_device.c
> >>>> index 00b9b87dafd8..e06adf6f34fd 100644
> >>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> >>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> >>>> @@ -6123,8 +6123,23 @@ int amdgpu_device_gpu_recover(struct amdgpu_d=
evice *adev,
> >>>>            atomic_set(&adev->reset_domain->reset_res, r);
> >>>> -  if (!r)
> >>>> -          drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVER=
Y_NONE, NULL);
> >>>> +  if (!r) {
> >>>> +          struct drm_wedge_app_info aux, *info =3D NULL;
> >>>> +
> >>>> +          if (job) {
> >>>> +                  struct amdgpu_task_info *ti;
> >>>> +
> >>>> +                  ti =3D amdgpu_vm_get_task_info_pasid(adev, job->p=
asid);
> >>>> +                  if (ti) {
> >>>> +                          aux.pid =3D ti->pid;
> >>>> +                          aux.comm =3D ti->process_name;
> >>>> +                          info =3D &aux;
> >>>> +                          amdgpu_vm_put_task_info(ti);
> >>>> +                  }
> >>>> +          }
> >>> Is this guaranteed to be guilty app and not some scheduled worker?
> >>
> >> This is how amdgpu decides which app is the guilty one earlier in the =
code
> >> as in the print:
> >>
> >>      ti =3D amdgpu_vm_get_task_info_pasid(ring->adev, job->pasid);
> >>
> >>      "Process information: process %s pid %d thread %s pid %d\n"
> >>
> >> So I think it's consistent with what the driver thinks it's the guilty
> >> process.
> >
> > Sure, but with something like app_info we're kind of hinting to userspa=
ce
> > that an application was _indeed_ involved with reset. Is that also guar=
anteed?
> >
> > Is it possible that an application needlessly suffers from a false posi=
tive
> > scenario (reset due to other factors)?
> >
>
> I asked Alex Deucher in IRC about that and yes, there's a chance that
> this is a false positive. However, for the majority of cases this is the
> right app that caused the hang. This is what amdgpu is doing for GL
> robustness as well and devcoredump, so it's very consistent with how
> amdgpu deals with this scenario even if the mechanism is still not perfec=
t.

It's usually the guilty one, but it's not guaranteed.  For example,
say you have a ROCm user queue and a gfx job submitted to a kernel
queue.  The actual guilty job may be the ROCm user queue, but the
driver may not detect that the ROCm queue was hung until some other
event (e.g., memory pressure).  However, the timer for the gfx job may
timeout before that happens on the ROCm queue so in that case the gfx
job would be incorrectly considered guilty.

Alex
