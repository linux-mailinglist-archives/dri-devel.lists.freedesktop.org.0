Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKHrFkp2mWmmUAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 10:09:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D351716C790
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 10:09:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D79110E0B0;
	Sat, 21 Feb 2026 09:09:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="udegqlaM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A609510E0B0
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Feb 2026 09:09:25 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-4836cf00787so36494115e9.1
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Feb 2026 01:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1771664964; x=1772269764;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=tjL3co8gOybFESLAf7giPjhwsqQeHlhhnyGU8ZVONRI=;
 b=udegqlaMNG/N4vZGhgyvES096Pk94kaF32iXW3VIZvEVNmrwuR1cYo2OO+0zp1M0X0
 t5ewq3oF8pNsnZleduIbqkHrHKkx2nMnOm11FtD9GgerYdLyy/nOGs7rAEUr5vKuUrZM
 DsHJbBLRr7WfDsXIEr2m8uGE/Z8ADirciyTEKyi5P6RSNrrPsgOY6JiNSQk2JLf05L+D
 ibzp1vFF3AEIOuHA3OdxyGs1aLBDohk6tX5afGCGGFWJtkF9F5Gs66OF8W+tMATNHgf1
 xEPHWnmmo3IxbLLg+/6UfDXM8GrEdF7YXrWyGDpIeP4QQtxGO1pbbz8e7JtRHTSrRYmx
 V9zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771664964; x=1772269764;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tjL3co8gOybFESLAf7giPjhwsqQeHlhhnyGU8ZVONRI=;
 b=wC99SGTvO4c8LDnIOp12sLCnG6oVfZO3u4hWCgLIUdp/T57yswdTbgXNOWr2l4gMdQ
 vGgACYCIXjZo9Upw1YZWeRCnFp3llE5wXVO3idmnVE5MDeBupO3pgx3FhcO1gi6vfXjK
 FcevNOPTVDcuCTw7nunV5nlxOSa2wMLAToqhf0sVvysCm80I4b4ostZ0EZ57yxtjIS/G
 vz5QoiU3NfMHfSJCu5ZnYi2+ch9P8leaTQUf0CHNCgvzcwBlbTTdfXIgw/7gEI4Uoqle
 zk8gvHVfA1jBd1TGUz0J1lml9h5XL6VHi8MJCpRjFEc21z/PNA1Ieg3JWvZqSQNQYSOD
 hq/A==
X-Gm-Message-State: AOJu0YwNS32VY2HK8h/n4uY/yAz5XKpO0lFEwYR2RzqRgCLmmPvys36c
 6BghoRYsEiej6RzDM66bXv9diAFjgpSCASab6AlJZfvYlEGLzgfA1ei37Ck9A/gWWb4x2Joq48P
 l7QecjGztmvavZEpk3A==
X-Received: from wmpz1.prod.google.com ([2002:a05:600c:a01:b0:483:8b61:16bd])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:358c:b0:47e:e59c:67c5 with SMTP id
 5b1f17b1804b1-483a94a0b4fmr44283405e9.8.1771664964168; 
 Sat, 21 Feb 2026 01:09:24 -0800 (PST)
Date: Sat, 21 Feb 2026 09:09:23 +0000
In-Reply-To: <20260212013713.304343-6-deborah.brouwer@collabora.com>
Mime-Version: 1.0
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
 <20260212013713.304343-6-deborah.brouwer@collabora.com>
Message-ID: <aZl2Qzl4knlY19Hb@google.com>
Subject: Re: [PATCH 05/12] drm/tyr: add MMU address space registers
From: Alice Ryhl <aliceryhl@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 daniel.almeida@collabora.com, boris.brezillon@collabora.com, 
 beata.michalska@arm.com, lyude@redhat.com
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
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:deborah.brouwer@collabora.com,m:rust-for-linux@vger.kernel.org,m:daniel.almeida@collabora.com,m:boris.brezillon@collabora.com,m:beata.michalska@arm.com,m:lyude@redhat.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[google.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: D351716C790
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 05:37:06PM -0800, Deborah Brouwer wrote:
> From: Boris Brezillon <boris.brezillon@collabora.com>
> 
> Add register definitions and constants for managing MMU address space,
> including:
>   - Address space translation configuration (page table format, attributes)
>   - Memory attributes (cacheability, shareability)
>   - Address space commands (update, lock, flush)
>   - AsRegister helper for per-AS register access
> 
> These will be used by the MMU/VM manager to configure page tables and
> control address space operations.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Co-developed-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

> +/// Maximum number of hardware address space slots.
> +/// The actual number of slots available is usually much lower.
> +pub(crate) const MAX_AS_REGISTERS: usize = 32;

Not necessarily a problem, but this constant is not present in Panthor's
header file.

Alice
