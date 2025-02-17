Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3D2A38DE6
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 22:16:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55E8A10E5F3;
	Mon, 17 Feb 2025 21:16:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="b63tJELx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0435610E5EF;
 Mon, 17 Feb 2025 21:16:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1739826970; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=n+g1bwWIXu6miuS2Snh2p1+tt4RZgLVRF6TVYJMr6xL2UuUHi3ZW8VPa83VfOv6sqGGFYJixAEfCrDkQuDMa+abuOvedhUdYfTAvhfmy1NqqplCJWojxx52WpUt5D3myH3YO5Sj8JJeH/+YlnNQ+svdPWWSEeb40UBcn5/3vwls=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1739826970;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=O/E2WxtauAk3hnXmc5LI3NlTagCxG+Frl9gBYiR41+M=; 
 b=ite9rSoKCXhwk+grRlXFIZa7+vzQbziK77LPHJNJtOTRzx1Q3KMW/JGSvrRdL47f5PkX6nmCMatwsxwE8DI6fDCun8ol7saHozi2JxkTmbKiZR3sejNKQguUjXlMlxh3K2WjwDrOKsbC0P56crCRLfNBxokZTzkWimR+TDlKQgU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739826970; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=O/E2WxtauAk3hnXmc5LI3NlTagCxG+Frl9gBYiR41+M=;
 b=b63tJELxGr16ymwxsAnbWgJ+C9Gq3iDyJVAbhXMlfFSwmxZES3ffP+H2YnY+Q1MG
 nVZN2Yum2nQdeJ1h6Ev/2xeCvzUX3gnZ7DE36yGFJnggaW91mwMjQu5vXPtv9YTJhDK
 UZJUJCL/YIUdYQ5wCm8zCgqSaOPNcSDbrkQldCyE=
Received: by mx.zohomail.com with SMTPS id 17398269681741006.1408373826317;
 Mon, 17 Feb 2025 13:16:08 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [PATCH RFC 2/3] rust: make ETIMEDOUT error available
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250217-nova_timer-v1-2-78c5ace2d987@nvidia.com>
Date: Mon, 17 Feb 2025 18:15:52 -0300
Cc: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <C46A2AAC-1FD4-45F1-9F37-CA95F261A6F2@collabora.com>
References: <20250217-nova_timer-v1-0-78c5ace2d987@nvidia.com>
 <20250217-nova_timer-v1-2-78c5ace2d987@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: Apple Mail (2.3826.300.87.4.3)
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

Hi Alex,

> On 17 Feb 2025, at 11:04, Alexandre Courbot <acourbot@nvidia.com> =
wrote:
>=20
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> rust/kernel/error.rs | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
> index =
f6ecf09cb65f4ebe9b88da68b3830ae79aa4f182..8858eb13b3df674b54572d2a371b8ec1=
303492dd 100644
> --- a/rust/kernel/error.rs
> +++ b/rust/kernel/error.rs
> @@ -64,6 +64,7 @@ macro_rules! declare_err {
>     declare_err!(EPIPE, "Broken pipe.");
>     declare_err!(EDOM, "Math argument out of domain of func.");
>     declare_err!(ERANGE, "Math result not representable.");
> +    declare_err!(ETIMEDOUT, "Connection timed out.");
>     declare_err!(ERESTARTSYS, "Restart the system call.");
>     declare_err!(ERESTARTNOINTR, "System call was interrupted by a =
signal and will be restarted.");
>     declare_err!(ERESTARTNOHAND, "Restart if no handler.");
>=20
> --=20
> 2.48.1
>=20
>=20

FYI this is a conflict with =
https://lore.kernel.org/rust-for-linux/20250207132623.168854-8-fujita.tomo=
nori@gmail.com/=
