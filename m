Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGB9Od5bj2lxQgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 18:14:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67959138890
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 18:14:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF16810E128;
	Fri, 13 Feb 2026 17:14:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IF5PWLRw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A63EB10E128;
 Fri, 13 Feb 2026 17:14:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6AC0743D67;
 Fri, 13 Feb 2026 17:14:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BFBCC116C6;
 Fri, 13 Feb 2026 17:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771002840;
 bh=TQL4yAmfHTFRfL0Xxlqlv5cDS//+iCUzmjzvprvGhzA=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=IF5PWLRwZ3W8kZnVR/YrM2BhpdTTWg2n95CZgpkjQeDbyZ7hFIz9Ag8w8glsCTe8e
 wYJsg9V9KpwJXzJKlWDdpiotnJ4nfLbailIpA3EUGoDspzGm67IeEkhPbgLxdVWEGE
 mUtxl/6sih/k9ZTvYOQ3kLl8Aj37o8Mx+jWIlBk3gvk/2U7ayrh8d1TRHxOHyHXZJ4
 lnADxY203WtyVlW8hL/OGI9wp1RaGuvPfez2tXhGLw62RF6Oby0M+Y67onCWv5SgkW
 x+r2sY+iYeEdofBnOHXwbWpUMzThTaexKLtL+wexg12k6Y38yVku70oEQ3X1uecVtc
 JtkatWQH2uOVQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Feb 2026 18:13:56 +0100
Message-Id: <DGE03Z9YNGAW.3RUQ7P7L93HEE@kernel.org>
Subject: Re: [PATCH v2 2/2] drm/nouveau: Add DRM_IOCTL_NOUVEAU_GET_ZCULL_INFO
Cc: "Lyude Paul" <lyude@redhat.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Mary Guillemard"
 <mary@mary.zone>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
To: "Mel Henning" <mhenning@darkrefraction.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260205-zcull3-v2-0-ac572f38cc7b@darkrefraction.com>
 <20260205-zcull3-v2-2-ac572f38cc7b@darkrefraction.com>
In-Reply-To: <20260205-zcull3-v2-2-ac572f38cc7b@darkrefraction.com>
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
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,mary.zone,lists.freedesktop.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 67959138890
X-Rspamd-Action: no action

On Thu Feb 5, 2026 at 7:56 PM CET, Mel Henning wrote:
> +int
> +nouveau_abi16_ioctl_get_zcull_info(ABI16_IOCTL_ARGS)
> +{
> +	struct nouveau_drm *drm =3D nouveau_drm(dev);
> +	struct nvkm_gr *gr =3D nvxx_gr(drm);
> +	struct drm_nouveau_get_zcull_info *out =3D data;
> +
> +	if (gr->has_zcull_info) {
> +		const struct nvkm_gr_zcull_info *i =3D &gr->zcull_info;
> +
> +		out->width_align_pixels =3D i->width_align_pixels;
> +		out->height_align_pixels =3D i->height_align_pixels;
> +		out->pixel_squares_by_aliquots =3D i->pixel_squares_by_aliquots;
> +		out->aliquot_total =3D i->aliquot_total;
> +		out->zcull_region_byte_multiplier =3D i->zcull_region_byte_multiplier;
> +		out->zcull_region_header_size =3D i->zcull_region_header_size;
> +		out->zcull_subregion_header_size =3D i->zcull_subregion_header_size;
> +		out->subregion_count =3D i->subregion_count;
> +		out->subregion_width_align_pixels =3D i->subregion_width_align_pixels;
> +		out->subregion_height_align_pixels =3D i->subregion_height_align_pixel=
s;
> +		out->ctxsw_size =3D i->ctxsw_size;
> +		out->ctxsw_align =3D i->ctxsw_align;
> +
> +		return 0;
> +	} else {
> +		return -ENODEV;

ENODEV usually means that that device fell off the bus, I think ENOTTY woul=
d be
a better fit.

> +	}
> +}
