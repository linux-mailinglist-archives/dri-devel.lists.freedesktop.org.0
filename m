Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id zKi+Ebk+imksIwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 21:08:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5C8114553
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 21:08:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8217A10E36C;
	Mon,  9 Feb 2026 20:08:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Zxzfq94r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72E5010E36C
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Feb 2026 20:08:17 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-b884ad1026cso13359466b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Feb 2026 12:08:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770667696; cv=none;
 d=google.com; s=arc-20240605;
 b=P23AI58EhbS4y43UiHcz0BK7V2HF7ZApDno80dlepR/41UdT74ncIThNVYg5X6GauZ
 ujOT6NsZgyPRv4jqaNBNzUJp27qWfAFo6Zc5xqFkoll67+gSyWalNxn5zZNUeJEIDJAc
 qnOAVxFf9zhi21ILblFOuRbLlURW5vKimXYuV6cPMjYsh4WDMzSaKyrdm+XRYrOmq5WJ
 sR1gjNjLoJ+U/5poUs77WYsWVKlSyvKzSKRGfJdU2T1y9yusW1MI0pEmrWhTPhJjMJQH
 uN3B/6OeemTqVxK8bJ6LTbUwx0jqwq7+SWxGzzWt1cBNEOPutRCLbUkV0WX9tCZyQ185
 k5hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=/ogWTbSZ6gUFcHF4DB6Cif+r0lW3KkX6R4Nx10iOT0E=;
 fh=mfhnUmUQeqTNzS9rwMuBAPxcROppY5k8sgmAq7oo4JA=;
 b=Wv90m3MdoUSQnaepD8aZgHgNGZ8LPBsZys39g13MFXhVM54uhkagpCqM+OE+u6N/Ks
 znsfNz7m9FLOH+Ukf+9PJIkXgorVGLEULppEEhkxymgPxSR9eDVylHPDHDpqwLgdmhkj
 t95buHLtpLxisx2PRz+DkSy1fNqQKnNcscGuOXRJolMFthxlSVpoTua0MvQ4TYd17LII
 cALUdS/tMDYqBCD9UNjaAsAWFpu3GfUizMaPciz823eDcX7QWZOqBKz19YFHFa5ZtkMo
 GnZ/+/nDkL2KoU8TpPW7UarAIXArCUbPVHHWUqTCoHnXIVVHwsvj7HnwLaYsrHTZK0CA
 miyA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1770667696; x=1771272496;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/ogWTbSZ6gUFcHF4DB6Cif+r0lW3KkX6R4Nx10iOT0E=;
 b=Zxzfq94rSmoEL6xKhFuijBTPpVvTyYZtOj36S+2GDyi+nyc6WdMOah1JiMnhT+6VFg
 BefV4Y7l3LhD5gzSQw/kpEm/hbkqtk0XwBU8PA4MZ6sSTvd1q0f8sMP48djYqvVsv50u
 PNBXECeS3rJvSo50nRlZF5aqR92Q6T3w8LQHUpa9O7Ts6qe0lQPdwBrmk0vxJdF9lEi7
 z/OYC2rAIhvDGM54omzLOxGmkoF1vGOIZvS3REZ5rEf1rAbot3W4huYGZVqHzYg5xztw
 XZjVbNSFpzqen9vRv5Kjd9RfN9fJ5dGgeY4GB3W2hf5gsZnn284SgkyQDcQOsfdXe7sL
 F4kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770667696; x=1771272496;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/ogWTbSZ6gUFcHF4DB6Cif+r0lW3KkX6R4Nx10iOT0E=;
 b=HDUixalEbuxuRYF/Ad145BDYg+p4jQc0Bny+at9DwAWImZlGMD1RJnq8WqFCdZB9s6
 dpF0x1BXAEmZlF5Yk27pGjxzrIrJVYXwMlAbKK+6wcZ5Q+VtpyVF0UJrhJgO14gVr4o+
 xCnPCMOhQReB/DAd0UAIK0l6y62N7ZTdAyENcTrOuNIohbTr3piD9/FSnE3ecWDWRuj+
 /vKyXxuJtgi20VM41yKtUsFr5rDU+qnup60t6J0/YgVpMt+akEKQMHWvPz3SEtCQJxrL
 vsBi/Mrx/psnFduzryfEnXWZwyFOe428QEN96Jks5IVrbe/Ymdj4vetdN80lE/TEys+U
 bknQ==
X-Gm-Message-State: AOJu0YyPNR0Rwd1r7P+cLIUaUlnsvuF8bNfuMJjdnRANgHkfNd5fcgms
 JUFQQ64mXErR9D9MThMN37KZOBDV9449ZsDqtS6+rL7NxLU0tMerjXZyliUPYzRh7QFcZ85pLYy
 1uxEbM2sr/vGdkw6fasfQTpMvOENrl2gF0i97xJk=
