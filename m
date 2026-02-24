Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GnRKR3BnWnzRgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 16:17:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A1D188E6D
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 16:17:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D243B10E283;
	Tue, 24 Feb 2026 15:17:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lSuchcjU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3065D10E283
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 15:17:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4035861118;
 Tue, 24 Feb 2026 15:17:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45C1AC116D0;
 Tue, 24 Feb 2026 15:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771946263;
 bh=1Bj5QO/sZIgAv9PKzWZ8aiOMalGgR/GkNuoz/EcNLQc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lSuchcjU/2owqJhZ1jM1s7aF9fhsUAb/DeV80/FqAwmXv1RmmT4L/nVr7s9W/KrC2
 hWoHW0NZwfBKFc28JbpsVNDcmbw8EAMLOyP+kO1plYYxd3vvJ0NAiBLgihOW3XyH88
 OLcZZmGVL39VgF9L3Nf9wA/Gtq8xJ2WwPEuU/0Wolwd3FGCYSlT37ROpJpugSOk6qA
 j9WJLPBwUdisUoPcATackch+IlGtFcY7p/zGo4W1NJd6pbZl/Aw8BjZ+sBR+AZDp4x
 TBD9m7ciFH8MYZb1pJp8dH7cNRFuToiV3wH6zaRBu7Salev+lp91RtJGv5Dp/ZvjwZ
 patqViub4840g==
Message-ID: <e3f1facc-c077-4453-8960-3d31f2a322ed@kernel.org>
Date: Tue, 24 Feb 2026 16:17:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] rust/drm: Fixup import styles
To: Lyude Paul <lyude@redhat.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Ewan Chorynski <ewan.chorynski@ik.me>,
 Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Simona Vetter <simona@ffwll.ch>, Shankari Anand <shankari.ak0208@gmail.com>,
 David Airlie <airlied@gmail.com>, Atharv Dubey <atharvd440@gmail.com>,
 Asahi Lina <lina+kernel@asahilina.net>,
 Daniel Almeida <daniel.almeida@collabora.com>
References: <20260122214316.3281257-1-lyude@redhat.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20260122214316.3281257-1-lyude@redhat.com>
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lyude@redhat.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:ewan.chorynski@ik.me,m:ojeda@kernel.org,m:aliceryhl@google.com,m:simona@ffwll.ch,m:shankari.ak0208@gmail.com,m:airlied@gmail.com,m:atharvd440@gmail.com,m:lina+kernel@asahilina.net,m:daniel.almeida@collabora.com,m:shankariak0208@gmail.com,m:lina@asahilina.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,ik.me,kernel.org,google.com,ffwll.ch,gmail.com,asahilina.net,collabora.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.954];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,kernel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 30A1D188E6D
X-Rspamd-Action: no action

On 1/22/26 10:43 PM, Lyude Paul wrote:
> This is to match
>   https://docs.kernel.org/rust/coding-guidelines.html#imports
> 
> There should be no functional changes in this patch.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Applied to drm-rust-next, thanks!

    [ Move trailing `//` at the end. - Danilo ]
