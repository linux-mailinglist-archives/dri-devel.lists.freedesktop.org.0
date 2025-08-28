Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78786B3AE61
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 01:20:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9802310E040;
	Thu, 28 Aug 2025 23:19:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="JuHVOD1V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50D6A10E040
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 23:19:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1756423185; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=fBP1QE9hUTdRtd5SoDn9f1q8SCmyDE47y0Biq6lRDZRxE9PlT90k1o0u4uvVoHLVmKOavxr+nZ0/oGtL4IEIyNdYz+UDWQdC/k4YqA5fZfhiM1uYYbiZakqWlI/m/586ljwlvSNYgOu0LtomXafbWx2tevDGHI7qOy+zGNIuHpA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1756423185;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=//sW/a2KrCcPD1VaLKBJOK1FbYvTVA0T4g7i0IE5MFk=; 
 b=kL6xi8okQutIMnxfq3k+CJJIgNfHML8/9npY7dN2UXPTxfAxf1CjQHDLY1oS/OVbwShCa0f6NEGt9iMxyr2SwbbMuDYaQGnb+KDQqDk1qJ8/PR8jtXMqvu3hap/NPDuib/d4SYIwC8HVGZ/hpQvhZcd5qcc9CNGUVoxgzfjW8nw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756423185; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=//sW/a2KrCcPD1VaLKBJOK1FbYvTVA0T4g7i0IE5MFk=;
 b=JuHVOD1ViaWQl9ZpSCDz7XXeffijiNx14nO18fRNP8rpHQ1fkw/RgvtPJSVscJrM
 uMMwqV3XwGQVNVKC25F/Ysz78y3JnPOlKKHskrN3gAv0chlAUh4jCeBfj7zSjKniYFV
 X/XXYYZVUQjjopFl2QmQFMfCCMQCM2wA4CS4E9zg=
Received: by mx.zohomail.com with SMTPS id 1756423183032290.65905970578365;
 Thu, 28 Aug 2025 16:19:43 -0700 (PDT)
Date: Fri, 29 Aug 2025 00:19:39 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, 
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com
Subject: Re: [PATCH 0/5] Introduce Panfrost JM contexts
Message-ID: <3ren5nysulgowtvaqfnsysn5qcsuhlov7orxzbuzfje4oyzis6@jzdougkthyry>
References: <20250828023422.2404784-1-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250828023422.2404784-1-adrian.larumbe@collabora.com>
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

Mesa MR with the UM driver changes is available at:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/37075

On 28.08.2025 03:34, Adrián Larumbe wrote:
> This patch series brings the notion of JM contexts into Panfrost.
> UM will be able to create contexts, get a handle for them and attach
> it to a job submission. Contexts describe basic HW resource assignment
> to jobs, and also their job slot priorities.
>
> A Mesa MR with UM changes that leverage this new kernel driver feature
> is still in the making.
>
> Boris Brezillon (5):
>   drm/panfrost: Add job slot register defs for affinity
>   drm/panfrost: Introduce uAPI for JM context creation
>   drm/panfrost: Introduce JM context for manging job resources
>   drm/panfrost: Expose JM context IOCTLs to UM
>   drm/panfrost: Display list of device JM contexts over debugfs
>
>  drivers/gpu/drm/panfrost/panfrost_device.h |   4 +-
>  drivers/gpu/drm/panfrost/panfrost_drv.c    | 152 +++++++++++-
>  drivers/gpu/drm/panfrost/panfrost_job.c    | 270 +++++++++++++++++----
>  drivers/gpu/drm/panfrost/panfrost_job.h    |  27 ++-
>  drivers/gpu/drm/panfrost/panfrost_regs.h   |   6 +
>  include/uapi/drm/panfrost_drm.h            |  93 +++++++
>  6 files changed, 494 insertions(+), 58 deletions(-)
>
>
> base-commit: 5c76c794bf29399394ebacaa5af8436b8bed0d46
> --
> 2.50.0

Adrian Larumbe
