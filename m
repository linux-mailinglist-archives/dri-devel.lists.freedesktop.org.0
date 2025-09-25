Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7249B9F4EF
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 14:43:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5929F10E8FC;
	Thu, 25 Sep 2025 12:43:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="NxoHGJeR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F52510E2C7;
 Thu, 25 Sep 2025 12:43:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1758804196; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=nxWJj00YuVsDyeDvU8IqYqiDlQ+QD3FJNew9v03B6anFh7IdeXaK2JwNu7pEO7l75bFKxajA+nJlwE6SUxupSVQ5uJ1hdi6ep4OFi8rV+bYIbHuKa1JizYrtRwwNIhVDTPUU2pqdwTXxwXs88Jqn38CQ4DYwjXFXLi4X9OUhSlQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1758804196;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=iBO1OeXpKcig6ea81LX6zk9gp84tYRDi2U2yH/+iQ/E=; 
 b=fWSI29h5MzUyBqjGBZ1JVl5JMDlxd14xOreZmFL18Aj3pbbtvHolotoI2gRD2IXuc3dEBKnhcXCPW2tQz95zZ+r4plAixlUj+3qNGrdpJ116f3e+MHPj+9dMF1ah4ipDPKaZDYYLANEh9ZcjN9beuWRtXQuraFy9gVmqJ+5jrR4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758804196; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=iBO1OeXpKcig6ea81LX6zk9gp84tYRDi2U2yH/+iQ/E=;
 b=NxoHGJeRolhKIGVigNzYlznpQAQHmNNraxSJKX9bpkeI/XXVcwFC/hKsFenzxIJh
 JdZ1lTEIFiU52CbxJGKUCb6hyRt2X/yjpvzFu6qUKWtfqInpb/4iLXmTmdoyFWXbI/1
 K0zHhspsuPa14FKBSAozDQj25cdVpsm8QAnu76yQ=
Received: by mx.zohomail.com with SMTPS id 1758804191518870.7044586273115;
 Thu, 25 Sep 2025 05:43:11 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH i-g-t v2 2/3] panthor: add initial infrastructure
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250916121240.3e7eideofkifj2hd@kamilkon-DESK.igk.intel.com>
Date: Thu, 25 Sep 2025 14:42:44 +0200
Cc: adrinael@adrinael.net, arek@hiler.eu, juhapekka.heikkila@gmail.com,
 bhanuprakash.modem@gmail.com, ashutosh.dixit@intel.com,
 karthik.b.s@intel.com, boris.brezillon@collabora.com, liviu.dudau@arm.com,
 steven.price@arm.com, aliceryhl@google.com, jeffv@google.com,
 intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <A6EF2C90-617D-4EE3-83E1-5D6CE3857F66@collabora.com>
References: <20250912181931.3738444-1-daniel.almeida@collabora.com>
 <20250912181931.3738444-3-daniel.almeida@collabora.com>
 <20250916121240.3e7eideofkifj2hd@kamilkon-DESK.igk.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External
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

Hi Kamil,

> On 16 Sep 2025, at 14:12, Kamil Konieczny =
<kamil.konieczny@linux.intel.com> wrote:
>=20
> Hi Daniel,
> On 2025-09-12 at 15:19:29 -0300, Daniel Almeida wrote:
>> Add the necessary code needed to compile panthor tests as well as the
>> basic infrastructure that will be used by the Panthor tests =
themselves.
>>=20
>> To make sure everything is in order, add a basic test in
>> panthor_query.c.
>>=20
>> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
>> ---
>> lib/igt_panthor.c             | 41 =
+++++++++++++++++++++++++++++++++++
>> lib/igt_panthor.h             | 12 ++++++++++
>> lib/meson.build               |  1 +
>> meson.build                   |  8 +++++++
>> tests/meson.build             |  2 ++
>> tests/panthor/meson.build     | 12 ++++++++++
>> tests/panthor/panthor_query.c | 25 +++++++++++++++++++++
>> 7 files changed, 101 insertions(+)
>> create mode 100644 lib/igt_panthor.c
>> create mode 100644 lib/igt_panthor.h
>> create mode 100644 tests/panthor/meson.build
>> create mode 100644 tests/panthor/panthor_query.c
>>=20
>> diff --git a/lib/igt_panthor.c b/lib/igt_panthor.c
>> new file mode 100644
>> index 000000000..0b690f796
>> --- /dev/null
>> +++ b/lib/igt_panthor.c
>> @@ -0,0 +1,41 @@
>> +// SPDX-License-Identifier: MIT
>> +// SPDX-FileCopyrightText: Copyright (C) 2025 Collabora Ltd.
>=20
> We use SPD for licence because they are long texts. I do not
> see any benefit of SPDX for copyright lines, it makes it even
> longer than needed. It could stay if you want.
>=20
> Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>=20
> Regards,
> Kamil
>=20

I=E2=80=99d rather keep it. I tend to favor standardization and having a =
standard
way to declare copyrights seems beneficial to me. What are the next =
steps here?
Should I send a new version to pickup the tags, or can this be merged =
already?

Same for the other patch.

=E2=80=94 Daniel


