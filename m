Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SH0UJoJWnWk2OgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 08:42:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BD31832E8
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 08:42:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 910C910E4CF;
	Tue, 24 Feb 2026 07:42:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="kXjAE4nK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D87BD10E4CF
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 07:42:55 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-4836ff58111so63101885e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 23:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1771918974; x=1772523774;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=KLgeAhL36wm8UIjzvmBP2LJKULVjcpqcgzoTxIUEDHQ=;
 b=kXjAE4nKVvePz8WiVOJaVrCWjFFuZ6Yr5MVwhMpmwfwkT7NSOjybHvG/dSv+C4Rijf
 VetrbJ02rB3mxCC/R8liEtahWo0z1uVUbmJcNrEi4gKcbjZi64ozGBQr/dtnquCOTH/c
 UHYBldFw1UbZ6sbJiP4s2ked8qpDNDKATdmZlLdri/nKN56mAY0+Ei8ahUNLkhAzwxUL
 V15PXQcdskQGMOs1ZxSxeZkdLfJ5feYIZBsv303HcYPKerCONLySn8DC9t+SexzdAr9D
 ieeTgAA9bv8m1vh1sdvIlhgUsGleJ7AogoyiE8VgaWZMFplFhRvFg/tuXkWDRPylTR8E
 crhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771918974; x=1772523774;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KLgeAhL36wm8UIjzvmBP2LJKULVjcpqcgzoTxIUEDHQ=;
 b=DO+BdymwqPc8FIxlxCyxYPRPYk+T6QPPjaBRPlz7mu/P4ZJpKgRoD7exLLncrYdWCV
 fFI31BwF8u+oXfZnhrW8C1sGlAVUCfZ+BuldMZlZfN3A6gBIf/WjVLEz2upFSrOHQ9ws
 HbVUamfaOoKYT6KxDMhaX2rQUVAhWIBAokWNJW4I04MFHnv3hu8olyjydO8qJN9pFewa
 H9uZ+D9KEDcazUAeI+Gei0w+DxOANn3PwwxVG8S8iS3OU4uidA5+zn3B2uwfMpoOz1XB
 ZLl1pzW/0XFGvbGmoHblYBYYy7BhYZvo243n6Dn0laeq+i9MDh9vDvpznXtXzOt4r5Ar
 znCA==
X-Gm-Message-State: AOJu0YxH/663mgCkmya6ritjW1nB03/25uD8/QXRkA50iJVXm3iZLdd6
 HdpBrcuoxTas1CZ/o3pJ3mephw0IpbpZaKCKcf4wtwzffq8Du5AH2T7FeDL+poSktO5sDbWQIHS
 rlipGJSQZmi9A7hn5Uw==
X-Received: from wmby2.prod.google.com ([2002:a05:600c:c042:b0:480:4a03:7b7e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e45:b0:477:76bf:e1fb with SMTP id
 5b1f17b1804b1-483a95e957bmr231163855e9.16.1771918974396; 
 Mon, 23 Feb 2026 23:42:54 -0800 (PST)
Date: Tue, 24 Feb 2026 07:42:53 +0000
In-Reply-To: <20260223203833.207955-1-deborah.brouwer@collabora.com>
Mime-Version: 1.0
References: <20260223203833.207955-1-deborah.brouwer@collabora.com>
Message-ID: <aZ1WfUrNVPmf6vsz@google.com>
Subject: Re: [PATCH v2] drm/tyr: Use vertical style for imports
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 31BD31832E8
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 12:38:33PM -0800, Deborah Brouwer wrote:
> Currently Tyr uses rustfmt style for imports, but the kernel uses a
> vertical layout that makes it easier to resolve conflicts and rebase.
> 
> Import guidelines are documented here:
> 	https://docs.kernel.org/rust/coding-guidelines.html#imports
> 
> Change all of Tyr's imports to use the vertical layout. This will
> ease the introduction of additional Tyr patches upstream.
> 
> There should be no functional changes in this patch.
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Applied to drm-rust-next. Thanks!