X-Gm-Gg: AZuq6aKXBCHXB0HinCXKfhlaij7auuEmMzM2/Eor9J2Q/J1HMD9giK4gV0Ib5W0a4uF
 8DBVfGR3dxMQk/8re6aYPenZuDnh+ySDAfdgAxFfG1BwAeNjRKUYS7tMgS3qH/i9dIpfeWntcpV
 fXq01m6mIG9PtErs8IswMiEkSqIsnCjxsupTxy4JP2EbiAkUXF80yeZm7J7aXX2QUBxPpXvL0YU
 AVIXn6PMjavUjaw3peD7OrJXwo4sGgWh341sUU6jH/o4eqcKDCqoLpj87Q1dxrznIlmc9i14T4O
 Ps7xN3uSTMhSfKhaCGI=
X-Received: by 2002:a17:907:6d0f:b0:b74:984c:a3de with SMTP id
 a640c23a62f3a-b8edf25a954mr696952366b.28.1770667695453; Mon, 09 Feb 2026
 12:08:15 -0800 (PST)
MIME-Version: 1.0
References: <20260209153809.250835-1-jiri@resnulli.us>
 <20260209153809.250835-5-jiri@resnulli.us>
In-Reply-To: <20260209153809.250835-5-jiri@resnulli.us>
From: John Stultz <jstultz@google.com>
Date: Mon, 9 Feb 2026 12:08:03 -0800
X-Gm-Features: AZwV_QgqaltPSA0q99dWV0j2auNF_GQoTvkX0OemEzMtzBNfhVP0pPFcsDiXkzY
Message-ID: <CANDhNCoHEZsNRmU+3z5AbeAy05H7PTtUdTq1apNd5k0f9hWW8A@mail.gmail.com>
Subject: Re: [PATCH 4/5] dma-buf: heaps: allow heap to specify valid heap flags
To: Jiri Pirko <jiri@resnulli.us>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 iommu@lists.linux.dev, linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
 benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, tjmercier@google.com, 
 christian.koenig@amd.com, m.szyprowski@samsung.com, robin.murphy@arm.com, 
 jgg@ziepe.ca, leon@kernel.org, sean.anderson@linux.dev, ptesarik@suse.com, 
 catalin.marinas@arm.com, aneesh.kumar@kernel.org, suzuki.poulose@arm.com, 
 steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com, 
 ashish.kalra@amd.com, suravee.suthikulpanit@amd.com, 
 linux-coco@lists.linux.dev
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
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jiri@resnulli.us,m:linaro-mm-sig@lists.linaro.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:jgg@ziepe.ca,m:leon@kernel.org,m:sean.anderson@linux.dev,m:ptesarik@suse.com,m:catalin.marinas@arm.com,m:aneesh.kumar@kernel.org,m:suzuki.poulose@arm.com,m:steven.price@arm.com,m:thomas.lendacky@amd.com,m:john.allen@amd.com,m:ashish.kalra@amd.com,m:suravee.suthikulpanit@amd.com,m:linux-coco@lists.linux.dev,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[jstultz@google.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[131.252.210.177:from];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jstultz@google.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[google.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[209.85.218.54:received];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:email]
X-Rspamd-Queue-Id: 4C5C8114553
X-Rspamd-Action: no action

On Mon, Feb 9, 2026 at 7:38=E2=80=AFAM Jiri Pirko <jiri@resnulli.us> wrote:
>
> From: Jiri Pirko <jiri@nvidia.com>
>
> Currently the flags, which are unused, are validated for all heaps.
> Since the follow-up patch introduces a flag valid for only one of the
> heaps, allow to specify the valid flags per-heap.

I'm not really in this space anymore, so take my feedback with a grain of s=
alt.

While the heap allocate flags argument is unused, it was intended to
be used for generic allocation flags that would apply to all or at
least a wide majority of heaps.

It was definitely not added to allow for per-heap or heap specific
flags (as this patch tries to utilize it). That was the mess we had
with ION driver that we were trying to avoid.

The intent of dma-buf heaps is to try to abstract all the different
device memory constraints so there only needs to be a [usage] ->
[heap] mapping, and otherwise userland can be generalized so that it
doesn't need to be re-written to work with different devices/memory
types.  Adding heap-specific allocation flags prevents that
generalization.

So instead of adding heap specific flags, the general advice has been
to add a separate heap name for the flag property.

Now, there has been many discussions around "protected buffers" (which
doesn't seem to map exactly to this confidental computing primitive,
but sounds like it might be related) , which have bounced between
being a allocation flag or a device specific heap without much
resolution. I appreciate in this patch seires you've pushed your
concept down into a DMA_ATTR_, as I do feel the kernel should have a
deeper sense of protected buffers (or any general propery like this)
as a concept if it is going to be a generic allocation flag, instead
of it being a somewhat thin creation of the outer heap-driver layer.

But, it seems like the use case here is still far too narrow for a top
level allocation flag.

So I'd advocate against introducing heap-specific flags like this.

thanks
-john
