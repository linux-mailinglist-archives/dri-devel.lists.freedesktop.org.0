Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0E6A08907
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 08:38:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F9D810E4E9;
	Fri, 10 Jan 2025 07:38:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linbit-com.20230601.gappssmtp.com header.i=@linbit-com.20230601.gappssmtp.com header.b="ltA0YEXZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5B7C10E4E9
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 07:37:58 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-e399e904940so2662025276.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2025 23:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1736494678; x=1737099478;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+qzWT5wH5s+fKNGwrFbhAw4D9NGqeijkLtAUV3eA9AA=;
 b=ltA0YEXZZdcfbPlXJrKoqJiEFcA6jHTjtIICbzdTNiwVNpLBV28Z7XU21iogm8X2Fn
 9LrKCxBn8Qt31p1Vo3fMFsfruWFr7ZOCVpVtLlzBCEYWULslouMnDLY07Wjmnbm4vi4B
 qPoqZAR8PP3FxSVmqS+88CgtwOlyAm8UWiJAneKnfZk5NcpMGi7gqPLTFLAbJx/RiRkp
 brf4bdUCWQ8hr9zLhlbmR4vveGJnD1FJ6o95ImcWT1SDFiaZqzpjSclefcFeRYd7xQkQ
 owSipNPrJX51/fWT1hFAYI6E6bsaLzp01nPL12ciA/jQiotj8/9PvhJ4qAW3y/h9v5Vw
 lgFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736494678; x=1737099478;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+qzWT5wH5s+fKNGwrFbhAw4D9NGqeijkLtAUV3eA9AA=;
 b=ma4RUG4nClKr0rrobJzwb+d8u0YVE40lDD4S7sU9HBfWP8c6653zkQjJlroEzlMvKN
 DVxV9iZr+cC+xplS17v8pKfh0ru8mQ0O3b/8NEphxxC9IPtLU8D2lGKqOyGdv1lfayDg
 N/HtKLOdVs1rrZo0GED8Cjukb/hOcsULgj6Tq0gIbllmdBZolyDXJ1OppkuUACV1UVco
 cVuHjZkUmiXWNN2gQMiNfxSyN64galB62uWHGcOQw0Jea3hvra4wxuEOFCb0DaegjajL
 4J+MLzpe95uowh7Yi9mmPlW1t4XisxuFa1Fqw/pGY3r+VSVH0UsTBy/DHRN4AZof+6s7
 Kv/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhImSnngxnGS1oH5HhhSG4eLh65GdzmOs/bWEmpI09t3pgz71b/DX+ugJsSsfJAm7jir1qanZIZVM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywi4OPeBIhDC2yjQHKDtMDkWqVflGzDFfwp1SrVyr4jybO8LQ9t
 bTCbhvxKJJ2tzoxIDzo9OSmc9JxY/05tybRguaI9Y4loCP0itfZwvwR8yNbbnvAx+hptC9tpCDK
 XiDM5Yr9BCIWRVUk1wbxTJc9wOt1NfOQdZspr1A==
X-Gm-Gg: ASbGncuvOD2s1WDyYkWsB++6LFbpobrQJqwPnVvbv3zhDf3yZiNTxXQSjUxcAD9Rb7m
 uFwWyL8sD76TgCE2mGTcgknqX1gPozJdjrwXhL+U=
X-Google-Smtp-Source: AGHT+IE4h31zS1tWbmuL/MJgMEZgLzygC8WxDsJ9pPMV7jLLm5nGtoeOJUYodepPGtr2IHoUeZSdrqwsTGrCkBey3QM=
X-Received: by 2002:a05:6902:12cd:b0:e57:2f23:84f1 with SMTP id
 3f1490d57ef6-e572f2385bcmr252727276.20.1736494677778; Thu, 09 Jan 2025
 23:37:57 -0800 (PST)
MIME-Version: 1.0
References: <20250107140240.325899-1-philipp.reisner@linbit.com>
 <942c02f2-6496-4406-a73b-941d096aadfb@amd.com>
 <CADnq5_PAG662SODmS8cSg7jcyh8ZQRgcWMtgjx5RZbuUE7j3Og@mail.gmail.com>
 <6a17b4f1-5b5b-4226-b3c3-4dfa3f3c3811@amd.com>
