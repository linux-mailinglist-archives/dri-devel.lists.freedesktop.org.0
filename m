Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AHqE+NynWmAQAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 10:44:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC532184DA6
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 10:44:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39DE710E53C;
	Tue, 24 Feb 2026 09:44:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="eIXx26vg";
	dkim=pass (2048-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="rFJ7ibOR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA51D10E53A
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 09:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1771926239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GW7PmuG1ndcDHaBwm6NFGZKZ71cFJAjRs457FXMTnxM=;
 b=eIXx26vgMGfdoK2p1k5u7HGoUYLyYhYBvU8Hv9VHbyia05WSF1cYkBCxY8QWaybG5fHdkI
 t24TAiO5hgELXLpPJJ0vgLmZJoMN0N37Bv4gd8qUJpTy368jyCei4FssFipU8X6xPdmtHL
 KcDJyIzQblQJKK4HgWWTdK8Lbhg+1vE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-679-vxKvIbKiPJykUFvzNbFTQA-1; Tue, 24 Feb 2026 04:43:39 -0500
X-MC-Unique: vxKvIbKiPJykUFvzNbFTQA-1
X-Mimecast-MFC-AGG-ID: vxKvIbKiPJykUFvzNbFTQA_1771926219
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-483786a09b1so54409075e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 01:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1771926218; x=1772531018; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=GW7PmuG1ndcDHaBwm6NFGZKZ71cFJAjRs457FXMTnxM=;
 b=rFJ7ibOR+9jxWIgNcW/VQlEukEICqXU4EEwuQwhv3pPhrcnd9i2Vsl41PR61iGemjC
 ve74mWAmn657ElBg3uApJq/y/Wvuof/EDa9ntxS8XkDnSdEx8Ri1DDN1cZkWXLWYG3HK
 oIVClpuRjYXX0vImXVBvqYeHzMgiEXw42/6tN4K1o4rl/YSqZzv6u8gcX/3UfWVTiD46
 RfL8LrFB/mnrhQYuLhprvyibXHJA9VCnWq27ZK3RnzCHQ0wxtp+V8Xsj6d98+LBZG4DW
 QicFwD31VMDiGTzkKxKfWzULGssGI3ixDCU9LG3di8KIviSk1tIBIhG1n5bHm/A3tO6K
 kYsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771926218; x=1772531018;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GW7PmuG1ndcDHaBwm6NFGZKZ71cFJAjRs457FXMTnxM=;
 b=f4zPStBCxne+7zAIUMWHGp/HnWOkQWAJNkw5J7WOyzMh0aaI0i23kn2oola5vxfzs4
 N8lxapmwyjF1ftSrWXLEhueysXZM9ZKWZS314fVVSELD53LKvHvnTkptadcbnsxTMsVC
 HTXA4X4iOpdUt8AwD8NILmIOF2GqGkZMRnAf3TAlhCqGQGVUKWSGm5cFI+DTIIeAAzpT
 mT2Y2qQ/xRnruwLoDkBaJUzBwNl+kI/kjQ3GLAtSPEMOOu7dvludu0xGOShPe4mqibTp
 jaP9NKN1Av+2Ahxp7cEPXljdcbz8XzMUcCIfh98yi7crmeNKx6dvsvfbDIkTDslS/K9g
 HTNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhh/y63PM2Vl3EGeAT3vAgsjJ6jMNjynxi5H1ZTl+rI70HBV1nbiCaOY13f6FvemyiG31qfZLdgy8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUyv+biCNuOjZzt5yDlZwFyMEtSVfhep/3z7m4Wmboe5YcYjND
 zQEm2PFlOew3uuz5YEyTTaqH/eNqiHjs7AZ0KVH30+gbv8CgCnzm92syz6LlDjDb343LGZH+0vq
 4l9upnWz5/28TlF9+eIgm/u8hUSJE3hZMAHu8JMmMGaRvYaOB13tRI0j7vz47T/f4hPEmxg==
X-Gm-Gg: AZuq6aKAi8GDUH8bsrAmsZWjwQjM3IIUB6g4sR9JxpT4Sx1LOG3jprJsPofgxQO1Yls
 FnjsDJ394SJLNypiEy/5X4TT+ZiG1MF6MlLSB7uHyTwIQI5XXTrkc3FKE7Iz6dJU3etY+hs3NTT
 0onntflg0HvKp9yMMVzIIfcnw/jRvqXU1j/jyxiZiQNQg9mzwjzlmugGW7Fppfk9nswGf4RWzIW
 DMjEviQyh4cCN/PdUe31OPEcqPB8CUs6K6Z7tZ98xtNIo3LMd5T/Y1Iv2NByNiP0xx6lKJ2yGXh
 HexwUHBPMEekc1FCW6/NzJmoeBIR+ltCyyFfmvwKYKhTpSass1dT2DKsW/UZI4kyMVsV00jitw=
 =
X-Received: by 2002:a05:600d:8444:20b0:483:afbb:a086 with SMTP id
 5b1f17b1804b1-483afbba1e8mr88663355e9.29.1771926218458; 
 Tue, 24 Feb 2026 01:43:38 -0800 (PST)
X-Received: by 2002:a05:600d:8444:20b0:483:afbb:a086 with SMTP id
 5b1f17b1804b1-483afbba1e8mr88662945e9.29.1771926217928; 
 Tue, 24 Feb 2026 01:43:37 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483b88f9584sm14864105e9.12.2026.02.24.01.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Feb 2026 01:43:37 -0800 (PST)
Date: Tue, 24 Feb 2026 10:43:36 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: "T.J. Mercier" <tjmercier@google.com>, 
 Eric Chanudet <echanude@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 Albert Esteve <aesteve@redhat.com>, 
 linux-mm@kvack.org, Yosry Ahmed <yosryahmed@google.com>, 
 Shakeel Butt <shakeel.butt@linux.dev>
Subject: Re: [PATCH v2 0/3] dma-buf: heaps: cma: enable dmem cgroup accounting
Message-ID: <20260224-solemn-spider-of-serendipity-0d8b94@houat>
References: <20260218-dmabuf-heap-cma-dmem-v2-0-b249886fb7b2@redhat.com>
 <CABdmKX0LpKJ9tw48oQh7=3CF0UR5uFtgo0OMwQhHBB40LnijyQ@mail.gmail.com>
 <a446b598-5041-450b-aaa9-3c39a09ff6a0@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="yylhp6jgdgqsuz5g"
Content-Disposition: inline
In-Reply-To: <a446b598-5041-450b-aaa9-3c39a09ff6a0@amd.com>
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
X-Spamd-Result: default: False [-2.91 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:tjmercier@google.com,m:echanude@redhat.com,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vbabka@suse.cz,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:aesteve@redhat.com,m:linux-mm@kvack.org,m:yosryahmed@google.com,m:shakeel.butt@linux.dev,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER(0.00)[mripard@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[mripard@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: DC532184DA6
X-Rspamd-Action: no action


--yylhp6jgdgqsuz5g
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 0/3] dma-buf: heaps: cma: enable dmem cgroup accounting
MIME-Version: 1.0

Hi Christian,

On Fri, Feb 20, 2026 at 10:45:08AM +0100, Christian K=C3=B6nig wrote:
> On 2/20/26 02:14, T.J. Mercier wrote:
> > On Wed, Feb 18, 2026 at 9:15=E2=80=AFAM Eric Chanudet <echanude@redhat.=
com> wrote:
> >=20
> > Hi Eric,
> >=20
> >> An earlier series[1] from Maxime introduced dmem to the cma allocator =
in
> >> an attempt to use it generally for dma-buf. Restart from there and app=
ly
> >> the charge in the narrower context of the CMA dma-buf heap instead.
> >>
> >> In line with introducing cgroup to the system heap[2], this behavior is
> >> enabled based on dma_heap.mem_accounting, disabled by default.
> >>
> >> dmem is chosen for CMA heaps as it allows limits to be set for each
> >> region backing each heap. The charge is only put in the dma-buf heap f=
or
> >> now as it guaranties it can be accounted against a userspace process
> >> that requested the allocation.
> >=20
> > But CMA memory is system memory, and regular (non-CMA) movable
> > allocations can occur out of these CMA areas. So this splits system
> > memory accounting between memcg (from [2]) and dmem. If I want to put
> > a limit on system memory use I have to adjust multiple limits (memcg +
> > dmems) and know how to divide the total between them all.
> >=20
> > How do you envision using this combination of different controllers?
>=20
> Yeah we have this problem pretty much everywhere.
>=20
> There are both use cases where you want to account device allocations
> to memcg and when you don't want that.
>=20
> From what I know at the moment it would be best if the administrator
> could say for each dmem if it should account additionally to memcg or
> not.
>=20
> Using module parameters to enable/disable it globally is just a
> workaround as far as I can see.

That's a pretty good idea! It would indeed be a solution that could
satisfy everyone (I assume?).

Maxime

--yylhp6jgdgqsuz5g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaZ1yyAAKCRAnX84Zoj2+
doacAX9OV+qF5kysBD7VpKcr5kj6qlD3tVyHVcMdeBEkYAtzN36MFGozyNSliCjA
/lA6uL0BfiAOlFg02H8ElnCXHrx1z+Noa4YFNUJ9SeZZcTsz4JPvSJFejlvUlYrT
iKqij7gXqQ==
=qfni
-----END PGP SIGNATURE-----

--yylhp6jgdgqsuz5g--

