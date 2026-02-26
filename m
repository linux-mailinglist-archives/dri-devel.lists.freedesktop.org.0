Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LUcJwVToGnriAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 15:04:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BF61A7307
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 15:04:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D875C10E0FB;
	Thu, 26 Feb 2026 14:04:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZHUsfWUb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B5C510E95A
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 14:04:48 +0000 (UTC)
Received: by mail-dl1-f53.google.com with SMTP id
 a92af1059eb24-1277863a912so70527c88.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 06:04:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772114688; cv=none;
 d=google.com; s=arc-20240605;
 b=ESk+SHgMtyvFuHlYeo93tTG+Gf/WsPN8MGlhNPJ0xAVoZk7Eb32i/UbTiL5cazv5cs
 gl0J+kt7aNroozm8OqVauDOMNrYrCJ6Fp2z7btg2XnBBK9yGGoflnVGH0A098LlJb2D6
 fMpp/7CJ/oRQvKyc8KeDqaq+HSgwO4cFDZ7uYCIouHanBqznOByh4macq6QqrrvRx71S
 kFceSurIvqnYMX3ngCc7e5f/DonyiX6AFT3+e+oTj9co2MxR6NO6FCZ9w1okzNjfPI4I
 KxLs6JQ6jlGVig848WGET+Rd+Zg5nUQFlQNMhtZl4tI+U/Mdxh+a8ey7xHDOSNFUkTwd
 r3Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=1wvUnTzFU0djvbBSDUF+jiedZLVLMDrkBPDbAvBdvOw=;
 fh=A4yuMQIz0ieN6JhILxA2e8Ue/yC+VIINTKMWhiWRGqY=;
 b=P6v0gDhvfhu4gSlNZsrDFTteqa02wTM82tjkZRj2tMGEEGIyg+CV5P3kxncm9ic3aP
 bOkcnFZR4Cgg1Ws8HL+6d9KkPTSLQTuk1L10S9zs4O7UiCj/88Zgs2GVlXuLku6uR4EC
 FKu821BDRw+5go7ErUkBzJ5K7d42HF5lhStbSYkOQ4WhwTAxULzl6FApwvbIMOp/LjjR
 pnIvV5g1iOssMGlqP1J+8POV01WHneh+anLWjxTrsPCosChrVcxUtheDVYPhMNjM40RL
 GfqfnPTg+rgCJTA+KsAfjIHdKd8imr84Lq1B23PO+RBuyeHiBzVEgHyafzX/vjSSvPQX
 RPXQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772114688; x=1772719488; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1wvUnTzFU0djvbBSDUF+jiedZLVLMDrkBPDbAvBdvOw=;
 b=ZHUsfWUb1Hy0C4SsaA3crcVIgebm1yz667MSB3o4aBNctu1joFTwZ9HCTVRZoKHtjI
 DAdotyCpKBE46/xbv6kGLNgWrbHJokhA1LDvRq8FQymAF38/4LqOi+jB1TWqFIH9OByx
 Rg0TKd82znFfNoDDDEW39HQ8DpZUtfPdLj6AdQVDZQdqqeLqRLaLSwyxzDlysgKaXpGw
 5kRkO9Gg5abxhOEZHPtkuCCyJpJ1c6fkwt9aUw44NkVEOUDTk+u6GqjOXfx0xR7MJzEM
 /KASvhHXQFUcbHL7qNKfl0id0Ggp7m9Z5c2qWVeHX6du3/CZmmORM3sWX4gCWoWEQILk
 +ddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772114688; x=1772719488;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1wvUnTzFU0djvbBSDUF+jiedZLVLMDrkBPDbAvBdvOw=;
 b=TBHTi6IlWCrFe07cpbAwn8Bws+QT61mXfDWrAcQlYKjq2uktRuzw08I1RNHTLVO7Bl
 2SiiPwLwsgsnvnHbWSHS8nv5komV/l2KSl3WKkmsQ6pexv0TyNhOd9C2nmtbNS/Qy2Ob
 xCqNpJHCulSNjLdYhRx/kadR/A/WRn48ikoUHTTK6QGPbL6JWh8ifFZu9BDWpsBbXhli
 WKp7UGmEs+S91Vpysz73UQS99B+9tq3i2JQomQx8fS6puWh0kFybcfHW47ohr8iQG+js
 ucOJSNvyg/S14BdvKCUqB/1KxHNmrST/DsNqEhl/ivwlcMPxAl3/pRTLtRu8115q4AOR
 KQqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFDpHO/OZuQm29geNQr2SnsJ9h/0phfsAbam5yOhizO3vWOthSIZZeUnrq8/+LkRROcLhZyQ+B1pM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxUtVZDQKWvxMzHHTaABc36BpVzEGELwvMRAKm+HgJONKME3J/D
 pCY5q92NB74QJ8p64PB+BtSqAnxUqVS/9w69haR3Pven6dMkxKpU4NRbFpTxw/vqKOzfqrWvedW
 V62FnwBze/sjo/Emh/dVLGuPsM+Nvzs8=
