Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FB15F9FC6
	for <lists+dri-devel@lfdr.de>; Mon, 10 Oct 2022 16:05:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8227910E504;
	Mon, 10 Oct 2022 14:05:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4306010E4F5
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Oct 2022 14:05:21 +0000 (UTC)
Received: by mail-oo1-xc31.google.com with SMTP id
 c17-20020a4aa4d1000000b0047653e7c5f3so8042955oom.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Oct 2022 07:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wgNR8LS4qeAbWx/OUF4WRGK125Azkb4dGt3aFfznxr0=;
 b=NkZ+JbnRuEKBwB8607/yr2ecOfx6TEskgSyWq/Z0UUkKaLrLg44wzQL0xXb1RPIc9y
 7m+Bg6a8HGsj54CBx9w49tDkCVZJc4nISLzclDbE4CHUuj/JX0o7kiTLALtZ8Q5+wZSk
 dct5psOMtf/L9EQ96r/dc1EGbUYw8Ox7MCKw7JL/ZohCyG89VvB0rdOuQKGoAizLUhwk
 3iNIA/hQ6X1eMiXUbdzt0T6R6r/8IkFlQZreNnY46JmGsiTYFwhGU05muaCECNZhc1Zw
 d9iUfZhXaGA1PCsFqCEyn2TrnjB+2V1oMPEG/yg1+OwZJon5DvSU7kpXyPTzRgoWMQjN
 9zXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wgNR8LS4qeAbWx/OUF4WRGK125Azkb4dGt3aFfznxr0=;
 b=fBhLQIhcFi9gupyZ6i9MtKLiSptHtyFpR5w7///aPkVAjvDCedKJLDn1Ff9XFf82zs
 yC9Bb7QQ/34CffPTaBjauh4nWpLSdpL3+ZVvU2cEEevZfv7KVjFDqM2SOTg+8eGTb8XD
 cdTtP94IzInJ21grHg/ReHer/I2F8I4snBLmorNX0Un3LlZFGmQj6rmE+bP7RuCvJMKz
 1FcE87W3KZICF65iLFkvarhiSKPdzGc5Y3UpeeIMbFdLkrqiKGpBWmbPJs1FMaPCEb0L
 DUIIdD7YQ9vpLOuRFRRImINZXsg1YeGMI+SrqKlBXrljuGqICJQ62R7nlkfzQZV7G/if
 SMrw==
X-Gm-Message-State: ACrzQf0mm/2QYu2mK6ybAW7hcbY7rWyMkufrb3SCkJ/pgR2CBAwU0+TY
 nV344H54bvdu3V9ZYWf0vdftRuunTHqf3cQtcMg=
X-Google-Smtp-Source: AMsMyM6QUYT0pEF8k+JLfY0ftrCI/YWo9gpx4w8FEScVSC7pqx5UTjbdPsxyt1mW5thlKz2ktyWKDeq5jps2knW/kuE=
X-Received: by 2002:a4a:3790:0:b0:480:51c4:7e8c with SMTP id
 r138-20020a4a3790000000b0048051c47e8cmr5445031oor.70.1665410720346; Mon, 10
 Oct 2022 07:05:20 -0700 (PDT)
