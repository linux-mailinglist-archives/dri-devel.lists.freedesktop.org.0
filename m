Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDgHCBCbmGkTKAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 18:34:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66ECB169BD2
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 18:34:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBAC110E821;
	Fri, 20 Feb 2026 17:34:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZSscitnY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3BE510E821
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 17:34:03 +0000 (UTC)
Received: by mail-dl1-f46.google.com with SMTP id
 a92af1059eb24-127148c2112so221432c88.3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 09:34:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771608843; cv=none;
 d=google.com; s=arc-20240605;
 b=N+RF2vsV6upfRdiWtvU2Zj8NGg8Bc3wjRo25xfWlJUHraRZEuRYyTbcKUP0AcUUSry
 oIr/OvPPOpfDyHViKu3YlhxneKD7zh8YfiaF3UV8tvyzgW/SbWvQBy/uWgYquru6pB6d
 OV18/qPuA/OcST6yyb2dKWxVjnj0erGoxxBS9hdNzMdiJh72V4SJhSgjloY9p+3WucRD
 SfFHJ3cZnZC3Wno3jW3B6VghfVYbfR0+ENJbxE9OHademx27m+AcpbaAr7n1zp6jiLff
 shltU5pkf+eZc+1505ikzBpBJbUzGX0JOtTUpShDc2t8scOJhTB86F8n9eYRxnivJS2L
 D6+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=B3RiLfffpu7Ffa96sGXtUyFTXMqhEfmtMEWOofkZHzs=;
 fh=RCS+L3VLfnd7dQBlfvBTf2/yAOGiEFN6YJBnXPFvMHM=;
 b=RAgb5nYUZfK1AClPiIQmCwjIdokvA8AMr+o2sHX+yu+tF+swlShzcLLdMF3WsXX3KO
 D6CtEW91P5es+DvOphFpcLBbaZ4xbyewMe+uajGJe5O50J2ykdzdpm+h6k+32rueZwa0
 0Ai34vt3SNSO+vCV9xYObjA+I7+XbVzSg6Kkf1jdQDYXOBWf2pzUoKVKDKg7KaSgBy0N
 zJGdMuo+dK5Vk6O8NeY0Up4rVPCkYbBo6tJfe3i9iTLyd9Cvjwg/cxUu12dMU+y5lY9z
 icqyfaHmqmoudenr+8PYMQHjuK8kfcW7jBdnyK3i1OAG8bHaFs4KmEBq9Uv3RV6P2q0b
 7VKQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771608843; x=1772213643; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B3RiLfffpu7Ffa96sGXtUyFTXMqhEfmtMEWOofkZHzs=;
 b=ZSscitnY8/U8N1WR6K3aC/XLBnSpL4eih/Q8PntXVWpyR+6LIZGvQSAGegAGYqLjYc
 jsNXWiW0zcarWKqnxEJ5umItOortr4yfD8GZY8jrMxGMQJ2H93nnro3+zLFZGE/1B+ZU
 hgJu1TVmFOi9CPEE5xmH/CWbKegGAJzepvmTCa8dqNPV68SVTmlHb23E4JZNFCZ18Bj+
 ukY99OzJI98xjo87XduZR7d6SRjeMLz/Lxtxovi6RapkfhUz9/ax+bW7mqQxBwiP3FCa
 m2FGGCnPNyxnc2mLtqzIR7LCHpwrJANYvjEhjUujn5o193U0uYAdmE50qH3o4wCngwL9
 T8Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771608843; x=1772213643;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=B3RiLfffpu7Ffa96sGXtUyFTXMqhEfmtMEWOofkZHzs=;
 b=aY6ZcV3cGYLhTfWVhdck0TCndpwt4qy5OhfAHFfmwoMzmlU7NAGwfj8co+JrJpcUey
 eOIboGABKwuh+5xJGzNY9cWmGa1kz2KHMXInBgi4awj4jSzy/Ut1vhffKZwemba/+Nuw
 j41iz78+3CMuFoqugJoXreST4g7n2lHXSU1CSp1zDRSUZ5vPzVRVxCn8S9bIToG/gri1
 ASRDm959zHK9RpJyjqqi/yvbOiB7X9C9Oq62CfU4BwbyTHjuzRGjyBuSO/esJGbjcZ8v
 ie8w4VZAjzPh3DAWmIGnPW65qz+1meyXfLKIiYPk+aPjdIJU210w/pBFW6erWO7eXGUd
 Xo7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqLAyCWdtZ5xW7UCZdyhoXmgimHctEl2aM162Ipyb9ERv03p8PYKSyz/TscWwkPmMmDnjauRYkuNk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+uKYgA/c6fTDdW/Kt4s1QH3Od1o8fBgTGmBmhV3WHSkByXw8+
 NpGGFWLMsxFSTCQWFfZ4bhS32KPCKk7U3l0d6BlLvJkU91UAFVg0Xk7QmqJRlxJ1R0NHa7ai5I1
 uis14rX+b1heQEj6MNJs/msYHiTVouwg=
