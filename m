Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5885A094B0
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 16:10:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2A5D10E079;
	Fri, 10 Jan 2025 15:10:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iSNF4kms";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B50A10E079
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 15:10:13 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-2efdaa02378so434278a91.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 07:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736521813; x=1737126613; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wYu/QsXJ3Aj0d/CqiNpY2ZrC9vW9CYVwtqN9pet4dDM=;
 b=iSNF4kms86x9yvFA6P2fGV69CwSSHCZho9b5CZro/glT+Fj20tV34qjPBNytpemZCq
 Cu5vRN7pg4RCicyzMIRginTRlQ4NlmZd1dkcxHmsIJh06lcDbwIQ23CucKa++mYN88QA
 yJD/605ThDSKJ4Nda/v4x/j0zO8OhOUfM98LA11dO2A7n9AEF4beBAJc6Y5dQCHRNb2+
 JUvqYx27N/kzJips++sN+jGjfgtScDhWM7byMvflDglMhokedWiNBwQvlPbHnRSdiGp1
 vsJhzJMNBEWD7Axwe8uQhtjiEUOYfwyKc4eAY2uuHJkx7uLxkBdtxeKFaTEK365Vb0Kb
 JAdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736521813; x=1737126613;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wYu/QsXJ3Aj0d/CqiNpY2ZrC9vW9CYVwtqN9pet4dDM=;
 b=kJubIRv/du+czUz9QR2Naq+12Pq5KdSvdQTH5oAr99XVY8+ic0xhqy5CpzsIRwPVRA
 Bs5Z/K9e5hzCdqdq0o8m6suLqrsi4D7uQBtS8cS5v9lL/fIONNFRGR/hcxaYGyvTz5zz
 PZn02vX2m2fkwYJFr9cN0wb7isfyZdBhvfigI+EHb0FaWrKi/DumTo8srIBtS7SEHiYX
 b2R9DXEjDWuimo7cBxw8nskifX4K/1s7WNtkwvLYFrZ0T7td45ZgyDq1dtlYLBCOC5+f
 y72TDla/Nrh34DFGxGLNn4KkEi7T+lXqo9Mq/PhqNIMr+K8CxdaZP+bYg0L/rHbfM6EJ
 10jw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0gpwkDX9UjUVrqtpKtJvFlRDPZjY/QeZlCgXsFoXagiFoGDpeW/gr1SHE0C7QGZrYp1A4r4HyYCY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUqWjGe6+OD8sVQ2h741oHp9zhjzPH1MP8fcY2THzcdUIqR8kv
 N+m8GOyi15TMeAjNiEEItkCw5n1sL2ydthxcqsYQRS5fSeDmDxXwameCONXBWGDU5xs/ajiq8zp
 GnjcRzpR2iSJBYP37I0lhEL9ihP7M1g==
X-Gm-Gg: ASbGncuDnk2PxCBKJ13M9QJ7QTU1usS6e7aXNGlHEUlyJGLG7AtdniTY7luZ7T2wUlg
 GwmYj2oefH5ZZkE76ozGtgitYDSq0rmS+yhsduA==
X-Google-Smtp-Source: AGHT+IHewMCG/2aznsolgRCjgYdyYEB7qAFMqYaJPNge29MR1SKe0VHTMFjdHk0nnNg1CPERb/t8YTHozQcqg/0fbik=
X-Received: by 2002:a17:90b:2811:b0:2ee:cbc9:d50b with SMTP id
 98e67ed59e1d1-2f5490ac695mr6263166a91.4.1736521813015; Fri, 10 Jan 2025
 07:10:13 -0800 (PST)
