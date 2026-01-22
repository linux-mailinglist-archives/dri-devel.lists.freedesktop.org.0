Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8N57AK/scWk/ZwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 10:23:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A38A0647A9
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 10:23:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D4610E969;
	Thu, 22 Jan 2026 09:23:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="I8ZsRqXy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com
 [209.85.221.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18DA310E969
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 09:23:56 +0000 (UTC)
Received: by mail-wr1-f73.google.com with SMTP id
 ffacd0b85a97d-43591aacca2so523581f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 01:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1769073834; x=1769678634;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=f+tqp471u8S2ObvMZsCZi1wCcRe0pFsBheU96MjEess=;
 b=I8ZsRqXyfdO6WpFOGUFO4345sWBZko5dsgVxG/hrY/tK7we2c1poHdt+GAfHPGlj+L
 DEAn6Y0fPsFJQgIi0y9kkaCKfHTAt5JivN1nkDK4J+6PsZZee3hT4D0fq6VMqeH6Zd1x
 6zLBw4wr7A3zIBGzal7cs06xpV770ZPlpSvqcPn3PLCNjvjEHUg6tuZnw+H30/zpJtLG
 iyRTowbzU/fQ/UvSqp3U+o8ZyrRKmS3BSxq2wYs13uvtToeJnbBYlb0QwqISMG0Fv85s
 pN389MleFum8KstNB6/fbpgEkp+ZszIWoVgmG8TvetGSJKWG0YTCxvb3nhVCVEQwIK6N
 QrKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769073834; x=1769678634;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=f+tqp471u8S2ObvMZsCZi1wCcRe0pFsBheU96MjEess=;
 b=FTpt+LluLsn9N10QwN8A4wYjDLINMK5HCHm7nbKQMXt2vZ8URz1UFm8Z7eE6UejoGv
 ocj0pkUGq3XXO6gkKcf7MaPYYNrUmOjh46hxEro7iyNaWFSafOuf47Ga8B8xmCd762pB
 lcrsHSXje2E0Klty1jkxILxqvbyHu+QwyUo4Ds2Wn9YUCO8GFlhI3Q95S67TlNcZa7cc
 T9SmcoLtGNPsxsMaw1Oomh12G1OefhKVmXzUua+J009o1WeQPuixl/3rCTOPahfwcCBX
 NIuN41u48YsP+xbevUMSZ2VrKmCzetXwa5laFRGygcVUbv9vLjzO2MRXI6E01IfCOPBo
 3WUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTnS2tIQmgnpH8VEJFJkXHHUADnNsAlczYR9BbxDo94gT3jKyHhypw1/2RljiPGW98QxoZYZWRv24=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFy1joA4TsWScFwUKXzsFbo9iQA9Bf0tTpINbnv86zOglDka21
 JNddBFBGQ7q1C4qdHcisHNmimfxv+z9xpJYRht4jEFwOK2sYytrb3HM2mBx8KCnnB1sGeCrd9Eb
 Lv4eCczC/wi+Q7kBE8g==
X-Received: from wmbh2.prod.google.com ([2002:a05:600c:a102:b0:47a:7874:d5d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6814:b0:477:5b0a:e616 with SMTP id
 5b1f17b1804b1-4803e78fdd9mr135016735e9.5.1769073834677; 
 Thu, 22 Jan 2026 01:23:54 -0800 (PST)
Date: Thu, 22 Jan 2026 09:23:53 +0000
In-Reply-To: <52A861BB-9CA1-4F16-AFF5-E3AA96B5833D@collabora.com>
Mime-Version: 1.0
References: <20260121-gpuvm-rust-v3-0-dd95c04aec35@google.com>
 <20260121-gpuvm-rust-v3-1-dd95c04aec35@google.com>
 <52A861BB-9CA1-4F16-AFF5-E3AA96B5833D@collabora.com>
Message-ID: <aXHsqXC-dZhrD2VA@google.com>
Subject: Re: [PATCH v3 1/6] rust: drm: add base GPUVM immediate mode
 abstraction
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
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[google.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[dri-devel,kernel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A38A0647A9
X-Rspamd-Action: no action

On Wed, Jan 21, 2026 at 02:04:33PM -0300, Daniel Almeida wrote:
> Hi Alice,
>=20
> > On 21 Jan 2026, at 08:31, Alice Ryhl <aliceryhl@google.com> wrote:
> > +/// The manager for a GPUVM.
> > +pub trait DriverGpuVm: Sized {
> > +    /// Parent `Driver` for this object.
> > +    type Driver: drm::Driver;
> > +
> > +    /// The kind of GEM object stored in this GPUVM.
> > +    type Object: IntoGEMObject;
>=20
> Hmm, can=E2=80=99t we derive that from Driver::AllocOps? More specificall=
y, shouldn=E2=80=99t we enforce it?

Hrm, we may wish to require that Self::Object =3D=3D Self::Driver::Object.

Not sure what you mean by AllocOps.

Alice
