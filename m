Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E45A87B1E
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 10:55:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE0F310E4EE;
	Mon, 14 Apr 2025 08:55:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="hqcNHLve";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-10626.protonmail.ch (mail-10626.protonmail.ch
 [79.135.106.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80EA410E4EE
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 08:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1744620928; x=1744880128;
 bh=x7ULRXHmIP/iOqGFm4n8UqvHtXXfaohwb4iYmOuOuTo=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=hqcNHLveTykBJrIXATWngY9RuOzF94QPErQtsHjn1yKlpYjpRqKxRl8M6MxSsChmT
 TQ4ZoFmJkb15H3oD8Adh9AC+lqidhNnkkgB3lYAQtldP5vivOjOgwi/uMWnFGq6Hhq
 Uaxt5NX+OykRo5F7RJPklGC8svm/UqNqz/tby12/lxVbV2otns149TfUiQtWCz0BDq
 /ajnlbzVAf38+6vqyO6pmk46AH/1qg7nkkyZod1pB8iJInl2fecL2ad9K+nL9wEvQv
 A0z6yGqFmvGyLDCJwg76Sdt8gQ0wN155qlh0B6iqoDkZL96cC2Wvqj1MN6IjD0Hy05
 PznvChNjI598g==
Date: Mon, 14 Apr 2025 08:55:22 +0000
To: Pekka Paalanen <pekka.paalanen@collabora.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 4/4] drm/doc: document front-buffer rendering
Message-ID: <1HmtIlIg5Zknspd_PXMq-KxGZBVJxTjCnr6MZvXBmUknLe8sPTH6hlLpKpgy2Ow1W27DV37YuLd_iUAYaDCoZPWYKCtoBpz5C2K8DhrGJ0w=@emersion.fr>
In-Reply-To: <20230713112327.560f89e4.pekka.paalanen@collabora.com>
References: <20230712135723.173506-1-contact@emersion.fr>
 <20230712135723.173506-4-contact@emersion.fr>
 <20230713112327.560f89e4.pekka.paalanen@collabora.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 7fde0865cd6661bc8fa3d757c039b6df471e96fa
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, July 13th, 2023 at 10:23, Pekka Paalanen <pekka.paalanen@colla=
bora.com> wrote:

> > + * To perform front-buffer rendering, user-space should set FB_ID to t=
he
> > + * previous framebuffer in atomic commits.
> > * CRTC_ID:
> > * Mode object ID of the &drm_crtc this plane should be connected to.
> > *
>=20
> It's unclear to me what "previous framebuffer" means, although I know
> what you want to say. How about:
>=20
> When a KMS client is front-buffer rendering, it should set FB_ID to
> the same front-buffer FB on each atomic commit. This implies to the
> driver that it needs to re-read the same FB again. Otherwise drivers
> who do not employ continuously repeated scanout cycles might not update
> the screen.

Thanks for the suggestion! Looks good to me, will send in v2.

> Btw. is it enough to set only FB_DAMAGE_CLIPS and not touch FB_ID?

Hm, I must admit I have no idea.
