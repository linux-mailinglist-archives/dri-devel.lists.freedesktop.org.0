Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2P51HA60jWl96AAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 12:05:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F408212CD81
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 12:05:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F14F10E230;
	Thu, 12 Feb 2026 11:05:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="kDoD0dlZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1D1F10E722
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 11:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1770894344;
 bh=P9ffzgxofLVWVga4R+Le4SX4ODA3h2rfxfHA1rWlv7g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kDoD0dlZbiQrqwR5dqh2lrb8PmGZ0vsTBmPEsmQCHqtSdDNjobayQ3yiTWMuKxD9J
 Fg8W0lUH0tUPzuIrit7MSOX98EPZhnlKxVLxNuChvU2MGy8tkjg8xSHst8+Y2iQgDX
 56cjt/hvsGmBjA5LKpS8pUIVmG2zkq8TAg86qbKMMu39XC7Q9+cUXpvkyXV06u942v
 O4ob/oCo440bV2bvih8NuDC+4FviJX6sZz1LxX4E9can12cG6//kuAoSsLe8WXUYuJ
 MDCJV5nceJw2ELSE7fOZDbQzPpKIq7q4Gjd5zfVHJN4qC2PwvR5zEDEtUW5IJWXm3S
 F3ATWlxpUab4Q==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 4F96E17E0A49;
 Thu, 12 Feb 2026 12:05:44 +0100 (CET)
Date: Thu, 12 Feb 2026 12:05:38 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 daniel.almeida@collabora.com, aliceryhl@google.com,
 beata.michalska@arm.com, lyude@redhat.com
Subject: Re: [PATCH 08/12] drm/tyr: add MMU module
Message-ID: <20260212120538.13f81d8a@fedora>
In-Reply-To: <20260212013713.304343-9-deborah.brouwer@collabora.com>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
 <20260212013713.304343-9-deborah.brouwer@collabora.com>
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
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:deborah.brouwer@collabora.com,m:rust-for-linux@vger.kernel.org,m:daniel.almeida@collabora.com,m:aliceryhl@google.com,m:beata.michalska@arm.com,m:lyude@redhat.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_ORG_HEADER(0.00)[]
X-Rspamd-Queue-Id: F408212CD81
X-Rspamd-Action: no action

On Wed, 11 Feb 2026 17:37:09 -0800
Deborah Brouwer <deborah.brouwer@collabora.com> wrote:

> +
> +impl Mmu {
> +    pub(crate) fn new(
> +        pdev: &platform::Device,
> +        iomem: ArcBorrow<'_, Devres<IoMem>>,
> +        gpu_info: &GpuInfo,
> +    ) -> Result<Arc<Mmu>> {

Maybe the Mmu should be wrapped in a Devres, like we do with other HW
components that require the underlying device to be bound to access
registers. I mean, we do have iomem wrapper into a Devres, so maybe
that's not needed, dunno.

> +        let slot_count = gpu_info.as_present.count_ones().try_into()?;
> +        let as_manager = AddressSpaceManager::new(pdev, iomem, gpu_info.as_present)?;
> +        let mmu_init = try_pin_init!(Self{
> +            as_manager <- new_mutex!(SlotManager::new(as_manager, slot_count)?),
> +        });
> +        Arc::pin_init(mmu_init, GFP_KERNEL)
> +    }
