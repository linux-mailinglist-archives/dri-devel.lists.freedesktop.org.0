Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 367C3AB9044
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 21:56:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21C5210E94E;
	Thu, 15 May 2025 19:56:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="maFpC8Bw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
 [209.85.166.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12DA010E94E;
 Thu, 15 May 2025 19:56:52 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id
 ca18e2360f4ac-8647e143f28so92097439f.1; 
 Thu, 15 May 2025 12:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747339011; x=1747943811; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fMAdLoMT5L/a1MOnGEYuM9x+axh2zb+MjQ/Qq0Mzs2g=;
 b=maFpC8Bwa4sfPtKEkWSetF3ZemGFuL0HXLV5T/jN3iYuwgMzEZ5ySiwbt6F000cNbl
 wwpV41QoRAr25bv72h2WHw+Ax6vxrWgHfky92SIbFsSKF0WmhKV6luvO4FVLZTcwJb56
 EdDw8A+x1WIBKmDEdCh3Ezrh7U9TEpPSZUseLSiutRwmT5m2JbDOXgfPA4qThStWHMYA
 crK9fcwcFDraUcty8J4LQD4LzdWiQJrxEpjE1mZMOSN4IpqLWzg+De6GVN87UOdFy+1I
 zG/nZQY+cHV3laXXPQ2/UbCRDZb7YcGA8G8s18c17h80wyfgDLVLlpugsVxW2uUgbney
 5gmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747339011; x=1747943811;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fMAdLoMT5L/a1MOnGEYuM9x+axh2zb+MjQ/Qq0Mzs2g=;
 b=QO3KfrabW0GThPwOwwoJqHmEtP/SW39i/e+h1K3q4viM1wrlAXixwSVwOMr16+5uCF
 5oCM4nqcc3IgV/fTUSMj/qygBItUNzr+bUg11wudbwUongMKVqVpIHsfLuZcOoBRlePX
 AOVUt1DUxtmJyP6vPp4SCrs5XVqA4V4u57CnEcIGHBy4eiZWZaN6S4Uq4kLxBkcODAZ6
 hVSYG21dMJk+ZgOtqZIJ6EQZnOE+JyirU/i4B06RMiyGSUPPrXy7VKGM9SY/Jv59ZpHc
 BEJHXadeh8EFTMjt69/Om/U5QeFyUpozhi450lq/2FOTKI/vehEp/AbCxrE1IhJ7FWjh
 jysA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcXTU9MUxNMFFVIPnbM7IhMZXJxZLE9uSBAKbhjpp4GmhvxuqcGG7nT7FgmPRbxxQXTM7LcttmRKPX@lists.freedesktop.org,
 AJvYcCUxl7kHH2orNXeHpfV7VPGrOXKbg9rT3yeR08HTYmuE7/85b5l/gTpuDg/zPDsr6jfPTeU0+kMQ3pU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7zAbfaV4uMnNPmf4SPytOEqffmMjAAI+Cv0ddp+VtJwwKoqmU
 RhX3RGUppFJtSKdYyNudYZE/VY72woD2PW6JzckMZMAQMMH8xrA/9rHNIaecTmMVRIacOjMsh+D
 LY3pupl+Dy/YDlpmIS1CrFsg5RFiJ1es=
X-Gm-Gg: ASbGncs3VNYpnW+A1jT4UxouUKSRMjXOAxBIyAYRNt0O5nDoZO+Qav88wdXcaWl8Zoi
 jX017tqNutLyXbgixopkzA0HYB2ZSI+Daj5Uqph8WA/MdF3ouGRklWNQwWX2N2ahDDCAiR51w46
 4x0LRAja2RRnfWipuC4fP+ODkcUnO4sZV0Qzns/Fw2o1PkepC5wCA7wqgFEHkxvaH4q3o=
X-Google-Smtp-Source: AGHT+IFPCvF4LukcF3e+PrLa/e7+Ptn8ausMxE8i1Ao10DvbOVg+94kocFag8Mx84gWnNCqcKrfEOwhvTgh/Bgnpj6k=
X-Received: by 2002:a05:6602:2744:b0:867:325d:6247 with SMTP id
 ca18e2360f4ac-86a231c39d6mr191572739f.7.1747339010947; Thu, 15 May 2025
 12:56:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250514170118.40555-1-robdclark@gmail.com>
 <20250514170118.40555-5-robdclark@gmail.com>
 <51f87f358fa1b7ef8db8b67ee6cde38ae071fbe8.camel@mailbox.org>
 <CAJs_Fx771FFVDVFMn8YJkR9f9Ad-UQspJ9KKQw4u6Cu4TA7YPA@mail.gmail.com>
 <CACu1E7EL+E-M0N-EAN9Bx7u9O6_pECQQdPE2ph575idhVb2Szg@mail.gmail.com>
 <aCYkk4Y7feltfp79@pollux>
 <CAF6AEGsoG_W3A3+BHV4n5EKZQazFubrCyfrtxVUH7+H4-j7i5A@mail.gmail.com>
 <aCY42rgJC4sQ4tp4@pollux>
In-Reply-To: <aCY42rgJC4sQ4tp4@pollux>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 15 May 2025 12:56:38 -0700
X-Gm-Features: AX0GCFvRdC4lKpvLHD4k1lEo4Kh-CGTqFLXWxbdj5_u0cbuv5zT5opAiGIP9Ch8
Message-ID: <CAF6AEGubHkdhfJz=bAZvctO1aTKDLwRsRyPzkoVrQ7tA6dRbKw@mail.gmail.com>
Subject: Re: [PATCH v4 04/40] drm/sched: Add enqueue credit limit
To: Danilo Krummrich <dakr@kernel.org>
Cc: Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 phasta@kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, Matthew Brost <matthew.brost@intel.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 open list <linux-kernel@vger.kernel.org>, 
 Boris Brezillon <boris.brezillon@collabora.com>
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

On Thu, May 15, 2025 at 11:56=E2=80=AFAM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> On Thu, May 15, 2025 at 10:40:15AM -0700, Rob Clark wrote:
> > On Thu, May 15, 2025 at 10:30=E2=80=AFAM Danilo Krummrich <dakr@kernel.=
org> wrote:
> > >
> > > (Cc: Boris)
> > >
> > > On Thu, May 15, 2025 at 12:22:18PM -0400, Connor Abbott wrote:
> > > > For some context, other drivers have the concept of a "synchronous"
> > > > VM_BIND ioctl which completes immediately, and drivers implement it=
 by
> > > > waiting for the whole thing to finish before returning.
> > >
> > > Nouveau implements sync by issuing a normal async VM_BIND and subsequ=
ently
> > > waits for the out-fence synchronously.
> >
> > As Connor mentioned, we'd prefer it to be async rather than blocking,
> > in normal cases, otherwise with drm native context for using native
> > UMD in guest VM, you'd be blocking the single host/VMM virglrender
> > thread.
> >
> > The key is we want to keep it async in the normal cases, and not have
> > weird edge case CTS tests blow up from being _too_ async ;-)
>
> I really wonder why they don't blow up in Nouveau, which also support ful=
l
> asynchronous VM_BIND. Mind sharing which tests blow up? :)

