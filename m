Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJVhMqudjGmPrgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 16:18:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5529E1258E7
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 16:18:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7064610E08D;
	Wed, 11 Feb 2026 15:18:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="JC/3g2QQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18F9310E08D
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 15:18:00 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-4806cd00e02so33125055e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 07:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1770823078; x=1771427878;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=9W3GtrTir/PmxxS+IFBMkqzeIZRkIPIQ7WtYBBgLjyg=;
 b=JC/3g2QQGockdx2w3RuSIF94/4Ev07CvhAiHsuZNMJQA1DWc/lwQZJNq9npCwhxGrt
 bvflslhcQ+uX5rE25uw7HmZzSyKNOoykGABmtULZJLxQ9kRWpBmgP1JcyhQvaEVHEgD/
 znokUaJHnm95LAHtw4+HJ1xc+buAeKidrtCS/W3DNNTgHpMbJ9HeU91GvGbwHMFndSGu
 ynru5YO5jQfJz1vAASizS31aNKtt3VRy+6zRM9XcfNIFP8Yi9uOjddn1dLSVeK18Nhqt
 /wEltnx79YtjyoTyCrqPudZ+i0NyD94LxG7rTE1ccecCvLryo+hivFqnwHg7F5xzD5ST
 oHBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770823078; x=1771427878;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9W3GtrTir/PmxxS+IFBMkqzeIZRkIPIQ7WtYBBgLjyg=;
 b=U5n2HqUKDLYDg4jmOXEZGN4rbOP1GFS7loC2elukrhUJghmQOsOSDymUorWBn9Y7Ef
 kzzakshx5VVpvooFDrzR5yOiwk4iTHx4mBaUJGw5mdWuceuc557w4gmn9igMufBde6jo
 7Ji+3B1uIqdvKDz71txBqO4XdJ/ieBf1xWl1X9ik7kjai1iGBeUfwD+WZFil3n3Jvcvm
 rRljWmNoE+ZgpE/HTswWbsGkPQqGL5l+E93FiIabaijqSy3ePRVRBgqNsAscGiWOXIsS
 K/1yxAfA7e6kfV3HtZbfd87yhNUGiUFfW+B0WL/wfjW7vz97Yzcio/saNwnqzgidWTS4
 /7eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUC5PWjzh/wR3Wms62giiJCofRDiQYv6KV7gp0FsTjkcGmLRzwjuqdDyYUPNagm5LVWCzujYCWv9jk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBIyOlop3thIoWteIVHYamIjOHhK1Dpi3M5U5Lcw8JA9LAfsKr
 JZj7Zvh9oXXUt7qp27QJ5RItxo5rXRsFg9KXEcURxMRc/O2QqYkI5SQr+fEDLpMFIVrvb/rg59G
 0TX5EsYSZae0Zfm2LOA==
X-Received: from wmkz14.prod.google.com ([2002:a7b:c7ce:0:b0:483:2c43:9664])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:444b:b0:47a:8cce:2940 with SMTP id
 5b1f17b1804b1-4835b8d2dd2mr37384535e9.14.1770823078578; 
 Wed, 11 Feb 2026 07:17:58 -0800 (PST)
Date: Wed, 11 Feb 2026 15:17:57 +0000
In-Reply-To: <20260211150738.049af4bb@fedora>
Mime-Version: 1.0
References: <20260203081403.68733-2-phasta@kernel.org>
 <20260203081403.68733-5-phasta@kernel.org>
 <20260210155750.5cdbe6cc@fedora>
 <8ea48ce49f2c7b6fd715dd54c24e755e8ac3262c.camel@mailbox.org>
 <20260211120742.0e9e7122@fedora>
 <f3d2e3b370bed55cc2a95287b3c257f878b5e92b.camel@mailbox.org>
 <aYx0a-2eANbM_vnd@google.com> <DGC6FE14C91M.1BMCS7XHRVP6J@garyguo.net>
 <20260211150738.049af4bb@fedora>
Message-ID: <aYydpYzd4AzFoAvZ@google.com>
Subject: Re: [RFC PATCH 3/4] rust/drm: Add DRM Jobqueue
From: Alice Ryhl <aliceryhl@google.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Gary Guo <gary@garyguo.net>, phasta@kernel.org,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Danilo Krummrich <dakr@kernel.org>,
 Benno Lossin <lossin@kernel.org>, 
 "Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
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
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:gary@garyguo.net,m:phasta@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:dakr@kernel.org,m:lossin@kernel.org,m:christian.koenig@amd.com,m:daniel.almeida@collabora.com,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[garyguo.net,kernel.org,gmail.com,ffwll.ch,amd.com,collabora.com,nvidia.com,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 5529E1258E7
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 03:07:38PM +0100, Boris Brezillon wrote:
> 
> Back to this particular job dependencies use case: we have to embed the
> DmaFence pointer in some wrapper with the ListLinks element anyway,
> because DmaFences can be inserted in multiple of those lists in
> parallel.

Okay, if that's the case, then the linked list is *really* not the right
tool for the job.

Alice
