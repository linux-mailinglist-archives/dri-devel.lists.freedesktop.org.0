Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6go7Foc7omlq1AQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 01:49:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B711BF7E0
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 01:49:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C5BE10E1B8;
	Sat, 28 Feb 2026 00:49:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="WuOvKKMW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4A5E10E1B8
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 00:49:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1772239742; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=NZaSol3izM0mjUrkVVXBHvp95Lcwk5ONsrpGgkXCWsKERlQmO24HEOGYWgu4FqA3Ct54B9F6reVHKAsTnVAXtMOFfPNwDXp47W2sX3ee9DeG0RBQmWVLb8MeF4YbfqtrXxSAGWXnPxaeCv/dPuCoH75MReFd7xUmClihughrK2A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1772239742;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=EiDl6VYnKl3cFV7YarGwA9z7PR8IXhTiAnufRDCUnfQ=; 
 b=MZKWSsrAMiLlv98tcsPtxWdn4dGXxyhNIpwTQJlmgxjbXTvlIU4Ji9MLSPMYFyhym4T/VkdHUDdBfLH59W5NKz/jEPUvgQdL9lEJGStdXnCOezx0bqYpIVR1RCa43m52rWMlboNhc6dDjcOggeQcU0Bi/LFbmFCGgAkAF8Y9izM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
 dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772239742; 
 s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com; 
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=EiDl6VYnKl3cFV7YarGwA9z7PR8IXhTiAnufRDCUnfQ=;
 b=WuOvKKMWO/VzcLyYqOAwmdvKwvpNTx/J6CPKF8O7OGIjRefjLutwSUKg9jUbOOXm
 BYNG42h22sK5AguAD9EJyxerQStcBkiHYFNQpwS+3mYrc+/KIlnOA1X0SnRJegkHlXS
 n4j1bOCGl2j+16UehUzEWHxcSjw/fwEAnzNIfVsE=
Received: by mx.zohomail.com with SMTPS id 1772239741142450.10358025467235;
 Fri, 27 Feb 2026 16:49:01 -0800 (PST)
Date: Fri, 27 Feb 2026 16:49:00 -0800
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 daniel.almeida@collabora.com, boris.brezillon@collabora.com,
 beata.michalska@arm.com, lyude@redhat.com
Subject: Re: [PATCH 08/12] drm/tyr: add MMU module
Message-ID: <aaI7fDOtPdrbBD9v@um790>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
 <20260212013713.304343-9-deborah.brouwer@collabora.com>
 <aZmU8QUpu_gL9JDr@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZmU8QUpu_gL9JDr@google.com>
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
X-Spamd-Result: default: False [-1.81 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:aliceryhl@google.com,m:rust-for-linux@vger.kernel.org,m:daniel.almeida@collabora.com,m:boris.brezillon@collabora.com,m:beata.michalska@arm.com,m:lyude@redhat.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[deborah.brouwer@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deborah.brouwer@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: B3B711BF7E0
X-Rspamd-Action: no action

On Sat, Feb 21, 2026 at 11:20:17AM +0000, Alice Ryhl wrote:
> On Wed, Feb 11, 2026 at 05:37:09PM -0800, Deborah Brouwer wrote:
> > From: Boris Brezillon <boris.brezillon@collabora.com>
> > 
> > Add a Memory Management Unit (MMU) driver for Tyr. The MMU wraps a
> > SlotManager for allocating hardware address space slots. The underlying
> > AddressSpaceManager performs MMU operations including enabling/disabling
> > address spaces, flushing page tables, and locking regions for page table
> > updates.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Co-developed-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> > Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> 
> > +/// Any resource/information that will be used by the AddressSpaceManager
> > +/// to make a VM active is present in VmAsData.
> > +///
> > +/// On activation, we will pass an Arc<VmAsData> that will be stored in
> > +/// the slot to make sure the page table and the underlying resources
> > +/// (pages) used by the AS slot won't go away while the MMU points to
> > +/// those.
> > +pub(crate) struct VmAsData {
> > +    /// Tracks this VM's binding to a hardware address space slot.
> > +    as_seat: LockedBy<Seat, AsSlotManager>,
> > +    /// Hardware configuration for this address space.
> > +    as_config: AddressSpaceConfig,
> > +    /// Page table (managed by devres).
> > +    pub(crate) page_table: Pin<KBox<Devres<IoPageTable<ARM64LPAES1>>>>,
> 
> I don't think the Box is needed if you #[pin] this field.

Ok, for v2, I moved the page table initialization from struct Vm to struct VmAsData
in the address_space.rs which allows us to construct it in place and #[pin] it.

> 
> Alice
