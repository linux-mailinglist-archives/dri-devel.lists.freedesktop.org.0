Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA193BAF0C2
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 04:59:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F13F010E2EF;
	Wed,  1 Oct 2025 02:59:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="In3OXhCF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B29A10E2EF
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 02:59:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1759287583; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=WsoYPm2RxSNGbVG6nHCb86H+JIEIuAHvSVJRVJT/Qu2FRW3wQmHJq0T3MkdyPgcjZCNee++IDrK6gzFkFY+2G0zAopHQfpjQ/mBdQB/NzOi1b5vb2zrhUbPiBD3cIovuKD3PXvx1o3D1I1BEI3F1hmkzOu9kzK0UcY8S5nFw05I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1759287583;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=AI93BTWvwcyQK56fVOCao+y7b66/1psyB0E3zj0iJFk=; 
 b=RHClKK3PdASBZFndgvdWNlx+ChkzzO/ehJU8vvsWdNbJ5YiNIeCBZ5X4UIdZVriI5EXenWDmS8Slc67sbIb/7WTGR24iy0e4AtxlHL1YuugB/lnkcBPKm2CpU4yNylsEfiSX5pJngPX2NbbB7WTJ6VSMm4fwtYD16Y8dVYW0K+8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759287583; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
 bh=AI93BTWvwcyQK56fVOCao+y7b66/1psyB0E3zj0iJFk=;
 b=In3OXhCFULeA6+vXJvUq4zt053wklv8EJ/70n8z39SVq4WOl3J6yYMbyTkQ46yCx
 +YLmDHd1URZ2yYDZ5pFMHfChUnF91OgV6XW4Vsm2da0KisiqFLWsnNekEtXBnntRVsu
 Z+tcBb8FnuG1sEgB/XIFhWtV9qih5CChZgYEbyLE=
Received: by mx.zohomail.com with SMTPS id 1759287580372735.1610170901679;
 Tue, 30 Sep 2025 19:59:40 -0700 (PDT)
Message-ID: <2bbe0b9a-b0bb-4dbc-901e-1162791eb437@collabora.com>
Date: Wed, 1 Oct 2025 05:59:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] Virtio-GPU S4 support
To: dongwon.kim@intel.com, dri-devel@lists.freedesktop.org
References: <20250924194755.1265531-1-dongwon.kim@intel.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20250924194755.1265531-1-dongwon.kim@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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

On 9/24/25 22:47, dongwon.kim@intel.com wrote:
> From: Dongwon Kim <dongwon.kim@intel.com>
> 
> This patch series introduces support for handling hibernation (S4)
> in the virtio-gpu driver by implementing .freeze and .restore hooks,
> along with a PM notifier to restore GPU resources upon resume.
> 
> Patch 1 adds virtgpu_freeze and virtgpu_restore functions, which manage
> virtio queue teardown before suspend/hibernation and reinitialization
> during resume.
> 
> Patch 2 implements a mechanism to track and restore virtio_gpu_object
> instances, addressing the issue where QEMU discards resources during
> virtio-gpu-reset triggered by hibernation.
> 
> Patch 3 adds a PM notifier that triggers resubmission of GPU objects to
> QEMU when the guest resumes from hibernation.
> 
> These changes ensure that the virtio-gpu driver can reliably restore
> virtio-gpu resources after hibernation, preventing resource loss that
> leads to system's instability.
> 
> v2: 10ms sleep is added in virtgpu_freeze to avoid the situation
>     the driver is locked up during resumption.
> 
> v3: Plain 10ms delay (v2) is replaced with wait calls which wait until
>     the virtio queue is empty.
>     (Dmitry Osipenko)
> 
> v4: New version of patchset only covers S4 case because loss of resources
>     in S3 case can be avoided by skipping virtio-gpu-reset in QEMU
>     (hw/display/virtio-gpu.c). For this, virtio-gpu-pci device should be
>     attached to PCIE bus AND a PCIE option, 'x-pcie-pm-no-soft-reset' needs
>     to be enabled when launching QEMU
>     (e.g. -device virtio-gpu-pci,bus=port,x-pcie-pm-no-soft-reset=true)
> 
> Dongwon Kim (3):
>   drm/virtio: Freeze and restore hooks to support suspend and resume
>   drm/virtio: Add support for saving and restoring virtio_gpu_objects
>   drm/virtio: Restore Virt-GPU res on hibernation resume via PM notifier
> 
>  drivers/gpu/drm/virtio/virtgpu_drv.c    | 60 ++++++++++++++++++++-
>  drivers/gpu/drm/virtio/virtgpu_drv.h    | 13 +++++
>  drivers/gpu/drm/virtio/virtgpu_kms.c    | 49 ++++++++++++++---
>  drivers/gpu/drm/virtio/virtgpu_object.c | 71 +++++++++++++++++++++++++
>  4 files changed, 186 insertions(+), 7 deletions(-)
> 

Hi,

Hibernation works well for me with v4, going to apply patches soon.

Re `x-pcie-pm-no-soft-reset=true`, apparently it's not enough to have it
for S3. I'm still seeing virtio-gpu being reset with S3 and this reset
comes from a guest kernel writing PCI reg, resetting PCI device on
kernel resume. Will look further into it.

-- 
Best regards,
Dmitry
