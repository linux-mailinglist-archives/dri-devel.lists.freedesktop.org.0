Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0E3ABE8E7
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 03:20:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84B2810E575;
	Wed, 21 May 2025 01:20:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="i1MVFsdh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9251110E575
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 01:20:30 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-736c277331eso6360060b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 18:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747790428; x=1748395228; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jnKAj1wWT/aTEmBr0+5z/BZJBnA/nBahrmjpd0G356E=;
 b=i1MVFsdhFmMUf38fFZm33iy4QZb71zNFsfhpDEw9e7o3oSBy0Vy8BFd3gM7D8HPbZT
 KcyTuJZ2fv5R7LXtgfbQXSBe7uqJRyM4kMCi9k9x82kv3jt4qzFGzRtxKfjt26TFVX3M
 PmHBdK/LOeR5rnztWpanaTQrH0nIyMxe9stPI4ZxnAxpYNfq09kV2B8B3BfiG4jrF8lP
 UCbK6Vf218R9v6uLj5PwBkr0llTS/C649Uyw8izVkEfTcidjLEYItuX0TRudQ0nbanCP
 yt5KLYxW4Uvd0cqHFTak/Ne9aR+5PhaNCPAikhgxbTNwNxrsvyAZKbHa6c01TkF6eRBn
 tRVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747790428; x=1748395228;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jnKAj1wWT/aTEmBr0+5z/BZJBnA/nBahrmjpd0G356E=;
 b=Moe5yMnwSWGxmJe1sNxR8ntX1l/kccNkC2y6AfTX8tsfnlL6s0oHBhu7bC/d8LzCbx
 XQE0krcdEwWyreIr7MSLsXCCfdbOZ9FiC3VsH/tNcvkAMmI92RoTtrh00o77CtaS44BY
 wMQTwU7jTme6efwzo+xrGqwM2CXFSDpjCN8hnBzEttPQ2dvAKiKMbyT5CJO2KRW0jLSz
 QcJVg/lGrUMChOH7wtQKHwUwdG2T2MsrJmRKRR8fmJaNvd/VRFh1fuICnIB33c2UeTKE
 dbOKuxGnQSOlcBqIqt8NIzSzvpUA60w5MLE6vZjEyhS3ZACCUUccgbwwu/utg7Jci/VT
 kLQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1THcFRDBnXNlSiuM4u35GoHDXgIMKjHdSk5sV5KYzb1y+eU7IISppCLbz52M7Yn5ZkdRbPs52PlA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5K/5qJxQCC0KygFQGI48yINxED22wykZfyslWYLxlLiOvp7P4
 dK7CzvmUs2E4pefaaghD2JzuAypt9AjYFrfHOT5ijcub8z/eATyg6AVl
X-Gm-Gg: ASbGncs+2HzIsLUOxjDvGCRApvwyHDbDC7OVVAaJSHwEdEAnpNbrlQmYbvGbNnSy+Ut
 TbSz6UQAmeHUN+NcpMAxyXjmcJ2OsyzARHcMQAkZP2qfhd8buNE+AcBJBQM/9HVoDHhl46zbhub
 0t3KTVJieYZbHbF7OrsupLwy9mxfmF4CIKpImDFghN01aR2lydAwjTtuhKIXaHozfNbbKumUTM4
 8QtuMi5RsZn5Xv54/txbzW8eEW4v3SRrX7ur86mQabnGnxi31D2T6eEhg+rR0EldUsWM6jOCs4U
 Mj/FNdrHcIzoi4BdFDKPK8F7UV9hYS+0YdRoPGXBd6FGxHdNjsU=
X-Google-Smtp-Source: AGHT+IGRcGw4PVFj0KvWzf8iJ8NGOPcjIwY8wENV5Bey81drCVnYSC8vD3YByIiTH8J/jVDLY5vGpw==
X-Received: by 2002:a05:6a21:7001:b0:215:e8b5:3df with SMTP id
 adf61e73a8af0-2165f6458a4mr25920161637.7.1747790428180; 
 Tue, 20 May 2025 18:20:28 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-742a98a33c3sm8872598b3a.176.2025.05.20.18.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 18:20:26 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 390A344FBDF7; Wed, 21 May 2025 08:20:22 +0700 (WIB)
Date: Wed, 21 May 2025 08:20:21 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: dma-buf: heaps: Add naming guidelines
Message-ID: <aC0qVd1D_L-LtbxC@archie.me>
References: <20250520-dma-buf-heap-names-doc-v1-1-ab31f74809ee@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="NypwNQ7lUsvPyCso"
Content-Disposition: inline
In-Reply-To: <20250520-dma-buf-heap-names-doc-v1-1-ab31f74809ee@kernel.org>
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


--NypwNQ7lUsvPyCso
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 12:00:53PM +0200, Maxime Ripard wrote:
> +Naming Convention
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +A good heap name is a name that:
> +
> +- Is stable, and won't change from one version to the other;
> +
> +- Describes the memory region the heap will allocate from, and will
> +  uniquely identify it in a given platform;
> +
> +- Doesn't use implementation details, such as the allocator;
> +
> +- Can describe intended usage.
> +
> +For example, assuming a platform with a reserved memory region located
> +at the RAM address 0x42000000, intended to allocate video framebuffers,
> +and backed by the CMA kernel allocator. Good names would be
> +`memory@42000000` or `video@42000000`, but `cma-video` wouldn't.

Looks good, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--NypwNQ7lUsvPyCso
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaC0qUQAKCRD2uYlJVVFO
o0PWAPkB0WhcqMYxc22GRsTrNHTiOOPmCuqttpkhvh7zJak34wD/RfEvLDvJd4S0
gd404Ak39Db39XlwIwe0XTZMK8hm4AA=
=6/NP
-----END PGP SIGNATURE-----

--NypwNQ7lUsvPyCso--
