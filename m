Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 831B6812BCF
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 10:38:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC1F910E065;
	Thu, 14 Dec 2023 09:38:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A458510E065
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 09:38:49 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-6d099d316a8so4062865b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 01:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702546729; x=1703151529; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GrXRlh1VZhf9ENLY+kgcCVCKL2qb4843BzZsjQawZy4=;
 b=Zx7M7zk2T4Vr7JTwLh9xpE6Mbb5yA4g9WjI3kXWLBd51eG/0akVlsn9tNXMPu/vhhS
 Sig4akRwGBb6iXc8L5DmcLu2OdjTEXNpmTo07p9AYv3iE0nAf+62vCN3uJJVkOoBqwJA
 YNhkXpJVGaNI/FhpnC9ClQCZDC9CR37ZYDwBmBjIqOjgayoUOg8iml61jTMxGz7O1gXn
 +luLpy+X5qVq9S/G3L8AR2IePKzQMXkqYVvBZr12if/M8JTe8NywYGAmDXPAyLHXog4m
 SjumqpqZ9AA526KqBs098skg6wzoGdl7yKY7GHt0UNRsZ9yDHaYDiGqvxfnOQcfZu4TL
 xzHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702546729; x=1703151529;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GrXRlh1VZhf9ENLY+kgcCVCKL2qb4843BzZsjQawZy4=;
 b=RIvS5EWx0jOtcIU7k5W9++m3wyiPukkZhO9jgVEg4Z8V6VqLheTsdl0SJbvhcFC2yf
 YQOfV7XYryPsJBBYIwECpqwExbHxUwwgcyzccW26rrpYWPpaG2b8T1H6r0r6Re5osIBo
 EOnuRb6r/sVROyIPxrRjoF0MLp6zBOQtkcQW51qaGOM3HND84JwQ4SBosq4MrEy+pMSX
 N9igrWpkYP+AgHw7rgfOMXWIX6WuiIZR9w/+it7k6yzOOcjx9glZTNWEITb85yOuS6Ge
 F/4RDijf75JpDasfFy1pcomWgChyLB/SyI6EslvSY6Dmmtc7BvfeFcM3j8sXeH3sf9h5
 7dJw==
X-Gm-Message-State: AOJu0YwrNX8tvQL4mkeeMTpI9QZpN0180GQjJir8uOcKHFv8OU90aDzo
 euGGH8hi7HU5PVVEREGC3Hg=
X-Google-Smtp-Source: AGHT+IHQvwYZ1F7UuD3mjZKeIBdejzgLsccSVS8RgzZZLH9u8JxDHTD7CJmYWspvH8e0pq00nFDI3A==
X-Received: by 2002:a05:6a00:9397:b0:6d2:430b:1cb0 with SMTP id
 ka23-20020a056a00939700b006d2430b1cb0mr704360pfb.23.1702546729141; 
 Thu, 14 Dec 2023 01:38:49 -0800 (PST)
Received: from archie.me ([103.131.18.64]) by smtp.gmail.com with ESMTPSA id
 b9-20020a056a0002c900b006cee656cb3fsm10253158pft.132.2023.12.14.01.38.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 01:38:48 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
 id C19A410207011; Thu, 14 Dec 2023 16:38:43 +0700 (WIB)
Date: Thu, 14 Dec 2023 16:38:43 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>
Subject: Automatically update drm CI dependencies?
Message-ID: <ZXrNI9Pqln9HVYVc@archie.me>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kRMQUWEv/5erBWGx"
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 David Heidelberg <david.heidelberg@collabora.com>,
 Helen Koike <helen.koike@collabora.com>, Dorine Tipo <dorine.a.tipo@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--kRMQUWEv/5erBWGx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

I'm referring to dependabot PR on torvalds.git GitHub mirror [1]. I know=20
that PRs submitted there are not accepted (the repo is essentially read-only
mirror), hence this mail question.

In summary, dependabot submitted automated PR that bumps package versions
in `drivers/gpu/drm/ci/xfails/requirements.txt`. In this case, pip was
upgraded to 23.3.

=46rom my experience, such automated PRs can pollute commit history (in
some GitHub projects these PR kind can contribute up to half of total
commits since the beginning of project). And in some projects, dependabot
PRs are automatically merged without any maintainer intervention.

Does such PRs (when submitted to LKML these will be patches) make sense
for DRM subsystem?

Thanks.

[1]: https://github.com/torvalds/linux/pull/807

--=20
An old man doll... just what I always wanted! - Clara

--kRMQUWEv/5erBWGx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZXrNIAAKCRD2uYlJVVFO
ozC2AQCxS3kryVSn5JLfUNWPaW/p4POxIllR4iEovVHReky5+QEA/T/ckSdfe5G7
kUszFFqdFyATRQq4Dlz2X8R0DsN1kwM=
=N1zN
-----END PGP SIGNATURE-----

--kRMQUWEv/5erBWGx--
