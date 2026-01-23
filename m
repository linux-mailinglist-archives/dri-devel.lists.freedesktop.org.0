Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJ1+E8h2c2kEwAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 14:25:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F5776363
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 14:25:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CD2510E2BB;
	Fri, 23 Jan 2026 13:25:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="B5OSP2t8";
	dkim=pass (2048-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DfLOAZNh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E2EC10EACF
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 13:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769174721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dl7NlkiIvE4aCaKk0Pre5K+Ti7kNdoTw5jT1Cl5ZZAE=;
 b=B5OSP2t86RRnFNzdmsmEzd12Xkc0c9MiH0FxIAgf7bSwNYjpN4QcCfyeBTyikbW+xIeZy2
 E/Un8+EW8vmwzRiFolCskDKVJuhO0IBSIDn0eAJybfCAfl6pgtzx8PQgFZqJF9n7mLGXjp
 tRSy4vsjnWCApm+MjuPu0kwTEzjDBAA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-0bUkc39HOoWMZG87nCjGkQ-1; Fri, 23 Jan 2026 08:25:19 -0500
X-MC-Unique: 0bUkc39HOoWMZG87nCjGkQ-1
X-Mimecast-MFC-AGG-ID: 0bUkc39HOoWMZG87nCjGkQ_1769174718
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-47ee432070aso16621745e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 05:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1769174718; x=1769779518; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=dl7NlkiIvE4aCaKk0Pre5K+Ti7kNdoTw5jT1Cl5ZZAE=;
 b=DfLOAZNhqg82wbhJl8cs04joD4vphUoHDyQEV6it+5ducl6oNz8Z8g9DX82T7yUtwm
 rXvK+Z5HYjnvZBhp/wc1yOvopJo8fmCMjDW1XXGdXYHVIB+68xTGOX+QwAdFp+mXHQUi
 FzbNuj6wp751Yy4aLTAh4DX9220vUAZ4ng9iRv7kgeOB83s410QmlzqBODn83UvG3M1U
 hzaK0HQZ10/ZUjaigBHYbbUNxKnTS9Ej9CwyXF6M+B5FbT4y/mqKfz2QrN6kVrXcak/Q
 tp4U5rmU5rBJcZsH0b9cuLXyqLLmhLJB9l95qLp/OgBS/hiJDvVcCCpohznjYFVp5wjO
 dq3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769174718; x=1769779518;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dl7NlkiIvE4aCaKk0Pre5K+Ti7kNdoTw5jT1Cl5ZZAE=;
 b=Ga0nw8LP11ZkMoNthBnf+Gxmrqm7AXx2BOJpYhe723rqoAzYzxCivEIyeTDprn9xCF
 3ErYNfaJ9LyoSOyNOJyd4HWqWo07K4CuIrSYyTrp5BV7XNIH9pEZLR2Jy0HzBMreawzU
 dKDjVnB8Uw9Y4MY+mjMfZS+zElZ7PMfWtioYrs+bfrh2pP7rK5Sbh2nkgzZYO86Z+g7S
 LHKMcgxnEh3EGDIQb9p7F37tCtiOf2seXenaetN0kvFWNRkR2i2xvSZDjQGN494+4OaM
 0CUyNDdBGTnQAwvg07HLSDhIywuV1/SO1M4DZ4Ii4FgZzDxhoF6NVNLsWHJU0iUH0Sul
 DElw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCn8tknPEeZrMQeLFpOesNHTyohodjnPdgaPL2QdIZqlpvYhFPebTrpfms9B0mBZ1I2fz+KuKhUjg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJq5CCb6OJlZWIweCUDw1WbTT2hA4pF3kEaiqzl76qjRfJjgAl
 sOPJDjudWyizdX+GBXaUHwaqm8gNntYWU4fQX+TPSg9XpT2727q4wvy6Gj0hsQKNM9lz8KKWgYH
 6Kb80/WheSpQE92sviZ7ICFXNJ/dq21JVuH8+dvK5x9BEr+trzRqrutXQRbcvtk3Pa96n6w==
X-Gm-Gg: AZuq6aLq43M71qR2hxcxGefPWP+YxsSawxDZ9qtWvndEYsvc6qrfqmy8hBXvj46ozo+
 ex0Tcs3sYgEiTM6i2gUcFTLD+vCeziEh35ylbwJWYq4aSX6EznvPTaWKyMQcey/yVmw26/5qI3M
 G6kDSDHGNZqjNsyGpXjHAAxYoUSOPSjONvLVgwyfAFG+JvKEgZcZeFwG217371ztlyJNW8+dBHO
 KcDWt+QAC4NiuY6WoGLfAvgptv5uDC31NOZkZMBXkE12oDP132cpvPdouAPn+idQppfGxeK+0eK
 B/bAr6rWxKmbT9Bk/Bii5WY5U18LJ2VN3surfhWNDku3gM+s8YSxWxRZC3hqJA==
X-Received: by 2002:a05:600c:c16b:b0:477:a978:3a7b with SMTP id
 5b1f17b1804b1-4804c9b2113mr49821865e9.22.1769174718317; 
 Fri, 23 Jan 2026 05:25:18 -0800 (PST)
X-Received: by 2002:a05:600c:c16b:b0:477:a978:3a7b with SMTP id
 5b1f17b1804b1-4804c9b2113mr49821235e9.22.1769174717712; 
 Fri, 23 Jan 2026 05:25:17 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4804dbaad79sm21251445e9.9.2026.01.23.05.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jan 2026 05:25:17 -0800 (PST)
Date: Fri, 23 Jan 2026 14:25:16 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>,
 Mike Rapoport <rppt@kernel.org>, Sumit Garg <sumit.garg@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 04/10] mm/cma: Allow dynamically creating CMA areas
