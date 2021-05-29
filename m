Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE25B394DA7
	for <lists+dri-devel@lfdr.de>; Sat, 29 May 2021 20:37:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AD3C6E1F8;
	Sat, 29 May 2021 18:37:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 351676E1F6;
 Sat, 29 May 2021 18:37:52 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id a7so3574497qvf.11;
 Sat, 29 May 2021 11:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to;
 bh=twoTbCEhVPknBNle9I5VmY9hPfyutTSbI17u0jwpKa8=;
 b=AUzIf1vANL4PJ+Mj5P1X9cSuxyBLENG8J5KHIoGWDODFxgkzl/VBV5cyMF2Lt4i815
 baHLhVLD9x80HQZBGNXNzNCIcJD5xTDSmxeUXJ4IYxUM7HYf5EY0VVE8Cq40WQML/8g9
 4YmRgANwAETngKJljQejxbyGLqgYF8BBKEK/6sEijzlMsjhxbJ8VsVY6wmdzl00C3qW+
 tFOBHw4Qc/D7cGXM3IkVHZFmAwoIOr3FN7H878cSEWMWiQ7pkWUZLOyUKmB4954NgBhG
 8ASU6PLuaYA57QvWeqWVWt1jR1kduMXR50Ymyz9hyX3QctMwmjH6szwUwme/V4Paz+rc
 s4cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to;
 bh=twoTbCEhVPknBNle9I5VmY9hPfyutTSbI17u0jwpKa8=;
 b=shf415vkJzggaIPLbsA571HFw7809KNUH4jNXslWVa1QUHbBpvgZ84ONMZnhbZpNSP
 5UdsOmUx0vUvj9fYrHCzYSB91JfASy6dRlILSJHJdFmBhOw3Z1aaEbzAWCmo/IuhQcbC
 ppVSUpRytGITJ+E+v7e50KHKVdKndXgddBsqfisFG2JoQpXe4OvzPtsGgTSkTEXW+C9T
 x9XpiKYa5t1P2i9PUmnDYbFml3hisccgY5HLgzxMrYFe1FQY7fgQPor0ZZrbHHBd/I33
 Un1A9k72VU8v+kLx/ZBZnQHKE0pp21qHBY+RTs64buYPPLfjpc2GDRV5P+kkY+V15Fzh
 dcYA==
X-Gm-Message-State: AOAM5330tX5+D7N6QmI8Kyy7NCUu8SxXMovKmIxMHRJYYTOxV2Q7lF4j
 feS6cQ5b0yzswdZfbS/z0CY=
X-Google-Smtp-Source: ABdhPJz0uL8MWJGDxa1FwCsNoPlfrXg7imFfr+QweyCsRvfT9WHa40yS9tpRnyJKws2MUxelWhXfmA==
X-Received: by 2002:ad4:53cc:: with SMTP id k12mr9600890qvv.49.1622313471993; 
 Sat, 29 May 2021 11:37:51 -0700 (PDT)
Received: from [192.168.2.100]
 (lnsm1-toronto42-142-116-203-225.internet.virginmobile.ca. [142.116.203.225])
 by smtp.gmail.com with ESMTPSA id g9sm5993707qka.38.2021.05.29.11.37.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 May 2021 11:37:51 -0700 (PDT)
To: Christoph Hellwig <hch@lst.de>, Felix Kuehling <felix.kuehling@amd.com>
References: <20210527230809.3701-1-Felix.Kuehling@amd.com>
 <20210528130816.GM1002214@nvidia.com>
 <f0bb142b-ab80-c16e-77dd-c7e1aa88c755@amd.com>
 <20210529064124.GC15834@lst.de>
From: Felix Kuehling <felix.kuehling@gmail.com>
Subject: Re: [RFC PATCH 0/5] Support DEVICE_GENERIC memory in migrate_vma_*
Message-ID: <66cfeddd-11f5-0dba-841a-dcbdf4a1cee6@gmail.com>
Date: Sat, 29 May 2021 14:37:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210529064124.GC15834@lst.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="EI7zzorYg30fi1H6VXHnRL7NAvh79DpSt"
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
Cc: amd-gfx@lists.freedesktop.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, Jason Gunthorpe <jgg@nvidia.com>,
 akpm@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--EI7zzorYg30fi1H6VXHnRL7NAvh79DpSt
