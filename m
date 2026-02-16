Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Ggz9IR+Xk2lI6wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 23:15:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0943B147DF9
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 23:15:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A754510E3FA;
	Mon, 16 Feb 2026 22:15:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pElpAS1H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24EE410E3F6;
 Mon, 16 Feb 2026 22:15:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CE6CD416F5;
 Mon, 16 Feb 2026 22:15:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1B49C116C6;
 Mon, 16 Feb 2026 22:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771280153;
 bh=ktKlpr9epck2KbEjQy/EOpt6H/El8eNuAVvaEEIDlsA=;
 h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
 b=pElpAS1HiklX7w3PWvkrdYLCrGzKiGPqEdOneYAqprY97nqSb3bmzHCvAaSedn1Vz
 xXPcimOhmU3+C6ZEtnwu/+3oN2YBQlCa0vnelnrqODUHhjsUyKImGBiRsiWh0lVgFl
 nvfmJBg868X3gq1bQ4oPt/1Az3MwzV8kT8ixyrtiZiwtTiCXf7j2tUZ5fCcK63/gNz
 whpATMbYVLYhK7J955IlnuGlwQMWGuE5i24GT5XAMYqvKX+ERznrZ/tydiDLKDmVj8
 fkd/HjGtf+4xVtODx8XFl8P4HeqTABMRyOg5vfq4hydZrpAgz4dRuLMlE1IcaFg7Ed
 TGSWh3vf9DFRQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Feb 2026 23:15:51 +0100
Message-Id: <DGGQERY8LNX4.2B7KZJ6VLBSQQ@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] nouveau/gsp: drop WARN_ON in ACPI probes
Cc: <dri-devel@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
To: "Dave Airlie" <airlied@gmail.com>
References: <20241121014601.229391-1-airlied@gmail.com>
In-Reply-To: <20241121014601.229391-1-airlied@gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 0943B147DF9
X-Rspamd-Action: no action

On Thu Nov 21, 2024 at 2:46 AM CET, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
>
> These WARN_ONs seem to trigger a lot, and we don't seem to have a
> plan to fix them, so just drop them, as they are most likely
> harmless.
>
> Cc: stable@vger.kernel.org

Fixes: 176fdcbddfd2 ("drm/nouveau/gsp/r535: add support for booting GSP-RM"=
)

> Signed-off-by: Dave Airlie <airlied@redhat.com>

Applied to drm-misc-fixes, thanks!