X-Gm-Gg: ATEYQzxW75xmD+Hgzl38VMGG7iGHu0rlJcH1QK22pO3tmC5DS8IaInB0MRItl8Q2z/c
 /tBFRSRP2IR7hqFHzVEeinhL76h7+4G6aTud5wLwSuauOgtmFLL/ywuRAQyABR1NQxHpjv4BgK6
 502f/EMF6y2eJhgfPwtuQ+LGyxFDpuYHJ56W9nky4rfwUhoPFpai1v0Q376HTDpOFA6TD7VXn4l
 V21OPg4CSkuXzh012A5dTZ1UbWlRqXDSFoOwGsD1kzXJ8Gh3PgPWS7mH0EOdQZH2M5U7Rj9YOP8
 SJKfnJyYrh3ACqxaJLJx0auDaSnrGqwibSfN1an2zK6Mtz/0DzugoIs3mQQ9tnME1E2fbBklnJV
 EKCRkbOQwD5ZpZiDz3ipDTPi5Czj3Bkxz6nj23uE=
X-Received: by 2002:a05:7300:bf18:b0:2bd:bc33:ca32 with SMTP id
 5a478bee46e88-2bdbc33cb83mr1132309eec.4.1772114687621; Thu, 26 Feb 2026
 06:04:47 -0800 (PST)
MIME-Version: 1.0
References: <20260226-cmdq-continuation-v3-0-572ab9916766@nvidia.com>
 <20260226-cmdq-continuation-v3-3-572ab9916766@nvidia.com>
In-Reply-To: <20260226-cmdq-continuation-v3-3-572ab9916766@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 26 Feb 2026 15:04:34 +0100
X-Gm-Features: AaiRm50bYcwJMHTCfOonMLoQxEz1NrF-ZMytkNesE2f6ML6hsIR6ETTN8geqQBY
Message-ID: <CANiq72mb=t4C-hTn0BdzLmvCu315tZLHPN_g_wvs0P-qgO_RBw@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] rust: add EMSGSIZE error code
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Zhi Wang <zhiw@nvidia.com>
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
	FORGED_RECIPIENTS(0.00)[m:ecourtney@nvidia.com,m:dakr@kernel.org,m:aliceryhl@google.com,m:acourbot@nvidia.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:nouveau@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:zhiw@nvidia.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,google.com,nvidia.com,gmail.com,ffwll.ch,garyguo.net,protonmail.com,umich.edu,lists.freedesktop.org,vger.kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 08BF61A7307
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 12:46=E2=80=AFPM Eliot Courtney <ecourtney@nvidia.c=
om> wrote:
>
> Add the EMSGSIZE error code, which indicates that a message is too
> long.
>
> Tested-by: Zhi Wang <zhiw@nvidia.com>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

Acked-by: Miguel Ojeda <ojeda@kernel.org>

I checked that it is placed in the right spot in the list :)

Thanks!

Cheers,
Miguel
