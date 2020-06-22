Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6C1204B9A
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 09:49:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03C706E95C;
	Tue, 23 Jun 2020 07:48:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 089E76E931;
 Mon, 22 Jun 2020 23:48:10 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id ga4so6190747ejb.11;
 Mon, 22 Jun 2020 16:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=1Ei5EFb83ZRTk7RRE9ddzMkWkL8bjizPYUGj8oBnkJ0=;
 b=S5nrwd4xJkOQrfJ288XBDZMJOVRqnjOeIOyW3vHprKkpgzUQ5RfagkHU0D9FBdehKa
 3lvfRQMn3nqaWQ9DzIM6QGHySUnEsWSZNrJr/VU8qqaOoQ85evpn89nyInyL5BNeUaBT
 LaTzCZO2iNCi94Rd06KiIhoothpHzGh8HHU/8+VoWgDMVhgNN7qh+SMTzs9abORUqj3F
 uq5OMMcbNkP//6wUitfYTeAFfLYOnO1Rudk90MGn9Oyk0BBYJ/01O8/aymdQIjOQhhE3
 FNxlCudBJTgPi3ZZOv9PHDGfPUY56Y9hTGN22/4AfqS8J8+O5Xm608f8m0S/ev+jMqR0
 PO7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=1Ei5EFb83ZRTk7RRE9ddzMkWkL8bjizPYUGj8oBnkJ0=;
 b=S8Mm1H6tnr6CsU/BOtTGcW0EbW5c7m5aJhIl/8txT/vhRWnxNq4bP5IiGeHH/C8+MM
 yPoMpb9DFFo/1ip7mazLoT8nmUqklmJKxB98A1lrmwQJ7GeASld/efX5+/5yzUVZG78H
 zN3vVUoS1zNma16GBMRzIdHRG0rMuJo3doN0DXzPWC4FF7RPkU4z7ZqgMKfur31c4Ngu
 dbaQeSYPXXLbFsYugMgoHLD6KknvOZ48qi5qken0BT8aBUmfa3gnClQ+WtRIKE+LUZ9i
 w2o1M4q008xplyCCFS8yZ+c1r8saCUXObYQPQL1Sj2PKtCd+JRtnYFM4YB0mJ42FezEi
 Xl3g==
X-Gm-Message-State: AOAM532Slu6yWwoNbm9kCeffS6ZLK88Bbvm43TRNEZ5FpJQUlMb4w9qM
 dGcKaqwn/ebBmzFwmkpfMJUGyaqncKh0mUGxiGe2ajTWiXc=
X-Google-Smtp-Source: ABdhPJxui+/e+ejrbxJH+iIDV6DwzB67kK+hi2we+XySxQDjG4zf6jPg54+irzPyB4Cjj82AMbVNGPoGXg0ruO1ek1w=
X-Received: by 2002:a17:906:60cb:: with SMTP id
 f11mr14987419ejk.159.1592869688404; 
 Mon, 22 Jun 2020 16:48:08 -0700 (PDT)
MIME-Version: 1.0
From: Rhys Kidd <rhyskidd@gmail.com>
Date: Tue, 23 Jun 2020 09:47:57 +1000
Message-ID: <CA+iOQUHn1x8HQ1+_QrSb9wEiH8m2G7mmd2Q3V4Gz6WAPnp8TWw@mail.gmail.com>
Subject: valgrind-mmt: rebased against latest upstream valgrind release v3.16.1
To: nouveau <nouveau@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>
X-Mailman-Approved-At: Tue, 23 Jun 2020 07:48:47 +0000
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
Content-Type: multipart/mixed; boundary="===============1056887016=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1056887016==
Content-Type: multipart/alternative; boundary="000000000000f36d6405a8b4df77"

--000000000000f36d6405a8b4df77
Content-Type: text/plain; charset="UTF-8"

As an update to the nouveau development community, the downstream fork of
Valgrind with a mmap tracing tool ("mmt") we maintain has been rebased
against the latest upstream release of Valgrind, v3.16.1

Code branch: https://github.com/envytools/valgrind/tree/mmt-3.16.1

Features of upstream Valgrind 3.16.x:
https://www.valgrind.org/docs/manual/dist.news.html

In selected highlights, the benefits of tracking the latest version of
Valgrind is added support for AArch64 v8.1 and reduced memcheck false
positive rate on highly optimised code. There are, as ever, many smaller
refinements and bug fixes. v3.16.1 includes two bugs fixed after 3.16.0 was
frozen. As our downstream valgrind-mmt was last released against v3.14, we
also get the benefit of all bug fixes and features since then, including
that the RDRAND and F16C insn set extensions are now supported.

For anyone unfamiliar with valgrind-mmt, it is a userspace mmio tracer that
assists nouveau reverse engineering efforts by tracing the commands sent to
the card. There is an accompanying demmt tool within the enytools repo to
better understand these trace logs.

I would like to thank all the other nouveau developers who have worked on
mmt over many years, including specifically airlied, mslusarz and kherbst.

Best,
Rhys

--000000000000f36d6405a8b4df77
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>As an update to the nouveau development community, th=
e downstream fork of Valgrind with a mmap tracing tool (&quot;mmt&quot;) we=
 maintain has been rebased against the latest upstream release of Valgrind,=
 v3.16.1</div><div><br></div><div>Code branch: <a href=3D"https://github.co=
m/envytools/valgrind/tree/mmt-3.16.1">https://github.com/envytools/valgrind=
/tree/mmt-3.16.1</a></div><div><br></div><div>Features of upstream Valgrind=
 3.16.x: <a href=3D"https://www.valgrind.org/docs/manual/dist.news.html">ht=
tps://www.valgrind.org/docs/manual/dist.news.html</a></div><div><br></div><=
div>In selected highlights, the benefits of tracking the latest version of =
Valgrind is added support for AArch64
    v8.1 and reduced memcheck false positive rate on highly optimised code.
    There are, as ever, many smaller refinements and bug fixes. v3.16.1 inc=
ludes two bugs fixed after 3.16.0 was frozen. As our downstream valgrind-mm=
t was last released against v3.14, we also get the benefit of all bug fixes=
 and features since then, including that the=C2=A0RDRAND=C2=A0and=C2=A0F16C=
=C2=A0insn=C2=A0set=C2=A0extensions=C2=A0are=C2=A0now=C2=A0supported.</div>=
<div><br></div><div>For anyone unfamiliar with valgrind-mmt, it is a usersp=
ace mmio tracer that assists nouveau reverse engineering efforts by tracing=
 the commands sent to the card. There is an accompanying demmt tool within =
the enytools repo to better understand these trace logs.<br></div><div><br>=
</div><div>I would like to thank all the other nouveau developers who have =
worked on mmt over many years, including specifically airlied, mslusarz and=
 kherbst.</div><div><br></div><div>Best,</div><div>Rhys<br></div></div>

--000000000000f36d6405a8b4df77--

--===============1056887016==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1056887016==--
