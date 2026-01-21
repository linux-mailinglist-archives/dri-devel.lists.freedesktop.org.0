Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEU0C0QMcWmPcQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 18:26:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFB45A7FF
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 18:26:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EB0E10E862;
	Wed, 21 Jan 2026 17:26:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="LOf554A6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-g124.zoho.com (sender4-pp-g124.zoho.com
 [136.143.188.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DE2E10E862
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 17:26:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1769016374; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=iAN4Sc5TI4ZuPlw3+Z9kXHMuoPWbnOh7I8f8mTf279mP3jEb9iOeY8OXjdnMzMW924iBbzWBQdqZkJOquBsPpY7ca7P/SBY6n+R+aeh5t6x0dSqcfMGX39jUY9O6L0+HHKppH9ufTOBd3Ihh6CH1kjvAxZAK8hj5M4b2TVgcfZY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1769016374;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=1K3/4QZZDtK8MheHDo6fRI87P1y8Pd+6rbEUfaucTj8=; 
 b=RnkAIwgXPLDCwHc34AAPu1cPBh7ag6m2V/hdrDxbePVo5Gx9mxle8cfSqpilto2WMNXBAf3bgqYWbVCDrY9hu4JHf8HVwaJFfG5e8WGqvpE9EjjWnFQQnrKGJZ5CVYvD12mo4/U8C1SWKi0AXAVsnWTnKjmen3S/VcgLKTPefuc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769016374; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=1K3/4QZZDtK8MheHDo6fRI87P1y8Pd+6rbEUfaucTj8=;
 b=LOf554A6zwLd87xHmMkpuKvB62MMymKoI2kNFknubwd3F3nxAgIjZKx1+tXg/AoL
 T11z7XBTRN2iWylHKoDHu9Zot1NvK+PqqIW8II4ShxpcP91aA4FiwuTZLhuFqPVIYpP
 RKXtSCDADPB9L+cwweqR/C1xjsrU3Q3JJyYyKmfs=
Received: by mx.zohomail.com with SMTPS id 176901637330082.77610742942124;
 Wed, 21 Jan 2026 09:26:13 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Langyan Ye <yelangyan@huaqin.corp-partner.google.com>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH] drm/panel: ilitek-ili9882t: Select DRM_DISPLAY_DSC_HELPER
Date: Wed, 21 Jan 2026 18:26:08 +0100
Message-ID: <3450009.mvXUDI8C0e@workhorse>
In-Reply-To: <20260115125136.64866-1-mcanal@igalia.com>
References: <20260115125136.64866-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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
X-Spamd-Result: default: False [-1.81 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:yelangyan@huaqin.corp-partner.google.com,m:mcanal@igalia.com,m:kernel-dev@igalia.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,huaqin.corp-partner.google.com,lists.freedesktop.org,igalia.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[nicolas.frattaroli@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.frattaroli@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,collabora.com:email,collabora.com:dkim,igalia.com:email]
X-Rspamd-Queue-Id: BBFB45A7FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thursday, 15 January 2026 13:50:48 Central European Standard Time Ma=C3=
=ADra Canal wrote:
> The panel-ilitek-ili9882t driver uses drm_dsc_pps_payload_pack() which
> is provided by the DRM_DISPLAY_DSC_HELPER. Add the missing Kconfig
> select to fix the following build error:
>=20
>   ERROR: modpost: "drm_dsc_pps_payload_pack" [drivers/gpu/drm/panel/panel=
=2Dilitek-ili9882t.ko] undefined!
>=20
> Fixes: 65ce1f5834e9 ("drm/panel: ilitek-ili9882t: Switch Tianma TL121BVMS=
07 to DSC 120Hz mode")
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
>  drivers/gpu/drm/panel/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index a0fe6069e5e4..ae25f003aa33 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -280,6 +280,7 @@ config DRM_PANEL_ILITEK_ILI9882T
>  	depends on OF
>  	depends on DRM_MIPI_DSI
>  	depends on BACKLIGHT_CLASS_DEVICE
> +	select DRM_DISPLAY_DSC_HELPER
>  	help
>  	  Say Y if you want to enable support for panels based on the
>  	  Ilitek ILI9882t controller.
>=20

Tested-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Thanks, this build failure has been annoying me for the past few days,
can confirm it works as described and the fix makes sense.



