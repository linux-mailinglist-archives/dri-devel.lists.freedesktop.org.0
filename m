Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 273E3737DF7
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 10:58:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14A9A10E41A;
	Wed, 21 Jun 2023 08:58:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDE7F10E41A
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 08:58:29 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-668723729c5so2356199b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 01:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687337909; x=1689929909;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=E5LRjNW+DMVQyDVYt4QbuO/2vLZPFCxGg8HQRH+1HMw=;
 b=iLwM2ePFQcTi29RnxJctEOJkmS5MLhfI00MGVBOSKeM8UzrTvts8v90Pt78j/E84lY
 e7fOmDaTtsaPKaMPA/lo5JPMAP/Lz0f0ibtnTTrtbNQHiHcQXkz8sZ1BNWhQQRlXd5/p
 TUAz4swOXHmIrDsmYuFbl1zDbMs9/yRL6TnsR/6lTKnYdj5r2r5h6Xp/p+svfM1vvprL
 X4y7lqKlIgdvGsFiFDI2kV78ltghKCpKwFmWfh7BJu+5DKl6rkQggzy64PNiFBKktRKm
 uada3/X8WOyk3DmqvcjJtLhDx8YTnML/Oag9j+P5dRJMBl4iTSbIZ3JFmR+LNfiK60jh
 X1Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687337909; x=1689929909;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E5LRjNW+DMVQyDVYt4QbuO/2vLZPFCxGg8HQRH+1HMw=;
 b=PiEX6WQ4iJaJdokD+qPO7KMHDgae6fwb/FXnsy7auxvbr+vIQuAt8a9BlSVIUH0wbK
 4nLZfH8uTpAi/A9J6ovZt6zmE9fMAIYnronxXGh8gHNLmecLQN+nDxb+Nm4M1j/Q8oF+
 tpgMFp7H+ZR05a6x9kcvzLQFSEomF8U5inwFezjEOSNAn8zLRVbxjC3mDcjOfjpkH6nE
 3WhzvHL7YcTDdUz8y0wC3GLM2OaiiAhT8+DeQ3T6UeFrDOGCtkzf3Ej3TQaKbvCrJkia
 PH7bv4IlHklPd19mH2k2/2Y4t0m/vUckUY0biLliN5M6qofGQ/OkqVfMX8iPtzQPSMgE
 Fisg==
X-Gm-Message-State: AC+VfDzqS9g3EcfbVQJzqA6p/FMyHILaK34Jzr23lVu4Qfpk2yCPt77M
 xHAAuEJa4WLhFYNuhiqJoKk=
X-Google-Smtp-Source: ACHHUZ71rKwyV9VEfl/z+0vn2b2qUDpdUqK4LftuBZw+WJNmSIyZ53OovRgv3kbNZPwLyJpINF2zHA==
X-Received: by 2002:a05:6a00:2d04:b0:65c:2ea:2c5e with SMTP id
 fa4-20020a056a002d0400b0065c02ea2c5emr15162799pfb.29.1687337909153; 
 Wed, 21 Jun 2023 01:58:29 -0700 (PDT)
Received: from debian.me (subs10b-223-255-225-231.three.co.id.
 [223.255.225.231]) by smtp.gmail.com with ESMTPSA id
 n24-20020a62e518000000b00668a06ddf2bsm2218132pff.83.2023.06.21.01.58.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 01:58:28 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id 2D3F28AC0D78; Wed, 21 Jun 2023 15:58:24 +0700 (WIB)
Date: Wed, 21 Jun 2023 15:58:24 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: zhumao001@208suo.com, sumit.semwal@linaro.org,
 benjamin.gaignard@collabora.com, lmark@codeaurora.org,
 labbott@redhat.com, Brian.Starkey@arm.com, jstultz@google.com,
 christian.koenig@amd.com
Subject: Re: [PATCH] dma-buf: heaps: Delete repeated word
Message-ID: <ZJK7sC4i+MK98k/+@debian.me>
References: <20230618143813.15142-1-dengshaomin@cdjrlc.com>
 <20230618143813.15142-3-dengshaomin@cdjrlc.com>
 <0c1649d3a7eca54b639b3990c186f482@208suo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="UFoz0p8LOyNaa+xq"
Content-Disposition: inline
In-Reply-To: <0c1649d3a7eca54b639b3990c186f482@208suo.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--UFoz0p8LOyNaa+xq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 18, 2023 at 10:50:43PM +0800, zhumao001@208suo.com wrote:
>=20
> Delete one of the rebundant word in comment.
>=20
> Signed-off-by: Zhu Mao <zhumao001@208suo.com>
> ---
>  drivers/dma-buf/heaps/cma_heap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/dma-buf/heaps/cma_heap.c
> b/drivers/dma-buf/heaps/cma_heap.c
> index a7f048048864..80bc95955188 100644
> --- a/drivers/dma-buf/heaps/cma_heap.c
> +++ b/drivers/dma-buf/heaps/cma_heap.c
> @@ -319,7 +319,7 @@ static struct dma_buf *cma_heap_allocate(struct dma_h=
eap
> *heap,
>              kunmap_atomic(vaddr);
>              /*
>               * Avoid wasting time zeroing memory if the process
> -             * has been killed by by SIGKILL
> +             * has been killed by SIGKILL
>               */
>              if (fatal_signal_pending(current))
>                  goto free_cma;

Your patch can't be applied because you sent it with Roundcube, which
mangles whitespace. Please resend with git-send-email(1) instead. And
don't send patches as HTML email, either, because many mailing lists
bar HTML mails.

Bye!

--=20
An old man doll... just what I always wanted! - Clara

--UFoz0p8LOyNaa+xq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZJK7rAAKCRD2uYlJVVFO
o2EoAP47NUroxZgIZQh0vj02VHoj+aMX37I9RIvQFddU757PxAD/Qy3tkx+VtR8d
hMR6p/WtGknPVw4KTMDCWwwQv4fHMAQ=
=MKC1
-----END PGP SIGNATURE-----

--UFoz0p8LOyNaa+xq--