X-Gm-Gg: AZuq6aKlQx49ouerza42sHqzDmLb2KLrkV/B1Wp+H2ywD4Rpt1u4CkeOe6qzIlFjUO7
 ZWd3TLS4b48e7NxJnSlg37VWs7qc7hGnbK99fkagV9g5/a+WLaE9S/l8avC+iIsx7CpTFngXUku
 yVLghbOGMbuvpU9opiHSi7wKbGyp5jQf5zreqYScnPlWkl6rOj2UtDzrDfmB1kL0NBOq1txkZZA
 4AVcK40zigZI17bzaafn3TllO5VT6WO4BOBdyAp9nIHl1jKHa7vsxkVsrhn7EIlaefB/whB+ggR
 bBQlyzJw/96FnW8IaQGu85TbiEqbcW27LMa8gGNQHhJaGIVeDKkSZ1PZV00lLnIdbCvj+UBMu5j
 DngNo+BVdxTeSFoIdkeP6fHYs
X-Received: by 2002:a05:693c:2c17:b0:2ba:674a:dbe8 with SMTP id
 5a478bee46e88-2bd7bdbce7cmr74947eec.8.1771608842904; Fri, 20 Feb 2026
 09:34:02 -0800 (PST)
MIME-Version: 1.0
References: <20260220-unique-ref-v15-0-893ed86b06cc@kernel.org>
 <20260220-unique-ref-v15-9-893ed86b06cc@kernel.org>
In-Reply-To: <20260220-unique-ref-v15-9-893ed86b06cc@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 20 Feb 2026 18:33:49 +0100
X-Gm-Features: AaiRm53lo0keI-FayfnRj4AYfVuM2jzmE06bNyAO-n4MO92LWSUkvblDHz_tCFM
Message-ID: <CANiq72myc+tCEHm0WtZspZHWwsSzvesxsmUvk31=GCdUN_zVNA@mail.gmail.com>
Subject: Re: [PATCH v15 9/9] rust: page: add `from_raw()`
To: Andreas Hindborg <a.hindborg@kernel.org>,
 Tamir Duberstein <tamird@kernel.org>, Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
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
 Boqun Feng <boqun@kernel.org>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-block@vger.kernel.org, 
 linux-security-module@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-pm@vger.kernel.org, 
 linux-pci@vger.kernel.org
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
	FORGED_RECIPIENTS(0.00)[m:a.hindborg@kernel.org,m:tamird@kernel.org,m:lossin@kernel.org,m:ojeda@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:gregkh@linuxfoundation.org,m:david.m.ertman@intel.com,m:ira.weiny@intel.com,m:leon@kernel.org,m:paul@paul-moore.com,m:sergeh@kernel.org,m:rafael@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:igor.korotin.linux@gmail.com,m:daniel.almeida@collabora.com,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vireshk@kernel.org,m:nm@ti.com,m:sboyd@kernel.org,m:bhelgaas@google.com,m:kwilczynski@kernel.org,m:boqun@kernel.org,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-pm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:igorkorotinlinux@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[40];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,linuxfoundation.org,intel.com,paul-moore.com,gmail.com,ffwll.ch,zeniv.linux.org.uk,suse.cz,collabora.com,oracle.com,ti.com,vger.kernel.org,lists.freedesktop.org,kvack.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,rust-lang.org:url,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 66ECB169BD2
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 10:52=E2=80=AFAM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>
> +    /// Create a `&Page` from a raw `struct page` pointer

Please end sentences with a period.

> +        // SAFETY: By function safety requirements, ptr is not null and =
is

Please use Markdown in comments: `ptr`.

> +    /// `ptr` must be valid for use as a reference for the duration of `=
'a`.

Since we will likely try to starting introducing at least a subset of
the Safety Standard soon, we should try to use standard terms.

So I think this "valid for use as a reference" is not an established
one, no? Isn't "convertible to a shared reference" the official term?

  https://doc.rust-lang.org/std/ptr/index.html#pointer-to-reference-convers=
ion

In fact, I see `as_ref_unchecked()` and `as_mut_unchecked()` just got
stabilized for 1.95.0, so we should probably starting using those were
applicable as we bump the minimum, but we should probably use already
a similar wording as the standard library for the safety section and
the comment:

  "`ptr` must be [convertible to a reference](...)."

where the term is a link to that section. Cc'ing Benno.

I have created a (future) issue for that:

  https://github.com/Rust-for-Linux/linux/issues/1225

Cc'ing Tamir since this is close to the cast work, so it may interest
him as well.

Cheers,
Miguel