MIME-Version: 1.0
References: <fa9d4fe7-9b3b-678c-f014-96008877de45@gmail.com>
In-Reply-To: <fa9d4fe7-9b3b-678c-f014-96008877de45@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 10 Oct 2022 10:05:09 -0400
Message-ID: <CADnq5_MfSNHP--KyQe2GEWCvg4XAwLV5FAw+0B-0DwvXBcACtw@mail.gmail.com>
Subject: Re: Difference GART/GTT and related questions
To: Peter Maucher <bellosilicio@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Oct 8, 2022 at 7:14 AM Peter Maucher <bellosilicio@gmail.com> wrote:
>
> Hi dri-devel,
>
> what is the difference between GTT and GART for AMD GPUs?
>  From what I gathered when looking through the mailing list archives and
> the freedesktop docs [1] as well as wikipedia [2],
> these terms seem to be synonymous, but that can not be the whole truth
> (different sizes in dmesg log, different kernel parameters in
> amdgpu/radeon, ...).
>
> As far as I understand it currently,
> the size of the GART is depending on some HW/ASIC functionality [3].
> On the other hand, I was successfully able to increase the size of the
> GART mapping(?) from 512MB to 1024MB by using amdgpu.gartsize=1024 on my
> RX 6600, and booting the system.
>
> GTT, on the other hand, is the maximum amount of system memory visible
> to the GPU, shared between all processes connected to the GPU.
> As I understand it, using GPUVM, each process can have one or more GARTs
> for mapping?
> Apparently, there is also something called a GART table window,
> what's up with that?
>
> Also, according to what I found in the mailing list archives,
> the GPUVM functionality "replaces" old GART with new GART features,
> so what is the difference and what exactly is GPUVM?
> If I understood correctly, GPUVM is a MMU using page tables on the GPU?
>
> And, additionally, the addresses translated by the GART(s) are
> optionally translated once more by the PCIe IOMMU,
> as the former is located on the GPU and the latter is in the CPU's PCIe
> root complex?
> Wikipedia mentions something about (another?) GART in an AMD IOMMU...
>
> Lastly, do any of these numbers influence what the longest contiguous
> mapping is for one buffer to the GPU?
> As in: can I map 95% or so of the available (GART/GTT?) space into one
> buffer and have the GPU work on it?

Modern AMD GPUs have multiple GPU virtual address spaces (GPU Virtual
Memory -- GPUVM) that can be active at any given time.  Each address
space is designated by a token called a VMID (Virtual Memory ID).  The
kernel driver uses one of these IDs for its own memory management.
The others are used dynamically for user processes.  It's pretty much
like virtual memory on a CPU, but because the GPU has really deep
pipelines, we have the concept of multiple address spaces being active
at any given time denoted by the VMIDs.  The GPU also has lots of
asynchronous engines (graphics, compute, transfer, media, etc.). E.g.,
if you have two user applications using the GPU at the same time and
the GPU kernel driver is moving some memory, you'd have 3 different
virtual address spaces that need to be active at the same time.  For
example, when the kernel driver submits a user job to the gfx engine,
it tells the engine which VMID (and hence GPUVM address space) it
should use for that job

GART defines the amount of platform address space (system memory or
MMIO space) that the GPU kernel driver can have mapped into the GPU's
virtual address space used by the kernel driver.  The kernel driver
generally doesn't need that much system space to be mapped at any
given time so we keep the GART pretty small to minimize GPU page table
size.

GTT defines the amount of platform address space that can be mapped
into the GPU virtual address space used by user processes.

TTM (the kernel memory management infrastructure that the driver uses)
imposes a default limit of 50% of system memory due to the way the OOM
handler works on Linux.  Memory allocated via a kernel driver on
behalf of a user process does not currently get counted towards the
application that allocated it.    This is a complex problem to fix so
it's persisted for a while.

The IOMMU provides virtualization for device access to the system
address space (system memory and MMIO space) so the DMA addresses the
the GPU driver gets from the Linux DMA subsystem and uses in the
driver are actualyl IO virtual addresses (IOVAs); i.e., they are IOMMU
virtual addresses.  So when the GPU kernel driver sets up the GPUVM
page tables the "physical" addresses will actually be IOVAs when an
IOMMU is present.

GPUVM provides a 48 bit GPU virtual address space so each process
using the GPU can have up to 48 bits of virtual GPU address space
mapped.  This address space can map a combination of on-device memory
(VRAM), system address space allocated through the driver (GTT) and
user pointer memory (e.g., malloced memory from the application).

Alex

>
> Thanks, Peter
>
> [1] https://dri.freedesktop.org/wiki/GART/
> [2] https://en.wikipedia.org/wiki/Graphics_address_remapping_table
> [3] https://www.kernel.org/doc/html/v6.0/gpu/amdgpu/module-parameters.html
>
