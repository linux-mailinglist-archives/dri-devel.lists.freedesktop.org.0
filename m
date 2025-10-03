Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7927BB7413
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 16:57:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1748610E93F;
	Fri,  3 Oct 2025 14:57:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="ineq/xmF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6131910E93F
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 14:57:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1759503468; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=DVeipKomy19ojzETFzqa+z64abcuox+x1ChzJzb/lnjET0eolsNwshcMVE/BmnBeY854XDmO5+rsq/QVwisELjqWqDjta3lyEPpEv3cBs1I0OUPDRcltHtUuZvqTnRdAaendDLfLHEDlKwp8PACsBge8NiFeimLdXTk5+lv+hYI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1759503468;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=wBe706cP1Iwdsi7DDiPTITvXavi6aWiPV32OW0VtH2s=; 
 b=C8yN0fUDzVqlYVd3jykjKqoJ4qk7tQBwh74Vlq3aI03or+CJDcQIw1u7tgR4apTYr4lg14teKmKRBOWhpmJLGDHNGrmnB8ZukhtcgntnYtbe7lj6SzwvZlOX1GAZP50p5vB8RdOxKt97OLZh9DTIsTA9eKEGtF+ahzJZuXkPLn8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759503468; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=wBe706cP1Iwdsi7DDiPTITvXavi6aWiPV32OW0VtH2s=;
 b=ineq/xmFNjUAdBS0qAcOBF1kZwgKBiGkDWTNAeywSg/qRe572hh//uerpdmp4LLx
 5hO/IKxm6Op8Oahvi3xS10eBPoMOblN/z+ygmk/fHBhimuGnxy3JAs9z4uoNfb2YJA0
 A1bePwZU91nw6++kWjlQ+Ios7873eRz2p+QOV06g=
Received: by mx.zohomail.com with SMTPS id 1759503466446709.8437181582915;
 Fri, 3 Oct 2025 07:57:46 -0700 (PDT)
Message-ID: <ece9d413-8939-4628-9d64-337c9352d2e8@collabora.com>
Date: Fri, 3 Oct 2025 17:57:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] Virtio-GPU S4 support
To: dongwon.kim@intel.com, dri-devel@lists.freedesktop.org
Cc: nirmoyd@nvidia.com
References: <20251003053402.732218-1-dongwon.kim@intel.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20251003053402.732218-1-dongwon.kim@intel.com>
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

On 10/3/25 08:33, dongwon.kim@intel.com wrote:
> From: Dongwon Kim <dongwon.kim@intel.com>
> 
> This patch series implements functions for .freeze and .restore hooks for
> virtio-gpu driver as well as pm-notifier to handle object restoration in
> S4(hiberation) case.
> 
> First patch adds `virtgpu_freeze` and `virtgpu_restore` functions.
> These functions handle the deletion of virtio queues before suspension and
> their recreation during the restoration process.
> 
> Second patch implements a mechanism for restoring `virtio_gpu_object` instances.
> This is necessary because the host (QEMU) deletes all associated resources during
> the virtio-gpu reset, which occurs as part of hiberation/resume process.
> 
> Third patch adds pm-notifier to the driver that handles resubmission of virtio-gpu
> objects to the QEMU once the guest resumes from hibenation.
> 
> These changes ensure that the virtio-gpu driver can properly handle hibernation
> scenarios without resource loss.
> 
> v2: 10ms sleep is added in virtgpu_freeze to avoid the situation
>     the driver is locked up during resumption.
> 
> v3: Plain 10ms delay (v2) is replaced with wait calls which wait until
>     the virtio queue is empty.
>     (Dmitry Osipenko)
> 
> v4: New version of patchset only covers S4 case because loss of resources in S3
>     case can be avoided by skipping virtio-gpu-reset in QEMU (hw/display/virtio-gpu.c).
>     To skip virtio-gpu-reset (soft-reset), virtio-gpu-pci device should be attached to
>     PCIE bus AND a PCIE option, 'x-pcie-pm-no-soft-reset' should added and set to 'true'.
>     (e.g. -device virtio-gpu-pci,bus=port,x-pcie-pm-no-soft-reset=true)
> 
> v5: Remove virtio_gpu_object from the restore list before freeing the object
>     to prevent an use-after-free situation.
>     (Nirmoy Das)
> 
>     Protect restore list operations with a spinlock
>     (Nirmoy Das)
> 
>     Move restore list node into virtio_gpu_bo struct to reduce memory usage
>     (Dmitry Osipenko)
> 
>     Remove unused header - drm_atomic_helper.h 
>     (Dmitry Osipenko)
> 
> Dongwon Kim (3):
>   drm/virtio: Freeze and restore hooks to support suspend and resume
>   drm/virtio: Add support for saving and restoring virtio_gpu_objects
>   drm/virtio: Add PM notifier to restore objects after hibernation
> 
>  drivers/gpu/drm/virtio/virtgpu_drv.c    | 60 +++++++++++++++++++++++-
>  drivers/gpu/drm/virtio/virtgpu_drv.h    | 12 +++++
>  drivers/gpu/drm/virtio/virtgpu_kms.c    | 51 ++++++++++++++++++---
>  drivers/gpu/drm/virtio/virtgpu_object.c | 61 +++++++++++++++++++++++++
>  4 files changed, 177 insertions(+), 7 deletions(-)
> 

Hi,

On v6 please use scripts/get_maintainer.pl and make sure that all
virtio-gpu driver maintainers are emailed with the patches.

-- 
Best regards,
Dmitry
