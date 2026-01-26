Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPeWAf3Td2mFlwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 21:52:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7B08D4FF
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 21:52:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45F9310E494;
	Mon, 26 Jan 2026 20:52:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Y8EIJNOQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F112810E16A;
 Mon, 26 Jan 2026 20:52:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1769460724; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=aOWNmqHI0cSjGLHm+y4IvVLF/4YJLWB0zo4lhon7+FpCMYil/lFbTCKiQ+fuzR76evoPHzATFQXQk3Ux6LlttaL8Wy6TLgfyqvb2nO2xTepqGjgAIuaHFhjLMiaOsmMPNDZvQ1one6KK/f5csZ3VuLri5lAjttCQTtNDn0i9D0s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1769460724;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=rEHkKpBcmkOspe2hK05VCnHAt4UqLafts8UPtI4RO7A=; 
 b=Id+rb4XoeYpfNBzlQfMBB7nKN1xBTtUmXyBaX3EtkdzjJDAxatIjBGgipsldscZwtpGT5WlEti2IYy1N9ZjYM5M4toqQDyIjUF0pdDkNWj3VpN+Kwz/RKxF7TCE2gbpH5g/8UzqU91deNakSSvKYs1Opfb09goQ+rRXdlRKPyz8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769460724; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=rEHkKpBcmkOspe2hK05VCnHAt4UqLafts8UPtI4RO7A=;
 b=Y8EIJNOQIwYw0TiQ0WIJKtdg3ymohxI+YzA8n891zeE2pUX5jhjvsAVWJDralPHO
 NyuHibCeI5Yw0/FXbtwAxylTxJWkemin4uUOIXuak4HYJw1GSnLmbcuvsmzhvQbr8Rs
 zJSZ2CM5gOSXwUufqXv1st7TYWF2Q43wPDBCfYJo=
Received: by mx.zohomail.com with SMTPS id 176946072310858.48046846843215;
 Mon, 26 Jan 2026 12:52:03 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v4 0/3] Introduce DeviceContext
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260123231230.248500-1-lyude@redhat.com>
Date: Mon, 26 Jan 2026 21:51:46 +0100
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 nouveau@lists.freedesktop.org, Miguel Ojeda <ojeda@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Alice Ryhl <aliceryhl@google.com>,
 Shankari Anand <shankari.ak0208@gmail.com>,
 David Airlie <airlied@gmail.com>, Benno Lossin <lossin@kernel.org>,
 Asahi Lina <lina+kernel@asahilina.net>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E1EA1F0E-0A78-4F6A-B67F-03E5CB8F0135@collabora.com>
References: <20260123231230.248500-1-lyude@redhat.com>
To: Lyude Paul <lyude@redhat.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,kernel.org,ffwll.ch,google.com,gmail.com,asahilina.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.almeida@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel,kernel];
	APPLE_MAILER_COMMON(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:mid,collabora.com:dkim]
X-Rspamd-Queue-Id: 4E7B08D4FF
X-Rspamd-Action: no action

Hi Lyude,

> On 24 Jan 2026, at 00:10, Lyude Paul <lyude@redhat.com> wrote:
>=20
> Previous version of this patch series:
>  https://patchwork.freedesktop.org/series/160217/#rev2
>=20
> One of the unsolved issues we still have with the rust DRM bindings is
> the ability to limit certain Device operations to contexts where we =
can
> guarantee that a Device has been fully initialized and registered with
> userspace, or vice-versa (e.g. must be unregistered).
>=20
> While the previous solution for this that I had was simply not =
exposing
> drm::Device at all until the device has been registered with =
userspace,
> unfortunately this isn't enough since:
>=20
> * As we found out with Tyr, drivers occasionally need to be able to
>  create GEM objects before device registration
> * We would still need to be able to handle KMS callbacks which could =
be
>  invoked after KMS init but before userspace registration (not handled
>  in this series specifically, but DeviceContext will be required for
>  handling this).
>=20
> This patch series provides a pretty nice solution to this, by
> implementing a very similar solution to kernel::device::DeviceContext:
> introducing our own DeviceContext type state.
>=20
> This patch series depends on the two pre-requisite patch series:
>=20
> * https://patchwork.freedesktop.org/series/160523/
>=20
>                          Series-wide changes
>=20
> V2:
> * s/DeviceCtx/DeviceContext/ for consistency
> * Move private driver-data availability to the Registration
>  DeviceContext
> * s/AnyCtx/Init/
>=20

Did you forget the changelog for v3 and v4?


> More changes described in each patch description.

Seems to be the case for the individual patches as well.

Anyways, I will do a second round of reviews here; please
wait a bit before potentially merging a new iteration.


=E2=80=94 Daniel=
