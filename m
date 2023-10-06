Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C96D07BBEF2
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 20:49:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D07C010E4B3;
	Fri,  6 Oct 2023 18:49:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BDCF10E4B3
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 18:49:11 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-504b84d59cbso3229517e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Oct 2023 11:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696618149; x=1697222949; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2fDA2lSaNwQgARs8I3HBmuWFIWIkJ//nvt2BMPmf/8o=;
 b=bT4i70boQCqLlUEZSoFvB7lENNneQRPdQl1oD+U/ul0ZkrMhfhl5y/Yq3Yl3kfDL1i
 ZHkwyYHLPlVpA8LFFuURSDZtZKPcnFfVepoEZRQ/gqnwopUWgSBjCipIkWPlfgeFWKDh
 tDQYvcoe05bz9VSmAZq3RqTICwNvFCmPNzG1lPodpqBxNIXiavdL12TbHTMid8riBKO+
 s6N7DJcW8Pf2m2yvZGDEkR4e6YR9f6W8mmOXz1K/Tb5yOdCv8z0h7dzujKihebEFK7xl
 9GCnAs/47ep9HpyMFSB0vWo3bGJmR00IXDNyoqzS4s+L1nFRH6T9qrSEGvN6GKYGxUnE
 gVUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696618149; x=1697222949;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2fDA2lSaNwQgARs8I3HBmuWFIWIkJ//nvt2BMPmf/8o=;
 b=YpesCCQ+pvDI/A8nlAMlfLo71cJ9dIfsV/V8TFu16bvQBxj0ADEhaVlG6YTTQbWZWI
 Vu3RgAKnAXov8lwhvjieFLLCRWRBWkvtWWbGqFMU5VvOzJMGgh0VYoJgiFxiJwv7gYQL
 CYizUtgY9FL/Az64NEPijSE28plLU3wexaDU8XgzZZ0F5RlkNNVywcboxi/1H2yLPUfh
 ikAlzZCXp1am53AnaK8xuOyMUXWvn7hE8VSEGAwQlHez55Agaroeguzzxm5Gz/xGqklC
 /RJ1sRwyNqpuE5KqHg3OnpM04GzMc5V7dcdRdS/Rfqq7vF2IJ0SyhUryRytEydxarWIK
 ekZQ==
X-Gm-Message-State: AOJu0Yz+qSKmrXVsTgKUF2mHw5st7LNJR3O0beGHRgVGcjC4G/1xB02Q
 gg/VdX7DaFDnLycjPiFUtVvHRf/Zm4jdEjJMjioRDS8/ZKo=
X-Google-Smtp-Source: AGHT+IHLedu9wL2ZLo3itOu2ygwMdHOpBLQ2q0iHPh5nMSmfJBAjFwX3DtLHc4pZGESKYQp5uc9Kj8nvi3Fs6WPklaU=
X-Received: by 2002:a05:6512:10c9:b0:504:3807:22a4 with SMTP id
 k9-20020a05651210c900b00504380722a4mr9547106lfg.23.1696618149017; Fri, 06 Oct
 2023 11:49:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230926170549.2589045-1-halfline@gmail.com>
 <ZR6IlVR-A5KtIHEU@phenom.ffwll.local>
 <CAA_UwzL=2PjeH_qW2GJa_XzJCeWkz9NcokPQX3-qn2f0iPz+Rw@mail.gmail.com>
 <90e7f66f-96bf-4e90-88c8-75019bc506a4@amd.com>
In-Reply-To: <90e7f66f-96bf-4e90-88c8-75019bc506a4@amd.com>
From: Ray Strode <halfline@gmail.com>
Date: Fri, 6 Oct 2023 14:48:56 -0400
Message-ID: <CAA_UwzJ7q8aq_iw3wimeQXmvKp8Z253J7oqi3UQqcKdkRmAcAA@mail.gmail.com>
Subject: Re: [PATCH] drm/atomic: Perform blocking commits on workqueue
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
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
Cc: daniel.vetter@ffwll.ch, Xinhui.Pan@amd.com, dri-devel@lists.freedesktop.org,
 mdaenzer@redhat.com, alexander.deucher@amd.com, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Oct 6, 2023 at 3:12=E2=80=AFAM Christian K=C3=B6nig <christian.koen=
ig@amd.com> wrote:
> When the operation busy waits then that *should* get accounted to the
> CPU time of the current process. When the operation sleeps and waits for
> some interrupt for example it should not get accounted.
> What you suggest is to put the parts of the operation which busy wait
> into a background task and then sleep for that task to complete. This is
> not a solution to the problem, but just hides it.

Actually, I think we both probably agree that there shouldn't be long
busy waits in the context of the current process. After all, we both
agree what the AMD DC driver code is doing is wrong.

To be clear, my take is, if driver code is running in process context
and needs to wait for periods of time on the order of or in excess of
a typical process time slice it should be sleeping during the waiting.
If the operation is at a point where it can be cancelled without side
effects, the sleeping should be INTERRUPTIBLE. If it's past the point
of no return, sleeping should be UNINTERRUPTIBLE. At no point, in my
opinion, should kernel code busy block a typical process for dozens of
milliseconds while keeping the process RUNNING. I don't think this is
a controversial take.

Actually, I think (maybe?) you might even agree with that, but you're
also saying: user space processes aren't special here. While it's not
okay to busy block them, it's also not okay to busy block on the
system unbound workqueue either. If that's your sentiment, I don't
disagree with it.

So I think we both agree the busy waiting is a problem, but maybe we
disagree on the best place for the problem to manifest when it
happens.

One thought re the DC code is regardless of where the code is running,
the scheduler is going to forcefully preempt it at some point right?
Any writereg/udelay(1)/readreg loop is going to get disrupted by a
much bigger than 1us delay by the kernel if the loop goes on long
enough. I'm not wrong about that? if that's true, the code might as
well switch out the udelay(1) for a usleep(1) and call it a day (well
modulo the fact I think it can be called from an interrupt handler; at
least "git grep" says there's a link_set_dpms_off in
link_dp_irq_handler.c)

> Stuff like that is not a valid justification for the change. Ville
> changes on the other hand tried to prevent lock contention which is a
> valid goal here.

Okay so let's land his patchset! (assuming it's ready to go in).
Ville, is that something you'd want to resend for review?

Note, a point that I don't think has been brought up yet, too, is the
system unbound workqueue doesn't run with real time priority. Given
the lion's share of mutter's drmModeAtomicCommit calls are nonblock,
and so are using the system unbound workqueue for handling the
commits, even without this patch, that somewhat diminishes the utility
of using a realtime thread anyway. I believe the original point of the
realtime thread was to make sure mouse cursor motion updates are as
responsive as possible, because any latency there is something the
user really feels. Maybe there needs to be a different mechanism in
place to make sure user perceived interactivity is given priority.

--Ray
