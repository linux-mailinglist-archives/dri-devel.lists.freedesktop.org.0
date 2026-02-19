Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MH2MIMfPlmkZoQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 09:54:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFBA15D21D
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 09:54:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8A6A10E07F;
	Thu, 19 Feb 2026 08:54:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="haRxJfuf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8BB110E07F
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 08:54:27 +0000 (UTC)
Received: by mail-dl1-f43.google.com with SMTP id
 a92af1059eb24-127337e3870so59766c88.2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 00:54:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771491267; cv=none;
 d=google.com; s=arc-20240605;
 b=fkWfiSsTZvp4AfIYujNavyde5geQ4u/nZxeinnRjcMmeDGySverAEkiaSJgMT9Wd0x
 2PgYb3WHGky9hbrcIth0Pti70aOkUliuz/fD2dRhzFw07Bwkb35PksHALSe9qR7nbtqU
 SO9RH0oKpVSho/ihyBmzFdRAFvhJoX3brGrQ2/UkhsAOj/W5GqMnrTVOH5k2SukMoUa8
 KjhJec1Gko4VoxgcBkyOJOWFiMljPm6oXc/E3L32pJyIBGgzYP9GtnlfcGqdFlRvXinF
 iUpdH+F/kt6DqnyKtEZ2Jmu2PuqVK20eOM5D2NNn+vVDxCKkyhd0bMOtJQXs1avsfHyb
 CYjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=g8xC20PjlQRA9OqDEMwSqMg/DaSzTbKRCj2DbPKEt6Y=;
 fh=Ub2oaWGh8Tql6o/mSFgxoZHRkugEaSohNxewBq9kpOM=;
 b=iYrdB892Y+HeaHOjTEhGzC9VPT9GJIBGMpEYxpCNEVDPfuBPqDzGDUlI4PAweXzLaD
 2MUNCoPj3+wioRSYQ69u56U0GMP1APRZ0BOMHBWFxzP3gbgnlWcE9T1YeLspTZaYMEji
 c3fb9w1UiRAQgf5i7YJ/hepVwTEpkebRtrtn7uVaA/Tsx3ZS15XjEhNxUfsKd/Apy0RZ
 yRfN61CT++6ZdXUDibcKuMb3eOmLO39SxVtsirw3cDkP2cs4Ml66s2GKJCcLp2E1MwRW
 PtBcO/SzrCzPRTRRHMC3p5TGsnzomMXbagAEo+DDBBKYDhH5S9M+oP21LK8Y50SgwVID
 4riA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771491267; x=1772096067; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g8xC20PjlQRA9OqDEMwSqMg/DaSzTbKRCj2DbPKEt6Y=;
 b=haRxJfufUKpgOvV5aqze50H0KAWrI8iQ4O2fc/qzy6AHLJ2kjAdH2SeR71FuRlmZYq
 dmgysQI5WO1wYA2rSYNWmqkb7Hfgh+gy2mdi+KF+miYfv4Al6BV0wTzobyrb5cTxlymq
 SMn/USHwkGi8/XGBe+lQH/Ww2TVCQ9k0MN5b9tZLLLTHRcXpi6JTdvvvt1pbpLIXHdpR
 qNeicDoJv6hdjS4XhdwHiYtA3hLMQeSzKsTlZs4kGr6x7+/qFLIiscPiU4TpANWQnh5g
 vrlQZaaZBpZ+Fc63TM+/nkkz5RfiKcHiQA9tQaiESNIOAD3lI0pa+6e+csku63yg9hRJ
 ZBYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771491267; x=1772096067;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=g8xC20PjlQRA9OqDEMwSqMg/DaSzTbKRCj2DbPKEt6Y=;
 b=UdtDurQ0ZZ15+mrmiinE7H7qzSAJQGsdqAsQa9CYfqUTffSrpv6sYGRjgFpW2Yw4tl
 UwbPC8MaF7o4pFrSqFLZKiGnzkju4D62WP8HRDtnVzZCrpWJChX5Y6qjX7oj1SFdRPSh
 1DP0vErDRBhcbBqibXzcGm3VKjb6CRs7AO+v6WsEJFIBK8/GfcwwyCnK1lezzFNEtkm8
 0p3YrTAA9VEtMFHl4QbmwHvAretrcZx08UseGhBcAjBQKeXO2+wsFRkD7yk24Idpjeof
 IozgcY7XjCXHYl4L/SsD67mMxbf0l1cTAYezY6tfRuY5UwqaM8gaEs79V3FN3lCifoM3
 hCSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqQOR4yBBru/9jFckHywRFTYahUjoP+2yEIamIfPxEm3VKD1sfRIAFEsAqRgpil/+IrtV7ZWfPkhA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyoEhnxMeVX3Eg59kP2L8tR25eQvL/+NFxJqY85D+TCvPK6DDPy
 kg19zvw+NJD/IehJgjdUbyQ3Z8doo//4Xf3GvcIlI9H+pat1t5JIs3BhTNcrevkMlntznnZZc8E
 R+oAInRWGYhPRu0kitwLcchOOLB7XCNg=
