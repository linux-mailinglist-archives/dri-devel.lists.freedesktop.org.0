Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E557F7FCE2A
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 06:15:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C2B10E5F5;
	Wed, 29 Nov 2023 05:15:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65E7410E17C;
 Wed, 29 Nov 2023 05:15:12 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-9fa45e75ed9so856448766b.1; 
 Tue, 28 Nov 2023 21:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701234911; x=1701839711; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7Q9CRtsR/lkt7Cw/fHi7bDvZN/itsXqjiup0ZTmySxA=;
 b=Du02PcJLivS87nM16v2WxQfdJB63pi7B0nNrCnpgBFn0OYI/9YG6yeABNlD94+fxUK
 PRGBEghXReSKgKSFSnN/DLHfKZrIIsJtCcw3I4XDYzUbJCKwa5otjnyQK1O4owClE0Il
 oyymHEbs/I0KICo0NkowwEUE+vD8m9SFXem8mLzTdtgq2DgPbWtY/pJYkQlqLctnJ5QC
 1pGuYOG0yuNONzQZtwfKrV07HaZ/h5USHA4dWSpFbSCjEz0BeDEXIWwCosvRxgUEri8b
 rBmnJyw4oS+yYKXt4AZgK3lYioQgKxGtoMsPrqQMgOC15Ty2tuXQropwgn5+UXQoJYmJ
 J4Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701234911; x=1701839711;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7Q9CRtsR/lkt7Cw/fHi7bDvZN/itsXqjiup0ZTmySxA=;
 b=u/vqGmJSEozfzxeBixenW/sZ/DXEWQJ2Bh6fXTxw1J6TcsXEqp+dhW/FgSUUDmFlEp
 oYbRVT9Vq2mck2HcqhkrxIftE6PanTI+T3uWAiwzn4dROlKmOinODvYQlQEXibN3M1fJ
 xVL0aZJJgSC/voteI33xOlEB4NBnVrgf7W0lR+M++0RWYbrmWAaPvpa7JNf4rgDjE6Io
 RYHPP3jPqtE/+NeSNvM4hmyeRbj8oy3uRGJbI8Ngr1tN3KAGcGjvboPqTt9QWV7/G7rv
 5i5790BdiZVlhvGBJKGTt7m/Ep3LmKRXMUg/Wps1Ng/SWvQzZeOiX8npKm8yce/UWvm4
 bbKw==
X-Gm-Message-State: AOJu0YyFK+/VAtnZL4OSKY2jvgJtBLoh0YsTzme3+dw+uGuX61/uJX+Q
 1nXI+MS0cM1xK+REDARaA94yOZxRhTHrJ43X4eU=
X-Google-Smtp-Source: AGHT+IF8BQbzvC8JUMcPZoTIvdOo/gY/kUL91mdf8zioqThU2TU+yw6ExoLa9toWLp2NMd4yrs5b7C6bb/cyNxAjx+o=
X-Received: by 2002:a17:906:5299:b0:a00:8706:c82e with SMTP id
 c25-20020a170906529900b00a008706c82emr13477614ejm.18.1701234910430; Tue, 28
 Nov 2023 21:15:10 -0800 (PST)
MIME-Version: 1.0
References: <20231128125025.4449-1-weixi.zhu@huawei.com>
 <9308a79d-e312-4e6d-98fe-75dc6d0fbeda@amd.com>
In-Reply-To: <9308a79d-e312-4e6d-98fe-75dc6d0fbeda@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 29 Nov 2023 15:14:58 +1000
Message-ID: <CAPM=9tx-d-Au_bjX0vYxv6OwqiSjmbbMC7ebWpTsQgFNddWDuw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/6] Supporting GMEM (generalized memory management)
 for external memory devices
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: dri-devel@lists.freedesktop.org, linux-mm@kvack.org, leonro@nvidia.com,
 apopple@nvidia.com, amd-gfx@lists.freedesktop.org, mgorman@suse.de,
 ziy@nvidia.com, zhi.a.wang@intel.com, rcampbell@nvidia.com, jgg@nvidia.com,
 weixi.zhu@openeuler.sh, jhubbard@nvidia.com, intel-gfx@lists.freedesktop.org,
 mhairgrove@nvidia.com, jglisse@redhat.com, Weixi Zhu <weixi.zhu@huawei.com>,
 rodrigo.vivi@intel.com, intel-gvt-dev@lists.freedesktop.org,
 tvrtko.ursulin@linux.intel.com, Felix.Kuehling@amd.com, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, alexander.deucher@amd.com,
 akpm@linux-foundation.org, ogabbay@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 28 Nov 2023 at 23:07, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
