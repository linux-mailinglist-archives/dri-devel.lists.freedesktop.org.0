Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uM8qOcPViWnRCAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 13:40:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EA610ED6D
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 13:40:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A234210E194;
	Mon,  9 Feb 2026 12:40:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="RnfsNijL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com
 [209.85.221.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6A2510E194
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Feb 2026 12:40:30 +0000 (UTC)
Received: by mail-wr1-f73.google.com with SMTP id
 ffacd0b85a97d-435991d4a3aso2753306f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Feb 2026 04:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1770640829; x=1771245629;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=70/F9nMIbk2fbakPSR0w38ShjRA8v7pUBIMtrpstYYU=;
 b=RnfsNijLCZ5YjS+6NFSJudAbeDNg4stQR1KvyQzUfswZg3V2KHwgZM7TM+/BqSq4jC
 MSGmBoJKLh9aQz3jNmNOm3sUtH8OTZVKhwnS0PNdw/VnUUzZvCZT/9cJuy2euO/9pOIJ
 PJDRfly9EYWhw63lHA4RN3kQQiA9DrXA0Y66JTqpL7guoPcaMKPTc41pYxJ4hP/5x+Ec
 3x6SQUEtP8QWcd7sJq4K8o0ASdRU+2P9p6jkeg73UtiS/HxFTnu0Ia0/eVE80NPEBZzj
 koI7TqUHafWcpgTk6f6A7i3UORGqBKkaYPqA86aMhfxR8E3DHbqrDQX624Xw1bbb5PWz
 Jr4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770640829; x=1771245629;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=70/F9nMIbk2fbakPSR0w38ShjRA8v7pUBIMtrpstYYU=;
 b=RTE059+GXOu8h9d92Dq5EggpyghWdOl30Hm9oI4SA2WiAii0fArL6q8O3vhw/iQl2p
 z6fZGgSwA9kMJVXorGrpXhz6efpr+HHpMn13A6VEvq7hzcQKfMzvjco7Xy669guQ3xtV
 EpFk6g6QXtqy41WutHoL8NcGFsrK9ZqNoRlixulqhKWOKKEEeeH/8iK7O7LMWoCp/3bC
 O5ZdKQCdSBJxr+yGS6pl19pnF8V42u0MCbOYtA+AjJv2py5saSsmveDGwPcvzbgDCdD3
 AaPPHfmw7XAR3fIf05dclb+zHLQRsz0lxKauuN96ZDhh59slxHiZgJRvwBa366LIDIDo
 rpmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQuy+WvfqJamtlJtHskfKwdgh8wzvzcEQZdCENaFil0F002ovY3N34K23qwNLBQ76sFSLf+ks6sj8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzV489JvSAFkDMXqyWv+EVJUuqZGoM/cRrLdMOO5dAyUQ4XA//
 s1GARArHuJ9VO4tbsvcpaZiezUPys2uPze96uwC1AkAcwTP01Szxm2Ub2J+4BkCzJ4wLQbo6pi0
 JbYokVKYAS5guvh49xg==
X-Received: from wmjv20.prod.google.com ([2002:a7b:cb54:0:b0:477:9d5d:3b50])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f4d:b0:47f:f952:d207 with SMTP id
 5b1f17b1804b1-4832096698bmr152297515e9.19.1770640829288; 
 Mon, 09 Feb 2026 04:40:29 -0800 (PST)
Date: Mon, 9 Feb 2026 12:40:28 +0000
In-Reply-To: <20260206223431.693765-2-lyude@redhat.com>
Mime-Version: 1.0
References: <20260206223431.693765-1-lyude@redhat.com>
 <20260206223431.693765-2-lyude@redhat.com>
Message-ID: <aYnVvFwBk1SfiJGQ@google.com>
Subject: Re: [PATCH v7 1/7] rust: drm: gem: Add raw_dma_resv() function
From: Alice Ryhl <aliceryhl@google.com>
To: Lyude Paul <lyude@redhat.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>, 
 nouveau@lists.freedesktop.org, Daniel Almeida <daniel.almeida@collabora.com>, 
 Gary Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Janne Grunau <j@jannau.net>
Content-Type: text/plain; charset="utf-8"
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
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:lyude@redhat.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:dakr@kernel.org,m:nouveau@lists.freedesktop.org,m:daniel.almeida@collabora.com,m:gary@garyguo.net,m:lossin@kernel.org,m:acourbot@nvidia.com,m:j@jannau.net,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[google.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 43EA610ED6D
X-Rspamd-Action: no action

On Fri, Feb 06, 2026 at 05:34:25PM -0500, Lyude Paul wrote:
> Reviewed-by: Janne Grunau <j@jananu.net>

I think this email is misspelled?

