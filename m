Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKU1Af4ze2lJCQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 11:18:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE82AE7F8
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 11:18:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04E2F10E2DE;
	Thu, 29 Jan 2026 10:18:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ZCmAZGrR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24EBC10E2DE
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 10:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1769681912;
 bh=Rz7mcUafrSg4lut8jeKQqqooiY1nYVBazT3jFi6XCAE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZCmAZGrRpuDCFRUAPijTAld9Ai77R/kz0Ko+MM2qpZPWvhEox9yXNCIkXttrOhmJ4
 WUNdMRwF5d5Wp9l83gUFsmphy4TGMh8uzSJiTP33rihJuSveIpqLyla9R17/SndOpd
 xnrHzABTiltnecp24QxBGqdgjSeoJ7zRLRJZbCUmASLF3UQK+9w2RJ2K1rtE3IFi9U
 LgMa3uGu7hWFf7i6AaSwOnvzUnMBA7POQ7pazvaFXdUo0RFv+Ka+3TB8lak0kcjzuA
 eybRmwmt6aRnhWp4XR5DfVuYO3EJgEJJTWkaBgj2tCcd69w5sVrT7VsCX34TII+WAX
 wG+xfo38NKSOA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 41C2317E0699;
 Thu, 29 Jan 2026 11:18:32 +0100 (CET)
Date: Thu, 29 Jan 2026 11:18:27 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Caterina Shablia <caterina.shablia@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, kernel@collabora.com,
 "Steven Price" <steven.price@arm.com>, "Liviu Dudau" <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm: add ARM interleaved 64k modifier
Message-ID: <20260129111827.36fe150c@fedora>
In-Reply-To: <20260128184058.807213-1-caterina.shablia@collabora.com>
References: <20260128184058.807213-1-caterina.shablia@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:caterina.shablia@collabora.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:kernel@collabora.com,m:steven.price@arm.com,m:liviu.dudau@arm.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	HAS_ORG_HEADER(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,collabora.com,arm.com,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,arm.com:email,collabora.com:email,collabora.com:dkim]
X-Rspamd-Queue-Id: 5CE82AE7F8
X-Rspamd-Action: no action

On Wed, 28 Jan 2026 18:40:57 +0000
Caterina Shablia <caterina.shablia@collabora.com> wrote:

> This modifier is primarily intended to be used by panvk to implement
> sparse partially-resident images with better map and unmap
> performance, and no worse access performance, compared to
> implementing them in terms of U-interleaved.
> 
> With this modifier, the plane is divided into 64k byte 1:1 or 2:1
> -sided tiles. The 64k tiles are laid out linearly. Each 64k tile
> is divided into blocks of 16x16 texel blocks each, which themselves
> are laid out linearly within a 64k tile. Then within each such
> 16x16 block, texel blocks are laid out according to U order,
> similar to 16X16_BLOCK_U_INTERLEAVED.
> 
> Unlike 16X16_BLOCK_U_INTERLEAVED, the layout does not depend on
> whether a format is compressed or not.
> 
> The hardware features corresponding to this modifier are available
> starting with v10 (second gen Valhall.)
> 
> The corresponding panvk MR can be found at:
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/38986
> 
> Previous version:
> https://lists.freedesktop.org/archives/dri-devel/2026-January/547072.html
> 
> No changes since v2
> 
> Changes since v1:
> 
> * Rewrite the description of the modifier to be hopefully unambiguous.
> 
> Signed-off-by: Caterina Shablia <caterina.shablia@collabora.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Queued to drm-misc-next.

> ---
>  include/uapi/drm/drm_fourcc.h | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index e527b24bd824..452f901513ad 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -1422,6 +1422,22 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
>  #define DRM_FORMAT_MOD_ARM_16X16_BLOCK_U_INTERLEAVED \
>  	DRM_FORMAT_MOD_ARM_CODE(DRM_FORMAT_MOD_ARM_TYPE_MISC, 1ULL)
>  
> +/*
> + * ARM 64k interleaved modifier
> + *
> + * This is used by ARM Mali v10+ GPUs. With this modifier, the plane is divided
> + * into 64k byte 1:1 or 2:1 -sided tiles. The 64k tiles are laid out linearly.
> + * Each 64k tile is divided into blocks of 16x16 texel blocks, which are
> + * themselves laid out linearly within a 64k tile. Then within each 16x16
> + * block, texel blocks are laid out according to U order, similar to
> + * 16X16_BLOCK_U_INTERLEAVED.
> + *
> + * Note that unlike 16X16_BLOCK_U_INTERLEAVED, the layout does not change
> + * depending on whether a format is compressed or not.
> + */
> +#define DRM_FORMAT_MOD_ARM_INTERLEAVED_64K \
> +	DRM_FORMAT_MOD_ARM_CODE(DRM_FORMAT_MOD_ARM_TYPE_MISC, 2ULL)
> +
>  /*
>   * Allwinner tiled modifier
>   *
> 
> base-commit: f08f665f8cda9520d98ee24545d306a92f386616

