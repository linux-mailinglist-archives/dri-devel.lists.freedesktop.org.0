Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCC492EF04
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 20:40:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF83E10EB5D;
	Thu, 11 Jul 2024 18:40:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="HStdeAhM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1A7B10EB5D
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 18:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1720723244;
 bh=KkzxAaKkddVCCUjlNWAR/t6qE/P/eWm3PK1qOOz6Auc=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To:From;
 b=HStdeAhM+QYvH0XVo2lmWa8287cpmSi22DF/AMI/nT6TxDH1ClZDY3MpkNspXQ5gg
 tv1J/hv+drorhLdlfcPcaNILK0ahxNoi/z7vyxdAjd0T7DJ0Vbtf5nuw6rOUNm/tQE
 pOUuMCYXex3u1nZKhitvr1/JmfvdL3BmWR6HrSqBlVI8c5Xs8FgopVpTuyl6T1orvQ
 1X6wc+MMczmy5D28oXsN2ah2QpUszHRkR5cpWVKjYRNX/HdM6w4i2x200TaFsd+g8c
 Im5gmt5tJiuyPzqk2poTT6VN1DJy8sX/lBiHXX8QeiA9c3dHuvKMZduilpzlxg+NTN
 KxjQ68PkaYE4w==
Received: from smtpclient.apple (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: dwlsalmeida)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 382B837821DB;
 Thu, 11 Jul 2024 18:40:38 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [RFC PATCH] drm: panthor: add dev_coredumpv support
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <ZpAO6SJ9pZ2EOlrv@e110455-lin.cambridge.arm.com>
Date: Thu, 11 Jul 2024 15:40:26 -0300
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>, ojeda@kernel.org,
 Danilo Krummrich <dakr@redhat.com>, lyude@redhat.com, robh@kernel.org,
 lina@asahilina.net, mcanal@igalia.com, airlied@gmail.com,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, steven.price@arm.com, liviu.dudau@arm.com,
 mripard@kernel.org, tzimmermann@suse.de, daniel@ffwll.c
Content-Transfer-Encoding: quoted-printable
Message-Id: <0C74C2BA-753D-4D1E-A041-A55422947005@collabora.com>
References: <20240710225011.275153-1-daniel.almeida@collabora.com>
 <ZpAO6SJ9pZ2EOlrv@e110455-lin.cambridge.arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>
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

Hi Liviu,

> Hi Daniel,
>=20
> I know this is an RFC, but are you trying to avoid Cc-ing Panthor =
maintainers
> by mistake or by choice? I will be away on sabbatical from next week, =
but
> Steven Price at least would be interested in having a look.

Definitely by mistake. Boris is my coworker, but everybody else should =
have been on cc for sure.

My apologies.

=E2=80=94 Daniel



