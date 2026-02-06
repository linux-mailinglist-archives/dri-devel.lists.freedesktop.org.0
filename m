Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id XiJdAdVkhmkrMwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 23:01:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B63C103A04
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 23:01:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F6D210E93E;
	Fri,  6 Feb 2026 22:01:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LyKqhM8U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 025BB10E93E
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 22:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770415311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OJq+3L+9JXeM+d/EpzttD24Fxa4gsnfHqyDX3jISKjg=;
 b=LyKqhM8UjgZNd/3nwMnKeaf17p27YvvabLTwt1GXHALJtZEapApBO0pmNDVvaddYciNZhI
 qPTIDZSakfKY5/yvfMWd+AeMySYDO0K7m5LEt59zNvl42HStFqCSI4gZ5igniDlN4K2Nmo
 JW30y3i9t5Fc8NBTumwaik8jTBWPC70=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-144-4_ATR6XYOM2MmnFJA6jfVA-1; Fri, 06 Feb 2026 17:01:48 -0500
X-MC-Unique: 4_ATR6XYOM2MmnFJA6jfVA-1
X-Mimecast-MFC-AGG-ID: 4_ATR6XYOM2MmnFJA6jfVA_1770415308
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8bb9f029f31so923205385a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Feb 2026 14:01:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770415308; x=1771020108;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5T5V4gT5bheYrPWddhGL53i3LiUJE9TPYRiptwUHacg=;
 b=VoDNWdABGFjWdCnG7qqu/H7iDHvyA4xb5RlMaRskvJuREtfiS9AddJ+IKtMdMBmqaE
 t3J7Qu35ZI+21y5Zc2B+5BBs5bqMxtQ6OnBjgYeKqJIowS/1B8Yf8rpVS9Mtp1ifCFC0
 1Ob5c4a6snVDO2HsE2zjmMPCcU1TNXvP2McPQtxpMCx8PemW5dkL/m9FsyVIo43o5DIk
 2p3VVTJoLENthwP1m+KRj0d1fEozbgW1eU8Qk0p8JRgt8Pm0EK3c/NM6WsKZ8rAfjTeZ
 lPon4IAEK5IXeShI0La+4fjyavdwRSXabHQjd5JFsGX+TetmyfKSA7Y+fTTZDtccJSCM
 jkyw==
X-Gm-Message-State: AOJu0Yw9Z3+5trGZ7RdJbEotUyBZe8zabstqexffgyx28ihzxzRO1w0B
 OHli85/TGSNXQHtPCOOm5b1N7YNjvpT8d4eA9pC5gkQVUfdokFf8u4ENFJx/hTAvESY7nMORssL
 t0oxdvP8Efc5x7iIHnq/gz10ArDJl5mfwdZVv/XWojZgAZhJguuGuRAuzkpFv/cf//uSGLw==
X-Gm-Gg: AZuq6aKsKnH4gau7012L9Dk6BmLnBuBTc5B4GKvrNNZEc1YCKBLlC5/ICgt5Iezdca6
 KJVDml6RC3/f67bJjUnqkvCnCNWzRpb7f9IdgzV6OBKyHdfIv+DHnk/IuiI3OI2Xr9sxX0Y1MFd
 piXbky9Fjvvi9u3AuDKtfno4mZgCGq1jfLUQioatQPFiFoAnfKLb7yTSAwkk4lcNIbPO9uexE2Z
 j+XMqdfoGjeXkkTRGg/AFE4ihmNjEgrI9G1j/eGP50fY7T3jUzlZnIT3nhfS3HfXE04IwhGXFxI
 L5M8dxrCI56CZsgb0SUmsHtl0AYcMSlilqoCnAqQ0mSSbn0TMxP5T+oBrgMGkSzBaeqTg+bdlXx
 EPPMvPw==
X-Received: by 2002:a05:620a:19a2:b0:8b2:f1cc:a14b with SMTP id
 af79cd13be357-8caf1bc9789mr525809785a.87.1770415308049; 
 Fri, 06 Feb 2026 14:01:48 -0800 (PST)
