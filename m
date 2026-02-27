Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MUnNZtgoWmksQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 10:15:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4307E1B4FE6
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 10:15:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E007110EA6D;
	Fri, 27 Feb 2026 09:15:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="R9CTuJ9i";
	dkim=pass (2048-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="XfsJS+NU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E96610EA6D
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 09:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772183702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SN/V8YGuTcxY85kDU89KkD1e6w8cvJs3/3Dd7L0T5yk=;
 b=R9CTuJ9i7ITbFT/y855/nbacwtvwU6vOVh3VBc3zUvgPd1s+rJgGzoMZgzVctn2eSJVOpN
 zUMKiTRH1UxNCbWlGGN9h1S46bNzAlmkjdnT9QkHfVREsu4vxCX/9Jhn4/ri4pUG+Nnp4N
 nGVJdsOXmQhr5nN8O9AJ2jggs2e08Xc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-XVc7CDVaMUWV1n1sIJPrSw-1; Fri, 27 Feb 2026 04:15:00 -0500
X-MC-Unique: XVc7CDVaMUWV1n1sIJPrSw-1
X-Mimecast-MFC-AGG-ID: XVc7CDVaMUWV1n1sIJPrSw_1772183699
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-439972a5edbso1457020f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 01:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1772183699; x=1772788499; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SN/V8YGuTcxY85kDU89KkD1e6w8cvJs3/3Dd7L0T5yk=;
 b=XfsJS+NUm5Pnw4CAM0aJs6+IYz01Wc07Nx+bFD6KLccEYcyDkzx5ulrcZsqjXYWuNN
 2ZYYRIfb3kmEhm+2iry1iS2GAxI6aC/s1yoRgPokMv76XdevfVgM1oGym3zmlb6xwK2g
 QNB+NhYNwbQPDmWEjayVpuMZ7YsEbIdcvzqVXJOScm6CWFEKr43ixaxUrC0sttXXZPWR
 6Rt4ahiu4HUEf5E4nUBodgLGmpR9Zba6EzXtsNAq9WzM21lYVUzdORr9N4AqU+3FXpM1
 UdP/7Xrn19+7oaPQoetzdQ7/FbKhb96usI4K8wslSxfJE5V80FtIk5xdCAeEbKr6XgWP
 E8Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772183699; x=1772788499;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SN/V8YGuTcxY85kDU89KkD1e6w8cvJs3/3Dd7L0T5yk=;
 b=Oj+aiy8DSfQCDqD1CDNXIRxU31v51wUJvG/ViYd2qzPJiJ7hrFAedc4WHXy8Jjsoyw
 Dbn4R7ChCnpfN2HhY9cmmYMfV3k6bkQYpqk4xgioNpB20NEqtj50MYGrvLoY9jqogs+o
 pdcgte23Z2ksmdL85Mq0GcG4x23KfCiPyqGr78fR1cqGuRE7SYa7JmY7ECNbmuvwy1S3
 odKH5aIHlBhv9tYAK0kqBauYzPuMwj6+f0GMBPH1E9SWBwPb3YUE3ulNKiJiO7PT47CV
 C/xMVuDOQl9MQzBtp8MY2Au5585NehOSrM+X9VFy6GUhjqkEtPzMbfZh/cRFU4ToHXYx
 7dWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5nqvWPj4JbCOgU3IYYcSxetzzRvEE7XnRKWwT1l8fq2HQImcKDbIJt4a8Qvss1inwjeE+LRCALAA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNTdDRrPHa7E9h2hkKl54MK4UaCYY9afcelVabyq37LORZF0d/
 RSMo/dSDo6o49krbSXcPNpXcO6q4D1bUHL4jMv4bnO9EaQ1nnveH6Su8yI35oVYStr87KRBTpYJ
 t+0dKSyLdfvf+/oYz+/3JkqFZnoj6gkReMfSW1JvdrkML/hZABrRZbYWnGGxceeTXuxxMgg==
X-Gm-Gg: ATEYQzyJy7PEx8JomyRzizbBs06q6WQqys+Pt43L+n0mQ4GipY7g1fofQPZN5/iBGSk
 ivIVsjXbDtxiMQ91L4+qV04AXy4QPc9IaxXPHRRku7Gjdi8BEGdEgWQ9GKws6Re+2kRGFr15Eor
 QixH2uS+QGmyupW6vnLQguZjPfHkXlbScMQY97zClf8fNzgfrthriROaEL05kvoY5e7S92V7LHR
 mXl9Odii1vKD+itmAgWsEOzwug1not3wQjBCgb9LNqhRu9IfjEJmcxnTJskMM4AeoFwjVsZ2nlH
 e8RG8TaxKva9wjFCQts7kqa05LcBoNltuRQE76GCAxeRn2OqdBdq4LyFLNyp9DtKIcGhSP7YBA=
 =
X-Received: by 2002:a05:6000:26cb:b0:432:c0e8:4a33 with SMTP id
 ffacd0b85a97d-4399de14d4cmr3501743f8f.22.1772183698331; 
 Fri, 27 Feb 2026 01:14:58 -0800 (PST)
X-Received: by 2002:a05:6000:26cb:b0:432:c0e8:4a33 with SMTP id
 ffacd0b85a97d-4399de14d4cmr3501597f8f.22.1772183697160; 
 Fri, 27 Feb 2026 01:14:57 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4399c76b20bsm5748279f8f.35.2026.02.27.01.14.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 01:14:56 -0800 (PST)
Date: Fri, 27 Feb 2026 10:14:56 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Albert Esteve <aesteve@redhat.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 iommu@lists.linux.dev, echanude@redhat.com
Subject: Re: [PATCH] dma-buf: heaps: Add Coherent heap to dmabuf heaps
Message-ID: <20260227-gleaming-saffron-binturong-580b3f@houat>
References: <20260224-b4-dmabuf-heap-coherent-rmem-v1-1-dffef43298ac@redhat.com>
 <d05a81ff-c6af-4621-9593-d06f80220e34@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="hjogu5z26zgaiwsw"
Content-Disposition: inline
In-Reply-To: <d05a81ff-c6af-4621-9593-d06f80220e34@arm.com>
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
	FORGED_RECIPIENTS(0.00)[m:robin.murphy@arm.com,m:aesteve@redhat.com,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:m.szyprowski@samsung.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:iommu@lists.linux.dev,m:echanude@redhat.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,xyz:email]
X-Rspamd-Queue-Id: 4307E1B4FE6
X-Rspamd-Action: no action


--hjogu5z26zgaiwsw
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] dma-buf: heaps: Add Coherent heap to dmabuf heaps
MIME-Version: 1.0

