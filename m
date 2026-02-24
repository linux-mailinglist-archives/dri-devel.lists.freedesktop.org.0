Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBB6AsXNnWn4SAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 17:11:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 526761899A7
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 17:11:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61AB110E5D6;
	Tue, 24 Feb 2026 16:11:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="B7jIwXi3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com
 [74.125.82.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54E2310E5D6
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 16:11:45 +0000 (UTC)
Received: by mail-dy1-f178.google.com with SMTP id
 5a478bee46e88-2b867142b07so367653eec.0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 08:11:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771949504; cv=none;
 d=google.com; s=arc-20240605;
 b=SDW99uMJMunoAmh22gqEkwrndjG6wYDaTFR1rrSGImd1sPVrrTnv8HnKiWPqHw59aA
 +tbfFgC08hFRkrKhQFX76eU8Tdy7sdsCSfHAGyknoOZ9Jje8Nkc8/cV67A3aBMbo/aK3
 daq6jJ/MSvKFL5TjmWoRU43A17ZAm0Q+5WGpvTCF2jXLQWpxvueufL6vTyyopqmvq7Ao
 OhgeXYRZYvPAIU0TUcNSlLoIPlgvpzKHQNv4Xqyo9RRNWASENQ5t+Vs5oJ0D47IEthRs
 UR+PTroaTQAu/Lh9d8QdzioAPUzuLFxMapu6LEt5ljuhT/gKLbqFhUrdOJp0OTbpmUIb
 yWZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=jur4r3URtRbpSYoqkV+RmME32+E9scyKj4lZV3ZmeDA=;
 fh=LMpvod3jzhbJMLUH9gnr9nnALe+swfd+0rnCh0J3de4=;
 b=Wcl2JwRpdYiynktTlqFmWqL5DI/ywsDazXWyHziW0ijfVxIsUMalh/BRBXHy19tDk9
 m3KP1CEq9m4rQZ2AnsGJrX1C8JDOHL38DLRouPX6mfWCo7Z2FPDN9GvMVfULEpxI9XHF
 tHueRCl5NQrG+FMFrBqOKgWgZoQ4t0hnA+VAnMvkZKIe3tqiOHEEkrCcSMGSL1gl0Osf
 zheQYxaHR+ND6LpVoWucGBqbDBH2AaEIYqtTL1bdey8UK7GWwO0p0ZwVnl43z8EjH2o3
 1SKFF1Typ3p+kemv2L4Q4d7EoxTsED7IZq3ar6xZwVYhgYYydzQhSce+VyLzxKitZPXY
 Mekw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771949504; x=1772554304; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jur4r3URtRbpSYoqkV+RmME32+E9scyKj4lZV3ZmeDA=;
 b=B7jIwXi34Wcy7oAbxTMk+nRuhXiKTl9SQeo04BRy5PqU7pT/Zwn13QL8o3/BO6/V20
 aytPKzxERMP0hcjVrRbbMCl033SBtYzexxNKiPBiVni45o/JoyteX5kKZRz1KY9ZQQPt
 e+weRwoFdxIz1PL/qbyoUoigDJsyg5atb6Pw3CJoWKFoXbaR1/5gt9ogCsZPLMsA3ZoD
 zbuiorIrPku1njxG8c0y9mlMpJVyusXe9EklWswq2XCdpgx2tK8pw8JuggjezlzIN4jx
 OcuNkm2btOTPxrxQ8X4uH3tQ2qovAh/cxWs5q/fuAbOM3yvstwmrp4jobn36eGWFs95e
 xdAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771949504; x=1772554304;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jur4r3URtRbpSYoqkV+RmME32+E9scyKj4lZV3ZmeDA=;
 b=C3goMVxMYVWwTndTARQ2+YTzEcpR9kjOAs2L61OEUJ56FX/Kq42fXE2ocP8jpWABnd
 2qEAsZbUTkllKWKuGVm8D/kXSa9heWtKnna/OjXv5FMD2F6EzTqbmS4fGhazzkvWoA6g
 HyX8lro3scBP3dE/+ygeX6KkpoythhDR38eV7PkpAFMZ4AYGryBDezNOq+v/eFZElTHi
 GXf/FSJ598Ku2USNuhAOjpCSWa9OaRQ9SdyzNzY/TYRlepz6rTb+NCwBD/jkWhHR+LV6
 dkSJnZwfZTNL2ggFSLfgqfnmem70PtgIYK5vum8k6469SFjo7XfxEziFYgbx6xz8Pn2R
 Q4lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjtu3hqhr/vLTFx4smjnpuzHXFKnPB/MIxgWQvSHOe99+VQBUUUUL0lpgUSnJ+Uma/6ZJe4YwVQyg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCRW/d4Dg5Hz9QFVcVPBLW2WMKbHFxdNbuG40axVsmiklSz/+p
 M1UR/rb0e7MaSPUO4wtAhmeix4oGzrLjudKulaXN7uB/BRLPEa6ubcdpDIPITnuZjQZsrktkxhy
 3wPO9zm8oUYs7Bu7M0I46hRpuWhyYVbg=
X-Gm-Gg: ATEYQzxH7ze211Cg3cLuuAgO+tgnOQh1zzBJtSzdwL4mZJB032vUc9mVk4H/vjCGb11
 xxtZSlWq/+Ztz0tEPKOxDYDL5v6+bHMtFoOz37FK9GUzeFybE7PRxHBnojMUAQrS2T2dAuvVNXX
 AW7qXoIfpu4XDv3/NZDu0EIBs9WlmAp1Ytu4TnbU6VRN7QTra4OlJ5TDvotog4d7Su+S0zoK1Zd
 yXuMPA9laS2iRlTHLYCNe7ULgA3wT0UcmRwkhYsAip2/3o9Rewl/31TwgdjoEgexTp5uAjiNeng
 lJUjouJKo1Zl2T6GUNq6u6ezc8p6IOxrbu3EFU6vQ5LAdyW2K9Ewu3uNohqM8KCSs7dIiyn+Yko
 JoZJpWWbRf4uqAQHetR8lCi/MWumt
X-Received: by 2002:a05:7301:d8b:b0:2bd:ab6e:5d44 with SMTP id
 5a478bee46e88-2bdab6e645fmr740559eec.3.1771949504264; Tue, 24 Feb 2026
 08:11:44 -0800 (PST)
MIME-Version: 1.0
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-6-joelagnelf@nvidia.com>
 <DGJN2M93S4ED.3272CCZWMRYOA@nvidia.com>
 <a7be758a-65ee-4572-b8ba-6d4a8d65af73@nvidia.com>
 <CAH5fLgicH9u18pWYYkQqxZBT8WEig3bDP8JFT9VfDtG6McijQw@mail.gmail.com>
 <7cfaea1a-52aa-43ee-910c-7fa09c7f0f4a@nvidia.com>
In-Reply-To: <7cfaea1a-52aa-43ee-910c-7fa09c7f0f4a@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 24 Feb 2026 17:11:31 +0100
X-Gm-Features: AaiRm504WJbcYujrI1qvWR7vQ77IFqUSflxWGLgVRz2-WrhyZR9I3tHBCXfzaRc
Message-ID: <CANiq72=B_Pyg+yFkEv+wq5JZ_qmvKjEaPXObrLDHo4KYO2H9pg@mail.gmail.com>
Subject: Re: [PATCH v10 5/8] rust: clist: Add support to interface with C
 linked lists
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Dave Airlie <airlied@redhat.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, Nikola Djukic <ndjukic@nvidia.com>, 
 dri-devel <dri-devel-bounces@lists.freedesktop.org>
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
	FORGED_RECIPIENTS(0.00)[m:joelagnelf@nvidia.com,m:aliceryhl@google.com,m:ecourtney@nvidia.com,m:linux-kernel@vger.kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:dakr@kernel.org,m:acourbot@nvidia.com,m:airlied@redhat.com,m:daniel.almeida@collabora.com,m:koen.koning@linux.intel.com,m:nouveau@lists.freedesktop.org,m:rust-for-linux@vger.kernel.org,m:ndjukic@nvidia.com,m:dri-devel-bounces@lists.freedesktop.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[google.com,nvidia.com,vger.kernel.org,kernel.org,garyguo.net,protonmail.com,umich.edu,redhat.com,collabora.com,linux.intel.com,lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid,rust-for-linux.com:url]
X-Rspamd-Queue-Id: 526761899A7
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 5:00=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.c=
om> wrote:
>
> Ah fun! Ok, I will add it in in. :)

To clarify further, the reason is that the crates in `rust/` may (and
do) use more features (which still need justification), but the rest
of the kernel is restricted to those in that "allowed" list only.

  https://rust-for-linux.com/unstable-features#usage-in-the-kernel

Cheers,
Miguel
