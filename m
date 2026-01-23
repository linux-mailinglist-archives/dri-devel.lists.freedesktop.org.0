Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKEVLGeDc2kDxAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 15:19:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD6476E6E
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 15:19:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD0BF10EAFC;
	Fri, 23 Jan 2026 14:19:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Qmp2EdBd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com
 [74.125.82.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D783210EAFD
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 14:19:14 +0000 (UTC)
Received: by mail-dy1-f178.google.com with SMTP id
 5a478bee46e88-2b703e04984so130131eec.3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 06:19:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769177954; cv=none;
 d=google.com; s=arc-20240605;
 b=HFH8NMyxZXs1+IJHl5VavsWT3Ds1UZMyEwSjAoG75J5kZaxb2EBekdJ9/QZVmLZ2ts
 7pBF00a3H9lPtAk0Gp1PHcFEJG9WpbzSWokNLdCAGLSt+1OMqSA6mIn0+bmBxRQYGtDQ
 n3AtSHIoF8gSuq7pSokIfTpqgth1GbvaSo4KtShO5mlQ147gpo1YQ/T5Vi/ahjyp2eVK
 uExSXXBo4PjpvMRjThIuj86ZQfKutAQZ8lSDi4sukW12ssWGiGRQWLjx8V+VAtjpb987
 NZwD3XeQX7X2c8rQT44Qcca9wW70T0h01pJ2rWlXuv11+sZe2OnZR8GtDkoE8fi8S+sH
 N0aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=YGHC4awsoSa/dRJGgbn4zkLgLCUO/JGIDvPLTMMvbKA=;
 fh=31UJmiizGVB6wBRKrekiE9FpJwxh6aLH6SuiYzzz10o=;
 b=ecNSX/dmmJvD6c+3fFhYru4CRu4SX5MVepvhm2WRzLSFZisX2MeA/leO38VtvsZzsM
 8cgrL9/OlyLuus5R108dxP8CPaFt1RjwEX23pAkP09+riiIlDHzUdnr5Bm1wKwMbTRKm
 kLITvPqB6MDIPoCaLDXbVNjeUAVrghJuZq0UaHL3izwN4JSGwMJWcXmeGUJ0XMvtGjGQ
 4d7BYU1htpifFQXww3rQGsfd1GrRziwuZ4gPp3xbuLSrW8aKSd71cnb2Z1nZaog77BtE
 rtaKUTDB7k+TNOSoZJOBc7Bn5VNfSs0BOGgAnmxEdnkKi1VFU6StjFhTDySaw3zSEMYo
 SNww==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769177954; x=1769782754; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YGHC4awsoSa/dRJGgbn4zkLgLCUO/JGIDvPLTMMvbKA=;
 b=Qmp2EdBd7IDCmBYQzgmXDAhlA/RSPWAKuLmuxhU4DO3a+HybpBVHPy/jVEO8onZc2k
 QWYy0HJNMIvgNPuZ5Cxi4a0iQg6yShLfoN2PARsbJLjowBTmCuFX6L+qC0sGPERhNb3r
 Oqmpq9fAEyhLiDZ6KGu+N0wW3n/j7BsgcKRb9Spk4X2BXkhJuGQ7cV0jKlP9WTvt6w/6
 Z3nHYkYTkMdGDhnYB/lRbahdlEHl1zN4ySGHkLkXH5YPONcqz7q0ty7T5NtDImW4a9My
 p4iNFi3FT6aYILBajpychgGT10jdK28wOEpQUanRgZMv0s1V6vLKnjbwhHsnAajkmXc8
 4FFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769177954; x=1769782754;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YGHC4awsoSa/dRJGgbn4zkLgLCUO/JGIDvPLTMMvbKA=;
 b=s/uxtMxvCwVlAjYDdUVj5oIs2JfrHuiOuwlGeVZPgAFT3o+jaZtmwHYhSNJeofX1F3
 DdqN6X0WiXRWp1Lmx89TgfexpFwschOCJGOqYzhG4V5w0bzwKh8MnfuPNOKcxk21kYeL
 nJtrewTDwsu7E/+egsu2o7z/yterNiskFjIg7HKrpllCogSeGhuqfLzalvNpk8qBHWqP
 3uQP+CIbFwEP1OcncUSeIHw/1Vny5gF3jgX6MjL7ClyNaqJmojzrtnmtAZRs66nkuydW
 ig+Z4mzkrkY4BdSDBTuKNEY/sve0no4RpYgbP9mLXYNgYs4kMV9e57IWMnZuw9eVXrNx
 Rk6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUF4fLOYVh+bSUdiFyavgHdq/sM+BPV4/7XBm5WfAOutzbVRxRhMg8WAIvLm2g9t78GlBRGs2BWt1I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSIL34IcbwDDvPYMM8X/VmEqkOXE44sbtxOJrSJujmRD15XsO9
 GBTmTWoKRldaxJnPnFBxllTzNxoujbyiYx4Pb2fafufoV4APulSughC8WmZRHj+pfNaPiEwU2Y/
 x1QreTnzb36trHt8rqUcoqd7bEyHdJ1s=
X-Gm-Gg: AZuq6aKyZxmE2PoRbykxPTU/5l1u3fPieR84IiF4o9/QsCQSwsRtW5g5Q9/Kba/aw8R
 h0p2XavxRtFrfuApdKe5fzL5lkVVWc3gbaeMg8VIwuWUyoCM4JjhGwZ71J7R7UpU/1TXbi8iyGC
 YwDSoEqtfYdPeVb+SISGrmiHJV1FXWCcolg546/orB7v6Q/v2kRSbUsoTw2W40NrkkniSuwBMQz
 TV7v3MuL2YyTNUz/Zw5SkbFTmA6ahCUzzGer4ZarwhMxf5acb/u0Q1iIyvl8usOo/JIy0ifiyU2
 Pe8kn+2KJuuSkBqaLZ0MRUuPQZOPx3Z22NxfXwcfSfik3zuhco08HBYmjNd5jSQkoABGdD6u/Wu
 nLg+WHeQIWnMg
X-Received: by 2002:a05:7301:4e0b:b0:2b7:3835:21f0 with SMTP id
 5a478bee46e88-2b73995f4f0mr880908eec.2.1769177953953; Fri, 23 Jan 2026
 06:19:13 -0800 (PST)
MIME-Version: 1.0
References: <20260122-nova-core-cmdq1-v1-0-7f8fe4683f11@nvidia.com>
 <20260122-nova-core-cmdq1-v1-3-7f8fe4683f11@nvidia.com>
 <ee459198-04f2-4bae-8e1f-4ec413d92f89@nvidia.com>
 <DFUUVM5M0MYA.36CL66OCAICDA@nvidia.com>
 <DFV0F28KHNXP.3JU1QGBJCZBUQ@nvidia.com>
In-Reply-To: <DFV0F28KHNXP.3JU1QGBJCZBUQ@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 23 Jan 2026 15:19:00 +0100
X-Gm-Features: AZwV_QhNDrz0erAn3-OGI1WooCKBr-7Jq3HMbGGFubBIWd3KYSPpgYNkX9koyGY
Message-ID: <CANiq72ksbD57UDweA8Y5-635fBMcRb-mPnzZtdQ9yv86xUNkCQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] gpu: nova-core: gsp: fix improper handling of empty
 slot in cmdq
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Eliot Courtney <ecourtney@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, John Hubbard <jhubbard@nvidia.com>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Alistair Popple <apopple@nvidia.com>, nouveau@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
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
	FORGED_RECIPIENTS(0.00)[m:acourbot@nvidia.com,m:ecourtney@nvidia.com,m:ojeda@kernel.org,m:aliceryhl@google.com,m:jhubbard@nvidia.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:apopple@nvidia.com,m:nouveau@lists.freedesktop.org,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel-bounces@lists.freedesktop.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[nvidia.com,kernel.org,google.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 1CD6476E6E
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 10:29=E2=80=AFAM Alexandre Courbot <acourbot@nvidia=
.com> wrote:
>
> Would be interesting to have Miguel/Alice and the core team's opinion
> on this IMHO.

[ Re-replying to this so that it gets saved in the list. ]

This is something that we have discussed back and forth, including
making it way more formal, even using special notation, etc.

Please take a look at Benno=E2=80=99s proposal at:

https://lore.kernel.org/all/20240717221133.459589-1-benno.lossin@proton.me/

(He may have a newer link)

Cheers,
Miguel
