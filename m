Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C933CA9B0F4
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 16:32:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9D4110E827;
	Thu, 24 Apr 2025 14:32:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="ODiIurdN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73CB510E827
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 14:32:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1745505163; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=flFk0AOF66b8wJDEbTEgsz3kulm/8bbHkQFGLeOX9nwly3hOl+t9NT0AXdf0/DLZpuiAqDc6tVFIN4cC4GwGpH+BJfewQIWpUye8Zw3j7rP5tSY4v4DJ6MRb35LCctJSmcf0fiZHF0sk4mybRMHG/r+7DsvkLFMDFtBhP2u0I5Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1745505163;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=0lYl1H+EbAq4vmBBBat7MTnjC2b8OYxR6XvctHOp8d4=; 
 b=YJIDrJCD6uYKjsSrtI+VwtSWWJM8Rh1H405D46Xpkl9RiJvku8tyLvQwZqpzLQffDe7s+49JGJxsFzXYYoRKWm0eFvzkrWMBWwEek9Wqic8zKWuDyR6vEFMsHQKD6J5+c81xjUrC5p6nE63RntUmwsKPDc3K75dkX2K2i5eNNg4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745505163; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=0lYl1H+EbAq4vmBBBat7MTnjC2b8OYxR6XvctHOp8d4=;
 b=ODiIurdNUlrkhcecpWC3nbkygLhjVZkZY7JQjUVOZ/SBkv0nYSMRYmHVaEEKj4Su
 J8sdRdj6XkbL5gvKFXsaWTOqqvvqbMi/xctf9KjUx3oLv6UQW2xWcSQ2oxRKnQFL3Pb
 7FAQA9HraHWR2DmOSPuAaAZzyFvSkS/P8pga6/Xc=
Received: by mx.zohomail.com with SMTPS id 1745505162257808.3128918065064;
 Thu, 24 Apr 2025 07:32:42 -0700 (PDT)
Date: Thu, 24 Apr 2025 15:32:39 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v2 1/2] drm/panthor: Add missing explicit padding in
 drm_panthor_gpu_info
Message-ID: <6ibdpb4jg2kcgjfo3amfnjvp3xg3bb4pq6s3jqnenalefjhl3x@yai4bmonlrkc>
References: <20250417144907.3679831-1-boris.brezillon@collabora.com>
 <20250417144907.3679831-2-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250417144907.3679831-2-boris.brezillon@collabora.com>
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

On 17.04.2025 16:49, Boris Brezillon wrote:
> drm_panthor_gpu_info::shader_present is currently automatically offset
> by 4 byte to meet Arm's 32-bit/64-bit field alignment rules, but those
> constraints don't stand on 32-bit x86 and cause a mismatch when running
> an x86 binary in a user emulated environment like FEX. It's also
> generally agreed that uAPIs should explicitly pad their struct fields,
> which we originally intended to do, but a mistake slipped through during
> the submission process, leading drm_panthor_gpu_info::shader_present to
> be misaligned.
>
> This uAPI change doesn't break any of the existing users of panthor
> which are either arm32 or arm64 where the 64-bit alignment of
> u64 fields is already enforced a the compiler level.
>
> Changes in v2:
> - Rename the garbage field into pad0 and adjust the comment accordingly
> - Add Liviu's R-b
>
> Fixes: 0f25e493a246 ("drm/panthor: Add uAPI")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Acked-by: Liviu Dudau <liviu.dudau@arm.com>

Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>

> ---
>  include/uapi/drm/panthor_drm.h | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
> index 97e2c4510e69..dbb907eae443 100644
> --- a/include/uapi/drm/panthor_drm.h
> +++ b/include/uapi/drm/panthor_drm.h
> @@ -293,6 +293,9 @@ struct drm_panthor_gpu_info {
>  	/** @as_present: Bitmask encoding the number of address-space exposed by the MMU. */
>  	__u32 as_present;
>
> +	/** @pad0: MBZ. */
> +	__u32 pad0;
> +
>  	/** @shader_present: Bitmask encoding the shader cores exposed by the GPU. */
>  	__u64 shader_present;
>
> --
> 2.49.0

Adrian Larumbe
