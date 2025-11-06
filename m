Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFDFC3A7BC
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 12:13:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F155810E8A2;
	Thu,  6 Nov 2025 11:13:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="X3NL/ffl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6A0910E899;
 Thu,  6 Nov 2025 11:13:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1762427615; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=adOuD/ALVCrL7wrmQE63YI+Z8moce5XJHZP71B/ipg+bONa6330uYvStzkTtc0wWefW7+NceyH+9P+3ZBiKKILypNuP65+IEjGIC3pXs5YJ76Th8jnHi+VZh8O2o9sxjIy0bFHI73eicJbcg8uCaU8mDJRClNFJXlr/JtKLhCm8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1762427615;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=IN3FkxPf/HVRB03kCeAWIKsVrYJYY3FKuwGDMNd46Ps=; 
 b=YF2mNkX2qS1OODcTyEfMuPHaTYFbvglMu3GmyHUV9OyqcZ7VP4yDoleKWGgMl11Y6Ow1F/bOzrvD69rllj3vsgRqQIZQsaH8fu4QzsEb51l/ehRbkYDg6ExHr+lAXUXPReNTjyDB7BfGpYTeKN4MJ9/32D1ZPnbOt8RUZzSfvu0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1762427615; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=IN3FkxPf/HVRB03kCeAWIKsVrYJYY3FKuwGDMNd46Ps=;
 b=X3NL/fflZQf/781C0cwHGOOQ+XqJRedVEuQB8yLT43K8IJzHuUaOY0DbQV1zuA5e
 5wy2vdEayfMP2v6d1nDjtEp8aBkJ7wmwz6TfpgHIIS/uqMABE2jriVr+qBby1p6sztp
 GDMvMFfKD1rPeVHmoGGHCqRHNSv7ZE0+QlbfENdk=
Received: by mx.zohomail.com with SMTPS id 1762427613049477.1183157802411;
 Thu, 6 Nov 2025 03:13:33 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH i-g-t v3 3/3] tests/panthor: add panthor tests
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20251104220412.24b4b454@fedora>
Date: Thu, 6 Nov 2025 08:13:14 -0300
Cc: adrinael@adrinael.net, arek@hiler.eu, kamil.konieczny@linux.intel.com,
 juhapekka.heikkila@gmail.com, bhanuprakash.modem@gmail.com,
 ashutosh.dixit@intel.com, karthik.b.s@intel.com, liviu.dudau@arm.com,
 steven.price@arm.com, aliceryhl@google.com, jeffv@google.com,
 intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <F3A3F344-2406-41E4-906E-481A4A56AC1A@collabora.com>
References: <20251104202845.2879460-1-daniel.almeida@collabora.com>
 <20251104202845.2879460-4-daniel.almeida@collabora.com>
 <20251104220412.24b4b454@fedora>
To: Boris Brezillon <boris.brezillon@collabora.com>
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

Kamil,=20

> On 4 Nov 2025, at 18:04, Boris Brezillon =
<boris.brezillon@collabora.com> wrote:
>=20
> On Tue,  4 Nov 2025 17:28:43 -0300
> Daniel Almeida <daniel.almeida@collabora.com> wrote:
>=20
>> +igt_main {
>> + int fd;
>> +
>> + igt_fixture {
>> + fd =3D drm_open_driver(DRIVER_PANTHOR);
>> + }
>> +
>> + igt_describe("Create and destroy a CSF group.");
>> + igt_subtest("group_create") {
>> + struct drm_panthor_vm_create vm_create =3D {};
>> + struct drm_panthor_vm_destroy vm_destroy =3D {};
>> + uint32_t group_handle;
>> +
>> + vm_create.flags =3D 0;
>> + do_ioctl(fd, DRM_IOCTL_PANTHOR_VM_CREATE, &vm_create);
>> + igt_assert_neq(vm_create.id, 0);
>> +
>> + group_handle =3D igt_panthor_group_create_simple(fd, vm_create.id, =
0);
>> + igt_assert_neq(group_handle, 0);
>> +
>> + igt_panthor_group_destroy(fd, group_handle, 0);
>> +
>> + vm_destroy =3D (struct drm_panthor_vm_destroy) { .id =3D =
vm_create.id };
>> + do_ioctl(fd, DRM_IOCTL_PANTHOR_VM_DESTROY, &vm_destroy);
>> + }
>> +
>> + igt_describe("Submit a job to a group and wait for completion. "
>> + "The job writes a known value to a buffer object that is then "
>> + "mmaped and checked.");
>=20
> nit: indentation is off ^
>=20
> igt_describe("Submit a job to a group and wait for completion. "
>     "The job writes a known value to a buffer object that is then "
>     "mmaped and checked.");

What should I do here?

Usually sending new versions so soon would be confusing. Given it's a =
trivial
fix, can you do it while applying? If not, should I wait a few days so =
that
this collects a few more tags?

=E2=80=94 Daniel

