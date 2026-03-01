Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IacG0V9pGl5iQUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 18:54:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D9A1D0FCB
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 18:54:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C4A510E1BA;
	Sun,  1 Mar 2026 17:54:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dv3u4jUS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com
 [74.125.82.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2196910E1BA
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Mar 2026 17:54:08 +0000 (UTC)
Received: by mail-dy1-f180.google.com with SMTP id
 5a478bee46e88-2be0629f76eso19125eec.3
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Mar 2026 09:54:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772387647; cv=none;
 d=google.com; s=arc-20240605;
 b=FxUqr0epCwTDTyM7KPGiXw/uKTLou95HkrliSiaLGIDZ09URCuw1x2dYghSCI3RyxM
 shbWRsdQwuUNmqDRglEpEZ0XE7j6ETWhf1zbML8NNp9zUc4ePVg83SBULWg1biaO3DRD
 MaY+aMm542dZoWm3SdHrArHzXgYXjyzTu9UvCeHPgNA3GLnavMuemfNl7I68z8rEZVns
 PUy9i9trM10UcRJGknjm12bJzbnijPmrBgS2dhZxya1pi6kBG76cPhmQTRh031e/Wowl
 23zeppMrPhPfp8CD/psXfQKafwuSC1zHkHhGKuEctT9zMiMPDkG/LO83UbfgsWuBAVM6
 6dIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=bPAn9Rh+LY66WaxVvbGmncrz/qFe2i1Yah6LbNjrXU0=;
 fh=WKdJ3Hi7gJ+nd4MJyVyQ9F0lWJNSMr38GJVbQfizk4I=;
 b=bDWTRRMxc5N7lwXTMMCMkeByJ7+yO31kIeSyoEmI07m5LOigZrYzErAYayBLWl/HLl
 0VAj63tJvsUojth6zGPkaGNVQ3+Ug5ma5Y4PsVszk61WNE4FdezGKH8YPXPNZLFVzn+p
 7GQgrqkpPeiONRimxFUg32XAUkujKSdLNUnpBGQOAUHJO1sH1a2jX0zmxm5bwZye9Hbi
 mtCvvuMA7RqFTx9ccgNY7aAsXIcIqdge4d8gidOnLZJn618VHmNU87z2jhf7U3w7Qw4/
 RgeZPzokHzMONn+ihX6ENnjWH9O79gRiGkIbydNXCPsgLQPJZJwGhCx6qn6S7jOM/hpF
 vI4Q==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772387647; x=1772992447; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bPAn9Rh+LY66WaxVvbGmncrz/qFe2i1Yah6LbNjrXU0=;
 b=dv3u4jUSvXRfdOkXiOLwzbghX6EFm+WoiuimG7wwcS9W2S+t3HKrtId9v2cqCVnKMZ
 pBb45Gm7sOPXvhTT3iWWdjBjyyvZWBSAnoVbLhHlAUdooI+3diOzVZ42M1ZZqS8uETsY
 jrjyi0GcncMOJnEv0sRQEPVAbLlRF1jsy40P7y3j80DEn4l1DUMmNV/ck6jb8a++qDnN
 xwE4f6TXAe3UhIgWXSwEN6uakSVvx6QyDcqgc1ZWwQhqRDWqUFD3hiu//Qb1XGkWtB1P
 vnTM+lRD9OA4cMtgauN1CgspTTesLvh3OIz4PLQMFZfEwfP21NKPx5o7c8+LRy5I4I6d
 pkXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772387647; x=1772992447;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bPAn9Rh+LY66WaxVvbGmncrz/qFe2i1Yah6LbNjrXU0=;
 b=vk8tX6IpRwPfI+viw/1ajiiffsfFlWexATWS/+yp7lWPXQZfQPsKJJ5cWAI/EVfgqu
 JHQzY4kNrvNk15isT8Lr+TjbOLPgsa452LKRQqtNH/OAoh2EQxbVcQscnUXQB9L9d6X7
 3xze4WB6bUBBLDvOTDTWFP93LPgY67snTQToceuWGnTYMNHVK9ccKU8gtLksEV6erIc8
 oJhxRNnI6P66m9tKNS3lOXF8DB3ivYAZcP5OORq9xKnbsoYtVf9MfjvlTTZ8ooL1gFhT
 ZT3lb0PeOyW5CeyHghM7MgmXVF1mxkSi5hCgighoirF4Gv4IfBQyMj8fv/WzGXvWh82j
 QJYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsqIYsZMQY+3h/x51z7+CUdGY/1gq3xmN+/Z57HhaVtmfccOCLltYZ5bDaLdiizAcyL4/VXUT44fw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkDzcWwlS5fDsabvH1LPMpty4jTJkUlXh31sVk3qztJbnN/7l/
 mBkoRVTup07wg5MlbcCPHFGyVy3v40+GtWKNnOSYkDAIxC2gQGxbvF0abDhLwDcsAzrm98OxBcK
 gRwvXdeNfGBJr7noUA9gyWnfXtDgx0f4=
X-Gm-Gg: ATEYQzx+RzNdTX+SQ+T7FagzF46Sn7CsXx2AQu4LJsyCR+NJtAh9Q9Du25RomQG/qDb
 ZCjwrntiiOO/SI21Bxud2LzGmn/yTy2ffWf7S/hEr+GUeJTlhwLshNoA827tITMfGAhC2DbEh7m
 tkUB0pEpamrRzzmMNXaD04xyWC/MTcXKI0heO5GAZeZk42dLlSJ02Rtl0c3hstdxrN06DS0p1xL
 dDoXHF3eBhabw5gyj8d1CENQ9Cc6anmw5MoP5STa7FmovdC/DnCDCJthTmTFYWvuS0tqOwt4eMX
 ks+OjawkqM5oeiI0Mnoq0M2+LyxKGRzqXBAha/XymyMIl+W4hB6J+h5E3OPPmcv88+5MEwGHVk/
 s+ITvtY9ckVR3sDvHpohEC9EfiOyGkDJUNIFkfVU=
X-Received: by 2002:a05:7301:678f:b0:2be:6e6:e47a with SMTP id
 5a478bee46e88-2be06e6e93bmr364703eec.0.1772387647261; Sun, 01 Mar 2026
 09:54:07 -0800 (PST)
MIME-Version: 1.0
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-7-joelagnelf@nvidia.com>
 <DGIOJQC5HEAT.262OM2KS7C2HE@nvidia.com>
 <CANiq72mH=sCfO8+HnVp=m219b3drWZbqUWE=NJn=M3y4ng3qXA@mail.gmail.com>
 <edb5bd481d43fecdc626256579caee41@nvidia.com>
 <DGRH7Z2G22XR.LDEVDDGWC5B4@garyguo.net>
In-Reply-To: <DGRH7Z2G22XR.LDEVDDGWC5B4@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 1 Mar 2026 18:53:55 +0100
X-Gm-Features: AaiRm51jQvROWAW3ojMm8D87Nrc7b0R1mimDYc3M6UKj3t0H_flEAYjqI64qoF4
Message-ID: <CANiq72mVUHV7j7WNHpqPcbQR_LvXmea2iOoY6A0wsuUr8FabiQ@mail.gmail.com>
Subject: Re: [PATCH v10 6/8] rust: gpu: Add GPU buddy allocator bindings
To: Gary Guo <gary@garyguo.net>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Boqun Feng <boqun@kernel.org>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Dave Airlie <airlied@redhat.com>, Daniel Almeida <daniel.almeida@collabora.com>,
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:gary@garyguo.net,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:acourbot@nvidia.com,m:dakr@kernel.org,m:boqun@kernel.org,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:airlied@redhat.com,m:daniel.almeida@collabora.com,m:nouveau@lists.freedesktop.org,m:rust-for-linux@vger.kernel.org,m:ndjukic@nvidia.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,garyguo.net:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 95D9A1D0FCB
X-Rspamd-Action: no action

On Sun, Mar 1, 2026 at 2:23=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> I started to think that the way we document invariants is problematic. Fo=
r most
> of the types, the invariants mentioned does not make sense to end up in p=
ublic
> facing docs.

Yeah, it isn't ideal.

To give some context in case it helps, so far we said that the `#
Invariants` section is a special case where mentioning private fields
is OK-ish if needed/helpful for a reader, even if technically it may
not be "proper", i.e. leak details.

One reason was that sometimes private invariants may make the type
easier to understand, even if technically it is a private one. We also
discussed at some point splitting invariants into public and private
ones, and perhaps have `rustdoc` know about that and only render the
private ones when one toggles the private items rendering (runtime
toggle, which is another feature I requested -- if it is compile-time
as it is the normal flag, then reading the private docs becomes too
hard).

Another reason was to be able to have them use doc comments and get a
nice rendering output, and your suggestion of using a dummy field
would work for that. I like the fact that it makes one remember to
write the invariant "natively". On the other hand, it seems like
something we could somehow do with changes in tooling, i.e. in
`rustdoc` or Clippy (and perhaps it could be enforced rather than just
be a reminder).

Another bit was that sometimes the invariant, even if it applies to a
private field, the type may be exposing e.g. a copy of the field
through a method, and thus it is useful to know about the invariant
anyway. Those cases could/should "properly" be a guarantee on the
return value of that method, keeping the invariant private, though.

In short, the current approach makes it easy to write for everyone,
but it does have downsides and ideally we would have something better
now that everyone is accustomed to writing them.

Cheers,
Miguel
