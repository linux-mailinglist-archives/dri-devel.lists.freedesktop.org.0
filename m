Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDFpE4eso2myJgUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 04:03:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A1C1CE28D
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 04:03:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E08110E0A9;
	Sun,  1 Mar 2026 03:03:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="EVspzjq7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE56810E0A9;
 Sun,  1 Mar 2026 03:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=O8AQRwkuen2J2VbPw4OAhdRbe8PeJJKYGBh2E6Vfdaw=; b=EVspzjq79oLNNa56WDjYtDF+JC
 Bx3WkOv204TCjyORd7t9CZ1ARwuH/0CbDO4cvHqrgZgLUguInBGr3Tvcqhg1wwGyeNCOYoy2j+anu
 sfLXNl2LfXr2/mfPKfQMxNdpKw+c6bRKcBm3jadrxHdRZWtkwrfQ11/L3THgbCeQPsGD2pvPZWEgJ
 Kz/m8G0g58CTreOxRBLno5q8+U9p5R3WjMxNkHAMstRpQWzkZ+V5hfmF/PakQUlYA8oLfZ4++Bpn7
 0a4ycPB2091dyXEsAtPSeDPUOU0ejKVVEaQE9qm0h496EmzyfMtnVbrbI6aa73zfYYs2dTtrZHnBX
 3GxXwK0w==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vwX5M-0000000AmD7-3feh; Sun, 01 Mar 2026 03:03:12 +0000
Message-ID: <2512c6a2-df8d-41d8-8d94-4c004cc60f86@infradead.org>
Date: Sat, 28 Feb 2026 19:03:11 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] gpu: nova-core: add initial driver stub
To: Danilo Krummrich <dakr@kernel.org>, airlied@gmail.com, simona@ffwll.ch,
 corbet@lwn.net, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, ajanulgu@redhat.com, lyude@redhat.com,
 pstanner@redhat.com, zhiw@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com,
 bskeggs@nvidia.com, acurrid@nvidia.com
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 gregkh@linuxfoundation.org, mcgrof@kernel.org, russ.weight@linux.dev,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
References: <20250306222336.23482-1-dakr@kernel.org>
 <20250306222336.23482-5-dakr@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250306222336.23482-5-dakr@kernel.org>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.99 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[infradead.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,ffwll.ch,lwn.net,linux.intel.com,suse.de,redhat.com,nvidia.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:-];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,proton.me,google.com,umich.edu,linuxfoundation.org,linux.dev,lists.freedesktop.org,vger.kernel.org,nvidia.com];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:mid,patchwork.freedesktop.org:url,gitlab.freedesktop.org:url,lists.freedesktop.org:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 25A1C1CE28D
X-Rspamd-Action: no action

Hi,
Sorry for the delay. I just noticed this.

On 3/6/25 2:23 PM, Danilo Krummrich wrote:
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ca11a553d412..ede8abee210a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7450,6 +7450,16 @@ T:	git https://gitlab.freedesktop.org/drm/nouveau.git
>  F:	drivers/gpu/drm/nouveau/
>  F:	include/uapi/drm/nouveau_drm.h
>  
> +CORE DRIVER FOR NVIDIA GPUS [RUST]
> +M:	Danilo Krummrich <dakr@kernel.org>
> +L:	nouveau@lists.freedesktop.org
> +S:	Supported
> +Q:	https://patchwork.freedesktop.org/project/nouveau/
> +B:	https://gitlab.freedesktop.org/drm/nova/-/issues
> +C:	irc://irc.oftc.net/nouveau
> +T:	git https://gitlab.freedesktop.org/drm/nova.git nova-next
> +F:	drivers/gpu/nova-core/

This is merged as commit 54e6baf123fd.

Entries in the MAINTAINERS file are meant to be kept in alphabetical order.
"CORE DRIVER" is mislocated. Please correct it.

thanks.

-- 
~Randy

