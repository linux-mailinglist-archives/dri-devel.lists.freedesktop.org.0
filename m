Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LcPEh2ipmmvSAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 09:55:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6501EB543
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 09:55:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D43E10E6DA;
	Tue,  3 Mar 2026 08:55:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="vRDFNObs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B76B610E6DA
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 08:55:54 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-48378df3469so36681655e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 00:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1772528153; x=1773132953;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=z8CDLoKCw34ZLU+LNrqcbumI5p0ih3NynECG7cUf21k=;
 b=vRDFNObsW6w0lY9gNf2NgFED2yBI2BBVJkcBR/AGEfO6knxkKU0RskAdU17B0c7i3W
 yA4uiR2NdMF9qGErvHDf7gpEXHz+dZwDwgpIY6bSHR5HUGzfgECVqfkbX2SIyPKYz62H
 xSU0WOSLbHqkQhBg8rXzUyA489UBVGMxUZF2saeiLTNERcHn2tonNDPKITsyIfl9ePDm
 2yYhor8tVD3u6w6kUJHZHjPewGMLTIeP4Pz6IBedGi3GSf9g5/CNPiQw548Mw5X2o1m7
 zHBsnT8OFkTYNkaFPqiYpBL8azxrvqZmYBWrX4r2KqKRHIE0DbmySc85mlkP+EzyBnIU
 oBpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772528153; x=1773132953;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z8CDLoKCw34ZLU+LNrqcbumI5p0ih3NynECG7cUf21k=;
 b=mp/RPCaAFg8B76l5yUbBoy7uO6RvCKSe6lNDPG40AgTzq79T+GQxLcfW/3pm/1wQ7Y
 9QHU7NoEiThyJ7c9/JF6OEGdyuYzGg/gaissDy0ezs+7S9/GgdYWz6IzMWgUq0ChKm55
 hiOrkn4o7dJZKBRDngxbMJQ5rOSaHMT81RF1HmTNrQOlyaMQXaMf3d/ytpEnlrMy2sAA
 /LXnl6lDBnepQyvORD6NB1tRIdQ3vOEa34dC6u5WTqq+dEo8RFca+x3ks9a7ILdiF41I
 vfQ2SMJFewu0cgfKYuRDoxj36YkXUZ+QgayVTw1uHcwpi0sP+0MTEUI1p599nuceX6cX
 Acsw==
X-Gm-Message-State: AOJu0YyJqRjPBmMGVh7rGaXwDk3dHs+JQeK5OhEDdpldpg1YaQOA7ybK
 Ki7beCjASlkD6vYc8wwkiuciIuoNq+Cn+a695zNlDYDe3IUzkRqs9jEwAyJ7F+OM/ga0DBgfKvP
 1l1P0JQstKsgmxj48QA==
X-Received: from wmsl28.prod.google.com ([2002:a05:600c:1d1c:b0:480:6a92:ae1])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:35c3:b0:47e:e2b8:66e6 with SMTP id
 5b1f17b1804b1-48513c752cbmr24398945e9.14.1772528152926; 
 Tue, 03 Mar 2026 00:55:52 -0800 (PST)
Date: Tue, 3 Mar 2026 08:55:52 +0000
In-Reply-To: <20260302202331.176140-1-deborah.brouwer@collabora.com>
Mime-Version: 1.0
References: <20260302202331.176140-1-deborah.brouwer@collabora.com>
Message-ID: <aaaiGK_7UpW6uCU5@google.com>
Subject: Re: [PATCH] drm/tyr: Use DRM device type alias across driver
From: Alice Ryhl <aliceryhl@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 daniel.almeida@collabora.com, boris.brezillon@collabora.com
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
X-Rspamd-Queue-Id: DB6501EB543
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:deborah.brouwer@collabora.com,m:rust-for-linux@vger.kernel.org,m:daniel.almeida@collabora.com,m:boris.brezillon@collabora.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 12:23:31PM -0800, Deborah Brouwer wrote:
> Currently Tyr defines a convenience type alias for its DRM device type,
> `TyrDrmDevice` but it does not use the alias outside of `tyr/driver.rs`.
> 
> Replace `drm::Device<TyrDrmDriver>` with the alias `TyrDrmDevice` across
> the driver.
> 
> This change will ease future upstream Tyr development by reducing the
> diffs when multiple series are touching these files.
> 
> No functional changes are intended.
> 
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