X-Gm-Gg: AZuq6aIf4QrY7Fbim8W98a/Pz/RyuoCuzH5PLfCsg0j4iLxiQZGbBZ6SlOIHtL1TLkR
 saQx2361n3LHiW0QvDGuS6O3kU6YsUwOs2jljUKfOTaXSOi3uKuH3DY/e/TD/tGTcYuPLZaVJ/d
 ijHGiON9XNEEJ+6kDIiZb1nEBtckCvGESvh/xe9noshGWM7aF7JJkwSxvi3fkDTzwwe5gIfgcvN
 UEru8VCA8/okbXY77l7Nb1njsPi6CO8mQrsBRccIR90g5a9ZzgHmwnnYiH4TSt/7rSMWFnbbKh8
 jLPTM5Eykd/zcH6kGEJs8NjiBKUDFNMIE4f0hhK9Ri002VXAKm9esOOXOYs/SKxZZzI3YIG/0rZ
 C6/bYmmIRQcEWit+A/U1cHgPd
X-Received: by 2002:a05:7022:419d:b0:11b:65e:f33 with SMTP id
 a92af1059eb24-127397d8800mr4979968c88.1.1771491266834; Thu, 19 Feb 2026
 00:54:26 -0800 (PST)
MIME-Version: 1.0
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-7-joelagnelf@nvidia.com>
 <DGIOJQC5HEAT.262OM2KS7C2HE@nvidia.com>
In-Reply-To: <DGIOJQC5HEAT.262OM2KS7C2HE@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 19 Feb 2026 09:54:14 +0100
X-Gm-Features: AaiRm517O8N5cgdFr-9hA2xKEEuwUHYT4nDXwLjBAL8577hK96CpY5pCEg8UfyE
Message-ID: <CANiq72mH=sCfO8+HnVp=m219b3drWZbqUWE=NJn=M3y4ng3qXA@mail.gmail.com>
Subject: Re: [PATCH v10 6/8] rust: gpu: Add GPU buddy allocator bindings
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, Nikola Djukic <ndjukic@nvidia.com>
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:acourbot@nvidia.com,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:airlied@redhat.com,m:daniel.almeida@collabora.com,m:koen.koning@linux.intel.com,m:nouveau@lists.freedesktop.org,m:rust-for-linux@vger.kernel.org,m:ndjukic@nvidia.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[nvidia.com,vger.kernel.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,redhat.com,collabora.com,linux.intel.com,lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: DCFBA15D21D
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 6:13=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> rustdoc complains that this links to a private item in a public doc - we
> should not mention `GpuBuddyInner` here.

If you all think something should be mentioned for practical reasons,
then please don't let `rustdoc` force you to not mention it, i.e.
please feel free to remove the square brackets if needed.

In other words, I don't want the intra-doc links convention we have to
make it harder for you to write certain things exceptionally.

I hope that helps.

Cheers,
Miguel
