Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A12B1FD6D
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 03:04:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0923010E0ED;
	Mon, 11 Aug 2025 01:04:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="m8j878OW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FAF610E0ED
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 01:04:44 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-76aea119891so4545526b3a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Aug 2025 18:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754874284; x=1755479084; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jRN1Wbruw1yhIqIXNefQXV7Pb6BqC3Ov7h+E7zrZSyE=;
 b=m8j878OWSOu+mtzxhDHXTtS4GnzpoAz3xtwUtrS3F+jyG1JyzDmLfI5Y1wrOSJ5iOC
 AdfklPFORb9hvbug2zOOZnujU9O/ENcaHiRe2tH0kUhD9u6euY8UsqIs5l0yWxT8K8Dn
 cBMDh6OzoBpdcwYFkuQX2fv3JDKDb5EfY5CTCplldVndA17fDZLuy6mz8P5vxZI0PwNZ
 9f9cb/1TU1xKrJN7LbulaHy9A5LPsRqr19GYtFZ5rNCpmkrAYqhcqme4wowh2+2bv/4w
 9othdDGYfYdMq4l1Qu+/rFiuPrCFnYedvwH/ye9BBl41SwmtM9Id0lOI/RxV4VYdU8ID
 IGow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754874284; x=1755479084;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jRN1Wbruw1yhIqIXNefQXV7Pb6BqC3Ov7h+E7zrZSyE=;
 b=oqIVRrc+86tx8PS/KZNSpV0yPcmnAHM4XTde90tErlzx0+Ze5vfiImjqQL+l17MCoV
 0JBc6VaMI/ads/C6J3ncTkYgncUzCgOb8XG0nIZruC0HQ9jcGmMi7fy+KF3M1Dh8QLtr
 iRc2vTff7KXCI8A39yP5cK5ouCHBXTMmSaOL8aBUYCY5DKhYzL8jOMfmDWoINvNuWYTw
 Z8qTer2UK2IGfuVzL5JYEkdCcJs0TkXuafDynq+aca3A0xhORH8eXAp5WwLCnwVUTsQD
 rFU9JiIpeM9qAWJ0wzATfJCvAnJa1xljDYCoD22TEntLH1myRq+gdzlEiFe9EON3ApMR
 R/4A==
X-Gm-Message-State: AOJu0YzkhQBxh4Int6bUlKIo7iW5Wt4JOwUOlG8QNmNZ29nZglLYgiCu
 K6+6Sji2wsCJQOzOrg5tdkWXHbUem1bM2w9dCux9OkgQ3LrdZd9cEZDt
X-Gm-Gg: ASbGncsCqFudOGD9MTJ2cYSmpo/VdBviiUvqcn7rfpoCJPUAMY67nmBBlQpYe6eBvIU
 Eof+n9DJr3z77uGkDqJI81uORVkGqbi1TTZXCU6KjmVD9aYv9I9UVRVHFC/pCbFXduEZI1B0wSc
 SoyodGSwCnY98VqmcKYFWJS2LxRX5x/BtLST8aeWnsc/aEQx1e6SXV81MQyKQJvccDmonqDtxVj
 933gG7L/nYVSknZ0ZGX5N2osoUqqRDDucxrzlYjXw7S8ZK7rh1afYxG3fw+Drt9a/kj2LoKdrFR
 DZ2lzPx2A+DBgPIbz7TjvkirdX7MiH9ZNooYV66VD5l36LTnMJi9AV8r+WseF48wBEtuO83RTDe
 7myzPK+K0Ue6MZwp5Xabceg==
X-Google-Smtp-Source: AGHT+IGRwhALPKGKe6wbfvqJkaWd/T5yglTToXt6dfb6zZqHe7Rs6Z/+KgDHz3gRHxs1wzfOOTUg+A==
X-Received: by 2002:a05:6a20:748c:b0:240:10d2:adf5 with SMTP id
 adf61e73a8af0-2405551e54emr17612097637.2.1754874283855; 
 Sun, 10 Aug 2025 18:04:43 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bcce8f911sm25427918b3a.47.2025.08.10.18.04.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Aug 2025 18:04:42 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 034D7424D92F; Mon, 11 Aug 2025 08:04:39 +0700 (WIB)
Date: Mon, 11 Aug 2025 08:04:39 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Javier Garcia <rampxxxx@gmail.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dakr@kernel.org, robin.clark@oss.qualcomm.com,
 antomani103@gmail.com, dmitry.baryshkov@oss.qualcomm.com,
 me@brighamcampbell.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm: Add directive to format code in comment
Message-ID: <aJlBp1MN7fnJmcTu@archie.me>
References: <DBYS3FAEVMHC.178SXO45NIBI8@kernel.org>
 <20250810150706.305040-1-rampxxxx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="77Vx7DeEfmVtV4G6"
Content-Disposition: inline
In-Reply-To: <20250810150706.305040-1-rampxxxx@gmail.com>
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


--77Vx7DeEfmVtV4G6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 10, 2025 at 05:07:06PM +0200, Javier Garcia wrote:
>   * The expected usage is:
>   *
> + * .. code-block:: c
> + *
>   *    vm_bind {
>   *        struct drm_exec exec;
>   *

LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--77Vx7DeEfmVtV4G6
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaJlBogAKCRD2uYlJVVFO
o4TwAP9dMPv5ZR8cLm7KANxcXrKp5M9kQdju+JhOFbbGOXIh2AD/bkXhxWzQUBs2
xMjEAvKlmpmjETOjOs5ZO9KNxhahnQE=
=Pxl4
-----END PGP SIGNATURE-----

--77Vx7DeEfmVtV4G6--
