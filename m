Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJYqBTm/pWknFgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 17:47:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D4A1DD320
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 17:47:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8877310E563;
	Mon,  2 Mar 2026 16:47:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Hb4a+yWl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A73BD10E563
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 16:47:49 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-4832c4621c2so51444665e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 08:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1772470068; x=1773074868;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=yaWqpVdlDV9VaHjIoyw0LdeLAZaCz/qIWYw9AXU/0oM=;
 b=Hb4a+yWl13c3VnrpFOsOCA8HCZ27xTbuNNzmA98aYUMfU/BimDNk8wjK1vQusmp0TO
 CxjasGT7N7q8vIs84M7S8PxbTEz6f3MzA1OyjIeypu8zgg7wLvnN/VMH5vqKwEigwSax
 x3BxWBUl+2LAOt5/AEMGHR5UWblgmgpAfPAE0sSs8Rbc6+CayzU1yEty7z96ua/DD69E
 M1NZDr20W1GDoy+0PcwCzD+ZIvgd2uVMzI9JOEKeupj5ZlZb4tI/x2EdfNNoier+VL0P
 +EnklbaKQ/kGGbQCM53ufe9rveYLlDbQGNLcQDmurHNqTy3XHUXbmBtU2kCh52GGyB01
 eCLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772470068; x=1773074868;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yaWqpVdlDV9VaHjIoyw0LdeLAZaCz/qIWYw9AXU/0oM=;
 b=TcOmr2cwAUWvkzdh4szsHrtZjREL1BEa9sQNv6cZFwzOCmEJVzd/OWTZWlx19gzDyu
 Fj5dcmn4e6C94SNYymjKxDrnEvf+AsZEPynaiWRgF1Mi+gK4/AxGtpWh50JSHEI8vwRs
 +DjfRHM195nu/F0ljOX5ipQ5qeau6Cx+P1SbSfNQUvi++gdCTs6x/CdPs098+hQZr6D4
 QJ0HP29DNBTZmUApx5VQ3RmbyqdrmAtQaYTfttZOaOZ6co60cOh3HvbdKLuGcTS97hMq
 qWK4UoJzfsbOpVz7J+Z/1JXYjj1A9IKbAlnlK+FKFkgcIL/PapS9XeOtF9kF2iQYVblo
 MeQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXG6Qrhp/1zN7XDA6Si2XdzqR8Rtr0V6enYvXwxWhFoxb7wHLvYZIYDfNe/gj9LKzb5XfchY9zWxfU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7rDl11Ap4JFGsY2501ikWvOIbBbYS95KDDm4tAKMBK+SlsrwH
 ig+ZlUvoEOvfoteoA5vEkx6RneJfZPfg3soHUfSYd15JljK5xVbWcteAXQNzWDRehbtsEsB8ls0
 o61gQ81hu/0yf38ljDQ==
X-Received: from wrra18.prod.google.com ([2002:adf:fb92:0:b0:439:b77a:b852])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1f83:b0:483:8062:b43 with SMTP id
 5b1f17b1804b1-483c9c031e6mr262504225e9.19.1772470068114; 
 Mon, 02 Mar 2026 08:47:48 -0800 (PST)
Date: Mon, 2 Mar 2026 16:47:47 +0000
In-Reply-To: <20260204-aref-workitem-v2-0-bec25b012d2a@collabora.com>
Mime-Version: 1.0
References: <20260204-aref-workitem-v2-0-bec25b012d2a@collabora.com>
Message-ID: <aaW_M_h8vAUpUyQG@google.com>
Subject: Re: [PATCH v2 0/4] rust: Add ARef support for work items
From: Alice Ryhl <aliceryhl@google.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 "=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
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
X-Rspamd-Queue-Id: 74D4A1DD320
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:daniel.almeida@collabora.com,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:tj@kernel.org,m:jiangshanlai@gmail.com,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,umich.edu,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 05:40:38PM -0300, Daniel Almeida wrote:
> This series adds ARef<T> support for both regular and delayed work items. 
> 
> - Patches 1 and 3 actually implement the support in workqueue.rs
> - Patches 2 and 4 adds a corresponding implementation in drm::Device that
>   dispatches the calls to the underlying T::Data.
> 
> This was tested on Tyr, and is actually needed in order to obtain a
> &drm::Device when handling work items. This is then needed in order to
> allocate GEM objects inside the work handler that processes the tiler OOM
> (out of memory) events. The current series sets the stage so that the above
> is possible in the future.
> 
> This is currently based on v6.19-rc8. I hope we can land all four commits
> on a single tree, but otherwise let me know whether I should split the
> workqueue.rs changes from the drm::Device ones and rebase accordingly.

I noticed my Reviewed-by from v1 was dropped, so here it is again:

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
