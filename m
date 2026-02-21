Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QEcRA/iUmWnzVAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 12:20:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8991416CC09
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 12:20:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D68DD10E06F;
	Sat, 21 Feb 2026 11:20:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ZUgBxCPg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAE9210E06F
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Feb 2026 11:20:19 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-4836bf1a920so33389305e9.3
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Feb 2026 03:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1771672818; x=1772277618;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=BHG+anh2NPJoM/5HPN4gxSqeakHjDTk4rshPOUldzpc=;
 b=ZUgBxCPgdBNfYZtb32lwCtai7TdgAloJNe3h/V0OUEDhHRbu45K3Db218+JCw0A+JN
 YYAUVG2XkY6mi+XD56bq18H8cJXUYgVEqTJhry03iIDKiwZZgWh1eC00Caqm6xY2qjqW
 uMF1ZH+qsMkXHyuUMX77sakSeiMvOPABuSNQCa/yfde1txLPcJwGTsoc8PjFnIdKRAAH
 8IThV1KltKQrU3KanyieX/8wdgvPJ1ZEpF63XOxkUN0DinuTW+CI2mlaHjvSa/EN0rsq
 r4tIyli/YmxUC0NMpRqiuTlmEPDGDMSL8cmQnpDXDWk3VQiPXrA8NQbbRTWQTgmROnpW
 WI5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771672818; x=1772277618;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BHG+anh2NPJoM/5HPN4gxSqeakHjDTk4rshPOUldzpc=;
 b=fyZlwPinUbjJ/xaesnyoVxYoeES+pmscAyEz/CJE4tt0IkYv5plUxwYaYkgK640Xb1
 xW/4zcA0SXR5huNGLSkDK4fyC6WcgVY+X0ZfxrdCyCeJbl0TCiyQThlJJZnE5g4Yqt/U
 kOgEFd1Qavr9S9UAVi14jaXj2BH9vcn0tA8ZrVJ67tJurX9dCdc3lE1q5Mn6mDmfQQA3
 FxDoT5uBO2/h7Dfo76OzAx17ALZ2baLDwSlta74Nk0Sr0fnJGvkdX/dq/wKiaTclg6En
 /6k2gZcSedkMJ4/mx4ayGunkgynYp0aIt0qQ9l004+OQ8NAOWO1e7/yg8UqF9VQoItnx
 uqlA==
X-Gm-Message-State: AOJu0YyR19HFmHUQhBYe9aZ5MR8pBKsN+uqfesWwUXK+DfsfUfCFXB1G
 A2Rjyf1nl1sfeS2R/FEc3JQ6cepzg61Wq8QOYPNAZSe7TRoj9r6zYptAPvZNmtw7rZSoYJA3dki
 kBB+2ud7ekhucDborRA==
X-Received: from wmby20.prod.google.com ([2002:a05:600c:c054:b0:483:7890:570f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6986:b0:483:703e:4ad9 with SMTP id
 5b1f17b1804b1-483a962e00emr36391475e9.19.1771672818245; 
 Sat, 21 Feb 2026 03:20:18 -0800 (PST)
Date: Sat, 21 Feb 2026 11:20:17 +0000
In-Reply-To: <20260212013713.304343-9-deborah.brouwer@collabora.com>
Mime-Version: 1.0
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
 <20260212013713.304343-9-deborah.brouwer@collabora.com>
Message-ID: <aZmU8QUpu_gL9JDr@google.com>
Subject: Re: [PATCH 08/12] drm/tyr: add MMU module
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
X-Rspamd-Queue-Id: 8991416CC09
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 05:37:09PM -0800, Deborah Brouwer wrote:
> From: Boris Brezillon <boris.brezillon@collabora.com>
> 
> Add a Memory Management Unit (MMU) driver for Tyr. The MMU wraps a
> SlotManager for allocating hardware address space slots. The underlying
> AddressSpaceManager performs MMU operations including enabling/disabling
> address spaces, flushing page tables, and locking regions for page table
> updates.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Co-developed-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

> +/// Any resource/information that will be used by the AddressSpaceManager
> +/// to make a VM active is present in VmAsData.
> +///
> +/// On activation, we will pass an Arc<VmAsData> that will be stored in
> +/// the slot to make sure the page table and the underlying resources
> +/// (pages) used by the AS slot won't go away while the MMU points to
> +/// those.
> +pub(crate) struct VmAsData {
> +    /// Tracks this VM's binding to a hardware address space slot.
> +    as_seat: LockedBy<Seat, AsSlotManager>,
> +    /// Hardware configuration for this address space.
> +    as_config: AddressSpaceConfig,
> +    /// Page table (managed by devres).
> +    pub(crate) page_table: Pin<KBox<Devres<IoPageTable<ARM64LPAES1>>>>,

I don't think the Box is needed if you #[pin] this field.

Alice