Hi Robin,

On Thu, Feb 26, 2026 at 03:22:05PM +0000, Robin Murphy wrote:
> On 24/02/2026 7:57 am, Albert Esteve wrote:
> > Add a dma-buf heap for DT coherent reserved-memory
> > (i.e., 'shared-dma-pool' without 'reusable' property),
> > exposing one heap per region for userspace buffers.
>=20
> Despite the "shared" naming of the compatible, these kinds of reservations
> are often for highly device-specific purposes, and sometimes may not even=
 be
> accessible to other devices at all, so it's far from clear that there's a
> generic use-case for connecting them to dma-buf. Certainly it doesn't seem
> like a good idea to unconditionally create heaps for *everyting*, and give
> userspace free reign to mess with things it doesn't necessarily understand
> (especially where usage-specific restrictions implied by "no-map" are
> involved) and which may break drivers.

So, let's take a step back. We want to enable cgroup memory accounting
for any buffer allocation done through an ioctl, so DRM dumb buffers,
BOs, v4l2 buffers, dma-buf heap allocations, etc.

system memory would be tracked by the memcg cgroup memory, dedicated
memory pool through dmem, and CMA is kind of up in the air at the
moment, but probably both.

That means that when calling dma_alloc_attrs (or one of its variants),
you would not know which cgroup controller it's going to account into,
and thus enforcing limits becomes difficult.

So the plan discussed last year with the DRM (and then v4l2) maintainers
was to get away from using dma_alloc_attrs entirely and rely on the
heaps instead. Heap drivers would always allocate from the same cgroup
controller, so it's easier that way.

So, in order to get there, we need to create a heap instance for every
possible dma_alloc_attrs backend.

We have that for CMA and GFP already, but we're missing coherent (and
maybe more?).

> Most drivers that accomodate a memory-region expect to manage it themselv=
es,
> so I would think it should be up to the drivers to opt into delegating
> "their" pool to userspace by registering it as a heap. Or at very worst, =
at
> least some additional DT compatible or property to indicate that it really
> is safe and desirable to use a given pool in a truly shared manner.

I'm not sure a DT property is going to work there, because then we're
going to have drivers bypassing cgroup accounting forever. That being
said, I think we can work with the opt-in option you were mentioning.
That way, we could do it at the DRM/v4l2 framework level and roll it out
for all those drivers, without affecting the other framework and drivers
that could use it.

> Otherwise, If we just present some heaps named "memory@xyz" to userspace
> (arch/arm64/boot/dts/ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi is a
> fun example), do we really expect it to maintain exhaustive
> platform-specific knowledge of which actual device(s) they belong to and
> what they're for?

That ship has kind of sailed already. I'm not pleased about it either,
but it was the outcome of the discussion last time.

> And if it does try to just mess around and allocate and map stuff, how
> does the dma-buf layer also have all of that usage-specific detail to
> know what memory attributes are safe to map with etc.?

Sorry, I'm not quite sure what you mean by that. Did you mean how we
have to care about caching for example, or something else?

Maxime

--hjogu5z26zgaiwsw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaaFgiwAKCRAnX84Zoj2+
dqyJAYC1uBydtbMfbpOFtGCNJsHB17IA4OH5sJIk3fS2LDU/EQuKyKw7R/VeibN4
q57PX2IBf2dgDshYL8OBvoLDgsJkfFUj0iSSKlBoDlKgHznvB/qC6QhahQoiJcKe
NX2SEVA1rQ==
=liUf
-----END PGP SIGNATURE-----

--hjogu5z26zgaiwsw--