Maybe it was dEQP-VK.sparse_resources.buffer.ssbo.sparse_residency.buffer_s=
ize_2_24,
but I might be mixing that up, I'd have to back out this patch and see
where things blow up, which would take many hours.

There definitely was one where I was seeing >5k VM_BIND jobs pile up,
so absolutely throttling like this is needed.

Part of the VM_BIND for msm series adds some tracepoints for amount of
memory preallocated vs used for each job.  That plus scheduler
tracepoints should let you see how much memory is tied up in
prealloc'd pgtables.  You might not be noticing only because you are
running on a big desktop with lots of RAM ;-)

> > > > But this
> > > > doesn't work for native context, where everything has to be
> > > > asynchronous, so we're trying a new approach where we instead submi=
t
> > > > an asynchronous bind for "normal" (non-sparse/driver internal)
> > > > allocations and only attach its out-fence to the in-fence of
> > > > subsequent submits to other queues.
> > >
> > > This is what nouveau does and I think other drivers like Xe and panth=
or do this
> > > as well.
> >
> > No one has added native context support for these drivers yet
>
> Huh? What exactly do you mean with "native context" then?

It is a way to use native usermode driver in a guest VM, by remoting
at the UAPI level, as opposed to the vk or gl API level.  You can
generally get equal to native performance, but the guest/host boundary
strongly encourages asynchronous to hide the guest->host latency.

https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/693
https://indico.freedesktop.org/event/2/contributions/53/attachments/76/121/=
XDC2022_%20virtgpu%20drm%20native%20context.pdf

So far there is (merged) support for msm + freedreno/turnip, amdgpu +
radeonsi/radv, with MRs in-flight for i915 and asahi.

BR,
-R

> > > > Once you do this then you need a
> > > > limit like this to prevent memory usage from pending page table
> > > > updates from getting out of control. Other drivers haven't needed t=
his
> > > > yet, but they will when they get native context support.
> > >
> > > What are the cases where you did run into this, i.e. which applicatio=
n in
> > > userspace hit this? Was it the CTS, some game, something else?
> >
> > CTS tests that do weird things with massive # of small bind/unbind.  I
> > wouldn't expect to hit the blocking case in the real world.
>
> As mentioned above, can you please share them? I'd like to play around a =
bit. :)
>
> - Danilo
