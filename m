Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODqQIDMzommU0wQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 01:13:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EBD1BF5CD
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 01:13:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29A5710E1B4;
	Sat, 28 Feb 2026 00:13:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="VkOMXJUy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBAB010E1B4
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 00:13:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1772237613; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ePtpIOKS+fvW+4dbRXrPfx+FTTMydXioaFIb1XIJz527niLqsk68C2l0f1LOYghHI0DCGcscqP6jHVAamJ5meXPOaKUCPi60+NI4BElG2C/+QdgUgViyppae3PyPgFm3NfNSoGmHzBBJTIFSZ3WZEKUJ/0TPrzuZaEngzGu+RtQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1772237613;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=E+gQjBDjStAtWfy0cvuxuAJ4L7JMYB6VGEv1Esi3zCE=; 
 b=Y193x97AmcjoblC3H3NybhkMoMZ1JNnWwhf11oUpsaFrmTZTFkFt2B0unU8xvkL2sAPIvmgGkzUpZZojd1zz8Cjn/j7rPv3BALoNAZIEtsq2kXkvyVbObFPF9hkvKmsdCe0Z6IYsdEzwPjiSDChMiB+TBf9URqDSlPzxJbRTQlY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
 dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772237613; 
 s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com; 
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=E+gQjBDjStAtWfy0cvuxuAJ4L7JMYB6VGEv1Esi3zCE=;
 b=VkOMXJUykAQSAL3VtOOAUmkdTvwPU4tTdvCesQ0IGw+4XGzQV+mQbjq2S3mT2h37
 8DEA1tECqckjM3ymPzpeuXjl8uCehzh79KnkvypVm4VoNnMIRK+J9+Rsb7wvJii1atc
 HSjhxunhbkgQaFzvet4onBOhAz+0jZiQBAKNvaoc=
Received: by mx.zohomail.com with SMTPS id 1772237612443141.4560156068078;
 Fri, 27 Feb 2026 16:13:32 -0800 (PST)
Date: Fri, 27 Feb 2026 16:13:31 -0800
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Alice Ryhl <aliceryhl@google.com>, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, daniel.almeida@collabora.com,
 beata.michalska@arm.com, lyude@redhat.com
Subject: Re: [PATCH 05/12] drm/tyr: add MMU address space registers
Message-ID: <aaIzKwoc2sz9dZwi@um790>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
 <20260212013713.304343-6-deborah.brouwer@collabora.com>
 <aZl2Qzl4knlY19Hb@google.com> <20260222191318.0ddf8eee@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260222191318.0ddf8eee@fedora>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[deborah.brouwer@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:aliceryhl@google.com,m:rust-for-linux@vger.kernel.org,m:daniel.almeida@collabora.com,m:beata.michalska@arm.com,m:lyude@redhat.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deborah.brouwer@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:email,collabora.com:dkim]
X-Rspamd-Queue-Id: 17EBD1BF5CD
X-Rspamd-Action: no action

On Sun, Feb 22, 2026 at 07:13:18PM +0100, Boris Brezillon wrote:
> On Sat, 21 Feb 2026 09:09:23 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
> 
> > On Wed, Feb 11, 2026 at 05:37:06PM -0800, Deborah Brouwer wrote:
> > > From: Boris Brezillon <boris.brezillon@collabora.com>
> > > 
> > > Add register definitions and constants for managing MMU address space,
> > > including:
> > >   - Address space translation configuration (page table format, attributes)
> > >   - Memory attributes (cacheability, shareability)
> > >   - Address space commands (update, lock, flush)
> > >   - AsRegister helper for per-AS register access
> > > 
> > > These will be used by the MMU/VM manager to configure page tables and
> > > control address space operations.
> > > 
> > > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > Co-developed-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> > > Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>  
> > 
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> > 
> > > +/// Maximum number of hardware address space slots.
> > > +/// The actual number of slots available is usually much lower.
> > > +pub(crate) const MAX_AS_REGISTERS: usize = 32;  
> > 
> > Not necessarily a problem, but this constant is not present in Panthor's
> > header file.
> 
> BTW, I think the max is 16 not 32.

Yeah, I double checked the architectural limit in the spec and it says the
Maximum number of address spaces is 16, so I will change this in v2.