Message-ID: <20260123-active-witty-rabbit-0fc5b9@houat>
References: <20260122161009.3865888-1-thierry.reding@kernel.org>
 <20260122161009.3865888-5-thierry.reding@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="equ2x5ui66msv4bz"
Content-Disposition: inline
In-Reply-To: <20260122161009.3865888-5-thierry.reding@kernel.org>
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
X-Spamd-Result: default: False [-1.41 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:thierry.reding@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:akpm@linux-foundation.org,m:david@redhat.com,m:rppt@kernel.org,m:sumit.garg@kernel.org,m:devicetree@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-mm@kvack.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mripard@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,linaro.org,kernel.org,collabora.com,arm.com,google.com,linux-foundation.org,redhat.com,lists.freedesktop.org,vger.kernel.org,lists.linaro.org,kvack.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	NEURAL_HAM(-0.00)[-0.745];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 82F5776363
X-Rspamd-Action: no action


--equ2x5ui66msv4bz
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 04/10] mm/cma: Allow dynamically creating CMA areas
MIME-Version: 1.0

On Thu, Jan 22, 2026 at 05:10:03PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> There is no technical reason why there should be a limited number of CMA
> regions, so extract some code into helpers and use them to create extra
> functions (cma_create() and cma_free()) that allow creating and freeing,
> respectively, CMA regions dynamically at runtime.
>=20
> The static array of CMA areas cannot be replaced by dynamically created
> areas because for many of them, allocation must not fail and some cases
> may need to initialize them before the slab allocator is even available.
> To account for this, keep these "early" areas in a separate list and
> track the dynamic areas in a separate list.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>

AFAIU, this won't create a new cma heap when registering. This goes
against the recent work we did to create one for every cma region.

I guess, since you have a driver that would explicitly handle that
region, we should create some kind of opt-out mechanism, but by default,
we should still create such a heap.

That being said, it's not clear to me why the heap driver uses CMA in
the first place.

Maxime

--equ2x5ui66msv4bz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaXN2tQAKCRAnX84Zoj2+
dtsNAYD+XKsLdRQjkWGztlo6ccvGIarpCsAjHJYFv0zPbdpfdWvfyLFS1lY/kTQQ
0g9g6Z8Bf0j4St2GiD6RINFxEH7YvowARYnLD4kKLHV0CjY6XFcfRV2lK+cZmof9
IIFG/01OiA==
=as/Q
-----END PGP SIGNATURE-----

--equ2x5ui66msv4bz--

