Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC31AEC2A4
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jun 2025 00:37:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7824410E0BE;
	Fri, 27 Jun 2025 22:37:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="bvhI3mYA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF58B10E0BE
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 22:37:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1751063812; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=S1wHygDdS5FUBREk+qu3hMBF5+DmylQmSxA5WQRFGdskeuYRWbt9B+GzWtOjdiPYKHUk9RVRWQ4YkF65xNO00z2tY4gdSGa4L0MfsI1iU0PqDyF0uTjrMDrOOjQRL4i5CuMPqU38z8kWwCRA2biLwG3GfpJUyMywBfQvYp/r1nk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1751063812;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=gK3BJJwtSH+KH5T+UiyABgIKLAnwcEEGHQbA1+yVIrI=; 
 b=FOluvlbIoF4xZu+e7W/0SJEHVyJVO1njy2gsnijUupMV4wBUcYWq5/iVT0tdcfUnhxyAJiJWUXp13jswVtAW1ii2HJCiCVnwYkhyaKGNjvNUPuqQzFzcufsoZVlq9wXlRIkNbQrhieLhQsCGrOBUHbhuK8Hfp04gB2wgnuMeCKI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751063811; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=gK3BJJwtSH+KH5T+UiyABgIKLAnwcEEGHQbA1+yVIrI=;
 b=bvhI3mYAzd500MoClJ4rlZjlDa/9fjTNtW/UZ9zpawQkVCljPIpo/f7ZuYn/62Y5
 r/MgFfT+M9llVyRJ2asX+IuLSaOAqZATLnwvlUaqar5jChE9Xl0fXhk+JmSu1j2IE4+
 S3wV3/2aUjXw0ElqBTPrYzlb0P+If9beZM6ZTfs8=
Received: by mx.zohomail.com with SMTPS id 1751063810885656.1657901201971;
 Fri, 27 Jun 2025 15:36:50 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH] Introduce Tyr
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250627-tyr-v1-1-cb5f4c6ced46@collabora.com>
Date: Fri, 27 Jun 2025 19:36:33 -0300
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, kernel@collabora.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <81B29EDF-B6FB-458E-BADC-F3708A9434BB@collabora.com>
References: <20250627-tyr-v1-1-cb5f4c6ced46@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Daniel Stone <daniels@collabora.com>,
 Rob Herring <robh@kernel.org>, Alice Ryhl <alice.ryhl@google.com>,
 Beata Michalska <beata.michalska@arm.com>,
 Carsten Haitzler <carsten.haitzler@foss.arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Ashley Smith <ashley.smith@collabora.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
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

I=E2=80=99ll fix the missing =E2=80=9Crust: drm:=E2=80=9D tags on a v2.

=E2=80=94 Daniel=
