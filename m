Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E75D8A2E808
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 10:41:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E59E10E4D8;
	Mon, 10 Feb 2025 09:41:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="L9CyqPwW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D631A10E4E0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 09:41:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1739180505; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=IfHW7GFSUcnRcnjhWuX8VdC/+6QgIk+O1MALlIIYMzbmQmTTaHpbRbOF4a3uLTIWaSDn0bo5yx16kIGK6v+kxxH7TimnRnReKsIHQLb09GDMSbVlcS6j/+XM/ngIALNhB677N7kyyJrBRZOCXCdMOlnDE+aQNf4zGGMwk1FwxkQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1739180505;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=qBBDYZU7g9PDMRClvZSe7s7VQGUjY5ZJRuGo2wh0uUg=; 
 b=hGmBetWBHuk0+d1qX8x9ZCDJHRR4U2wRa36efra3TA/6ApvbzB2ty81ni8vbebPgi+Jk9i9P4RTzNZNVuB0/rJJvbCBnnbyJJJRYQPMRiXZhRusr/AEVEGo66Nd6L5Zb1DaYi/KgXCYp1zZ5OEryWyqjVZNyfLm7oA5KBQmaws0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739180505; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=qBBDYZU7g9PDMRClvZSe7s7VQGUjY5ZJRuGo2wh0uUg=;
 b=L9CyqPwWuH/dRvDgQQmY5y3YYDn7FxyFX/jzjg/z7d3yuEBumKn/t1WqKqQyri+c
 +PKIIuEa4oQmxS5Opo7gjRFALhFYegk5thuHdNREW5LMnNSfMjvI9hNZfKWniaXgBYZ
 zCQXaKwHUo1a6xlQZOWgV0gXL2nxfl9GPXvi/lADVaJ1pMszP624B+bbfNYtFMIETOL
 xX+qAcYAGTQODu7leHTMo8H/sj7wXmdoeEwol/DL8P3CGG/cCPw2PEObYKaVHhT43rC
 vVC/ZHTZ/GD7xol4ldQDAF4Ie+tYycuSsmdp90iSLOjDNgHIwOEqnLao29s8OkvuwkN
 VctmgfoeqA==
Received: by mx.zohomail.com with SMTPS id 1739180501879330.0271224021237;
 Mon, 10 Feb 2025 01:41:41 -0800 (PST)
Message-ID: <07c447b77bdac1f8ade1f93456f853f89d4842ee.camel@icenowy.me>
Subject: Re: On community influencing (was Re: [PATCH v8 2/2] rust: add dma
 coherent allocator abstraction.)
From: Icenowy Zheng <uwu@icenowy.me>
To: Hector Martin <marcan@marcan.st>, Steven Rostedt <rostedt@goodmis.org>, 
 "Dr. Greg" <greg@enjellic.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Dave Airlie
 <airlied@gmail.com>, Jason Gunthorpe <jgg@nvidia.com>, Greg KH
 <gregkh@linuxfoundation.org>, phasta@kernel.org, Christoph Hellwig
 <hch@lst.de>,  Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda
 <miguel.ojeda.sandonis@gmail.com>, Abdiel Janulgue
 <abdiel.janulgue@gmail.com>, daniel.almeida@collabora.com,
 aliceryhl@google.com,  robin.murphy@arm.com,
 rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, Alex
 Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, Bj??rn Roy Baron <bjorn3_gh@protonmail.com>, Benno
 Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Valentin Obst <kernel@valentinobst.de>,
 open list <linux-kernel@vger.kernel.org>, Marek Szyprowski
 <m.szyprowski@samsung.com>, airlied@redhat.com, "open list:DMA MAPPING
 HELPERS" <iommu@lists.linux.dev>, DRI Development
 <dri-devel@lists.freedesktop.org>
Date: Mon, 10 Feb 2025 17:41:30 +0800
In-Reply-To: <1e8452ab-613a-4c85-adc0-0c4a293dbf50@marcan.st>
References: <2025013030-gummy-cosmic-7927@gregkh>
 <20250130172437.GN5556@nvidia.com>
 <2025013148-reversal-pessimism-1515@gregkh>
 <20250131135421.GO5556@nvidia.com>
 <2b9b75d1-eb8e-494a-b05f-59f75c92e6ae@marcan.st>
 <Z6OzgBYZNJPr_ZD1@phenom.ffwll.local>
 <CAPM=9tzPR9wd=3Wbjnp-T0W8-dDfGah-H3Ny52G85B+2Ev9ksA@mail.gmail.com>
 <208e1fc3-cfc3-4a26-98c3-a48ab35bb9db@marcan.st>
 <CAHk-=wi=ZmP2=TmHsFSUGq8vUZAOWWSK1vrJarMaOhReDRQRYQ@mail.gmail.com>
 <20250207121638.GA7356@wind.enjellic.com>
 <Z6bdCrgGEq8Txd-s@home.goodmis.org>
 <1e8452ab-613a-4c85-adc0-0c4a293dbf50@marcan.st>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-ZohoMail-Owner: <07c447b77bdac1f8ade1f93456f853f89d4842ee.camel@icenowy.me>+zmo_0_
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

=E5=9C=A8 2025-02-08=E6=98=9F=E6=9C=9F=E5=85=AD=E7=9A=84 17:31 +0900=EF=BC=
=8CHector Martin=E5=86=99=E9=81=93=EF=BC=9A
>=20
> By kernel and mesa policy, while a drm/ kernel driver is not merged
> with
> a stable UAPI, the mesa side cannot be merged/enabled either. That
> means
> that every day the driver isn't upstream, our users suffer due to
> various container technologies not shipping the driver in userspace
> since they ship upstream mesa.
>=20
> The process is *designed* to encourage upstreaming early and *punish*
> downstream trees.

Well, at least some Mesa drivers are developed against some "vendor"
(even not community downstream) kernel drivers, e.g. powervr one;
although in the Asahi case there's no such vendor thing (because the HW
vendor is Darwin-only). In addition, I think at least some early
etnaviv development is based on drm/etnaviv drivers w/ in-kernel
version code earlier than the first in-kernel-tree version code (Well
drm version code rarely changes, but I think in the case of etnaviv it
really represents the UAPI).

Furtherly, the monorepo nature of Linux kernel means to refactor an
interface, it's usually the person changing the callee that need to
change all callers to satify the interface change; having Rust code in
tree calling the interface effectively means adding the responsibility
of fixing the Rust code when the interface changes, which could be not
acceptable by the C-only maintainers. In regards of adding a
maintainer, having more maintainers means more communication. The
situation of the current problem really shows how difficult
communication is, right?
