Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QEZFM0hHm2lYxgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 22 Feb 2026 19:13:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 461031700D5
	for <lists+dri-devel@lfdr.de>; Sun, 22 Feb 2026 19:13:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F020C10E126;
	Sun, 22 Feb 2026 18:13:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="PA2+g5+O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E1D410E126
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Feb 2026 18:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1771784002;
 bh=hIqgXZd5FMqfLfyGvz8FJHmE2JgWnHUAv7jzjheKI78=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PA2+g5+OYkSH93cy3Mr5PEscRkgXSw2PpmmUOiGH+kDQfBTztSWSx3ey4B8pdSA79
 pT3EnMLB01ULwTaf0IitFG8iUopRi1oRbwqGB78i+a3ZvHZoSNjDcRPDgj/84a/PNu
 d2ZMCdTBVw1SiYBHEA0Wb4vYdPdTRmc/byBi2WW/7xJLbIPKjLPcioGQK6IEx80BVf
 E5lMv3lx/vFMC7TSZzMLnPKe+3jM8EDq2m45gNnXYnvxrgUIcp5Bh4KyplcxqCCmqG
 nH02AtJP8iEk8sI/saGMbg/S7AqDdWUPsrG6HbLrf7NJ2OSmX8ZTbBcmAzIoWCbbSM
 rqg3eOb22Du4Q==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id AB03917E12B9;
 Sun, 22 Feb 2026 19:13:21 +0100 (CET)
Date: Sun, 22 Feb 2026 19:13:18 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Deborah Brouwer <deborah.brouwer@collabora.com>,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 daniel.almeida@collabora.com, beata.michalska@arm.com, lyude@redhat.com
Subject: Re: [PATCH 05/12] drm/tyr: add MMU address space registers
Message-ID: <20260222191318.0ddf8eee@fedora>
In-Reply-To: <aZl2Qzl4knlY19Hb@google.com>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
 <20260212013713.304343-6-deborah.brouwer@collabora.com>
 <aZl2Qzl4knlY19Hb@google.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:aliceryhl@google.com,m:deborah.brouwer@collabora.com,m:rust-for-linux@vger.kernel.org,m:daniel.almeida@collabora.com,m:beata.michalska@arm.com,m:lyude@redhat.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_ORG_HEADER(0.00)[]
X-Rspamd-Queue-Id: 461031700D5
X-Rspamd-Action: no action

On Sat, 21 Feb 2026 09:09:23 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> On Wed, Feb 11, 2026 at 05:37:06PM -0800, Deborah Brouwer wrote:
> > From: Boris Brezillon <boris.brezillon@collabora.com>
> > 
> > Add register definitions and constants for managing MMU address space,
> > including:
> >   - Address space translation configuration (page table format, attributes)
> >   - Memory attributes (cacheability, shareability)
> >   - Address space commands (update, lock, flush)
> >   - AsRegister helper for per-AS register access
> > 
> > These will be used by the MMU/VM manager to configure page tables and
> > control address space operations.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Co-developed-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> > Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>  
> 
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> 
> > +/// Maximum number of hardware address space slots.
> > +/// The actual number of slots available is usually much lower.
> > +pub(crate) const MAX_AS_REGISTERS: usize = 32;  
> 
> Not necessarily a problem, but this constant is not present in Panthor's
> header file.

BTW, I think the max is 16 not 32.
