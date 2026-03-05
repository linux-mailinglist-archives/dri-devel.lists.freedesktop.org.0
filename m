Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0O94Kx5CqWkZ3gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:43:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFCD20DA13
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:43:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D898B10EB9E;
	Thu,  5 Mar 2026 08:43:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="2C3iu+bX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4778510EB9E
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 08:43:06 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-4836cc0b38eso78933315e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 00:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1772700185; x=1773304985;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=ImdwXMFzfOswNPEOQHnijbZ5BxVnmvmjujol0/tafME=;
 b=2C3iu+bXgjZmTRtwKl2zccNEy8tgSjS4DAOnf8rcVQg/tGaBxspRvsZCpaoJuppZUJ
 LiSsFJysl0w7twwzPT0+IWlSdLVXFNPb4hv0Yztsuf6Mc9RAABCUIRvTfX8YSi0S4cyU
 ALbHphbTyCX0oa7/LoACqkHQzCdmp6pg6hv/beelwfbabelI+F6P1VxAJzZ2XOcvLb92
 gt0qCio0+A9TNC5MJJrsA4A7AVMBQRUlFJ82C0l4e24P6Lma4K0RGugqRC3l8IUKcXu6
 0/qJS1deVAbBhhKBXRR0MJsY8Cuh0Yk26nwnPybgWQ0WPS+v86vqycVv28/EV1rXL1La
 y5Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772700185; x=1773304985;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ImdwXMFzfOswNPEOQHnijbZ5BxVnmvmjujol0/tafME=;
 b=PszJU/eqeenmwC/2sIhdFq7aUHFcaHf+cLP7jZdVnJs/l2Fw4OBOpql1BgT0sOACGk
 kSSlQ6xIeOAdRMTsd6CqHU4bjcpBFBH5XhGIaLMW1ygnS3Ti3jI/XbQwdMXg7n6/5r4P
 17sSc2mxJ9egfbdnVwM8rgLrbSktYxv39SYTEM8neDRwR8cP4NwgAt5ID2KGgO+xgOpH
 ea48fEFdWp4LtE1Wd6YyFZAl5sNByDoSlz4Ny+lsVO+4q7ykXKBA7xpAqzm5h8A1rzgX
 zryqTOdAS7vuSnIAX9ftPu+i+kFiaKGOLLXVdTWxS2Rf4rYaQsJ1n6wFEa3LASiFchec
 xojQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6lppRHeSO7LD+3RUjj+jVAhRmZoF9l9snilwAWK3SGKLvQLVYrqrqzLgFBevYv3+3eihuydUl3CQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwC6dbsmgU3kqStqyI4RbSdRd/XqanA7r1I1dfSADY47Sq46O5F
 s0ysva2LWYTFft+6G1ZoRR+4ffHBPDiPmuRqaOu9FYQhUY8YH5flknws/2a91h9r0LUWF6MzbWx
 +d/iud3KGgd6psKmyvA==
X-Received: from wmj21.prod.google.com ([2002:a05:600c:255:b0:480:69c2:3949])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3e8f:b0:477:73e9:dc17 with SMTP id
 5b1f17b1804b1-485198d8b81mr83642225e9.35.1772700184640; 
 Thu, 05 Mar 2026 00:43:04 -0800 (PST)
Date: Thu, 5 Mar 2026 08:43:03 +0000
In-Reply-To: <aak9ZBJenK1DSCEt@monoceros>
Mime-Version: 1.0
References: <20260113-clk-send-sync-v4-0-712bc7d94a79@google.com>
 <CGME20260113151335eucas1p157cd966c5f0f4e477fb11272810a0ae8@eucas1p1.samsung.com>
 <20260113-clk-send-sync-v4-3-712bc7d94a79@google.com>
 <90657b83-1cff-4c7d-adde-9b560c2be7c2@samsung.com>
 <3cfeounnaphhezvjpz5igswml6iu3b6jhwhjn2g4ziimjdoefi@ge4ezxx6jxlr>
 <aak9ZBJenK1DSCEt@monoceros>
Message-ID: <aalCF0Egy6gWXdBK@google.com>
Subject: Re: [PATCH v4 3/3] pwm: th1520: remove impl Send/Sync for
 Th1520PwmDriverData
From: Alice Ryhl <aliceryhl@google.com>
To: "Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=" <ukleinek@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
 Michal Wilczynski <m.wilczynski@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 "=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
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
X-Rspamd-Queue-Id: 1CFCD20DA13
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ukleinek@kernel.org,m:sboyd@kernel.org,m:m.wilczynski@samsung.com,m:mturquette@baylibre.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:fustini@kernel.org,m:guoren@kernel.org,m:wefu@redhat.com,m:viresh.kumar@linaro.org,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:dakr@kernel.org,m:daniel.almeida@collabora.com,m:linux-clk@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pwm@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_CC(0.00)[kernel.org,samsung.com,baylibre.com,linux.intel.com,redhat.com,linaro.org,gmail.com,garyguo.net,protonmail.com,umich.edu,collabora.com,vger.kernel.org,lists.freedesktop.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,samsung.com:email]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 09:24:33AM +0100, Uwe Kleine-K=C3=B6nig wrote:
> Hello,
>=20
> On Tue, Jan 20, 2026 at 09:48:48AM +0100, Uwe Kleine-K=C3=B6nig wrote:
> > On Mon, Jan 19, 2026 at 10:45:56PM +0100, Michal Wilczynski wrote:
> > > On 1/13/26 16:12, Alice Ryhl wrote:
> > > > Now that clk implements Send and Sync, we no longer need to manuall=
y
> > > > implement these traits for Th1520PwmDriverData. Thus remove the
> > > > implementations.
> > >=20
> > > I thought this was already merged :-).
> > >=20
> > > Reviewed-by: Michal Wilczynski <m.wilczynski@samsung.com>
> >=20
> > If I understand correctly this patch 3 depends on the first patch of
> > this series so I cannot pick it up via the pwm tree *now*. There is
> > another patch pending for the th1520 PWM driver, but as of now git seem=
s
> > to cope well when merging the pwm's tree for-next with this patch.  So
> > it's fine for me if the series is picked up for 6.20-rc1 via the clock
> > tree.
>=20
> That didn't happen (with s/6.20/7.0/), so this patch is still open in my
> todo list. Is the first patch still considered for the clk subsystem?
> What is the plan for the pwm patch?

It's been on my todo list to try and contact Stephen to see if he can
take these patches, or if he is okay with them going through another
tree, but I have not gotten around to it. He has not replied on the list
to any version of this series.

Alice