X-Received: by 2002:a05:620a:19a2:b0:8b2:f1cc:a14b with SMTP id
 af79cd13be357-8caf1bc9789mr525803185a.87.1770415307559; 
 Fri, 06 Feb 2026 14:01:47 -0800 (PST)
Received: from [192.168.8.4] ([100.0.180.93]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8caf9ee8662sm266205485a.37.2026.02.06.14.01.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 14:01:46 -0800 (PST)
Message-ID: <6d37ba2ccbe02fbc093c8e9b1a765c7791e47628.camel@redhat.com>
Subject: Re: [PATCH v6 7/8] rust: Introduce iosys_map bindings
From: lyude@redhat.com
To: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, Daniel
 Almeida <daniel.almeida@collabora.com>, linux-kernel@vger.kernel.org,
 Miguel Ojeda	 <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng	 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron	 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Andreas Hindborg	 <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Greg Kroah-Hartman	
 <gregkh@linuxfoundation.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Krishna Ketan Rai
 <prafulrai522@gmail.com>, Tamir Duberstein	 <tamird@gmail.com>, Xiangfei
 Ding <dingxiangfei2009@gmail.com>, Zhi Wang	 <zhiw@nvidia.com>, Matthew
 Maurer <mmaurer@google.com>, Alexandre Courbot	 <acourbot@nvidia.com>
Date: Fri, 06 Feb 2026 17:01:45 -0500
In-Reply-To: <aWkJYyNds5zWpgYE@google.com>
References: <20251202220924.520644-1-lyude@redhat.com>
 <20251202220924.520644-8-lyude@redhat.com>
 <DFOP5BY09539.AFY5L5FV1HNV@kernel.org> <aWkJYyNds5zWpgYE@google.com>
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: v7HD1Wfz86P7tZm8QZlS5I7Vtd-rWjbvLJCz6LMTlWQ_1770415308
X-Mimecast-Originator: redhat.com
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,collabora.com,kernel.org,gmail.com,garyguo.net,protonmail.com,umich.edu,linuxfoundation.org,linaro.org,nvidia.com,google.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[lyude@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_RECIPIENTS(0.00)[m:aliceryhl@google.com,m:dakr@kernel.org,m:rust-for-linux@vger.kernel.org,m:daniel.almeida@collabora.com,m:linux-kernel@vger.kernel.org,m:ojeda@kernel.org,m:alex.gaynor@gmail.com,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:gregkh@linuxfoundation.org,m:viresh.kumar@linaro.org,m:fujita.tomonori@gmail.com,m:prafulrai522@gmail.com,m:tamird@gmail.com,m:dingxiangfei2009@gmail.com,m:zhiw@nvidia.com,m:mmaurer@google.com,m:acourbot@nvidia.com,m:alexgaynor@gmail.com,m:boqunfeng@gmail.com,m:fujitatomonori@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lyude@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 4B63C103A04
X-Rspamd-Action: no action

On Thu, 2026-01-15 at 15:36 +0000, Alice Ryhl wrote:
>=20
> The trait approach generally requires knowing the target type at
> compile-time or paying dynamic function calls, but my understanding
> is
> that iosys exists because you might not know which variant you want
> at
> compile-time.
>=20
> Perhaps we need an
>=20
> =09enum Iosys {
> =09=C2=A0=C2=A0=C2=A0 SystemMemory(...),
> =09=C2=A0=C2=A0=C2=A0 DmaMemory(...),
> =09}
>=20
> and implement Io for Iosys in terms of the inner types.

So - I didn't see this comment until now however: I personally think it
can't hurt to have a wrapper around iosys_map simply because it makes
it easier to pass back and forth from C APIs, and the other sideaffect
of Io is that it's extremely trivial to implement it for the iosys map
bindings.

The one downside I could see is that I added C helper functions for all
of the iosys map read/write operations which means they aren't
currently inlined. But iirc there's work ongoing to allow for these to
be inlined so I assume once that is finished there shouldn't be any
additional overhead from this approach.

Anyway - will send out the new version in a moment
>=20
> Alice

