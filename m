Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULK8MfMdn2lcZAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 17:06:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F2419A3AF
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 17:06:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48CD710E1C6;
	Wed, 25 Feb 2026 16:06:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="NdoInt4O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4251210E1C6
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 16:06:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1772035565; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=DwvrxgFDD7yaABbL75pD5uWzGHFdq/c8ZtIWcRC9ZzW3ktFSxWyB44F+eNC2aYvEjL7Nj4LBG7Z5zZ9fXymNogcweDs8Mg3ppy9IIf0/Y39ZYrD7hefeqdSfrRnSfGZyy12j59eTSn/a219TTUGb72jD8Mf1UrtgN0TONxivio4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1772035565;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=WBoRZThq5Nf1V048VGT37kJKosRchxKq2b2+5XsNmyg=; 
 b=SDrNMVuMZs6L717FXSgfdVu2k5bH+NOw3EEGMX8UXBApXZYos3dJTrNp1yGubGtJ7laRF6PEcDS9TtZJTOrKlVMbExF8G6s7X9jmJih+9RGSFDDkdepemRp+RglRY6btPr085bQsaapw+axRXvyl+a8hXaATqrZWp/zwYW0O3Uc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772035565; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=WBoRZThq5Nf1V048VGT37kJKosRchxKq2b2+5XsNmyg=;
 b=NdoInt4OHwhcWBUfv+MPhi+Y/WGJVXa20GfEQA+G0nnHgtwNeR39YivjbcKN/KSS
 W5vOslNyf7FkCugy5ypH0egMniE342Ge1TXy8l4GzfMlkBSGBPl0GfsJup7E8CqzV6M
 4vgZk9uGigWqjSNnsl2PTgIrRgiQFi8CW2WgXlYM=
Received: by mx.zohomail.com with SMTPS id 1772035562409337.5642540163378;
 Wed, 25 Feb 2026 08:06:02 -0800 (PST)
Message-ID: <87fd9bc3-4516-4380-8a67-1d2c2365524e@collabora.com>
Date: Wed, 25 Feb 2026 19:05:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/3] Virtio-GPU S4 support
To: dongwon.kim@intel.com, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, kraxel@redhat.com
Cc: nirmoyd@nvidia.com, vivek.kasireddy@intel.com
References: <20260107182745.229481-1-dongwon.kim@intel.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20260107182745.229481-1-dongwon.kim@intel.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[dmitry.osipenko@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dongwon.kim@intel.com,m:airlied@redhat.com,m:kraxel@redhat.com,m:nirmoyd@nvidia.com,m:vivek.kasireddy@intel.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.osipenko@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,collabora.com:mid,collabora.com:dkim]
X-Rspamd-Queue-Id: 21F2419A3AF
X-Rspamd-Action: no action

On 1/7/26 21:27, dongwon.kim@intel.com wrote:
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
> v6: Include object backed by imported dmabuf
>     (Dmitry Osipenko)
> 
>     Not storing virgl objects in the restore_list as virgl 3D objects are not
>     recoverable.
>     (Dmitry Osipenko)
> 
>     Change the name 'list',a node in restore_list to 'restore_node'
>     (Nirmoy Das)
> 
>     Use mutex instead of spinlock when updating restore_list
>     (Nirmoy Das)
> 
>     Initialize restore_node when virtio_gpu_object is created - this is to
>     check if the node is in the list with 'list_empty' before removing it.
> 
>     Restoring objects in the PM notifier is too late, as virtio-gpu
>     message communication begins in virtgpu_restore once virtqueues
>     are re-established. To address this, a 'hibernation' flag is set
>     during the PM_HIBERNATION_PREPARE phase in the notifier. This flag
>     is then used in virtgpu_restore to detect if the system is resuming
>     from S4, allowing objects to be recovered immediately after virtqueues
>     are reconfigured.
> 
> v7: Add a helper, virtio_gpu_add_object_to_restore_list
>     (Dmitry Osipenko)
> 
>     Unreference all objects before hibernation so they can be removed
>     on the host side, since they will be fully restored anyway. This
>     prevents the situation where host-side hibernation fails (leaving
>     all associated resources still alive) while the virtio-gpu driver
>     still attempts to restore those objects.
>     (Dmitry Osipenko)
> 
> Dongwon Kim (3):
>   drm/virtio: Freeze and restore hooks to support suspend and resume
>   drm/virtio: Add support for saving and restoring virtio_gpu_objects
>   drm/virtio: Add PM notifier to restore objects after hibernation
> 
>  drivers/gpu/drm/virtio/virtgpu_drv.c    | 74 +++++++++++++++++++++-
>  drivers/gpu/drm/virtio/virtgpu_drv.h    | 23 ++++++-
>  drivers/gpu/drm/virtio/virtgpu_kms.c    | 54 ++++++++++++++--
>  drivers/gpu/drm/virtio/virtgpu_object.c | 83 ++++++++++++++++++++++++-
>  drivers/gpu/drm/virtio/virtgpu_prime.c  | 43 ++++++++++++-
>  drivers/gpu/drm/virtio/virtgpu_vq.c     | 13 +++-
>  drivers/gpu/drm/virtio/virtgpu_vram.c   |  4 +-
>  7 files changed, 280 insertions(+), 14 deletions(-)
> 

Hello Kim,

Want let you know that I've seen the patches, but didn't have enough
time to review and test them. Will try to do it sooner. Will leave
couple comments for now.

Meanwhile there is a kernel bot bug report.

-- 
Best regards,
Dmitry
