Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A965B121CA
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 18:18:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37BDC10E9EE;
	Fri, 25 Jul 2025 16:18:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Mxm8gs1O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33F4410E9EE;
 Fri, 25 Jul 2025 16:18:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1753460320; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=E3HnPgc2eBYNDuIYlicEbg96DDSkVOp4CXTYWfixNOV/okz4+kHMrDNCSPDa6U75Kp2gq1/2hWgR1n2nHaM3xqayabBd/QBuggSA1SQoJUnQmZ3pPfJIsN1nU72Psz8eh4hCd3mWrPQtHdFdx83xuKOIYHGtHIZUquDnyPZddcw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1753460320;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=hNWsklfhKoy2efLRs+iJB61xdGvPIUy/D6YVu5hHEgw=; 
 b=ZxWp78LS+hhH/aZAUEg7/xZV2zD1x03RIS0QNuEUSdRJ/WLNKn4caRXaVM7uHX5BjYQR5xzAcH27DKv3qs5p9TSPYt/XOVP4jEmzvLIKZDmIk+QTqyAqM18m111KEriyOJ/YFJRH+zRKFb4zVJ/aU1l5UteCcmdaWl/sQGlVK4g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753460320; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=hNWsklfhKoy2efLRs+iJB61xdGvPIUy/D6YVu5hHEgw=;
 b=Mxm8gs1Ocl4n8oCJ5x+rZKxCG+K8/Zm+D5ZE3ENQouX7WmiEdg5mE2oQazN5+ALr
 YOXVTgMMSjiOwB32+yAvo0u5Z972iHRASY7phQQ+IyBk4ETLoQgf73tkfVgTxLeD60d
 8uwnNbI9mVqsWudzz7ChHDDjnISVQLJvI5yqE1BY=
Received: by mx.zohomail.com with SMTPS id 1753460317999359.60159706229695;
 Fri, 25 Jul 2025 09:18:37 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v2 02/19] gpu: nova-core: register: fix typo
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250718-nova-regs-v2-2-7b6a762aa1cd@nvidia.com>
Date: Fri, 25 Jul 2025 13:18:24 -0300
Cc: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Beata Michalska <beata.michalska@arm.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <6641734C-5331-44BF-B2B3-93CBC2F0E3D6@collabora.com>
References: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
 <20250718-nova-regs-v2-2-7b6a762aa1cd@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
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



> On 18 Jul 2025, at 04:26, Alexandre Courbot <acourbot@nvidia.com> =
wrote:
>=20
> A space was missing between arguments in this invocation.
>=20
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> drivers/gpu/nova-core/regs/macros.rs | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/nova-core/regs/macros.rs =
b/drivers/gpu/nova-core/regs/macros.rs
> index =
864d1e83bed2979f5661e038f4c9fd87d33f69a7..93e9055d5ebd5f78ea534aafd44d884d=
a0fce345 100644
> --- a/drivers/gpu/nova-core/regs/macros.rs
> +++ b/drivers/gpu/nova-core/regs/macros.rs
> @@ -116,7 +116,7 @@ macro_rules! register {
>     ) =3D> {
>         register!(@common $name @ $offset $(, $comment)?);
>         register!(@field_accessors $name { $($fields)* });
> -        register!(@io$name @ + $offset);
> +        register!(@io $name @ + $offset);
>     };
>=20
>     // Creates a alias register of relative offset register `alias` =
with its own fields.
>=20
> --=20
> 2.50.1
>=20
>=20


Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>=