Content-Type: multipart/mixed; boundary="ARIbLlR54FXkZwyu5Z6AqHqSmuRARcji5";
 protected-headers="v1"
From: Felix Kuehling <felix.kuehling@gmail.com>
To: Christoph Hellwig <hch@lst.de>, Felix Kuehling <felix.kuehling@amd.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, jglisse@redhat.com, amd-gfx@lists.freedesktop.org,
 akpm@linux-foundation.org
Message-ID: <66cfeddd-11f5-0dba-841a-dcbdf4a1cee6@gmail.com>
Subject: Re: [RFC PATCH 0/5] Support DEVICE_GENERIC memory in migrate_vma_*
References: <20210527230809.3701-1-Felix.Kuehling@amd.com>
 <20210528130816.GM1002214@nvidia.com>
 <f0bb142b-ab80-c16e-77dd-c7e1aa88c755@amd.com>
 <20210529064124.GC15834@lst.de>
In-Reply-To: <20210529064124.GC15834@lst.de>

--ARIbLlR54FXkZwyu5Z6AqHqSmuRARcji5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Am 2021-05-29 um 2:41 a.m. schrieb Christoph Hellwig:
> On Fri, May 28, 2021 at 11:56:36AM -0400, Felix Kuehling wrote:
>> Am 2021-05-28 um 9:08 a.m. schrieb Jason Gunthorpe:
>>> On Thu, May 27, 2021 at 07:08:04PM -0400, Felix Kuehling wrote:
>>>> Now we're trying to migrate data to and from that memory using the
>>>> migrate_vma_* helpers so we can support page-based migration in our
>>>> unified memory allocations, while also supporting CPU access to thos=
e
>>>> pages.
>>> So you have completely coherent and indistinguishable GPU and CPU
>>> memory and the need of migration is basicaly alot like NUMA policy
>>> choice - get better access locality?
>> Yes. For a typical GPU compute application it means the GPU gets the
>> best bandwidth/latency, and the CPU can coherently access the results
>> without page faults and migrations. That's especially valuable for
>> applications with persistent compute kernels that want to exploit
>> concurrency between CPU and GPU.
> So why not expose the GPU memory as a CPUless memory node?

We did consider this, and are in fact still considering it for future
systems. For this system we decided not to go that way for several reason=
s.

For one, it means the driver would need to allocate VRAM with
__alloc_pages_nodemask for its own needs (firmware blobs, page tables,
etc.) and traditional BO-based memory allocation APIs. The GPU driver
would compete for VRAM with other application allocations, such as
malloc, mmap, page cache etc. Benchmarking and optimizing the NUMA
policy for such a system with a wide variety of workloads would be a big
effort.

All VRAM would need to be 0-initialized at allocation time. (I know
about init_on_free=3D1. In fact that's what our GPU driver does for VRAM
today, but asynchronously to hide the latency. However, init_on_free is
synchronous and has other drawbacks for system memory according to the
documentation of config INIT_ON_FREE_DEFAULT_ON.)

To make virtualization work, GPU access to its own local VRAM would need
to go through the system IOMMU.

Regards,
=C2=A0 Felix




--ARIbLlR54FXkZwyu5Z6AqHqSmuRARcji5--

--EI7zzorYg30fi1H6VXHnRL7NAvh79DpSt
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wnsEABEIACMWIQSF9iw3xYpcigJ58/LWGSsMBQyTdgUCYLKJ/QUDAAAAAAAKCRDWGSsMBQyTdlIm
AP9YobaDl3U1tdF2IgIV+V3/rfI1H/rsutO1AHiKQuupCwD8C7slNVnonawvCCmmfNmkz1ubWJN2
HuBFddFzmw7eFEo=
=+pp4
-----END PGP SIGNATURE-----

--EI7zzorYg30fi1H6VXHnRL7NAvh79DpSt--
