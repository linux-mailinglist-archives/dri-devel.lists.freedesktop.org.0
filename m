Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNsxLL6ZrmmqGgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 10:58:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43378236A78
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 10:58:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 086B310E16F;
	Mon,  9 Mar 2026 09:58:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="pqXPtGY6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com
 [209.85.218.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3409910E16F
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 09:58:17 +0000 (UTC)
Received: by mail-ej1-f73.google.com with SMTP id
 a640c23a62f3a-b90484c398cso1009299166b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2026 02:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1773050296; x=1773655096;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=hHkNiGwy5TmnN/F2tJnTKyH3OPa02KR5v3rz+QeQiXw=;
 b=pqXPtGY6Y3BZNK49ve8ro6LbwHfjejfwqYlqjWHD26V5YdB00W9m2kf8qxXJ8KRUAd
 MFzwq3/Ge1KyaTlcetKc0IITfW8mjWacIc7BRUQA83fW4lCaMyDEKbZk07dH5w/Edccp
 yytdLZ06F9BqxdZB36RxJ26pZxBMubXZ80ZMXXR8yK3kx5+1gcr5OVgYm1ncwctRAHCZ
 buuDtkZcwOzYydu3Mm9RPaF+CQcPkAlZq2JBKyk8qPmQCWTOlhj4T0qGfM/kccSrSFFO
 mrs+U7hl/aMvxTj04CAwVzxpd3AF5lFU1x9XgajjgrdVhqyQFvYw2Ev8mDDgQZBAHzhR
 CMsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773050296; x=1773655096;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hHkNiGwy5TmnN/F2tJnTKyH3OPa02KR5v3rz+QeQiXw=;
 b=StJe3hFc/1cr0kZAwx0hnudxiawPfSGvjnWviJ2REc6HWZ4N7hiGtNyTzErUGc+EY0
 xH9aZ0LqGjRH4HVUH43LyqYc6CFrB8upX84Ikr1cOANOjMtR5DGiiuOZPJhimTOVV6Ib
 odw8M0PBPgDSQzvt3rtv+zawDziTr0p2fKDYAcS5XoqghaJPftGOAq5T8SSUCYVhCfLE
 sXs3OqXS2LgBagK2BvuuMamCkN2Av6RG0zpADZJLI4RxmCiQnd8DATZ12CECnRKITY8b
 2UTz1nO3UBGvb+Pd/oKmYc58WOscy3r2d8q+ODfkXics6v5cWJqSFbx30YnRKbEtHK2m
 93eQ==
X-Gm-Message-State: AOJu0Yy69FKcZ7yTs//3OGFWSHOutxJwQcZF6sU4T69XMgMgU7J5mAdJ
 igcMw5L7Gw3FN4kxv/D4xpPhJ+XPohO2K7Rhh6BLx1OwX8U/vccb5WvOAnhImAJ8cvAy4vWutCe
 AsjbotuOfTkr7Xj2YWQ==
X-Received: from ejcub16.prod.google.com ([2002:a17:907:c810:b0:b94:562:edf7])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:6e8a:b0:b8d:cbb5:c072 with SMTP id
 a640c23a62f3a-b942e05c670mr611198566b.57.1773050295425; 
 Mon, 09 Mar 2026 02:58:15 -0700 (PDT)
Date: Mon, 9 Mar 2026 09:58:14 +0000
In-Reply-To: <20260307204708.60398-1-iprintercanon@gmail.com>
Mime-Version: 1.0
References: <20260307204708.60398-1-iprintercanon@gmail.com>
Message-ID: <aa6Ztn4Sul7Os1nL@google.com>
Subject: Re: [PATCH] drm/tyr: replace fixed sleeps with read_poll_timeout
From: Alice Ryhl <aliceryhl@google.com>
To: Artem Lytkin <iprintercanon@gmail.com>
Cc: dri-devel@lists.freedesktop.org, daniel.almeida@collabora.com, 
 dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch, 
 rust-for-linux@vger.kernel.org, boris.brezillon@collabora.com
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
X-Rspamd-Queue-Id: 43378236A78
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:iprintercanon@gmail.com,m:daniel.almeida@collabora.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rust-for-linux@vger.kernel.org,m:boris.brezillon@collabora.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,collabora.com,kernel.org,gmail.com,ffwll.ch,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[google.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.993];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Cc'ing rust-for-linux list.

On Sat, Mar 07, 2026 at 11:47:08PM +0300, Artem Lytkin wrote:
> The Tyr driver uses fixed 100ms sleeps followed by manual register
> checks in l2_power_on() and issue_soft_reset(). Both functions have
> TODO comments noting that read_poll_timeout() was not yet available
> in Rust.
> 
> read_poll_timeout() has since been implemented in the kernel (at
> rust/kernel/io/poll.rs) and is actively used by other Rust drivers.
> 
> Replace the fixed sleeps with proper read_poll_timeout() calls:
>   - l2_power_on: 100us poll interval, 20ms timeout (matches the C
>     panthor driver)
>   - issue_soft_reset: 1ms poll interval, 100ms timeout (the C driver
>     uses interrupt-driven wait_event_timeout; polling is used here as
>     the Tyr driver does not yet have IRQ support)
> 
> This also changes the error code on timeout from EIO to ETIMEDOUT,
> which better reflects the nature of the failure. No callers in the
> driver inspect the specific error code.
> 
> Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>

I thought we already had a patch fixing these? Did it get lost
somewhere?

Alice
