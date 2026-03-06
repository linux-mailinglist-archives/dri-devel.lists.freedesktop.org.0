Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGORBEOyqmluVQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 11:53:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D2421F442
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 11:53:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7822510ECE5;
	Fri,  6 Mar 2026 10:53:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Cmx2wNdU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A04710ECE5;
 Fri,  6 Mar 2026 10:53:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 709EF40029;
 Fri,  6 Mar 2026 10:53:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB8CCC4CEF7;
 Fri,  6 Mar 2026 10:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772794431;
 bh=nhRdYKoFVBLMIadM+f8eRD+secw/nGDbxBmsZFHV2p0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Cmx2wNdU+sGEBl+ZXlVU6V8ecY6bi4DkR+La67GrIIXRv3aQgkJMvap02ORqe6Xbi
 rnx/GjKaBsJnJ71Z93zSBoG0cNFX1u3vJvMqWAVjx9wiL5urzKN0+LCci3IVqYI8Ys
 5wqgHhksmDswoYIee9eiwSTddQLaPo4gDkniy9bVSNH8P28f7ArMiXH1g7jAHr0ju9
 h+pmB5jEaYmu3Ny5QcTYBj5XXov72ZO0TNzXRiCQva7MFBU9LtgaLnJrKJ+CNEm/lY
 ahULAbTEYBN0ZH10RmqISSHVyRl9sdDv6v/PG04UyHjnETtdW+ssXNTneOOt6kjyWD
 nX+c4vVXFpsug==
Message-ID: <fbb1f03b-b87d-4f94-9be9-3dc53e4b1e11@kernel.org>
Date: Fri, 6 Mar 2026 11:53:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 00/10] gpu: nova-core: add Turing support
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260301-turing_prep-v10-0-dde5ee437c60@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20260301-turing_prep-v10-0-dde5ee437c60@nvidia.com>
Content-Type: text/plain; charset=UTF-8
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
X-Rspamd-Queue-Id: B0D2421F442
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[google.com,gmail.com,ffwll.ch,nvidia.com,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

> Alexandre Courbot (8):
>       gpu: nova-core: create falcon firmware DMA objects lazily

It would be nice to add a TODO that this should be followed up once we have
dma::CoherentInit (which I will most likely just name dma::CoherentBox instead).

>       gpu: nova-core: falcon: add constant for memory block alignment
>       gpu: nova-core: falcon: rename load parameters to reflect DMA dependency
>       gpu: nova-core: falcon: remove FalconFirmware's dependency on FalconDmaLoadable
>       gpu: nova-core: falcon: remove unwarranted safety check in dma_load
>       gpu: nova-core: move brom_params and boot_addr to FalconFirmware
>       gpu: nova-core: make Chipset::arch() const
>       gpu: nova-core: add gen_bootloader firmware to ModInfoBuilder
> 
> Timur Tabi (2):
>       gpu: nova-core: add PIO support for loading firmware images
>       gpu: nova-core: use the Generic Bootloader to boot FWSEC on Turing

Acked-by: Danilo Krummrich <dakr@kernel.org>
