Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2237FAA983A
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 18:03:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D80E10E3FA;
	Mon,  5 May 2025 16:02:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="SYzPsdDQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com
 [136.143.184.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98EF110E409
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 16:02:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1746460973; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Y6j4vM7BD+QJfz/3N9wilk6toEZGLKuyKpAR1vA4+dACnaIky6pcEvZcu0Jis0TNwrI+QYthPmGyTE350Lspen9S5eoI5D9fTIM8l+PKxlqUw6eaqcQR8Krdg7OqZ9hcHhXYG7xM/HUQzkGrcg8dc4cDMQ8HVTUHB7OMXNvm7W8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1746460973;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=FW5KdwxdUtqDya7s/xSd41IdKIvCpCo85jnQWPhUSGg=; 
 b=kaWipEKZnqbjvGftA9/r5gfGBCC+1zwb6y3CrlHG+R/niV0GnQeplIY0cRA2Z/xf8JrPti53pkQ59E5cH7B8E5AHCEXxE+TjucqDkxNu8VX7VAReWFj8no/5zPQIaCSBGRF2BQzdQW6Ynr6mxU53qsgFLUFpnlubxOvbbJXigA8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746460973; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
 bh=FW5KdwxdUtqDya7s/xSd41IdKIvCpCo85jnQWPhUSGg=;
 b=SYzPsdDQ1SXPQR1AXWXBu2lK7w7f2m/O+zzxwvMLwsR+BTObQ1uhcunGPN8JgTCB
 n7Crn9VNsFIndg3RYy3VnkP6t93eGI7cDXqZiFQF/FexyWITYtaFCNg8pQPALfR4X6v
 4xlLQKZZUrsCSg8EVvyfmCdZfdB9xfg3lRDxQOdw=
Received: by mx.zohomail.com with SMTPS id 1746460970285172.23299449429555;
 Mon, 5 May 2025 09:02:50 -0700 (PDT)
Message-ID: <aca6f6b0-f2c3-4fee-949f-16a9f2595f39@collabora.com>
Date: Mon, 5 May 2025 19:02:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/2] Virtio-GPU suspend and resume
To: dongwon.kim@intel.com, dri-devel@lists.freedesktop.org
References: <20250418232949.1032604-1-dongwon.kim@intel.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20250418232949.1032604-1-dongwon.kim@intel.com>
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

On 4/19/25 02:29, dongwon.kim@intel.com wrote:
> From: Dongwon Kim <dongwon.kim@intel.com>
> 
> This patch series introduces a freeze and restore mechanism for
> the virtio-gpu driver:
> 
> First patch adds `virtgpu_freeze` and `virtgpu_restore` functions.
> These functions handle the deletion of virtio queues before suspension and
> their recreation during the restoration process.
> 
> Second patch implements a mechanism for restoring `virtio_gpu_object` instances.
> This is necessary because the host (QEMU) deletes all associated resources during
> the virtio-gpu reset, which occurs as part of the restoration process.
> 
> These changes ensure that the virtio-gpu driver can properly handle suspend and
> resume scenarios without resource loss.
> 
> Dongwon Kim (2):
>   drm/virtio: Freeze and restore hooks to support suspend and resume
>   drm/virtio: Implement save and restore for virtio_gpu_objects
> 
>  drivers/gpu/drm/virtio/virtgpu_drv.c    | 59 +++++++++++++++++++++-
>  drivers/gpu/drm/virtio/virtgpu_drv.h    | 11 +++++
>  drivers/gpu/drm/virtio/virtgpu_kms.c    | 24 ++++++---
>  drivers/gpu/drm/virtio/virtgpu_object.c | 65 +++++++++++++++++++++++++
>  4 files changed, 152 insertions(+), 7 deletions(-)

Hi,

Something is wrong with your git send-mail setup, it's not first time
your patches have an empty list of mail recipients. Please fix. No need
to resend patches, I'll review them on the ML.

-- 
Best regards,
Dmitry

