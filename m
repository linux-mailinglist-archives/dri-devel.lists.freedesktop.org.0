Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UM8zDHQud2kvdAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 10:05:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE6985C1E
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 10:05:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2A2910E3B3;
	Mon, 26 Jan 2026 09:05:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="euomdtMe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 334F610E3B3
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 09:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1769418349;
 bh=65QIe7iiCGPbQ5akzOl/Jh9cUnPpMNp0fShoBHLv1B4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=euomdtMeYC0CWdaWTBQwbTyHD8miuU8+lg4D52YJKw0I+OdjGHSGKdCrNUtiqPAQX
 m0IOw//b0wV+yOYmsBYFZ1nfJjdbN5EbaqrWOiQz0kVuNfu4osS4+B0Yvn/YebszbT
 c927tQeNq/DnQXCAIU3FzZeYJnZeXbvKqPFcFvJlFzF9Vect0dzbCXvPTLac/sWGTE
 P5l0acHikx9gCvmkg0XsrD0IdnNnS1YLBY4bHN4eik4C4IOZkJMamzFxHiutaQStDr
 DUKYX6wsEzUDLGa0qgFb/uFvvtvRYN3hxGzLGNghl23/nLAIgtt/WLYPsm9zyOt3om
 B1qY3gHOKm3lw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 170B217E0E42;
 Mon, 26 Jan 2026 10:05:49 +0100 (CET)
Date: Mon, 26 Jan 2026 10:05:45 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Caterina Shablia <caterina.shablia@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, kernel@collabora.com,
 "Steven Price" <steven.price@arm.com>, "Liviu Dudau" <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] drm: add ARM interleaved 64k modifier
Message-ID: <20260126100545.08a4ffd1@fedora>
In-Reply-To: <20260123212327.83064-1-caterina.shablia@collabora.com>
References: <20260123212327.83064-1-caterina.shablia@collabora.com>
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
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:caterina.shablia@collabora.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:kernel@collabora.com,m:steven.price@arm.com,m:liviu.dudau@arm.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,collabora.com,arm.com,lists.freedesktop.org,vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_ORG_HEADER(0.00)[]
X-Rspamd-Queue-Id: 7CE6985C1E
X-Rspamd-Action: no action

Hello Caterina,

On Fri, 23 Jan 2026 21:23:25 +0000
Caterina Shablia <caterina.shablia@collabora.com> wrote:

> This modifier is intended to be used by panvk to implement sparse
> partially-resident images with better map and unmap performance,
> and no worse access performance, compared to implementing them in
> terms of U-interleaved.
> 
> With this modifier, the arrangement of texel blocks is very similar
> to block U-interleaved. Tiles are laid out linearly. Tiles are
> always 64k bytes in size and are 1:1-sided rectangles when texel
> block is 1 byte or a multiple of 4 bytes, and 2:1-sided otherwise.

It's not all that clear that we're dealing with mega tiles formed with
a set of U-interleaved tiles. Also, the 1:1-sided rectangle sounds
like a complex way to qualify a square.

"
This modifier is a exposing mega tiles of 64 KiB. It's formed of
U-interleaved tiles laid out linearly to cover a square or a rectangle
whose width is twice the height.
"

> Only power of two byte texel blocks can be used with this modifier.
> Within a single tile, texels are arranged according to U-interleaving.
> 
> Unlike block U-interleaved, the layout depends solely on texel block
> size and doesn't change depending on whether the image format is
> compressed or not.

Hm, are you sure of that? I'd assume the inner tile size to still
depend on compressed vs !compressed, meaning the overall layout is also
dependent on the compressed vs !compressed property.

> 
> The hardware features corresponding to this modifier are available
> starting with v10 (second gen Valhall.)
> 
> The corresponding panvk MR can be found at:
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/38986
> 
> Signed-off-by: Caterina Shablia <caterina.shablia@collabora.com>
> ---
>  include/uapi/drm/drm_fourcc.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index e527b24bd824..0da2c880e08c 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -1422,6 +1422,16 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
>  #define DRM_FORMAT_MOD_ARM_16X16_BLOCK_U_INTERLEAVED \
>  	DRM_FORMAT_MOD_ARM_CODE(DRM_FORMAT_MOD_ARM_TYPE_MISC, 1ULL)
>  
> +/*
> + * ARM 64k interleaved modifier
> + *
> + * This is used by ARM Mali v10+ GPUs. It's basically the same as 16x16 block
> + * U-interleaved, but within 64k-byte 1:1 or 2:1 -sided tiles.

Again, it's not clear from this description that this modifier is
exposing "mega" tiles formed with a set of U-interleaved tiles spanning
a 64KiB section. The way I read this is that it's U-interleaved, but
over a bigger region, like 256x256 U-interleaved.

Regards,

Boris

> Tiles themselves
> + * are laid out linearly.
> + */
> +#define DRM_FORMAT_MOD_ARM_INTERLEAVED_64K \
> +	DRM_FORMAT_MOD_ARM_CODE(DRM_FORMAT_MOD_ARM_TYPE_MISC, 2ULL)
> +
>  /*
>   * Allwinner tiled modifier
>   *
> 
> base-commit: f08f665f8cda9520d98ee24545d306a92f386616

