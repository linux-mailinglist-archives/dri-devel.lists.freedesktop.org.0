Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D57B995FA92
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 22:24:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0228210E299;
	Mon, 26 Aug 2024 20:24:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kUudx6BG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7941C89954
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2024 20:24:29 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-714226888dfso4292451b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2024 13:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724703869; x=1725308669; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6UYM+QEFURuA6RABtl1Y2b7maHkjZm+aY7YH3Bi4tLQ=;
 b=kUudx6BG07PSEJ7C/DqCp1d1qGpNfaxq9eJ/sYB0lPcPcn9sXAsJ19zLwO3O7rKnEf
 rdueLtgzFWNbRWWNgpPdl/Z60pfb4w9TBzpWAyRf6+walmj1IgE9l4qOc1RVRfA6qZso
 4xfqvCMRDFNk0K9nYYYlWRnojvYjvs9BHt6QUz6be+wTJyx3BbbukUSQlR/pDtJrXogx
 IagQq4a+YyvxdEK/w7yr3+fjhNT8aPPZZOeIfeN150QOE68xv6Pp+/uirlLqa0LbKOGd
 84SlGUvlzTIrJXKNS7iLcbAWrRIJ5GGslFgqQcKG4GT6shrwpWZg572ujv5Cu0OaBnRd
 ZA0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724703869; x=1725308669;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6UYM+QEFURuA6RABtl1Y2b7maHkjZm+aY7YH3Bi4tLQ=;
 b=FOMfhrWw+W6A4wzlL8jc7I5LA62cbgyIhBF+b+1s4wlN6E22z3KnkoN6TluuUcKe8s
 J6+xMe59Ql9IUzXK31CYPZEtqmgNAm3dlJaWofkVzTQPA9tjm4bKJnKBzgZK8qCtRzQx
 13jiTy+U5m7sGhN7sycsB1Fj16aQ+SjnqnzDC9iA/nDXxdzzOCtrcOpocg+mz9Xhk1PV
 na936pcKaiJ6+z+diLtIZ1ojICSwFdTRuP8oO0tPiyZ/mIIEFQ6XM2De5ct3jCMTpInO
 SjavSk1hjQvTlXEQ8oSkj9AOcYGnQIPyJVY3RollVb401DR+KKQlIxVgRGAmCgGHURpP
 DxLg==
X-Gm-Message-State: AOJu0Yx+k9PfRb0954OzBwiJSrXQuOGE8MaJdLaZli/HNh6mh/IGGLKV
 vm53BbYu+AVlmq6NPAT0JAbyby14A2GDt7oOr646XfkaMcAAjMohdP8exQ==
X-Google-Smtp-Source: AGHT+IEvNNoQMCvWGDNQrnrmuz3pmquUybh9125GyNWf82mXm6LMeEfjrMujs2XTGowp6pUltz2gXQ==
X-Received: by 2002:a05:6a00:2e29:b0:70d:1b17:3c5e with SMTP id
 d2e1a72fcca58-71445758d3cmr11709036b3a.6.1724703868748; 
 Mon, 26 Aug 2024 13:24:28 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:8d0:3da0:d8f3:ae87])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7cd9acdcaa7sm7746124a12.47.2024.08.26.13.24.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2024 13:24:27 -0700 (PDT)
Date: Mon, 26 Aug 2024 13:24:25 -0700
From: Matt Turner <mattst88@gmail.com>
To: xorg-announce@lists.x.org
Cc: dri-devel@lists.freedesktop.org
Subject: [ANNOUNCE] libdrm 2.4.123
Message-ID: <xftbpl3gprzawgal2l4x7lcui5wch3vnfyadzxupfwecsioou7@k23xjivmd4g7>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="eaimfnrhdhuavwzq"
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


--eaimfnrhdhuavwzq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Alex Deucher (2):
      amdgpu: add new marketing names
      amdgpu: add new marketing names

Dan Willemsen (1):
      Convert to Android.bp

Daniel Stone (1):
      libs: Tie DSO minor versions to libdrm version

Elliott Hughes (1):
      readdir_r is deprecated.

Enrico Weigelt, metux IT consult (1):
      Fix FTBS on undefined clock_gettime() and asprintf()

Inseob Kim (1):
      Export include dirs with -isystem

Jason Macnak (2):
      Makes libdrm available on host
      Adds libdrm_headers

Jerry Zhang (1):
      Make libdrm recovery_available

Jiyong Park (2):
      add crosvm to com.android.virt
      Enable GPU in crosvm

John Stultz (1):
      Android.bp: Add include exports for android dir

Mark Collins (1):
      Disable ioctl signed overload for Bionic libc

Matt Turner (1):
      build: bump version to 2.4.123

Su Hong Koo (2):
      Delete all Makefile.sources files
      tests: Make modetest and proptest cc_binary in Android.bp

git tag: libdrm-2.4.123

https://dri.freedesktop.org/libdrm/libdrm-2.4.123.tar.xz
SHA256: a2b98567a149a74b0f50e91e825f9c0315d86e7be9b74394dae8b298caadb79e  libdrm-2.4.123.tar.xz
SHA512: d3e6ba26bbd609fd87ca131690547eeb6a903c0a8c28b7f5cd5d0947619da09f31daf7bf4b6c38bf5e5dc173e2ccba476338ef682d8cf06d6b71ba73fc9b948d  libdrm-2.4.123.tar.xz
PGP:  https://dri.freedesktop.org/libdrm/libdrm-2.4.123.tar.xz.sig


--eaimfnrhdhuavwzq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iNUEABYKAH0WIQQWI4p9kkSLArexA0S2sc6uUQPbBwUCZszkdV8UgAAAAAAuAChp
c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0MTYy
MzhBN0Q5MjQ0OEIwMkI3QjEwMzQ0QjZCMUNFQUU1MTAzREIwNwAKCRC2sc6uUQPb
B3MOAQDhJFesx8TrTWYLoAVzUa7jdm/zdLkGyd1Ak3IrJ39TEQD5AUqFm7ezblIB
ATfv64XBaw4rVR4rgGXoAohpmibKsgQ=
=y5+r
-----END PGP SIGNATURE-----

--eaimfnrhdhuavwzq--
