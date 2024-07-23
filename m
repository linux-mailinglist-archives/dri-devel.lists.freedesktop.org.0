Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB4393A4E5
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 19:23:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0673F10E615;
	Tue, 23 Jul 2024 17:23:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="gg3XkoBI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 973CE10E615
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 17:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1721755427;
 bh=JyVcTgHb3Y8+SNEOpKEbDo+aRs4mxVVq1rDwQWET29k=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To:From;
 b=gg3XkoBIURmtWSBVdaSXHRPO2aAxC5pm8JV/yuT/N75aqgai2iBtYlLf2J5q5Byv3
 04hHju8+G/ZDLrDWCxDhprO0pSHIoKEUV1ScbOm4CovarEPBsgpLwOjiHc0MkdhVVt
 ZdGz1P/HYmUJOBqT2JmKhtfsD5iUCjjJGosioW7tYGYT6XwiyPIDNjSMN/fESR3xvA
 PUYnggrQZOrrhpAApAVMmkDanNgjCJuLt5RlbWNY5bFRwcih2U/qUjBcOoe9J2lrEN
 OjNPy5/9vxvhVRmUV2Vd+APg1iWzr1sFhk/xtYNEcRC7vk73ib4jirNTQv9tpOLVHO
 it+BcFvdlzgOQ==
Received: from smtpclient.apple (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: dwlsalmeida)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 19E4D37813AE;
 Tue, 23 Jul 2024 17:23:42 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [RFC PATCH] drm: panthor: add dev_coredumpv support
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20240723180642.73502856@collabora.com>
Date: Tue, 23 Jul 2024 14:23:29 -0300
Cc: Steven Price <steven.price@arm.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Danilo Krummrich <dakr@redhat.com>, Lyude Paul <lyude@redhat.com>,
 robh@kernel.org, Asahi Lina <lina@asahilina.net>,
 =?utf-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 David Airlie <airlied@gmail.com>, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <AC03F2C1-4483-43BC-8E92-D3F26CDFC8A8@collabora.com>
References: <20240710225011.275153-1-daniel.almeida@collabora.com>
 <fe84a028-01a8-4987-b1b7-141fb76d263c@arm.com>
 <4344B22F-D859-4C64-A351-69FFB5208362@collabora.com>
 <edda856e-3102-495a-8cc6-b79f5f114833@arm.com>
 <20240723180642.73502856@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
X-Mailer: Apple Mail (2.3774.600.62)
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

The script (and the panthor_regs.rs file it generates) is at

=
https://gitlab.collabora.com/dwlsalmeida/for-upstream/-/commit/783be55acf8=
d3352901798efb0118cce43e7f60b

As you can see, it=E2=80=99s all regexes. It works, but I agree
that it=E2=80=99s simpler to generate something more idiomatic by hand.

=E2=80=94 Daniel=
