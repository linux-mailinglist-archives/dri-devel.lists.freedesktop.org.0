Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHzXAALVlmmVowIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 10:16:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BBC15D42D
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 10:16:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DC0E10E140;
	Thu, 19 Feb 2026 09:16:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gdLjRFsX";
	dkim=pass (2048-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ezP2h9/3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76DE610E140
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 09:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1771492604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FvCQKIeQDulHEvNvZG4/Rs7O2SMt0AI9xdkS+RkTuNc=;
 b=gdLjRFsXBwRCHj3Iht0T3cGD+c/Pd6f5uaCN5TXaYywCa+VcHlpZJLKIjPGmhK4RXCf2Bv
 3zk5UIyoPyASlS92YYOCIEze2S04tsjZm6VRSSwV1ZA4g8GMuu7n//b2AwMj64QbsbZ1vG
 nx5ZW/U9x26yebXf2QWRgm/dZ9S40vE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-130-g8l9qwIwOaWm9kEqFLCWTw-1; Thu, 19 Feb 2026 04:16:41 -0500
X-MC-Unique: g8l9qwIwOaWm9kEqFLCWTw-1
X-Mimecast-MFC-AGG-ID: g8l9qwIwOaWm9kEqFLCWTw_1771492600
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-482d8e6e13aso4808455e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 01:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1771492600; x=1772097400; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=FvCQKIeQDulHEvNvZG4/Rs7O2SMt0AI9xdkS+RkTuNc=;
 b=ezP2h9/3bfQEwIvOu2mvYFNuen93qISgnS50eC1i5POvqvWQjkGqqrzmYgCAhsFAAu
 SmAUugu8zBaSKN2Fg9q/HZEWyPzxFDuS3OsIfpKTB3MemPK7BlotoiqsusJG54mhMPsg
 7OejkMfZ7Xm+IGhiz9bQ7Tju4R4wgcMW7dH5Jccbn+bR9GVbT6pVa2KTds0zMZBEdOtL
 yx0W54mLywLO8FMJVYjw63qEiUSePvVimcr+Mlf0VheQa8+AlbUrCVlZe/QaboLgYqkv
 0N8xq5X2uIGNrntYqIfx/iJqKBUAi01MVftg5P+rvBFJ0OBqS4u+8GV08Ro8vB1DqBrw
 KtCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771492600; x=1772097400;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FvCQKIeQDulHEvNvZG4/Rs7O2SMt0AI9xdkS+RkTuNc=;
 b=HKgezMjTVENksfxb6UrPEKPBQRLwdQJl4Jv5KYPtZVB/0CBrbQfj3nbICk8r1UDNgu
 GNFqOCVp8j5omiHiIUdtlU/3xgyZ1VGEdY0RBkRoJqpJJb7RoZb1hzmUDfbv8LjDHpqq
 Q32DtLKK8u5NSfhx5963tLD+2V+VV57rsm9hqqdOaHGZftU0Ml9wIwOsK3mXgDxWVXX+
 ALnt26VonVF8T8TGzERXS5SRfMVgBte3nYoGSvUrWEr1WYVxcRP75T5L7gkjz02e6vJ/
 2ayVci7sP1ul2T0dz1vfsIN742uIM3t0dge1WalJKwau5ebeabokRQUEr/AMzPJKYLnh
 Odkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7hgE194TMTyPZLf62fAVrfPawYxTpJl8SF300DwTcLletyzzk1c3ODgqt+Z9wxkH+zD1cDrU5F/Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVpGZsvZsuMSluRg698JMvVxsKKBo/KLhqnLx8HRRKqCEylewc
 MhRO///yZMsNYHBrMbczJk6w5pQPncABjb+QXTczdMlHm8K1QNJJq6ZYtFbMioOBi+sl3MvfGbS
 JkuM+oGnV2lHyztSvzoiWH7zYf18u3KWNOYj4p0sRAuOh00GgPN0sCbbzhwz9NHZTZYRpdA==
X-Gm-Gg: AZuq6aKrW6Wnz4n54e3NMcURDsK/4TPVNUZds03FlMzfkvH0/6uohUYANmtX07yx350
 YCSsVM6huwOfMgLExHJHSFXoPizgUqwD8gscq5nVMN7PqaOtwiHE94NB1eX+2mOPLUUY35wTAXr
 OERiFcMy/ccE8bNpWh4cdvpOw85vf9+KOshKHrcG/n42c/iNqMhngPOW6cmUWgl3JqhPWzQLnUT
 WLGWeBagbE1FrCMdghfz3TxeBT8myS1pReCWigRxZSYBLTmDm9cRgKiJB9+mjTizNdnMTD8p5Fr
 H/B45RnYQeNdaGpJmQ75UhKtaMox/lnpJdMiUJcxnNxghW4t+ZXyM/I6uHnbuHo73lZXYaYGuw=
 =
X-Received: by 2002:a05:600c:8289:b0:479:3a89:121d with SMTP id
 5b1f17b1804b1-4839e66fc83mr23233415e9.36.1771492599592; 
 Thu, 19 Feb 2026 01:16:39 -0800 (PST)
X-Received: by 2002:a05:600c:8289:b0:479:3a89:121d with SMTP id
 5b1f17b1804b1-4839e66fc83mr23232985e9.36.1771492599016; 
 Thu, 19 Feb 2026 01:16:39 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4839ea1e7e1sm14492695e9.2.2026.02.19.01.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 01:16:38 -0800 (PST)
Date: Thu, 19 Feb 2026 10:16:37 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Eric Chanudet <echanude@redhat.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 Albert Esteve <aesteve@redhat.com>, linux-mm@kvack.org
Subject: Re: [PATCH v2 3/3] dma-buf: heaps: cma: charge each cma heap's dmem
Message-ID: <20260219-illustrious-tungsten-starfish-5dad8c@houat>
References: <20260218-dmabuf-heap-cma-dmem-v2-0-b249886fb7b2@redhat.com>
 <20260218-dmabuf-heap-cma-dmem-v2-3-b249886fb7b2@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="qbjavhllvvchwpql"
Content-Disposition: inline
In-Reply-To: <20260218-dmabuf-heap-cma-dmem-v2-3-b249886fb7b2@redhat.com>
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
	FORGED_RECIPIENTS(0.00)[m:echanude@redhat.com,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vbabka@suse.cz,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:aesteve@redhat.com,m:linux-mm@kvack.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
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
X-Rspamd-Queue-Id: 49BBC15D42D
X-Rspamd-Action: no action


--qbjavhllvvchwpql
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 3/3] dma-buf: heaps: cma: charge each cma heap's dmem
MIME-Version: 1.0

Hi,

On Wed, Feb 18, 2026 at 12:14:12PM -0500, Eric Chanudet wrote:
> The cma dma-buf heaps let userspace allocate buffers in CMA regions
> without enforcing limits. Since each cma region registers in dmem,
> charge against it when allocating a buffer in a cma heap.
>=20
> Signed-off-by: Eric Chanudet <echanude@redhat.com>
> ---
>  drivers/dma-buf/heaps/cma_heap.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma=
_heap.c
> index 49cc45fb42dd7200c3c14384bcfdbe85323454b1..bbd4f9495808da19256d97bd6=
a4dca3e1b0a30a0 100644
> --- a/drivers/dma-buf/heaps/cma_heap.c
> +++ b/drivers/dma-buf/heaps/cma_heap.c
> @@ -27,6 +27,7 @@
>  #include <linux/scatterlist.h>
>  #include <linux/slab.h>
>  #include <linux/vmalloc.h>
> +#include <linux/cgroup_dmem.h>
> =20
>  #define DEFAULT_CMA_NAME "default_cma_region"
> =20
> @@ -58,6 +59,7 @@ struct cma_heap_buffer {
>  	pgoff_t pagecount;
>  	int vmap_cnt;
>  	void *vaddr;
> +	struct dmem_cgroup_pool_state *pool;

I guess we should add an #if IS_ENABLED #endif guard for dmem?

>  };
> =20
>  struct dma_heap_attachment {
> @@ -276,6 +278,7 @@ static void cma_heap_dma_buf_release(struct dma_buf *=
dmabuf)
>  	kfree(buffer->pages);
>  	/* release memory */
>  	cma_release(cma_heap->cma, buffer->cma_pages, buffer->pagecount);
> +	dmem_cgroup_uncharge(buffer->pool, buffer->len);
>  	kfree(buffer);
>  }
> =20
> @@ -319,9 +322,17 @@ static struct dma_buf *cma_heap_allocate(struct dma_=
heap *heap,
>  	if (align > CONFIG_CMA_ALIGNMENT)
>  		align =3D CONFIG_CMA_ALIGNMENT;
> =20
> +	if (mem_accounting) {
> +		ret =3D dmem_cgroup_try_charge(
> +			cma_get_dmem_cgroup_region(cma_heap->cma), size,
> +			&buffer->pool, NULL);

This alone doesn't call for a new version, but adhering to the kernel
coding style would look like this:

+		ret =3D dmem_cgroup_try_charge(cma_get_dmem_cgroup_region(cma_heap->cma),
+					     size, &buffer->pool, NULL);

It looks good to me otherwise,
Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--qbjavhllvvchwpql
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaZbU8AAKCRAnX84Zoj2+
diB9AYDhkg6+tBwkM8yMFN9/WFT+hpPNlhGw0UEY/ZE0DHuKywzN1rTS3USBgeXc
4vi8MkIBgIRG4eHa1thavtEHDzWooCqiLhwDczcPdIil4bWekTGZxgf1mQQHrqGd
pK5ZeNH5CQ==
=YZKD
-----END PGP SIGNATURE-----

--qbjavhllvvchwpql--

