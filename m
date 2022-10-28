Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FF8610910
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 05:54:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9200D10E751;
	Fri, 28 Oct 2022 03:54:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 899A210E751
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 03:54:06 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id s196so3757360pgs.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 20:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SsqVuyl6BD6W3LOL9WC66L6RjSvAiVZfFFErAmVMHQE=;
 b=dUYSa32+9bO+LCOLFp+rBQ0F5Pnx+isYGovlF40t2/P9vWnEiDG1Q8itO/+XkeTfSv
 zeWWwwKbS7UPTj37mKzqvzWyo/9u79rMxtpNLZCnsQzGCKG4/XQEGI6rWazC+esHIrR9
 btLXbLJDJGt0QWJbBzwMHmRSR3zavgOTLsv3dHhkf0LRDL8A+8mbGkgYFXyRzhuBME86
 10p2gPkZHql6RgTLb1NnMmQGPGAKRLo8YbKihP4ZEHe9sgtbn0EsxUvy7e386JtBMfKD
 5P2utkAPzf/afxV4NKBCtAnnAe9Xynyms7eS195Tln69ZL4ofRdB8AwNHZDVRwsk8AX9
 RCDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SsqVuyl6BD6W3LOL9WC66L6RjSvAiVZfFFErAmVMHQE=;
 b=MU5h2woWMSsxCW8qoqBM0KtXVVIpAH6MzGmcYWP2m+5ev81fQ/lCVO4a15qhV1RJyC
 H0/46+qIHD/zh/kRBhKxdo6w+cJw3tLvwk9LjKU0F2tv3iGEoM2RHwI65gZZLThvHN1d
 /WxLOGpqoGUOqEAvNFBPv1RB16Ph3dXnPaD6LRk5oWtJPi2PcacUOeX81tWNsdGCwLbf
 5SO9YVm7IMHFO4g7iTBTCH+ooune+CeXTwkDSo6tP6IN0UjpX4G93FAc0r786qHZfEKT
 qFpdk0NZjmKDimu5zrN5kAFvGwj41HP6p9E1vVD2DAdYjdzdPx5mvpeopqjJZD0BynPj
 yIkw==
X-Gm-Message-State: ACrzQf3d88m0Y7Ozd8UOmYfnvUuN0SDvRvcxLJDPe3Hsh6vt8sDIEGRa
 mfxiKA/uhrqaHlZYZOKdxz0=
X-Google-Smtp-Source: AMsMyM4bStqmnjlTlD7oXh4az3KTHKmmK9eUmdVgeh7CmFo5zsALPHcOUlMD7hSZndCAJD9JRpyh8A==
X-Received: by 2002:a62:174a:0:b0:56b:9fc2:4ebd with SMTP id
 71-20020a62174a000000b0056b9fc24ebdmr28907080pfx.21.1666929246176; 
 Thu, 27 Oct 2022 20:54:06 -0700 (PDT)
Received: from debian.me (subs32-116-206-28-58.three.co.id. [116.206.28.58])
 by smtp.gmail.com with ESMTPSA id
 b79-20020a621b52000000b005618189b0ffsm1888035pfb.104.2022.10.27.20.54.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 20:54:05 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id 3F7BD10030A; Fri, 28 Oct 2022 10:54:02 +0700 (WIB)
Date: Fri, 28 Oct 2022 10:54:02 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Subject: Re: [PATCH v2] dma-buf: cma_heap: Fix typo in comment
Message-ID: <Y1tSWo+eRvkVofbv@debian.me>
References: <20221028014422.16422-1-mark-pk.tsai@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9jroqsdkTIsPFvYm"
Content-Disposition: inline
In-Reply-To: <20221028014422.16422-1-mark-pk.tsai@mediatek.com>
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
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 yj.chiang@mediatek.com, linux-kernel@vger.kernel.org,
 Liam Mark <lmark@codeaurora.org>, linaro-mm-sig@lists.linaro.org,
 John Stultz <jstultz@google.com>, dri-devel@lists.freedesktop.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Laura Abbott <labbott@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--9jroqsdkTIsPFvYm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 28, 2022 at 09:44:17AM +0800, Mark-PK Tsai wrote:
> Remove duplicated "by" from comment in cma_heap_allocate().
>=20

This patch isn't typofix but duplicate word stripping, right? If so, the
patch subject should be "dma-buf: cma_heap: Remove duplicated 'by'".

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--9jroqsdkTIsPFvYm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCY1tSWgAKCRD2uYlJVVFO
o7b5AP9yoSZf7rdWvcCNTl0/IR/t+dbwcnJqX/nlQZpEECxVKQD/Z3fAqDYIRA+n
wGfL9LkOMEPw+7g5fFLl5BC/vBZFBgw=
=krRN
-----END PGP SIGNATURE-----

--9jroqsdkTIsPFvYm--
