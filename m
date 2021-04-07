Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C990356591
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 09:39:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D469D6E071;
	Wed,  7 Apr 2021 07:38:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E18B86E071
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Apr 2021 07:38:55 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id d12so26904178lfv.11
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Apr 2021 00:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=H0+zxbNM+rRZ2OUzvxq3CZ2kJ49dhU+Jds30ymxMB50=;
 b=mzUyYO6zyg2nv7ztm9My4NzD5XZe9Y5um8krdZNR9LkAboLOeQKae1Fy/x3QxVo041
 VT9nE1B7bVIyVoa0EKt/IdmdL7SID6gsIbk5dSB2SelOSOzQBI5Q6cpp3sQu5YX+ythS
 T7KoneDDOy8R6kBxq+Recqkr6AAUZ+rQLOFePt2QQAqpFGn75dElIyrX3e4EiG3VMkuZ
 SLwKElsDoyfn4z7rL1S2Rynfi58Mvef2bI7kRHhdGrsyxWlJIk8t/1LuO/jiN3tvBgHA
 QWH9Q6enLvXFJWVf+b0i7u345Palcp25ymMKmUsWj7hGZSBXZBnhbXtGq16DHe2ziqhR
 JoTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=H0+zxbNM+rRZ2OUzvxq3CZ2kJ49dhU+Jds30ymxMB50=;
 b=iAAELCHQrj2IaFkLCFW1sbNd6+XZX+7UmN7RGZKCSonk/EwAXyz6mk/ilQf1alO5m9
 5jRSWbHR7P4cljj494w3a+WatICoeNLiwk9WKsM0qV1Pde9vKZgvZhcdDwtUnUao8JvD
 BalJR9KVq1LE5E71dZuMi9t+NSKTZQLuehhq1QzOCCn7o7Np0Ll7waeD2cbn1OyDFtQD
 8+4Gzl6UR20F36lNs5NSuff63Ou9f6AwxzXw7M9j/1gEd98evJQJu3Tbs/ncLRtTDOsG
 4Mf+Hdy8CsxC/NpVO7uU6iaAB9z4NxRSFp15VXcdVjCWkSYR8p3BysRY8pSDh963S2vM
 c6hQ==
X-Gm-Message-State: AOAM532H3AyvtW7LWl2eYEw3RWpK6kXCQDwnBlWXWi90DGuKFLyK5K7H
 VQspatmD2gZP0cZLkyYFJss=
X-Google-Smtp-Source: ABdhPJy2iJQyB2NBwipBUAiChjGXYTsfZ25u7jT0stQNh3qlOeBXZVMDLaPWCad6ue3GbGcfUKeMCA==
X-Received: by 2002:a05:6512:3e02:: with SMTP id
 i2mr1613405lfv.357.1617781134355; 
 Wed, 07 Apr 2021 00:38:54 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id g5sm2457624ljn.82.2021.04.07.00.38.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 00:38:54 -0700 (PDT)
Date: Wed, 7 Apr 2021 10:38:50 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/connector: demote connector force-probes for
 non-master clients
Message-ID: <20210407103850.0bc7a391@eldfell>
In-Reply-To: <itV15ocZXBT9rpF0IwtL2H5MES6wcFyY2FfKiuN_4sc6VM39xYBEvYz42p6Iba2IW_MuNZk2_dws36blub8Pd8WBod4t_ruqFk9wjRI-fbE=@emersion.fr>
References: <20210402112212.5625-1-contact@emersion.fr>
 <20210407100224.653fa3e7@eldfell>
 <itV15ocZXBT9rpF0IwtL2H5MES6wcFyY2FfKiuN_4sc6VM39xYBEvYz42p6Iba2IW_MuNZk2_dws36blub8Pd8WBod4t_ruqFk9wjRI-fbE=@emersion.fr>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1575185692=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1575185692==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/wAjn5WXr1Y2JVCEsgLlOf3V"; protocol="application/pgp-signature"

--Sig_/wAjn5WXr1Y2JVCEsgLlOf3V
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 07 Apr 2021 07:16:30 +0000
Simon Ser <contact@emersion.fr> wrote:

> On Wednesday, April 7th, 2021 at 9:02 AM, Pekka Paalanen <ppaalanen@gmail=
.com> wrote:
>=20
> > Btw. can force-probe be triggered via sysfs as well and does it require
> > root privs? =20
>=20
> sysfs can force-probe like so:
>=20
>     echo detect | sudo tee /sys/class/drm/card0-DP-1/status
>=20
> But this requires root, yes.

Ah, all good then.


Thanks,
pq

--Sig_/wAjn5WXr1Y2JVCEsgLlOf3V
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmBtYYsACgkQI1/ltBGq
qqcPwhAAn8LYxofto36J8Q44kZO3tokNFGK27whamheX3S5CiTP/WtXBzAFfts7I
RDio72S1SD8a36l/5PdKMnmEck5OhAGrLWXGzTHvHjWR11mqsxBdxitHRoVlYMOa
jUgyjDr/lfSK8PAgmTwpyFUlNTYeyfbwmu9MxGjlfMJtsk2mOr1TB6Dx2K/pdKLG
2s9nAh7z88pkQuFQgC21pFNM46IErEL877TeXJKKcED3dcKMjU6iu+8banrQ3Xq1
gI7H+nViBbYjZXrsOz3MFOrWUCCb1MeDCWwVFUQCGhMvmlc225yO5Tw9vNF3i51i
3LF+P4x9TBSLSSBSXfQn81yKMqv6PMNlzvsaGOHyyK7lOOuE8T/Ydkq6qZ7VO8mz
j3TlC4qDBsx3UCHVak5ko+4AFgYdA2DD8j/EiU7ixGroblzM2I62psXVytcSHRwF
NZ0AhX0P2wxyT58qQQ1qSRnBZ8PUzMXqnt4sLjtIPv9SAR43UcXD2pFln8s3lQMQ
BhNKhzXk8eo5smZuwrxB2mPQVbWWRpFz3jbV46dtpIqq3NxMZ4L6UmhIMPvjq+Aq
KTIQdBKN+1CzRJIjsu8G+kNfMVuMDeTK4DTltNXHcLVikEZG5RX72R/U8g5lzSW7
Jcjm+MHWFlnduhu0JeN0KwP+6pMl6U5eWPezuTu3ulU48W+w5sY=
=brZ4
-----END PGP SIGNATURE-----

--Sig_/wAjn5WXr1Y2JVCEsgLlOf3V--

--===============1575185692==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1575185692==--
