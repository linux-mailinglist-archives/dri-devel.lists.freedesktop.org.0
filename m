Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCZSBtzQcGnHaAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 14:13:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 703445762D
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 14:12:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE9E891E1;
	Wed, 21 Jan 2026 13:12:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="TevD2rVT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D880210E1EF
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 13:12:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1769001169; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=f6Fw5PManxJnwUIqz9i9LPEBe4jdFCpVElnHTl4fCSQVUnDXoKHjsage3MJjq4e0+i1gZdZ8aHQnKLxK9SQ/BW0aj26z3oXk//aKOpQXNt8adNqRlrmsiKkNwlM2NvYowTcFE+N4PvfaEWHjIvLZpCaBoFp+NIl9Z2gYF6IOHR0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1769001169;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=H1s2Sqc2H7tTkgCHZ6ap55bNqaRWIsGoryyMU9YpSXY=; 
 b=MyG3+o+J/bUhBu4rc8cJ4TkVvctWuK1ieYsCaxJ0k9Xv8XkwCCor4sneVmQq07keZ7hVyw3Y/TmNV1e7B14R3gHDrtl37OXLHvAcLB5AHwwbEkht+94IdeHojgjxb7dbvOCI1iZ04N9BEPzICwjYOLKBgRKaSdHKxWqideJdwko=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769001169; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=H1s2Sqc2H7tTkgCHZ6ap55bNqaRWIsGoryyMU9YpSXY=;
 b=TevD2rVTzd6DlOZ9NX7xstatT9BEmDtHhlZ5aOYQoG3bP2d7olkYz4+geW86fHJ6
 jvGSjiOLwnskdSyZeRmMChF+EqQtyZ9d9HhR99alq2qoqr6WTmRFY7nAUgSFrOlyBFy
 7APK6e3+CzKrkEbVayJ48Fj+Gm35ly8xhvShxC08=
Received: by mx.zohomail.com with SMTPS id 1769001167999561.3091186443072;
 Wed, 21 Jan 2026 05:12:47 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/bridge: fix kdoc syntax
Date: Wed, 21 Jan 2026 14:12:41 +0100
Message-ID: <3177855.mvXUDI8C0e@workhorse>
In-Reply-To: <20251231-drm-bridge-alloc-getput-drm_of_find_bridge-kdoc-fix-v1-1-193a03f0609c@bootlin.com>
References: <20251231-drm-bridge-alloc-getput-drm_of_find_bridge-kdoc-fix-v1-1-193a03f0609c@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	CTE_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:luca.ceresoli@bootlin.com,m:Hui.Pu@gehealthcare.com,m:thomas.petazzoni@bootlin.com,m:linux-kernel@vger.kernel.org,m:lkp@intel.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nicolas.frattaroli@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,bootlin.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.frattaroli@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,bootlin.com:email]
X-Rspamd-Queue-Id: 703445762D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wednesday, 31 December 2025 09:22:47 Central European Standard Time Luca Ceresoli wrote:
> Use the correct kdoc syntax for bullet list.
> 
> Fixes kdoc error and warning:
> 
>   Documentation/gpu/drm-kms-helpers:197: ./drivers/gpu/drm/drm_bridge.c:1519: ERROR: Unexpected indentation. [docutils]
>   Documentation/gpu/drm-kms-helpers:197: ./drivers/gpu/drm/drm_bridge.c:1521: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202512302319.1PGGt3CN-lkp@intel.com/
> Fixes: 9da0e06abda8 ("drm/bridge: deprecate of_drm_find_bridge()")
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/drm_bridge.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 6dcf8f6d3ecf..3b165a0d1e77 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -1518,11 +1518,14 @@ EXPORT_SYMBOL(of_drm_find_and_get_bridge);
>   * The bridge returned by this function is not refcounted. This is
>   * dangerous because the bridge might be deallocated even before the caller
>   * has a chance to use it. To use this function you have to do one of:
> + *
>   * - get a reference with drm_bridge_get() as soon as possible to
>   *   minimize the race window, and then drm_bridge_put() when no longer
>   *   using the pointer
> + *
>   * - not call drm_bridge_get() or drm_bridge_put() at all, which used to
>   *   be the correct practice before dynamic bridge lifetime was introduced
> + *
>   * - again, convert to of_drm_find_and_get_bridge(), which is the only safe
>   *   thing to do
>   *
> 
> ---
> base-commit: 40630210211a34f0714fe976530ccf1291e5ef78
> change-id: 20251231-drm-bridge-alloc-getput-drm_of_find_bridge-kdoc-fix-fb00c84c525a
> 
> Best regards,
> 

Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>



