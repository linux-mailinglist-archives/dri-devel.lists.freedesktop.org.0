Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 877D4BE1101
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 02:02:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7974110E049;
	Thu, 16 Oct 2025 00:01:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YXSqGUbY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D25810E049
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 00:01:57 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-77f67ba775aso233775b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 17:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760572916; x=1761177716; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Zrfi/VMjUvLRNlm3QRjfVIbaOCS5M7RG1lr8DfSwgF4=;
 b=YXSqGUbY084rQonY9pZRkZv0/feagEQ3qG1WOsDFmZryBvQ5pZmKxJUQpeQ6XYZx7r
 Asby/zYJI82FptPaW2jmNB2B7mDDy6ttKvl1Qf7n/vLL2Ixm1+AYTcr6WbylFRlh76vg
 H+wHt8e5hXOUUYMfKJBQh5Omweo807vzQggFedhBC+txeTBpoqElTLEDLcONpWe8vUtS
 zJe0t4ehZySXMpfhjXcTUBdevfVgs54ep5uAzsy9ia+MSMbJSzwOdJiRczsFeTC3spV2
 It2eDyWBI6i1zkcI9jmCw7BfFraLK/wmHwUpLDQ7tgCC9ZHuyhybkKFYB3oLtS2Ljrn7
 jNdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760572916; x=1761177716;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zrfi/VMjUvLRNlm3QRjfVIbaOCS5M7RG1lr8DfSwgF4=;
 b=AmDk1ed5JP3zJr/3TqMUGzH3myGIcFxZPjFK3TrKsW4ZkgoJXRNJLTO9o4bNuJQ0sL
 8tcECsKipiRvqIZeuhpSa1/2PdPp97/RvrQnyNVcQTlzlE5EgHPlg2Sw6KxReOgoH0yu
 pF3oGYoXbaBG/Vydj/wQPAq49QGmTyoZBEtnK39b6Yy1+zob8wNjticUdnTrx3/BdqIb
 XlHrIQLf1j+zW0hThzDlRz5n9grdNDHjfeaf1W5BP3oW3SJ1ynBvLcRxwyX2HnqwKkyX
 U1ibX81EFYI60KaznizU0MmedMxRjhPaF1lOULofzDasdzGgOwRvDPAvVy5rKd36k+W+
 vq2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtJdbnK3wLWvvIfym705qvkun0nLec9qLVlczJ0/jq0N+qRqUSHbz/vGa4B2v66VagXMvQ76bOaLQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxfjPFzxqkUdRf2JGKd7gpaB9Kub+xfxhVQ1uAw6q2qFsTIsUzm
 QpbMJ/fuxB7b4CCnP+wzNTXZo3ql1AtARAR3lt7xj93F0Lo3/FZbvC0K
X-Gm-Gg: ASbGncuHpsurMope+nfnKNV8s7hDLCJxzqZykv+C71sWppw5M6v1Od0tVP0jOxYaVdr
 og5xebgECc4MugIdqemM9Z9h3d2YEXw5skRK2yYT+p4p9bMiolZsoegyVDSaS5W/0+em3cIb/NO
 u1L5PTfHxRIgZVZmSChQAEOJS5vAzJbHHzerAtynrn51ujxDpNxRQQBwLS3OixcLrjcCOa2xXYc
 6/cy9nl6OY46XClgHZqMm3tuYgNF3deElfZzKpCYfU9fpUagLGe4nPTDGj1XWfEDyj+UUtZiqzj
 Zk12qKA8MyPzkhIFFNUiUS0YUztDobWugEo+jhh8oxRIdt0L27iGYuhQ/rXfuJJfcXPUKJe6mOX
 lfrNoDxfOIm3y0I/O9uph60r4T+6CUZM9No5H1wygfTNTQ8+NhNMcH3/FW50rKCLANVtiGYa/eZ
 PX2nQz8FzvbLtU+g==
X-Google-Smtp-Source: AGHT+IHWPFl3wQ4UvDVjKcFZV8JmCaZHewB/K/pGnpEkw5mCOGWpXdamSbh5/nnQLrluiU4qXrWD4A==
X-Received: by 2002:a05:6a20:3d1c:b0:2e8:1c23:5c2d with SMTP id
 adf61e73a8af0-32da845fde6mr38728255637.50.1760572916459; 
 Wed, 15 Oct 2025 17:01:56 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7992bb11ca0sm20159494b3a.32.2025.10.15.17.01.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 17:01:55 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id AC288420B701; Thu, 16 Oct 2025 07:01:53 +0700 (WIB)
Date: Thu, 16 Oct 2025 07:01:53 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Kriish Sharma <kriish.sharma2006@gmail.com>, sumit.semwal@linaro.org,
 benjamin.gaignard@collabora.com, Brian.Starkey@arm.com,
 jstultz@google.com, tjmercier@google.com, corbet@lwn.net
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] htmldocs: userspace-api/dma-buf-heaps.rst: fix block
 quote warning
Message-ID: <aPA18fxQW398WHte@archie.me>
References: <20251015183402.1649988-1-kriish.sharma2006@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="sY9Nki+MnmfjR25j"
Content-Disposition: inline
In-Reply-To: <20251015183402.1649988-1-kriish.sharma2006@gmail.com>
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


--sY9Nki+MnmfjR25j
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 15, 2025 at 06:34:02PM +0000, Kriish Sharma wrote:
> Fixes: 1fdbb3ff1233 ("Add linux-next specific files for 20251015")

The correct blamed fixes should've been:

Fixes: 507211e3c7a1 ("Documentation: dma-buf: heaps: Add naming guidelines")

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--sY9Nki+MnmfjR25j
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaPA18QAKCRD2uYlJVVFO
o1mRAQD9zW96GC/QMBetvLQDoIrsCo0iDBbnK6vSUvPUFGiJBgEArGkrI0xtSD65
ufBe3Zc3jnfHJR/WnO5dziYq1UDYjQw=
=fHXv
-----END PGP SIGNATURE-----

--sY9Nki+MnmfjR25j--
