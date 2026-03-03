Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGiKIlZJp2m8gQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 21:49:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D21EA1F6EFA
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 21:49:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA19010E8CC;
	Tue,  3 Mar 2026 20:49:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QnJEo6mw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com
 [74.125.82.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C0CA10E06A
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 20:49:21 +0000 (UTC)
Received: by mail-dy1-f170.google.com with SMTP id
 5a478bee46e88-2be084d8166so199472eec.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 12:49:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772570960; cv=none;
 d=google.com; s=arc-20240605;
 b=b5lkOMF91FB21kG+cPnCt+7CY5JyV7o6ZpQSUE+sEo1e5BHLiYph+CLHrKsTfCcrNr
 2MAfC6sDAZUVyBLjtn5YpOLL/xYeh08TG3RN4RCVJxQ70oIrGuLpL3cdKlM9FqEqWYz9
 JHkT3FKx6nfz4SjNiojQD1NUjua87E6+oyE4FfMB6iaEkCsQDAhn+xaPxn3/0J/GKvrt
 QJzFa+5bRRHSzXTprkHl5QpJ+io6dYhoeG3ALyp1vc9MK4kjRTscAMTcAqksAexpS09S
 F3k4MkPjbkbeRFhSv38Vp7W+QSjM002TYhOBxNAry5c6f6T9SxfBP4nwFNhftSDE9zIL
 LRwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=z5K9TC0MkEO8By22h3GqX8xxcKLeF0UtxgZ/D1gjfh8=;
 fh=+CGCJxmf1t9aYgtJghhw3WHKia4/oaVY8Qt5xqbID00=;
 b=CG7AuQXNc3HwUOoEr+zg3ziNis9ae6ewj3TR63+F7bES6qQePTf2DCGdelZDs7652y
 cSzola3Bl6l7RwfiXzd7cEBlzcflt5koJCrNwijV93wL8uZSrDTEGP2WXIpzwlGjnRQx
 jEjeuhZQiRa2ygZST8OHdXMWY6B1hYDvShoasc+fAneSQATwG0YqB+PyYnUgPP4fJkG/
 8ubBip5S67DIzTibyC424HiSb+BeyCxwJ7kDB9CVVz2/O6AdDROFpBgT2LbHau/HXvfZ
 IrzY6afzMR5qzrQLVuRQXRD4FQxKinHdgtkBdgQcqXixjPm7X59DaBH4ZQVrWYNdwP4W
 pyEw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772570960; x=1773175760; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z5K9TC0MkEO8By22h3GqX8xxcKLeF0UtxgZ/D1gjfh8=;
 b=QnJEo6mwUiDeEB/8v+FMD0yeikn3t0hpSRvW5LqBaB4t0AEo4kyx8Swq7S5llGzq0M
 p+TWnlza5SKLZHzwhk8pLIE6hA6c0WmLgqA6R1Bs4mcGBXIqgGrFWKo/05aT1hi0yc/d
 Dt1V63wjmpCgDLpsk7aDga/9aI7DT10eShgF7wEDY/3c5FKt/m3HNX05J5wwPxvEcMs2
 MiRqfafHluMs3HXCnv2UMZtEgGdTiguoMxmYGKtx0+2cE5czcvifGghC/5SG9sZ1P1i6
 0a1+njt639Ejt8ZDtgsMrPcbDzH8dSpDqZSZMBcABWbyB0/wZwdLFKgyt/9P0Lz/speE
 6VrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772570960; x=1773175760;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=z5K9TC0MkEO8By22h3GqX8xxcKLeF0UtxgZ/D1gjfh8=;
 b=kGhC1PeKLx94Jvv2FVcmZHdCwRgeC4iG2jyF2LGRFpgPIYPfqjVINStr9GRF9fcL+y
 J3TbqEIAR+MnK98bCskov1gkbwDcnhgPBgknzZPzhDnlZ2l2LTz4B4Jn4Whcbia/ngKq
 +Y3NQqeLz41X3S2aUDPa5OVHRhGFexsxEQqWDQBwgRfnHXFVpra5oPJuvcTtrS7l67vT
 HSJ2ahkt30TC68op0gr9BUpbeIdnHPznL+voUVrhxRFSzuS9k8h6SIOoqRxoKo6DUNmO
 vuVmVW+N0Yyvf8v0nXyWcujshD3E6QnfeWad8RC0doPgJ+/zGNyzkdO+I7zCLAzHhqbL
 DFoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUP/hYkSKrpjSFGdU7CbzGSA9AKBzF1mo4f4u6BSCy0SpOH1g/XBd8ZxQQfbWeWAik7ponNDjaB83o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyoq3EgAn53EGJzKK42JrAt1NCah4ceVuNwHL8ecJX4/hZiCj6Q
 8Jl29qohkb4d156LXaL0N1rRIE5giKqVu0o5cv6j2NmtE9y28C85zSFFpmkcBSjh6xCjFN9G/2X
 /Ros2ilgzA1aijriZiaSnLpj7OhxDY4k=
X-Gm-Gg: ATEYQzympqHbOQhqWvdEBWsZU8cMLeCqYsP0CFm/XlsaOi62HSPOCYj58ZENejsXzOp
 W/DfgzOGZY3A7ydsYULZQasAhsN3JcDMAlJxl+w3+/WfdP9dtAqTkeqHsbeac5jxKm1b7HylczM
 YcrIt5G8Cq6zReKpjuFLMQpAaGft7uo9RWo9+VYusI9cdMPmfNij0VfIL7sxShBNOo9iTc6M7eo
 iVdbmNiQVf/pEMX/00yHGploq6ti5yWzE01fZ90DjOylPD+ISSdt93l3djA7UrfED/Bwf2T7Hn6
 R1vTm5tKQrR1jSSQOFf1kiByPOfXsF44jhEJLpksTW4dA6a1liVCc1G6LGfvmyaMv8e9TchJxS/
 22dJJvDDFckWpP5GnS+KjLKhA
X-Received: by 2002:a05:7300:231e:b0:2b7:103a:7697 with SMTP id
 5a478bee46e88-2bde1d4bc79mr3350396eec.5.1772570960234; Tue, 03 Mar 2026
 12:49:20 -0800 (PST)
MIME-Version: 1.0
References: <20260227200848.114019-1-david@kernel.org>
 <20260227200848.114019-3-david@kernel.org>
 <aaLh2BxSgC9Jl5iS@google.com>
 <8a27e9ac-2025-4724-a46d-0a7c90894ba7@kernel.org>
 <aaVf5gv4XjV6Ddt-@google.com>
 <f2f3a8a1-3dbf-4ef9-a89a-a6ec20791d1c@kernel.org>
 <aaVnifbdxKhBddQp@google.com>
 <5f8dcb7f-9e4f-4484-b160-3a9ce541d63c@kernel.org>
 <aaWvtn48X8UizaaN@google.com>
In-Reply-To: <aaWvtn48X8UizaaN@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 3 Mar 2026 21:49:06 +0100
X-Gm-Features: AaiRm50lUTXkxHRxiLsKpWNGF1HIgeoo2SkrDpQfQSxM22wzlSiellk8rvn7q80
Message-ID: <CANiq72nK8P1rUYw=y3fMzWZR3f_mW2v0_LSLWR1i0dQTtOqu2w@mail.gmail.com>
Subject: Re: [PATCH v1 02/16] mm/memory: remove "zap_details" parameter from
 zap_page_range_single()
To: Alice Ryhl <aliceryhl@google.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, linux-kernel@vger.kernel.org,
 "linux-mm @ kvack . org" <linux-mm@kvack.org>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jann Horn <jannh@google.com>, 
 Pedro Falcato <pfalcato@suse.de>, David Rientjes <rientjes@google.com>, 
 Shakeel Butt <shakeel.butt@linux.dev>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, 
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
 Carlos Llamas <cmllamas@google.com>, Ian Abbott <abbotti@mev.co.uk>, 
 H Hartley Sweeten <hsweeten@visionengravers.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>, 
 Dimitri Sivanich <dimitri.sivanich@hpe.com>, Arnd Bergmann <arnd@arndb.de>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
 Andy Lutomirski <luto@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Eric Dumazet <edumazet@google.com>, 
 Neal Cardwell <ncardwell@google.com>, "David S. Miller" <davem@davemloft.net>, 
 David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, 
 Miguel Ojeda <ojeda@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 kvm@vger.kernel.org, 
 linux-s390@vger.kernel.org, linux-sgx@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-rdma@vger.kernel.org, bpf@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, x86@kernel.org
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
X-Rspamd-Queue-Id: D21EA1F6EFA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:aliceryhl@google.com,m:david@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:akpm@linux-foundation.org,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jannh@google.com,m:pfalcato@suse.de,m:rientjes@google.com,m:shakeel.butt@linux.dev,m:willy@infradead.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:borntraeger@linux.ibm.com,m:frankja@linux.ibm.com,m:imbrenda@linux.ibm.com,m:agordeev@linux.ibm.com,m:gerald.schaefer@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:jarkko@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:gregkh@linuxfoundation.org,m:arve@android.com,m:tkjos@android.com,m:brauner@kernel.org,m:cmllamas@google.com,m:abbotti@mev.co.uk,m:hsweeten@visionengravers.com,m:jani.nikula@linux.intel.com,m:joonas.lahtinen@linux.intel.com,m:rodrigo.vivi@intel.com,m:tursulin@ursulin.net,m:airlied@gmail.com,m:simona@ffwll.ch,m:jgg@ziepe.
 ca,m:leon@kernel.org,m:dimitri.sivanich@hpe.com,m:arnd@arndb.de,m:ast@kernel.org,m:daniel@iogearbox.net,m:andrii@kernel.org,m:peterz@infradead.org,m:acme@kernel.org,m:namhyung@kernel.org,m:luto@kernel.org,m:vincenzo.frascino@arm.com,m:edumazet@google.com,m:ncardwell@google.com,m:davem@davemloft.net,m:dsahern@kernel.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:ojeda@kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-s390@vger.kernel.org,m:linux-sgx@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:linux-rdma@vger.kernel.org,m:bpf@vger.kernel.org,m:linux-perf-users@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:netdev@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:x86@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,kvack.org,linux-foundation.org,oracle.com,google.com,suse.com,suse.de,linux.dev,infradead.org,linux.ibm.com,ellerman.id.au,redhat.com,alien8.de,linuxfoundation.org,android.com,mev.co.uk,visionengravers.com,linux.intel.com,intel.com,ursulin.net,gmail.com,ffwll.ch,ziepe.ca,hpe.com,arndb.de,iogearbox.net,arm.com,davemloft.net,lists.ozlabs.org,lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_GT_50(0.00)[74];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Action: no action

On Mon, Mar 2, 2026 at 4:41=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> It's not relevant in this patch, but another thing that may be useful is
> to add CLIPPY=3D1 to the make invocation when building normally. This
> causes additional warnings to be checked using a tool called clippy.

Yes, please do use `CLIPPY=3D1` -- the build should be Clippy clean
modulo exceptional cases that may slip through (and soon linux-next
will probably start reporting those warnings too).

Thanks!

Cheers,
Miguel
