Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1C575099A
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 15:30:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A45610E52D;
	Wed, 12 Jul 2023 13:30:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B520410E529;
 Wed, 12 Jul 2023 13:30:13 +0000 (UTC)
Date: Wed, 12 Jul 2023 13:29:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1689168610; x=1689427810;
 bh=IMV+oy2qN0Q8CoNfZ6wVwUYQLPGCoo5SMxI5O2mWNcg=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=OlMprFkR9CGrijBxrGoyIxkXHojOYVmGOcz9BiOVoHtIvWWpMtszlTCALSEaotTi6
 z51ashPlpLXFhPKFiHu48u7zimkth5an5gQzmLL+NttG2zwfhBQV5Nk1TpfGhjy3SB
 EgfGbP2ldC5ffdLB6pn1hA6f8Cu6PixAX7/A4CRQgpHDqLTRgFuXlgQNilHSo7Fjmk
 CbIy3XZb2lpTfAUpEB8jQIOeA40vpQRhZpV7xUEhfRuN8wCcIFimyhim9oagOKkV6N
 hJLyh1y/+8Bh7S4rux8kYyQQrWccZJpfAoMjbvFMHXNILBJK1EjTjcQ2AvYESQKXBw
 1+Rw5Pv+WJFcA==
To: =?utf-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v5 6/6] drm/doc: Define KMS atomic state set
Message-ID: <c5ojpE6h8oU8ewp3vGknvW6QW88KRiDjpHzvQZNmAUiu9aBmaDAsiE5MF_4BaTm3sk6Ys1jOEYyMvfoHa1s3wJVQDwic5aeFoYXbgeU6F4Q=@emersion.fr>
In-Reply-To: <20230707224059.305474-7-andrealmeid@igalia.com>
References: <20230707224059.305474-1-andrealmeid@igalia.com>
 <20230707224059.305474-7-andrealmeid@igalia.com>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: pierre-eric.pelloux-prayer@amd.com, Pekka Paalanen <ppaalanen@gmail.com>,
 =?utf-8?Q?=27Marek_Ol=C5=A1=C3=A1k=27?= <maraeo@gmail.com>,
 =?utf-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>, hwentlan@amd.com,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, Pekka Paalanen <pekka.paalanen@collabora.com>,
 christian.koenig@amd.com, joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Saturday, July 8th, 2023 at 00:40, Andr=C3=A9 Almeida <andrealmeid@igali=
a.com> wrote:

> +KMS atomic state
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +An atomic commit can change multiple KMS properties in an atomic fashion=
,
> +without ever applying intermediate or partial state changes.  Either the=
 whole
> +commit succeeds or fails, and it will never be applied partially. This i=
s the
> +fundamental improvement of the atomic API over the older non-atomic API =
which is
> +referred to as the "legacy API".  Applying intermediate state could unex=
pectedly
> +fail, cause visible glitches, or delay reaching the final state.
> +
> +An atomic commit can be flagged with DRM_MODE_ATOMIC_TEST_ONLY, which me=
ans the

Can we linkify these #defines? This can be done like so:

    =E2=80=A6 flagged with :c:macro:`DRM_MODE_ATOMIC_TEST_ONLY`, which mean=
s =E2=80=A6

This should create a link to the docs for this flag.
