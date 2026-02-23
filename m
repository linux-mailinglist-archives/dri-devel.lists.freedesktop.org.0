Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCcZDEGVnGlOJgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 18:58:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD52917B30E
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 18:58:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CC4610E128;
	Mon, 23 Feb 2026 17:58:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hGm9nGOB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ACCC10E416
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 17:58:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C93EA40DA4;
 Mon, 23 Feb 2026 17:58:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DB60C116C6;
 Mon, 23 Feb 2026 17:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771869499;
 bh=7+KA4pvA79fRJqA/rpjt6JxxIEIEtgNQYdzdD8iqzPc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hGm9nGOBmsnbdVhFBDVHFi0wXAlFnS4cR7WcPJ+txQTqv40F6q24UZQXCcOgT+0Gn
 +UBVd3VwoBaYQfLLhRejRFr+tPhsVr4u/lLUupzcY8XvrngcUQYx6FIGtROl7YCBeY
 6080IauCd+l76c5vB2sigIEX0RgE20U/AIoTkEh2baFZtt4DehufFxmwMxQ9XX8chp
 iltMXNSlmvPYvxbB0CykUVF+0EJlZ7taPVLC93uJDws9q9l2aAPPsJTXnP3VC178YQ
 EroX9ZY9X7XmSphIXZr/rXqGYOdf0CJpms6xGZgHaSWyj1csmEi2I0RXMOa0Cdzm3H
 K1mMrz0VshpOg==
Date: Mon, 23 Feb 2026 11:58:18 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Cc: dianders@chromium.org, mani@kernel.org, simona@ffwll.ch,
 conor+dt@kernel.org, dev@kael-k.io, devicetree@vger.kernel.org,
 heiko@sntech.de, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, prabhakar.mahadev-lad.rj@bp.renesas.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 linux-kernel@vger.kernel.org, neil.armstrong@linaro.org,
 kever.yang@rock-chips.com, krzk+dt@kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: display: panel: Add compatible for
 TAIGUAN XTI05101-01A
Message-ID: <177186949783.4183478.6418421929069094848.robh@kernel.org>
References: <20260214085409.3489057-1-yelangyan@huaqin.corp-partner.google.com>
 <20260214085409.3489057-3-yelangyan@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260214085409.3489057-3-yelangyan@huaqin.corp-partner.google.com>
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
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[robh@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:yelangyan@huaqin.corp-partner.google.com,m:dianders@chromium.org,m:mani@kernel.org,m:simona@ffwll.ch,m:conor+dt@kernel.org,m:dev@kael-k.io,m:devicetree@vger.kernel.org,m:heiko@sntech.de,m:tzimmermann@suse.de,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:linux-kernel@vger.kernel.org,m:neil.armstrong@linaro.org,m:kever.yang@rock-chips.com,m:krzk+dt@kernel.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: AD52917B30E
X-Rspamd-Action: no action


On Sat, 14 Feb 2026 16:54:08 +0800, Langyan Ye wrote:
> Add a new compatible for the panel TAIGUAN XTI05101-01A. This panel uses
> JD9365DA-H3 IC, so add the compatible to the jd9365da-h3 binding files.
> 
> Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> ---
>  .../devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml    | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

