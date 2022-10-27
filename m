Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4616860F7BF
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 14:44:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C3D610E601;
	Thu, 27 Oct 2022 12:44:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC60010E601
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 12:44:28 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id f23so1334130plr.6
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 05:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=WP+7R/Fr2VMJLa5AXizn+zOIuwCy4AiCbk7L9UfX4Zw=;
 b=agwMaoXKy9Wbn7+kG/2zoL2ab09hLBHI3OWHuBTISVwNYL2VkJUvzxCRoL49OCshBj
 vLioT/vawmbM+eFCEGMjfNYBG7euvnY+eyE98TBYycgStlmJnIPInsn8srezL58PDRl3
 GbQRFNvB+CskWz5NEW4VF4ylYuXxQLQIFGWxPAPRT4aobnXX5r3NioqpU61GBtW1SsyN
 78gcwnit22wAzscY5gBg5HbZTcffuWqOnD8XVVJwUvz5JS9yy9l/rcL1J9r7YFGn9Tdr
 T1bD5t0YqlJzWkGgCkwslI3+2L9jbWFoe1V7+E7bwxjo1dJHsQjhJGvfdnoIhxetRjTP
 9fQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WP+7R/Fr2VMJLa5AXizn+zOIuwCy4AiCbk7L9UfX4Zw=;
 b=JhBbIN+J8u+gLJwwb6lXoIZ82hwdVvI/zBNA7mwuM7TLzNiNVnPsSkMqSEpYrXqri2
 5LbM5yQaGTZI4alq7SLaI73xBONuudR7aq6w4dQzFlBnIPEe2kJchdTHoNYc78tLWwTa
 gYt/4Ap2WN+3ZjyRZs7IFtHvGZoaXaD4QUujmg5/3dbzG9Zr3tUxjZxlTfR1azP/9CoC
 Ocf0+RahjWG/3wgSgNQ1zi7+a2RHZITaqjKUEM6j/+ZW+6uJtujfCyT97BAbHr2vNcMu
 vYjbhqDcNn9qL2i+b9pFMBc2e+hn38HgH+n+nXQAGJoRCSMV38WG4F7ek9T1oBomJLC0
 qxrg==
X-Gm-Message-State: ACrzQf3CqiKK896ISnm7DiqJxP4+k2LWtXOOlId0+o+BCuve8vOCpf+k
 nxW8D99W+mmtiUPe527uQZs=
X-Google-Smtp-Source: AMsMyM5+O8XthDRDSKyEQ3I1jHlcTzZmKX7d/XfEB3c8kCa+btVU5AIiiGXo52VS5hqEqrrzqoO+lA==
X-Received: by 2002:a17:902:c20c:b0:186:b3d0:f77 with SMTP id
 12-20020a170902c20c00b00186b3d00f77mr17479095pll.26.1666874668179; 
 Thu, 27 Oct 2022 05:44:28 -0700 (PDT)
Received: from debian.me (subs28-116-206-12-37.three.co.id. [116.206.12.37])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a170902c94700b00186b3c3e2dasm1125991pla.155.2022.10.27.05.44.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 05:44:27 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id 28834103F96; Thu, 27 Oct 2022 19:44:25 +0700 (WIB)
Date: Thu, 27 Oct 2022 19:44:25 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Subject: Re: [PATCH] dma-buf: cma_heap: Fix typo in comment
Message-ID: <Y1p9KT1ZZ0bqIhdu@debian.me>
References: <20221027072642.23787-1-mark-pk.tsai@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="XHaG62drdJ2C2Nnp"
Content-Disposition: inline
In-Reply-To: <20221027072642.23787-1-mark-pk.tsai@mediatek.com>
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


--XHaG62drdJ2C2Nnp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 27, 2022 at 03:26:38PM +0800, Mark-PK Tsai wrote:
> Fix typo in comment.
>=20

Comment on what function? I had to see the diff context.

> Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> ---
>  drivers/dma-buf/heaps/cma_heap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma=
_heap.c
> index 28fb04eccdd0..cd386ce639f3 100644
> --- a/drivers/dma-buf/heaps/cma_heap.c
> +++ b/drivers/dma-buf/heaps/cma_heap.c
> @@ -316,7 +316,7 @@ static struct dma_buf *cma_heap_allocate(struct dma_h=
eap *heap,

Oh, you refer to cma_heap_allocate(). Please mention it in the patch
description.

>  			kunmap_atomic(vaddr);
>  			/*
>  			 * Avoid wasting time zeroing memory if the process
> -			 * has been killed by by SIGKILL
> +			 * has been killed by SIGKILL

Duplicated "by"?

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--XHaG62drdJ2C2Nnp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCY1p9JQAKCRD2uYlJVVFO
o2ycAP4mutv5A+U0sVGBxomMJwORB1VaIuTIp/xeL/6OqueMIQEAq2u8IOVlVke8
K367ezUx4yUU08CTyQcg97a1puTuqwU=
=bsZY
-----END PGP SIGNATURE-----

--XHaG62drdJ2C2Nnp--