>
> Am 28.11.23 um 13:50 schrieb Weixi Zhu:
> > The problem:
> >
> > Accelerator driver developers are forced to reinvent external MM subsys=
tems
> > case by case, because Linux core MM only considers host memory resource=
s.
> > These reinvented MM subsystems have similar orders of magnitude of LoC =
as
> > Linux MM (80K), e.g. Nvidia-UVM has 70K, AMD GPU has 14K and Huawei NPU=
 has
> > 30K. Meanwhile, more and more vendors are implementing their own
> > accelerators, e.g. Microsoft's Maia 100. At the same time,
> > application-level developers suffer from poor programmability -- they m=
ust
> > consider parallel address spaces and be careful about the limited devic=
e
> > DRAM capacity. This can be alleviated if a malloc()-ed virtual address =
can
> > be shared by the accelerator, or the abundant host DRAM can further
> > transparently backup the device local memory.
> >
> > These external MM systems share similar mechanisms except for the
> > hardware-dependent part, so reinventing them is effectively introducing
> > redundant code (14K~70K for each case). Such developing/maintaining is =
not
> > cheap. Furthermore, to share a malloc()-ed virtual address, device driv=
ers
> > need to deeply interact with Linux MM via low-level MM APIs, e.g. MMU
> > notifiers/HMM. This raises the bar for driver development, since develo=
pers
> > must understand how Linux MM works. Further, it creates code maintenanc=
e
> > problems -- any changes to Linux MM potentially require coordinated cha=
nges
> > to accelerator drivers using low-level MM APIs.
> >
> > Putting a cache-coherent bus between host and device will not make thes=
e
> > external MM subsystems disappear. For example, a throughput-oriented
> > accelerator will not tolerate executing heavy memory access workload wi=
th
> > a host MMU/IOMMU via a remote bus. Therefore, devices will still have
> > their own MMU and pick a simpler page table format for lower address
> > translation overhead, requiring external MM subsystems.
> >
> > --------------------
> >
> > What GMEM (Generalized Memory Management [1]) does:
> >
> > GMEM extends Linux MM to share its machine-independent MM code. Only
> > high-level interface is provided for device drivers. This prevents
> > accelerator drivers from reinventing the wheel, but relies on drivers t=
o
> > implement their hardware-dependent functions declared by GMEM. GMEM's k=
ey
> > interface include gm_dev_create(), gm_as_create(), gm_as_attach() and
> > gm_dev_register_physmem(). Here briefly describe how a device driver
> > utilizes them:
> > 1. At boot time, call gm_dev_create() and registers the implementation =
of
> >     hardware-dependent functions as declared in struct gm_mmu.
> >       - If the device has local DRAM, call gm_dev_register_physmem() to
> >         register available physical addresses.
> > 2. When a device context is initialized (e.g. triggered by ioctl), chec=
k if
> >     the current CPU process has been attached to a gmem address space
> >     (struct gm_as). If not, call gm_as_create() and point current->mm->=
gm_as
> >     to it.
> > 3. Call gm_as_attach() to attach the device context to a gmem address s=
pace.
> > 4. Invoke gm_dev_fault() to resolve a page fault or prepare data before
> >     device computation happens.
> >
> > GMEM has changed the following assumptions in Linux MM:
> >    1. An mm_struct not only handle a single CPU context, but may also h=
andle
> >       external memory contexts encapsulated as gm_context listed in
> >       mm->gm_as. An external memory context can include a few or all of=
 the
> >       following parts: an external MMU (that requires TLB invalidation)=
, an
> >       external page table (that requires PTE manipulation) and external=
 DRAM
> >       (that requires physical memory management).
>
> Well that is pretty much exactly what AMD has already proposed with KFD
> and was rejected for rather good reasons.

> >
> > MMU functions
> > The MMU functions peer_map() and peer_unmap() overlap other functions,
> > leaving a question if the MMU functions should be decoupled as more bas=
ic
> > operations. Decoupling them could potentially prevent device drivers
> > coalescing these basic steps within a single host-device communication
> > operation, while coupling them makes it more difficult for device drive=
rs
> > to utilize GMEM interface.
>
> Well to be honest all of this sounds like history to me. We have already
> seen the same basic approach in KFD, HMM and to some extend in TTM as wel=
l.
>
> And all of them more or less failed. Why should this here be different?


Any info we have on why this has failed to work in the past would be
useful to provide. This is one of those cases where we may not have
documented the bad ideas to stop future developers from thinking they
are bad.

I do think we would want more common code in this area, but I would
think we'd have it more on the driver infrastructure side, than in the
core mm.

Dave.
