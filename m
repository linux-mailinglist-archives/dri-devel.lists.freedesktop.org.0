Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKCbCc8YqmlfLAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 00:59:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8318219965
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 00:59:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB07110E053;
	Thu,  5 Mar 2026 23:59:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="h2LkzCaM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EEBC10E053
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 23:59:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4094A600B0;
 Thu,  5 Mar 2026 23:59:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7962C19423;
 Thu,  5 Mar 2026 23:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772755145;
 bh=Ah4m7LLMEaYgGTcAWdKvHDt/vYnmXbiN4uWHziw73Hk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h2LkzCaMShUO6Hd720cQDLdBdPgWuaxD3/5OUAEY4bNLRil+XWHk5MxgIJv++tbSR
 pBQAVdyaxrE026BsgBDU6N0I34FTudRbro8TPU9NhxYLd+KD0Ox6V1n46+u8UFuXYU
 XaEuYtb4OLHfUIGbMhx+GONuN0WculrBBewxlck44LwiRLYf3FZikeqptzImb2Lytl
 PRRJo4ZTsM/nGhlvsbiq9ticRwTOQ1qERTITeT/lXHqqNA9MJ2Tokb0Xwt8/OeQqbq
 6pwFkEOlldYeNfglGOuWLQ6fqbg/cjzyg3/KYIvIQq+CTfbeiUgAyBnDa8x3NkNeIX
 SjAWAHg8YLNuQ==
Date: Thu, 5 Mar 2026 17:59:05 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Thierry Reding <treding@nvidia.com>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 Simona Vetter <simona@ffwll.ch>,
 Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: tegra: document Tegra20
 HDMI port
Message-ID: <177275514466.813292.350070778005908471.robh@kernel.org>
References: <20260223065500.13357-1-clamor95@gmail.com>
 <20260223065500.13357-2-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223065500.13357-2-clamor95@gmail.com>
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
X-Rspamd-Queue-Id: A8318219965
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:clamor95@gmail.com,m:tzimmermann@suse.de,m:linux-kernel@vger.kernel.org,m:treding@nvidia.com,m:linux-tegra@vger.kernel.org,m:simona@ffwll.ch,m:jonathanh@nvidia.com,m:devicetree@vger.kernel.org,m:mripard@kernel.org,m:thierry.reding@gmail.com,m:airlied@gmail.com,m:conor+dt@kernel.org,m:maarten.lankhorst@linux.intel.com,m:krzk+dt@kernel.org,m:thierryreding@gmail.com,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[robh@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[suse.de,vger.kernel.org,nvidia.com,lists.freedesktop.org,ffwll.ch,kernel.org,gmail.com,linux.intel.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action


On Mon, 23 Feb 2026 08:54:59 +0200, Svyatoslav Ryhel wrote:
> Tegra HDMI can be modeled using an OF graph. Reflect this in the bindings.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../bindings/display/tegra/nvidia,tegra20-hdmi.yaml | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