In-Reply-To: <6a17b4f1-5b5b-4226-b3c3-4dfa3f3c3811@amd.com>
From: Philipp Reisner <philipp.reisner@linbit.com>
Date: Fri, 10 Jan 2025 08:37:47 +0100
X-Gm-Features: AbW1kvbBmTnqHjafWuIn-RBWkfm_9kspJHgJia2WxcEKQTUsm2YXdhCItEq1tCo
Message-ID: <CADGDV=Vfnqmdn9Hdo9e3Av66NeZD1j1iijsEnP8Dqwakey5epA@mail.gmail.com>
Subject: Re: [PATCH] drm/sched: Fix amdgpu crash upon suspend/resume
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Alex Deucher <alexdeucher@gmail.com>, dri-devel@lists.freedesktop.org, 
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

[...]
> > Could this be due to amdgpu setting sched->ready when the rings are
> > finished initializing from long ago rather than when the scheduler has
> > been armed?
>
> Yes and that is absolutely intentional.
>
> Either the driver is not done with it's resume yet, or it has already
> started it's suspend handler. So the scheduler backends are not started
> and so the ready flag is false.
>
> But some userspace application still tries to submit work.
>
> If we would now wait for this work to finish we would deadlock, so
> crashing on the NULL pointer deref is actually the less worse outcome.
>
> Christian.

Hi Christian,

Today in the morning, when I woke up my workstation, I was greeted
with a black screen, on which I still could move my mouse pointer. The
OOPS happens at resume time, not at suspend time:

...
J=C3=A4n 10 07:58:14 ryzen9 kernel: [drm] scheduler comp_1.2.1 is not ready=
, skipping
J=C3=A4n 10 07:58:14 ryzen9 kernel: [drm] scheduler comp_1.3.1 is not ready=
, skipping
J=C3=A4n 10 07:58:14 ryzen9 kernel: BUG: kernel NULL pointer dereference,
address: 0000000000000008
J=C3=A4n 10 07:58:14 ryzen9 kernel: #PF: supervisor read access in kernel m=
ode
J=C3=A4n 10 07:58:14 ryzen9 kernel: #PF: error_code(0x0000) - not-present p=
age
J=C3=A4n 10 07:58:14 ryzen9 kernel: PGD 0 P4D 0
J=C3=A4n 10 07:58:14 ryzen9 kernel: Oops: Oops: 0000 [#2] PREEMPT SMP NOPTI
J=C3=A4n 10 07:58:14 ryzen9 kernel: CPU: 2 UID: 1001 PID: 4961 Comm:
chrome:cs0 Tainted: G      D    OE      6.12.5-200.fc41.x86_64 #1
J=C3=A4n 10 07:58:14 ryzen9 kernel: Tainted: [D]=3DDIE, [O]=3DOOT_MODULE,
[E]=3DUNSIGNED_MODULE
J=C3=A4n 10 07:58:14 ryzen9 kernel: Hardware name: Micro-Star International
Co., Ltd. MS-7A38/B450M PRO-VDH MAX (MS-7A38), BIOS B.B0 02/03/2021
J=C3=A4n 10 07:58:14 ryzen9 kernel: RIP: 0010:drm_sched_job_arm+0x23/0x60 [=
gpu_sched]
J=C3=A4n 10 07:58:14 ryzen9 kernel: Code: 90 90 90 90 90 90 90 f3 0f 1e fa
0f 1f 44 00 00 55 53 48 8b 6f 60 48 85 ed 74 3f 48 89 fb 48 89 ef e8
e1 38 00 00 48 8b 45 10 <48> 8b 50 08 48 89 53 18 8b 45 24 89 43 5c b8
01 00 00 00 f0 48 0f
J=C3=A4n 10 07:58:14 ryzen9 kernel: RSP: 0018:ffffa52510cf7758 EFLAGS: 0001=
0206
...

Can we conclude that "the driver is not yet ready with it's resume"?
Can you point me to where I could add instrumentation code to dig deeper?

Thanks,
 Philipp
