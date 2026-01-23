Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNpCA/s9c2kztgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 10:23:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECC27334D
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 10:23:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC17F10E20F;
	Fri, 23 Jan 2026 09:23:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="3u+mSfx5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com
 [209.85.218.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46AA110E20F
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 09:23:03 +0000 (UTC)
Received: by mail-ej1-f73.google.com with SMTP id
 a640c23a62f3a-b83c3dd2092so208436066b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 01:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1769160182; x=1769764982;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=krQTROe4H3NUeXd/bSNRIGoEhdSPybqAT9gUYqiaTP0=;
 b=3u+mSfx5AzQDxd5pE7102FoUkLdPsLBdjPgpFA1FuuIsruWu1ogGrswp+I/hTklhCO
 wJLK77M5HuSAmcaP5CDY6L4DNZIjqd92daoHHLVnzh8KUV8N8I/l6XO1es/37IbkuCJg
 tcN/j61KROUoaBswS31sQjfem2pwVXHF1EvI0Zh3lmBhyjkHJ/H1V5B8rcOYL0kqYvD2
 QUFH5VZCyZ3Qb7Y/VUSfg/bnYvhefHo6dHPNAeC5BjXu5bK/Mav4QDzP4JkT5eHOwoEf
 Y3QyYNW8CbmXxTQifm9rXCBmiB/aIuv/N+aGsbUm1jaeNdpnrXmpt0M5j7HsRhotXPb1
 fMWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769160182; x=1769764982;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=krQTROe4H3NUeXd/bSNRIGoEhdSPybqAT9gUYqiaTP0=;
 b=wK7YA12cnWcMhpYTondc3GmdypdRQwGdeL3Ehy04QjVtlRCCtQjUXsufV5wHke8w1T
 z8VpcJeq9G2u5ziZwVf5bnqhCTlk/YHQM0A3TBo2OrEWr+0OPSfzan91jcjVQ012xVKS
 bCiB0okPhF4N05enm9sl6ywhWendOkmR371AS5S34ivvA+MidtA9K6UG9zo7pMR0XQS2
 zQeCS8HlobQ+GYZpJQZ4FK9PJYR7j0f/UiOCVXxMzlstDRiEkf9ZbfyAIoxZma3pRe/V
 1oCNthwsj/CIte+PACVn12hO4IalaBwCGgDwH+TSef70qAjonbu0jzS7bYH+mpZH607u
 mWeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUkwimlR4aAxCwmT6dEqrSN7AvhZ1siPzK4ij14OAQID7FlGyqkrxG9a1z8FtckvLyf+pD1X2rKI8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLH8WKU4zs9GvCq/NjWYRF3sQXYimi3oDkPa9Y4vqT4rNGMqLo
 ZkZR8CCwJentuSYNvp8vgClaVuJApBf2QaCTTGUKdtpGEFgkwFAPeoSBOU8yGXIb7MGZoi8qYTM
 7HgIUgJtiDYzuz4FQJw==
X-Received: from ejrp15.prod.google.com ([2002:a17:906:6a8f:b0:b88:39f3:89d1])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:1c1b:b0:b87:380f:f576 with SMTP id
 a640c23a62f3a-b88673667bamr47886066b.30.1769160181881; 
 Fri, 23 Jan 2026 01:23:01 -0800 (PST)
Date: Fri, 23 Jan 2026 09:23:00 +0000
In-Reply-To: <180E0324-383E-4813-8CD0-CA15EC3B3EFB@collabora.com>
Mime-Version: 1.0
References: <20260121-gpuvm-rust-v3-0-dd95c04aec35@google.com>
 <20260121-gpuvm-rust-v3-5-dd95c04aec35@google.com>
 <180E0324-383E-4813-8CD0-CA15EC3B3EFB@collabora.com>
Message-ID: <aXM99J8s5ltmZ1hE@google.com>
Subject: Re: [PATCH v3 5/6] rust: gpuvm: add GpuVmCore::sm_unmap()'
From: Alice Ryhl <aliceryhl@google.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Janne Grunau <j@jannau.net>, Matthew Brost <matthew.brost@intel.com>, 
 "Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, 
 Asahi Lina <lina+kernel@asahilina.net>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
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
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:daniel.almeida@collabora.com,m:dakr@kernel.org,m:boris.brezillon@collabora.com,m:j@jannau.net,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:lyude@redhat.com,m:lina+kernel@asahilina.net,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:lina@asahilina.net,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[google.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[dri-devel,kernel];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 6ECC27334D
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 07:43:11PM -0300, Daniel Almeida wrote:
> Hi Alice,
>=20
> > On 21 Jan 2026, at 08:31, Alice Ryhl <aliceryhl@google.com> wrote:
> > +/// Represents an `sm_step_unmap` operation that has not yet been comp=
leted.
> > +pub struct OpUnmap<'op, T: DriverGpuVm> {
> > +    op: &'op bindings::drm_gpuva_op_unmap,
> > +    _invariant: PhantomData<*mut &'op mut T>,
>=20
> Would have been cool to explain why we have a pointer in this PhantomData=
.
>=20
> Same elsewhere, IMHO. Helps with maintainability in the future.
>=20
> (To be honest, I=E2=80=99m not really sure what=E2=80=99s going on here..=
)

Normally, when you have an OpUnmap<'long, T> Rust will let you convert
that into an OpUnmap<'short, T>, but I don't want that in this case.
Making such coercions impossible means that callers of sm_step_unmap()
cannot return the "wrong" OpUnmapped from the closure because the only
way to get an OpUnmapped with the right lifetime is to call remove() on
the OpUnmap you received.

(Otherwise, it may be possible to return an OpUnmapped from one
sm_step_unmap() call in another sm_step_unmap() call.)

There are various different types one can place in PhantomData to have
this effect. A mutable pointer is one choice. I could also have used:

	PhantomData<fn(&'op mut T) -> &'op mut T>

or a few other options.

Alice
