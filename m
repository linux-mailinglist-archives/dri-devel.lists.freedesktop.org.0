Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGZXON7OlGlGIAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 21:26:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8203814FF31
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 21:26:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1357210E28E;
	Tue, 17 Feb 2026 20:26:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="k7GKYozx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 921F810E28E
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 20:26:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 41AAC43BA8;
 Tue, 17 Feb 2026 20:26:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C173C4CEF7;
 Tue, 17 Feb 2026 20:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771359960;
 bh=V6sjBNNTcTEsO5eShsQ7boXHiEv6kCM9NI3J8S5QTew=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k7GKYozx94x5Pzo5LOC9fMe0Yj8Y/jBhytJ472w1fs/fPX2c5K6r9NWrgIT5zcNp0
 Gk58EBzN1meeLr2bF4lV/WRJ8Oq7GmISe7NocB5kcp5UeisZmKZGLYu8sCOBsIj54D
 zFz0GqqRPV8U3MzHkMnX7M+/su+tfd6EQ8wIMt9dRsk0lBGIDsLVfovPBwFsP9o/3Z
 JhQ3dpY+GH1pH02gVEjyMeKY0vsBy0a07rEZiioltQYQT1gAd48HYrKfU/0UlWCHzY
 DgJR6r5dLyKrtOCxN/5JHF94uHlRcfgYT04t/kmDcMfRtQ9Su4VmZPGbTJFQC3/w+i
 3+cWe+6O5hhSw==
Date: Tue, 17 Feb 2026 21:25:57 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Val Packett <val@packett.cool>
Cc: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: vendor-prefixes: Add Holitech
Message-ID: <20260217-tanuki-of-amusing-agility-32b250@quoll>
References: <20260217070121.190108-1-val@packett.cool>
 <20260217070121.190108-2-val@packett.cool>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260217070121.190108-2-val@packett.cool>
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:val@packett.cool,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:phone-devel@vger.kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[krzk@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email]
X-Rspamd-Queue-Id: 8203814FF31
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 04:00:09AM -0300, Val Packett wrote:
> Jiangxi Holitech Technology Co., Ltd. is a manufacturer of display panels.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

