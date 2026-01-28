Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFZtOhUSemnH2AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 14:41:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67186A2407
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 14:41:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D393B10E119;
	Wed, 28 Jan 2026 13:41:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 003DD10E119
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 13:41:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 17FA91515
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 05:41:30 -0800 (PST)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id
 583393F73F
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 05:41:36 -0800 (PST)
Date: Wed, 28 Jan 2026 13:39:56 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Caterina Shablia <caterina.shablia@collabora.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, kernel@collabora.com,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm: add ARM interleaved 64k modifier
Message-ID: <aXoRrIOldhfBiiMQ@e142607>
References: <20260127110740.473562-1-caterina.shablia@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260127110740.473562-1-caterina.shablia@collabora.com>
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
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:caterina.shablia@collabora.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:kernel@collabora.com,m:boris.brezillon@collabora.com,m:steven.price@arm.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[liviu.dudau@arm.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,collabora.com,arm.com,lists.freedesktop.org,vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.993];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[liviu.dudau@arm.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,arm.com:email]
X-Rspamd-Queue-Id: 67186A2407
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 11:07:39AM +0000, Caterina Shablia wrote:
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
> Previous patch:
> https://lists.freedesktop.org/archives/dri-devel/2026-January/546655.html
> 
> Changes since v1:
> 
> * Rewrite the description of the modifier to be hopefully unambiguous.
> 
> Signed-off-by: Caterina Shablia <caterina.shablia@collabora.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

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
> -- 
> 2.47.3
> 
