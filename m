Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ID6EIg4il2lAvAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 15:45:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D45D115FB74
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 15:45:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45EDB10E6F1;
	Thu, 19 Feb 2026 14:45:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="OEN9Jrp9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06CC210E6F1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 14:45:31 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-4836fbfa35cso6335185e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 06:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1771512329; x=1772117129;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=ON/96V1lMwS1dfQQ1ZSvAAeHD+BqqqKIY95pUkvU5Uw=;
 b=OEN9Jrp9xUL0UWBimYqJVSOl+POnOHErUkCeaHuhyhwEIoUTyAmomRCXHxORMMoG8k
 kH8QUCx1Qm5aBjIoqvUMjwH6HCHRD31Vg+uEBSdM+x7wAwPrLDRa3uZ6T5s+NeUqhr+3
 yPL2DNaQDGJP/phW4R93XeO5LqSZL5Tc4QNBIEIKwHtkJ5nn8UByk15zLqgvCTUWEf54
 7IBYvJe+RjkeqP7G4sMjm2Z8H5ExTPWLLfjBOtvNQ/6bvnNdXsF/TKWJTd9soiyNnlTz
 JUazjsIt+0nEMD25+I5SCycNL2bQow/A0irwQYd2pOR9kGYBohLY4hSyM7ZvZa64ElAz
 BtlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771512329; x=1772117129;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ON/96V1lMwS1dfQQ1ZSvAAeHD+BqqqKIY95pUkvU5Uw=;
 b=BMMKVl7HJokFZMZpyQJPc/yKVIypKTQbyAzdZpr9g/bv7ITs7I4GtaYUWEoLfPzT1x
 knba4OSFc/z8tlGGV6K6jdOZdjnnlFIxHL1RwBGJEIgmcchDvbYPhsgI184Yzf9d78+O
 Mvq1a01ChYSn4PSfiL3oOLTqvDiCMyj4Pril0YH3wv94DQ6zBltTuDGOCPv0Ry6RdI9V
 LuRCLw8TU2TZtwG/Mp0lo6RSY48RH+B4OwbaqzI9OZWO8fehDvIiZVPamEdV0Lrf9ypW
 idfnGUN85Z9x/5LCAOOyE0fzaLc4tYMQMJyO2L0E6wcx5BWpSg3iALS+KUYRXweARIBZ
 AaaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVglzUB+K3ZcAsQL+dAZdPfNsr5rRTQG8aGyZJraQvj4n3smJZk6MoIBSfFNJigjrrS3IL5HwRU3EQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJc6Ur20JP17VYSadJ7W7ymD93C/ETMyaM0C33t2wbfrZrlJ9m
 AHvCowi0aPkMnXwC2tO4L5AxN9dgrS4+at53a3ZxkMw9zwd5TCxk76KUmMNTiUSBAvSjId0Sik4
 fYOflmMIu4/EyNNP1Zw==
X-Received: from wmdp17.prod.google.com ([2002:a05:600c:5d1:b0:483:291c:7f23])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:8443:10b0:482:df17:bbbc with SMTP id
 5b1f17b1804b1-4839e661d4bmr37096335e9.20.1771512329237; 
 Thu, 19 Feb 2026 06:45:29 -0800 (PST)
Date: Thu, 19 Feb 2026 14:45:28 +0000
In-Reply-To: <DGJ0LNG3KO1N.35V3YXBLS6IT1@kernel.org>
Mime-Version: 1.0
References: <20260130-gpuvm-rust-v4-0-8364d104ff40@google.com>
 <20260130-gpuvm-rust-v4-2-8364d104ff40@google.com>
 <DGJ0LNG3KO1N.35V3YXBLS6IT1@kernel.org>
Message-ID: <aZciCO2yZx1pIqsD@google.com>
Subject: Re: [PATCH v4 2/6] rust: helpers: Add bindings/wrappers for
 dma_resv_lock
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 "Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, Janne Grunau <j@jannau.net>, 
 Matthew Brost <matthew.brost@intel.com>, 
 "Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, 
 Asahi Lina <lina+kernel@asahilina.net>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:daniel.almeida@collabora.com,m:boris.brezillon@collabora.com,m:j@jannau.net,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:lyude@redhat.com,m:lina+kernel@asahilina.net,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:lina@asahilina.net,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
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
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,kernel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[asahilina.net:email,rust-for-linux.com:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:email,jannau.net:email]
X-Rspamd-Queue-Id: D45D115FB74
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 03:40:20PM +0100, Danilo Krummrich wrote:
> On Fri Jan 30, 2026 at 3:24 PM CET, Alice Ryhl wrote:
> > From: Asahi Lina <lina+kernel@asahilina.net>
> >
> > This is just for basic usage in the DRM shmem abstractions for implied
> > locking, not intended as a full DMA Reservation abstraction yet.
> >
> > Signed-off-by: Asahi Lina <lina+kernel@asahilina.net>
> > Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > Reviewed-by: Janne Grunau <j@jannau.net>
> > Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> > Taken from:
> > https://lore.kernel.org/all/20251202220924.520644-3-lyude@redhat.com/
> > with __rust_helper added.
> > ---
> >  MAINTAINERS                     |  1 +
> >  rust/bindings/bindings_helper.h |  1 +
> >  rust/helpers/dma-resv.c         | 14 ++++++++++++++
> >  rust/helpers/helpers.c          |  1 +
> >  4 files changed, 17 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 618becae72985b9dfdca8469ee48d4752fd0ca41..8d44728261ffa82fc36fa0c5df3b11a5bfb4339b 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -7467,6 +7467,7 @@ L:	rust-for-linux@vger.kernel.org
> >  S:	Supported
> >  W:	https://rust-for-linux.com
> >  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git
> > +F:	rust/helpers/dma-resv.c
> >  F:	rust/helpers/dma.c
> >  F:	rust/helpers/scatterlist.c
> >  F:	rust/kernel/dma.rs
> 
> That's fine for me in general, but maybe the DMA BUFFER SHARING FRAMEWORK is
> probably the correct place. DMA BUFFER SHARING FRAMEWORK is also under the DRM
> umbrella, so we should also add it to the drm-rust entry as well.

Sumit, Christian, are you ok with listing this under DMA BUFFER SHARING
FRAMEWORK?

Alice
