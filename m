Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCsqEBSWmWkKVQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 12:25:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEEB16CC2B
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 12:25:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9338410E03F;
	Sat, 21 Feb 2026 11:25:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="aDnA8IWe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com
 [209.85.221.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69D7D10E03F
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Feb 2026 11:25:03 +0000 (UTC)
Received: by mail-wr1-f74.google.com with SMTP id
 ffacd0b85a97d-435a2de6ec0so1886628f8f.0
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Feb 2026 03:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1771673102; x=1772277902;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=f8YL6PU9vF9SwHv8rkTr1QPaGp/GGsGjVuq4QPNTros=;
 b=aDnA8IWeHE6qJR0XCqjyNNSr8VhsAKkRjbLPaHB5sTLmRJDn3bi94WvuxatiGGKrVT
 31yqypTl4+niYst59EG38BPim8aKmKbtMAbFxTfrzBwPexKZ86Nw9lLEeltXrCcuF0Dx
 CzxIpLQs8AmIufMWv9dNqcxjaFv9CYeTuQUeMVyTTL1dHPLQFHcbJzinxjSiWTquH50y
 2ruS3beTWrVROITgf8nKd2iOB1bh0qSt4bnEFcTgRCMy4kzPD2bRW+YCfO3Op69k1t2V
 Zau7crPVRP6xpKZ30KNreX81iY2VMg1SCC0eHdBnypDOgej8GJk8MPlvPU1Zujgoqe16
 868A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771673102; x=1772277902;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f8YL6PU9vF9SwHv8rkTr1QPaGp/GGsGjVuq4QPNTros=;
 b=nSnlyTyUhBdAJYe8eJ7/Yot+all9FPnNhBTKWSC+ukhKVpVG6fufHqvkvyI/cUIiCc
 Hu2FOYHy1V0lK4TWmwyw+FswFGXOKd4J/X8HV/EhHC8qmEnLGjX968UviSkgGlOWzqnN
 aCbNNPM9kpNllX2yXfWH5rX/StORAt+TQMzQ/iGhFdmah7qn9jwmi6DgkCH3AhtPBS34
 xhC0s3TN/1J0rnUll7ZUAfpE8AB+iGBUgqaCyGkRUAl3tzLplyyVH6mt/OKiDUN3zO+U
 1dR7MVt6pE+LXOtDuhjnxFNzz48+KC3GRgtLcAxL9OV/Tcs3beZL2krD5lcet2UOCWns
 P7yQ==
X-Gm-Message-State: AOJu0YxzdVMFyQzeKs+oWZs1oXBvQSCZNQlcJxcIsarhfVDvdP/02mAC
 KT7+Wy2t8FLWJwN8lImYknKtdfCQDTnE6sczNHDrk1Uu5jwHCV03SPsn2eejhrctmejNaC4zelF
 klj22DTni0eEOET7BaQ==
X-Received: from wrs11.prod.google.com ([2002:a05:6000:64b:b0:437:812c:3178])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:26c2:b0:435:a8e7:62de with SMTP id
 ffacd0b85a97d-4396f18f942mr4497791f8f.58.1771673101699; 
 Sat, 21 Feb 2026 03:25:01 -0800 (PST)
Date: Sat, 21 Feb 2026 11:25:00 +0000
In-Reply-To: <20260212013713.304343-13-deborah.brouwer@collabora.com>
Mime-Version: 1.0
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
 <20260212013713.304343-13-deborah.brouwer@collabora.com>
Message-ID: <aZmWDIITgaEGkTU0@google.com>
Subject: Re: [PATCH 12/12] drm/tyr: add firmware loading and MCU boot support
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
X-Rspamd-Queue-Id: BBEEB16CC2B
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 05:37:13PM -0800, Deborah Brouwer wrote:
> Add firmware loading and management for the Mali CSF GPU. This introduces
> the fw module that loads the Mali GPU firmware binary, parses it into
> sections, and maps those sections into the MCU VM at the required
> virtual addresses.
> 
> On probe, the firmware is loaded, its sections are mapped and populated,
> the MCU VM is activated, and the MCU is booted.
> 
> Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

> +/// Loaded firmware with sections mapped into MCU VM.
> +pub(crate) struct Firmware {
> +    /// Platform device reference (needed to access the MCU JOB_IRQ registers).
> +    pdev: ARef<platform::Device>,
> +
> +    /// Iomem need to access registers.
> +    iomem: Arc<Devres<IoMem>>,
> +
> +    /// MCU VM.
> +    vm: Arc<Vm>,
> +
> +    /// List of firmware sections.
> +    #[expect(dead_code)]
> +    sections: KVec<KBox<Section>>,

Why the box?

> +            let section_start = parsed.data_range.start as usize;
> +            let section_end = parsed.data_range.end as usize;
> +            let mut data = KVec::new();
> +            data.extend_from_slice(&fw.data()[section_start..section_end], GFP_KERNEL)?;

Could this access be out of bounds?

Alice
