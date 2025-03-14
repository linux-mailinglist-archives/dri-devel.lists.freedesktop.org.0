Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAC4A61170
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 13:34:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEC6710E261;
	Fri, 14 Mar 2025 12:34:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nEmSI00o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDBA510E371
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 12:34:19 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-2232aead377so44466215ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 05:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741955659; x=1742560459; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rPSECg+mVkxCbkeOhUnXUQ91btFsYJht6WFQ9kgvwus=;
 b=nEmSI00oYHQgFtEqtPPiXWoVdh+duNVn6nodlz6dQMpUsZIY2LJnoqDD7R3fS0hvQi
 3sk/T3AMhkt/0G7rmK9PR7Tgnq1Fmmwhqfc+rDodC+k2yZFUkyuCijA2sQ5q0sV0UeRh
 aq+KUrhjQZPI1k8epGHH6SUU4ZFe8yEu+8I6JKjWCwhY3SVfSe8Sui5OOj50pa9XLZ0c
 gNs5GGmtunzrJsbXMPeRlyBoh+YCEuhQBzk4sW8K5FuegaUSrFcxoqDKZklnejVQC4Hx
 cz5NASovhIGZMESxLwztQfh4BmQ/f9/bCfTB5awMmsRl81X/PK8F5YV8I5M/nGJApNr1
 0koQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741955659; x=1742560459;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rPSECg+mVkxCbkeOhUnXUQ91btFsYJht6WFQ9kgvwus=;
 b=nuDFMcevXhybHOAtlVwkCg1dLwagLf6yNf4wONzp5d9qlD/NpF6lodcBtpCIMfI7Ae
 O2uD9R+nnOv6lU6XszIhjliJImajPbHkd2q8XU0jYNGYDdjeAjLzr8UrOS3PVGGMC/Sd
 Mx37VILurOj+edxSFgl8C8wpR9gMUUaxElLy1hjM1rK821wFeD8sV97fukZiefvLlBm0
 hDZkBkjlhjkYL+rLOyzdeEf8b2CnsscW5yLS9NrtoriZwL1urI22bQjucqpYy0EhUtRM
 miWDCfLYqa0RdxdZArV+IVva0Ut/BjNd/PZ1ELYQinbpw6xLF2GxAJyiF/3Ea7kKnaMj
 Y7Bw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnTN7cDUp4Q/l9s1qB1QKuLu0lJ8HTMnum2OIxM9THh7u09rMoNJ8o/XmGVWqOnEr8g69DLP7WRTg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzzAS8zAO5zyCR+gXpo8eZ9ZH8vGx6vwRWRAIUbQoFgbdQIams0
 /Ln2yd+DP5YeP7aJYWIlyJijtls6FlwuXr0FGL/Wxu+K7WGpQNM5
X-Gm-Gg: ASbGncvK7z+N/t7XZGcVGRfkMrXyLaBmqm0JnyyaRcjn8yBrtSPx59PNJAwScOKOFdh
 +lN2EiO0c5vYuTK6HwASZ+PYkvd8y0TO1nj5ilgfM0nBHpX34WyJFD972BnHMZSmpkZhhJxrbmY
 2BEADViTcdJ3++ftBhAafTgl/yt9npU6NYmlMv1qJ0qOlF1ZjwerM4VpBNqN+paWiOZTp+h7UKT
 AgKn/squrDnoUpmOt3DbRlK5eAQ+Jy1NKuIobgqyux5A+mYIMeWxPcOIAss9UTTDNMaY0NVSjR4
 x/qT8C+ItAUQW+epUA6FBcgft+guTM9+XLQj0DQbQ9gEZOnulGeX5BI=
X-Google-Smtp-Source: AGHT+IFZiSj4ZQKThNDrZzaS9CvdkFE2IRQWfPnoJ21MBYJms6zMZQZ8wzUNIxrA9FKtHB/HjGWsaw==
X-Received: by 2002:a17:902:d50b:b0:224:76f:9e45 with SMTP id
 d9443c01a7336-225e0a5bdb1mr31244445ad.21.1741955659090; 
 Fri, 14 Mar 2025 05:34:19 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-225c6bbca06sm27537235ad.161.2025.03.14.05.34.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 05:34:17 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 33B7440ED504; Fri, 14 Mar 2025 19:34:15 +0700 (WIB)
Date: Fri, 14 Mar 2025 19:34:14 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>, corbet@lwn.net
Cc: linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, simona.vetter@ffwll.ch, airlied@gmail.com
Subject: Re: [PATCH] docs: driver-api: firmware: clarify userspace requirements
Message-ID: <Z9QiRrYxb1AnzAvl@archie.me>
References: <20250314100137.2972355-1-jacek.lawrynowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gEqE4yHph3DdG8S0"
Content-Disposition: inline
In-Reply-To: <20250314100137.2972355-1-jacek.lawrynowicz@linux.intel.com>
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


--gEqE4yHph3DdG8S0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 14, 2025 at 11:01:36AM +0100, Jacek Lawrynowicz wrote:
> +* Firmware files that affect the User API (UAPI) shall not introduce
> +  changes that break existing userspace programs. Updates to such firmwa=
re
> +  must ensure backward compatibility with existing userspace application=
s.
> +  This includes maintaining consistent interfaces and behaviors that
> +  userspace programs rely on.

Is it implied that the firmware UAPI MUST be designed to be right in the
first time (attempt) as it MUST be supported indefinitely?

Anyway, the wording LGTM.

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--gEqE4yHph3DdG8S0
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZ9QiPgAKCRD2uYlJVVFO
ozJrAQC9AJm2l7gGbE2J1mH772Y0JgwSajL+6+LF97h7JvutqQD/Se6XsGzrC6Qa
fuQ2Z66drqDuWYqf0xwLN4Ic+2Bg5A0=
=rjsf
-----END PGP SIGNATURE-----

--gEqE4yHph3DdG8S0--
