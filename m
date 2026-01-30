Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GONBDtw2fGmvLQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 05:43:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 894D2B7225
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 05:43:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DD4110E8F0;
	Fri, 30 Jan 2026 04:43:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="R3ta6lwb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com
 [74.125.82.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71FAB10E8F0
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 04:43:02 +0000 (UTC)
Received: by mail-dy1-f170.google.com with SMTP id
 5a478bee46e88-2b6aa67a792so290417eec.3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 20:43:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769748182; cv=none;
 d=google.com; s=arc-20240605;
 b=HvbUvB85wkSUfwLDQKi00BYwvGq8t0w3MUWuzLG4V5vrQvq2ZjPPRJyonEDBWeAtX3
 MNWIYGjhttSIed0j5whRVez5FmejeOm/2QbE9u8oGo87zMd44tDgy6AEUknSz3bSMEJ9
 v/gFYtxJawvff0hD27Sjcym/ZCCYj8D3j6O5olxuQfqeAu/7Eah1sNgKQrdLAZOEqBoS
 ShF8W8LvKVwlXo+z2RWtFvPZmybCOaRrA0jqThY6PxxDQYjL43RrDNu/91Pdg1GRfHau
 FY6XsG0U09e6r8I75BdrosPNx7Vm+UTuJbgHndVAR/1+DlNyC0C1LkuFQ9b1KewXc1Fc
 aVBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=tJOsBxmqkupH8loSgMmWr48T44IrdY48UJF/0gsFmXY=;
 fh=mKFCz4WoMFyZvDtEycZx+j8IEDATbVuD+CsZETxqM2Y=;
 b=dgrX0gdQDBmVKMCTrwzm7n+cUn0WpKmzOdqtL1fRWvYWS694fMDvifr/aMf8JRHcT9
 P/wT4Kk6zpW3xkkoZLAd6HYIXCdcjrqWwlYTNIjXLH/r0KnrhBBhDtwkKlwiQ5NaJWzu
 EUsBtZLyJDVkzlCobuB3JRQKeYC58L/13puja6wNhQ+tw1N9c5EI7JmP0/exSDw9sKD2
 iNe06bdD1akJHDhrtRzzTQb+SbI3qWiNJ2kL6WWSrqyiPzM9Medl7VlWr8q4c3eAfceB
 XGVds+DPxmOWVtfVX8GOvfJyes/G5EApKeehMHAyb1n1SY/0Y5xASNFvXiz1rKcHNISC
 faQA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769748182; x=1770352982; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tJOsBxmqkupH8loSgMmWr48T44IrdY48UJF/0gsFmXY=;
 b=R3ta6lwbPXJL9Zku6mq/T1BQia50Cj/O+t7559SO1Aq7D+WY0RKuoKKZEOxgJmXaD8
 1Xozht7GboXxpxfJm3Q8maLwAsGNF8ou/a+1OgOSaXW4Ytob9iD+srV3R4LecVA/mlEr
 tVuV5hpca/ILZrzcFo0+vQj/2mPdl3huT14p2bkodPS1vX64rJHKLgrrVozsl+OZj4FY
 WgoinJajra0/ic1eXHORg6/RvLlqWJBxEdWmx0nj4oolAV48UDC7xQkPi5lolVqe3pXF
 bUWQQjoDCLBZeUIIPLtSAJnVJSJOMM1RsKOZUQcGLOAnKrL4oiwMABi4/R8oHJheqJcY
 8JBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769748182; x=1770352982;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tJOsBxmqkupH8loSgMmWr48T44IrdY48UJF/0gsFmXY=;
 b=RCDg3SLpjYfYhiSS4QCPHS+q3vW5SalRB55vvZoZsqTmTVjj/szN5ULWHwk+EVOTa0
 7AKV8mDhd+Sm9qb5XwuRaR+TkVjE5ucfmOhneazmaI90hngTI55caTyYgQZNfZGpdJoU
 L8L4DYfKNd0gpj+QuLKPGN4DNbPViuDKV8+Z3pkC5CFFn2CxH0L6udkUEc2IdQHqwdnj
 9pTZMbmVXkwxEvb6BMuIBJ0Me84qLFp0iwcBRuoLwLWBY9SJoRgBDcC/S06kzm/kqRED
 +lsFk0dm5nou5Cg3Ly2WaRvI2YjZR5x3k+agv7GZbAl6SJlxzy32mU3xJ35epumdLMYS
 R46g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgqj0hseKtzJr9+rmZbVr0pVyDg2IaQxo7/NlDHq+F/sKTNuBwMKK3RTdpbhnLczgYARw9EOCIfDk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxtapATkGN93bj8aaNGhABMi5Wbprke5UFW753WBSVdmFLpIDrN
 HZ1Zs8nXLAVv+sNDEEQq5vTbLpQdjHqOwUauZaY5GbuGeKCkLbF2Ggruqj26mawjFrMqBpAsIdb
 HhQrot9TQwUm+U/vf7cwgB2ec665bSOw=
X-Gm-Gg: AZuq6aLXEMH388elclD85UR1sO9XizbJASBcOcVvyYEHR2MeG7ZBTZyg1nysVM9NfuO
 rO3/27CTgIodBCnEH5fMKBLWr0Q70/IeJDK/r+ZMr9Q4YuFdRN07k1jPFBqQpDed77tJ2CxUJvu
 sxCgCm0yoqGzmITh9QcjZLI3076F7fIMqSRMONvYP+Kyk/ox2Z3ZuxUobKKjvO+bILg5xKBNUWl
 622x2VtFr7K94hFv3pCqDABA+hzZS3mCjixdIGmxX+wf7GcE4MlRKKYE9WKPSY45Gai5JEm0Qkh
 wU87fW8Bv4RVkoM4eRkRxRC+KZHmj/cLb0E92/OUxXumVcz+HoPR4PmYoPLqZUSSpsGz7vArB7u
 kEMOCtLY/UOlJ
X-Received: by 2002:a05:7301:9f16:b0:2b7:103a:7697 with SMTP id
 5a478bee46e88-2b7c86de267mr441066eec.5.1769748181591; Thu, 29 Jan 2026
 20:43:01 -0800 (PST)
MIME-Version: 1.0
References: <20260123172007.136873-1-gary@garyguo.net>
 <20260123172007.136873-2-gary@garyguo.net>
In-Reply-To: <20260123172007.136873-2-gary@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 30 Jan 2026 05:42:48 +0100
X-Gm-Features: AZwV_Qj_-wgMBEbWmC10rmMhLTHVkB67ZjYZ6I0qc28vA0AXyDmBACdkWBHHb34
Message-ID: <CANiq72mRsFcq5iRk4no2wA0GLmziiPx=WnGQkouCfZ3yWzcD4w@mail.gmail.com>
Subject: Re: [PATCH 1/3] gpu: nova-core: remove imports available via prelude
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Daniel del Castillo <delcastillodelarosadaniel@gmail.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Lyude Paul <lyude@redhat.com>,
 Timur Tabi <ttabi@nvidia.com>, 
 Shankari Anand <shankari.ak0208@gmail.com>, rust-for-linux@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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
	FORGED_RECIPIENTS(0.00)[m:gary@garyguo.net,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:acourbot@nvidia.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:delcastillodelarosadaniel@gmail.com,m:joelagnelf@nvidia.com,m:jhubbard@nvidia.com,m:apopple@nvidia.com,m:lyude@redhat.com,m:ttabi@nvidia.com,m:shankari.ak0208@gmail.com,m:rust-for-linux@vger.kernel.org,m:nouveau@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:boqunfeng@gmail.com,m:shankariak0208@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,protonmail.com,google.com,umich.edu,nvidia.com,ffwll.ch,redhat.com,vger.kernel.org,lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 894D2B7225
X-Rspamd-Action: no action

On Sat, Jan 24, 2026 at 6:11=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> These imports are already in scope by importing `kernel::prelude::*` and
> does not need to be imported separately.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Applied to `rust-next` -- thanks everyone!

With this last one done, this series has all been applied.

Cheers,
Miguel