MIME-Version: 1.0
References: <20250107140240.325899-1-philipp.reisner@linbit.com>
 <942c02f2-6496-4406-a73b-941d096aadfb@amd.com>
 <CADnq5_PAG662SODmS8cSg7jcyh8ZQRgcWMtgjx5RZbuUE7j3Og@mail.gmail.com>
 <6a17b4f1-5b5b-4226-b3c3-4dfa3f3c3811@amd.com>
 <CADGDV=Vfnqmdn9Hdo9e3Av66NeZD1j1iijsEnP8Dqwakey5epA@mail.gmail.com>
 <3c47ea32-eeb3-47f1-a626-5868457469ab@amd.com>
 <CADGDV=UCd3d93NtppetkrgG+pE-0EoxxXQMwjgiZPbvRBStKiw@mail.gmail.com>
 <3c6e53ae-6998-47f8-ae37-9e68553ad918@amd.com>
In-Reply-To: <3c6e53ae-6998-47f8-ae37-9e68553ad918@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 10 Jan 2025 10:10:01 -0500
X-Gm-Features: AbW1kvYJj8V2XNY_N0Qs2tIUtngVK4pSkcRxGkSIzkqJpoDDHYY1ak20O_RCXBU
Message-ID: <CADnq5_Md7XWOHSru-0gR8xys3nwG4whSng-LcxafG3SiC8G0qw@mail.gmail.com>
Subject: Re: [PATCH] drm/sched: Fix amdgpu crash upon suspend/resume
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Philipp Reisner <philipp.reisner@linbit.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Simona Vetter <simona@ffwll.ch>
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

On Fri, Jan 10, 2025 at 9:48=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 10.01.25 um 15:32 schrieb Philipp Reisner:
> > [...]
> >> Take a look at those messages right before the crash:
> >>
> >> J=C3=A4n 10 07:58:14 ryzen9 kernel: [drm] scheduler comp_1.2.1 is not =
ready,
> >> skipping
> >> J=C3=A4n 10 07:58:14 ryzen9 kernel: [drm] scheduler comp_1.3.1 is not =
ready,
> >> skipping
> >>
> >> That is basically a 100% certain confirm that an application tries to
> >> use the device before before those compute queues are resumed.
> >>
> >> Can I have a full dmesg? Maybe the resume is canceled or aborted for
> >> some reason.
> >>
> > Yes, of course. I have made the files available here:
> > https://drive.google.com/drive/folders/1W3M3bFEl0ZVv2rnqvmbveDFZBhc84BN=
a
>
> Ah! That suddenly makes much more sense.
>
> Here is the root cause:
>
> [111313.897796] amdgpu 0000:29:00.0: [drm:amdgpu_ring_test_helper
> [amdgpu]] *ERROR* ring comp_1.1.0 test failed (-110)
> [111314.135761] amdgpu 0000:29:00.0: [drm:amdgpu_ring_test_helper
> [amdgpu]] *ERROR* ring comp_1.2.0 test failed (-110)
> [111314.373786] amdgpu 0000:29:00.0: [drm:amdgpu_ring_test_helper
> [amdgpu]] *ERROR* ring comp_1.0.1 test failed (-110)
> [111314.611722] amdgpu 0000:29:00.0: [drm:amdgpu_ring_test_helper
> [amdgpu]] *ERROR* ring comp_1.1.1 test failed (-110)
> [111314.849647] amdgpu 0000:29:00.0: [drm:amdgpu_ring_test_helper
> [amdgpu]] *ERROR* ring comp_1.2.1 test failed (-110)
> [111315.087658] amdgpu 0000:29:00.0: [drm:amdgpu_ring_test_helper
> [amdgpu]] *ERROR* ring comp_1.3.1 test failed (-110)
> [111315.207293] [drm] UVD and UVD ENC initialized successfully.
> [111315.308270] [drm] VCE initialized successfully.
> [111315.447494] PM: resume devices took 2.306 seconds
> [111315.447865] OOM killer enabled.
>
> I'm surprised that this works at all. For some reason the graphics queue
> works, but the compute queues fail to resume.
>
> @Alex what do we do about that? We could return an error when not all
> rings come up again after resume, but that will probably result in a
> number of complains.

Maybe return an error if all of the rings of a particular type fail,
but if only some do, we should be able to deal with that.  We
currently set up 8 compute rings.  We probably don't need that many.
Maybe just two (high and low priority).

Alex

>
> Regards,
> Christian.
>
>
> >
> > best regards,
> >   Philipp
>
