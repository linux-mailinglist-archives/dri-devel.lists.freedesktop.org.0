Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DBB3D3DC1
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 18:43:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC5256FA3F;
	Fri, 23 Jul 2021 16:43:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E52676FA3F
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 16:43:12 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id d73so3209307ybc.10
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 09:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dArsFwULv7RqQv+mELv/tZAfKy93Meh2eKmnI1BwRr8=;
 b=VMnIwjStcpOtN1rblusewwYm5SkvaxHPW3tTKXkZm2js9pocIdgCrREGrSdz375CTo
 CqqzT0VCwN5RAKmb+w2wKsoV4jgI0Lpx0wK4oL4UdmZvxGAOExBvSavigiEUhlCIuAlI
 DE1ZB3eN1pNwv2Sfp7jrjdjeYbqY+yzDwuepoWusWpz3NMtMDu7qzD41dsY+S+aRhy4X
 rbh6gSEsrkcnN102AHG1usVJRS8XWJ1wbLXodDr5ngSINC1h1sby3/DdzuLmFWYX6Wua
 qBviW1ESXAY1n4cvgzw0CW8P26mnUaxBB2wx4JoEG3d7NAAPVjt3xl2G6HTznAtrCvlp
 F42g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dArsFwULv7RqQv+mELv/tZAfKy93Meh2eKmnI1BwRr8=;
 b=ATMqRdTdhAZ0Iupu3vYu+ofyh6Qiy129SZp8XHLFf93QCV36yhYTH1XZfvgqCgUOA5
 TkGnd7lQU8HNQNCZD9tacfOtqQVKA/IxIdWOPgOwV3KauhNeLR+iKP/SQY4CrCC+wCZE
 oJIsGTMzszua1VWEv+tyFffGxPjNduCUuvZW4v+lIjB9Anunuhu5CKsIc8NUKlp74Jk8
 4GLQah3CgRixWsp2BJEyTVii+GPA5p0LOmApN8awxcpjMjyk0qhHkQ5NTHHyAjLlGmqd
 v/0xpJ8KFpVuR5AMtsXrvTXgepV3ZgVQmSEqyPGMO5Po9ei9sc4XX2lmQVHOW2pgIrCi
 EtlA==
X-Gm-Message-State: AOAM532/nYxtgsuktx7EnIpx8kOHwepKFrQuaZIU/9W6ve2gPpw3EZhd
 FMyhOhTLPuvHOmjKliRr9ArqjZgTTrCfgOneCHJDgQ==
X-Google-Smtp-Source: ABdhPJyniiZt6mzJ4jG2YEW0+8IDpK/xnj63B877ciwO5Sru6qjFYqYBbOgJcnTLfaW+5kwEyvG3oA+43/lHG0g9h9o=
X-Received: by 2002:a5b:4d2:: with SMTP id u18mr7576099ybp.158.1627058591989; 
 Fri, 23 Jul 2021 09:43:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210715091820.1613726-1-tvrtko.ursulin@linux.intel.com>
 <20210715091820.1613726-7-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20210715091820.1613726-7-tvrtko.ursulin@linux.intel.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 23 Jul 2021 17:43:01 +0100
Message-ID: <CAPj87rMxvq2c9uQ-ArvsLo2M7rXq=7LiJZ_XJwST=1VDhhNXRA@mail.gmail.com>
Subject: Re: [RFC 6/8] drm: Document fdinfo format specification
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
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
Cc: intel-gfx <Intel-gfx@lists.freedesktop.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 David M Nieto <David.Nieto@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tvrtko,
Thanks for typing this up!

On Thu, 15 Jul 2021 at 10:18, Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
> +Mandatory fully standardised keys
> +---------------------------------
> +
> +- drm-driver: <str>
> +
> +String shall contain a fixed string uniquely identified the driver handling
> +the device in question. For example name of the respective kernel module.

I think let's be more prescriptive and just say that it is the module name.

> +Optional fully standardised keys
> +--------------------------------
> +
> +- drm-pdev: <aaaa:bb.cc.d>
> +
> +For PCI devices this should contain the PCI slot address of the device in
> +question.

How about just major:minor of the DRM render node device it's attached to?

> +- drm-client-id: <uint>
> +
> +Unique value relating to the open DRM file descriptor used to distinguish
> +duplicated and shared file descriptors. Conceptually the value should map 1:1
> +to the in kernel representation of `struct drm_file` instances.
> +
> +Uniqueness of the value shall be either globally unique, or unique within the
> +scope of each device, in which case `drm-pdev` shall be present as well.
> +
> +Userspace should make sure to not double account any usage statistics by using
> +the above described criteria in order to associate data to individual clients.
> +
> +- drm-engine-<str>: <uint> ns
> +
> +GPUs usually contain multiple execution engines. Each shall be given a stable
> +and unique name (str), with possible values documented in the driver specific
> +documentation.
> +
> +Value shall be in specified time units which the respective GPU engine spent
> +busy executing workloads belonging to this client.
> +
> +Values are not required to be constantly monotonic if it makes the driver
> +implementation easier, but are required to catch up with the previously reported
> +larger value within a reasonable period. Upon observing a value lower than what
> +was previously read, userspace is expected to stay with that larger previous
> +value until a monotonic update is seen.

Yeah, that would work well for Mali/Panfrost. We can queue multiple
jobs in the hardware, which can either be striped across multiple
cores with an affinity mask (e.g. 3 cores for your client and 1 for
your compositor), or picked according to priority, or ...

The fine-grained performance counters (e.g. time spent waiting for
sampler) are only GPU-global. So if you have two jobs running
simultaneously, you have no idea who's responsible for what.

But it does give us coarse-grained counters which are accounted
per-job-slot, including exactly this metric: amount of 'GPU time'
(whatever that means) occupied by that job slot during the sampling
period. So we could support that nicely if we fenced job-slot updates
with register reads/writes.

Something I'm missing though is how we enable this information. Seems
like it would be best to either only do it whilst fdinfo is open (and
re-read it whenever you need an update), or on a per-driver sysfs
toggle, or ... ?

> +- drm-memory-<str>: <uint> [KiB|MiB]
> +
> +Each possible memory type which can be used to store buffer objects by the
> +GPU in question shall be given a stable and unique name to be returned as the
> +string here.
> +
> +Value shall reflect the amount of storage currently consumed by the buffer
> +object belong to this client, in the respective memory region.
> +
> +Default unit shall be bytes with optional unit specifiers of 'KiB' or 'MiB'
> +indicating kibi- or mebi-bytes.

I'm a bit wary of the accounting here. Is it buffer allocations
originating from the client, in which case it conceptually clashes
with gralloc? Is it the client which last wrote to the buffer? The
client with the oldest open handle to the buffer? Other?

Cheers,
Daniel
