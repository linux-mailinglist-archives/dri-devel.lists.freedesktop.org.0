Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHe3GWmDpWmxCwYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 13:32:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB20B1D890C
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 13:32:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85C9E10E4B0;
	Mon,  2 Mar 2026 12:32:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mS5ZMXLn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com
 [74.125.82.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 760EF10E4B0
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 12:32:37 +0000 (UTC)
Received: by mail-dy1-f179.google.com with SMTP id
 5a478bee46e88-2bda3b4318dso338074eec.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 04:32:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772454757; cv=none;
 d=google.com; s=arc-20240605;
 b=Ws1njy7VMYBqTtnIQMCSuoxolviMtMCdfF/zm9odd6UEeoJRqPDfaVj018Jn5O5Vyh
 IZ7fbzAtbj2zZGBxqOIr17o4ZoSOW71SiNloO3emO8JRRd6Rz19yXI/3E7uy2dRzjGZM
 7r41UZkJhRzpDysX3fQa/jfl7GBoVy2xiAgu0VA3hYnCXRHdWWUR2ul8Srvqqq6D0oYZ
 TzFLgedFxQMR9bQRFzwk3QsvvY+yAJmqVNe2VMmAZejlU0mYbUrcHvZ6KeKLvPm1ScB7
 7PhkPex3Xc23SOkirHGiFG6DOvYdrFTLhfMmKIXgurYgvQWZe2HB8yD81yTFs029n5+L
 fjuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=zQz0rPb0FHUXbzgHRy665O9Jasbnueaxd3e7FIEzeyU=;
 fh=LNZr8dk1NT4ChI/gmUgz0phyk2kutd4wg1kcWpRfDXw=;
 b=WAYdYmDNexhQShmqmhqiJ3WpLObBOTZfbwjkEkk7cAFA7zOeBky4/2dKJ2aeM/xMx/
 0UP88hrN28GeuRdLZBXT3t2M0CkG5WyKdj6Pcbwp3Lk/Tgnx9LPYomfFrUaF0ry/pVNq
 49wrI1xVToJqyStOvAd8E3Gg2t0lwd55WrkGo3aEc7JRA7FMBIPYB+uioR7pKaSWO26v
 HqnGwYsn1yzY3b2/jMlLahysqbbDJI34BEWLO8uje35udID92Bh1DpbwBQdIwK8JxWpX
 CdtWmQW6KIBLRcVfkQBcbLfqlZDq9gOSFW3j7mHac/4+q7486OEm2fzDx7KdDAjs8BX8
 U2Gw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772454757; x=1773059557; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zQz0rPb0FHUXbzgHRy665O9Jasbnueaxd3e7FIEzeyU=;
 b=mS5ZMXLnbU4vN2PSdGqaLn4otV4lEqKkqNQoE1Ndh2JDOAkJG8305pOAT5Q5hdwgyn
 quIjveNKN0ADzHqa5OGwnD6U4JHh/K8oNgnbwNw+edzSqdA8penBhQzUE4seaVg/kdrI
 G6jb0r6q1TY/+BfAB5ZJnS61YNxKPzcdMmQhAJ8ioV4WD7gYTJkeEGZaclXs0KEC9J0G
 e0KIPXtjS9bpe2P7uouw3Mi3vLdzBUr9t/NbV52QQud0fEEReLFtlUEP2NetHyxT+89S
 QgVRBJxQXiftC8bHIqGdGeUF5TgBl2qYjz7h1rkHyw3+hRdROmKzFLNya+8FOYkwBdNP
 KKVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772454757; x=1773059557;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zQz0rPb0FHUXbzgHRy665O9Jasbnueaxd3e7FIEzeyU=;
 b=MNjuzhmW/9nUpUtkGvUkG370DpFru087vtUSrIFilgo7TqI+ut9GCgH6HGnDfYJkCT
 8vXiXAQkR1nhDU8D/dw7mX4EK1VWCwucxjIjSRCvDLLvb8Bx5Z18aiP+w7wr+HYlg1aD
 V8D/KOHVkILiqh14nXjTuH664LY+3vubAYgDiN5MX3cxqhKHqFCPKITOCz3jDYQOIPC5
 W8orKrXIn2oYzOSHzDasoDSy2Cge4Af4aSFuEupcz9ZzpYi+VuhESkis49Cx+Ns8gvnS
 iLb3q7dl+4YxZL7ZJEedJMiWzBfvyqGgh3g2ZHb8zAsB+WkWYU5L8MXjSogRzxmIdiJ7
 Fqaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXW2yKrrBcL0tynBjp+cJUv2FEL/E5iKX5SC88sVa1CoiVjva8Yr9FvWriMmr8Y78Kwqth2lsLtf6A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZH2T7Bb+4IRpOyMuaJPDSwbyf74Zl2tw2jbJ9UAkIdIHQzz8g
 qU2c7JVAvkmeOAAKAG7FjlQL4sVj4hJ2V8oF+h/O3H2sJLO/hefw2TB+fEZKTrgvR6mXL61attQ
 wH+gpXG73Qgun2TsHanr1NteyuSKszQ0=
X-Gm-Gg: ATEYQzwL+IF/rPfGrgtGuukN5PjVvItEx8SdQklMRkJaAPE4bU+td0CX3YNQh94ls8E
 m9bxBW0jcIvoyZfNGBxogQJ0v1CulCgmGVC39DZrNtgGD8ex3hOm+YNlyUnwrdwNFOn8jWF2qaf
 g346648v7hfUA0XxQMoloNCpyc54z05gYKljIHuTDwlU/hmiosz8Q9+sqtmuLfAjkj0oilADnin
 G+vuEn3KE1+VG1BjPA+sRYccNAJxRyMLmgW1riI7AWr6qppf//H3GSBhlHfw2ijlYB8L/egMlLL
 KHHIRyF8me9cb/HUp+7Kxs25pjwL9KDYeDf7PjBt1uhwLRMs++ZdeGcXm+qjYW3bEisfjiWm5dN
 XFxpvf7znTknKdjxXXDfBuZF2bEzA
X-Received: by 2002:a05:7301:128f:b0:2be:1946:8576 with SMTP id
 5a478bee46e88-2be19468a7cmr221836eec.4.1772454756603; Mon, 02 Mar 2026
 04:32:36 -0800 (PST)
MIME-Version: 1.0
References: <20260224-unique-ref-v16-0-c21afcb118d3@kernel.org>
 <20260224-unique-ref-v16-1-c21afcb118d3@kernel.org>
 <eeDADnWQGSX9PG7jNOEyh9Z-iXlTEy6eK8CZ-KE7UWlWo-TJy15t_R1SkLj-Zway00qMRKkb0xBdxADLH766dA==@protonmail.internalid>
 <DGRHAEM7OFBD.27RUUCHCRHI6K@garyguo.net>
 <87ldgbbjal.fsf@t14s.mail-host-address-is-not-set>
 <DGROXQD756OU.T2CRAPKA2HCB@garyguo.net>
 <DGRPNLWTEQJG.27A17T7HREAF4@kernel.org>
 <p7rsBPaYxHKSMFCYVUFY5hdI1H6jxHK0s7lxLQkqH4rylM6yS03Yt52SCjiTO5qBVUmc41ZHZ7XZ0_3w_U-O0g==@protonmail.internalid>
 <DGRQNTVD3N23.33347CYLKMKEH@garyguo.net>
 <87ikbebsx4.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87ikbebsx4.fsf@t14s.mail-host-address-is-not-set>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 2 Mar 2026 13:32:24 +0100
X-Gm-Features: AaiRm52T7cw5MIQan-WghpnUecgDLtb8HLJUgWIjNNPX7ugGbu9wZy-93BfirNw
Message-ID: <CANiq72k_c06P4_JVDCNmwu8SwCUP3UjofLCAsovBVzQi=fb6CA@mail.gmail.com>
Subject: Re: [PATCH v16 01/10] rust: alloc: add `KBox::into_nonnull`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>,
 Serge Hallyn <sergeh@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Igor Korotin <igor.korotin.linux@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 Uladzislau Rezki <urezki@gmail.com>, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-security-module@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-pm@vger.kernel.org, linux-pci@vger.kernel.org
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
	FORGED_RECIPIENTS(0.00)[m:a.hindborg@kernel.org,m:gary@garyguo.net,m:lossin@kernel.org,m:ojeda@kernel.org,m:bjorn3_gh@protonmail.com,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:gregkh@linuxfoundation.org,m:david.m.ertman@intel.com,m:ira.weiny@intel.com,m:leon@kernel.org,m:paul@paul-moore.com,m:sergeh@kernel.org,m:rafael@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:igor.korotin.linux@gmail.com,m:daniel.almeida@collabora.com,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vireshk@kernel.org,m:nm@ti.com,m:sboyd@kernel.org,m:bhelgaas@google.com,m:kwilczynski@kernel.org,m:boqun@kernel.org,m:vbabka@suse.cz,m:urezki@gmail.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-pm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:igorkorotinlinux@gmail.com,s:l
 ists@lfdr.de];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[41];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[garyguo.net,kernel.org,protonmail.com,google.com,umich.edu,linuxfoundation.org,intel.com,paul-moore.com,gmail.com,ffwll.ch,zeniv.linux.org.uk,suse.cz,collabora.com,oracle.com,ti.com,vger.kernel.org,lists.freedesktop.org,kvack.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: AB20B1D890C
X-Rspamd-Action: no action

On Mon, Mar 2, 2026 at 8:19=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> I was thinking something similar, in clippy or checkpatch.pl. If we
> should always have this attribute for small functions, we need to have a
> check.

No, as Gary said, we do not always want to have it.

So something trivial in `checkpatch.pl` or something like the existing
Clippy lint would have quite bad false positives (and even false
negatives, in the case of `checkpatch.pl`, depending on what logic you
are thinking about).

We would need cross-TU heuristics for this, because at the end of the
day what you are trying to say is "this function will end up being
trivial even if it may look like it doesn't before inlining
everything".

Cheers,
Miguel
