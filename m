Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILJSNbOSc2ntxAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 16:24:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFC877C27
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 16:24:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8787E10EB19;
	Fri, 23 Jan 2026 15:24:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cC7jcFeQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com
 [74.125.82.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B355010EB19
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 15:24:32 +0000 (UTC)
Received: by mail-dy1-f169.google.com with SMTP id
 5a478bee46e88-2b71e7dab12so207536eec.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 07:24:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769181872; cv=none;
 d=google.com; s=arc-20240605;
 b=X7qauthDyb1rmlS9fgwatcn/3Us6htTfwWGDkR7RQnJ8kgoQIYN2HscEVEBSnEgp3W
 pWpfQFjRg3m+brpIXLkZInmvelXXGXQi1qG30sSaOcRD5wS8K12XsEMGAtDb2wdkvATc
 tWRnnZW5RFOPpp93oI0pVygZm+LRaer4Pr4FN6yvA2JIzTLxOFtmfDV++tQHoby9Q7yj
 woRxXqYz4N8lVRXIYsLSR+m3xjwjPaaDVBaL9keYOIZ4NQNWsFf1dvFv3DR/4pNuJVcP
 WzBuPMjS60NNw+jjbS2OtirRAixG9FxQTEVKA+e2S5JFxrn1Hy6w7tItJa/L8iobV9ai
 YxGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=0C835ZbMmfisFy6hQvPTGQqqPveQCd+DjgKswlFGS8s=;
 fh=RHsu8DqFvf6B3113WPewrixgjpqZaKy+XkgoMLDh52I=;
 b=MtdtQZBe885eWqAxxENoV6ckkUA+IXttqczAQMJs8LK0Z9BWyQ8UBVr/dkuq22EzW9
 D5t54B96f68lEB4K1RAr4MdKWzlFbgzhDo4SH94R50OvwKCXtiPc0uhv73kfxNgrSiyB
 7rJrX4D2Mz/zIBPZv9AACXEcTSJm+yZZ4cRhcx2dOqL86dA5sj502lvnckfNuvrlJZ9D
 No+OzhGZBk/Lqeg3umUxywa+8TG9KYObwMB5b6lzMkqh1YScOOYHYKEq0/dzx8/hl//B
 xDKiO/vm9x/41+Pd5/7vG1zwY6ua25Nek/C1/9l7ELvdkrlRBNMV4kvkTprQ7RCTRpAg
 OeqA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769181872; x=1769786672; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0C835ZbMmfisFy6hQvPTGQqqPveQCd+DjgKswlFGS8s=;
 b=cC7jcFeQ8qbYCSiVhXB8xtga1LWFYJTeVpuouWasM1a/qNWFYxIJuFob/ydRix6O3r
 6m13dw8JokMJKY+PWWK1qt6H1vRjD8FWvvLPbAvp4+NDl3nHwpv0extK9vLZE4gsqBXQ
 TpMV/KuTWQnLJI05X3BTkfhlvWGCty6L1Q9BJ/LEFEfDh4mv9ihKyh6fPgTbgjBtxvD5
 R6ZTJrLj6j73pN0I1NmQ/gv0eqijhjXrkmkEBKG29Khj3UUBhDiOnkLasstFH73ZlxcB
 LDF7DqeS8r8n0z6vNm67SerRkbR3uJwDLK9RA5wWNNORwPg/SOxqF7vKXq/G5hFMH7lk
 Uiow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769181872; x=1769786672;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0C835ZbMmfisFy6hQvPTGQqqPveQCd+DjgKswlFGS8s=;
 b=k/tH/pHlH87oOqJgoIG2WnS4AuXPDVMvfKce/d1WUMZILkAnOZldkGmz40/26DKHK7
 QCDO+TBhweyXc3Fs7vqmRi1dt/JKxD+OL7mOSYIKtPqQgw+K/g03NOqyLueHPiZwNFol
 sh7rQaIb1gq7lpdx25UVTZ8VUlcrpa2750Zbft7ofqfpz0rA2i9Ws03/Xp7s/Q1L6wdu
 Jj8u26SHXX1PYecOyHixtMprtwNUBEzVo6bZ1HJiDwPi5ms7+JWSSrMVcPFRk0doux1E
 EM6P5dj6gTJXioAHK8Xm6KDom5GqHnRkUz8yhuE6DMy7fxGwJGMJEC8ZW1VR5o4a5K82
 WwBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9ZpqZnJLqBoE86xB/ZvJHkgwSbxacnvmvLa99HzW7tzSONDwxAQwRB4M377zQeRdUN1xW3UOSyTs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz23AbPGhfWpMiJ9FA3tUlZUs+k8HMIcBA17J0a1X7XL6vm5eOy
 JGgH7qnzmOy72Ukx1SL+b0TO4DcKkhGpcaAvWQsLPK8L6YGlvVry7X/bMjvVvfYv6b6y4YFlkxs
 O2x5yJmIhpd9ubxvChFoiH6wEtOcQU8A=
X-Gm-Gg: AZuq6aL1D7cMYPH4VNNGh6uV8IixMRGtPOS+BHofHpa8CzulN3T5suFuUxQsCBCh1Ly
 1xP55eK9lVs9jhwk1Fovw81WjQMCV0uoHgBWm9UdWIdmzj3sErcx0XNPe+5C2OxuFlH4MMwSL4I
 jO6q7r+i0UlAvX9tQ5VDOz2/kE3mI5thKClekTn6dy97kCI4C3deuGzcydwtbyNZ2nFq3S0Kt+y
 Nug5P91oP105IJ2ubowU7pMAs5LpSRL8/dNGXXgvy4Xg23AMLdzSkh+/z+g5vIZnuzKueTn+L0H
 GD52+ZYX8wyp/o85CGZk2vli971jouDmkq3s8rqJqyjIfI43IDGdgtKzGJhNL06N7ThnYvDkvIT
 9JU2lWZo2bAD05yGcFvyMBXA=
X-Received: by 2002:a05:7300:a507:b0:2b0:4f9a:724b with SMTP id
 5a478bee46e88-2b739bf315fmr909834eec.6.1769181871865; Fri, 23 Jan 2026
 07:24:31 -0800 (PST)
MIME-Version: 1.0
References: <20260122003746.405370-1-deborah.brouwer@collabora.com>
 <CANiq72=xNcgg6hahQRkAjfbiKOEGMvdePLSaWvD7cML9qTP2iA@mail.gmail.com>
 <cccf7d2d-fe7c-4b90-8181-ae4cbfacb63f@sirena.org.uk>
 <DFVDKMMA7KPC.2DN0951H3H55Y@kernel.org>
 <CANiq72m9Nq-Wonw57Nwk480CTCmoaDk-_rTLX-dFrqh_N+eyfg@mail.gmail.com>
 <aXOPVkAQGr0lEfml@google.com>
In-Reply-To: <aXOPVkAQGr0lEfml@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 23 Jan 2026 16:24:19 +0100
X-Gm-Features: AZwV_QhFUx03nDzWGbtH5yx0sTnESlXNd8pfHxRA1FMqOX70S3PEwkv0l-iFPNE
Message-ID: <CANiq72nTrdhaz9-9xojcJzLBB=ntFjtdH4xZbQk+A662G6Tt8g@mail.gmail.com>
Subject: Re: [PATCH] drm/tyr: suppress unread field warnings
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Mark Brown <broonie@kernel.org>, 
 Deborah Brouwer <deborah.brouwer@collabora.com>,
 dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, daniel.almeida@collabora.com, 
 boris.brezillon@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:aliceryhl@google.com,m:dakr@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:broonie@kernel.org,m:deborah.brouwer@collabora.com,m:rust-for-linux@vger.kernel.org,m:daniel.almeida@collabora.com,m:boris.brezillon@collabora.com,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,umich.edu,collabora.com,lists.freedesktop.org,vger.kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 3EFC877C27
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 4:10=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Having a lint that happens on just one random version is inconvenient,
> so I think we should take at least one of these two actions:
>
> 1. Disable clippy::precedence on 1.85.0 only.
> 2. Enable the clippy::precedence_bits lint.

Yeah, in case it wasn't clear, those are the two options I mentioned.

> But I am ok with enabling clippy::precedence_bits.

Great, let's see how others feel about the parenthesis...

Cheers,
Miguel
