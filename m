Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 286235F7207
	for <lists+dri-devel@lfdr.de>; Fri,  7 Oct 2022 01:45:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99AA610E6AC;
	Thu,  6 Oct 2022 23:45:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 699D210E6AC
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Oct 2022 23:45:35 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id t79so3859835oie.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Oct 2022 16:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0UIpt5qbGLZX+l8DalBZlgk1bfpReda6mkVb7cX8QdQ=;
 b=BnMwoemseLDRkIR1D5narDJJvmaVBsbjSkb5/+vanfF/XVhnkGjsNZ3tWnzkSx4ciX
 E9YMP6WRJuK2MXYcdLHluOmh+v4dNk81NAZt87ZCKlPxa2zamiIZDqjJfDJzqumMTTw3
 guxWdJ6UwoLe88lwygu3LX27x73ahXJjGx/xQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0UIpt5qbGLZX+l8DalBZlgk1bfpReda6mkVb7cX8QdQ=;
 b=D2hs9Z4sxxR6xs3Is0PtOSw6JxYb5BhTPKncDuoWR5GMBJzq0TfdeFyZy/8Lhhk3U3
 W28WjzKKVkmvhnIFORtveAG396yXUVRO2PQ7tkQC7a6UaUO69iKqF42HKy3LUgPwuwsq
 phtyjdqKmUl0IGukisaaFCIQdwJEb+ATN3ZqAJI1vpsxuuXifVR1iiwlABxlVECCsOmw
 hXPB0gRuPKy7WXNuKw7anWs+zDGb/mmCY83Otay4q4OlBNro0rCBnVYG+VMqQfeWQm1w
 kCP8YjP0dT+gfGUR3xBwlMjgxEehqHsEDEHBLQr05TcsVQaSuoX0zkeWCIy3my1drbsC
 lsyw==
X-Gm-Message-State: ACrzQf25Os8lYefUBqp+GKzvIqDYhIMGQEwCp3U+8yYuKx0EBP8TQeOX
 UQ/kilgXg3OuhJPqQP3F92Au+7ULM2GjMg==
X-Google-Smtp-Source: AMsMyM7XRK1dVpQ6cujqZFGktbatI1A2sIC7AvR3Z7y1Kj8JWTgklYJKgV81DDIUbZmDz3a/5cIRGQ==
X-Received: by 2002:a05:6808:1691:b0:351:48da:62e0 with SMTP id
 bb17-20020a056808169100b0035148da62e0mr1106471oib.98.1665099933202; 
 Thu, 06 Oct 2022 16:45:33 -0700 (PDT)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com.
 [209.85.167.180]) by smtp.gmail.com with ESMTPSA id
 e6-20020a4aa606000000b00475db5c28f9sm268323oom.10.2022.10.06.16.45.31
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Oct 2022 16:45:32 -0700 (PDT)
Received: by mail-oi1-f180.google.com with SMTP id s192so3814853oie.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Oct 2022 16:45:31 -0700 (PDT)
X-Received: by 2002:a05:6808:2123:b0:354:2823:f542 with SMTP id
 r35-20020a056808212300b003542823f542mr1084598oiw.229.1665099931487; Thu, 06
 Oct 2022 16:45:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzs4n8dDQ_XVVPS_5jrBgsNkhDQvf-B_XmUg+EG_M2i4Q@mail.gmail.com>
 <CAHk-=whUp5Ufur6Bmv=H-rDDTNJJ-KVqOKkL+5FmR01jp0dbcA@mail.gmail.com>
 <CADnq5_Of-8ZyBxee0fZ=0x-eV-2NX_+e9sd-9nmuHdLugSHp2g@mail.gmail.com>
 <CAHk-=wi43xD06UgO2McDT3R=ze_aHgOGjcDOoggSwmQRv2kA+A@mail.gmail.com>
 <CADnq5_N0Ef+1VUoDLdpHfJXqZFuPYbx5Lq+94NWciHcQC+VrMg@mail.gmail.com>
 <CAPM=9tyAOnzwXyyPuoceZ1mimAkzxR-63YmKfVtcQX=swywNvg@mail.gmail.com>
In-Reply-To: <CAPM=9tyAOnzwXyyPuoceZ1mimAkzxR-63YmKfVtcQX=swywNvg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 6 Oct 2022 16:45:15 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgghR4N-4XWjoK18NDkvjBL7i00ab8+otQg955pNGG_dQ@mail.gmail.com>
Message-ID: <CAHk-=wgghR4N-4XWjoK18NDkvjBL7i00ab8+otQg955pNGG_dQ@mail.gmail.com>
Subject: Re: [git pull] drm for 6.1-rc1
To: Dave Airlie <airlied@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 6, 2022 at 1:25 PM Dave Airlie <airlied@gmail.com> wrote:
>
>
> [ 1234.778760] BUG: kernel NULL pointer dereference, address: 0000000000000088
> [ 1234.778813] RIP: 0010:drm_sched_job_done.isra.0+0xc/0x140 [gpu_sched]

As far as I can tell, that's the line

        struct drm_gpu_scheduler *sched = s_fence->sched;

where 's_fence' is NULL. The code is

   0: 0f 1f 44 00 00        nopl   0x0(%rax,%rax,1)
   5: 41 54                push   %r12
   7: 55                    push   %rbp
   8: 53                    push   %rbx
   9: 48 89 fb              mov    %rdi,%rbx
   c:* 48 8b af 88 00 00 00 mov    0x88(%rdi),%rbp <-- trapping instruction
  13: f0 ff 8d f0 00 00 00 lock decl 0xf0(%rbp)
  1a: 48 8b 85 80 01 00 00 mov    0x180(%rbp),%rax

and that next 'lock decl' instruction would have been the

        atomic_dec(&sched->hw_rq_count);

at the top of drm_sched_job_done().

Now, as to *why* you'd have a NULL s_fence, it would seem that
drm_sched_job_cleanup() was called with an active job. Looking at that
code, it does

        if (kref_read(&job->s_fence->finished.refcount)) {
                /* drm_sched_job_arm() has been called */
                dma_fence_put(&job->s_fence->finished);
        ...

but then it does

        job->s_fence = NULL;

anyway, despite the job still being active. The logic of that kind of
"fake refcount" escapes me. The above looks fundamentally racy, not to
say pointless and wrong (a refcount is a _count_, not a flag, so there
could be multiple references to it, what says that you can just
decrement one of them and say "I'm done").

Now, _why_ any of that happens, I have no idea. I'm just looking at
the immediate "that pointer is NULL" thing, and reacting to what looks
like a completely bogus refcount pattern.

But that odd refcount pattern isn't new, so it's presumably some user
on the amd gpu side that changed.

The problem hasn't happened again for me, but that's not saying a lot,
since it was very random to begin with.

                 Linus
