Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IJsGg3bdmnNXwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 04:10:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C893B839B8
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 04:10:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27F6810E1A6;
	Mon, 26 Jan 2026 03:10:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="C310f6C4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com
 [74.125.82.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B87E110E1A6
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 03:10:00 +0000 (UTC)
Received: by mail-dy1-f182.google.com with SMTP id
 5a478bee46e88-2b701d29ddcso146781eec.3
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 19:10:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769396999; cv=none;
 d=google.com; s=arc-20240605;
 b=cawYmi3oRg0asesA/B7zlk49pqc7YWiUB/DBkG9JtNFJR/oWyiAClwdLp/1Ez4+Img
 xQA96FtCY+Vz1zAoEK/D1aL1GhD/QFuBCCNmfHWpBvp1lKnH1bhMqZcQyXRghkCgidBf
 B+Q1cx1TSqbihSFcMXy8TBlAKxH5kh2iqXL7twTgY4p9AmNVkKuHpSSEEfVd27GfMpGS
 Hm8YsWLsdyoIF2m72wtXxVVK1BvtnOFf3bGEfNgylkm7xCYc9NucyhQCrTc23xe5DpKt
 slL75viDkUyTLJkA0wV6xhsvdaB8srfc34ixX2NJpn6dgObEsT5rC3s/DTYCovr7r5O1
 GkmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=aGkhlq+qSUrzulxWE4fwqd45d5ACCtLmrPVp1WG8FY0=;
 fh=Eg8H+mS3BMr5CDjrq8buenyjlZWCXHgmLV64FuUhmxA=;
 b=Vf5CMo0ncC47Eb+uRvLYGHnnmEesxDHXyhZpG5NTu2VFXj4GEPGcbveOpWJE8cb9Nf
 Pf0E/Aki6UE9bfYC/qm2voVHxzGS8puo9K0z4YeZC3CqDOC9A9w3yfuxXBLfaR/Bsi6d
 QX3NMYKeQ2OQ8W/WbsaiZrZrL+0RkCexSp9hNAaHmdlqV/ZGRdOYh8Q2M5mwK/1skb9G
 tTp+mk1DQJUvLzGa/VR+ObGoZ57mJCAY15JrpP9KQcun7SnUyOIoHxhmS8Vm8udrehlV
 ealogjTsici74gF+mej2tjQwWps+cnY+ujZ5/jm3B/xRRnahKHv1Yy4feNAt9spU9791
 BX7A==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769396999; x=1770001799; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aGkhlq+qSUrzulxWE4fwqd45d5ACCtLmrPVp1WG8FY0=;
 b=C310f6C4zldHtev++o4DDhYlmrjz0MRE+Xj/ClZh3tf9Bmtj7c9Y2LTGDMe7GxOM25
 5zCFPVMgDp3VmltRKM1YQpXZ7IQNF/awE/VcbbrA0EyELpMJvlCCXx8B5eCtnn20M+Y5
 v6OOYF6zmXl8IcuctTB+3vx3fxGuQnG+A0PLC8JF3Lg5fj31Qp3hQ7gy94LKq4eUhWKD
 GyzG/oX8R1VHAfEbskAGc9u1/9Vf7PvVb41VGLU7iiC8w6yR3yp+bWk/GwtnwvdkRFwT
 GeUoBw83xnJvvCEsHFE/9Zzu5Qn/ntOmPSQdZ7B4SASmTJz0iwnNNesNXfuerLnuJooU
 wjHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769396999; x=1770001799;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aGkhlq+qSUrzulxWE4fwqd45d5ACCtLmrPVp1WG8FY0=;
 b=fk3EGkZBaEXUF5U9gqHv0HfmY84pgoKpvUZVcwjBAVqoZxkOxJpiS4YYWGkC49vILB
 ZxtaMuzAsrzVHs/G6A4K9eHDSShTdFWF4eXYg8O/5FKWRVUR7wJQ/v+CPAzoX98FXtIa
 9SMxmiCB+An9N5qW77BiZda3oDCgO4/yzaXwWADXV6rsdVQ0zUnZ92P69ETMFt65+/iy
 v0BNT2M524KfhVVd7OTnhuYZ/IngKm43BQWXUnO9UEUMPT7cjk2Ax8X67UDIt+qQXEyo
 9OmE9GsShn8RO4/XVnmFXrp+eXl9gpSjQ1t7md1jeMrxDyKS4NfbYBQX6jq1NFComdNB
 EzSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEMCtTABLOOOmHF/vIuTbT8Vo8agbad8KkDTvV1V60Ch3SbvfIrhuBxDpKQJLRub/LxLXR48QemLI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxdaBB9dnlLx6l65i+7uFx8ibJS8/bQ4mjcue5ji4Lhig+P8O0l
 Nh/H9VyyuTp0tl4z7oPU5yIsyCDZn/FDKavQma60mkaDtb3ZOuKZjA+q8PDQKN5mfybhXVfaxJX
 kjxETcWzg38x+AIXRBQD6xQ1w2eSMI/E=
X-Gm-Gg: AZuq6aJHUyABR13KP7dY7ikhXl2SG4G3/znN1jVgZpqcJSfIkLM9ApLN46ENTKosHQA
 E1/f5BZ+R+QypnlhEoMSvYgSjXmtUzXr+NmyHZkn9UiD4sTw4yAsQQ4DPbzam1j3maxQIFY2sq/
 gL/dcRDbRpvscMsID632k2b/TkgN+c5wOVvcZwERYrEFAEnRfxUR44Mi4YKXaBiLR+86qkl33PA
 52XureFkbJBJ1B6wu3/ILTTcf5E84s970v0TuFg92zSEaAUjb1sWBrfghOz8v2ou5v5+SJTeC7w
 FmQScCjBsPEtjua3D8B8PAdxeTm0X4Ou7xNRKc5/u2gnb/KZyEvVv/k2I9ew9alMpXDqDfXT+om
 np0ykBo66W96Ub0/UVHpnphU=
X-Received: by 2002:a05:7300:c99:b0:2ae:5bd5:c241 with SMTP id
 5a478bee46e88-2b764525613mr694128eec.7.1769396999486; Sun, 25 Jan 2026
 19:09:59 -0800 (PST)
MIME-Version: 1.0
References: <20260124160948.67508-1-ojeda@kernel.org>
In-Reply-To: <20260124160948.67508-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 26 Jan 2026 04:09:47 +0100
X-Gm-Features: AZwV_Qj3CR4N7SBnnpnodYCqhXQ_XVvQxGRUJ728I9V7kk_y48uevULv4kIV_F8
Message-ID: <CANiq72=3+==Px50E+EA0fhe3pxVAGzRRt+6d+qze3cdeEBjyoA@mail.gmail.com>
Subject: Re: [PATCH] drm/tyr: depend on `COMMON_CLK` to fix build error
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 Alice Ryhl <aliceryhl@google.com>, 
 dri-devel@lists.freedesktop.org, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org, stable@vger.kernel.org
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
	FORGED_RECIPIENTS(0.00)[m:ojeda@kernel.org,m:daniel.almeida@collabora.com,m:aliceryhl@google.com,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:dakr@kernel.org,m:rust-for-linux@vger.kernel.org,m:stable@vger.kernel.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[collabora.com,google.com,lists.freedesktop.org,gmail.com,garyguo.net,protonmail.com,kernel.org,umich.edu,vger.kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: C893B839B8
X-Rspamd-Action: no action

On Sat, Jan 24, 2026 at 5:13=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Tyr needs `CONFIG_COMMON_CLK` to build:
>
>     error[E0432]: unresolved import `kernel::clk::Clk`
>      --> drivers/gpu/drm/tyr/driver.rs:3:5
>       |
>     3 | use kernel::clk::Clk;
>       |     ^^^^^^^^^^^^^^^^ no `Clk` in `clk`
>
>     error[E0432]: unresolved import `kernel::clk::OptionalClk`
>      --> drivers/gpu/drm/tyr/driver.rs:4:5
>       |
>     4 | use kernel::clk::OptionalClk;
>       |     ^^^^^^^^^^^^^^^^^^^^^^^^ no `OptionalClk` in `clk`
>
> Thus add the dependency to fix it.
>
> Fixes: cf4fd52e3236 ("rust: drm: Introduce the Tyr driver for Arm Mali GP=
Us")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-fixes` -- thanks!

Cheers,
Miguel
