Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C479E4427
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 20:09:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C624010E14E;
	Wed,  4 Dec 2024 19:09:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d4kojFil";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B55BF10E14E
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 19:09:01 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-7b67a94ae87so4966385a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Dec 2024 11:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733339341; x=1733944141; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eJLNENIFJ5pLCOro589JKFk1GPrQ6YfBbYsQJlfoWl8=;
 b=d4kojFilrCu5XJ7lrUUf1tuiZpqf78vtwPOtByldu33WfpgvNhaQRcP1ZH0oA3jDOW
 qMYR0cHMrSflq9SBOw4TsSAsfHXZVzHJdnJg67zH8t33JesfTsmgWEToahcUR1iZs0R/
 TvcRGSlpLzW4NiysGwY+7/6i3Og1sXnTEjbMmLjFhW2+Sf1a+MqOri1zFUxK3v91FjrR
 wwVAtW4QJ36o7OimRJeupy/E6wIG4uKolzOZ/iLG34zNhoyWyXopurXKq2zF2yiadyPs
 /no/7d6DBCEbD/CKll6ymju6cz3VKXV+ofKXBE2o+7LRtLhGLZVuJ23lGjKROczAXScQ
 msrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733339341; x=1733944141;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eJLNENIFJ5pLCOro589JKFk1GPrQ6YfBbYsQJlfoWl8=;
 b=vowinyAkaY5OylBMvyvLEi5q02XKfv5Bc0zSKrjXZnEQs7nQVGCvh+i+qYrCdwDy4O
 fqoKbwkEgVUSrhI2mDRx/1kBytvjrl4ucmVJCsLJSHn6retBsBSiuKHKkdkuwfUX9bhG
 pzbhAjgCbIRv22AzrHac06LT8xKDcqlx6R9Vh/JXRauhiQ2B88S2seMSVzayIWaur+Sx
 F/zNSqMzCXG173g8C6WkCeLaosYwOl16rrsPtmKOjIjVeA2DQINd6KbPVUL30cvt4Jqr
 A2q8kjSt6ydQVRvNtltoZshVskMlhZfDstdIopBUHAWh4oRmobFBFoGrz/R03jj9cyyQ
 K9xw==
X-Gm-Message-State: AOJu0YzS2sUH+RDgtZi6/udsQPAHOXufdoFTikgI1+t41zejaIH1LnEG
 WIma1S1NRfZinF0g0VhrjlaeaqOeLkPzzpWOC/VAeHfa1YZri6UdQTP8dg==
X-Gm-Gg: ASbGncvRTPqFW+TX2wqiQZiUIh3yheObDGOxoiJdtNdznQYX7pOwwREE/y4Kv9FS2g9
 /o9c0bxAWOW6fHy/cuyPTT6N/p5sSVKIYZGszwAcMbJzLHCwG4CvLSokFgeAG/aJpIAGJ2Dtl6s
 +dORltt7kf2kpfsO2Sm7iz76+k6+F9qOt3E19PyoBBpWGSFfczXBWMSacb0z5ah3mNHrXO/DDiA
 f2L3DrXYrFKdl991GZKgYbM/R+JrOqDOQARGOWw3Lw=
X-Google-Smtp-Source: AGHT+IHpI2ptNAgPNW3AC0kdL88Luf7W2sRWtJkODy8+vkY6t7sE+i1tp+9VGp0e6lBMqgkt8VEg3A==
X-Received: by 2002:a05:620a:3181:b0:7b6:77c0:a096 with SMTP id
 af79cd13be357-7b6a61d869dmr903564785a.46.1733339340442; 
 Wed, 04 Dec 2024 11:09:00 -0800 (PST)
Received: from localhost ([162.208.5.78]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b6849b7108sm639509185a.101.2024.12.04.11.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2024 11:08:59 -0800 (PST)
Date: Wed, 4 Dec 2024 14:08:57 -0500
From: Matt Turner <mattst88@gmail.com>
To: xorg-announce@lists.x.org
Cc: dri-devel@lists.freedesktop.org
Subject: [ANNOUNCE] libdrm 2.4.124
Message-ID: <cfpt5kyybtgsvszy6tr635emqemaxeccg256anq5turkoxyrs2@zjrh2oh6zln5>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="diz467znw73a3c4u"
Content-Disposition: inline
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


--diz467znw73a3c4u
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Alan Coopersmith (1):
      include/drm/README: update drm-next link to use gitlab instead of cgit

Dmitry Baryshkov (2):
      modetest: simplify planar YUV handling
      modetest: add support for YUV422 and YUV444 plane format

Marek Ol=C5=A1=C3=A1k (1):
      xf86drm: print AMD modifiers properly

Marijn Suijten (1):
      tests/util: Call `drmGetDevices2()` instead of `drmOpen()`ing all mod=
ules

Matt Turner (1):
      build: bump version to 2.4.124

Mauro Rossi (1):
      android: add genrule for generated_static_table_fourcc.h

Rob Barnes (1):
      modetest: Make modetest availble to vendor on Android

Simon Ser (1):
      build: simplify Linux system check

git tag: libdrm-2.4.124

https://dri.freedesktop.org/libdrm/libdrm-2.4.124.tar.xz
SHA256: ac36293f61ca4aafaf4b16a2a7afff312aa4f5c37c9fbd797de9e3c0863ca379  l=
ibdrm-2.4.124.tar.xz
SHA512: 0408c3ae5780c57d19321a9a7b046d656e252b2f48e520b2beb18f83495bea39c44=
5deb9a9a6795b46194051c2ea4da476e08c63972daf841064099df6dff365  libdrm-2.4.1=
24.tar.xz
PGP:  https://dri.freedesktop.org/libdrm/libdrm-2.4.124.tar.xz.sig


--diz467znw73a3c4u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iNUEABYKAH0WIQQWI4p9kkSLArexA0S2sc6uUQPbBwUCZ1CoxV8UgAAAAAAuAChp
c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0MTYy
MzhBN0Q5MjQ0OEIwMkI3QjEwMzQ0QjZCMUNFQUU1MTAzREIwNwAKCRC2sc6uUQPb
B19eAQCzIcBRrldv6o8jVr0guotkOt4X1lUp6xO6+cw27qYJWwD+J1bYRP4SzwhH
GGUStjm13qwSOkyS1mOOwf74NSAeew4=
=8/mn
-----END PGP SIGNATURE-----

--diz467znw73a3c4u--
