Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKVMIO9+rmlfFQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 09:03:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 123982353C9
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 09:03:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C8E10E492;
	Mon,  9 Mar 2026 08:03:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UUPzHRxq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 890FE10E492
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 08:03:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1453C43743;
 Mon,  9 Mar 2026 08:03:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94E1FC4CEF7;
 Mon,  9 Mar 2026 08:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773043434;
 bh=HdTeyECHTLJwsjf0F/ekdzRRdPdXu42X8eRpOnWO+gQ=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=UUPzHRxqwj7s0/hEoVtu8yTq9P1gqWAahF3V1tIvKc7hfQfGemuAeNd6H50hfZRFO
 Ta/Fpnd9r86MOUiUFgh42kxpqfNwt38OsIOPZ0jTjXws89ineCTOsa0lJZXo8uUNv9
 PsmRydGnOuCLFouiVmPM3Cl42wmLN0p6CYPdIi1QTND9EmBJrNVhQ93TfbW6jN0Sy6
 lfGX5xSsANyvLZu1DvlgzNyXIHAWaS8HNJ63gqFcJjy0wZD+IUQPAB1hVG0MBsTbMM
 zxrh7BJ/FWcevaMO0xTD3l1iGlNCEOZny/+//6GsSO8bphcTEU0rQBa2C52MACaR5N
 VXOC7X7zZ+UQw==
Message-ID: <909f1667aedfecedb6da752a57043e57@kernel.org>
Date: Mon, 09 Mar 2026 08:03:52 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Marek Vasut" <marek.vasut+renesas@mailbox.org>
Subject: Re: [PATCH v2] drm: of: Fix drm_of_get_data_lanes_count_ep() return
 value documentation
In-Reply-To: <20260305205840.95978-1-marek.vasut+renesas@mailbox.org>
References: <20260305205840.95978-1-marek.vasut+renesas@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, "David
 Airlie" <airlied@gmail.com>, "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: 123982353C9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.19 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:marek.vasut+renesas@mailbox.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:airlied@gmail.com,m:geert+renesas@glider.be,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:marek.vasut@mailbox.org,m:geert@glider.be,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,gmail.com,glider.be,linux.intel.com,kernel.org,ffwll.ch,suse.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[dri-devel,renesas];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Thu, 5 Mar 2026 21:58:15 +0100, Marek Vasut wrote:
> Update drm_of_get_data_lanes_count_ep() return value documentation
> to match the drm_of_get_data_lanes_count() return value documentation.
> The drm_of_get_data_lanes_count_ep() is only a wrapper around the
> drm_of_get_data_lanes_count() and therefore returns the same error
> codes.
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
